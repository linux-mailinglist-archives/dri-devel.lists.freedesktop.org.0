Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E12C6CA6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1F66F3F3;
	Fri, 27 Nov 2020 20:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC466F3A0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:41:46 +0000 (UTC)
IronPort-SDR: wI/Vc4zar1zGWT1LryCyjcTKhMXiGyC50Rb0jruBvRmdVgcq20/A6JBsK5zwa8Yzvaf+jCdCvF
 Y+7pdz/dcvzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172587558"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="172587558"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 12:41:45 -0800
IronPort-SDR: JzGUeL4bn6HjInuTpMp5lLdd8Dedx/xGDAcvYCQlS8LW0oHUOLHz9KoCuAwaJr2vutv0sbrBHR
 gQ96Ib1yEVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="537737689"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2020 12:41:45 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Date: Fri, 27 Nov 2020 12:55:41 -0800
Message-Id: <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a new sub-class of 'MR' that uses dma-buf object for the memory
region. Define a new class 'DmaBuf' as a wrapper for dma-buf allocation
mechanism implemented in C.

Add a method to buildlib for building modules with mixed Cython and C
source.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 buildlib/pyverbs_functions.cmake |  52 +++++++
 pyverbs/CMakeLists.txt           |   7 +
 pyverbs/dmabuf.pxd               |  15 ++
 pyverbs/dmabuf.pyx               |  72 ++++++++++
 pyverbs/dmabuf_alloc.c           | 296 +++++++++++++++++++++++++++++++++++++++
 pyverbs/dmabuf_alloc.h           |  19 +++
 pyverbs/libibverbs.pxd           |   2 +
 pyverbs/mr.pxd                   |   6 +
 pyverbs/mr.pyx                   | 103 +++++++++++++-
 9 files changed, 570 insertions(+), 2 deletions(-)
 create mode 100644 pyverbs/dmabuf.pxd
 create mode 100644 pyverbs/dmabuf.pyx
 create mode 100644 pyverbs/dmabuf_alloc.c
 create mode 100644 pyverbs/dmabuf_alloc.h

diff --git a/buildlib/pyverbs_functions.cmake b/buildlib/pyverbs_functions.cmake
index 953cec2..2f6788e 100644
--- a/buildlib/pyverbs_functions.cmake
+++ b/buildlib/pyverbs_functions.cmake
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2018, Mellanox Technologies. All rights reserved.  See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved.  See COPYING file
 
 function(rdma_cython_module PY_MODULE LINKER_FLAGS)
   foreach(PYX_FILE ${ARGN})
@@ -32,6 +33,57 @@ function(rdma_cython_module PY_MODULE LINKER_FLAGS)
   endforeach()
 endfunction()
 
+function(rdma_multifile_module PY_MODULE MODULE_NAME LINKER_FLAGS)
+  set(ALL_CFILES "")
+  foreach(SRC_FILE ${ARGN})
+    get_filename_component(FILENAME ${SRC_FILE} NAME_WE)
+    get_filename_component(DIR ${SRC_FILE} DIRECTORY)
+    get_filename_component(EXT ${SRC_FILE} EXT)
+    if (DIR)
+      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}")
+    else()
+      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
+    endif()
+    if (${EXT} STREQUAL ".pyx")
+      set(PYX "${SRC_PATH}/${FILENAME}.pyx")
+      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
+      include_directories(${PYTHON_INCLUDE_DIRS})
+      add_custom_command(
+        OUTPUT "${CFILE}"
+        MAIN_DEPENDENCY "${PYX}"
+        COMMAND ${CYTHON_EXECUTABLE} "${PYX}" -o "${CFILE}"
+        "-I${PYTHON_INCLUDE_DIRS}"
+        COMMENT "Cythonizing ${PYX}"
+      )
+      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
+    elseif(${EXT} STREQUAL ".c")
+      set(CFILE_ORIG "${SRC_PATH}/${FILENAME}.c")
+      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
+      if (NOT ${CFILE_ORIG} STREQUAL ${CFILE})
+        rdma_create_symlink("${CFILE_ORIG}" "${CFILE}")
+      endif()
+      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
+    elseif(${EXT} STREQUAL ".h")
+      set(HFILE_ORIG "${SRC_PATH}/${FILENAME}.h")
+      set(HFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.h")
+      if (NOT ${HFILE_ORIG} STREQUAL ${HFILE})
+        rdma_create_symlink("${HFILE_ORIG}" "${HFILE}")
+      endif()
+    else()
+      continue()
+    endif()
+  endforeach()
+  string(REGEX REPLACE "\\.so$" "" SONAME "${MODULE_NAME}${CMAKE_PYTHON_SO_SUFFIX}")
+  add_library(${SONAME} SHARED ${ALL_CFILES})
+  set_target_properties(${SONAME} PROPERTIES
+    COMPILE_FLAGS "${CMAKE_C_FLAGS} -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations ${NO_VAR_TRACKING_FLAGS}"
+    LIBRARY_OUTPUT_DIRECTORY "${BUILD_PYTHON}/${PY_MODULE}"
+    PREFIX "")
+  target_link_libraries(${SONAME} LINK_PRIVATE ${PYTHON_LIBRARIES} ibverbs rdmacm ${LINKER_FLAGS})
+  install(TARGETS ${SONAME}
+    DESTINATION ${CMAKE_INSTALL_PYTHON_ARCH_LIB}/${PY_MODULE})
+endfunction()
+
 function(rdma_python_module PY_MODULE)
   foreach(PY_FILE ${ARGN})
     get_filename_component(LINK "${CMAKE_CURRENT_SOURCE_DIR}/${PY_FILE}" ABSOLUTE)
diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt
index 9542c4b..1b21e7b 100644
--- a/pyverbs/CMakeLists.txt
+++ b/pyverbs/CMakeLists.txt
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
 
 rdma_cython_module(pyverbs ""
   addr.pyx
@@ -24,6 +25,12 @@ rdma_python_module(pyverbs
   utils.py
   )
 
+rdma_multifile_module(pyverbs dmabuf ""
+  dmabuf.pyx
+  dmabuf_alloc.c
+  dmabuf_alloc.h
+  )
+
 # mlx5 and efa providers are not built without coherent DMA, e.g. ARM32 build.
 if (HAVE_COHERENT_DMA)
 add_subdirectory(providers/mlx5)
diff --git a/pyverbs/dmabuf.pxd b/pyverbs/dmabuf.pxd
new file mode 100644
index 0000000..3ef5dfb
--- /dev/null
+++ b/pyverbs/dmabuf.pxd
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
+# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
+
+#cython: language_level=3
+
+cdef class DmaBuf:
+    cdef int dri_fd
+    cdef int handle
+    cdef int fd
+    cdef unsigned long size
+    cdef unsigned long map_offset
+    cdef void *dmabuf
+    cdef object dmabuf_mrs
+    cdef add_ref(self, obj)
+    cpdef close(self)
diff --git a/pyverbs/dmabuf.pyx b/pyverbs/dmabuf.pyx
new file mode 100644
index 0000000..23d8e2a
--- /dev/null
+++ b/pyverbs/dmabuf.pyx
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
+# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
+
+#cython: language_level=3
+
+import weakref
+
+from pyverbs.base cimport close_weakrefs
+from pyverbs.base import PyverbsRDMAErrno
+from pyverbs.mr cimport DmaBufMR
+
+cdef extern from "dmabuf_alloc.h":
+    cdef struct dmabuf:
+        pass
+    dmabuf *dmabuf_alloc(int unit, unsigned long size)
+    void dmabuf_free(dmabuf *dmabuf)
+    int dmabuf_get_dri_fd(dmabuf *dmabuf)
+    int dmabuf_get_fd(dmabuf *dmabuf)
+    unsigned long dmabuf_get_offset(dmabuf *dmabuf)
+
+
+cdef class DmaBuf:
+    def __init__(self, size, unit=0):
+        """
+        Allocate DmaBuf object from a GPU device. This is done through the
+        DRI device interface. Usually this requires the effective user id
+        being a member of the 'render' group.
+        :param size: The size (in number of bytes) of the buffer.
+        :param unit: The unit number of the GPU to allocate the buffer from.
+        :return: The newly created DmaBuf object on success.
+        """
+        self.dmabuf_mrs = weakref.WeakSet()
+        self.dmabuf = dmabuf_alloc(size, unit)
+        if self.dmabuf == NULL:
+            raise PyverbsRDMAErrno(f'Failed to allocate dmabuf of size {size} on unit {unit}')
+        self.dri_fd = dmabuf_get_dri_fd(<dmabuf *>self.dmabuf)
+        self.fd = dmabuf_get_fd(<dmabuf *>self.dmabuf)
+        self.map_offset = dmabuf_get_offset(<dmabuf *>self.dmabuf)
+
+    def __dealloc__(self):
+        self.close()
+
+    cpdef close(self):
+        if self.dmabuf == NULL:
+            return None
+        close_weakrefs([self.dmabuf_mrs])
+        dmabuf_free(<dmabuf *>self.dmabuf)
+        self.dmabuf = NULL
+
+    cdef add_ref(self, obj):
+        if isinstance(obj, DmaBufMR):
+            self.dmabuf_mrs.add(obj)
+
+    @property
+    def dri_fd(self):
+        return self.dri_fd
+
+    @property
+    def handle(self):
+        return self.handle
+
+    @property
+    def fd(self):
+        return self.fd
+
+    @property
+    def size(self):
+        return self.size
+
+    @property
+    def map_offset(self):
+        return self.map_offset
diff --git a/pyverbs/dmabuf_alloc.c b/pyverbs/dmabuf_alloc.c
new file mode 100644
index 0000000..b958a3e
--- /dev/null
+++ b/pyverbs/dmabuf_alloc.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright 2020 Intel Corporation. All rights reserved. See COPYING file
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <string.h>
+#include <errno.h>
+#include <drm/drm.h>
+#include <drm/i915_drm.h>
+#include <drm/amdgpu_drm.h>
+#include <drm/radeon_drm.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include "dmabuf_alloc.h"
+
+/*
+ * Abstraction of the buffer allocation mechanism using the DRI interface.
+ * The interface is accessed by ioctl() calls over the '/dev/dri/renderD*'
+ * device. Successful access usually requires the effective user id being
+ * in the 'render' group.
+ */
+
+struct dri {
+	int fd;
+	int (*alloc)(struct dri *dri, uint64_t size, uint32_t *handle);
+	int (*mmap_offset)(struct dri *dri, uint32_t handle, uint64_t *offset);
+};
+
+static int i915_alloc(struct dri *dri, uint64_t size, uint32_t *handle)
+{
+	struct drm_i915_gem_create gem_create = {0};
+	int err;
+
+	gem_create.size = size;
+	err = ioctl(dri->fd, DRM_IOCTL_I915_GEM_CREATE, &gem_create);
+	if (err)
+		return err;
+
+	*handle = gem_create.handle;
+	return 0;
+}
+
+static int amdgpu_alloc(struct dri *dri, size_t size, uint32_t *handle)
+{
+	union drm_amdgpu_gem_create gem_create = {{0}};
+	int err;
+
+	gem_create.in.bo_size = size;
+	gem_create.in.domains = AMDGPU_GEM_DOMAIN_VRAM;
+	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &gem_create);
+	if (err)
+		return err;
+
+	*handle = gem_create.out.handle;
+	return 0;
+}
+
+static int radeon_alloc(struct dri *dri, size_t size, uint32_t *handle)
+{
+	struct drm_radeon_gem_create gem_create = {0};
+	int err;
+
+	gem_create.size = size;
+	gem_create.initial_domain = RADEON_GEM_DOMAIN_VRAM;
+	err = ioctl(dri->fd, DRM_IOCTL_RADEON_GEM_CREATE, &gem_create);
+	if (err)
+		return err;
+
+	*handle = gem_create.handle;
+	return 0;
+}
+
+static int i915_mmap_offset(struct dri *dri, uint32_t handle, uint64_t *offset)
+{
+	struct drm_i915_gem_mmap_gtt gem_mmap = {0};
+	int err;
+
+	gem_mmap.handle = handle;
+	err = ioctl(dri->fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &gem_mmap);
+	if (err)
+		return err;
+
+	*offset = gem_mmap.offset;
+	return 0;
+}
+
+static int amdgpu_mmap_offset(struct dri *dri, uint32_t handle,
+			      uint64_t *offset)
+{
+	union drm_amdgpu_gem_mmap gem_mmap = {{0}};
+	int err;
+
+	gem_mmap.in.handle = handle;
+	err = ioctl(dri->fd, DRM_IOCTL_AMDGPU_GEM_MMAP, &gem_mmap);
+	if (err)
+		return err;
+
+	*offset = gem_mmap.out.addr_ptr;
+	return 0;
+}
+
+static int radeon_mmap_offset(struct dri *dri, uint32_t handle,
+			      uint64_t *offset)
+{
+	struct drm_radeon_gem_mmap gem_mmap = {0};
+	int err;
+
+	gem_mmap.handle = handle;
+	err = ioctl(dri->fd, DRM_IOCTL_RADEON_GEM_MMAP, &gem_mmap);
+	if (err)
+		return err;
+
+	*offset = gem_mmap.addr_ptr;
+	return 0;
+}
+
+static struct dri *dri_open(int unit)
+{
+	char path[32];
+	struct drm_version version = {0};
+	char name[16] = {0};
+	int err;
+	struct dri *dri;
+
+	dri = malloc(sizeof(*dri));
+	if (!dri)
+		return NULL;
+
+	sprintf(path, "/dev/dri/renderD%d", unit + 128);
+
+	dri->fd = open(path, O_RDWR);
+	if (dri->fd < 0)
+		goto out_free;
+
+	version.name = name;
+	version.name_len = 16;
+	err = ioctl(dri->fd, DRM_IOCTL_VERSION, &version);
+	if (err)
+		goto out_close;
+
+	if (!strcmp(name, "amdgpu")) {
+		dri->alloc = amdgpu_alloc;
+		dri->mmap_offset = amdgpu_mmap_offset;
+	} else if (!strcmp(name, "i915")) {
+		dri->alloc = i915_alloc;
+		dri->mmap_offset = i915_mmap_offset;
+	} else if (!strcmp(name, "radeon")) {
+		dri->alloc = radeon_alloc;
+		dri->mmap_offset = radeon_mmap_offset;
+	} else {
+		goto out_close;
+	}
+	return dri;
+
+out_close:
+	close(dri->fd);
+
+out_free:
+	free(dri);
+	return NULL;
+}
+
+static void dri_close(struct dri *dri)
+{
+	if (!dri || dri->fd < 0)
+		return;
+
+	close(dri->fd);
+	free(dri);
+}
+
+static void dri_free_buf(struct dri *dri, uint32_t handle)
+{
+	struct drm_gem_close close = {0};
+
+	close.handle = handle;
+	ioctl(dri->fd, DRM_IOCTL_GEM_CLOSE, &close);
+}
+
+static int dri_alloc_buf(struct dri *dri, size_t size, uint32_t *handle, int *fd)
+{
+	struct drm_prime_handle prime_handle = {0};
+	int err;
+
+	if (!dri || dri->fd < 0)
+		return -EINVAL;
+
+	err = dri->alloc(dri, size, handle);
+	if (err)
+		return err;
+
+	prime_handle.handle = *handle;
+	prime_handle.flags = O_RDWR;
+	err = ioctl(dri->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_handle);
+	if (err) {
+		dri_free_buf(dri, *handle);
+		return err;
+	}
+
+	*fd = prime_handle.fd;
+	return 0;
+}
+
+static int dri_map_buf(struct dri *dri, uint32_t handle, uint64_t *offset)
+{
+	if (!dri || dri->fd < 0)
+		return -EINVAL;
+
+	return dri->mmap_offset(dri, handle, offset);
+}
+
+/*
+ * Abstraction of dmabuf object, allocated using the DRI abstraction defined
+ * above.
+ */
+
+struct dmabuf {
+	struct dri *dri;
+	int fd;
+	uint32_t handle;
+	uint64_t map_offset;
+};
+
+struct dmabuf *dmabuf_alloc(uint64_t size, int unit)
+{
+	struct dmabuf *dmabuf;
+	int err;
+
+	dmabuf = malloc(sizeof *dmabuf);
+	if (!dmabuf)
+		return NULL;
+
+	dmabuf->dri = dri_open(unit);
+	if (!dmabuf->dri)
+		goto out_free;
+
+	err = dri_alloc_buf(dmabuf->dri, size, &dmabuf->handle, &dmabuf->fd);
+	if (err)
+		goto out_close;
+
+	err = dri_map_buf(dmabuf->dri, dmabuf->handle, &dmabuf->map_offset);
+	if (err)
+		goto out_free_buf;
+
+	return dmabuf;
+
+out_free_buf:
+	dri_free_buf(dmabuf->dri, dmabuf->handle);
+
+out_close:
+	dri_close(dmabuf->dri);
+
+out_free:
+	free(dmabuf);
+	return NULL;
+}
+
+void dmabuf_free(struct dmabuf *dmabuf)
+{
+	if (!dmabuf)
+		return;
+
+	close(dmabuf->fd);
+	dri_free_buf(dmabuf->dri, dmabuf->handle);
+	dri_close(dmabuf->dri);
+	free(dmabuf);
+}
+
+int dmabuf_get_dri_fd(struct dmabuf *dmabuf)
+{
+	if (!dmabuf || !dmabuf->dri)
+		return -1;
+
+	return dmabuf->dri->fd;
+}
+
+int dmabuf_get_fd(struct dmabuf *dmabuf)
+{
+	if (!dmabuf)
+		return -1;
+
+	return dmabuf->fd;
+}
+
+uint64_t dmabuf_get_offset(struct dmabuf *dmabuf)
+{
+	if (!dmabuf)
+		return -1;
+
+	return dmabuf->map_offset;
+}
+
diff --git a/pyverbs/dmabuf_alloc.h b/pyverbs/dmabuf_alloc.h
new file mode 100644
index 0000000..f36c337
--- /dev/null
+++ b/pyverbs/dmabuf_alloc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
+/*
+ * Copyright 2020 Intel Corporation. All rights reserved. See COPYING file
+ */
+
+#ifndef _DRI_H_
+#define _DRI_H_
+
+#include <stdint.h>
+
+struct dmabuf;
+
+struct dmabuf *dmabuf_alloc(uint64_t size, int unit);
+void dmabuf_free(struct dmabuf *dmabuf);
+int dmabuf_get_dri_fd(struct dmabuf *dmabuf);
+int dmabuf_get_fd(struct dmabuf *dmabuf);
+uint64_t dmabuf_get_offset(struct dmabuf *dmabuf);
+
+#endif /* _DRI_H_ */
diff --git a/pyverbs/libibverbs.pxd b/pyverbs/libibverbs.pxd
index 6fbba54..d76f633 100644
--- a/pyverbs/libibverbs.pxd
+++ b/pyverbs/libibverbs.pxd
@@ -507,6 +507,8 @@ cdef extern from 'infiniband/verbs.h':
     ibv_pd *ibv_alloc_pd(ibv_context *context)
     int ibv_dealloc_pd(ibv_pd *pd)
     ibv_mr *ibv_reg_mr(ibv_pd *pd, void *addr, size_t length, int access)
+    ibv_mr *ibv_reg_dmabuf_mr(ibv_pd *pd, uint64_t offset, size_t length,
+                              uint64_t iova, int fd, int access)
     int ibv_dereg_mr(ibv_mr *mr)
     int ibv_advise_mr(ibv_pd *pd, uint32_t advice, uint32_t flags,
                       ibv_sge *sg_list, uint32_t num_sge)
diff --git a/pyverbs/mr.pxd b/pyverbs/mr.pxd
index ebe8ada..d9a79ff 100644
--- a/pyverbs/mr.pxd
+++ b/pyverbs/mr.pxd
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
 
 #cython: language_level=3
 
@@ -33,3 +34,8 @@ cdef class MW(PyverbsCM):
 
 cdef class DMMR(MR):
     cdef object dm
+
+cdef class DmaBufMR(MR):
+    cdef object dmabuf
+    cdef unsigned long offset
+    cdef object is_dmabuf_internal
diff --git a/pyverbs/mr.pyx b/pyverbs/mr.pyx
index 7011da1..e4ed2dc 100644
--- a/pyverbs/mr.pyx
+++ b/pyverbs/mr.pyx
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
 
 import resource
 import logging
 
 from posix.mman cimport mmap, munmap, MAP_PRIVATE, PROT_READ, PROT_WRITE, \
-    MAP_ANONYMOUS, MAP_HUGETLB
+    MAP_ANONYMOUS, MAP_HUGETLB, MAP_SHARED
 from pyverbs.pyverbs_error import PyverbsError, PyverbsRDMAError, \
     PyverbsUserError
 from libc.stdint cimport uintptr_t, SIZE_MAX
@@ -14,9 +15,10 @@ from posix.stdlib cimport posix_memalign
 from libc.string cimport memcpy, memset
 cimport pyverbs.libibverbs_enums as e
 from pyverbs.device cimport DM
-from libc.stdlib cimport free
+from libc.stdlib cimport free, malloc
 from .cmid cimport CMID
 from .pd cimport PD
+from .dmabuf cimport DmaBuf
 
 cdef extern from 'sys/mman.h':
     cdef void* MAP_FAILED
@@ -348,6 +350,103 @@ cdef class DMMR(MR):
     cpdef read(self, length, offset):
         return self.dm.copy_from_dm(offset, length)
 
+cdef class DmaBufMR(MR):
+    def __init__(self, PD pd not None, length, access, DmaBuf dmabuf=None,
+                 offset=0):
+        """
+        Initializes a DmaBufMR (DMA-BUF Memory Region) of the given length
+        and access flags using the given PD and DmaBuf objects.
+        :param pd: A PD object
+        :param length: Length in bytes
+        :param access: Access flags, see ibv_access_flags enum
+        :param dmabuf: A DmaBuf object. One will be allocated if absent
+        :param offset: Byte offset from the beginning of the dma-buf
+        :return: The newly created DMABUFMR
+        """
+        self.logger = logging.getLogger(self.__class__.__name__)
+        if dmabuf is None:
+            self.is_dmabuf_internal = True
+            dmabuf = DmaBuf(length + offset)
+        self.mr = v.ibv_reg_dmabuf_mr(pd.pd, offset, length, offset, dmabuf.fd, access)
+        if self.mr == NULL:
+            raise PyverbsRDMAErrno(f'Failed to register a dma-buf MR. length: {length}, access flags: {access}')
+        super().__init__(pd, length, access)
+        self.pd = pd
+        self.dmabuf = dmabuf
+        self.offset = offset
+        pd.add_ref(self)
+        dmabuf.add_ref(self)
+        self.logger.debug(f'Registered dma-buf ibv_mr. Length: {length}, access flags {access}')
+
+    def __dealloc__(self):
+        self.close()
+
+    cpdef close(self):
+        """
+        Closes the underlying C object of the MR and frees the memory allocated.
+        :return: None
+        """
+        if self.mr != NULL:
+            self.logger.debug('Closing dma-buf MR')
+            rc = v.ibv_dereg_mr(self.mr)
+            if rc != 0:
+                raise PyverbsRDMAError('Failed to dereg dma-buf MR', rc)
+            self.pd = None
+            self.mr = NULL
+            # Set self.mr to NULL before closing dmabuf because this method is
+            # re-entered when close_weakrefs() is called inside dmabuf.close().
+            if self.is_dmabuf_internal:
+                self.dmabuf.close()
+            self.dmabuf = None
+
+    @property
+    def offset(self):
+        return self.offset
+
+    @property
+    def dmabuf(self):
+        return self.dmabuf
+
+    def write(self, data, length, offset=0):
+        """
+        Write user data to the dma-buf backing the MR
+        :param data: User data to write
+        :param length: Length of the data to write
+        :param offset: Writing offset
+        :return: None
+        """
+        if isinstance(data, str):
+            data = data.encode()
+        cdef int off = offset + self.offset
+        cdef void *buf = mmap(NULL, length + off, PROT_READ | PROT_WRITE,
+                              MAP_SHARED, self.dmabuf.dri_fd,
+                              self.dmabuf.map_offset)
+        if buf == MAP_FAILED:
+            raise PyverbsError(f'Failed to map dma-buf of size {length}')
+        memcpy(<char*>(buf + off), <char *>data, length)
+        munmap(buf, length + off)
+
+    cpdef read(self, length, offset):
+        """
+        Reads data from the dma-buf backing the MR
+        :param length: Length of data to read
+        :param offset: Reading offset
+        :return: The data on the buffer in the requested offset
+        """
+        cdef int off = offset + self.offset
+        cdef void *buf = mmap(NULL, length + off, PROT_READ | PROT_WRITE,
+                              MAP_SHARED, self.dmabuf.dri_fd,
+                              self.dmabuf.map_offset)
+        if buf == MAP_FAILED:
+            raise PyverbsError(f'Failed to map dma-buf of size {length}')
+        cdef char *data =<char*>malloc(length)
+        memset(data, 0, length)
+        memcpy(data, <char*>(buf + off), length)
+        munmap(buf, length + off)
+        res = data[:length]
+        free(data)
+        return res
+
 
 def mwtype2str(mw_type):
     mw_types = {1:'IBV_MW_TYPE_1', 2:'IBV_MW_TYPE_2'}
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
