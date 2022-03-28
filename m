Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582114E9D65
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9A10E729;
	Mon, 28 Mar 2022 17:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7710E260;
 Mon, 28 Mar 2022 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488172; x=1680024172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HfsPiLq0ztSHr3s8CMgV1b/7E5GBr73iPbkBKW7wxVY=;
 b=TZ4e5UkBswwdqzFgt6P6Gr30pjKJnX5Mw6KZXaf9uZj0P1V4ehvglXjZ
 iDAKq4cuMPfNfgGf+9yGGf/vnqVPpsmo0IcEjd/BAdVuk+RGGlk8YNYbW
 099QJ+YEomVA9XFhAeCLwgnf3KAx0NapTA2vyVOohV7rdpKrXb/U0h6sI
 vZFpOj4FffgzFTjpaadlBatdYlHhe0xTWdZgtt9L1wj3SwsXhIC3u9Bgj
 Pj95zCa3gLkEIBjc89SgJ3SYGhjjTBtnReIb3A3Yciz3RQMu3li/t9yJI
 rOBto/O/FyEeTE1X/N8IXwdsMA1VNbPrPFFjPt8alZCGfbVfCyNHxF2Vk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345496453"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="345496453"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:22:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="694438281"
Received: from fphy-dev.jf.intel.com (HELO fyang16-desk.jf.intel.com)
 ([134.134.244.167])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:22:51 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Date: Mon, 28 Mar 2022 10:16:50 -0700
Message-Id: <20220328171650.1900674-1-fei.yang@intel.com>
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
Cc: stuart.summers@intel.com, Fei Yang <fei.yang@intel.com>,
 chris.p.wilson@intel.com, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@intel.com
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
With the MMIO remap feature, we can actually set bit 17 of MI_LRI
instruction and let the hardware to figure out the local aux_inv
register at runtime to avoid invalidating auxiliary table for all
engines.

Bspec: 45728

v2: Invalidate AUX table for indirect context as well.

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 50 +++++---------------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h     |  4 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c          | 12 +++++
 4 files changed, 27 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 36148887c699..047b5a710149 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -6,7 +6,6 @@
 #include "gen8_engine_cs.h"
 #include "i915_drv.h"
 #include "intel_gpu_commands.h"
-#include "intel_gt_regs.h"
 #include "intel_lrc.h"
 #include "intel_ring.h"
 
@@ -165,33 +164,9 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | 1 << 8 | state;
 }
 
-static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
+u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg)
 {
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
-static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
-{
-	*cs++ = MI_LOAD_REGISTER_IMM(1);
+	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
 	*cs++ = i915_mmio_reg_offset(inv_reg);
 	*cs++ = AUX_INV;
 	*cs++ = MI_NOOP;
@@ -274,7 +249,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		if (!HAS_FLAT_CCS(rq->engine->i915)) {
 			/* hsdes: 1809175790 */
-			cs = gen12_emit_aux_table_inv(GEN12_GFX_CCS_AUX_NV, cs);
+			cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
 		}
 
 		*cs++ = preparser_disable(false);
@@ -293,10 +268,12 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode & EMIT_INVALIDATE) {
 		cmd += 2;
 
-		if (!HAS_FLAT_CCS(rq->engine->i915)) {
+		if (!HAS_FLAT_CCS(rq->engine->i915) &&
+		    (rq->engine->class == VIDEO_DECODE_CLASS ||
+		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
 			aux_inv = rq->engine->mask & ~BIT(BCS0);
 			if (aux_inv)
-				cmd += 2 * hweight32(aux_inv) + 2;
+				cmd += 4;
 		}
 	}
 
@@ -329,15 +306,10 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
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
-		*cs++ = MI_NOOP;
+		if (rq->engine->class == VIDEO_DECODE_CLASS)
+			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
+		else
+			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
 	}
 
 	if (mode & EMIT_INVALIDATE)
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
index cc6e21d3662a..107ab42539ab 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
@@ -10,7 +10,7 @@
 #include <linux/types.h>
 
 #include "i915_gem.h" /* GEM_BUG_ON */
-
+#include "intel_gt_regs.h"
 #include "intel_gpu_commands.h"
 
 struct i915_request;
@@ -38,6 +38,8 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
 
+u32 *gen12_emit_aux_table_inv(u32 *cs, const i915_reg_t inv_reg);
+
 static inline u32 *
 __gen8_emit_pipe_control(u32 *batch, u32 flags0, u32 flags1, u32 offset)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index d112ffd56418..4243be030bc1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -144,6 +144,7 @@
 #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
 /* Gen11+. addr = base + (ctx_restore ? offset & GENMASK(12,2) : offset) */
 #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
+#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_FORCE_POSTED		(1<<12)
 #define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
 #define MI_STORE_REGISTER_MEM        MI_INSTR(0x24, 1)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 07bef7128fdb..dffef6ab4baf 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1208,6 +1208,10 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
 	    IS_DG2_G11(ce->engine->i915))
 		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
 
+	/* hsdes: 1809175790 */
+	if (!HAS_FLAT_CCS(ce->engine->i915))
+		cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
+
 	return cs;
 }
 
@@ -1225,6 +1229,14 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
 						    PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE,
 						    0);
 
+	/* hsdes: 1809175790 */
+	if (!HAS_FLAT_CCS(ce->engine->i915)) {
+		if (ce->engine->class == VIDEO_DECODE_CLASS)
+			cs = gen12_emit_aux_table_inv(cs, GEN12_VD0_AUX_NV);
+		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
+			cs = gen12_emit_aux_table_inv(cs, GEN12_VE0_AUX_NV);
+	}
+
 	return cs;
 }
 
-- 
2.25.1

