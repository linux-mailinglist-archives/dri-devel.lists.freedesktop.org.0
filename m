Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABB40FE61
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 19:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D96E038;
	Fri, 17 Sep 2021 17:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3E36E02E;
 Fri, 17 Sep 2021 17:08:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="308383583"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="308383583"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 10:08:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="651935954"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 10:08:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, matthew.d.roper@intel.com,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/i915: Make wa list per-gt
Date: Fri, 17 Sep 2021 10:08:45 -0700
Message-Id: <20210917170845.836358-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

Support for multiple GT's within a single i915 device will be arriving
soon.  Since each GT may have its own fusing and require different
workarounds, we need to make the GT workaround functions and multicast
steering setup per-gt.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 143 +++++++++---------
 drivers/gpu/drm/i915/gt/intel_workarounds.h   |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/i915_drv.c               |   2 -
 drivers/gpu/drm/i915/i915_drv.h               |   2 -
 drivers/gpu/drm/i915/i915_gem.c               |   2 -
 8 files changed, 81 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 55e87aff51d2..449ff6e83543 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -660,6 +660,8 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		return err;
 
+	intel_gt_init_workarounds(gt);
+
 	/*
 	 * This is just a security blanket to placate dragons.
 	 * On some systems, we very sporadically observe that the first TLBs
@@ -767,6 +769,7 @@ void intel_gt_driver_release(struct intel_gt *gt)
 	if (vm) /* FIXME being called twice on error paths :( */
 		i915_vm_put(vm);
 
+	intel_wa_list_free(&gt->wa_list);
 	intel_gt_pm_fini(gt);
 	intel_gt_fini_scratch(gt);
 	intel_gt_fini_buffer_pool(gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 6fdcde64c180..ce127cae9e49 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -72,6 +72,8 @@ struct intel_gt {
 
 	struct intel_uc uc;
 
+	struct i915_wa_list wa_list;
+
 	struct intel_gt_timelines {
 		spinlock_t lock; /* protects active_list */
 		struct list_head active_list;
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index c314d4917b6b..1f0a54b383d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -804,7 +804,7 @@ int intel_engine_emit_ctx_wa(struct i915_request *rq)
 }
 
 static void
-gen4_gt_workarounds_init(struct drm_i915_private *i915,
+gen4_gt_workarounds_init(struct intel_gt *gt,
 			 struct i915_wa_list *wal)
 {
 	/* WaDisable_RenderCache_OperationalFlush:gen4,ilk */
@@ -812,29 +812,29 @@ gen4_gt_workarounds_init(struct drm_i915_private *i915,
 }
 
 static void
-g4x_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+g4x_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen4_gt_workarounds_init(i915, wal);
+	gen4_gt_workarounds_init(gt, wal);
 
 	/* WaDisableRenderCachePipelinedFlush:g4x,ilk */
 	wa_masked_en(wal, CACHE_MODE_0, CM0_PIPELINED_RENDER_FLUSH_DISABLE);
 }
 
 static void
-ilk_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+ilk_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	g4x_gt_workarounds_init(i915, wal);
+	g4x_gt_workarounds_init(gt, wal);
 
 	wa_masked_en(wal, _3D_CHICKEN2, _3D_CHICKEN2_WM_READ_PIPELINED);
 }
 
 static void
-snb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+snb_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 }
 
 static void
-ivb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+ivb_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	/* Apply the WaDisableRHWOOptimizationForRenderHang:ivb workaround. */
 	wa_masked_dis(wal,
@@ -850,7 +850,7 @@ ivb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-vlv_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+vlv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	/* WaForceL3Serialization:vlv */
 	wa_write_clr(wal, GEN7_L3SQCREG4, L3SQ_URB_READ_CAM_MATCH_DISABLE);
@@ -863,7 +863,7 @@ vlv_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-hsw_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+hsw_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	/* L3 caching of data atomics doesn't work -- disable it. */
 	wa_write(wal, HSW_SCRATCH1, HSW_SCRATCH1_L3_DATA_ATOMICS_DISABLE);
@@ -878,15 +878,15 @@ hsw_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-gen9_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+gen9_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	/* WaDisableKillLogic:bxt,skl,kbl */
-	if (!IS_COFFEELAKE(i915) && !IS_COMETLAKE(i915))
+	if (!IS_COFFEELAKE(gt->i915) && !IS_COMETLAKE(gt->i915))
 		wa_write_or(wal,
 			    GAM_ECOCHK,
 			    ECOCHK_DIS_TLB);
 
-	if (HAS_LLC(i915)) {
+	if (HAS_LLC(gt->i915)) {
 		/* WaCompressedResourceSamplerPbeMediaNewHashMode:skl,kbl
 		 *
 		 * Must match Display Engine. See
@@ -904,9 +904,9 @@ gen9_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal
 }
 
 static void
-skl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+skl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen9_gt_workarounds_init(i915, wal);
+	gen9_gt_workarounds_init(gt, wal);
 
 	/* WaDisableGafsUnitClkGating:skl */
 	wa_write_or(wal,
@@ -914,19 +914,19 @@ skl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 		    GEN8_EU_GAUNIT_CLOCK_GATE_DISABLE);
 
 	/* WaInPlaceDecompressionHang:skl */
-	if (IS_SKL_GT_STEP(i915, STEP_A0, STEP_H0))
+	if (IS_SKL_GT_STEP(gt->i915, STEP_A0, STEP_H0))
 		wa_write_or(wal,
 			    GEN9_GAMT_ECO_REG_RW_IA,
 			    GAMT_ECO_ENABLE_IN_PLACE_DECOMPRESS);
 }
 
 static void
-kbl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+kbl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen9_gt_workarounds_init(i915, wal);
+	gen9_gt_workarounds_init(gt, wal);
 
 	/* WaDisableDynamicCreditSharing:kbl */
-	if (IS_KBL_GT_STEP(i915, 0, STEP_C0))
+	if (IS_KBL_GT_STEP(gt->i915, 0, STEP_C0))
 		wa_write_or(wal,
 			    GAMT_CHKN_BIT_REG,
 			    GAMT_CHKN_DISABLE_DYNAMIC_CREDIT_SHARING);
@@ -943,15 +943,15 @@ kbl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-glk_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+glk_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen9_gt_workarounds_init(i915, wal);
+	gen9_gt_workarounds_init(gt, wal);
 }
 
 static void
-cfl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+cfl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen9_gt_workarounds_init(i915, wal);
+	gen9_gt_workarounds_init(gt, wal);
 
 	/* WaDisableGafsUnitClkGating:cfl */
 	wa_write_or(wal,
@@ -976,21 +976,21 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
 	wa_write_clr_set(wal, steering_reg, mcr_mask, mcr);
 }
 
-static void __add_mcr_wa(struct drm_i915_private *i915, struct i915_wa_list *wal,
+static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
 			 unsigned int slice, unsigned int subslice)
 {
-	drm_dbg(&i915->drm, "MCR slice=0x%x, subslice=0x%x\n", slice, subslice);
+	drm_dbg(&gt->i915->drm, "MCR slice=0x%x, subslice=0x%x\n", slice, subslice);
 
 	__set_mcr_steering(wal, GEN8_MCR_SELECTOR, slice, subslice);
 }
 
 static void
-icl_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
+icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
+	const struct sseu_dev_info *sseu = &gt->info.sseu;
 	unsigned int slice, subslice;
 
-	GEM_BUG_ON(GRAPHICS_VER(i915) < 11);
+	GEM_BUG_ON(GRAPHICS_VER(gt->i915) < 11);
 	GEM_BUG_ON(hweight8(sseu->slice_mask) > 1);
 	slice = 0;
 
@@ -1010,16 +1010,15 @@ icl_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	 * then we can just rely on the default steering and won't need to
 	 * worry about explicitly re-steering L3BANK reads later.
 	 */
-	if (i915->gt.info.l3bank_mask & BIT(subslice))
-		i915->gt.steering_table[L3BANK] = NULL;
+	if (gt->info.l3bank_mask & BIT(subslice))
+		gt->steering_table[L3BANK] = NULL;
 
-	__add_mcr_wa(i915, wal, slice, subslice);
+	__add_mcr_wa(gt, wal, slice, subslice);
 }
 
 static void
 xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	struct drm_i915_private *i915 = gt->i915;
 	const struct sseu_dev_info *sseu = &gt->info.sseu;
 	unsigned long slice, subslice = 0, slice_mask = 0;
 	u64 dss_mask = 0;
@@ -1083,7 +1082,7 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
 	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
 
-	__add_mcr_wa(i915, wal, slice, subslice);
+	__add_mcr_wa(gt, wal, slice, subslice);
 
 	/*
 	 * SQIDI ranges are special because they use different steering
@@ -1099,9 +1098,11 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 }
 
 static void
-icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	icl_wa_init_mcr(i915, wal);
+	struct drm_i915_private *i915 = gt->i915;
+
+	icl_wa_init_mcr(gt, wal);
 
 	/* WaModifyGamTlbPartitioning:icl */
 	wa_write_clr_set(wal,
@@ -1152,10 +1153,9 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
  * the engine-specific workaround list.
  */
 static void
-wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
+wa_14011060649(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct intel_engine_cs *engine;
-	struct intel_gt *gt = &i915->gt;
 	int id;
 
 	for_each_engine(engine, gt, id) {
@@ -1169,22 +1169,23 @@ wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-gen12_gt_workarounds_init(struct drm_i915_private *i915,
-			  struct i915_wa_list *wal)
+gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	icl_wa_init_mcr(i915, wal);
+	icl_wa_init_mcr(gt, wal);
 
 	/* Wa_14011060649:tgl,rkl,dg1,adl-s,adl-p */
-	wa_14011060649(i915, wal);
+	wa_14011060649(gt, wal);
 
 	/* Wa_14011059788:tgl,rkl,adl-s,dg1,adl-p */
 	wa_write_or(wal, GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE);
 }
 
 static void
-tgl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen12_gt_workarounds_init(i915, wal);
+	struct drm_i915_private *i915 = gt->i915;
+
+	gen12_gt_workarounds_init(gt, wal);
 
 	/* Wa_1409420604:tgl */
 	if (IS_TGL_UY_GT_STEP(i915, STEP_A0, STEP_B0))
@@ -1205,9 +1206,11 @@ tgl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-dg1_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	gen12_gt_workarounds_init(i915, wal);
+	struct drm_i915_private *i915 = gt->i915;
+
+	gen12_gt_workarounds_init(gt, wal);
 
 	/* Wa_1607087056:dg1 */
 	if (IS_DG1_GT_STEP(i915, STEP_A0, STEP_B0))
@@ -1229,60 +1232,62 @@ dg1_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 }
 
 static void
-xehpsdv_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	xehp_init_mcr(&i915->gt, wal);
+	xehp_init_mcr(gt, wal);
 }
 
 static void
-gt_init_workarounds(struct drm_i915_private *i915, struct i915_wa_list *wal)
+gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
+	struct drm_i915_private *i915 = gt->i915;
+
 	if (IS_XEHPSDV(i915))
-		xehpsdv_gt_workarounds_init(i915, wal);
+		xehpsdv_gt_workarounds_init(gt, wal);
 	else if (IS_DG1(i915))
-		dg1_gt_workarounds_init(i915, wal);
+		dg1_gt_workarounds_init(gt, wal);
 	else if (IS_TIGERLAKE(i915))
-		tgl_gt_workarounds_init(i915, wal);
+		tgl_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 12)
-		gen12_gt_workarounds_init(i915, wal);
+		gen12_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 11)
-		icl_gt_workarounds_init(i915, wal);
+		icl_gt_workarounds_init(gt, wal);
 	else if (IS_COFFEELAKE(i915) || IS_COMETLAKE(i915))
-		cfl_gt_workarounds_init(i915, wal);
+		cfl_gt_workarounds_init(gt, wal);
 	else if (IS_GEMINILAKE(i915))
-		glk_gt_workarounds_init(i915, wal);
+		glk_gt_workarounds_init(gt, wal);
 	else if (IS_KABYLAKE(i915))
-		kbl_gt_workarounds_init(i915, wal);
+		kbl_gt_workarounds_init(gt, wal);
 	else if (IS_BROXTON(i915))
-		gen9_gt_workarounds_init(i915, wal);
+		gen9_gt_workarounds_init(gt, wal);
 	else if (IS_SKYLAKE(i915))
-		skl_gt_workarounds_init(i915, wal);
+		skl_gt_workarounds_init(gt, wal);
 	else if (IS_HASWELL(i915))
-		hsw_gt_workarounds_init(i915, wal);
+		hsw_gt_workarounds_init(gt, wal);
 	else if (IS_VALLEYVIEW(i915))
-		vlv_gt_workarounds_init(i915, wal);
+		vlv_gt_workarounds_init(gt, wal);
 	else if (IS_IVYBRIDGE(i915))
-		ivb_gt_workarounds_init(i915, wal);
+		ivb_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 6)
-		snb_gt_workarounds_init(i915, wal);
+		snb_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 5)
-		ilk_gt_workarounds_init(i915, wal);
+		ilk_gt_workarounds_init(gt, wal);
 	else if (IS_G4X(i915))
-		g4x_gt_workarounds_init(i915, wal);
+		g4x_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) == 4)
-		gen4_gt_workarounds_init(i915, wal);
+		gen4_gt_workarounds_init(gt, wal);
 	else if (GRAPHICS_VER(i915) <= 8)
 		;
 	else
 		MISSING_CASE(GRAPHICS_VER(i915));
 }
 
-void intel_gt_init_workarounds(struct drm_i915_private *i915)
+void intel_gt_init_workarounds(struct intel_gt *gt)
 {
-	struct i915_wa_list *wal = &i915->gt_wa_list;
+	struct i915_wa_list *wal = &gt->wa_list;
 
 	wa_init_start(wal, "GT", "global");
-	gt_init_workarounds(i915, wal);
+	gt_init_workarounds(gt, wal);
 	wa_init_finish(wal);
 }
 
@@ -1353,7 +1358,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 
 void intel_gt_apply_workarounds(struct intel_gt *gt)
 {
-	wa_list_apply(gt, &gt->i915->gt_wa_list);
+	wa_list_apply(gt, &gt->wa_list);
 }
 
 static bool wa_list_verify(struct intel_gt *gt,
@@ -1385,7 +1390,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 
 bool intel_gt_verify_workarounds(struct intel_gt *gt, const char *from)
 {
-	return wa_list_verify(gt, &gt->i915->gt_wa_list, from);
+	return wa_list_verify(gt, &gt->wa_list, from);
 }
 
 __maybe_unused
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.h b/drivers/gpu/drm/i915/gt/intel_workarounds.h
index 15abb68b6c00..9beaab77c7f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.h
@@ -24,7 +24,7 @@ static inline void intel_wa_list_free(struct i915_wa_list *wal)
 void intel_engine_init_ctx_wa(struct intel_engine_cs *engine);
 int intel_engine_emit_ctx_wa(struct i915_request *rq);
 
-void intel_gt_init_workarounds(struct drm_i915_private *i915);
+void intel_gt_init_workarounds(struct intel_gt *gt);
 void intel_gt_apply_workarounds(struct intel_gt *gt);
 bool intel_gt_verify_workarounds(struct intel_gt *gt, const char *from);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index e623ac45f4aa..962e91ba3be4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -66,7 +66,7 @@ reference_lists_init(struct intel_gt *gt, struct wa_lists *lists)
 	memset(lists, 0, sizeof(*lists));
 
 	wa_init_start(&lists->gt_wa_list, "GT_REF", "global");
-	gt_init_workarounds(gt->i915, &lists->gt_wa_list);
+	gt_init_workarounds(gt, &lists->gt_wa_list);
 	wa_init_finish(&lists->gt_wa_list);
 
 	for_each_engine(engine, gt, id) {
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 59fb4c710c8c..3cf61bead2f6 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -588,8 +588,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	pci_set_master(pdev);
 
-	intel_gt_init_workarounds(dev_priv);
-
 	/* On the 945G/GM, the chipset reports the MSI capability on the
 	 * integrated graphics even though the support isn't actually there
 	 * according to the published specs.  It doesn't appear to function
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 37c1ca266bcd..93c23eaf3fc7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -998,8 +998,6 @@ struct drm_i915_private {
 
 	struct list_head global_obj_list;
 
-	struct i915_wa_list gt_wa_list;
-
 	struct i915_frontbuffer_tracking fb_tracking;
 
 	struct intel_atomic_helper {
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 590efc8b0265..981e383d1a5d 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1139,8 +1139,6 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 {
 	intel_gt_driver_release(&dev_priv->gt);
 
-	intel_wa_list_free(&dev_priv->gt_wa_list);
-
 	intel_uc_cleanup_firmwares(&dev_priv->gt.uc);
 
 	i915_gem_drain_freed_objects(dev_priv);
-- 
2.33.0

