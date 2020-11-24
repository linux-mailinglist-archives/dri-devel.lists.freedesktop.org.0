Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C02C329C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 22:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C986089FBC;
	Tue, 24 Nov 2020 21:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526846E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 21:24:57 +0000 (UTC)
IronPort-SDR: v2bwo940S6tJTZxXh4EgvACIQXn3N+jhwf5+Wvyy/wQBnivIu2c3Sh8qqduycfP4puPF4pfYLp
 7DZiuKa0nfUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151278745"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151278745"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 13:24:56 -0800
IronPort-SDR: JW80gQaFvoMxmoRlKA9rBiCzWr+sR7L9n+DipPQ+dA2HRtTJ0tUbx7C+9sHs1CQgkuqOwAWFze
 Op4R2HXqSyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="332701585"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga006.jf.intel.com with ESMTP; 24 Nov 2020 13:24:56 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v2 4/6] pyverbs: Add dma-buf based MR support
Date: Tue, 24 Nov 2020 13:38:52 -0800
Message-Id: <1606253934-67181-5-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
References: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
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
region. Define a new class 'DmaBuf' for dma-buf object allocation.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 pyverbs/CMakeLists.txt |  2 ++
 pyverbs/dmabuf.pxd     | 13 ++++++++
 pyverbs/dmabuf.pyx     | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++
 pyverbs/libibverbs.pxd |  2 ++
 pyverbs/mr.pxd         |  5 +++
 pyverbs/mr.pyx         | 77 +++++++++++++++++++++++++++++++++++++++++++--
 6 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 pyverbs/dmabuf.pxd
 create mode 100644 pyverbs/dmabuf.pyx

diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt
index 9542c4b..5aee02b 100644
--- a/pyverbs/CMakeLists.txt
+++ b/pyverbs/CMakeLists.txt
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved.
 
 rdma_cython_module(pyverbs ""
   addr.pyx
@@ -16,6 +17,7 @@ rdma_cython_module(pyverbs ""
   wr.pyx
   xrcd.pyx
   srq.pyx
+  dmabuf.pyx
   )
 
 rdma_python_module(pyverbs
diff --git a/pyverbs/dmabuf.pxd b/pyverbs/dmabuf.pxd
new file mode 100644
index 0000000..040db4b
--- /dev/null
+++ b/pyverbs/dmabuf.pxd
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
+# Copyright (c) 2020, Intel Corporation. All rights reserved.
+
+#cython: language_level=3
+
+cdef class DmaBuf:
+    cdef int dri_fd
+    cdef int handle
+    cdef int fd
+    cdef unsigned long size
+    cdef unsigned long map_offset
+    cdef object dmabuf_mrs
+    cdef add_ref(self, obj)
diff --git a/pyverbs/dmabuf.pyx b/pyverbs/dmabuf.pyx
new file mode 100644
index 0000000..a72d808
--- /dev/null
+++ b/pyverbs/dmabuf.pyx
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
+# Copyright (c) 2020, Intel Corporation. All rights reserved.
+
+#cython: language_level=3
+
+import weakref
+
+from os import open, close, O_RDWR
+from fcntl import ioctl
+from struct import pack_into, unpack
+from pyverbs.base cimport close_weakrefs
+from pyverbs.mr cimport DmaBufMR
+
+cdef extern from "drm/drm.h":
+    cdef int DRM_IOCTL_MODE_CREATE_DUMB
+    cdef int DRM_IOCTL_MODE_MAP_DUMB
+    cdef int DRM_IOCTL_MODE_DESTROY_DUMB
+    cdef int DRM_IOCTL_PRIME_HANDLE_TO_FD
+
+cdef class DmaBuf:
+    def __init__(self, size, unit=0):
+        """
+        Allocate DmaBuf object from a GPU device. This is done through the
+        DRI device interface (/dev/dri/card*). Usually this requires the
+        effective user id being root or being a member of the 'video' group.
+        :param size: The size (in number of bytes) of the buffer.
+        :param unit: The unit number of the GPU to allocate the buffer from.
+        :return: The newly created DmaBuf object on success.
+        """
+        self.dmabuf_mrs = weakref.WeakSet()
+        self.dri_fd = open('/dev/dri/card'+str(unit), O_RDWR)
+
+        # create a dumb scanout buffer:
+        #     struct drm_mode_create_dumb {
+        #        __u32 height;
+        #        __u32 width;
+        #        __u32 bpp;
+        #        __u32 flags;
+        #        __u32 handle; /* output */
+        #        __u32 pitch; /* output */
+        #        __u64 size; /* output */
+        #    };
+        create_dumb = bytearray(32)
+        pack_into('=iiiiiiq', create_dumb, 0, 1, size, 8, 0, 0, 0, 0)
+        ioctl(self.dri_fd, DRM_IOCTL_MODE_CREATE_DUMB, create_dumb)
+        a, b, c, d, self.handle, e, self.size = unpack('=iiiiiiq', create_dumb)
+
+        # get dma-buf file descriptor from a PRIME handle:
+        #     struct drm_prime_handle {
+        #         __u32 handle;
+        #         __u32 flags;
+        #         __s32 fd; /* output */
+        #     };
+        prime_handle = bytearray(12)
+        pack_into('=iii', prime_handle, 0, self.handle, O_RDWR, 0)
+        ioctl(self.dri_fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, prime_handle)
+        a, b, self.fd = unpack('=iii', prime_handle)
+
+        # set up for mmap of a dumb scanout buffer:
+        #     struct drm_mode_map_dumb {
+        #         __u32 handle;
+        #         __u32 pad;
+        #         __u64 offset; /* output */
+        #     };
+        map_dumb = bytearray(16)
+        pack_into('=iiq', map_dumb, 0, self.handle, 0, 0)
+        ioctl(self.dri_fd, DRM_IOCTL_MODE_MAP_DUMB, map_dumb);
+        a, b, self.map_offset = unpack('=iiq', map_dumb);
+
+    def __dealloc__(self):
+        close_weakrefs([self.dmabuf_mrs])
+
+        # destroy a dumb scanout buffer:
+        #     struct drm_mode_destroy_dumb {
+        #         __u32 handle;
+        #     };
+        destroy_dumb = bytearray(4)
+        pack_into('=i', destroy_dumb, 0, self.handle)
+        ioctl(self.dri_fd, DRM_IOCTL_MODE_DESTROY_DUMB, destroy_dumb)
+        close(self.dri_fd)
+
+    cdef add_ref(self, obj):
+        if isinstance(obj, DmaBufMR):
+            self.dmabuf_mrs.add(obj)
+
diff --git a/pyverbs/libibverbs.pxd b/pyverbs/libibverbs.pxd
index 6fbba54..95e51e1 100644
--- a/pyverbs/libibverbs.pxd
+++ b/pyverbs/libibverbs.pxd
@@ -507,6 +507,8 @@ cdef extern from 'infiniband/verbs.h':
     ibv_pd *ibv_alloc_pd(ibv_context *context)
     int ibv_dealloc_pd(ibv_pd *pd)
     ibv_mr *ibv_reg_mr(ibv_pd *pd, void *addr, size_t length, int access)
+    ibv_mr *ibv_reg_dmabuf_mr(ibv_pd *pd, uint64_t offset, size_t length,
+			      int fd, int access)
     int ibv_dereg_mr(ibv_mr *mr)
     int ibv_advise_mr(ibv_pd *pd, uint32_t advice, uint32_t flags,
                       ibv_sge *sg_list, uint32_t num_sge)
diff --git a/pyverbs/mr.pxd b/pyverbs/mr.pxd
index ebe8ada..b89cf02 100644
--- a/pyverbs/mr.pxd
+++ b/pyverbs/mr.pxd
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved.
 
 #cython: language_level=3
 
@@ -33,3 +34,7 @@ cdef class MW(PyverbsCM):
 
 cdef class DMMR(MR):
     cdef object dm
+
+cdef class DmaBufMR(MR):
+    cdef object dmabuf
+    cdef unsigned long offset
diff --git a/pyverbs/mr.pyx b/pyverbs/mr.pyx
index 7011da1..4102d3c 100644
--- a/pyverbs/mr.pyx
+++ b/pyverbs/mr.pyx
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
 # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
+# Copyright (c) 2020, Intel Corporation. All rights reserved.
 
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
@@ -348,6 +350,77 @@ cdef class DMMR(MR):
     cpdef read(self, length, offset):
         return self.dm.copy_from_dm(offset, length)
 
+cdef class DmaBufMR(MR):
+    def __init__(self, PD pd not None, length=0, access=0, DmaBuf dmabuf=None, offset=0):
+        """
+        Initializes a DmaBufMR (DMA-BUF Memory Region) of the given length
+        and access flags using the given PD and DmaBuf objects.
+        :param pd: A PD object
+        :param length: Length in bytes
+        :param access: Access flags, see ibv_access_flags enum
+        :param dmabuf: A DmaBuf object
+        :param offset: Byte offset from the beginning of the dma-buf
+        :return: The newly create DMABUFMR
+        """
+        self.logger = logging.getLogger(self.__class__.__name__)
+        if dmabuf is None:
+            dmabuf = DmaBuf(length + offset)
+        self.mr = v.ibv_reg_dmabuf_mr(pd.pd, offset, length, dmabuf.fd, access)
+        if self.mr == NULL:
+            raise PyverbsRDMAErrno('Failed to register a dma-buf MR. length: {len}, access flags: {flags}'.
+                                   format(len=length, flags=access,))
+        super().__init__(pd, length, access)
+        self.pd = pd
+        self.dmabuf = dmabuf
+        self.offset = offset
+        pd.add_ref(self)
+        dmabuf.add_ref(self)
+        self.logger.debug('Registered dma-buf ibv_mr. Length: {len}, access flags {flags}'.
+                          format(len=length, flags=access))
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
+        # can't access the attributes if self.dmabuf is used w/o cast
+        dmabuf = <DmaBuf>self.dmabuf
+        cdef int off = offset + self.offset
+        cdef void *buf = mmap(NULL, length + off, PROT_READ | PROT_WRITE,
+                              MAP_SHARED, dmabuf.dri_fd, dmabuf.map_offset)
+        if buf == MAP_FAILED:
+            raise PyverbsError('Failed to map dma-buf of size {l}'.
+                               format(l=length))
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
+        # can't access the attributes if self.dmabuf is used w/o cast
+        dmabuf = <DmaBuf>self.dmabuf
+        cdef int off = offset + self.offset
+        cdef void *buf = mmap(NULL, length + off, PROT_READ | PROT_WRITE,
+                              MAP_SHARED, dmabuf.dri_fd, dmabuf.map_offset)
+        if buf == MAP_FAILED:
+            raise PyverbsError('Failed to map dma-buf of size {l}'.
+                               format(l=length))
+        cdef char *data =<char*>malloc(length)
+        memset(data, 0, length)
+        memcpy(data, <char*>(buf + off), length)
+        munmap(buf, length + off)
+        res = data[:length]
+        free(data)
+        return res
 
 def mwtype2str(mw_type):
     mw_types = {1:'IBV_MW_TYPE_1', 2:'IBV_MW_TYPE_2'}
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
