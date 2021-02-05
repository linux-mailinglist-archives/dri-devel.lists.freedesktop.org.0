Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC543114CB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 23:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D086F512;
	Fri,  5 Feb 2021 22:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C376E0B6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 22:18:37 +0000 (UTC)
IronPort-SDR: HAOQJwjkskLE8AoBqP46gayW3xB/OFUg1CSfG8iD0oM5GYVITSTtg3eLQHEbxQ9jom9LNgcxD4
 YblXvObaohRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="242998364"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="242998364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 14:18:36 -0800
IronPort-SDR: Rn5LZ6O1/5G1Fb+s0u54MZuqX5IgUQqCM3B1NLORiBOk3luIBEVaJs0otQmfmVkXbtqIHJVeG6
 o5PkoEDQ40kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="394034436"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga008.jf.intel.com with ESMTP; 05 Feb 2021 14:18:36 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 3/3] configure: Add check for DRM headers
Date: Fri,  5 Feb 2021 14:33:39 -0800
Message-Id: <1612564419-103455-4-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612564419-103455-1-git-send-email-jianxin.xiong@intel.com>
References: <1612564419-103455-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gal Pressman <galpress@amazon.com>,
 Ali Alnubani <alialnu@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compilation of pyverbs/dmabuf_alloc.c depends on a few DRM headers
that are installed by either the kernel-header or the libdrm package.
The installation is optional and the location is not unique.

Check the presence and location of the headers and, if the headers
are missing, replace the dmabuf allocation routines wth stubs that
return suitable error to allow the related tests to skip.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 CMakeLists.txt              | 17 +++++++++++++++++
 pyverbs/CMakeLists.txt      |  8 +++++++-
 pyverbs/dmabuf_alloc.c      |  8 ++++----
 pyverbs/dmabuf_alloc_stub.c | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100644 pyverbs/dmabuf_alloc_stub.c

diff --git a/CMakeLists.txt b/CMakeLists.txt
index 4113423..80fb747 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -515,6 +515,20 @@ find_package(Systemd)
 include_directories(${SYSTEMD_INCLUDE_DIRS})
 RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
 
+# drm headers
+
+# Check if the headers have been installed by kernel-headers
+find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm")
+
+# Alternatively the headers could have been installed by libdrm
+if (NOT DRM_INCLUDE_DIRS)
+  pkg_check_modules(DRM libdrm)
+endif()
+
+if (DRM_INCLUDE_DIRS)
+  include_directories(${DRM_INCLUDE_DIRS})
+endif()
+
 #-------------------------
 # Apply fixups
 
@@ -786,3 +800,6 @@ endif()
 if (NOT HAVE_TARGET_SSE)
   message(STATUS " attribute(target(\"sse\")) does NOT work")
 endif()
+if (NOT DRM_INCLUDE_DIRS)
+  message(STATUS " DMABUF NOT supported (disabling some tests)")
+endif()
diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt
index 6fd7625..dbd0ffe 100644
--- a/pyverbs/CMakeLists.txt
+++ b/pyverbs/CMakeLists.txt
@@ -6,6 +6,12 @@ publish_internal_headers(""
   dmabuf_alloc.h
 )
 
+if (DRM_INCLUDE_DIRS)
+  set(DMABUF_ALLOC dmabuf_alloc.c)
+else()
+  set(DMABUF_ALLOC dmabuf_alloc_stub.c)
+endif()
+
 rdma_cython_module(pyverbs ""
   addr.pyx
   base.pyx
@@ -14,7 +20,7 @@ rdma_cython_module(pyverbs ""
   cq.pyx
   device.pyx
   dmabuf.pyx
-  dmabuf_alloc.c
+  ${DMABUF_ALLOC}
   enums.pyx
   mem_alloc.pyx
   mr.pyx
diff --git a/pyverbs/dmabuf_alloc.c b/pyverbs/dmabuf_alloc.c
index 85ffb7a..9978a5b 100644
--- a/pyverbs/dmabuf_alloc.c
+++ b/pyverbs/dmabuf_alloc.c
@@ -9,12 +9,12 @@
 #include <unistd.h>
 #include <string.h>
 #include <errno.h>
-#include <drm/drm.h>
-#include <drm/i915_drm.h>
-#include <drm/amdgpu_drm.h>
-#include <drm/radeon_drm.h>
 #include <fcntl.h>
 #include <sys/ioctl.h>
+#include <drm.h>
+#include <i915_drm.h>
+#include <amdgpu_drm.h>
+#include <radeon_drm.h>
 #include "dmabuf_alloc.h"
 
 /*
diff --git a/pyverbs/dmabuf_alloc_stub.c b/pyverbs/dmabuf_alloc_stub.c
new file mode 100644
index 0000000..a73a5da
--- /dev/null
+++ b/pyverbs/dmabuf_alloc_stub.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright 2021 Intel Corporation. All rights reserved. See COPYING file
+ */
+
+#include <stdio.h>
+#include <stdint.h>
+#include <errno.h>
+#include "dmabuf_alloc.h"
+
+struct dmabuf *dmabuf_alloc(uint64_t size, int gpu, int gtt)
+{
+	errno = EOPNOTSUPP;
+	return NULL;
+}
+
+void dmabuf_free(struct dmabuf *dmabuf)
+{
+	errno = EOPNOTSUPP;
+}
+
+int dmabuf_get_drm_fd(struct dmabuf *dmabuf)
+{
+	errno = EOPNOTSUPP;
+	return -1;
+}
+
+int dmabuf_get_fd(struct dmabuf *dmabuf)
+{
+	errno = EOPNOTSUPP;
+	return -1;
+}
+
+uint64_t dmabuf_get_offset(struct dmabuf *dmabuf)
+{
+	errno = EOPNOTSUPP;
+	return -1;
+}
+
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
