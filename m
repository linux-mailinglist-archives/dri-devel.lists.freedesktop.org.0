Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6F443868
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 23:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254BA738E6;
	Tue,  2 Nov 2021 22:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A663738E1;
 Tue,  2 Nov 2021 22:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231633864"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="231633864"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 15:25:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="599673054"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 15:25:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/xehpsdv: Add initial workarounds
Date: Tue,  2 Nov 2021 15:25:09 -0700
Message-Id: <20211102222511.534310-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102222511.534310-1-matthew.d.roper@intel.com>
References: <20211102222511.534310-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

Add the initial set of workarounds for Xe_HP SDV.

There are some additional workarounds specific to the compute engines
that we're holding back for now.  Those will be added later, after
general compute engine support lands.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 94 ++++++++++++++++++---
 drivers/gpu/drm/i915/i915_reg.h             | 53 ++++++++++++
 drivers/gpu/drm/i915/intel_pm.c             | 12 ++-
 3 files changed, 146 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 45936f624a1e..4aaa210fc003 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -730,7 +730,9 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 	if (engine->class != RENDER_CLASS)
 		goto done;
 
-	if (IS_DG1(i915))
+	if (IS_XEHPSDV(i915))
+		; /* noop; none at this time */
+	else if (IS_DG1(i915))
 		dg1_ctx_workarounds_init(engine, wal);
 	else if (GRAPHICS_VER(i915) == 12)
 		gen12_ctx_workarounds_init(engine, wal);
@@ -1277,7 +1279,68 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
+	struct drm_i915_private *i915 = gt->i915;
+
 	xehp_init_mcr(gt, wal);
+
+	/* Wa_1409757795:xehpsdv */
+	wa_write_or(wal, SCCGCTL94DC, CG3DDISURB);
+
+	/* Wa_18011725039:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
+		wa_masked_dis(wal, MLTICTXCTL, TDONRENDER);
+		wa_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
+	}
+
+	/* Wa_16011155590:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
+		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
+			    TSGUNIT_CLKGATE_DIS);
+
+	/* Wa_14011780169:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_B0, STEP_FOREVER)) {
+		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
+			    GAMTLBVDBOX7_CLKGATE_DIS |
+			    GAMTLBVDBOX6_CLKGATE_DIS |
+			    GAMTLBVDBOX5_CLKGATE_DIS |
+			    GAMTLBVDBOX4_CLKGATE_DIS |
+			    GAMTLBVDBOX3_CLKGATE_DIS |
+			    GAMTLBVDBOX2_CLKGATE_DIS |
+			    GAMTLBVDBOX1_CLKGATE_DIS |
+			    GAMTLBVDBOX0_CLKGATE_DIS |
+			    GAMTLBKCR_CLKGATE_DIS |
+			    GAMTLBGUC_CLKGATE_DIS |
+			    GAMTLBBLT_CLKGATE_DIS);
+		wa_write_or(wal, UNSLCGCTL9444, GAMTLBGFXA0_CLKGATE_DIS |
+			    GAMTLBGFXA1_CLKGATE_DIS |
+			    GAMTLBCOMPA0_CLKGATE_DIS |
+			    GAMTLBCOMPA1_CLKGATE_DIS |
+			    GAMTLBCOMPB0_CLKGATE_DIS |
+			    GAMTLBCOMPB1_CLKGATE_DIS |
+			    GAMTLBCOMPC0_CLKGATE_DIS |
+			    GAMTLBCOMPC1_CLKGATE_DIS |
+			    GAMTLBCOMPD0_CLKGATE_DIS |
+			    GAMTLBCOMPD1_CLKGATE_DIS |
+			    GAMTLBMERT_CLKGATE_DIS   |
+			    GAMTLBVEBOX3_CLKGATE_DIS |
+			    GAMTLBVEBOX2_CLKGATE_DIS |
+			    GAMTLBVEBOX1_CLKGATE_DIS |
+			    GAMTLBVEBOX0_CLKGATE_DIS);
+	}
+
+	/* Wa_14012362059:xehpsdv */
+	wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
+
+	/* Wa_16012725990:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_FOREVER))
+		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE, VFUNIT_CLKGATE_DIS);
+
+	/* Wa_14011060649:xehpsdv */
+	wa_14011060649(gt, wal);
+
+	/* Wa_14014368820:xehpsdv */
+	wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
+		    GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1559,7 +1622,7 @@ static void cfl_whitelist_build(struct intel_engine_cs *engine)
 			  RING_FORCE_TO_NONPRIV_RANGE_4);
 }
 
-static void cml_whitelist_build(struct intel_engine_cs *engine)
+static void allow_read_ctx_timestamp(struct intel_engine_cs *engine)
 {
 	struct i915_wa_list *w = &engine->whitelist;
 
@@ -1567,6 +1630,11 @@ static void cml_whitelist_build(struct intel_engine_cs *engine)
 		whitelist_reg_ext(w,
 				  RING_CTX_TIMESTAMP(engine->mmio_base),
 				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
+}
+
+static void cml_whitelist_build(struct intel_engine_cs *engine)
+{
+	allow_read_ctx_timestamp(engine);
 
 	cfl_whitelist_build(engine);
 }
@@ -1575,6 +1643,8 @@ static void icl_whitelist_build(struct intel_engine_cs *engine)
 {
 	struct i915_wa_list *w = &engine->whitelist;
 
+	allow_read_ctx_timestamp(engine);
+
 	switch (engine->class) {
 	case RENDER_CLASS:
 		/* WaAllowUMDToModifyHalfSliceChicken7:icl */
@@ -1610,15 +1680,9 @@ static void icl_whitelist_build(struct intel_engine_cs *engine)
 		/* hucStatus2RegOffset */
 		whitelist_reg_ext(w, _MMIO(0x23B0 + engine->mmio_base),
 				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
-		whitelist_reg_ext(w,
-				  RING_CTX_TIMESTAMP(engine->mmio_base),
-				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
 		break;
 
 	default:
-		whitelist_reg_ext(w,
-				  RING_CTX_TIMESTAMP(engine->mmio_base),
-				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
 		break;
 	}
 }
@@ -1627,6 +1691,8 @@ static void tgl_whitelist_build(struct intel_engine_cs *engine)
 {
 	struct i915_wa_list *w = &engine->whitelist;
 
+	allow_read_ctx_timestamp(engine);
+
 	switch (engine->class) {
 	case RENDER_CLASS:
 		/*
@@ -1650,9 +1716,6 @@ static void tgl_whitelist_build(struct intel_engine_cs *engine)
 		whitelist_reg(w, HIZ_CHICKEN);
 		break;
 	default:
-		whitelist_reg_ext(w,
-				  RING_CTX_TIMESTAMP(engine->mmio_base),
-				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
 		break;
 	}
 }
@@ -1671,6 +1734,11 @@ static void dg1_whitelist_build(struct intel_engine_cs *engine)
 				  RING_FORCE_TO_NONPRIV_ACCESS_RD);
 }
 
+static void xehpsdv_whitelist_build(struct intel_engine_cs *engine)
+{
+	allow_read_ctx_timestamp(engine);
+}
+
 void intel_engine_init_whitelist(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
@@ -1678,7 +1746,9 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
 
 	wa_init_start(w, "whitelist", engine->name);
 
-	if (IS_DG1(i915))
+	if (IS_XEHPSDV(i915))
+		xehpsdv_whitelist_build(engine);
+	else if (IS_DG1(i915))
 		dg1_whitelist_build(engine);
 	else if (GRAPHICS_VER(i915) == 12)
 		tgl_whitelist_build(engine);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index b456920555b7..b806ad4bdeca 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -498,6 +498,13 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ECOBITS_PPGTT_CACHE64B	(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B		(0 << 8)
 
+#define GEN12_GAMCNTRL_CTRL			_MMIO(0xcf54)
+#define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
+#define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
+
+#define GEN12_MERT_MOD_CTRL		_MMIO(0xcf28)
+#define   FORCE_MISS_FTLB		REG_BIT(3)
+
 #define GAB_CTL				_MMIO(0x24000)
 #define   GAB_CTL_CONT_AFTER_PAGEFAULT	(1 << 8)
 
@@ -2872,6 +2879,15 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   GEN9_PREEMPT_GPGPU_SYNC_SWITCH_DISABLE (1 << 2)
 #define   GEN11_ENABLE_32_PLANE_MODE (1 << 7)
 
+#define SCCGCTL94DC		_MMIO(0x94dc)
+#define   CG3DDISURB		REG_BIT(14)
+
+#define MLTICTXCTL		_MMIO(0xb170)
+#define   TDONRENDER		REG_BIT(2)
+
+#define L3SQCREG1_CCS0		_MMIO(0xb200)
+#define   FLUSHALLNONCOH	REG_BIT(5)
+
 /* WaClearTdlStateAckDirtyBits */
 #define GEN8_STATE_ACK		_MMIO(0x20F0)
 #define GEN9_STATE_ACK_SLICE1	_MMIO(0x20F8)
@@ -4280,6 +4296,39 @@ enum {
 /*
  * GEN10 clock gating regs
  */
+
+#define UNSLCGCTL9440			_MMIO(0x9440)
+#define   GAMTLBOACS_CLKGATE_DIS	REG_BIT(28)
+#define   GAMTLBVDBOX5_CLKGATE_DIS	REG_BIT(27)
+#define   GAMTLBVDBOX6_CLKGATE_DIS	REG_BIT(26)
+#define   GAMTLBVDBOX3_CLKGATE_DIS	REG_BIT(24)
+#define   GAMTLBVDBOX4_CLKGATE_DIS	REG_BIT(23)
+#define   GAMTLBVDBOX7_CLKGATE_DIS	REG_BIT(22)
+#define   GAMTLBVDBOX2_CLKGATE_DIS	REG_BIT(21)
+#define   GAMTLBVDBOX0_CLKGATE_DIS	REG_BIT(17)
+#define   GAMTLBKCR_CLKGATE_DIS		REG_BIT(16)
+#define   GAMTLBGUC_CLKGATE_DIS		REG_BIT(15)
+#define   GAMTLBBLT_CLKGATE_DIS		REG_BIT(14)
+#define   GAMTLBVDBOX1_CLKGATE_DIS	REG_BIT(6)
+
+#define UNSLCGCTL9444			_MMIO(0x9444)
+#define   GAMTLBGFXA0_CLKGATE_DIS	REG_BIT(30)
+#define   GAMTLBGFXA1_CLKGATE_DIS	REG_BIT(29)
+#define   GAMTLBCOMPA0_CLKGATE_DIS	REG_BIT(28)
+#define   GAMTLBCOMPA1_CLKGATE_DIS	REG_BIT(27)
+#define   GAMTLBCOMPB0_CLKGATE_DIS	REG_BIT(26)
+#define   GAMTLBCOMPB1_CLKGATE_DIS	REG_BIT(25)
+#define   GAMTLBCOMPC0_CLKGATE_DIS	REG_BIT(24)
+#define   GAMTLBCOMPC1_CLKGATE_DIS	REG_BIT(23)
+#define   GAMTLBCOMPD0_CLKGATE_DIS	REG_BIT(22)
+#define   GAMTLBCOMPD1_CLKGATE_DIS	REG_BIT(21)
+#define   GAMTLBMERT_CLKGATE_DIS	REG_BIT(20)
+#define   GAMTLBVEBOX3_CLKGATE_DIS	REG_BIT(19)
+#define   GAMTLBVEBOX2_CLKGATE_DIS	REG_BIT(18)
+#define   GAMTLBVEBOX1_CLKGATE_DIS	REG_BIT(17)
+#define   GAMTLBVEBOX0_CLKGATE_DIS	REG_BIT(16)
+#define   LTCDD_CLKGATE_DIS		REG_BIT(10)
+
 #define SLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x94d4)
 #define  SARBUNIT_CLKGATE_DIS		(1 << 5)
 #define  RCCUNIT_CLKGATE_DIS		(1 << 7)
@@ -4295,6 +4344,7 @@ enum {
 
 #define UNSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9434)
 #define   VFUNIT_CLKGATE_DIS		REG_BIT(20)
+#define   TSGUNIT_CLKGATE_DIS		REG_BIT(17)
 #define   HSUNIT_CLKGATE_DIS		REG_BIT(8)
 #define   VSUNIT_CLKGATE_DIS		REG_BIT(3)
 
@@ -12474,6 +12524,9 @@ enum skl_power_gate {
 #define GEN12_GSMBASE			_MMIO(0x108100)
 #define GEN12_DSMBASE			_MMIO(0x1080C0)
 
+#define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
+#define   SGR_DIS			REG_BIT(13)
+
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 59adf0ce6719..16fa3306d83d 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -7479,6 +7479,13 @@ static void dg1_init_clock_gating(struct drm_i915_private *dev_priv)
 			   DPT_GATING_DIS);
 }
 
+static void xehpsdv_init_clock_gating(struct drm_i915_private *dev_priv)
+{
+	/* Wa_22010146351:xehpsdv */
+	if (IS_XEHPSDV_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
+		intel_uncore_rmw(&dev_priv->uncore, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
+}
+
 static void cnp_init_clock_gating(struct drm_i915_private *dev_priv)
 {
 	if (!HAS_PCH_CNP(dev_priv))
@@ -7889,6 +7896,7 @@ static const struct drm_i915_clock_gating_funcs platform##_clock_gating_funcs =
 	.init_clock_gating = platform##_init_clock_gating,		\
 }
 
+CG_FUNCS(xehpsdv);
 CG_FUNCS(adlp);
 CG_FUNCS(dg1);
 CG_FUNCS(gen12lp);
@@ -7925,7 +7933,9 @@ CG_FUNCS(nop);
  */
 void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv)
 {
-	if (IS_ALDERLAKE_P(dev_priv))
+	if (IS_XEHPSDV(dev_priv))
+		dev_priv->clock_gating_funcs = &xehpsdv_clock_gating_funcs;
+	else if (IS_ALDERLAKE_P(dev_priv))
 		dev_priv->clock_gating_funcs = &adlp_clock_gating_funcs;
 	else if (IS_DG1(dev_priv))
 		dev_priv->clock_gating_funcs = &dg1_clock_gating_funcs;
-- 
2.33.0

