Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E2405038
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9FA6E89D;
	Thu,  9 Sep 2021 12:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF036E881;
 Thu,  9 Sep 2021 12:32:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208005491"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208005491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="470057811"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v8 15/17] drm/i915/pxp: add pxp debugfs
Date: Thu,  9 Sep 2021 05:29:13 -0700
Message-Id: <20210909122915.971652-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2 debugfs files, one to query the current status of the pxp session and one
to trigger an invalidation for testing.

v2: rename debugfs, fix date (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by : Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                |  1 +
 drivers/gpu/drm/i915/gt/debugfs_gt.c         |  2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c | 78 ++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h | 21 ++++++
 4 files changed, 102 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 366e82cec44d..b46474ee1a1f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -285,6 +285,7 @@ i915-y += i915_perf.o
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp.o \
 	pxp/intel_pxp_cmd.o \
+	pxp/intel_pxp_debugfs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
 	pxp/intel_pxp_session.o \
diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt.c b/drivers/gpu/drm/i915/gt/debugfs_gt.c
index 591eb60785db..c27847ddb796 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt.c
@@ -9,6 +9,7 @@
 #include "debugfs_gt.h"
 #include "debugfs_gt_pm.h"
 #include "intel_sseu_debugfs.h"
+#include "pxp/intel_pxp_debugfs.h"
 #include "uc/intel_uc_debugfs.h"
 #include "i915_drv.h"
 
@@ -28,6 +29,7 @@ void debugfs_gt_register(struct intel_gt *gt)
 	intel_sseu_debugfs_register(gt, root);
 
 	intel_uc_debugfs_register(&gt->uc, root);
+	intel_pxp_debugfs_register(&gt->pxp, root);
 }
 
 void intel_gt_debugfs_register_files(struct dentry *root,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
new file mode 100644
index 000000000000..cbb1853676cc
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <drm/drm_print.h>
+
+#include "gt/debugfs_gt.h"
+#include "pxp/intel_pxp.h"
+#include "pxp/intel_pxp_irq.h"
+#include "i915_drv.h"
+
+static int pxp_info_show(struct seq_file *m, void *data)
+{
+	struct intel_pxp *pxp = m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+	bool enabled = intel_pxp_is_enabled(pxp);
+
+	if (!enabled) {
+		drm_printf(&p, "pxp disabled\n");
+		return 0;
+	}
+
+	drm_printf(&p, "active: %s\n", yesno(intel_pxp_is_active(pxp)));
+	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
+
+	return 0;
+}
+DEFINE_GT_DEBUGFS_ATTRIBUTE(pxp_info);
+
+static int pxp_terminate_get(void *data, u64 *val)
+{
+	/* nothing to read */
+	return -EPERM;
+}
+
+static int pxp_terminate_set(void *data, u64 val)
+{
+	struct intel_pxp *pxp = data;
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	if (!intel_pxp_is_active(pxp))
+		return -ENODEV;
+
+	/* simulate a termination interrupt */
+	spin_lock_irq(&gt->irq_lock);
+	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
+	spin_unlock_irq(&gt->irq_lock);
+
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(100)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(pxp_terminate_fops, pxp_terminate_get, pxp_terminate_set, "%llx\n");
+void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *gt_root)
+{
+	static const struct debugfs_gt_file files[] = {
+		{ "info", &pxp_info_fops, NULL },
+		{ "terminate_state", &pxp_terminate_fops, NULL },
+	};
+	struct dentry *root;
+
+	if (!gt_root)
+		return;
+
+	if (!HAS_PXP((pxp_to_gt(pxp)->i915)))
+		return;
+
+	root = debugfs_create_dir("pxp", gt_root);
+	if (IS_ERR(root))
+		return;
+
+	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), pxp);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
new file mode 100644
index 000000000000..7e0c3d2f5d7e
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef __INTEL_PXP_DEBUGFS_H__
+#define __INTEL_PXP_DEBUGFS_H__
+
+struct intel_pxp;
+struct dentry;
+
+#ifdef CONFIG_DRM_I915_PXP
+void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root);
+#else
+static inline void
+intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root)
+{
+}
+#endif
+
+#endif /* __INTEL_PXP_DEBUGFS_H__ */
-- 
2.25.1

