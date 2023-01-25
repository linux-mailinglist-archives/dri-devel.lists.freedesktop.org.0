Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D167A84B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 02:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07310E293;
	Wed, 25 Jan 2023 01:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA010E0BE;
 Wed, 25 Jan 2023 01:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674609260; x=1706145260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3YUCVkUsf0CjqwcHsZHlL31qQpnjdJGnM1o/EPDDiQo=;
 b=DmVhxOp/X63LDqnYgPxjSR9rzVMi//bd8TjfB3vw6Sb3eJrpv43IF6zF
 PzncIjYNFLAdPQf6QwOYAFZSwG7xRFLnSHCq0RPMrv34s1IvjgsrEEHUf
 37OXZsA7BqwIGWW9VoiNRow6d85eVx3IaGkvUfY6MrPddox8mFoNRPj/b
 AVtwIZYHu/D9hAhYn9Aws4E0GS6GTBEpawiJVybZ6Va3MYhcISqXS1NbW
 WX6oG//2fQQV1srbm4sjmMkjHNQ/7RWL9IYBMqZeYWxJg5xxZNYOyJf3+
 rGfT58L9oCy+nrHFnoZJzNlMBVGBr7qZh60WYlzDq8B+Tyg1SqSvUi27I g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="353735853"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="353735853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:14:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655630599"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="655630599"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:14:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/xehp: GAM registers don't need to be re-applied
 on engine resets
Date: Tue, 24 Jan 2023 17:14:06 -0800
Message-Id: <20230125011407.2821808-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.0
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

While moving these GAM-related workarounds to the various platforms' GT
workaround functions, we should also take care to handle Wa_18018781329
properly for MTL's two GTs --- the render/compute setting should be set
on the primary GT where those engines reside, and the vd/ve/gsc setting
should be set on the media GT.  Previously the VD/VE/GSC setting was not
being properly applied.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Fixes: edf176f48d87 ("drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list")
Fixes: b2006061ae28 ("drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds")
Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 88 +++++++++++++--------
 drivers/gpu/drm/i915/i915_drv.h             |  4 +
 3 files changed, 59 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 2727645864db..4a37d048b512 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1100,6 +1100,7 @@
 #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
 #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
 #define COMP_MOD_CTRL				MCR_REG(0xcf30)
+#define GSC_MOD_CTRL				MCR_REG(0xcf30)	/* media GT only */
 #define VDBX_MOD_CTRL				MCR_REG(0xcf34)
 #define VEBX_MOD_CTRL				MCR_REG(0xcf38)
 #define   FORCE_MISS_FTLB			REG_BIT(3)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4efc1a532982..0e7f64bb2860 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1559,6 +1559,19 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_14011060649:xehpsdv */
 	wa_14011060649(gt, wal);
+
+	/* Wa_18018781329 */
+	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_14012362059:xehpsdv */
+	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_14014368820:xehpsdv */
+	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
+		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1599,6 +1612,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
@@ -1644,6 +1663,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
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
@@ -1658,6 +1683,16 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
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
@@ -1667,16 +1702,27 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
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
+	}
+
 	/*
 	 * Unlike older platforms, we no longer setup implicit steering here;
 	 * all MCR accesses are explicitly steered.
@@ -1687,7 +1733,12 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	/* FIXME: Actual workarounds will be added in future patch(es) */
+	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
+		/* Wa_18018781329 */
+		wa_mcr_write_or(wal, GSC_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+	}
 
 	debug_dump_steering(gt);
 }
@@ -2351,12 +2402,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
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
@@ -2416,18 +2461,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
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
@@ -2990,12 +3023,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
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
@@ -3062,13 +3089,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
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
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 2a6e212f8824..e90baa28a308 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -696,6 +696,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	(IS_METEORLAKE(__i915) && \
 	 IS_DISPLAY_STEP(__i915, since, until))
 
+#define IS_MTL_MEDIA_STEP(__i915, since, until) \
+	(IS_METEORLAKE(__i915) && \
+	 IS_MEDIA_STEP(__i915, since, until))
+
 /*
  * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
  * create three variants (G10, G11, and G12) which each have distinct
-- 
2.39.0

