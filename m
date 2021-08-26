Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A63F810E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69926E4D4;
	Thu, 26 Aug 2021 03:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BD16E4BA;
 Thu, 26 Aug 2021 03:28:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217660060"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="217660060"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738592"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 25/27] drm/i915/guc: Drop guc_active move everything into
 guc_state
Date: Wed, 25 Aug 2021 20:23:25 -0700
Message-Id: <20210826032327.18078-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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

Now that we have locking hierarchy of sched_engine->lock ->
ce->guc_state everything from guc_active can be moved into guc_state and
protected the guc_state.lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 10 +--
 drivers/gpu/drm/i915/gt/intel_context_types.h |  7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 88 +++++++++----------
 drivers/gpu/drm/i915/i915_trace.h             |  2 +-
 4 files changed, 49 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 485460a11331..ff637147b1a9 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -394,9 +394,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
-
-	spin_lock_init(&ce->guc_active.lock);
-	INIT_LIST_HEAD(&ce->guc_active.requests);
+	INIT_LIST_HEAD(&ce->guc_state.requests);
 
 	ce->guc_id.id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id.link);
@@ -521,15 +519,15 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
 
-	spin_lock_irqsave(&ce->guc_active.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
 				    sched.link) {
 		if (i915_request_completed(rq))
 			break;
 
 		active = rq;
 	}
-	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 0b00d249c884..5285d660eacf 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -172,11 +172,6 @@ struct intel_context {
 		struct i915_sw_fence blocked;
 		/* GuC committed requests */
 		int number_committed_requests;
-	} guc_state;
-
-	struct {
-		/** lock: protects everything in guc_active */
-		spinlock_t lock;
 		/** requests: active requests on this context */
 		struct list_head requests;
 		/*
@@ -184,7 +179,7 @@ struct intel_context {
 		 */
 		u8 prio;
 		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
-	} guc_active;
+	} guc_state;
 
 	struct {
 		/* GuC LRC descriptor ID */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 044f9dda1397..eb884b48f4b8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -827,9 +827,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
 	unsigned long flags;
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
-	spin_lock(&ce->guc_active.lock);
+	spin_lock(&ce->guc_state.lock);
 	list_for_each_entry_safe_reverse(rq, rn,
-					 &ce->guc_active.requests,
+					 &ce->guc_state.requests,
 					 sched.link) {
 		if (i915_request_completed(rq))
 			continue;
@@ -848,7 +848,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		list_add(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 	}
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
@@ -943,10 +943,10 @@ static void guc_cancel_context_requests(struct intel_context *ce)
 
 	/* Mark all executing requests as skipped. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
-	spin_lock(&ce->guc_active.lock);
-	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
+	spin_lock(&ce->guc_state.lock);
+	list_for_each_entry(rq, &ce->guc_state.requests, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
@@ -1398,7 +1398,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = ce->guc_active.prio;
+	desc->priority = ce->guc_state.prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 
@@ -1794,10 +1794,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 
 static void __guc_context_destroy(struct intel_context *ce)
 {
-	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
-		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
-		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
-		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+	GEM_BUG_ON(ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
+		   ce->guc_state.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
 	GEM_BUG_ON(ce->guc_state.number_committed_requests);
 
 	lrc_fini(ce);
@@ -1907,17 +1907,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
 
 	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
 		   prio > GUC_CLIENT_PRIORITY_NORMAL);
-	lockdep_assert_held(&ce->guc_active.lock);
+	lockdep_assert_held(&ce->guc_state.lock);
 
-	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
+	if (ce->guc_state.prio == prio || submission_disabled(guc) ||
 	    !context_registered(ce)) {
-		ce->guc_active.prio = prio;
+		ce->guc_state.prio = prio;
 		return;
 	}
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
 
-	ce->guc_active.prio = prio;
+	ce->guc_state.prio = prio;
 	trace_intel_context_set_prio(ce);
 }
 
@@ -1936,25 +1936,25 @@ static inline u8 map_i915_prio_to_guc_prio(int prio)
 static inline void add_context_inflight_prio(struct intel_context *ce,
 					     u8 guc_prio)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
 
-	++ce->guc_active.prio_count[guc_prio];
+	++ce->guc_state.prio_count[guc_prio];
 
 	/* Overflow protection */
-	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 }
 
 static inline void sub_context_inflight_prio(struct intel_context *ce,
 					     u8 guc_prio)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
-	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_state.prio_count));
 
 	/* Underflow protection */
-	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
+	GEM_WARN_ON(!ce->guc_state.prio_count[guc_prio]);
 
-	--ce->guc_active.prio_count[guc_prio];
+	--ce->guc_state.prio_count[guc_prio];
 }
 
 static inline void update_context_prio(struct intel_context *ce)
@@ -1965,10 +1965,10 @@ static inline void update_context_prio(struct intel_context *ce)
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
 	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH > GUC_CLIENT_PRIORITY_NORMAL);
 
-	lockdep_assert_held(&ce->guc_active.lock);
+	lockdep_assert_held(&ce->guc_state.lock);
 
-	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
-		if (ce->guc_active.prio_count[i]) {
+	for (i = 0; i < ARRAY_SIZE(ce->guc_state.prio_count); ++i) {
+		if (ce->guc_state.prio_count[i]) {
 			guc_context_set_prio(guc, ce, i);
 			break;
 		}
@@ -1988,8 +1988,8 @@ static void add_to_context(struct i915_request *rq)
 
 	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
 
-	spin_lock(&ce->guc_active.lock);
-	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
+	spin_lock(&ce->guc_state.lock);
+	list_move_tail(&rq->sched.link, &ce->guc_state.requests);
 
 	if (rq->guc_prio == GUC_PRIO_INIT) {
 		rq->guc_prio = new_guc_prio;
@@ -2001,12 +2001,12 @@ static void add_to_context(struct i915_request *rq)
 	}
 	update_context_prio(ce);
 
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
 {
-	lockdep_assert_held(&ce->guc_active.lock);
+	lockdep_assert_held(&ce->guc_state.lock);
 
 	if (rq->guc_prio != GUC_PRIO_INIT &&
 	    rq->guc_prio != GUC_PRIO_FINI) {
@@ -2020,7 +2020,7 @@ static void remove_from_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 
-	spin_lock_irq(&ce->guc_active.lock);
+	spin_lock_irq(&ce->guc_state.lock);
 
 	list_del_init(&rq->sched.link);
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
@@ -2030,10 +2030,8 @@ static void remove_from_context(struct i915_request *rq)
 
 	guc_prio_fini(rq, ce);
 
-	spin_unlock_irq(&ce->guc_active.lock);
-
-	spin_lock_irq(&ce->guc_state.lock);
 	decr_context_committed_requests(ce);
+
 	spin_unlock_irq(&ce->guc_state.lock);
 
 	atomic_dec(&ce->guc_id.ref);
@@ -2121,7 +2119,7 @@ static void guc_context_init(struct intel_context *ce)
 		prio = ctx->sched.priority;
 	rcu_read_unlock();
 
-	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
+	ce->guc_state.prio = map_i915_prio_to_guc_prio(prio);
 	set_bit(CONTEXT_GUC_INIT, &ce->flags);
 }
 
@@ -2355,7 +2353,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
 		return;
 
-	spin_lock(&ce->guc_active.lock);
+	spin_lock(&ce->guc_state.lock);
 	if (rq->guc_prio != GUC_PRIO_FINI) {
 		if (rq->guc_prio != GUC_PRIO_INIT)
 			sub_context_inflight_prio(ce, rq->guc_prio);
@@ -2363,16 +2361,16 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 		add_context_inflight_prio(ce, rq->guc_prio);
 		update_context_prio(ce);
 	}
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void guc_retire_inflight_request_prio(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 
-	spin_lock(&ce->guc_active.lock);
+	spin_lock(&ce->guc_state.lock);
 	guc_prio_fini(rq, ce);
-	spin_unlock(&ce->guc_active.lock);
+	spin_unlock(&ce->guc_state.lock);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
@@ -2938,7 +2936,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 				goto next;
 		}
 
-		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
+		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
 			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
 				continue;
 
@@ -2988,10 +2986,10 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 				goto next;
 		}
 
-		spin_lock(&ce->guc_active.lock);
-		intel_engine_dump_active_requests(&ce->guc_active.requests,
+		spin_lock(&ce->guc_state.lock);
+		intel_engine_dump_active_requests(&ce->guc_state.requests,
 						  hung_rq, m);
-		spin_unlock(&ce->guc_active.lock);
+		spin_unlock(&ce->guc_state.lock);
 
 next:
 		intel_context_put(ce);
@@ -3035,12 +3033,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
 {
 	int i;
 
-	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
+	drm_printf(p, "\t\tPriority: %d\n", ce->guc_state.prio);
 	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
 	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
 	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
 		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
-			   i, ce->guc_active.prio_count[i]);
+			   i, ce->guc_state.prio_count[i]);
 	}
 	drm_printf(p, "\n");
 }
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 0574f5c7a985..ec7fe12b94aa 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
 			   __entry->guc_id = ce->guc_id.id;
 			   __entry->pin_count = atomic_read(&ce->pin_count);
 			   __entry->sched_state = ce->guc_state.sched_state;
-			   __entry->guc_prio = ce->guc_active.prio;
+			   __entry->guc_prio = ce->guc_state.prio;
 			   ),
 
 		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
-- 
2.32.0

