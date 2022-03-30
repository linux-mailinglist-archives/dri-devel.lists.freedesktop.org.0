Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4815D4ED010
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5093D10E8EF;
	Wed, 30 Mar 2022 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E426810E1CF;
 Wed, 30 Mar 2022 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682955; x=1680218955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4WUFV2oAhg27UYK3r/zL8EIBu+Syf3HyEu0evmQFJms=;
 b=HScHKm0yC9dTOZSHHR2e2salxZ80WYRpWHSgjOk2n8ppGhukKsWPpZcL
 whIhZysFqSPH1PFwvt9A2CO9w01mWundfA+F5o41sdqvP+/X4IWDfMXXa
 SoH0nAxqjPPAfMzR8oGI7210sxpQHeWpUKwVLna1577005x9LUqxL1yfw
 EaI0ZqXhXvY06XSDkmOZQiDCezOVTNWOdAFxtbPMXxBE1d6JYd6J4W1Dv
 PeylHug/t3js/Pwbm+zez91bF5vutDGfGpm+2CoqdrXGaQ4ij3vT/kvZg
 eK7ci4BCFPvGgz6eUNanXA4x8a6XycbKcYQ5MbNn18zb0ugdzIT9wIo2p Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582503"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582503"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547051983"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/15] drm/i915/gen8: Create separate reg definitions for new
 MCR registers
Date: Wed, 30 Mar 2022 16:28:44 -0700
Message-Id: <20220330232858.3204283-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  8 +++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++++++++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 22 +++++++++----------
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |  2 +-
 drivers/gpu/drm/i915/intel_pm.c               | 10 ++++-----
 8 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 98b61ff13c95..ad9e7e55ce17 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1367,19 +1367,19 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 			for_each_instdone_gslice_dss_xehp(i915, sseu, iter, slice, subslice) {
 				instdone->sampler[slice][subslice] =
 					read_subslice_reg(engine, slice, subslice,
-							  GEN7_SAMPLER_INSTDONE);
+							  GEN8_SAMPLER_INSTDONE);
 				instdone->row[slice][subslice] =
 					read_subslice_reg(engine, slice, subslice,
-							  GEN7_ROW_INSTDONE);
+							  GEN8_ROW_INSTDONE);
 			}
 		} else {
 			for_each_instdone_slice_subslice(i915, sseu, slice, subslice) {
 				instdone->sampler[slice][subslice] =
 					read_subslice_reg(engine, slice, subslice,
-							  GEN7_SAMPLER_INSTDONE);
+							  GEN8_SAMPLER_INSTDONE);
 				instdone->row[slice][subslice] =
 					read_subslice_reg(engine, slice, subslice,
-							  GEN7_ROW_INSTDONE);
+							  GEN8_ROW_INSTDONE);
 			}
 		}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 17432b075d97..08309745d461 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -622,6 +622,9 @@
 
 #define GEN7_MISCCPCTL				_MMIO(0x9424)
 #define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
+
+#define GEN8_MISCCPCTL				_MMIO(0x9424)
+#define   GEN8_DOP_CLOCK_GATE_ENABLE		(1 << 0)
 #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
 #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
 #define   GEN8_DOP_CLOCK_GATE_MEDIA_ENABLE	(1 << 6)
@@ -1009,18 +1012,22 @@
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
@@ -1068,6 +1075,8 @@
 #define   DISABLE_EARLY_EOT			REG_BIT(1)
 
 #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
+
+#define GEN8_ROW_CHICKEN2			_MMIO(0xe4f4)
 #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
 #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
 #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 29c8cd0a81b6..608ed833307f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -294,10 +294,10 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
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
@@ -385,7 +385,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
 	    IS_KABYLAKE(i915) ||
 	    IS_COFFEELAKE(i915) ||
 	    IS_COMETLAKE(i915))
-		wa_masked_en(wal, HALF_SLICE_CHICKEN3,
+		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
 			     GEN8_SAMPLER_POWER_BYPASS_DIS);
 
 	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
@@ -489,7 +489,7 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
 			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
 
 	/* WaDisableSbeCacheDispatchPortSharing:kbl */
-	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
 }
 
@@ -513,7 +513,7 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
 		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
 
 	/* WaDisableSbeCacheDispatchPortSharing:cfl */
-	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
 }
 
@@ -2046,7 +2046,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
 		/* Wa_14013392000:dg2_g11 */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
 
 		/* Wa_16011620976:dg2_g11 */
 		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
@@ -2088,7 +2088,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			    DISABLE_128B_EVICTION_COMMAND_UDW);
 
 		/* Wa_22012856258:dg2 */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
 			     GEN12_DISABLE_READ_SUPPRESSION);
 
 		/*
@@ -2184,7 +2184,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
 	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
 		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
 
 		/*
 		 * Wa_1407928979:tgl A*
@@ -2209,7 +2209,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
 	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
 		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
-		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
+		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
 			     GEN12_PUSH_CONST_DEREF_HOLD_DIS);
 
 		/*
@@ -2376,7 +2376,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	if (IS_HASWELL(i915)) {
 		/* WaSampleCChickenBitEnable:hsw */
 		wa_masked_en(wal,
-			     HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
+			     HSW_HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
 
 		wa_masked_dis(wal,
 			      CACHE_MODE_0_GEN7,
@@ -2608,7 +2608,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
 
 		/* Wa_14010449647:xehpsdv */
-		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
 			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
 
 		/* Wa_18011725039:xehpsdv */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index c4e25966d3e9..7f77e9cdaba4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -243,8 +243,8 @@ struct __ext_steer_reg {
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
index 0ee3ecc83234..bad1065a99a7 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2279,7 +2279,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
 	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(HSW_HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
 	/* display */
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index c85bafe7539e..4be07d627941 100644
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
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 641616135955..43a2c95602c0 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -7416,8 +7416,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	u32 val;
 
 	/* WaTempDisableDOPClkGating:bdw */
-	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL);
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl & ~GEN7_DOP_CLOCK_GATE_ENABLE);
+	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
 	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
 	val &= ~L3_PRIO_CREDITS_MASK;
@@ -7431,7 +7431,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
 	 */
 	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
 	udelay(1);
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
 }
 
 static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
@@ -7579,8 +7579,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
 	gen9_init_clock_gating(dev_priv);
 
 	/* WaDisableDopClockGating:skl */
-	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL) &
-		   ~GEN7_DOP_CLOCK_GATE_ENABLE);
+	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
+		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
 
 	/* WAC6entrylatency:skl */
 	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
-- 
2.34.1

