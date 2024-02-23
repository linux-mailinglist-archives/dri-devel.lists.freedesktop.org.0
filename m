Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F21861E42
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E11F10E28E;
	Fri, 23 Feb 2024 20:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD7QaMMI";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6710E28E;
 Fri, 23 Feb 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708721922; x=1740257922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3k6RPnIrd2eJKzN4GkeO2TOFpuBO5TdVfovnthWRyvk=;
 b=BD7QaMMI6KBXMX8X1I3XSikbvX1BhEzGMMvU7IjMcHsVg7rIyd78k/Wz
 dRkgiCUPfRkbJppdnA0oxBo4YPErxr2POa+t8iAd6Btxzho/n4W9MG2FY
 w9m2zDvh11VkN1H1N+dWQHlnHpxFF8GSGPkb9edPUoa+8bAViHZwQ3anX
 wwaUsQt/Ma3VmbjTIeyoEEFn7HoaTqM/zc5kp0IS5aV2dV5BrG22tMgiJ
 FAUDxFz6aCJ8k/zNmyPjdT1ussSgmSkDSZie53EH6qsgxXgRV0hln1sJ0
 VthH63S6/d4sFmsKaowQN/K6ta0pLVKfaTOGI3Ls3N6Ru8q09xSmT7JbY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20604772"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20604772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5908499"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 12:58:40 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 1/3] drm/i915: Enable Wa_16019325821
Date: Fri, 23 Feb 2024 12:56:30 -0800
Message-ID: <20240223205632.1621019-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223205632.1621019-1-John.C.Harrison@Intel.com>
References: <20240223205632.1621019-1-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some platforms require holding RCS context switches until CCS is idle
(the reverse w/a of Wa_14014475959). Some platforms require both
versions.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++++-
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index e1bf13e3d3070..bb8e4c151a026 100644
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
index 960e6be2042fe..b519812ba120d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -586,7 +586,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
-#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
 	unsigned int flags;
 
 	/*
@@ -696,10 +696,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
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
index 2b450c43bbd7f..d5c856be31491 100644
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
index f3dcae4b9d455..ee1cef9bab220 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4496,7 +4496,12 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
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
2.43.0

