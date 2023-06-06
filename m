Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41C723545
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 04:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423510E200;
	Tue,  6 Jun 2023 02:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF63D10E1ED;
 Tue,  6 Jun 2023 02:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686018255; x=1717554255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bDS+jPBoTjV9FdvCuJn1dN90Auc6Vo3yDhF4OFynt3A=;
 b=e36psiRA48V+bdX3WFjiySr0H2XYwWEWedkqJLuDwGJnIIunW7UH+/sM
 xS4mVkZCa8KjEnPgC+FJazXwFxPj7P4M98i1O8/mGdBYv5AZtPwJTZ2ZX
 g77Dn+e8q1aAAxQvYHQMOUK3ASmf6wCaSY1BVsts/FSiUck7TzsUZipBR
 2Sj5UYi/l604c5L1BvA9quD+sVkci1VmWcNHQvGt2gcFrI8ZoZPlOM4Pw
 I27uGO0WQgzJaKh1e1GUHo1VNRjCmFaWu0rmZiySwwUb74oL/HFOUPJ5y
 CJrDko63mSM21lmS3tKIsakjxwhmmU5BUgQCCqQRDYSCSr3GEOHHuWNO2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358995789"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="358995789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712019564"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="712019564"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:15 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/i915/mtl/gsc: Add a gsc_info debugfs
Date: Mon,  5 Jun 2023 19:24:01 -0700
Message-Id: <20230606022402.2048235-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
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

v2: fix includes and copyright dates (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 29 +++++------
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 48 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  2 +
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c | 38 +++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h | 14 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  6 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  2 +
 drivers/gpu/drm/i915/i915_reg.h               | 26 +++++++++-
 9 files changed, 143 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1c9ed4c52760..b6c54fb0b4cc 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -192,7 +192,8 @@ i915-y += \
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
index 7d48d59011c8..b069459e2596 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -12,36 +12,31 @@
 #include "intel_gsc_binary_headers.h"
 #include "intel_gsc_fw.h"
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
@@ -293,9 +288,9 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
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
index 4fe639a80564..6826aa5d6985 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -7,10 +7,11 @@
 
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_print.h"
-#include "intel_gsc_uc.h"
 #include "intel_gsc_fw.h"
-#include "i915_drv.h"
 #include "intel_gsc_proxy.h"
+#include "intel_gsc_uc.h"
+#include "i915_drv.h"
+#include "i915_reg.h"
 
 static void gsc_work(struct work_struct *work)
 {
@@ -304,3 +305,46 @@ void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
 
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
index 81df6c929d5f..c8082cf200fc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -8,6 +8,7 @@
 
 #include "intel_uc_fw.h"
 
+struct drm_printer;
 struct i915_vma;
 struct intel_context;
 struct i915_gsc_proxy_component;
@@ -63,6 +64,7 @@ void intel_gsc_uc_suspend(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_resume(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_flush_work(struct intel_gsc_uc *gsc);
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc);
+void intel_gsc_uc_load_status(struct intel_gsc_uc *gsc, struct drm_printer *p);
 
 static inline bool intel_gsc_uc_is_supported(struct intel_gsc_uc *gsc)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
new file mode 100644
index 000000000000..56c1595753f7
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
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
index 000000000000..3415ad39aabb
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
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
index e0afd8f89502..d3a7219e9ed1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -308,9 +308,9 @@ void intel_huc_init_early(struct intel_huc *huc)
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
index 8ed7c39c2b30..8b1989de5132 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -941,8 +941,30 @@
 #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
-#define HECI_FWSTS5(base)		_MMIO((base) + 0xc68)
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

