Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15F85CC98
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 01:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93110E146;
	Wed, 21 Feb 2024 00:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/9/K1lk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96710E146;
 Wed, 21 Feb 2024 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708474485; x=1740010485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cs7W8YFESvCIjIybb8RmjqzIxMXNlGtSXTmLVM2XYL4=;
 b=Z/9/K1lkAovz+z4I0WX4+QuPUC+jeRVmvL+5QuaE2RnZpTBLn3WR16h5
 kD2j6jM+Dze8UHRq2WpTFyVcSgBJTltyN4wxgJDhVZZam049J0TPCX//F
 YrB5JZgj3ESCjyuXT1GN3eFuUHDTM7heH8SbYZJyVqyQoVXAWe2WTYDya
 4ZNEe221z/8Srjv0TKvQAaFhGYoWuGiHlbEVbHyOMjiW9XDfSV4FAXWWu
 wP/avCTY2fLp6kzTBo140fcfOXpF9yWbWtc0Fkk8++XUpgI/JlX235BKl
 w7tYHGrHlcKMXYC79ITcV3k8CssJb+Ok422EE8OKpk/37u56Do6Uh96nG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20044106"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="20044106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 16:14:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5097077"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2024 16:14:44 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915/guc: Add Compute context hint
Date: Tue, 20 Feb 2024 16:14:16 -0800
Message-Id: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
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

Allow user to provide a context hint. When this is set, KMD will
send a hint to GuC which results in special handling for this
context. SLPC will ramp the GT frequency aggressively every time
it switches to this context. The down freq threshold will also be
lower so GuC will ramp down the GT freq for this context more slowly.
We also disable waitboost for this context as that will interfere with
the strategy.

We need to enable the use of Compute strategy during SLPC init, but
it will apply only to contexts that set this bit during context
creation.

Userland can check whether this feature is supported using a new param-
I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true for all guc submission
enabled platforms since they use SLPC for freq management.

The Mesa usage model for this flag is here -
https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
 .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 +++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
 drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
 include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
 9 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index dcbfe32fd30c..ceab7dbe9b47 100644
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
 
+	case I915_CONTEXT_PARAM_IS_COMPUTE:
+		if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
+			ret = -EINVAL;
+		else
+			pc->user_flags |= BIT(UCONTEXT_COMPUTE);
+		break;
+
 	case I915_CONTEXT_PARAM_RECOVERABLE:
 		if (args->size)
 			ret = -EINVAL;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 03bc7f9d191b..db86d6f6245f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -338,6 +338,7 @@ struct i915_gem_context {
 #define UCONTEXT_BANNABLE		2
 #define UCONTEXT_RECOVERABLE		3
 #define UCONTEXT_PERSISTENCE		4
+#define UCONTEXT_COMPUTE		5
 
 	/**
 	 * @flags: small set of booleans
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4feef874e6d6..1ed40cd61b70 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -24,6 +24,7 @@
 #include "intel_pcode.h"
 #include "intel_rps.h"
 #include "vlv_sideband.h"
+#include "../gem/i915_gem_context.h"
 #include "../../../platform/x86/intel_ips.h"
 
 #define BUSY_MAX_EI	20u /* ms */
@@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
 		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
 
 		if (rps_uses_slpc(rps)) {
+			const struct i915_gem_context *ctx;
+
+			ctx = i915_request_gem_context(rq);
+			if (ctx &&
+			    test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
+				return;
+
 			slpc = rps_to_slpc(rps);
 
 			if (slpc->min_freq_softlimit >= slpc->boost_freq)
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
index f3dcae4b9d45..bbabfa5532e5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
 MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
+MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
 
 #undef MAKE_CONTEXT_POLICY_ADD
 
@@ -2662,8 +2663,10 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	struct context_policy policy;
+	struct i915_gem_context *ctx = rcu_dereference(ce->gem_context);
 	u32 execution_quantum;
 	u32 preemption_timeout;
+	u32 slpc_ctx_freq_req = 0;
 	unsigned long flags;
 	int ret;
 
@@ -2675,11 +2678,15 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	execution_quantum = engine->props.timeslice_duration_ms * 1000;
 	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 
+	if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
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
index 5c3fec63cb4c..0f12e36b2a12 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		 */
 		value = 1;
 		break;
+	case I915_PARAM_HAS_COMPUTE_CONTEXT:
+		/* This feature has been available in GuC for a while but
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
index 2ee338860b7e..1bd12f536108 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_PXP_STATUS		 58
 
+/*
+ * Query if kernel allows marking a context as a Compute context. This will
+ * result in more aggressive GT frequency ramping for this context.
+ */
+#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
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
+#define I915_CONTEXT_PARAM_IS_COMPUTE		0xe
 /* Must be kept compact -- no holes and well documented */
 
 	/** @value: Context parameter value to be set or queried */
-- 
2.38.1

