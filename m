Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C55AA49B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 02:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840010E3DE;
	Fri,  2 Sep 2022 00:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1DE10E3D5;
 Fri,  2 Sep 2022 00:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662079676; x=1693615676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZYRiqSEDJvQHQQgnyxataifGY3B6MweRArhlsUedmDM=;
 b=B/MHfDWTe4aRf0CInrGwVmB28zfToyYvjA2I2aJsbgx51eb2pU9WBdpt
 HwT2Rl6J3L6KL55lbz0Nv7a8r12Xi0HFc3vJzrET2taB2DXb5TbKXLc2u
 CBYdi6c3e7VlmIQftXFWqtGgrN7nrcS1m/4OWqevcIbYiqEUwvd6hbJp0
 ofkDfuxrCPit/XuOa3buShmZb6zXbyBsuJGl0i0Muka2rhCNZk76vx7Oi
 4wUF9z3XqRl6YWWAK2CWblsxEFC71o0J3iKqeg6DW2dLVRx9+/V0pDLXL
 eQWeWmDS5wC/iwKRiOZiPuxQQWiktL+rANDSP0DzGpyLNlYexfsay7lxb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278880325"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="278880325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642641422"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/gen8: Create separate reg definitions for new
 MCR registers
Date: Thu,  1 Sep 2022 17:47:34 -0700
Message-Id: <20220902004740.2849371-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902004740.2849371-1-matthew.d.roper@intel.com>
References: <20220902004740.2849371-1-matthew.d.roper@intel.com>
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

Gen8 was the first time our hardware had multicast registers (or at
least the first time the multicast nature was exposed and MMIO accesses
could be steered).  There are some registers that transitioned from
singleton behavior to multicast during the gen7 -> gen8 transition;
let's duplicate the register definitions for those registers in
preparation for upcoming patches that will handle MCR registers in a
special manner.

The registers adjusted are:
 * MISCCPCTL
 * SAMPLER_INSTDONE
 * ROW_INSTDONE
 * ROW_CHICKEN2
 * HALF_SLICE_CHICKEN1
 * HALF_SLICE_CHICKEN3

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++++++++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 22 +++++++++----------
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
 drivers/gpu/drm/i915/intel_pm.c               | 10 ++++-----
 9 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 275ad72940c1..29980bff9c10 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1544,11 +1544,11 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 		for_each_ss_steering(iter, engine->gt, slice, subslice) {
 			instdone->sampler[slice][subslice] =
 				intel_gt_mcr_read(engine->gt,
-						  GEN7_SAMPLER_INSTDONE,
+						  GEN8_SAMPLER_INSTDONE,
 						  slice, subslice);
 			instdone->row[slice][subslice] =
 				intel_gt_mcr_read(engine->gt,
-						  GEN7_ROW_INSTDONE,
+						  GEN8_ROW_INSTDONE,
 						  slice, subslice);
 		}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index d414785003cc..ad8e2b52ff64 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -644,6 +644,9 @@
 
 #define GEN7_MISCCPCTL				_MMIO(0x9424)
 #define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
+
+#define GEN8_MISCCPCTL				_MMIO(0x9424)
+#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
 #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
 #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
 #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
@@ -1063,18 +1066,22 @@
 #define GEN12_GAM_DONE				_MMIO(0xcf68)
 
 #define GEN7_HALF_SLICE_CHICKEN1		_MMIO(0xe100) /* IVB GT1 + VLV */
+#define GEN8_HALF_SLICE_CHICKEN1		_MMIO(0xe100)
 #define   GEN7_MAX_PS_THREAD_DEP		(8 << 12)
 #define   GEN7_SINGLE_SUBSCAN_DISPATCH_ENABLE	(1 << 10)
 #define   GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE	(1 << 4)
 #define   GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE	(1 << 3)
 
 #define GEN7_SAMPLER_INSTDONE			_MMIO(0xe160)
+#define GEN8_SAMPLER_INSTDONE			_MMIO(0xe160)
 #define GEN7_ROW_INSTDONE			_MMIO(0xe164)
+#define GEN8_ROW_INSTDONE			_MMIO(0xe164)
 
 #define HALF_SLICE_CHICKEN2			_MMIO(0xe180)
 #define   GEN8_ST_PO_DISABLE			(1 << 13)
 
-#define HALF_SLICE_CHICKEN3			_MMIO(0xe184)
+#define HSW_HALF_SLICE_CHICKEN3			_MMIO(0xe184)
+#define GEN8_HALF_SLICE_CHICKEN3		_MMIO(0xe184)
 #define   HSW_SAMPLE_C_PERFORMANCE		(1 << 9)
 #define   GEN8_CENTROID_PIXEL_OPT_DIS		(1 << 8)
 #define   GEN9_DISABLE_OCL_OOB_SUPPRESS_LOGIC	(1 << 5)
@@ -1127,6 +1134,8 @@
 #define   DISABLE_EARLY_EOT			REG_BIT(1)
 
 #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
+
+#define GEN8_ROW_CHICKEN2			_MMIO(0xe4f4)
 #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
 #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
 #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 6d2003d598e6..e382cb4c6971 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -295,10 +295,10 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
 	 * Also see the related UCGTCL1 write in bdw_init_clock_gating()
 	 * to disable EUTC clock gating.
 	 */
-	wa_masked_en(wal, GEN7_ROW_CHICKEN2,
+	wa_masked_en(wal, GEN8_ROW_CHICKEN2,
 		     DOP_CLOCK_GATING_DISABLE);
 
-	wa_masked_en(wal, HALF_SLICE_CHICKEN3,
+	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
 		     GEN8_SAMPLER_POWER_BYPASS_DIS);
 
 	wa_masked_en(wal, HDC_CHICKEN0,
@@ -386,7 +386,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
 	    IS_KABYLAKE(i915) ||
 	    IS_COFFEELAKE(i915) ||
 	    IS_COMETLAKE(i915))
-		wa_masked_en(wal, HALF_SLICE_CHICKEN3,
+		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
 			     GEN8_SAMPLER_POWER_BYPASS_DIS);
 
 	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
@@ -490,7 +490,7 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
 			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
 
 	/* WaDisableSbeCacheDispatchPortSharing:kbl */
-	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
 }
 
@@ -514,7 +514,7 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
 		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
 
 	/* WaDisableSbeCacheDispatchPortSharing:cfl */
-	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
 }
 
@@ -2107,7 +2107,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14013392000:dg2_g11 */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
 
 		/* Wa_16011620976:dg2_g11 */
 		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
@@ -2156,7 +2156,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			    DISABLE_128B_EVICTION_COMMAND_UDW);
 
 		/* Wa_22012856258:dg2 */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
 			     GEN12_DISABLE_READ_SUPPRESSION);
 
 		/*
@@ -2253,7 +2253,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
 	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
 		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
 
 		/*
 		 * Wa_1407928979:tgl A*
@@ -2282,7 +2282,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
 	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
 		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
 			     GEN12_PUSH_CONST_DEREF_HOLD_DIS);
 
 		/*
@@ -2449,7 +2449,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_HASWELL(i915)) {
 		/* WaSampleCChickenBitEnable:hsw */
 		wa_masked_en(wal,
-			     HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
+			     HSW_HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
 
 		wa_masked_dis(wal,
 			      CACHE_MODE_0_GEN7,
@@ -2747,7 +2747,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
 
 		/* Wa_14010449647:xehpsdv */
-		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
 
 		/* Wa_18011725039:xehpsdv */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 8f1165146013..9495a7928bc8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -244,8 +244,8 @@ struct __ext_steer_reg {
 };
 
 static const struct __ext_steer_reg xe_extregs[] = {
-	{"GEN7_SAMPLER_INSTDONE", GEN7_SAMPLER_INSTDONE},
-	{"GEN7_ROW_INSTDONE", GEN7_ROW_INSTDONE}
+	{"GEN8_SAMPLER_INSTDONE", GEN8_SAMPLER_INSTDONE},
+	{"GEN8_ROW_INSTDONE", GEN8_ROW_INSTDONE}
 };
 
 static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index a0372735cddb..9229243992c2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -35,7 +35,7 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
 
 	if (GRAPHICS_VER(uncore->i915) == 9) {
 		/* DOP Clock Gating Enable for GuC clocks */
-		intel_uncore_rmw(uncore, GEN7_MISCCPCTL,
+		intel_uncore_rmw(uncore, GEN8_MISCCPCTL,
 				 0, GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
 
 		/* allows for 5us (in 10ns units) before GT can go to RC6 */
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index daac2050d77d..700cc9688f47 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2257,7 +2257,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(HSW_HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
 	/* display */
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 1c6e941c9666..ac58460fb305 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -111,7 +111,7 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
 	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
 	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
 	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
-	{RCS0, HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
+	{RCS0, HSW_HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
 	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
 	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
 	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 8279dc580a3e..638b77d64bf4 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -102,7 +102,7 @@ static int iterate_generic_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(_MMIO(0x2438));
 	MMIO_D(_MMIO(0x243c));
 	MMIO_D(_MMIO(0x7018));
-	MMIO_D(HALF_SLICE_CHICKEN3);
+	MMIO_D(HSW_HALF_SLICE_CHICKEN3);
 	MMIO_D(GEN7_HALF_SLICE_CHICKEN1);
 	/* display */
 	MMIO_F(_MMIO(0x60220), 0x20);
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 210c1f78cc90..d491c708b18d 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -7583,8 +7583,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	/* WaTempDisableDOPClkGating:bdw */
-	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL);
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl & ~GEN7_DOP_CLOCK_GATE_ENABLE);
+	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
 	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
 	val &= ~L3_PRIO_CREDITS_MASK;
@@ -7598,7 +7598,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	 */
 	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
 	udelay(1);
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
 }
 
 static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
@@ -7759,8 +7759,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 	gen9_init_clock_gating(dev_priv);
 
 	/* WaDisableDopClockGating:skl */
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL) &
-		   ~GEN7_DOP_CLOCK_GATE_ENABLE);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
+		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
 	/* WAC6entrylatency:skl */
 	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
-- 
2.37.2

