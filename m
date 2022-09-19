Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC35BD764
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDFD10E19C;
	Mon, 19 Sep 2022 22:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C29510E192;
 Mon, 19 Sep 2022 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626788; x=1695162788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6bSBbgsYvZu/B5eW5XhcOdk02eMTywilTKKg6IUkO3Q=;
 b=nq3cvnDbMJcJDjMu05fozrR4rGP9VoaF8BL6cjNg/7UdFRBQurMDBCI9
 SwH+IhMKZsyf6ChBMRUW9tR5/w9IPUMyPlxGogGw05699Y9k2f21yKKEj
 CPbARHTNVVOWn+Dm3Za0AgHA7T8dOgoQ2JtP/JDsb5GoGDb7jzft3Ti1N
 3t9kV3/MVVTWohg3j/Ui5BTSVibFf1ftwfokE9KRFNfjb9X/kNKaXeG84
 tXRXp9Yw4HEYJ86tI0d37dXsnMm66h6FFR0Ng2DR6hXH20BvpLwzQAzRH
 MxFnKgi86Y7H9OZzFq37QGo68Rwqk5EdOQf7Y3OcbZw7uZfpEaWnMsCNl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286585476"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="286585476"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030759"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/i915/xehp: Create separate reg definitions for new
 MCR registers
Date: Mon, 19 Sep 2022 15:32:49 -0700
Message-Id: <20220919223259.263525-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919223259.263525-1-matthew.d.roper@intel.com>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
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

Starting in Xe_HP, several registers our driver works with have been
converted from singleton registers into replicated registers with
multicast behavior.  Although the registers are still located at the
same MMIO offsets as on previous platforms, let's duplicate the register
definitions in preparation for upcoming patches that will handle
multicast registers in a special manner.

The registers that are now replicated on Xe_HP are:
 * PAT_INDEX (mslice replication)
 * FF_MODE2 (gslice replication)
 * COMMON_SLICE_CHICKEN3 (gslice replication)
 * SLICE_COMMON_ECO_CHICKEN1 (gslice replication)
 * SLICE_UNIT_LEVEL_CLKGATE (gslice replication)
 * LNCFCMOCS (lncf replication)

Bspec: 66534
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 18 ++++++++-----
 drivers/gpu/drm/i915/gt/intel_gtt.c         | 29 ++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_mocs.c        |  5 +++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 ++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |  7 +++--
 5 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index e5a1ea255640..559e3473f14c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -329,6 +329,7 @@
 #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
 
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
+#define XEHP_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
 
 #define XEHP_TILE0_ADDR_RANGE			_MMIO(0x4900)
 #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
@@ -387,7 +388,8 @@
 #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
 #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
 
-#define FF_MODE2				_MMIO(0x6604)
+#define GEN12_FF_MODE2				_MMIO(0x6604)
+#define XEHP_FF_MODE2				_MMIO(0x6604)
 #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
 #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
@@ -442,6 +444,7 @@
 #define GEN8_HDC_CHICKEN1			_MMIO(0x7304)
 
 #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
+#define XEHP_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
 #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
 #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
 #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
@@ -455,10 +458,9 @@
 #define   DISABLE_PIXEL_MASK_CAMMING		(1 << 14)
 
 #define GEN9_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
-#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
-
-#define SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
+#define XEHP_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
+#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
 
 #define GEN9_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + (slice) * 0x4)
 #define GEN10_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + ((slice) / 3) * 0x34 + \
@@ -703,7 +705,8 @@
 #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
-#define SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
+#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
+#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
 #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
 #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
 #define   MSCUNIT_CLKGATE_DIS			(1 << 10)
@@ -718,7 +721,7 @@
 #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
 #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
 
-#define SUBSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9524)
+#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
 #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
 #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
 
@@ -943,7 +946,8 @@
 
 /* MOCS (Memory Object Control State) registers */
 #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
-#define GEN9_LNCFCMOCS_REG_COUNT		32
+#define XEHP_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
+#define LNCFCMOCS_REG_COUNT			32
 
 #define GEN7_L3CNTLREG3				_MMIO(0xb024)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index b67831833c9a..601d89b4feb1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -479,15 +479,26 @@ void gtt_write_workarounds(struct intel_gt *gt)
 
 static void tgl_setup_private_ppat(struct intel_uncore *uncore)
 {
-	/* TGL doesn't support LLC or AGE settings */
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
-	intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
+	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50)) {
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
+	} else {
+		/* TGL doesn't support LLC or AGE settings */
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
+		intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
+	}
 }
 
 static void icl_setup_private_ppat(struct intel_uncore *uncore)
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index c6ebe2781076..06643701bf24 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -608,7 +608,10 @@ static void init_l3cc_table(struct intel_uncore *uncore,
 	u32 l3cc;
 
 	for_each_l3cc(l3cc, table, i)
-		intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
+		if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50))
+			intel_uncore_write_fw(uncore, XEHP_LNCFCMOCS(i), l3cc);
+		else
+			intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
 }
 
 void intel_mocs_init_engine(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index e382cb4c6971..eff5f4f85374 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -572,7 +572,7 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
 	wa_add(wal,
-	       FF_MODE2,
+	       XEHP_FF_MODE2,
 	       FF_MODE2_TDS_TIMER_MASK,
 	       FF_MODE2_TDS_TIMER_128,
 	       0, false);
@@ -599,7 +599,7 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 	 * verification is ignored.
 	 */
 	wa_add(wal,
-	       FF_MODE2,
+	       GEN12_FF_MODE2,
 	       FF_MODE2_TDS_TIMER_MASK,
 	       FF_MODE2_TDS_TIMER_128,
 	       0, false);
@@ -637,7 +637,7 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 	 * to Wa_1608008084.
 	 */
 	wa_add(wal,
-	       FF_MODE2,
+	       GEN12_FF_MODE2,
 	       FF_MODE2_GS_TIMER_MASK,
 	       FF_MODE2_GS_TIMER_224,
 	       0, false);
@@ -670,7 +670,7 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
 
 	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
 		/* Wa_14010469329:dg2_g10 */
-		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
+		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
 			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
 
 		/*
@@ -678,12 +678,12 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
 		 * Wa_22010613112:dg2_g10
 		 * Wa_14010698770:dg2_g10
 		 */
-		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
+		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
 			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
 	}
 
 	/* Wa_16013271637:dg2 */
-	wa_masked_en(wal, SLICE_COMMON_ECO_CHICKEN1,
+	wa_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
 		     MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
 
 	/* Wa_14014947963:dg2 */
@@ -1255,14 +1255,14 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_1406680159:icl,ehl */
 	wa_write_or(wal,
-		    SUBSLICE_UNIT_LEVEL_CLKGATE,
+		    GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
 		    GWUNIT_CLKGATE_DIS);
 
 	/* Wa_1607087056:icl,ehl,jsl */
 	if (IS_ICELAKE(i915) ||
 	    IS_JSL_EHL_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal,
-			    SLICE_UNIT_LEVEL_CLKGATE,
+			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 
 	/*
@@ -1322,7 +1322,7 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_1607087056:tgl also know as BUG:1409180338 */
 	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal,
-			    SLICE_UNIT_LEVEL_CLKGATE,
+			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 
 	/* Wa_1408615072:tgl[a0] */
@@ -1341,7 +1341,7 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_1607087056:dg1 */
 	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal,
-			    SLICE_UNIT_LEVEL_CLKGATE,
+			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 
 	/* Wa_1409420604:dg1 */
@@ -1445,7 +1445,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 			    CG3DDISCFEG_CLKGATE_DIS);
 
 		/* Wa_14011006942:dg2 */
-		wa_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE,
+		wa_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
 			    DSS_ROUTER_CLKGATE_DIS);
 	}
 
@@ -1457,7 +1457,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
 
 		/* Wa_14011371254:dg2_g10 */
-		wa_write_or(wal, SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
+		wa_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
 
 		/* Wa_14011431319:dg2_g10 */
 		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 74cbe8eaf531..7d9f4f57ca95 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -372,8 +372,11 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
 					false);
 
 	/* add in local MOCS registers */
-	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
-		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
+	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
+		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
+			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
+		else
+			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
 
 	return ret ? -1 : 0;
 }
-- 
2.37.3

