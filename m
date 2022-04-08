Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8334F9C39
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A31410E7F2;
	Fri,  8 Apr 2022 18:03:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADC310E740;
 Fri,  8 Apr 2022 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649441007; x=1680977007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIYYUC3ceCtOA++/mOvS6Jkk1Ekf2Yl295DgLzTbz/Y=;
 b=mLtqG68xsKJDYPYaNccEw5dGcVpmzd5dAIFVvZKAjXwRcR5/f8Nn4uJY
 Zd9wR3GJQlVSqIq7dRMIBaS5UlW0zY3Orp1rzQH/VqhLCEDSIJ+oXBR3R
 YFgOyH9gdcofHgTa0AbRG9VIYymSw6QQwYujCtuUtGXMKX70Tiqv50svN
 Sta90FT84Qz9WEKUnMHN+OIOBgxc9TZSaRcso5xNBp9LsB1UXBkoheeaZ
 IxixYq43dLQww/q2H5/v5a6VcRCiR7SciVVB+MEKJXCSn+d76VwKnqL73
 qT5vDfytsbl1HGWabrp6QzoVF868rF6vxvLn3Lg8siv+BopfDbW7fQR1H w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="241592242"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="241592242"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 11:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="557869597"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2022 11:03:26 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/guc: Update scheduling policies to new GuC API
Date: Fri,  8 Apr 2022 11:03:25 -0700
Message-Id: <20220408180326.1454951-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
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

The latest GuC firmware drops the individual scheduling policy update
H2G commands in favour of a single KLV based H2G. So, change the
update wrappers accordingly.

Unfortunately, the API changes also mean losing the ability to set any
scheduling policy values during context registration. Instead the same
KLV based H2G must be sent after the registration. Of course, that
second H2G per registration might fail due to being backed up. The
registration code has a complicated state machine to cope with the
actual registration call failing. However, if that works then there is
no support for unwinding if a further call should fail. Unwinding
would require sending a H2G to de-register - but that can't be done
because the CTB is already backed up.

So instead, add a new flag to say whether the context has a pending
policy update. This is set if the policy H2G fails at registration
time. The submission code checks for this flag and retries the policy
update if set. If that call fails, the submission path early exists
with a retry error. This is something that is already supported for
other reasons.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  15 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  19 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 176 ++++++++++++++----
 4 files changed, 175 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 9ad6df1b6fbc..be9ac47fa9d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -122,11 +122,9 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
 	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_SET = 0x1003,
 	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_DONE = 0x1004,
-	INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY = 0x1005,
-	INTEL_GUC_ACTION_SET_CONTEXT_EXECUTION_QUANTUM = 0x1006,
-	INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
 	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
 	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
+	INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
 	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
 	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index f0814a57c191..4a59478c3b5c 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -6,6 +6,8 @@
 #ifndef _ABI_GUC_KLVS_ABI_H
 #define _ABI_GUC_KLVS_ABI_H
 
+#include <linux/types.h>
+
 /**
  * DOC: GuC KLV
  *
@@ -79,4 +81,17 @@
 #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_KEY		0x0907
 #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_LEN		1u
 
+/*
+ * Per context scheduling policy update keys.
+ */
+enum  {
+	GUC_CONTEXT_POLICIES_KLV_ID_EXECUTION_QUANTUM			= 0x2001,
+	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPTION_TIMEOUT			= 0x2002,
+	GUC_CONTEXT_POLICIES_KLV_ID_SCHEDULING_PRIORITY			= 0x2003,
+	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY	= 0x2004,
+	GUC_CONTEXT_POLICIES_KLV_ID_SLPM_GT_FREQUENCY			= 0x2005,
+
+	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
+};
+
 #endif /* _ABI_GUC_KLVS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 0e1e8d0079b5..c154b5efccde 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -221,11 +221,22 @@ struct guc_ctxt_registration_info {
 };
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
 
-#define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
-#define CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US 500000
+/* 32-bit KLV structure as used by policy updates and others */
+struct guc_klv_generic_dw_t {
+	u32 kl;
+	u32 value;
+} __packed;
 
-/* Preempt to idle on quantum expiry */
-#define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE	BIT(0)
+/* Format of the UPDATE_CONTEXT_POLICIES H2G data packet */
+struct guc_update_context_policy_header {
+	u32 action;
+	u32 ctx_id;
+} __packed;
+
+struct guc_update_context_policy {
+	struct guc_update_context_policy_header header;
+	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
+} __packed;
 
 #define GUC_POWER_UNSPECIFIED	0
 #define GUC_POWER_D0		1
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index bd0584d7d489..2bd680064942 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -162,7 +162,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
 #define SCHED_STATE_ENABLED				BIT(4)
 #define SCHED_STATE_PENDING_ENABLE			BIT(5)
 #define SCHED_STATE_REGISTERED				BIT(6)
-#define SCHED_STATE_BLOCKED_SHIFT			7
+#define SCHED_STATE_POLICY_REQUIRED			BIT(7)
+#define SCHED_STATE_BLOCKED_SHIFT			8
 #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
 #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
 
@@ -301,6 +302,23 @@ static inline void clr_context_registered(struct intel_context *ce)
 	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
 }
 
+static inline bool context_policy_required(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_POLICY_REQUIRED;
+}
+
+static inline void set_context_policy_required(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_POLICY_REQUIRED;
+}
+
+static inline void clr_context_policy_required(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_POLICY_REQUIRED;
+}
+
 static inline u32 context_blocked(struct intel_context *ce)
 {
 	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
@@ -593,6 +611,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
 					      true, timeout);
 }
 
+static int guc_context_policy_init(struct intel_context *ce, bool loop);
 static int try_context_registration(struct intel_context *ce, bool loop);
 
 static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
@@ -619,6 +638,12 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
 
+	if (context_policy_required(ce)) {
+		err = guc_context_policy_init(ce, false);
+		if (err)
+			return err;
+	}
+
 	spin_lock(&ce->guc_state.lock);
 
 	/*
@@ -2142,6 +2167,8 @@ static int register_context(struct intel_context *ce, bool loop)
 		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		set_context_registered(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		guc_context_policy_init(ce, loop);
 	}
 
 	return ret;
@@ -2191,21 +2218,111 @@ static inline u32 get_children_join_value(struct intel_context *ce,
 	return __get_parent_scratch(ce)->join[child_index].semaphore;
 }
 
-#if 0
-/* FIXME: This needs to be updated for new v70 interface... */
-static void guc_context_policy_init(struct intel_engine_cs *engine,
-				    struct guc_lrc_desc *desc)
+struct context_policy {
+	u32 count;
+	struct guc_update_context_policy h2g;
+};
+
+static u32 __guc_context_policy_action_size(struct context_policy *policy)
 {
-	desc->policy_flags = 0;
+	size_t bytes = sizeof(policy->h2g.header) +
+		       (sizeof(policy->h2g.klv[0]) * policy->count);
 
-	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
-		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
+	return bytes / sizeof(u32);
+}
+
+static void __guc_context_policy_start_klv(struct context_policy *policy, u16 guc_id)
+{
+	policy->h2g.header.action = INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES;
+	policy->h2g.header.ctx_id = guc_id;
+	policy->count = 0;
+}
+
+#define MAKE_CONTEXT_POLICY_ADD(func, id) \
+static void __guc_context_policy_add_##func(struct context_policy *policy, u32 data) \
+{ \
+	GEM_BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
+	policy->h2g.klv[policy->count].kl = \
+		FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
+		FIELD_PREP(GUC_KLV_0_LEN, 1); \
+	policy->h2g.klv[policy->count].value = data; \
+	policy->count++; \
+}
+
+MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
+MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
+MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
+MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
+
+#undef MAKE_CONTEXT_POLICY_ADD
+
+static int __guc_context_set_context_policies(struct intel_guc *guc,
+					      struct context_policy *policy,
+					      bool loop)
+{
+	return guc_submission_send_busy_loop(guc, (u32 *)&policy->h2g,
+					__guc_context_policy_action_size(policy),
+					0, loop);
+}
+
+static int guc_context_policy_init(struct intel_context *ce, bool loop)
+{
+	struct intel_engine_cs *engine = ce->engine;
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct context_policy policy;
+	u32 execution_quantum;
+	u32 preemption_timeout;
+	bool missing = false;
+	unsigned long flags;
+	int ret;
 
 	/* NB: For both of these, zero means disabled. */
-	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
-	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
+	execution_quantum = engine->props.timeslice_duration_ms * 1000;
+	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
+
+	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
+
+	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
+	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
+	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
+
+	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
+		__guc_context_policy_add_preempt_to_idle(&policy, 1);
+
+	ret = __guc_context_set_context_policies(guc, &policy, loop);
+	missing = ret != 0;
+
+	if (!missing && intel_context_is_parent(ce)) {
+		struct intel_context *child;
+
+		for_each_child(ce, child) {
+			__guc_context_policy_start_klv(&policy, child->guc_id.id);
+
+			if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
+				__guc_context_policy_add_preempt_to_idle(&policy, 1);
+
+			child->guc_state.prio = ce->guc_state.prio;
+			__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
+			__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
+			__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
+
+			ret = __guc_context_set_context_policies(guc, &policy, loop);
+			if (ret) {
+				missing = true;
+				break;
+			}
+		}
+	}
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (missing)
+		set_context_policy_required(ce);
+	else
+		clr_context_policy_required(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	return ret;
 }
-#endif
 
 static void prepare_context_registration_info(struct intel_context *ce,
 					      struct guc_ctxt_registration_info *info)
@@ -2234,9 +2351,6 @@ static void prepare_context_registration_info(struct intel_context *ce,
 	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
 	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
 	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
-	/* FIXME: This needs to be updated for new v70 interface... */
-	//desc->priority = ce->guc_state.prio;
-	//guc_context_policy_init(engine, desc);
 
 	/*
 	 * If context is a parent, we need to register a process descriptor
@@ -2263,10 +2377,6 @@ static void prepare_context_registration_info(struct intel_context *ce,
 		memset(wq_desc, 0, sizeof(*wq_desc));
 		wq_desc->wq_status = WQ_STATUS_ACTIVE;
 
-		/* FIXME: This needs to be updated for new v70 interface... */
-		//desc->priority = ce->guc_state.prio;
-		//guc_context_policy_init(engine, desc);
-
 		clear_children_join_go_memory(ce);
 	}
 }
@@ -2581,13 +2691,11 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
 						 u16 guc_id,
 						 u32 preemption_timeout)
 {
-	u32 action[] = {
-		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
-		guc_id,
-		preemption_timeout
-	};
+	struct context_policy policy;
 
-	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+	__guc_context_policy_start_klv(&policy, guc_id);
+	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
+	__guc_context_set_context_policies(guc, &policy, true);
 }
 
 static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
@@ -2832,16 +2940,20 @@ static int guc_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void __guc_context_set_prio(struct intel_guc *guc,
+				   struct intel_context *ce)
+{
+	struct context_policy policy;
+
+	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
+	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
+	__guc_context_set_context_policies(guc, &policy, true);
+}
+
 static void guc_context_set_prio(struct intel_guc *guc,
 				 struct intel_context *ce,
 				 u8 prio)
 {
-	u32 action[] = {
-		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
-		ce->guc_id.id,
-		prio,
-	};
-
 	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
 		   prio > GUC_CLIENT_PRIORITY_NORMAL);
 	lockdep_assert_held(&ce->guc_state.lock);
@@ -2852,9 +2964,9 @@ static void guc_context_set_prio(struct intel_guc *guc,
 		return;
 	}
 
-	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
-
 	ce->guc_state.prio = prio;
+	__guc_context_set_prio(guc, ce);
+
 	trace_intel_context_set_prio(ce);
 }
 
-- 
2.25.1

