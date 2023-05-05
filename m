Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8316F866D
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3510E63D;
	Fri,  5 May 2023 16:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878E10E638;
 Fri,  5 May 2023 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302914; x=1714838914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YXk+grE4CZ65Y5+a2pJXCI1H5muU0QCkBOlEm2jn/vg=;
 b=iqrofbEaN8MvVtQqfhNhS7A8mHN1nUXVHKNKi8CNNB0N6k5c01UcKg1z
 LYGROZg3GfH7A1s0tG9sPlPh+B8JbhgkjvHUPSgo1aWRsRLJNx8nDjkRP
 ZDP4TMIU8VzXKkPGxm9Q5RQ4mzf9CkPqNl7LvAfldUkK3pXPEXN5Mtq34
 68aPGiZAzmqeBCO5ygv6HLvtTFmpRE/k+yhhQ7tMaT8yBfdr2SCkDIVci
 qCUS/xHOlhkd2emMw5Fmb+HgAhCrrTyQfnT8cAcenwEqoq2G5wZ9WZWCe
 Vja5tmvcigxrsMXQilr7AUJqgUDDfDKJC7qf0EkVpZCrW9JXXacUucefe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276992"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911305"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911305"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915/uc/gsc: Add a gsc_info debugfs
Date: Fri,  5 May 2023 09:04:15 -0700
Message-Id: <20230505160415.889525-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new debugfs to dump information about the GSC. This includes:

- the FW path and SW tracking status;
- the release, security and compatibility versions;
- the HECI1 status registers.

Note that those are the same registers that the mei driver dumps in
their own status sysfs on DG2 (where mei owns the GSC).

To make it simpler to loop through the status register, the code has
been update to use a PICK macro and the existing code using the regs had
been adapted to match.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 29 +++++-------
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 46 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  2 +
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c | 38 +++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h | 14 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  6 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  2 +
 drivers/gpu/drm/i915/i915_reg.h               | 26 ++++++++++-
 9 files changed, 142 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d97d45ae1a0d..fd6a1ae542bd 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -196,7 +196,8 @@ i915-y += \
 	  gt/uc/intel_gsc_fw.o \
 	  gt/uc/intel_gsc_proxy.o \
 	  gt/uc/intel_gsc_uc.o \
-	  gt/uc/intel_gsc_uc_heci_cmd_submit.o\
+	  gt/uc/intel_gsc_uc_debugfs.o \
+	  gt/uc/intel_gsc_uc_heci_cmd_submit.o \
 	  gt/uc/intel_guc.o \
 	  gt/uc/intel_guc_ads.o \
 	  gt/uc/intel_guc_capture.o \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 0b6dcd982b14..3014e982aab2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -12,36 +12,31 @@
 #include "intel_gsc_fw.h"
 #include "intel_gsc_meu_headers.h"
 #include "intel_gsc_uc_heci_cmd_submit.h"
-
-#define GSC_FW_STATUS_REG			_MMIO(0x116C40)
-#define GSC_FW_CURRENT_STATE			REG_GENMASK(3, 0)
-#define   GSC_FW_CURRENT_STATE_RESET		0
-#define   GSC_FW_PROXY_STATE_NORMAL		5
-#define GSC_FW_INIT_COMPLETE_BIT		REG_BIT(9)
+#include "i915_reg.h"
 
 static bool gsc_is_in_reset(struct intel_uncore *uncore)
 {
-	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
+	u32 fw_status = intel_uncore_read(uncore, HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
 
-	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
-	       GSC_FW_CURRENT_STATE_RESET;
+	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE, fw_status) ==
+			HECI1_FWSTS1_CURRENT_STATE_RESET;
 }
 
 bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc)
 {
 	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
-	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
+	u32 fw_status = intel_uncore_read(uncore, HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
 
-	return REG_FIELD_GET(GSC_FW_CURRENT_STATE, fw_status) ==
-	       GSC_FW_PROXY_STATE_NORMAL;
+	return REG_FIELD_GET(HECI1_FWSTS1_CURRENT_STATE, fw_status) ==
+	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
 }
 
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
 {
 	struct intel_uncore *uncore = gsc_uc_to_gt(gsc)->uncore;
-	u32 fw_status = intel_uncore_read(uncore, GSC_FW_STATUS_REG);
+	u32 fw_status = intel_uncore_read(uncore, HECI_FWSTS(MTL_GSC_HECI1_BASE, 1));
 
-	return fw_status & GSC_FW_INIT_COMPLETE_BIT;
+	return fw_status & HECI1_FWSTS1_INIT_COMPLETE;
 }
 
 static inline u32 cpd_entry_offset(const struct intel_gsc_cpd_entry *entry)
@@ -265,9 +260,9 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 static int gsc_fw_wait(struct intel_gt *gt)
 {
 	return intel_wait_for_register(gt->uncore,
-				       GSC_FW_STATUS_REG,
-				       GSC_FW_INIT_COMPLETE_BIT,
-				       GSC_FW_INIT_COMPLETE_BIT,
+				       HECI_FWSTS(MTL_GSC_HECI1_BASE, 1),
+				       HECI1_FWSTS1_INIT_COMPLETE,
+				       HECI1_FWSTS1_INIT_COMPLETE,
 				       500);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 2ae693b01b49..5475e95d61c6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -9,8 +9,9 @@
 #include "gt/intel_gt_print.h"
 #include "intel_gsc_uc.h"
 #include "intel_gsc_fw.h"
-#include "i915_drv.h"
 #include "intel_gsc_proxy.h"
+#include "i915_drv.h"
+#include "i915_reg.h"
 
 static void gsc_work(struct work_struct *work)
 {
@@ -301,3 +302,46 @@ void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
 
 	queue_work(gsc->wq, &gsc->work);
 }
+
+void intel_gsc_uc_load_status(struct intel_gsc_uc *gsc, struct drm_printer *p)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct intel_uncore *uncore = gt->uncore;
+	intel_wakeref_t wakeref;
+
+	if (!intel_gsc_uc_is_supported(gsc)) {
+		drm_printf(p, "GSC not supported\n");
+		return;
+	}
+
+	if (!intel_gsc_uc_is_wanted(gsc)) {
+		drm_printf(p, "GSC disabled\n");
+		return;
+	}
+
+	drm_printf(p, "GSC firmware: %s\n", gsc->fw.file_selected.path);
+	if (gsc->fw.file_selected.path != gsc->fw.file_wanted.path)
+		drm_printf(p, "GSC firmware wanted: %s\n", gsc->fw.file_wanted.path);
+	drm_printf(p, "\tstatus: %s\n", intel_uc_fw_status_repr(gsc->fw.status));
+
+
+	drm_printf(p, "Release: %u.%u.%u.%u\n",
+		   gsc->release.major, gsc->release.minor,
+		   gsc->release.patch, gsc->release.build);
+
+	drm_printf(p, "Compatibility Version: %u.%u [min expected %u.%u]\n",
+		   gsc->fw.file_selected.ver.major, gsc->fw.file_selected.ver.minor,
+		   gsc->fw.file_wanted.ver.major, gsc->fw.file_wanted.ver.minor);
+
+	drm_printf(p, "SVN: %u\n", gsc->security_version);
+
+	with_intel_runtime_pm(uncore->rpm, wakeref) {
+		u32 i;
+
+		for (i = 1; i <= 6; i++) {
+			u32 status = intel_uncore_read(uncore,
+						       HECI_FWSTS(MTL_GSC_HECI1_BASE, i));
+			drm_printf(p, "HECI1 FWSTST%u = 0x%08x\n", i, status);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index d778a01f8c05..f3d30e48e5e2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -8,6 +8,7 @@
 
 #include "intel_uc_fw.h"
 
+struct drm_printer;
 struct i915_vma;
 struct intel_context;
 struct i915_gsc_proxy_component;
@@ -48,6 +49,7 @@ void intel_gsc_uc_suspend(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_resume(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc);
+void intel_gsc_uc_load_status(struct intel_gsc_uc *gsc, struct drm_printer *p);
 
 static inline bool intel_gsc_uc_is_supported(struct intel_gsc_uc *gsc)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
new file mode 100644
index 000000000000..da9f96b72291
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#include <drm/drm_print.h>
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_debugfs.h"
+#include "gt/intel_gt_print.h"
+#include "intel_gsc_uc.h"
+#include "i915_drv.h"
+
+static int gsc_info_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct intel_gsc_uc *gsc = m->private;
+
+	if (!intel_gsc_uc_is_supported(gsc))
+		return -ENODEV;
+
+	intel_gsc_uc_load_status(gsc, &p);
+
+	return 0;
+}
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(gsc_info);
+
+void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc_uc, struct dentry *root)
+{
+	static const struct intel_gt_debugfs_file files[] = {
+		{ "gsc_info", &gsc_info_fops, NULL },
+	};
+
+	if (!intel_gsc_uc_is_supported(gsc_uc))
+		return;
+
+	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gsc_uc);
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
new file mode 100644
index 000000000000..c405e5574253
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef DEBUGFS_GSC_UC_H
+#define DEBUGFS_GSC_UC_H
+
+struct intel_gsc_uc;
+struct dentry;
+
+void intel_gsc_uc_debugfs_register(struct intel_gsc_uc *gsc, struct dentry *root);
+
+#endif /* DEBUGFS_GSC_UC_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 54411ac33f35..04b48433954a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -299,9 +299,9 @@ void intel_huc_init_early(struct intel_huc *huc)
 		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
 		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
 	} else {
-		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
-		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
-		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS(MTL_GSC_HECI1_BASE, 5);
+		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI1_FWSTS5_HUC_AUTH_DONE;
+		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI1_FWSTS5_HUC_AUTH_DONE;
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
index 2f93cc4e408a..6d541c866edb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
@@ -10,6 +10,7 @@
 
 #include "gt/intel_gt_debugfs.h"
 #include "intel_guc_debugfs.h"
+#include "intel_gsc_uc_debugfs.h"
 #include "intel_huc_debugfs.h"
 #include "intel_uc.h"
 #include "intel_uc_debugfs.h"
@@ -58,6 +59,7 @@ void intel_uc_debugfs_register(struct intel_uc *uc, struct dentry *gt_root)
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), uc);
 
+	intel_gsc_uc_debugfs_register(&uc->gsc, root);
 	intel_guc_debugfs_register(&uc->guc, root);
 	intel_huc_debugfs_register(&uc->huc, root);
 }
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 94baadce29f6..cf34b777a63c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -941,8 +941,30 @@
 #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
-#define HECI_FWSTS5(base)		_MMIO(base + 0xc68)
-#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
+/*
+ * The FWSTS register values are FW defined and can be different between
+ * HECI1 and HECI2
+ */
+#define HECI_FWSTS1				0xc40
+#define   HECI1_FWSTS1_CURRENT_STATE			REG_GENMASK(3, 0)
+#define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
+#define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
+#define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
+#define HECI_FWSTS2				0xc48
+#define HECI_FWSTS3				0xc60
+#define HECI_FWSTS4				0xc64
+#define HECI_FWSTS5				0xc68
+#define   HECI1_FWSTS5_HUC_AUTH_DONE	(1 << 19)
+#define HECI_FWSTS6				0xc6c
+
+/* the FWSTS regs are 1-based, so we use -base for index 0 to get an invalid reg */
+#define HECI_FWSTS(base, x) _MMIO((base) + _PICK(x, -(base), \
+						    HECI_FWSTS1, \
+						    HECI_FWSTS2, \
+						    HECI_FWSTS3, \
+						    HECI_FWSTS4, \
+						    HECI_FWSTS5, \
+						    HECI_FWSTS6))
 
 #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
 #define   GTT_CACHE_EN_ALL	0xF0007FFF
-- 
2.40.0

