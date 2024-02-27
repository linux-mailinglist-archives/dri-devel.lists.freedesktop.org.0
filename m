Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A712086A3FC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 00:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58310E2E9;
	Tue, 27 Feb 2024 23:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmZx4nES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413E10E2DB;
 Tue, 27 Feb 2024 23:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709078118; x=1740614118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=irJUKq9qyjCZ5ysAMMSk1RPXQ2DkL7Qxmj7eiKK7nOs=;
 b=VmZx4nESPTZn2Sq5PfMEClxw5KY99gfqyn9crfGEMQ0czptnnJfRuRLv
 yFzDInoZGUfzWFafObFz33aQhmVu77sA0oi6Y1r0MoCYa1UDW7fk7KMoc
 1AWbHXhAqGtPv/io44b2OHpuu71a1iL/P4hz6li6DTn7x4aaWpoIUEEnJ
 1bqtTqq24Rlq4oFHsi8ieLQ6dg5GTZBJ2rYFhAM7lSiXlSHEpWmv4DYeH
 KHcTJUeS5EX5zLFteQowaNfiv0A/fYmO2+gOkFj5Q7byO/FC/o/zPxHfY
 s7kvy8hU8ANZf0fW0B0k7hB63IZJVgO0+wTunVN1ABZN2zPnMmLL4h4NR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="4018021"
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="4018021"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 15:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; d="scan'208";a="11960260"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa005.jf.intel.com with ESMTP; 27 Feb 2024 15:52:39 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v2] drm/i915/guc: Use context hints for GT freq
Date: Tue, 27 Feb 2024 15:51:31 -0800
Message-Id: <20240227235131.2308656-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow user to provide a low latency context hint. When set, KMD
sends a hint to GuC which results in special handling for this
context. SLPC will ramp the GT frequency aggressively every time
it switches to this context. The down freq threshold will also be
lower so GuC will ramp down the GT freq for this context more slowly.
We also disable waitboost for this context as that will interfere with
the strategy.

We need to enable the use of SLPC Compute strategy during init, but
it will apply only to contexts that set this bit during context
creation.

Userland can check whether this feature is supported using a new param-
I915_PARAM_HAS_CONTEXT_FREQ_HINTS. This flag is true for all guc submission
enabled platforms as they use SLPC for frequency management.

The Mesa usage model for this flag is here -
https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint

v2: Rename flags as per review suggestions (Rodrigo, Tvrtko).
Also, use flag bits in intel_context as it allows finer control for
toggling per engine if needed (Tvrtko).

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 15 +++++++++++--
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  5 +++++
 .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++++
 drivers/gpu/drm/i915/i915_getparam.c          | 12 +++++++++++
 include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
 10 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index dcbfe32fd30c..0799cb0b2803 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 			       struct i915_gem_proto_context *pc,
 			       struct drm_i915_gem_context_param *args)
 {
+	struct drm_i915_private *i915 = fpriv->i915;
 	int ret = 0;
 
 	switch (args->param) {
@@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
 		break;
 
+	case I915_CONTEXT_PARAM_LOW_LATENCY:
+		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
+			pc->user_flags |= BIT(UCONTEXT_LOW_LATENCY);
+		else
+			ret = -EINVAL;
+		break;
+
 	case I915_CONTEXT_PARAM_RECOVERABLE:
 		if (args->size)
 			ret = -EINVAL;
@@ -992,6 +1000,9 @@ static int intel_context_set_gem(struct intel_context *ce,
 	if (sseu.slice_mask && !WARN_ON(ce->engine->class != RENDER_CLASS))
 		ret = intel_context_reconfigure_sseu(ce, sseu);
 
+	if (test_bit(UCONTEXT_LOW_LATENCY, &ctx->user_flags))
+		set_bit(CONTEXT_LOW_LATENCY, &ce->flags);
+
 	return ret;
 }
 
@@ -1630,6 +1641,8 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	if (vm)
 		ctx->vm = vm;
 
+	ctx->user_flags = pc->user_flags;
+
 	mutex_init(&ctx->engines_mutex);
 	if (pc->num_user_engines >= 0) {
 		i915_gem_context_set_user_engines(ctx);
@@ -1652,8 +1665,6 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	 * is no remap info, it will be a NOP. */
 	ctx->remap_slice = ALL_L3_SLICES(i915);
 
-	ctx->user_flags = pc->user_flags;
-
 	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
 		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 03bc7f9d191b..b6d97da63d1f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -338,6 +338,7 @@ struct i915_gem_context {
 #define UCONTEXT_BANNABLE		2
 #define UCONTEXT_RECOVERABLE		3
 #define UCONTEXT_PERSISTENCE		4
+#define UCONTEXT_LOW_LATENCY		5
 
 	/**
 	 * @flags: small set of booleans
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 7eccbd70d89f..ed95a7b57cbb 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -130,6 +130,7 @@ struct intel_context {
 #define CONTEXT_PERMA_PIN		11
 #define CONTEXT_IS_PARKING		12
 #define CONTEXT_EXITING			13
+#define CONTEXT_LOW_LATENCY		14
 
 	struct {
 		u64 timeout_us;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4feef874e6d6..3accfd8db287 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -24,6 +24,7 @@
 #include "intel_pcode.h"
 #include "intel_rps.h"
 #include "vlv_sideband.h"
+#include "../gem/i915_gem_context.h"
 #include "../../../platform/x86/intel_ips.h"
 
 #define BUSY_MAX_EI	20u /* ms */
@@ -1013,6 +1014,10 @@ void intel_rps_boost(struct i915_request *rq)
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
 		return;
 
+	/* Waitboost is not needed for contexts marked with a Freq hint */
+	if (test_bit(CONTEXT_LOW_LATENCY, &rq->context->flags))
+		return;
+
 	/* Serializes with i915_request_retire() */
 	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
 		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
index 811add10c30d..c34674e797c6 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
@@ -207,6 +207,27 @@ struct slpc_shared_data {
 	u8 reserved_mode_definition[4096];
 } __packed;
 
+struct slpc_context_frequency_request {
+	u32 frequency_request:16;
+	u32 reserved:12;
+	u32 is_compute:1;
+	u32 ignore_busyness:1;
+	u32 is_minimum:1;
+	u32 is_predefined:1;
+} __packed;
+
+#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
+
+struct slpc_optimized_strategies {
+	u32 compute:1;
+	u32 async_flip:1;
+	u32 media:1;
+	u32 vsync_flip:1;
+	u32 reserved:28;
+} __packed;
+
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 /**
  * DOC: SLPC H2G MESSAGE FORMAT
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 3e681ab6fbf9..706fffca698b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
 	return ret;
 }
 
+int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		ret = slpc_set_param(slpc,
+				     SLPC_PARAM_STRATEGIES,
+				     val);
+
+	return ret;
+}
+
 int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
@@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set cached media freq ratio mode */
 	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
 
+	/* Enable SLPC Optimized Strategy for compute */
+	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 6ac6503c39d4..1cb5fd44f05c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
 void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
+int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f3dcae4b9d45..d6ea4898ac39 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
 MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
+MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
 
 #undef MAKE_CONTEXT_POLICY_ADD
 
@@ -2664,6 +2665,7 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	struct context_policy policy;
 	u32 execution_quantum;
 	u32 preemption_timeout;
+	u32 slpc_ctx_freq_req = 0;
 	unsigned long flags;
 	int ret;
 
@@ -2675,11 +2677,15 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	execution_quantum = engine->props.timeslice_duration_ms * 1000;
 	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 
+	if (ce && (ce->flags & BIT(CONTEXT_LOW_LATENCY)))
+		slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
+
 	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
 
 	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
 	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
 	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
+	__guc_context_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
 
 	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
 		__guc_context_policy_add_preempt_to_idle(&policy, 1);
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 5c3fec63cb4c..4fc182fdb2e8 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -155,6 +155,18 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		 */
 		value = 1;
 		break;
+	case I915_PARAM_HAS_CONTEXT_FREQ_HINT:
+		/*
+		 * This feature has been available in GuC for a while but
+		 * a use case now required the use of this feature. We
+		 * return true now since this is now being supported from
+		 * the kernel side as well.
+		 */
+		if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
+			value = 1;
+		else
+			value = -EINVAL;
+		break;
 	case I915_PARAM_HAS_CONTEXT_ISOLATION:
 		value = intel_engines_has_context_isolation(i915);
 		break;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 2ee338860b7e..4f69f4e117ac 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_PXP_STATUS		 58
 
+/*
+ * Query if kernel allows marking a context to send a Freq hint to SLPC. This
+ * will enable use of the strategies allowed by the SLPC algorithm.
+ */
+#define I915_PARAM_HAS_CONTEXT_FREQ_HINT	59
+
 /* Must be kept compact -- no holes and well documented */
 
 /**
@@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
  * -EIO: The firmware did not succeed in creating the protected context.
  */
 #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
+
+/*
+ * I915_CONTEXT_PARAM_IS_COMPUTE:
+ *
+ * Mark this context as a Compute related workload which requires aggressive GT
+ * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to check if the kernel
+ * supports this functionality.
+ */
+#define I915_CONTEXT_PARAM_LOW_LATENCY		0xe
 /* Must be kept compact -- no holes and well documented */
 
 	/** @value: Context parameter value to be set or queried */
-- 
2.38.1

