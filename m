Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0330FB9E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4D36EE30;
	Thu,  4 Feb 2021 18:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D2C6EE30
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:35:59 +0000 (UTC)
IronPort-SDR: IaFE3q8DjWNqMb5tGTEcLkvTBS9XjRYYRIWG62FSrxgcCuC5efLsaNwQ3LJoGdn0hZNpLrHScL
 I3ftSWO2WS4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="180528995"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="180528995"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 10:35:59 -0800
IronPort-SDR: wNSpWYdSiQZTpEk8tiZ2sSLkVDrfKFn7TxPyS0CSd9XOJqa4rUaT7SR/veJZ7vExpiM+sX2VPx
 s27d41rCzccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="580383251"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2021 10:35:59 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 3/3] configure: Add check for the presence of DRM
 headers
Date: Thu,  4 Feb 2021 10:50:51 -0800
Message-Id: <1612464651-54073-4-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
References: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
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

The standard locations (such as /usr/include/drm, /usr/include/libdrm)
are checked first. If failed, pkg-config is tried to find the include
path of custom libdrm installation. The dmabuf allocation routines now
return suitable error when the headers are not available. The related
tests will recognize this error code and skip.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 CMakeLists.txt         |  7 +++++++
 buildlib/Finddrm.cmake | 19 +++++++++++++++++++
 buildlib/config.h.in   |  2 ++
 pyverbs/dmabuf_alloc.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
 4 files changed, 70 insertions(+), 5 deletions(-)
 create mode 100644 buildlib/Finddrm.cmake

diff --git a/CMakeLists.txt b/CMakeLists.txt
index 4113423..feaba3a 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -515,6 +515,13 @@ find_package(Systemd)
 include_directories(${SYSTEMD_INCLUDE_DIRS})
 RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
 
+# drm headers
+find_package(drm)
+if (DRM_INCLUDE_DIRS)
+  include_directories(${DRM_INCLUDE_DIRS})
+  set(HAVE_DRM_H 1)
+endif()
+
 #-------------------------
 # Apply fixups
 
diff --git a/buildlib/Finddrm.cmake b/buildlib/Finddrm.cmake
new file mode 100644
index 0000000..6f8e5f2
--- /dev/null
+++ b/buildlib/Finddrm.cmake
@@ -0,0 +1,19 @@
+# COPYRIGHT (c) 2021 Intel Corporation.
+# Licensed under BSD (MIT variant) or GPLv2. See COPYING.
+
+# Check standard locations first
+find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm" "libdrm")
+
+# Check custom libdrm installation, if any
+if (NOT DRM_INCLUDE_DIRS)
+  execute_process(COMMAND pkg-config --cflags-only-I libdrm
+    OUTPUT_VARIABLE _LIBDRM
+    RESULT_VARIABLE _LIBDRM_RESULT
+    ERROR_QUIET)
+
+  if (NOT _LIBDRM_RESULT)
+    string(REGEX REPLACE "^-I" "" DRM_INCLUDE_DIRS "${_LIBDRM}")
+  endif()
+  unset(_LIBDRM)
+  unset(_LIBDRM_RESULT)
+endif()
diff --git a/buildlib/config.h.in b/buildlib/config.h.in
index c5b0bf5..e8dff54 100644
--- a/buildlib/config.h.in
+++ b/buildlib/config.h.in
@@ -67,6 +67,8 @@
 # define VERBS_WRITE_ONLY 0
 #endif
 
+#define HAVE_DRM_H @HAVE_DRM_H@
+
 // Configuration defaults
 
 #define IBACM_SERVER_MODE_UNIX 0
diff --git a/pyverbs/dmabuf_alloc.c b/pyverbs/dmabuf_alloc.c
index 93267bf..22a8ab8 100644
--- a/pyverbs/dmabuf_alloc.c
+++ b/pyverbs/dmabuf_alloc.c
@@ -9,13 +9,18 @@
 #include <unistd.h>
 #include <string.h>
 #include <errno.h>
-#include <drm/drm.h>
-#include <drm/i915_drm.h>
-#include <drm/amdgpu_drm.h>
-#include <drm/radeon_drm.h>
+
+#include "config.h"
+#include "dmabuf_alloc.h"
+
+#if HAVE_DRM_H
+
+#include <drm.h>
+#include <i915_drm.h>
+#include <amdgpu_drm.h>
+#include <radeon_drm.h>
 #include <fcntl.h>
 #include <sys/ioctl.h>
-#include "dmabuf_alloc.h"
 
 /*
  * Abstraction of the buffer allocation mechanism using the DRM interface.
@@ -276,3 +281,35 @@ uint64_t dmabuf_get_offset(struct dmabuf *dmabuf)
 	return dmabuf->map_offset;
 }
 
+#else
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
+#endif
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
