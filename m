Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA04C5326
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 02:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FEB10ED9E;
	Sat, 26 Feb 2022 01:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D7710ED9E;
 Sat, 26 Feb 2022 01:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645840583; x=1677376583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RkEqp4gAmk68wvf2ftIxdsmrYEQ2gJYGv79n+iuY/5s=;
 b=bCfbo5Ajxc5vZcGpFHy6T+r9wirKQ+iI9UTOhd1avQfK6YsVXQcoXiPz
 YKeBojkwSfL2OQr/r8YqFqzWB5jnir4UTQN1crkw9FcK8B/vJFl9BcsuG
 hGsNDMdpRuU+fIybGleLuOVRTdtKee7V0H03nrRo3ec8jDv/dDJqDQ97T
 i41LxSgdoRCm9c+rDg8Ia2+tWXPB9GAIMsWherrDG728Cl+pH0XHIntWk
 O5idRCPqUWIkSPLYDKiqWFIPB9WwlajYL+tPuDoil+keArXa0GGKR4cLp
 Wl/Ikby2TPfpHXJEPv4on3gCK55vBSaKdlFoEIV4IXE1yWLqqpYmsJ0by w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="232591846"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="232591846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:56:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="549510568"
Received: from fphy-dev.jf.intel.com (HELO fyang16-desk.jf.intel.com)
 ([134.134.244.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:56:23 -0800
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Date: Fri, 25 Feb 2022 17:50:49 -0800
Message-Id: <20220226015049.1379347-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, chris.p.wilson@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

GPU hangs have been observed when multiple engines write to the same aux_inv
register at the same time. To avoid this each engine should only invalidate
its own auxiliary table. The function gen12_emit_flush_xcs() currently
invalidate the auxiliary table for all engines because the rq->engine is not
necessarily the engine eventually carrying out the request, and potentially
the engine could even be a virtual one (with engine->instance being -1).
With this patch, auxiliary table invalidation is done only for the engine
executing the request. And the mmio address for the aux_inv register is set
after the engine instance becomes certain.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 38 +++----------------
 .../drm/i915/gt/intel_execlists_submission.c  | 38 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  2 +
 3 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1f8cf4f790b2..9e39d04f46cc 100644
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
@@ -280,7 +256,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE)
 		aux_inv = rq->engine->mask & ~BIT(BCS0);
 	if (aux_inv)
-		cmd += 2 * hweight32(aux_inv) + 2;
+		cmd += 4;
 
 	cs = intel_ring_begin(rq, cmd);
 	if (IS_ERR(cs))
@@ -311,14 +287,10 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
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
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 961d795220a3..f56726c861b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1253,6 +1253,34 @@ static bool completed(const struct i915_request *rq)
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
@@ -1533,6 +1561,16 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			}
 
 			if (__i915_request_submit(rq)) {
+				/* hsdes: 1809175790 */
+				if (rq->vd_ve_aux_inv &&
+				    (engine->class == VIDEO_DECODE_CLASS ||
+				     engine->class == VIDEO_ENHANCEMENT_CLASS)) {
+					*rq->vd_ve_aux_inv =
+						i915_mmio_reg_offset(
+							aux_inv_reg(engine));
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

