Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15F375B2E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17DA6ED90;
	Thu,  6 May 2021 18:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D176ED90;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: oVEbrCkxpLgBdr3rjzR3VvI0iL7ewWJ0LyhiA9jFSSuoaoPZTTLGrfuv8SDtIp88HPLozGXaDt
 LHGylLou2g+A==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195466"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: aETJ8eYSD0vD02oUzFlyRXQDNglzHP1qmM5kXZVBsI3CPbBkYtGk1pXEsJEr4XYLxP6Py74gbv
 MI5pPw9zrgpg==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583646"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 87/97] drm/i915/guc: Implement GuC priority management
Date: Thu,  6 May 2021 12:14:41 -0700
Message-Id: <20210506191451.77768-88-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a simple static mapping algorithm of the i915 priority levels
(int, -1k to 1k exposed to user) to the 4 GuC levels. Mapping is as
follows:

i915 level < 0          -> GuC low level     (3)
i915 level == 0         -> GuC normal level  (2)
i915 level < INT_MAX    -> GuC high level    (1)
i915 level == INT_MAX   -> GuC highest level (0)

We believe this mapping should cover the UMD use cases (3 distinct user
levels + 1 kernel level).

In addition to static mapping, a simple counter system is attached to
each context tracking the number of requests inflight on the context at
each level. This is needed as the GuC levels are per context while in
the i915 levels are per request.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   3 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 205 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_request.c           |   5 +
 drivers/gpu/drm/i915/i915_request.h           |   8 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   7 +
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   5 +
 drivers/gpu/drm/i915/i915_trace.h             |  16 +-
 include/uapi/drm/i915_drm.h                   |   9 +
 10 files changed, 266 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 2007dc6f6b99..209cf265bf74 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -245,6 +245,9 @@ static void signal_irq_work(struct irq_work *work)
 			llist_entry(signal, typeof(*rq), signal_node);
 		struct list_head cb_list;
 
+		if (rq->engine->sched_engine->retire_inflight_request_prio)
+			rq->engine->sched_engine->retire_inflight_request_prio(rq);
+
 		spin_lock(&rq->lock);
 		list_replace(&rq->fence.cb_list, &cb_list);
 		__dma_fence_signal__timestamp(&rq->fence, timestamp);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 998f3839411a..217761b27b6c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -17,8 +17,9 @@
 #include "intel_engine_types.h"
 #include "intel_sseu.h"
 
-#define CONTEXT_REDZONE POISON_INUSE
+#include "uc/intel_guc_fwif.h"
 
+#define CONTEXT_REDZONE POISON_INUSE
 DECLARE_EWMA(runtime, 3, 8);
 
 struct i915_gem_context;
@@ -193,6 +194,12 @@ struct intel_context {
 	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
 	 */
 	struct list_head guc_id_link;
+
+	/*
+	 * GuC priority management
+	 */
+	u8 guc_prio;
+	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index d6dcdeace174..7cb16b6cf2ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -11,6 +11,7 @@
 #include "intel_engine.h"
 #include "intel_engine_user.h"
 #include "intel_gt.h"
+#include "uc/intel_guc_submission.h"
 
 struct intel_engine_cs *
 intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance)
@@ -114,6 +115,9 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 			disabled |= (I915_SCHEDULER_CAP_ENABLED |
 				     I915_SCHEDULER_CAP_PRIORITY);
 
+		if (intel_uc_uses_guc_submission(&i915->gt.uc))
+			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
+
 		for (i = 0; i < ARRAY_SIZE(map); i++) {
 			if (engine->flags & BIT(map[i].engine))
 				enabled |= BIT(map[i].sched);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9dc0ffc07cd7..6d2ae6390299 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -180,6 +180,7 @@ static void clr_guc_ids_exhausted(struct guc_submit_engine *gse)
 #define SCHED_STATE_NO_LOCK_BLOCK_TASKLET		BIT(2)
 #define SCHED_STATE_NO_LOCK_GUC_ID_STOLEN		BIT(3)
 #define SCHED_STATE_NO_LOCK_NEEDS_REGISTER		BIT(4)
+#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(5)
 static inline bool context_enabled(struct intel_context *ce)
 {
 	return (atomic_read(&ce->guc_sched_state_no_lock) &
@@ -269,6 +270,24 @@ static inline void clr_context_needs_register(struct intel_context *ce)
 		   &ce->guc_sched_state_no_lock);
 }
 
+static inline bool context_registered(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_REGISTERED);
+}
+
+static inline void set_context_registered(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_registered(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
+		   &ce->guc_sched_state_no_lock);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock, aside from the special case where the functions are called
@@ -1531,6 +1550,7 @@ static int steal_guc_id(struct intel_guc *guc, bool unpinned)
 		 * the guc_id until the retire workqueue processes this
 		 * context.
 		 */
+		clr_context_registered(ce);
 		if (!unpinned) {
 			GEM_BUG_ON(ce_to_gse(ce)->stalled_context);
 
@@ -1681,10 +1701,13 @@ static int register_context(struct intel_context *ce, bool loop)
 	struct intel_guc *guc = ce_to_guc(ce);
 	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
 		ce->guc_id * sizeof(struct guc_lrc_desc);
+	int ret;
 
 	trace_intel_context_register(ce);
 
-	return __guc_action_register_context(guc, ce->guc_id, offset, loop);
+	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
+	set_context_registered(ce);
+	return ret;
 }
 
 static int __guc_action_deregister_context(struct intel_guc *guc,
@@ -1739,6 +1762,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
+static inline u8 map_i915_prio_to_guc_prio(int prio);
+
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_runtime_pm *runtime_pm =
@@ -1747,6 +1772,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 desc_idx = ce->guc_id;
 	struct guc_lrc_desc *desc;
+	const struct i915_gem_context *ctx;
+	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
 	int ret = 0;
@@ -1763,6 +1790,12 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
+	rcu_read_lock();
+	ctx = rcu_dereference(ce->gem_context);
+	if (ctx)
+		prio = ctx->sched.priority;
+	rcu_read_unlock();
+
 	reset_lrc_desc(guc, desc_idx);
 	set_lrc_desc_registered(guc, desc_idx, ce);
 
@@ -1771,7 +1804,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
+	desc->priority = ce->guc_prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 	init_sched_state(ce);
@@ -2006,11 +2040,17 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
 	GEM_BUG_ON(context_enabled(ce));
 
+	clr_context_registered(ce);
 	deregister_context(ce, ce->guc_id, true);
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
 {
+	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+
 	lrc_fini(ce);
 	intel_context_fini(ce);
 
@@ -2104,17 +2144,121 @@ static int guc_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void guc_context_set_prio(struct intel_guc *guc,
+				 struct intel_context *ce,
+				 u8 prio)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
+		ce->guc_id,
+		prio,
+	};
+
+	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
+		   prio > GUC_CLIENT_PRIORITY_NORMAL);
+
+	if (ce->guc_prio == prio || submission_disabled(guc) ||
+	    !context_registered(ce))
+		return;
+
+	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+
+	ce->guc_prio = prio;
+	trace_intel_context_set_prio(ce);
+}
+
+static inline u8 map_i915_prio_to_guc_prio(int prio)
+{
+	if (prio == I915_PRIORITY_NORMAL)
+		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	else if (prio < I915_PRIORITY_NORMAL)
+		return GUC_CLIENT_PRIORITY_NORMAL;
+	else if (prio != I915_PRIORITY_BARRIER)
+		return GUC_CLIENT_PRIORITY_HIGH;
+	else
+		return GUC_CLIENT_PRIORITY_KMD_HIGH;
+}
+
+static inline void add_context_inflight_prio(struct intel_context *ce,
+					     u8 guc_prio)
+{
+	lockdep_assert_held(&ce->guc_active.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+
+	++ce->guc_prio_count[guc_prio];
+
+	/* Overflow protection */
+	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+}
+
+static inline void sub_context_inflight_prio(struct intel_context *ce,
+					     u8 guc_prio)
+{
+	lockdep_assert_held(&ce->guc_active.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+
+	/* Underflow protection */
+	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+
+	--ce->guc_prio_count[guc_prio];
+}
+
+static inline void update_context_prio(struct intel_context *ce)
+{
+	struct intel_guc *guc = &ce->engine->gt->uc.guc;
+	int i;
+
+	lockdep_assert_held(&ce->guc_active.lock);
+
+	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
+		if (ce->guc_prio_count[i]) {
+			guc_context_set_prio(guc, ce, i);
+			break;
+		}
+	}
+}
+
+static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
+{
+	/* Lower value is higher priority */
+	return new_guc_prio < old_guc_prio;
+}
+
 static void add_to_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
+	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
+
+	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
 
 	spin_lock(&ce->guc_active.lock);
 	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
+
+	if (rq->guc_prio == GUC_PRIO_INIT) {
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+	} else if (new_guc_prio_higher(rq->guc_prio, new_guc_prio)) {
+		sub_context_inflight_prio(ce, rq->guc_prio);
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+	}
+	update_context_prio(ce);
+
 	if (unlikely(request_has_no_guc_id(rq)))
 		++ce->guc_num_rq_submit_no_id;
 	spin_unlock(&ce->guc_active.lock);
 }
 
+static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
+{
+	if (rq->guc_prio != GUC_PRIO_INIT &&
+	    rq->guc_prio != GUC_PRIO_FINI) {
+		sub_context_inflight_prio(ce, rq->guc_prio);
+		update_context_prio(ce);
+	}
+	rq->guc_prio = GUC_PRIO_FINI;
+}
+
 static void remove_from_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
@@ -2127,6 +2271,8 @@ static void remove_from_context(struct i915_request *rq)
 	/* Prevent further __await_execution() registering a cb, then flush */
 	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
 
+	guc_prio_fini(rq, ce);
+
 	spin_unlock_irq(&ce->guc_active.lock);
 
 	if (likely(!request_has_no_guc_id(rq)))
@@ -2582,6 +2728,39 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
 	}
 }
 
+static void guc_bump_inflight_request_prio(struct i915_request *rq,
+					   int prio)
+{
+	struct intel_context *ce = rq->context;
+	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
+
+	/* Short circuit function */
+	if (prio < I915_PRIORITY_NORMAL ||
+	    (rq->guc_prio == GUC_PRIO_FINI) ||
+	    (rq->guc_prio != GUC_PRIO_INIT &&
+	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
+		return;
+
+	spin_lock(&ce->guc_active.lock);
+	if (rq->guc_prio != GUC_PRIO_FINI) {
+		if (rq->guc_prio != GUC_PRIO_INIT)
+			sub_context_inflight_prio(ce, rq->guc_prio);
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+		update_context_prio(ce);
+	}
+	spin_unlock(&ce->guc_active.lock);
+}
+
+static void guc_retire_inflight_request_prio(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+
+	spin_lock(&ce->guc_active.lock);
+	guc_prio_fini(rq, ce);
+	spin_unlock(&ce->guc_active.lock);
+}
+
 static void sanitize_hwsp(struct intel_engine_cs *engine)
 {
 	struct intel_timeline *tl;
@@ -2807,6 +2986,10 @@ static void guc_submit_engine_init(struct intel_guc *guc,
 	gse->sched_engine.schedule = i915_schedule;
 	gse->sched_engine.disabled = guc_sched_engine_disabled;
 	gse->sched_engine.destroy = guc_sched_engine_destroy;
+	gse->sched_engine.bump_inflight_request_prio =
+		guc_bump_inflight_request_prio;
+	gse->sched_engine.retire_inflight_request_prio =
+		guc_retire_inflight_request_prio;
 	gse->guc = guc;
 	gse->id = id;
 }
@@ -3264,6 +3447,22 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
 		gse_log_submission_info(guc->gse[i], p, i);
 }
 
+static inline void guc_log_context_priority(struct drm_printer *p,
+					    struct intel_context *ce)
+{
+	int i;
+
+	drm_printf(p, "\t\tPriority: %d\n",
+		   ce->guc_prio);
+	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
+	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
+	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
+		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
+			   i, ce->guc_prio_count[i]);
+	}
+	drm_printf(p, "\n");
+}
+
 void intel_guc_log_context_info(struct intel_guc *guc,
 				struct drm_printer *p)
 {
@@ -3287,6 +3486,8 @@ void intel_guc_log_context_info(struct intel_guc *guc,
 		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
 			   ce->guc_state.sched_state,
 			   atomic_read(&ce->guc_sched_state_no_lock));
+
+		guc_log_context_priority(p, ce);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ef9eb91ec84c..4bf10f0ac34d 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -115,6 +115,9 @@ static void i915_fence_release(struct dma_fence *fence)
 {
 	struct i915_request *rq = to_request(fence);
 
+	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
+		   rq->guc_prio != GUC_PRIO_FINI);
+
 	/*
 	 * The request is put onto a RCU freelist (i.e. the address
 	 * is immediately reused), mark the fences as being freed now.
@@ -956,6 +959,8 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 
 	rq->rcustate = get_state_synchronize_rcu(); /* acts as smp_mb() */
 
+	rq->guc_prio = GUC_PRIO_INIT;
+
 	/* We bump the ref for the fence chain */
 	i915_sw_fence_reinit(&i915_request_get(rq)->submit);
 	i915_sw_fence_reinit(&i915_request_get(rq)->semaphore);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 94a3f119ad86..a03905f86e82 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -299,6 +299,14 @@ struct i915_request {
 	 */
 	struct list_head guc_fence_link;
 
+	/**
+	 * Priority level while the request is inflight. Differs slightly than
+	 * i915 scheduler priority.
+	 */
+#define	GUC_PRIO_INIT	0xff
+#define	GUC_PRIO_FINI	0xfe
+	u8 guc_prio;
+
 	I915_SELFTEST_DECLARE(struct {
 		struct list_head link;
 		unsigned long delay;
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 51644de0e9ca..babad7da3906 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -241,6 +241,9 @@ static void __i915_schedule(struct i915_sched_node *node,
 	/* Fifo and depth-first replacement ensure our deps execute before us */
 	sched_engine = lock_sched_engine(node, sched_engine, &cache);
 	list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
+		struct i915_request *from = container_of(dep->signaler,
+							 struct i915_request,
+							 sched);
 		INIT_LIST_HEAD(&dep->dfs_link);
 
 		node = dep->signaler;
@@ -254,6 +257,10 @@ static void __i915_schedule(struct i915_sched_node *node,
 		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
 			   sched_engine);
 
+		/* Must be called before changing the nodes priority */
+		if (sched_engine->bump_inflight_request_prio)
+			sched_engine->bump_inflight_request_prio(from, prio);
+
 		WRITE_ONCE(node->attr.priority, prio);
 
 		/*
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index a0b755a27140..14626fcfeed3 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -151,6 +151,11 @@ struct i915_sched_engine {
 	void	(*kick_backend)(const struct i915_request *rq,
 				int prio);
 
+	/* Update priority of inflight requests */
+	void	(*bump_inflight_request_prio)(struct i915_request *rq,
+					      int prio);
+	void	(*retire_inflight_request_prio)(struct i915_request *rq);
+
 	/*
 	 * Call when the priority on a request has changed and it and its
 	 * dependencies may need rescheduling. Note the request itself may
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 937d3706af9b..9d2cd14ed882 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -914,6 +914,7 @@ DECLARE_EVENT_CLASS(intel_context,
 			     __field(int, pin_count)
 			     __field(u32, sched_state)
 			     __field(u32, guc_sched_state_no_lock)
+			     __field(u8, guc_prio)
 			     ),
 
 	    TP_fast_assign(
@@ -922,11 +923,17 @@ DECLARE_EVENT_CLASS(intel_context,
 			   __entry->sched_state = ce->guc_state.sched_state;
 			   __entry->guc_sched_state_no_lock =
 			   atomic_read(&ce->guc_sched_state_no_lock);
+			   __entry->guc_prio = ce->guc_prio;
 			   ),
 
-	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
+	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
 		      __entry->guc_id, __entry->pin_count, __entry->sched_state,
-		      __entry->guc_sched_state_no_lock)
+		      __entry->guc_sched_state_no_lock, __entry->guc_prio)
+);
+
+DEFINE_EVENT(intel_context, intel_context_set_prio,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
 );
 
 DEFINE_EVENT(intel_context, intel_context_reset,
@@ -1036,6 +1043,11 @@ trace_i915_request_out(struct i915_request *rq)
 {
 }
 
+static inline void
+trace_intel_context_set_prio(struct intel_context *ce)
+{
+}
+
 static inline void
 trace_intel_context_reset(struct intel_context *ce)
 {
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index c2c7759b7d2e..0a489b11fe6b 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -572,6 +572,15 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+/*
+ * Indicates the 2k user priority levels are statically mapped into 3 buckets as
+ * follows:
+ *
+ * -1k to -1	Low priority
+ * 0		Normal priority
+ * 1 to 1k	Highest priority
+ */
+#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.28.0

