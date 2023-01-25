Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A667C10E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53A210E3A9;
	Wed, 25 Jan 2023 23:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1D910E3A9;
 Wed, 25 Jan 2023 23:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674690143; x=1706226143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VIhlLBgLl7VK7U6UO+2MW635DZnuv70Y5mz4lu0xScw=;
 b=TDWF/vglJX+OvNzXgNocQx+zOJVnvsRm7vNQTndvu9u4O/MiZCA/9gJK
 fJ9AMoQyNi89jN56agjaXFfsHTHMTOBv54Zu5uAKELmaecYQM+Yd/Xryx
 vybL+cLaluVXJ6mVVTAQQ1fE8qTCYX31l1k/EwE+H6RXI0EEa1VU6U3CK
 w+VbzVBoObiNYNps27ORVp4o4MgjWNvVcvbcKhKmGzcegdkBiQNYJO5dQ
 vkEk9eXoP04bq1eZhEKWib6pZQaIosHPGh177/puoXPTva+8y1m+r9OX8
 uJ2rMx5bQDB2tWVV0r1fpeG6I5MD5lWWZHtRT10JN7f4C709stKdrKJ55 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326739569"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326739569"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="655987398"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="655987398"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/xehp: GAM registers don't need to be
 re-applied on engine resets
Date: Wed, 25 Jan 2023 15:41:57 -0800
Message-Id: <20230125234159.3015385-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register reset characteristics (i.e., whether the register maintains or
loses its value on engine reset) is an important factor that determines
which wa_list we want to add workarounds to.  We recently found out that
the bspec documentation for the Xe_HP's "GAM" registers in the 0xC800 -
0xCFFF range was misleading; these registers do not actually lose their
value on engine resets as the documentation implied.  This means there's
no need to re-apply workarounds touching these registers after a reset,
and the corresponding workarounds should be moved from the 'engine'
lists back to the 'gt' list.

v2:
 - Don't add Wa_18018781329 to xehpsdv; the original condition didn't
   include that platform.  (Gustavo)
 - Move the MTL code to the GT function as-is for now; we'll take care
   of the additional fixes needed in a follow-up patch.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Fixes: edf176f48d87 ("drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list")
Fixes: b2006061ae28 ("drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds")
Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 77 ++++++++++++---------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4efc1a532982..9db60078460a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1559,6 +1559,13 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_14011060649:xehpsdv */
 	wa_14011060649(gt, wal);
+
+	/* Wa_14012362059:xehpsdv */
+	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_14014368820:xehpsdv */
+	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
+		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1599,6 +1606,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 				DSS_ROUTER_CLKGATE_DIS);
 	}
 
+	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0) ||
+	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0)) {
+		/* Wa_14012362059:dg2 */
+		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+	}
+
 	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
 		/* Wa_14010948348:dg2_g10 */
 		wa_write_or(wal, UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS);
@@ -1644,6 +1657,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 		/* Wa_14011028019:dg2_g10 */
 		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
+
+		/* Wa_14010680813:dg2_g10 */
+		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
+			    CONTROL_BLOCK_CLKGATE_DIS |
+			    EGRESS_BLOCK_CLKGATE_DIS |
+			    TAG_BLOCK_CLKGATE_DIS);
 	}
 
 	/* Wa_14014830051:dg2 */
@@ -1658,6 +1677,16 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_14015795083 */
 	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
+
+	/* Wa_18018781329 */
+	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_1509235366:dg2 */
+	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
+		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1667,16 +1696,29 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_14015795083 */
 	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
+
+	/* Wa_18018781329 */
+	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 }
 
 static void
 xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	/* Wa_14014830051 */
 	if (IS_MTL_GRAPHICS_STEP(gt->i915, M, STEP_A0, STEP_B0) ||
-	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0))
+	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0)) {
+		/* Wa_14014830051 */
 		wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
 
+		/* Wa_18018781329 */
+		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+	}
+
 	/*
 	 * Unlike older platforms, we no longer setup implicit steering here;
 	 * all MCR accesses are explicitly steered.
@@ -2351,12 +2393,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 				 GEN12_DISABLE_READ_SUPPRESSION);
 	}
 
-	if (IS_DG2(i915)) {
-		/* Wa_1509235366:dg2 */
-		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-			    GLOBAL_INVALIDATION_MODE);
-	}
-
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14013392000:dg2_g11 */
 		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
@@ -2416,18 +2452,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
 				 DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
 
-	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
-		/* Wa_14010680813:dg2_g10 */
-		wa_write_or(wal, GEN12_GAMSTLB_CTRL, CONTROL_BLOCK_CLKGATE_DIS |
-			    EGRESS_BLOCK_CLKGATE_DIS | TAG_BLOCK_CLKGATE_DIS);
-	}
-
-	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
-	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
-		/* Wa_14012362059:dg2 */
-		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
-	}
-
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
 	    IS_DG2_G10(i915)) {
 		/* Wa_22014600077:dg2 */
@@ -2990,12 +3014,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0) ||
 	    IS_PONTEVECCHIO(i915) ||
 	    IS_DG2(i915)) {
-		/* Wa_18018781329 */
-		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
-
 		/* Wa_22014226127 */
 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
 	}
@@ -3062,13 +3080,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
 			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
 		}
-
-		/* Wa_14012362059:xehpsdv */
-		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
-
-		/* Wa_14014368820:xehpsdv */
-		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
-				GLOBAL_INVALIDATION_MODE);
 	}
 
 	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
-- 
2.39.1

