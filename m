Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7378865A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0F610E658;
	Fri, 25 Aug 2023 11:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E104910E657;
 Fri, 25 Aug 2023 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964287; x=1724500287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKHZ+H0RX22mjKLCpVzDePMWx/0S/BQ56m7W+AHgUPY=;
 b=C/ysAkikwzA+Vd6KS/HuVaWvlz1bdywRERtRPiz2lHYrfp97y81lD761
 6+JV/uR8ry9Ki6KhenuDZfeDLuO0FEPfGBX6GJqI7+01MYaPH7R+XvtCb
 ZefNw5L8B7XV7GJIqf2s/0EOoJCJqtmmANA/0Ep2+J0LNpytKfaCmfMUk
 u1g+r4aOE/LTSFVFg6IR6neHx8tXNwOQsw0+cZI9U6Z4071rOO/qN/v1u
 KNfD+jVL9zAT/SQfLWvZ2BIVKj8a+EjdPz3kx3PATEiLoifExEBO3wOWc
 xJwx7zSLyHtYgxqrtNs0yh3ejiXhOb1vfC+DYWB4wpwXtXrjhLoUpy/M0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694724"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153538"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:30 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 2/5] drm/xe/RAS: Register netlink capability
Date: Fri, 25 Aug 2023 17:25:28 +0530
Message-Id: <20230825115531.800574-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
References: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register netlink capability with the DRM and register the driver
callbacks to DRM RAS netlink commands.

v2:
Move the netlink registration parts to DRM susbsytem (Tomer Tayar)

Cc: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  6 +++++-
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_netlink.c      | 22 ++++++++++++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b84e191ba14f..2b42165bc824 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -67,6 +67,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_netlink.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 323356a44e7f..42a3b50069b6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -124,6 +124,8 @@ static void xe_driver_release(struct drm_device *dev)
 	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
 }
 
+extern const struct driver_genl_ops xe_genl_ops[];
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -131,7 +133,8 @@ static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE,
+	    DRIVER_SYNCOBJ_TIMELINE |
+	    DRIVER_NETLINK,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
 
@@ -143,6 +146,7 @@ static struct drm_driver driver = {
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 	.release = &xe_driver_release,
+	.genl_ops = xe_genl_ops,
 
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 682ebdd1c09e..b19053fb3130 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_netlink.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_gt_types.h"
diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
new file mode 100644
index 000000000000..81d785455632
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "xe_device.h"
+
+static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+/* driver callbacks to DRM netlink commands*/
+const struct driver_genl_ops xe_genl_ops[] = {
+	[DRM_RAS_CMD_QUERY] =		{ .doit = xe_genl_list_errors },
+	[DRM_RAS_CMD_READ_ONE] =	{ .doit = xe_genl_read_error },
+	[DRM_RAS_CMD_READ_ALL] =	{ .doit = xe_genl_list_errors, },
+};
-- 
2.25.1

