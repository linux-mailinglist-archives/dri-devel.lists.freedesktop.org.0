Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36F7DA24E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 23:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454E210EA55;
	Fri, 27 Oct 2023 21:18:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375510EA4F;
 Fri, 27 Oct 2023 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698441487; x=1729977487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WfzWSd4V7SZ9hXXlnrWgfIVIDvsKVOPKHcV3VTbxCX4=;
 b=EIN9kM/lxUljNsmZSrKKXLx8WwT5Bycaq7bvzu5fib4288Fc5q+09fES
 zxcWg3W4prRlhieyJyEuGF5fGht3P45I81MQE5toXGE6TAqizyzDwLqHb
 fXXxPZTomZFu+4MJCk86dl65Ggt73T1taKRwCRxVuOuL3b4KrmXC/486o
 zMuns0zsR8XhciaJZIJUEI4lK3B0AsZCRXtmGv9A3tGTzDZSst2kQT98U
 E11K4cUEA8FnQgB0ki2Aapkuc5AOtj1kFJmvZ6m8zX2UMQB9BTrgsGBP9
 1qhjRxudgUQZiNLdjT8kQQuSsksfC8hLRUZ6x9rMMCaDeafMPFvP59qZI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378219020"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="378219020"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 14:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="7336231"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 27 Oct 2023 14:16:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/4] drm/i915: Enable Wa_16019325821
Date: Fri, 27 Oct 2023 14:18:11 -0700
Message-ID: <20231027211814.2696398-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some platforms require holding RCS context switches until CCS is idle
(the reverse w/a of Wa_14014475959). Some platforms require both
versions.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++++-
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 86a04afff64b3..9cccd60a5c41d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -743,21 +743,23 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 }
 
 /* Wa_14014475959:dg2 */
-#define CCS_SEMAPHORE_PPHWSP_OFFSET	0x540
-static u32 ccs_semaphore_offset(struct i915_request *rq)
+/* Wa_16019325821 */
+#define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
+static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
 {
 	return i915_ggtt_offset(rq->context->state) +
-		(LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
+		(LRC_PPHWSP_PN * PAGE_SIZE) + HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET;
 }
 
 /* Wa_14014475959:dg2 */
-static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
+/* Wa_16019325821 */
+static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 {
 	int i;
 
 	*cs++ = MI_ATOMIC_INLINE | MI_ATOMIC_GLOBAL_GTT | MI_ATOMIC_CS_STALL |
 		MI_ATOMIC_MOVE;
-	*cs++ = ccs_semaphore_offset(rq);
+	*cs++ = hold_switchout_semaphore_offset(rq);
 	*cs++ = 0;
 	*cs++ = 1;
 
@@ -773,7 +775,7 @@ static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 		MI_SEMAPHORE_POLL |
 		MI_SEMAPHORE_SAD_EQ_SDD;
 	*cs++ = 0;
-	*cs++ = ccs_semaphore_offset(rq);
+	*cs++ = hold_switchout_semaphore_offset(rq);
 	*cs++ = 0;
 
 	return cs;
@@ -790,8 +792,9 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 		cs = gen12_emit_preempt_busywait(rq, cs);
 
 	/* Wa_14014475959:dg2 */
-	if (intel_engine_uses_wa_hold_ccs_switchout(rq->engine))
-		cs = ccs_emit_wa_busywait(rq, cs);
+	/* Wa_16019325821 */
+	if (intel_engine_uses_wa_hold_switchout(rq->engine))
+		cs = hold_switchout_emit_wa_busywait(rq, cs);
 
 	rq->tail = intel_ring_offset(rq, cs);
 	assert_ring_tail_valid(rq->ring, rq->tail);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 8769760257fd9..f08739d020332 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -584,7 +584,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
-#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
 	unsigned int flags;
 
 	/*
@@ -694,10 +694,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 }
 
 /* Wa_14014475959:dg2 */
+/* Wa_16019325821 */
 static inline bool
-intel_engine_uses_wa_hold_ccs_switchout(struct intel_engine_cs *engine)
+intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
 {
-	return engine->flags & I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
+	return engine->flags & I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 }
 
 #endif /* __INTEL_ENGINE_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 3f3df1166b860..0e6c160de3315 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -294,6 +294,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	    IS_DG2(gt->i915))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
+	/* Wa_16019325821 */
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
+
 	/*
 	 * Wa_14012197797
 	 * Wa_22011391025
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 8ae1846431da7..48863188a130e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -96,8 +96,9 @@
 #define   GUC_WA_GAM_CREDITS		BIT(10)
 #define   GUC_WA_DUAL_QUEUE		BIT(11)
 #define   GUC_WA_RCS_RESET_BEFORE_RC6	BIT(13)
-#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
 #define   GUC_WA_PRE_PARSER		BIT(14)
+#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
+#define   GUC_WA_RCS_CCS_SWITCHOUT	BIT(16)
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d37698bd6b91a..bdb321d8e265d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4380,7 +4380,12 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	if (engine->class == COMPUTE_CLASS)
 		if (IS_GFX_GT_IP_STEP(engine->gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
 		    IS_DG2(engine->i915))
-			engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
+			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
+
+	/* Wa_16019325821 */
+	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
+	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
+		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 
 	/*
 	 * TODO: GuC supports timeslicing and semaphores as well, but they're
-- 
2.41.0

