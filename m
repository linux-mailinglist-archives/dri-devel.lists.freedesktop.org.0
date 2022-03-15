Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD5E4DA0CA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 18:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3EB89081;
	Tue, 15 Mar 2022 17:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9589081;
 Tue, 15 Mar 2022 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647363849; x=1678899849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JxjJlMVLPR9FCHE5mx9qm2gMg4CV9znwfSXo+ogP+RA=;
 b=Qa2gzoGkviS2Qw4+6K57EYON1O68gLAD2C1lsLN54miQ8YXOl5O4l00u
 oAxD1xvuq+G2694sUfWnmcyKDdpqNWIrzFzwSUCJ1hAGR6pGtfQaXTDYT
 aggD3j3Y643tMoSnDMZVIdOvwvBVHEQmI6JyFtvGVC1Ql74+3w1yDT11A
 NGWXjEip8YjcVsxUCfq4d8E310l2/CLtnX1dFTBAfquIYWKb3tQz+Z1ga
 dSrOQbBAaNDZK9JOwujiS6EjxKEdcJrO1gQi2MEUEyFHNpeHDHuUDYgAY
 /y8LY0ukyPCTYxllbYX393/bwHElCnSY1QcOe4x1PGgOJa8BQPu14e1Fx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236308702"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="236308702"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 10:03:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="512681424"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 10:03:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915: Report steering details in debugfs
Date: Tue, 15 Mar 2022 10:02:50 -0700
Message-Id: <20220315170250.954380-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314234203.799268-2-matthew.d.roper@intel.com>
References: <20220314234203.799268-2-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new 'steering' node in each gt's debugfs directory that tells
whether we're using explicit steering for various types of MCR ranges
and, if so, what MMIO ranges it applies to.

We're going to be transitioning away from implicit steering, even for
slice/dss steering soon, so the information reported here will become
increasingly valuable once that happens.

v2:
 - Adding missing 'static' on intel_steering_types[]  (Jose, sparse)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 46 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  | 13 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  5 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  8 +++-
 5 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8a2483ccbfb9..4c7ad9d14f4f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -96,6 +96,12 @@ int intel_gt_assign_ggtt(struct intel_gt *gt)
 	return gt->ggtt ? 0 : -ENOMEM;
 }
 
+static const char *intel_steering_types[] = {
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

