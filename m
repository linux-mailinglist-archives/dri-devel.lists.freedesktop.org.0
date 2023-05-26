Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60304712A7F
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815C410E1CE;
	Fri, 26 May 2023 16:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D523810E805;
 Fri, 26 May 2023 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118064; x=1716654064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oesWIuLOFxf34Jzlfy876pBbAq23s41x7GgUHmESEx8=;
 b=YvacNKT+FW2anQwvSqENdTizNAthkk8xRVioja7bXM2px+YQaXs9Nxck
 v7z/QRIlCulDzOjUfMHk39ezmX1hB/aDCKQ+MCGdv12T7iJOAgUHR0BFd
 VB/iGGo4Ml7FYsz7my/1XcrHz9OZGICVVMXbbDQ+9I6yeFhP0+u4bUyFx
 DPN57T3X6b2g6XjQaBgWYI3xXVAA6zN3YGtl02lOOqkY+d7aFQkSd4aZl
 nal/2SEQROtHtk4wLtNdciI1GoNRB+YHNoRJFUlVgUJ8Xg68giiXgJfFU
 DduLs9I7BnHhp069lE53FCfYsdDx5T07qfy1SARO1zfvNHMH5PPavt1ZA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343735803"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343735803"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849620130"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849620130"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:02 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/5] drm/xe/RAS: Register a genl netlink family
Date: Fri, 26 May 2023 21:50:13 +0530
Message-Id: <20230526162016.428357-3-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the generic netlink(genl) subsystem to expose the RAS counters to
userspace. We define a family structure and operations and register to
genl subsystem and these callbacks will be invoked by genl subsystem when
userspace sends a registered command with a family identifier to genl
subsystem.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  3 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_module.c       |  2 +
 drivers/gpu/drm/xe/xe_netlink.c      | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_netlink.h      | 14 +++++
 6 files changed, 111 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.h

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
index 323356a44e7f..aa12ef12d9dc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -24,6 +24,7 @@
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_netlink.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
@@ -317,6 +318,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_display_register(xe);
 
+	xe_genl_register(xe);
+
 	xe_debugfs_register(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 682ebdd1c09e..c9612a54c48f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_netlink.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_gt_types.h"
@@ -347,6 +348,7 @@ struct xe_device {
 		u32 lvds_channel_mode;
 	} params;
 #endif
+	struct genl_family xe_genl_family;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 6860586ce7f8..1eb73eb9a9a5 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_module.h"
+#include "xe_netlink.h"
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
@@ -67,6 +68,7 @@ static void __exit xe_exit(void)
 {
 	int i;
 
+	xe_genl_cleanup();
 	xe_unregister_pci_driver();
 
 	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
new file mode 100644
index 000000000000..63ef238ebc27
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+
+DEFINE_XARRAY(xe_xarray);
+
+static int xe_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+static int xe_genl_read_error(struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+/* operations definition */
+static const struct genl_ops xe_genl_ops[] = {
+	{
+		.cmd = DRM_CMD_QUERY,
+		.doit = xe_genl_list_errors,
+		.policy = drm_attr_policy_query,
+	},
+	{
+		.cmd = DRM_CMD_READ_ONE,
+		.doit = xe_genl_read_error,
+		.policy = drm_attr_policy_read_one,
+	},
+	{
+		.cmd = DRM_CMD_READ_ALL,
+		.doit = xe_genl_list_errors,
+		.policy = drm_attr_policy_query,
+	},
+};
+
+static void xe_genl_deregister(struct drm_device *dev,  void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xa_erase(&xe_xarray, xe->xe_genl_family.id);
+
+	drm_dbg_driver(&xe->drm, "unregistering genl family %s\n", xe->xe_genl_family.name);
+
+	genl_unregister_family(&xe->xe_genl_family);
+}
+
+static void xe_genl_family_init(struct xe_device *xe)
+{
+	/* Use drm primary node name eg: card0 to name the genl family */
+	snprintf(xe->xe_genl_family.name, sizeof(xe->xe_genl_family.name), "%s", xe->drm.primary->kdev->kobj.name);
+	xe->xe_genl_family.version = DRM_GENL_VERSION;
+	xe->xe_genl_family.parallel_ops = true;
+	xe->xe_genl_family.ops = xe_genl_ops;
+	xe->xe_genl_family.n_ops = ARRAY_SIZE(xe_genl_ops);
+	xe->xe_genl_family.maxattr = DRM_ATTR_MAX;
+	xe->xe_genl_family.module = THIS_MODULE;
+}
+
+int xe_genl_register(struct xe_device *xe)
+{
+	int ret;
+
+	xe_genl_family_init(xe);
+
+	ret = genl_register_family(&xe->xe_genl_family);
+	if (ret < 0) {
+		drm_warn(&xe->drm, "xe genl family registration failed\n");
+		return ret;
+	}
+
+	drm_dbg_driver(&xe->drm, "genl family id %d and name %s\n", xe->xe_genl_family.id, xe->xe_genl_family.name);
+
+	xa_store(&xe_xarray, xe->xe_genl_family.id, xe, GFP_KERNEL);
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_genl_deregister, xe);
+
+	return ret;
+}
+
+void xe_genl_cleanup(void)
+{
+	/* destroy xarray */
+	xa_destroy(&xe_xarray);
+}
diff --git a/drivers/gpu/drm/xe/xe_netlink.h b/drivers/gpu/drm/xe/xe_netlink.h
new file mode 100644
index 000000000000..3bbddb620539
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_netlink.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _XE_GENL_H_
+#define _XE_GENL_H_
+
+#include "xe_device.h"
+
+int xe_genl_register(struct xe_device *xe);
+void xe_genl_cleanup(void);
+
+#endif
-- 
2.25.1

