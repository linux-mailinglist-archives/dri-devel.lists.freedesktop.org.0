Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB094CAD9B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929F10E7F5;
	Wed,  2 Mar 2022 18:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BEF10E673;
 Wed,  2 Mar 2022 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646245957; x=1677781957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uNxMkdXedXYfhCk7GZi0r4C60aJYKi2c8AtKE4gWLh8=;
 b=jlQdEH2bTYC9KXUN+To4kh7mGBFqwOIolJJ3R3BIb5X3DpayeOYiOfUQ
 aylnEZq7bb+dBOJvmXDvBjPW+KbjJlJyO3/NRosjOz9Z3dYsSoG7/v2TX
 STEaX78TLwKsfCSuYNOCFAPLL1EywID1Iot/PsnnfXsBXeN0+rnJ0r9nZ
 mAWgnEW+Rn9+Lwd3kGYHs1LG3MZnvBDM6KccjDpOOkpwB3HrmE+4vGMq9
 cBVHvfWyyRtkbPSkYikn4Jr/g45V1zMFT8nCZciYZvNgA3HJI9S4M55Ry
 hs5Rb6pBkvbmMTtfG+HFU/KVS34gCSLV0n8J5EnhyKZ/hU3l2m2ajIKcO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="278149410"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="278149410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 10:32:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="576203855"
Received: from fphy-dev.jf.intel.com (HELO fyang16-desk.jf.intel.com)
 ([134.134.244.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 10:32:35 -0800
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Date: Wed,  2 Mar 2022 10:26:57 -0800
Message-Id: <20220302182657.1483623-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

GPU hangs have been observed when multiple engines write to the
same aux_inv register at the same time. To avoid this each engine
should only invalidate its own auxiliary table. The function
gen12_emit_flush_xcs() currently invalidate the auxiliary table for
all engines because the rq->engine is not necessarily the engine
eventually carrying out the request, and potentially the engine
could even be a virtual one (with engine->instance being -1).
With this patch, auxiliary table invalidation is done only for the
engine executing the request. And the mmio address for the aux_inv
register is set after the engine instance becomes certain.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 41 ++++---------------
 .../drm/i915/gt/intel_execlists_submission.c  | 38 +++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  2 +
 3 files changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index b1b9c3fd7bf9..af62e2bc2c9b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -165,30 +165,6 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | 1 << 8 | state;
 }
 
-static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
-{
-	static const i915_reg_t vd[] = {
-		GEN12_VD0_AUX_NV,
-		GEN12_VD1_AUX_NV,
-		GEN12_VD2_AUX_NV,
-		GEN12_VD3_AUX_NV,
-	};
-
-	static const i915_reg_t ve[] = {
-		GEN12_VE0_AUX_NV,
-		GEN12_VE1_AUX_NV,
-	};
-
-	if (engine->class == VIDEO_DECODE_CLASS)
-		return vd[engine->instance];
-
-	if (engine->class == VIDEO_ENHANCEMENT_CLASS)
-		return ve[engine->instance];
-
-	GEM_BUG_ON("unknown aux_inv reg\n");
-	return INVALID_MMIO_REG;
-}
-
 static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
 {
 	*cs++ = MI_LOAD_REGISTER_IMM(1);
@@ -288,7 +264,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE)
 		aux_inv = rq->engine->mask & ~BIT(BCS0);
 	if (aux_inv)
-		cmd += 2 * hweight32(aux_inv) + 2;
+		cmd += 4;
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
@@ -319,16 +295,13 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	*cs++ = 0; /* value */
 
 	if (aux_inv) { /* hsdes: 1809175790 */
-		struct intel_engine_cs *engine;
-		unsigned int tmp;
-
-		*cs++ = MI_LOAD_REGISTER_IMM(hweight32(aux_inv));
-		for_each_engine_masked(engine, rq->engine->gt, aux_inv, tmp) {
-			*cs++ = i915_mmio_reg_offset(aux_inv_reg(engine));
-			*cs++ = AUX_INV;
-		}
+		*cs++ = MI_LOAD_REGISTER_IMM(1);
+		rq->vd_ve_aux_inv = cs;
+		*cs++ = 0; /* address to be set at submission to HW */
+		*cs++ = AUX_INV;
 		*cs++ = MI_NOOP;
-	}
+	} else
+		rq->vd_ve_aux_inv = NULL;
 
 	if (mode & EMIT_INVALIDATE)
 		*cs++ = preparser_disable(false);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 1c602d4ae297..a018de6dcac5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1258,6 +1258,34 @@ static bool completed(const struct i915_request *rq)
 	return __i915_request_is_complete(rq);
 }
 
+static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
+{
+	static const i915_reg_t vd[] = {
+		GEN12_VD0_AUX_NV,
+		GEN12_VD1_AUX_NV,
+		GEN12_VD2_AUX_NV,
+		GEN12_VD3_AUX_NV,
+	};
+
+	static const i915_reg_t ve[] = {
+		GEN12_VE0_AUX_NV,
+		GEN12_VE1_AUX_NV,
+	};
+
+	if (engine->class == VIDEO_DECODE_CLASS) {
+		GEM_BUG_ON(engine->instance >= ARRAY_SIZE(vd));
+		return vd[engine->instance];
+	}
+
+	if (engine->class == VIDEO_ENHANCEMENT_CLASS) {
+		GEM_BUG_ON(engine->instance >= ARRAY_SIZE(ve));
+		return ve[engine->instance];
+	}
+
+	GEM_BUG_ON("unknown aux_inv reg\n");
+	return INVALID_MMIO_REG;
+}
+
 static void execlists_dequeue(struct intel_engine_cs *engine)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
@@ -1538,6 +1566,16 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			}
 
 			if (__i915_request_submit(rq)) {
+				/* hsdes: 1809175790 */
+				if ((GRAPHICS_VER(engine->i915) == 12) &&
+				    rq->vd_ve_aux_inv &&
+				    (engine->class == VIDEO_DECODE_CLASS ||
+				     engine->class == VIDEO_ENHANCEMENT_CLASS)) {
+					*rq->vd_ve_aux_inv = i915_mmio_reg_offset
+						(aux_inv_reg(engine));
+					rq->vd_ve_aux_inv = NULL;
+					rq->execution_mask = engine->mask;
+				}
 				if (!merge) {
 					*port++ = i915_request_get(last);
 					last = NULL;
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..69de32e5e15d 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -350,6 +350,8 @@ struct i915_request {
 		struct list_head link;
 		unsigned long delay;
 	} mock;)
+
+	u32 *vd_ve_aux_inv;
 };
 
 #define I915_FENCE_GFP (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
-- 
2.25.1

