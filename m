Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFFD3CBD6E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5986EA31;
	Fri, 16 Jul 2021 20:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4CB6EA1D;
 Fri, 16 Jul 2021 19:59:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="198046861"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="198046861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507239075"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 50/51] drm/i915/guc: Implement GuC priority management
Date: Fri, 16 Jul 2021 13:17:23 -0700
Message-Id: <20210716201724.54804-51-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
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
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 207 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_request.c           |   5 +
 drivers/gpu/drm/i915/i915_request.h           |   8 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   7 +
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  12 +
 drivers/gpu/drm/i915/i915_trace.h             |  16 +-
 include/uapi/drm/i915_drm.h                   |   9 +
 10 files changed, 274 insertions(+), 6 deletions(-)

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
index 005a64f2afa7..fe555551c2d2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -18,8 +18,9 @@
 #include "intel_engine_types.h"
 #include "intel_sseu.h"
 
-#define CONTEXT_REDZONE POISON_INUSE
+#include "uc/intel_guc_fwif.h"
 
+#define CONTEXT_REDZONE POISON_INUSE
 DECLARE_EWMA(runtime, 3, 8);
 
 struct i915_gem_context;
@@ -191,6 +192,12 @@ struct intel_context {
 
 	/* GuC context blocked fence */
 	struct i915_sw_fence guc_blocked;
+
+	/*
+	 * GuC priority management
+	 */
+	u8 guc_prio;
+	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 84142127ebd8..8f8bea08e734 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -11,6 +11,7 @@
 #include "intel_engine.h"
 #include "intel_engine_user.h"
 #include "intel_gt.h"
+#include "uc/intel_guc_submission.h"
 
 struct intel_engine_cs *
 intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance)
@@ -115,6 +116,9 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 			disabled |= (I915_SCHEDULER_CAP_ENABLED |
 				     I915_SCHEDULER_CAP_PRIORITY);
 
+		if (intel_uc_uses_guc_submission(&i915->gt.uc))
+			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
+
 		for (i = 0; i < ARRAY_SIZE(map); i++) {
 			if (engine->flags & BIT(map[i].engine))
 				enabled |= BIT(map[i].sched);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 536fdbc406c6..263ad6a9e4a9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -81,7 +81,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
  */
 #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
 #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
-#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		2
+#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
+#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		3
 #define SCHED_STATE_NO_LOCK_BLOCKED \
 	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
 #define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
@@ -142,6 +143,24 @@ static inline void decr_context_blocked(struct intel_context *ce)
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
@@ -1080,6 +1099,7 @@ static int steal_guc_id(struct intel_guc *guc)
 
 		list_del_init(&ce->guc_id_link);
 		guc_id = ce->guc_id;
+		clr_context_registered(ce);
 		set_context_guc_id_invalid(ce);
 		return guc_id;
 	} else {
@@ -1184,10 +1204,13 @@ static int register_context(struct intel_context *ce, bool loop)
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
@@ -1243,6 +1266,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
+static inline u8 map_i915_prio_to_guc_prio(int prio);
+
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_runtime_pm *runtime_pm =
@@ -1251,6 +1276,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 desc_idx = ce->guc_id;
 	struct guc_lrc_desc *desc;
+	const struct i915_gem_context *ctx;
+	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
 	int ret = 0;
@@ -1266,6 +1293,12 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
+	rcu_read_lock();
+	ctx = rcu_dereference(ce->gem_context);
+	if (ctx)
+		prio = ctx->sched.priority;
+	rcu_read_unlock();
+
 	reset_lrc_desc(guc, desc_idx);
 	set_lrc_desc_registered(guc, desc_idx, ce);
 
@@ -1274,7 +1307,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
+	desc->priority = ce->guc_prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 	init_sched_state(ce);
@@ -1659,11 +1693,17 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
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
 
@@ -1756,15 +1796,119 @@ static int guc_context_alloc(struct intel_context *ce)
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
+	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
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
@@ -1777,6 +1921,8 @@ static void remove_from_context(struct i915_request *rq)
 	/* Prevent further __await_execution() registering a cb, then flush */
 	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
 
+	guc_prio_fini(rq, ce);
+
 	spin_unlock_irq(&ce->guc_active.lock);
 
 	atomic_dec(&ce->guc_id_ref);
@@ -2058,6 +2204,39 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
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
@@ -2293,6 +2472,10 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 		guc->sched_engine->disabled = guc_sched_engine_disabled;
 		guc->sched_engine->private_data = guc;
 		guc->sched_engine->destroy = guc_sched_engine_destroy;
+		guc->sched_engine->bump_inflight_request_prio =
+			guc_bump_inflight_request_prio;
+		guc->sched_engine->retire_inflight_request_prio =
+			guc_retire_inflight_request_prio;
 		tasklet_setup(&guc->sched_engine->tasklet,
 			      guc_submission_tasklet);
 	}
@@ -2670,6 +2853,22 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 	drm_printf(p, "\n");
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
 void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					     struct drm_printer *p)
 {
@@ -2692,6 +2891,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
 			   ce->guc_state.sched_state,
 			   atomic_read(&ce->guc_sched_state_no_lock));
+
+		guc_log_context_priority(p, ce);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index f3552642b8a1..3fdfada99ba0 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -114,6 +114,9 @@ static void i915_fence_release(struct dma_fence *fence)
 {
 	struct i915_request *rq = to_request(fence);
 
+	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
+		   rq->guc_prio != GUC_PRIO_FINI);
+
 	/*
 	 * The request is put onto a RCU freelist (i.e. the address
 	 * is immediately reused), mark the fences as being freed now.
@@ -922,6 +925,8 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 
 	rq->rcustate = get_state_synchronize_rcu(); /* acts as smp_mb() */
 
+	rq->guc_prio = GUC_PRIO_INIT;
+
 	/* We bump the ref for the fence chain */
 	i915_sw_fence_reinit(&i915_request_get(rq)->submit);
 	i915_sw_fence_reinit(&i915_request_get(rq)->semaphore);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index a3d4728ea06c..f0463d19c712 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -293,6 +293,14 @@ struct i915_request {
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
index 8766a8643469..3fccae3672c1 100644
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
index eaef233e9080..b0a1b58c7893 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -179,6 +179,18 @@ struct i915_sched_engine {
 	void	(*kick_backend)(const struct i915_request *rq,
 				int prio);
 
+	/**
+	 * @bump_inflight_request_prio: update priority of an inflight request
+	 */
+	void	(*bump_inflight_request_prio)(struct i915_request *rq,
+					      int prio);
+
+	/**
+	 * @retire_inflight_request_prio: indicate request is retired to
+	 * priority tracking
+	 */
+	void	(*retire_inflight_request_prio)(struct i915_request *rq);
+
 	/**
 	 * @schedule: adjust priority of request
 	 *
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
index e54f9efaead0..cb0a5396e655 100644
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

