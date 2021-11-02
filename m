Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F06443866
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 23:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EFC738E0;
	Tue,  2 Nov 2021 22:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B0738E1;
 Tue,  2 Nov 2021 22:25:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231633868"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="231633868"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 15:25:24 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="599673061"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 15:25:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/dg2: Program recommended HW settings
Date: Tue,  2 Nov 2021 15:25:11 -0700
Message-Id: <20211102222511.534310-4-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Siddiqui Ayaz A <ayaz.siddiqui@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bspec's performance guide suggests programming specific values into
a few registers for optimal performance.  Although these aren't
workarounds, it's easiest to handle them inside the GT workaround
functions (which will also ensure that the values set here are properly
melded with other bits in the same registers that _are_ set by
workarounds).

Bspec: 68331, 45395

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Siddiqui Ayaz A <ayaz.siddiqui@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h             |  9 +++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 37fd541a9719..51591119da15 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -558,6 +558,22 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 	wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
 }
 
+/*
+ * These settings aren't actually workarounds, but general tuning settings that
+ * need to be programmed on dg2 platform.
+ */
+static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
+				   struct i915_wa_list *wal)
+{
+	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
+	wa_add(wal,
+	       FF_MODE2,
+	       FF_MODE2_TDS_TIMER_MASK,
+	       FF_MODE2_TDS_TIMER_128,
+	       0, false);
+}
+
 /*
  * These settings aren't actually workarounds, but general tuning settings that
  * need to be programmed on several platforms.
@@ -647,7 +663,7 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
 static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
 				     struct i915_wa_list *wal)
 {
-	gen12_ctx_gt_tuning_init(engine, wal);
+	dg2_ctx_gt_tuning_init(engine, wal);
 
 	/* Wa_16011186671:dg2_g11 */
 	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
@@ -1482,6 +1498,14 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 
 	/* Wa_14014830051:dg2 */
 	wa_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
+
+	/*
+	 * The following are not actually "workarounds" but rather
+	 * recommended tuning settings documented in the bspec's
+	 * performance guide section.
+	 */
+	wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ee39d6bd0f3c..ef3b5732faad 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -731,6 +731,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 
 #define GEN12_OA_TLB_INV_CR _MMIO(0xceec)
 
+#define GEN12_SQCM		_MMIO(0x8724)
+#define   EN_32B_ACCESS		REG_BIT(30)
+
 /* Gen12 OAR unit */
 #define GEN12_OAR_OACONTROL _MMIO(0x2960)
 #define  GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT 1
@@ -8506,6 +8509,12 @@ enum {
 #define  GEN8_LQSC_FLUSH_COHERENT_LINES		(1 << 21)
 #define  GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE REG_BIT(22)
 
+#define GEN11_L3SQCREG5				_MMIO(0xb158)
+#define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
+
+#define XEHP_L3SCQREG7				_MMIO(0xb188)
+#define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
+
 /* GEN8 chicken */
 #define HDC_CHICKEN0				_MMIO(0x7300)
 #define ICL_HDC_MODE				_MMIO(0xE5F4)
-- 
2.33.0

