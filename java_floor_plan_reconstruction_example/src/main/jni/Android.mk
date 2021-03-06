# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
PROJECT_ROOT_FROM_JNI := ../../../..
PROJECT_ROOT := $(LOCAL_PATH)/$(PROJECT_ROOT_FROM_JNI)

include $(CLEAR_VARS)
LOCAL_MODULE := libcpp_edge_detection
LOCAL_SHARED_LIBRARIES := tango_client_api tango_support tango_geometry_detection
LOCAL_CFLAGS := -std=c++11
LOCAL_C_INCLUDES := $(PROJECT_ROOT)/tango_gl/include \
                    $(PROJECT_ROOT)/third_party/glm
LOCAL_SRC_FILES := jni_interface.cc \
                   edge-detection.cc \
                   edge_detection_application.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/axis.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/bounding_box.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/camera.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/conversions.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/cube.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/drawable_object.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/line.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/mesh.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/shaders.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/transform.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/util.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango_gl/src/video_overlay.cc
LOCAL_LDLIBS := -lGLESv2 -llog -L$(SYSROOT)/usr/lib
include $(BUILD_SHARED_LIBRARY)

$(call import-add-path,$(PROJECT_ROOT))
$(call import-module,tango_client_api)
$(call import-module,tango_support)
$(call import-module, tango_geometry_detection)
