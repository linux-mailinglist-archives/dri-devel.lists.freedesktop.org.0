Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E84C743A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FEA10E87B;
	Mon, 28 Feb 2022 17:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD3810E571;
 Mon, 28 Feb 2022 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070187; x=1677606187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJq3z7ir5ZHVZnlZ33MQFq25G8nTG/sUnms86Rs36i0=;
 b=G4ohFH0yPZnbKW5916bQS6pWeDpN3yUaiehgLzmdBaG0wFnDY0Zum5u1
 FgO4LqYyOgfbrPUivTzZ/M21M+2c1iqZeXG//iQ8BMT2vLEBBKuIQ56FF
 1oVempLeDrT/bnnW1GVZrlS/BWFMBQ4Wy2uHmxSU2shS62q9b8aio7Uk9
 sHRv1CxFBMpkKxL4ysRUcTni23qqoKNlkwYYgWyqFKZtmL9EQC80rnW6b
 pIs7ohCaCBQpEs0meuSxHTFow1+HozuDFm3ZiFPsvWAONmydV9WFTZg0v
 QM/LrznMIpI7BTc48V1zLTq8wbb9iQQQ6PzhoJujzc3LLdUM8r4PldxMH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252866894"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="252866894"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392857"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/i915/xehp: Add compute workarounds
Date: Mon, 28 Feb 2022 09:42:44 -0800
Message-Id: <20220228174245.1569581-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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

Additional workarounds are required once we start exposing CCS engines.

Note that we have a number of workarounds that update registers in the
shared render/compute reset domain.  Historically we've just added such
registers to the RCS engine's workaround list.  But going forward we
should be more careful to place such workarounds on a wa_list for an
engine that definitely exists and is not fused off (e.g., a platform
with no RCS would never apply the RCS wa_list).  We'll keep
rcs_engine_wa_init() focused on RCS-specific workarounds that only need
to be applied if the RCS engine is present.  A separate
general_render_compute_wa_init() function will be used to define
workarounds that touch registers in the shared render/compute reset
domain and that we need to apply regardless of what render and/or
compute engines actually exist.  Any workarounds defined in this new
function will internally be added to the first present RCS or CCS
engine's workaround list to ensure they get applied (and only get
applied once rather than being needlessly re-applied several times).

Co-author: Srinivasan Shanmugam
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         |  6 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 47 +++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index e629443e07ae..19cd34f24263 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1060,6 +1060,7 @@
 #define   FLOW_CONTROL_ENABLE			REG_BIT(15)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
+#define   SYSTOLIC_DOP_CLOCK_GATING_DIS		REG_BIT(10)
 #define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	REG_BIT(8)
 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 #define   THROTTLE_12_5				REG_GENMASK(4, 2)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index d333400d29fe..e9ea576b96a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1217,6 +1217,12 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
 	cs = gen12_emit_timestamp_wa(ce, cs);
 	cs = gen12_emit_restore_scratch(ce, cs);
 
+	/* Wa_16013000631:dg2 */
+	if (IS_DG2_GRAPHICS_STEP(ce->engine->i915, G10, STEP_B0, STEP_C0) ||
+	    IS_DG2_G11(ce->engine->i915))
+		if (ce->engine->class == COMPUTE_CLASS)
+			cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
+
 	return cs;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 0471d475e680..0b9435d62808 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1921,6 +1921,11 @@ static void dg2_whitelist_build(struct intel_engine_cs *engine)
 					  RING_FORCE_TO_NONPRIV_RANGE_4);
 
 		break;
+	case COMPUTE_CLASS:
+		/* Wa_16011157294:dg2_g10 */
+		if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0))
+			whitelist_reg(w, GEN9_CTX_PREEMPT_REG);
+		break;
 	default:
 		break;
 	}
@@ -2581,6 +2586,40 @@ xcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	}
 }
 
+/*
+ * The workarounds in this function apply to shared registers in
+ * the general render reset domain that aren't tied to a
+ * specific engine.  Since all render+compute engines get reset
+ * together, and the contents of these registers are lost during
+ * the shared render domain reset, we'll define such workarounds
+ * here and then add them to just a single RCS or CCS engine's
+ * workaround list (whichever engine has the XXXX flag).
+ */
+static void
+general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
+{
+	struct drm_i915_private *i915 = engine->i915;
+
+	if (IS_XEHPSDV(i915)) {
+		/* Wa_1409954639 */
+		wa_masked_en(wal,
+			     GEN8_ROW_CHICKEN,
+			     SYSTOLIC_DOP_CLOCK_GATING_DIS);
+
+		/* Wa_1607196519 */
+		wa_masked_en(wal,
+			     GEN9_ROW_CHICKEN4,
+			     GEN12_DISABLE_GRF_CLEAR);
+
+		/* Wa_14010670810:xehpsdv */
+		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
+
+		/* Wa_14010449647:xehpsdv */
+		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
+			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
+	}
+}
+
 static void
 engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
@@ -2589,6 +2628,14 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 
 	engine_fake_wa_init(engine, wal);
 
+	/*
+	 * These are common workarounds that just need to applied
+	 * to a single RCS/CCS engine's workaround list since
+	 * they're reset as part of the general render domain reset.
+	 */
+	if (engine->class == RENDER_CLASS)
+		general_render_compute_wa_init(engine, wal);
+
 	if (engine->class == RENDER_CLASS)
 		rcs_engine_wa_init(engine, wal);
 	else
-- 
2.34.1

