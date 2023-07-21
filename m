Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDB75CE06
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1310E6D3;
	Fri, 21 Jul 2023 16:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC4310E6C6;
 Fri, 21 Jul 2023 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689956195; x=1721492195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RgijOsjPqjEZO4RoqXzHdxLuvxSpRwIoe1DQnT9KAvs=;
 b=BsTLK7JVA2m6bqWOR6QDpcqmU/gZ+3uUK/kXpdwFNTbhwu380qFckOBi
 l3tpdLVTZ4210TCQaJpu6iQfdrlpTqVH+EhGhtiVsBr+fRCzqe2yVemX0
 weDsosBDJJYvx9Xf1B2WAo5aoNs4ZdWPkoBnyqsYgdWBUy3PkhhtxIFDK
 dMsAN4y3bsK/XYdIoeoBp8UJHVQqCNCtrQb6jcMDHBu8AkneXxos+ji5u
 U+4ps3QXAxsiUQAl9Q72MQuzYw21qMILYCCutroGuwEke9u6e9tYPoz7a
 WC38EvYlA3w5ajHXgt9ZnWa5AtY9ytXsztsAuZfNOZ2sXhNtnSHaLlRlV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369730777"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="369730777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718877452"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718877452"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:16:19 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v8 9/9] drm/i915/gt: Support aux invalidation on all engines
Date: Fri, 21 Jul 2023 18:15:14 +0200
Message-Id: <20230721161514.818895-10-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230721161514.818895-1-andi.shyti@linux.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perform some refactoring with the purpose of keeping in one
single place all the operations around the aux table
invalidation.

With this refactoring add more engines where the invalidation
should be performed.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 53 ++++++++++++++----------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +-------
 3 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 6daf7d99700e0..d33462387d1c6 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -178,9 +178,36 @@ static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
 	return !HAS_FLAT_CCS(engine->i915);
 }
 
-u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
+static i915_reg_t gen12_get_aux_inv_reg(struct intel_engine_cs *engine)
+{
+	if (!gen12_needs_ccs_aux_inv(engine))
+		return INVALID_MMIO_REG;
+
+	switch (engine->id) {
+	case RCS0:
+		return GEN12_CCS_AUX_INV;
+	case BCS0:
+		return GEN12_BCS0_AUX_INV;
+	case VCS0:
+		return GEN12_VD0_AUX_INV;
+	case VCS2:
+		return GEN12_VD2_AUX_INV;
+	case VECS0:
+		return GEN12_VE0_AUX_INV;
+	case CCS0:
+		return GEN12_CCS0_AUX_INV;
+	default:
+		return INVALID_MMIO_REG;
+	}
+}
+
+u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
 {
-	u32 gsi_offset = gt->uncore->gsi_offset;
+	i915_reg_t inv_reg = gen12_get_aux_inv_reg(engine);
+	u32 gsi_offset = engine->gt->uncore->gsi_offset;
+
+	if (i915_mmio_reg_valid(inv_reg))
+		return cs;
 
 	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
 	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
@@ -322,11 +349,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
 
-		if (gen12_needs_ccs_aux_inv(rq->engine)) {
-			/* hsdes: 1809175790 */
-			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
-						      GEN12_CCS_AUX_INV);
-		}
+		cs = gen12_emit_aux_table_inv(engine, cs);
 
 		*cs++ = preparser_disable(false);
 		intel_ring_advance(rq, cs);
@@ -337,7 +360,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 {
-	intel_engine_mask_t aux_inv = 0;
 	u32 cmd_flush = 0;
 	u32 cmd = 4;
 	u32 *cs;
@@ -345,15 +367,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE)
 		cmd += 2;
 
-	if (gen12_needs_ccs_aux_inv(rq->engine))
-		aux_inv = rq->engine->mask &
-			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
-
 	/*
 	 * On Aux CCS platforms the invalidation of the Aux
 	 * table requires quiescing memory traffic beforehand
 	 */
-	if (aux_inv) {
+	if (gen12_needs_ccs_aux_inv(rq->engine)) {
 		cmd += 8; /* for the AUX invalidation */
 		cmd += 2; /* for the engine quiescing */
 
@@ -396,14 +414,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0; /* upper addr */
 	*cs++ = 0; /* value */
 
-	if (aux_inv) { /* hsdes: 1809175790 */
-		if (rq->engine->class == VIDEO_DECODE_CLASS)
-			cs = gen12_emit_aux_table_inv(rq->engine->gt,
-						      cs, GEN12_VD0_AUX_INV);
-		else
-			cs = gen12_emit_aux_table_inv(rq->engine->gt,
-						      cs, GEN12_VE0_AUX_INV);
-	}
+	cs = gen12_emit_aux_table_inv(rq->engine, cs);
 
 	if (mode & EMIT_INVALIDATE)
 		*cs++ = preparser_disable(false);
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
index a44eda096557c..867ba697aceb8 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
@@ -13,6 +13,7 @@
 #include "intel_gt_regs.h"
 #include "intel_gpu_commands.h"
 
+struct intel_engine_cs;
 struct intel_gt;
 struct i915_request;
 
@@ -46,7 +47,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 
-u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg);
+u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs);
 
 static inline u32 *
 __gen8_emit_pipe_control(u32 *batch, u32 bit_group_0,
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 235f3fab60a98..119deb9f938c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1371,10 +1371,7 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 	    IS_DG2_G11(ce->engine->i915))
 		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
 
-	/* hsdes: 1809175790 */
-	if (!HAS_FLAT_CCS(ce->engine->i915))
-		cs = gen12_emit_aux_table_inv(ce->engine->gt,
-					      cs, GEN12_CCS_AUX_INV);
+	cs = gen12_emit_aux_table_inv(ce->engine, cs);
 
 	/* Wa_16014892111 */
 	if (IS_MTL_GRAPHICS_STEP(ce->engine->i915, M, STEP_A0, STEP_B0) ||
@@ -1399,17 +1396,7 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
 						    PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE,
 						    0);
 
-	/* hsdes: 1809175790 */
-	if (!HAS_FLAT_CCS(ce->engine->i915)) {
-		if (ce->engine->class == VIDEO_DECODE_CLASS)
-			cs = gen12_emit_aux_table_inv(ce->engine->gt,
-						      cs, GEN12_VD0_AUX_INV);
-		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
-			cs = gen12_emit_aux_table_inv(ce->engine->gt,
-						      cs, GEN12_VE0_AUX_INV);
-	}
-
-	return cs;
+	return gen12_emit_aux_table_inv(ce->engine, cs);
 }
 
 static void
-- 
2.40.1

