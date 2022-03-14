Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E944D9081
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA9689FA7;
	Mon, 14 Mar 2022 23:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AB189F41;
 Mon, 14 Mar 2022 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647301330; x=1678837330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iCSV1PGFZOfB6VoZy4YQ57QUG/GBTE2Llif6Q6XPZno=;
 b=PZxH51t2TtE3dt6MiUTlI4fTUL9diTp1lBQhy3qpXBACt6V4FNMXGXQK
 UP9G6ZQR56EFN2VjIfzgjsNoZ750VMiwtQ5IgqBVA9gSrHZ44RqC/S2Ir
 7AkG4CTiT8BG5oNVRG4yu8v2J1Qy0yB33g6IraA4TRofKyGy+PZaDVpBT
 UiZMFXfJIdWhVrIDPzk++EKRqgJ5esR45SUZbP5SlJkk5VZX+s200XwET
 nCxHtoPk9SgJbtr5HFKRsZ6MkWhL9L4fQcZ+eJz6F4Ls1bW9NeuVEur5M
 jHjOXBMrFj62IjQuyLw0aBB0KNxVUo2u8Qy+IOMTeT/VlENJuxWPZMbA7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256359967"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="256359967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="549403061"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Report steering details in debugfs
Date: Mon, 14 Mar 2022 16:42:01 -0700
Message-Id: <20220314234203.799268-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314234203.799268-1-matthew.d.roper@intel.com>
References: <20220314234203.799268-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new 'steering' node in each gt's debugfs directory that tells
whether we're using explicit steering for various types of MCR ranges
and, if so, what MMIO ranges it applies to.

We're going to be transitioning away from implicit steering, even for
slice/dss steering soon, so the information reported here will become
increasingly valuable once that happens.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 46 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  | 13 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  5 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  8 +++-
 5 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8a2483ccbfb9..041add4019fc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -96,6 +96,12 @@ int intel_gt_assign_ggtt(struct intel_gt *gt)
 	return gt->ggtt ? 0 : -ENOMEM;
 }
 
+const char *intel_steering_types[] = {
+	"L3BANK",
+	"MSLICE",
+	"LNCF",
+};
+
 static const struct intel_mmio_range icl_l3bank_steering_table[] = {
 	{ 0x00B100, 0x00B3FF },
 	{},
@@ -932,6 +938,46 @@ u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read(gt->uncore, reg);
 }
 
+static void report_steering_type(struct drm_printer *p,
+				 struct intel_gt *gt,
+				 enum intel_steering_type type,
+				 bool dump_table)
+{
+	const struct intel_mmio_range *entry;
+	u8 slice, subslice;
+
+	BUILD_BUG_ON(ARRAY_SIZE(intel_steering_types) != NUM_STEERING_TYPES);
+
+	if (!gt->steering_table[type]) {
+		drm_printf(p, "%s steering: uses default steering\n",
+			   intel_steering_types[type]);
+		return;
+	}
+
+	intel_gt_get_valid_steering(gt, type, &slice, &subslice);
+	drm_printf(p, "%s steering: sliceid=0x%x, subsliceid=0x%x\n",
+		   intel_steering_types[type], slice, subslice);
+
+	if (!dump_table)
+		return;
+
+	for (entry = gt->steering_table[type]; entry->end; entry++)
+		drm_printf(p, "\t0x%06x - 0x%06x\n", entry->start, entry->end);
+}
+
+void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
+			      bool dump_table)
+{
+	drm_printf(p, "Default steering: sliceid=0x%x, subsliceid=0x%x\n",
+		   gt->default_steering.groupid,
+		   gt->default_steering.instanceid);
+
+	if (HAS_MSLICES(gt->i915)) {
+		report_steering_type(p, gt, MSLICE, dump_table);
+		report_steering_type(p, gt, LNCF, dump_table);
+	}
+}
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 0f571c8ee22b..3edece1865e4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -87,6 +87,8 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
 u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
 
+void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
+			      bool dump_table);
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index f103664b71d4..6f45b131a001 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/debugfs.h>
 
 #include "i915_drv.h"
+#include "intel_gt.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_engines_debugfs.h"
 #include "intel_gt_pm_debugfs.h"
@@ -57,10 +58,22 @@ static int __intel_gt_debugfs_reset_store(void *data, u64 val)
 DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
 			__intel_gt_debugfs_reset_store, "%llu\n");
 
+static int steering_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct intel_gt *gt = m->private;
+
+	intel_gt_report_steering(&p, gt, true);
+
+	return 0;
+}
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(steering);
+
 static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "reset", &reset_fops, NULL },
+		{ "steering", &steering_fops },
 	};
 
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f20687796490..7781ab84e7a3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -182,6 +182,11 @@ struct intel_gt {
 
 	const struct intel_mmio_range *steering_table[NUM_STEERING_TYPES];
 
+	struct {
+		u8 groupid;
+		u8 instanceid;
+	} default_steering;
+
 	struct intel_gt_info {
 		intel_engine_mask_t engine_mask;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index beca8735bae5..c328d46f8095 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1072,9 +1072,15 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
 static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
 			 unsigned int slice, unsigned int subslice)
 {
-	drm_dbg(&gt->i915->drm, "MCR slice=0x%x, subslice=0x%x\n", slice, subslice);
+	struct drm_printer p = drm_debug_printer("MCR Steering:");
 
 	__set_mcr_steering(wal, GEN8_MCR_SELECTOR, slice, subslice);
+
+	gt->default_steering.groupid = slice;
+	gt->default_steering.instanceid = subslice;
+
+	if (drm_debug_enabled(DRM_UT_DRIVER))
+		intel_gt_report_steering(&p, gt, false);
 }
 
 static void
-- 
2.34.1

