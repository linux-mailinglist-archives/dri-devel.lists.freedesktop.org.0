Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0916870F4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EB310E1A9;
	Wed,  1 Feb 2023 22:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D620710E1A4;
 Wed,  1 Feb 2023 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675290517; x=1706826517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qokfoRB6cADqLTl3A7i06TIL/bXq1oR32QMlh1a9VGQ=;
 b=HCnO73WFMsAKk18HRWH7UbXZFjkhNFA4kbhQrff9MnlddlEz3XStdYCc
 LYEyngAM0KqwWMGVer38WluxrSgv/IK+UhMVQ9ZJqAqHCbByHe8mLl30V
 xLI1Gc5u9T11l4TXspm5tFkPeSbvxmn1L6bdFd2aLi2j/FC0TtuqZhYPN
 KsIemO1d55OyO5qOGAImTYsVZGxF+eRms3FEKcWbTQXCRuY82WyPwGnsj
 NQQ0IcFI0veyzr3rAFFF2CT3+2+6QBqp5Hy5hh20giO77nX99qfR7Lzyi
 W8uEWxhnOk7ur4WlLTEhjMqcoyq68HTE7lEygb0ADCuRvrT45AZNxROiz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355626152"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="355626152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807733579"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="807733579"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/xehp: LNCF/LBCF workarounds should be on the GT
 list
Date: Wed,  1 Feb 2023 14:28:30 -0800
Message-Id: <20230201222831.608281-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201222831.608281-1-matthew.d.roper@intel.com>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although registers in the L3 bank/node configuration ranges are marked
as having "DEV" reset characteristics in the bspec, this appears to be a
hold-over from pre-Xe_HP platforms.  In reality, these registers
maintain their values across engine resets, meaning that workarounds
and tuning settings targetting them should be placed on the GT
workaround list rather than an engine workaround list.

Note that an extra clue here is that these registers moved from the
RENDER forcewake domain to the GT forcewake domain in Xe_HP; generally
RCS/CCS engine resets should not lead to the reset of a register that
lives outside the RENDER domain.

Re-applying these registers on engine resets wouldn't actually hurt
anything, but is unnecessary and just makes it more confusing to anyone
trying to decipher how these registers really work.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 61 +++++++++++++--------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 7e93ba6b3208..09c9837458b5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1499,6 +1499,12 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_1409757795:xehpsdv */
 	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
 
+	/* Wa_18011725039:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
+		wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
+		wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
+	}
+
 	/* Wa_16011155590:xehpsdv */
 	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
@@ -1548,6 +1554,9 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_14014368820:xehpsdv */
 	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
 			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
+
+	/* Wa_14010670810:xehpsdv */
+	wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
 }
 
 static void
@@ -1684,6 +1693,9 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
 	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
 	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_16016694945 */
+	wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
 }
 
 static void
@@ -1724,11 +1736,36 @@ xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	debug_dump_steering(gt);
 }
 
+/*
+ * The bspec performance guide has recommended MMIO tuning settings.  These
+ * aren't truly "workarounds" but we want to program them through the
+ * workaround infrastructure to make sure they're (re)applied at the proper
+ * times.
+ *
+ * The settings in this function are for settings that persist through
+ * engine resets and also are not part of any engine's register state context.
+ * I.e., settings that only need to be re-applied in the event of a full GT
+ * reset.
+ */
+static void gt_tuning_settings(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	if (IS_PONTEVECCHIO(gt->i915)) {
+		wa_mcr_write(wal, XEHPC_L3SCRUB,
+			     SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
+		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
+	}
+
+	if (IS_DG2(gt->i915))
+		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
+	gt_tuning_settings(gt, wal);
+
 	if (gt->type == GT_MEDIA) {
 		if (MEDIA_VER(i915) >= 13)
 			xelpmp_gt_workarounds_init(gt, wal);
@@ -2897,16 +2934,8 @@ static void
 add_render_compute_tuning_settings(struct drm_i915_private *i915,
 				   struct i915_wa_list *wal)
 {
-	if (IS_PONTEVECCHIO(i915)) {
-		wa_mcr_write(wal, XEHPC_L3SCRUB,
-			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
-		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
-	}
-
-	if (IS_DG2(i915)) {
-		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+	if (IS_DG2(i915))
 		wa_mcr_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
-	}
 
 	/*
 	 * This tuning setting proves beneficial only on ATS-M designs; the
@@ -2988,11 +3017,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 			   0, false);
 	}
 
-	if (IS_PONTEVECCHIO(i915)) {
-		/* Wa_16016694945 */
-		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
-	}
-
 	if (IS_XEHPSDV(i915)) {
 		/* Wa_1409954639 */
 		wa_mcr_masked_en(wal,
@@ -3004,18 +3028,9 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 				 GEN9_ROW_CHICKEN4,
 				 GEN12_DISABLE_GRF_CLEAR);
 
-		/* Wa_14010670810:xehpsdv */
-		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
-
 		/* Wa_14010449647:xehpsdv */
 		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
-
-		/* Wa_18011725039:xehpsdv */
-		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
-			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
-			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
-		}
 	}
 
 	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
-- 
2.39.1

