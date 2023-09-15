Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F97A29DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F610E69E;
	Fri, 15 Sep 2023 21:56:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3776810E69C;
 Fri, 15 Sep 2023 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694815009; x=1726351009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=skVB6PumvLqhIf2eAbUshySe6m2Z7jFFB7+K2NYV/6s=;
 b=QxNRbAA/JTw0TxC1gTItJTcB3PJlHkSGg0ZA+W98DHTnJu0UoR6/vO+0
 STx4nG2tmFn/Ic3JB6ec2pQ1sFBQ53sCm1P7DM3T+7n/LCHMEAxLN8Wdz
 poRfApZHLR7gYeMQcTLBweSOd/n6Zn9fozRU3t9l8wm5Bn1JBVkYbfGpZ
 oMZnLNi+zaGapm6M0G/mUTRIktwjFWTYdPgcB0PccW3/Ol5/ZI/m0oO62
 Hzs3mBE+nfVLwv4DXS72Rxrj8qQKuEjzn4SrzPhoD5O6wM/h3VKQK53PT
 otwCZsDfYkBN7tZ44jqHCJ3j7zfPMSyb16hKw9rBHyThIkyLLlMD7jZic A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410297708"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="410297708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 14:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918792868"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="918792868"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 14:56:34 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/4] drm/i915: Enable Wa_16019325821
Date: Fri, 15 Sep 2023 14:55:35 -0700
Message-ID: <20230915215537.220331-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230915215537.220331-1-John.C.Harrison@Intel.com>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
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
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +++++++-
 5 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0143445dba830..8b494825c55f2 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -733,21 +733,23 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
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
 
@@ -763,7 +765,7 @@ static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 		MI_SEMAPHORE_POLL |
 		MI_SEMAPHORE_SAD_EQ_SDD;
 	*cs++ = 0;
-	*cs++ = ccs_semaphore_offset(rq);
+	*cs++ = hold_switchout_semaphore_offset(rq);
 	*cs++ = 0;
 
 	return cs;
@@ -780,8 +782,9 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
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
index a7e6775980043..68fe1cef9cd94 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -573,7 +573,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
-#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
 	unsigned int flags;
 
 	/*
@@ -683,10 +683,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
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
index 27df41c53b890..4001679ba0793 100644
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
index b4d56eccfb1f0..f97af0168a66b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -95,8 +95,9 @@
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
index cabdc645fcddb..ff38a815701ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4267,7 +4267,13 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	if (engine->class == COMPUTE_CLASS)
 		if (IS_GFX_GT_IP_STEP(engine->gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
 		    IS_DG2(engine->i915))
-			engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
+			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
+
+	/* Wa_16019325821 */
+	if (engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS)
+		if (IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
+			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
+
 
 	/*
 	 * TODO: GuC supports timeslicing and semaphores as well, but they're
-- 
2.41.0

