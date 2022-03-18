Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7CF4DE0DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 19:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2965A10E1F7;
	Fri, 18 Mar 2022 18:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4710E281;
 Fri, 18 Mar 2022 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647627260; x=1679163260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QK7NF1CJIbW0JrWoVOPG7UuNSCT74IWBynC5WQ0oTxw=;
 b=l6ZMNBDNKPTjHqIQHUiC7wrJCboW17jCMBAR97mQLlQ176izXiOGEI0Z
 3KI3KFtwlpQq2JiwsfWu0MvEFLmT8wNRiHqBsVljI+kP6LcuDzE3YyFBk
 dkPlpGTB6v+gbXPz3HgPIVaGrtoj/b/7fDXF3EBDfuzAfpWNNBe5qcX7L
 hYHfAKeNNE0ApPjTM41BYajmlAAB4SabCX4/C7pHRerGB6brePuPYor/F
 RUyPwboz6Qyt7eNEF7Z0Gmc18xIp0jBz20Zg6irOCsB2zGswaQ81C7bAY
 Wt4RT/wdiPrUsKhgC/wmhJFLj/6gvyEGTeDliXb3IuYOfc1/+JeM09spP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237138996"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237138996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:14:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="499342829"
Received: from fphy-dev.jf.intel.com (HELO fyang16-desk.jf.intel.com)
 ([134.134.244.167])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:14:19 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Date: Fri, 18 Mar 2022 11:08:25 -0700
Message-Id: <20220318180825.3524125-1-fei.yang@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 44 +++++---------------
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 36148887c699..6e83ac06aaf6 100644
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
@@ -293,10 +269,12 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
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
 
@@ -329,14 +307,12 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
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
+		*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
+		if (rq->engine->class == VIDEO_DECODE_CLASS)
+			*cs++ = i915_mmio_reg_offset(GEN12_VD0_AUX_NV);
+		else
+			*cs++ = i915_mmio_reg_offset(GEN12_VE0_AUX_NV);
+		*cs++ = AUX_INV;
 		*cs++ = MI_NOOP;
 	}
 
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
-- 
2.25.1

