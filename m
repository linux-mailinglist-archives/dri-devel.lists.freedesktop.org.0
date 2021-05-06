Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA7375AC4
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2F6ED05;
	Thu,  6 May 2021 18:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4EE6ED27;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: y06BY0CYIHII43es25diHcPXmoKZ/iHj1ITQV1BNZOcETlrXfwcLjBXH2jfwCOBhmAHDw3OKLm
 v3WtmniVgVgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219439483"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="219439483"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: aYp0qxemIaszAtvwZe9zHM2+xJdG9UaiUTKhwEcNeJfEtwCWWrzDWYFC4UD0tKrsuDwGXC4lEm
 M1Z5AKNWn6OQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583454"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 32/97] drm/i915: Introduce i915_sched_engine object
Date: Thu,  6 May 2021 12:13:46 -0700
Message-Id: <20210506191451.77768-33-matthew.brost@intel.com>
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

Introduce i915_sched_engine object which is lower level data structure
that i915_scheduler / generic code can operate on without touching
execlist specific structures. This allows additional submission backends
to be added without breaking the layer.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  16 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  77 ++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  10 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  42 +--
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   2 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 350 +++++++++++-------
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  13 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |  17 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  36 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |   6 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  75 ++--
 drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
 drivers/gpu/drm/i915/i915_request.c           |  50 +--
 drivers/gpu/drm/i915/i915_request.h           |   2 +-
 drivers/gpu/drm/i915/i915_scheduler.c         | 168 ++++-----
 drivers/gpu/drm/i915/i915_scheduler.h         |  65 +++-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  63 ++++
 21 files changed, 575 insertions(+), 440 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 4b9856d5ba14..af1fbf8e2a9a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -104,8 +104,8 @@ static void fence_set_priority(struct dma_fence *fence,
 	engine = rq->engine;
 
 	rcu_read_lock(); /* RCU serialisation for set-wedged protection */
-	if (engine->schedule)
-		engine->schedule(rq, attr);
+	if (engine->sched_engine->schedule)
+		engine->sched_engine->schedule(rq, attr);
 	rcu_read_unlock();
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 8d9184920c51..988d9688ae4d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -123,20 +123,6 @@ execlists_active(const struct intel_engine_execlists *execlists)
 	return active;
 }
 
-static inline void
-execlists_active_lock_bh(struct intel_engine_execlists *execlists)
-{
-	local_bh_disable(); /* prevent local softirq and lock recursion */
-	tasklet_lock(&execlists->tasklet);
-}
-
-static inline void
-execlists_active_unlock_bh(struct intel_engine_execlists *execlists)
-{
-	tasklet_unlock(&execlists->tasklet);
-	local_bh_enable(); /* restore softirq, and kick ksoftirqd! */
-}
-
 struct i915_request *
 execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists);
 
@@ -257,8 +243,6 @@ intel_engine_find_active_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
 
-void intel_engine_init_active(struct intel_engine_cs *engine,
-			      unsigned int subclass);
 #define ENGINE_PHYSICAL	0
 #define ENGINE_MOCK	1
 #define ENGINE_VIRTUAL	2
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 828e1669f92c..ec82a7ec0c8d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -8,6 +8,7 @@
 #include "gem/i915_gem_context.h"
 
 #include "i915_drv.h"
+#include "i915_scheduler.h"
 
 #include "intel_breadcrumbs.h"
 #include "intel_context.h"
@@ -326,9 +327,6 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 	if (engine->context_size)
 		DRIVER_CAPS(i915)->has_logical_contexts = true;
 
-	/* Nothing to do here, execute in order of dependencies */
-	engine->schedule = NULL;
-
 	ewma__engine_latency_init(&engine->latency);
 	seqcount_init(&engine->stats.lock);
 
@@ -583,9 +581,6 @@ void intel_engine_init_execlists(struct intel_engine_cs *engine)
 	memset(execlists->pending, 0, sizeof(execlists->pending));
 	execlists->active =
 		memset(execlists->inflight, 0, sizeof(execlists->inflight));
-
-	execlists->queue_priority_hint = INT_MIN;
-	execlists->queue = RB_ROOT_CACHED;
 }
 
 static void cleanup_status_page(struct intel_engine_cs *engine)
@@ -712,11 +707,17 @@ static int engine_setup_common(struct intel_engine_cs *engine)
 		goto err_status;
 	}
 
+	engine->sched_engine = i915_sched_engine_create(ENGINE_PHYSICAL);
+	if (!engine->sched_engine) {
+		err = -ENOMEM;
+		goto err_sched_engine;
+	}
+	engine->sched_engine->engine = engine;
+
 	err = intel_engine_init_cmd_parser(engine);
 	if (err)
 		goto err_cmd_parser;
 
-	intel_engine_init_active(engine, ENGINE_PHYSICAL);
 	intel_engine_init_execlists(engine);
 	intel_engine_init__pm(engine);
 	intel_engine_init_retire(engine);
@@ -735,6 +736,8 @@ static int engine_setup_common(struct intel_engine_cs *engine)
 	return 0;
 
 err_cmd_parser:
+	i915_sched_engine_put(engine->sched_engine);
+err_sched_engine:
 	intel_breadcrumbs_free(engine->breadcrumbs);
 err_status:
 	cleanup_status_page(engine);
@@ -773,11 +776,11 @@ static int measure_breadcrumb_dw(struct intel_context *ce)
 	frame->rq.ring = &frame->ring;
 
 	mutex_lock(&ce->timeline->mutex);
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 
 	dw = engine->emit_fini_breadcrumb(&frame->rq, frame->cs) - frame->cs;
 
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 	mutex_unlock(&ce->timeline->mutex);
 
 	GEM_BUG_ON(dw & 1); /* RING_TAIL must be qword aligned */
@@ -786,28 +789,6 @@ static int measure_breadcrumb_dw(struct intel_context *ce)
 	return dw;
 }
 
-void
-intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
-{
-	INIT_LIST_HEAD(&engine->active.requests);
-	INIT_LIST_HEAD(&engine->active.hold);
-
-	spin_lock_init(&engine->active.lock);
-	lockdep_set_subclass(&engine->active.lock, subclass);
-
-	/*
-	 * Due to an interesting quirk in lockdep's internal debug tracking,
-	 * after setting a subclass we must ensure the lock is used. Otherwise,
-	 * nr_unused_locks is incremented once too often.
-	 */
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	local_irq_disable();
-	lock_map_acquire(&engine->active.lock.dep_map);
-	lock_map_release(&engine->active.lock.dep_map);
-	local_irq_enable();
-#endif
-}
-
 static struct intel_context *
 create_pinned_context(struct intel_engine_cs *engine,
 		      unsigned int hwsp,
@@ -955,10 +936,10 @@ int intel_engines_init(struct intel_gt *gt)
  */
 void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 {
-	GEM_BUG_ON(!list_empty(&engine->active.requests));
-	tasklet_kill(&engine->execlists.tasklet); /* flush the callback */
+	GEM_BUG_ON(!list_empty(&engine->sched_engine->requests));
 
 	intel_breadcrumbs_free(engine->breadcrumbs);
+	i915_sched_engine_put(engine->sched_engine);
 
 	intel_engine_fini_retire(engine);
 	intel_engine_cleanup_cmd_parser(engine);
@@ -1241,7 +1222,7 @@ static bool ring_is_idle(struct intel_engine_cs *engine)
 
 void __intel_engine_flush_submission(struct intel_engine_cs *engine, bool sync)
 {
-	struct tasklet_struct *t = &engine->execlists.tasklet;
+	struct tasklet_struct *t = &engine->sched_engine->tasklet;
 
 	if (!t->callback)
 		return;
@@ -1281,7 +1262,7 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 	intel_engine_flush_submission(engine);
 
 	/* ELSP is empty, but there are ready requests? E.g. after reset */
-	if (!RB_EMPTY_ROOT(&engine->execlists.queue.rb_root))
+	if (!i915_sched_engine_is_empty(engine->sched_engine))
 		return false;
 
 	/* Ring stopped? */
@@ -1347,7 +1328,7 @@ static struct intel_timeline *get_timeline(struct i915_request *rq)
 	struct intel_timeline *tl;
 
 	/*
-	 * Even though we are holding the engine->active.lock here, there
+	 * Even though we are holding the engine->sched_engine->lock here, there
 	 * is no control over the submission queue per-se and we are
 	 * inspecting the active state at a random point in time, with an
 	 * unknown queue. Play safe and make sure the timeline remains valid.
@@ -1502,10 +1483,10 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 
 		drm_printf(m, "\tExeclist tasklet queued? %s (%s), preempt? %s, timeslice? %s\n",
 			   yesno(test_bit(TASKLET_STATE_SCHED,
-					  &engine->execlists.tasklet.state)),
-			   enableddisabled(!atomic_read(&engine->execlists.tasklet.count)),
-			   repr_timer(&engine->execlists.preempt),
-			   repr_timer(&engine->execlists.timer));
+					  &engine->sched_engine->tasklet.state)),
+			   enableddisabled(!atomic_read(&engine->sched_engine->tasklet.count)),
+			   repr_timer(&execlists->preempt),
+			   repr_timer(&execlists->timer));
 
 		read = execlists->csb_head;
 		write = READ_ONCE(*execlists->csb_write);
@@ -1527,7 +1508,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 				   idx, hws[idx * 2], hws[idx * 2 + 1]);
 		}
 
-		execlists_active_lock_bh(execlists);
+		sched_engine_active_lock_bh(engine->sched_engine);
 		rcu_read_lock();
 		for (port = execlists->active; (rq = *port); port++) {
 			char hdr[160];
@@ -1558,7 +1539,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 			i915_request_show(m, rq, hdr, 0);
 		}
 		rcu_read_unlock();
-		execlists_active_unlock_bh(execlists);
+		sched_engine_active_unlock_bh(engine->sched_engine);
 	} else if (INTEL_GEN(dev_priv) > 6) {
 		drm_printf(m, "\tPP_DIR_BASE: 0x%08x\n",
 			   ENGINE_READ(engine, RING_PP_DIR_BASE));
@@ -1694,7 +1675,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 
 	drm_printf(m, "\tRequests:\n");
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	rq = intel_engine_find_active_request(engine);
 	if (rq) {
 		struct intel_timeline *tl = get_timeline(rq);
@@ -1725,8 +1706,9 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 			hexdump(m, rq->context->lrc_reg_state, PAGE_SIZE);
 		}
 	}
-	drm_printf(m, "\tOn hold?: %lu\n", list_count(&engine->active.hold));
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	drm_printf(m, "\tOn hold?: %lu\n",
+		   list_count(&engine->sched_engine->hold));
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 
 	drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
 	wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
@@ -1806,7 +1788,7 @@ intel_engine_find_active_request(struct intel_engine_cs *engine)
 	 * At all other times, we must assume the GPU is still running, but
 	 * we only care about the snapshot of this moment.
 	 */
-	lockdep_assert_held(&engine->active.lock);
+	lockdep_assert_held(&engine->sched_engine->lock);
 
 	rcu_read_lock();
 	request = execlists_active(&engine->execlists);
@@ -1824,7 +1806,8 @@ intel_engine_find_active_request(struct intel_engine_cs *engine)
 	if (active)
 		return active;
 
-	list_for_each_entry(request, &engine->active.requests, sched.link) {
+	list_for_each_entry(request, &engine->sched_engine->requests,
+			    sched.link) {
 		if (__i915_request_is_complete(request))
 			continue;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index b99ac41695f3..b6a305e6a974 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -121,7 +121,7 @@ static void heartbeat(struct work_struct *wrk)
 			 * but all other contexts, including the kernel
 			 * context are stuck waiting for the signal.
 			 */
-		} else if (engine->schedule &&
+		} else if (engine->sched_engine->schedule &&
 			   rq->sched.attr.priority < I915_PRIORITY_BARRIER) {
 			/*
 			 * Gradually raise the priority of the heartbeat to
@@ -136,7 +136,7 @@ static void heartbeat(struct work_struct *wrk)
 				attr.priority = I915_PRIORITY_BARRIER;
 
 			local_bh_disable();
-			engine->schedule(rq, &attr);
+			engine->sched_engine->schedule(rq, &attr);
 			local_bh_enable();
 		} else {
 			if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 47f4397095e5..ba6a9931c4e8 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -274,14 +274,16 @@ static int __engine_park(struct intel_wakeref *wf)
 	intel_engine_park_heartbeat(engine);
 	intel_breadcrumbs_park(engine->breadcrumbs);
 
-	/* Must be reset upon idling, or we may miss the busy wakeup. */
-	GEM_BUG_ON(engine->execlists.queue_priority_hint != INT_MIN);
+	/*
+	 * XXX: Must be reset upon idling, or we may miss the busy wakeup.
+	 * queue_priority_hint only used in execlists submission but works in
+	 * other modes as default is INT_MIN.
+	 */
+	GEM_BUG_ON(engine->sched_engine->queue_priority_hint != INT_MIN);
 
 	if (engine->park)
 		engine->park(engine);
 
-	engine->execlists.no_priolist = false;
-
 	/* While gt calls i915_vma_parked(), we have to break the lock cycle */
 	intel_gt_pm_put_async(engine->gt);
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 9ef349cd5cea..93aa22680db0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -59,6 +59,7 @@ struct drm_i915_reg_table;
 struct i915_gem_context;
 struct i915_request;
 struct i915_sched_attr;
+struct i915_sched_engine;
 struct intel_gt;
 struct intel_ring;
 struct intel_uncore;
@@ -137,11 +138,6 @@ struct st_preempt_hang {
  * driver and the hardware state for execlist mode of submission.
  */
 struct intel_engine_execlists {
-	/**
-	 * @tasklet: softirq tasklet for bottom handler
-	 */
-	struct tasklet_struct tasklet;
-
 	/**
 	 * @timer: kick the current context if its timeslice expires
 	 */
@@ -152,11 +148,6 @@ struct intel_engine_execlists {
 	 */
 	struct timer_list preempt;
 
-	/**
-	 * @default_priolist: priority list for I915_PRIORITY_NORMAL
-	 */
-	struct i915_priolist default_priolist;
-
 	/**
 	 * @ccid: identifier for contexts submitted to this engine
 	 */
@@ -191,11 +182,6 @@ struct intel_engine_execlists {
 	 */
 	u32 reset_ccid;
 
-	/**
-	 * @no_priolist: priority lists disabled
-	 */
-	bool no_priolist;
-
 	/**
 	 * @submit_reg: gen-specific execlist submission register
 	 * set to the ExecList Submission Port (elsp) register pre-Gen11 and to
@@ -238,23 +224,8 @@ struct intel_engine_execlists {
 	unsigned int port_mask;
 
 	/**
-	 * @queue_priority_hint: Highest pending priority.
-	 *
-	 * When we add requests into the queue, or adjust the priority of
-	 * executing requests, we compute the maximum priority of those
-	 * pending requests. We can then use this value to determine if
-	 * we need to preempt the executing requests to service the queue.
-	 * However, since the we may have recorded the priority of an inflight
-	 * request we wanted to preempt but since completed, at the time of
-	 * dequeuing the priority hint may no longer may match the highest
-	 * available request priority.
+	 * @virtual: virtual of requests, in priority lists
 	 */
-	int queue_priority_hint;
-
-	/**
-	 * @queue: queue of requests, in priority lists
-	 */
-	struct rb_root_cached queue;
 	struct rb_root_cached virtual;
 
 	/**
@@ -326,11 +297,7 @@ struct intel_engine_cs {
 
 	struct intel_sseu sseu;
 
-	struct {
-		spinlock_t lock;
-		struct list_head requests;
-		struct list_head hold; /* ready requests, but on hold */
-	} active;
+	struct i915_sched_engine *sched_engine;
 
 	/* keep a request in reserve for a [pm] barrier under oom */
 	struct i915_request *request_pool;
@@ -459,9 +426,6 @@ struct intel_engine_cs {
 	 * dependencies may need rescheduling. Note the request itself may
 	 * not be ready to run!
 	 */
-	void		(*schedule)(struct i915_request *request,
-				    const struct i915_sched_attr *attr);
-
 	void		(*release)(struct intel_engine_cs *engine);
 
 	struct intel_engine_execlists execlists;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 1cbd84eb24e4..d6dcdeace174 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -107,7 +107,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 	for_each_uabi_engine(engine, i915) { /* all engines must agree! */
 		int i;
 
-		if (engine->schedule)
+		if (engine->sched_engine->schedule)
 			enabled |= (I915_SCHEDULER_CAP_ENABLED |
 				    I915_SCHEDULER_CAP_PRIORITY);
 		else
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 8db200422950..0927a2416b52 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -273,11 +273,11 @@ static int effective_prio(const struct i915_request *rq)
 	return prio;
 }
 
-static int queue_prio(const struct intel_engine_execlists *execlists)
+static int queue_prio(const struct i915_sched_engine *sched_engine)
 {
 	struct rb_node *rb;
 
-	rb = rb_first_cached(&execlists->queue);
+	rb = rb_first_cached(&sched_engine->queue);
 	if (!rb)
 		return INT_MIN;
 
@@ -318,14 +318,14 @@ static bool need_preempt(const struct intel_engine_cs *engine,
 	 * to preserve FIFO ordering of dependencies.
 	 */
 	last_prio = max(effective_prio(rq), I915_PRIORITY_NORMAL - 1);
-	if (engine->execlists.queue_priority_hint <= last_prio)
+	if (engine->sched_engine->queue_priority_hint <= last_prio)
 		return false;
 
 	/*
 	 * Check against the first request in ELSP[1], it will, thanks to the
 	 * power of PI, be the highest priority of that context.
 	 */
-	if (!list_is_last(&rq->sched.link, &engine->active.requests) &&
+	if (!list_is_last(&rq->sched.link, &engine->sched_engine->requests) &&
 	    rq_prio(list_next_entry(rq, sched.link)) > last_prio)
 		return true;
 
@@ -340,7 +340,7 @@ static bool need_preempt(const struct intel_engine_cs *engine,
 	 * context, it's priority would not exceed ELSP[0] aka last_prio.
 	 */
 	return max(virtual_prio(&engine->execlists),
-		   queue_prio(&engine->execlists)) > last_prio;
+		   queue_prio(engine->sched_engine)) > last_prio;
 }
 
 __maybe_unused static bool
@@ -367,10 +367,10 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 	struct list_head *pl;
 	int prio = I915_PRIORITY_INVALID;
 
-	lockdep_assert_held(&engine->active.lock);
+	lockdep_assert_held(&engine->sched_engine->lock);
 
 	list_for_each_entry_safe_reverse(rq, rn,
-					 &engine->active.requests,
+					 &engine->sched_engine->requests,
 					 sched.link) {
 		if (__i915_request_is_complete(rq)) {
 			list_del_init(&rq->sched.link);
@@ -382,9 +382,10 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 		GEM_BUG_ON(rq_prio(rq) == I915_PRIORITY_INVALID);
 		if (rq_prio(rq) != prio) {
 			prio = rq_prio(rq);
-			pl = i915_sched_lookup_priolist(engine, prio);
+			pl = i915_sched_lookup_priolist(engine->sched_engine,
+							prio);
 		}
-		GEM_BUG_ON(RB_EMPTY_ROOT(&engine->execlists.queue.rb_root));
+		GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 
 		list_move(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
@@ -534,13 +535,13 @@ resubmit_virtual_request(struct i915_request *rq, struct virtual_engine *ve)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 	WRITE_ONCE(rq->engine, &ve->base);
 	ve->base.submit_request(rq);
 
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 }
 
 static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
@@ -569,7 +570,7 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
 		resubmit_virtual_request(rq, ve);
 
 	if (READ_ONCE(ve->request))
-		tasklet_hi_schedule(&ve->base.execlists.tasklet);
+		i915_sched_engine_hi_kick(ve->base.sched_engine);
 }
 
 static void __execlists_schedule_out(struct i915_request * const rq,
@@ -579,7 +580,7 @@ static void __execlists_schedule_out(struct i915_request * const rq,
 	unsigned int ccid;
 
 	/*
-	 * NB process_csb() is not under the engine->active.lock and hence
+	 * NB process_csb() is not under the engine->sched_engine->lock and hence
 	 * schedule_out can race with schedule_in meaning that we should
 	 * refrain from doing non-trivial work here.
 	 */
@@ -721,12 +722,11 @@ dump_port(char *buf, int buflen, const char *prefix, struct i915_request *rq)
 }
 
 static __maybe_unused noinline void
-trace_ports(const struct intel_engine_execlists *execlists,
+trace_ports(const struct intel_engine_cs *engine,
+	    const struct intel_engine_execlists *execlists,
 	    const char *msg,
 	    struct i915_request * const *ports)
 {
-	const struct intel_engine_cs *engine =
-		container_of(execlists, typeof(*engine), execlists);
 	char __maybe_unused p0[40], p1[40];
 
 	if (!ports[0])
@@ -738,25 +738,24 @@ trace_ports(const struct intel_engine_execlists *execlists,
 }
 
 static bool
-reset_in_progress(const struct intel_engine_execlists *execlists)
+reset_in_progress(const struct intel_engine_cs *engine)
 {
-	return unlikely(!__tasklet_is_enabled(&execlists->tasklet));
+	return unlikely(!__tasklet_is_enabled(&engine->sched_engine->tasklet));
 }
 
 static __maybe_unused noinline bool
-assert_pending_valid(const struct intel_engine_execlists *execlists,
+assert_pending_valid(struct intel_engine_cs *engine,
+		     const struct intel_engine_execlists *execlists,
 		     const char *msg)
 {
-	struct intel_engine_cs *engine =
-		container_of(execlists, typeof(*engine), execlists);
 	struct i915_request * const *port, *rq, *prev = NULL;
 	struct intel_context *ce = NULL;
 	u32 ccid = -1;
 
-	trace_ports(execlists, msg, execlists->pending);
+	trace_ports(engine, execlists, msg, execlists->pending);
 
 	/* We may be messing around with the lists during reset, lalala */
-	if (reset_in_progress(execlists))
+	if (reset_in_progress(engine))
 		return true;
 
 	if (!execlists->pending[0]) {
@@ -878,7 +877,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
 	struct intel_engine_execlists *execlists = &engine->execlists;
 	unsigned int n;
 
-	GEM_BUG_ON(!assert_pending_valid(execlists, "submit"));
+	GEM_BUG_ON(!assert_pending_valid(engine, execlists, "submit"));
 
 	/*
 	 * We can skip acquiring intel_runtime_pm_get() here as it was taken
@@ -1096,7 +1095,8 @@ static void defer_active(struct intel_engine_cs *engine)
 	if (!rq)
 		return;
 
-	defer_request(rq, i915_sched_lookup_priolist(engine, rq_prio(rq)));
+	defer_request(rq, i915_sched_lookup_priolist(engine->sched_engine,
+						     rq_prio(rq)));
 }
 
 static bool
@@ -1133,13 +1133,14 @@ static bool needs_timeslice(const struct intel_engine_cs *engine,
 		return false;
 
 	/* If ELSP[1] is occupied, always check to see if worth slicing */
-	if (!list_is_last_rcu(&rq->sched.link, &engine->active.requests)) {
+	if (!list_is_last_rcu(&rq->sched.link,
+			      &engine->sched_engine->requests)) {
 		ENGINE_TRACE(engine, "timeslice required for second inflight context\n");
 		return true;
 	}
 
 	/* Otherwise, ELSP[0] is by itself, but may be waiting in the queue */
-	if (!RB_EMPTY_ROOT(&engine->execlists.queue.rb_root)) {
+	if (!i915_sched_engine_is_empty(engine->sched_engine)) {
 		ENGINE_TRACE(engine, "timeslice required for queue\n");
 		return true;
 	}
@@ -1187,7 +1188,7 @@ static void start_timeslice(struct intel_engine_cs *engine)
 			 * its timeslice, so recheck.
 			 */
 			if (!timer_pending(&el->timer))
-				tasklet_hi_schedule(&el->tasklet);
+				i915_sched_engine_hi_kick(engine->sched_engine);
 			return;
 		}
 
@@ -1235,6 +1236,7 @@ static bool completed(const struct i915_request *rq)
 
 static void execlists_dequeue(struct intel_engine_cs *engine)
 {
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_request **port = execlists->pending;
 	struct i915_request ** const last_port = port + execlists->port_mask;
@@ -1265,7 +1267,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 	 * and context switches) submission.
 	 */
 
-	spin_lock(&engine->active.lock);
+	spin_lock(&engine->sched_engine->lock);
 
 	/*
 	 * If the queue is higher priority than the last
@@ -1287,7 +1289,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 				     last->fence.context,
 				     last->fence.seqno,
 				     last->sched.attr.priority,
-				     execlists->queue_priority_hint);
+				     sched_engine->queue_priority_hint);
 			record_preemption(execlists);
 
 			/*
@@ -1313,7 +1315,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 				     yesno(timer_expired(&execlists->timer)),
 				     last->fence.context, last->fence.seqno,
 				     rq_prio(last),
-				     execlists->queue_priority_hint,
+				     sched_engine->queue_priority_hint,
 				     yesno(timeslice_yield(execlists, last)));
 
 			/*
@@ -1365,7 +1367,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 				 * Even if ELSP[1] is occupied and not worthy
 				 * of timeslices, our queue might be.
 				 */
-				spin_unlock(&engine->active.lock);
+				spin_unlock(&sched_engine->lock);
 				return;
 			}
 		}
@@ -1375,7 +1377,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 	while ((ve = first_virtual_engine(engine))) {
 		struct i915_request *rq;
 
-		spin_lock(&ve->base.active.lock);
+		spin_lock(&ve->base.sched_engine->lock);
 
 		rq = ve->request;
 		if (unlikely(!virtual_matches(ve, rq, engine)))
@@ -1384,14 +1386,14 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 		GEM_BUG_ON(rq->engine != &ve->base);
 		GEM_BUG_ON(rq->context != &ve->context);
 
-		if (unlikely(rq_prio(rq) < queue_prio(execlists))) {
-			spin_unlock(&ve->base.active.lock);
+		if (unlikely(rq_prio(rq) < queue_prio(sched_engine))) {
+			spin_unlock(&ve->base.sched_engine->lock);
 			break;
 		}
 
 		if (last && !can_merge_rq(last, rq)) {
-			spin_unlock(&ve->base.active.lock);
-			spin_unlock(&engine->active.lock);
+			spin_unlock(&ve->base.sched_engine->lock);
+			spin_unlock(&sched_engine->lock);
 			return; /* leave this for another sibling */
 		}
 
@@ -1405,7 +1407,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			     yesno(engine != ve->siblings[0]));
 
 		WRITE_ONCE(ve->request, NULL);
-		WRITE_ONCE(ve->base.execlists.queue_priority_hint, INT_MIN);
+		WRITE_ONCE(ve->base.sched_engine->queue_priority_hint, INT_MIN);
 
 		rb = &ve->nodes[engine->id].rb;
 		rb_erase_cached(rb, &execlists->virtual);
@@ -1437,7 +1439,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 
 		i915_request_put(rq);
 unlock:
-		spin_unlock(&ve->base.active.lock);
+		spin_unlock(&ve->base.sched_engine->lock);
 
 		/*
 		 * Hmm, we have a bunch of virtual engine requests,
@@ -1450,7 +1452,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			break;
 	}
 
-	while ((rb = rb_first_cached(&execlists->queue))) {
+	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 		struct i915_request *rq, *rn;
 
@@ -1529,7 +1531,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			}
 		}
 
-		rb_erase_cached(&p->node, &execlists->queue);
+		rb_erase_cached(&p->node, &sched_engine->queue);
 		i915_priolist_free(p);
 	}
 done:
@@ -1551,8 +1553,9 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 	 * request triggering preemption on the next dequeue (or subsequent
 	 * interrupt for secondary ports).
 	 */
-	execlists->queue_priority_hint = queue_prio(execlists);
-	spin_unlock(&engine->active.lock);
+	sched_engine->queue_priority_hint = queue_prio(sched_engine);
+	i915_sched_engine_reset_on_empty(sched_engine);
+	spin_unlock(&sched_engine->lock);
 
 	/*
 	 * We can skip poking the HW if we ended up with exactly the same set
@@ -1767,8 +1770,8 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 	 * access. Either we are inside the tasklet, or the tasklet is disabled
 	 * and we assume that is only inside the reset paths and so serialised.
 	 */
-	GEM_BUG_ON(!tasklet_is_locked(&execlists->tasklet) &&
-		   !reset_in_progress(execlists));
+	GEM_BUG_ON(!tasklet_is_locked(&engine->sched_engine->tasklet) &&
+		   !reset_in_progress(engine));
 
 	/*
 	 * Note that csb_write, csb_status may be either in HWSP or mmio.
@@ -1866,12 +1869,12 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 			smp_wmb(); /* notify execlists_active() */
 
 			/* cancel old inflight, prepare for switch */
-			trace_ports(execlists, "preempted", old);
+			trace_ports(engine, execlists, "preempted", old);
 			while (*old)
 				*inactive++ = *old++;
 
 			/* switch pending to inflight */
-			GEM_BUG_ON(!assert_pending_valid(execlists, "promote"));
+			GEM_BUG_ON(!assert_pending_valid(engine, execlists, "promote"));
 			copy_ports(execlists->inflight,
 				   execlists->pending,
 				   execlists_num_ports(execlists));
@@ -1889,7 +1892,7 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 			}
 
 			/* port0 completed, advanced to port1 */
-			trace_ports(execlists, "completed", execlists->active);
+			trace_ports(engine, execlists, "completed", execlists->active);
 
 			/*
 			 * We rely on the hardware being strongly
@@ -1979,7 +1982,7 @@ static void __execlists_hold(struct i915_request *rq)
 			__i915_request_unsubmit(rq);
 
 		clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
-		list_move_tail(&rq->sched.link, &rq->engine->active.hold);
+		list_move_tail(&rq->sched.link, &rq->engine->sched_engine->hold);
 		i915_request_set_hold(rq);
 		RQ_TRACE(rq, "on hold\n");
 
@@ -2016,7 +2019,7 @@ static bool execlists_hold(struct intel_engine_cs *engine,
 	if (i915_request_on_hold(rq))
 		return false;
 
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 
 	if (__i915_request_is_complete(rq)) { /* too late! */
 		rq = NULL;
@@ -2032,10 +2035,10 @@ static bool execlists_hold(struct intel_engine_cs *engine,
 	GEM_BUG_ON(i915_request_on_hold(rq));
 	GEM_BUG_ON(rq->engine != engine);
 	__execlists_hold(rq);
-	GEM_BUG_ON(list_empty(&engine->active.hold));
+	GEM_BUG_ON(list_empty(&engine->sched_engine->hold));
 
 unlock:
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 	return rq;
 }
 
@@ -2079,7 +2082,7 @@ static void __execlists_unhold(struct i915_request *rq)
 
 		i915_request_clear_hold(rq);
 		list_move_tail(&rq->sched.link,
-			       i915_sched_lookup_priolist(rq->engine,
+			       i915_sched_lookup_priolist(rq->engine->sched_engine,
 							  rq_prio(rq)));
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 
@@ -2115,7 +2118,7 @@ static void __execlists_unhold(struct i915_request *rq)
 static void execlists_unhold(struct intel_engine_cs *engine,
 			     struct i915_request *rq)
 {
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 
 	/*
 	 * Move this request back to the priority queue, and all of its
@@ -2123,12 +2126,12 @@ static void execlists_unhold(struct intel_engine_cs *engine,
 	 */
 	__execlists_unhold(rq);
 
-	if (rq_prio(rq) > engine->execlists.queue_priority_hint) {
-		engine->execlists.queue_priority_hint = rq_prio(rq);
-		tasklet_hi_schedule(&engine->execlists.tasklet);
+	if (rq_prio(rq) > engine->sched_engine->queue_priority_hint) {
+		engine->sched_engine->queue_priority_hint = rq_prio(rq);
+		i915_sched_engine_hi_kick(engine->sched_engine);
 	}
 
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 }
 
 struct execlists_capture {
@@ -2258,13 +2261,13 @@ static void execlists_capture(struct intel_engine_cs *engine)
 	if (!cap)
 		return;
 
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 	cap->rq = active_context(engine, active_ccid(engine));
 	if (cap->rq) {
 		cap->rq = active_request(cap->rq->context->timeline, cap->rq);
 		cap->rq = i915_request_get_rcu(cap->rq);
 	}
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 	if (!cap->rq)
 		goto err_free;
 
@@ -2316,13 +2319,13 @@ static void execlists_reset(struct intel_engine_cs *engine, const char *msg)
 	ENGINE_TRACE(engine, "reset for %s\n", msg);
 
 	/* Mark this tasklet as disabled to avoid waiting for it to complete */
-	tasklet_disable_nosync(&engine->execlists.tasklet);
+	tasklet_disable_nosync(&engine->sched_engine->tasklet);
 
 	ring_set_paused(engine, 1); /* Freeze the current request in place */
 	execlists_capture(engine);
 	intel_engine_reset(engine, msg);
 
-	tasklet_enable(&engine->execlists.tasklet);
+	tasklet_enable(&engine->sched_engine->tasklet);
 	clear_and_wake_up_bit(bit, lock);
 }
 
@@ -2345,8 +2348,9 @@ static bool preempt_timeout(const struct intel_engine_cs *const engine)
  */
 static void execlists_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine =
-		from_tasklet(engine, t, execlists.tasklet);
+	struct i915_sched_engine *sched_engine =
+		from_tasklet(sched_engine, t, tasklet);
+	struct intel_engine_cs * const engine = sched_engine->engine;
 	struct i915_request *post[2 * EXECLIST_MAX_PORTS];
 	struct i915_request **inactive;
 
@@ -2421,13 +2425,16 @@ static void execlists_irq_handler(struct intel_engine_cs *engine, u16 iir)
 		intel_engine_signal_breadcrumbs(engine);
 
 	if (tasklet)
-		tasklet_hi_schedule(&engine->execlists.tasklet);
+		i915_sched_engine_hi_kick(engine->sched_engine);
 }
 
 static void __execlists_kick(struct intel_engine_execlists *execlists)
 {
+	struct intel_engine_cs *engine =
+		container_of(execlists, typeof(*engine), execlists);
+
 	/* Kick the tasklet for some interrupt coalescing and reset handling */
-	tasklet_hi_schedule(&execlists->tasklet);
+	i915_sched_engine_hi_kick(engine->sched_engine);
 }
 
 #define execlists_kick(t, member) \
@@ -2448,19 +2455,20 @@ static void queue_request(struct intel_engine_cs *engine,
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
-		      i915_sched_lookup_priolist(engine, rq_prio(rq)));
+		      i915_sched_lookup_priolist(engine->sched_engine,
+						 rq_prio(rq)));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
 static bool submit_queue(struct intel_engine_cs *engine,
 			 const struct i915_request *rq)
 {
-	struct intel_engine_execlists *execlists = &engine->execlists;
+	struct i915_sched_engine *sched_engine = engine->sched_engine;
 
-	if (rq_prio(rq) <= execlists->queue_priority_hint)
+	if (rq_prio(rq) <= sched_engine->queue_priority_hint)
 		return false;
 
-	execlists->queue_priority_hint = rq_prio(rq);
+	sched_engine->queue_priority_hint = rq_prio(rq);
 	return true;
 }
 
@@ -2468,7 +2476,7 @@ static bool ancestor_on_hold(const struct intel_engine_cs *engine,
 			     const struct i915_request *rq)
 {
 	GEM_BUG_ON(i915_request_on_hold(rq));
-	return !list_empty(&engine->active.hold) && hold_request(rq);
+	return !list_empty(&engine->sched_engine->hold) && hold_request(rq);
 }
 
 static void execlists_submit_request(struct i915_request *request)
@@ -2477,23 +2485,24 @@ static void execlists_submit_request(struct i915_request *request)
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	if (unlikely(ancestor_on_hold(engine, request))) {
 		RQ_TRACE(request, "ancestor on hold\n");
-		list_add_tail(&request->sched.link, &engine->active.hold);
+		list_add_tail(&request->sched.link,
+			      &engine->sched_engine->hold);
 		i915_request_set_hold(request);
 	} else {
 		queue_request(engine, request);
 
-		GEM_BUG_ON(RB_EMPTY_ROOT(&engine->execlists.queue.rb_root));
+		GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 		GEM_BUG_ON(list_empty(&request->sched.link));
 
 		if (submit_queue(engine, request))
-			__execlists_kick(&engine->execlists);
+			i915_sched_engine_hi_kick(engine->sched_engine);
 	}
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static int
@@ -2800,10 +2809,10 @@ static int execlists_resume(struct intel_engine_cs *engine)
 
 static void execlists_reset_prepare(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 
 	ENGINE_TRACE(engine, "depth<-%d\n",
-		     atomic_read(&execlists->tasklet.count));
+		     atomic_read(&sched_engine->tasklet.count));
 
 	/*
 	 * Prevent request submission to the hardware until we have
@@ -2814,8 +2823,8 @@ static void execlists_reset_prepare(struct intel_engine_cs *engine)
 	 * Turning off the execlists->tasklet until the reset is over
 	 * prevents the race.
 	 */
-	__tasklet_disable_sync_once(&execlists->tasklet);
-	GEM_BUG_ON(!reset_in_progress(execlists));
+	__tasklet_disable_sync_once(&sched_engine->tasklet);
+	GEM_BUG_ON(!reset_in_progress(engine));
 
 	/*
 	 * We stop engines, otherwise we might get failed reset and a
@@ -2957,23 +2966,25 @@ static void execlists_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 
 	/* Push back any incomplete requests for replay after the reset. */
 	rcu_read_lock();
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	__unwind_incomplete_requests(engine);
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 	rcu_read_unlock();
 }
 
 static void nop_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine =
-		from_tasklet(engine, t, execlists.tasklet);
+	struct i915_sched_engine *sched_engine =
+		from_tasklet(sched_engine, t, tasklet);
+	struct intel_engine_cs * const engine = sched_engine->engine;
 
 	/* The driver is wedged; don't process any more events. */
-	WRITE_ONCE(engine->execlists.queue_priority_hint, INT_MIN);
+	WRITE_ONCE(engine->sched_engine->queue_priority_hint, INT_MIN);
 }
 
 static void execlists_reset_cancel(struct intel_engine_cs *engine)
 {
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_request *rq, *rn;
 	struct rb_node *rb;
@@ -2998,15 +3009,15 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 	execlists_reset_csb(engine, true);
 
 	rcu_read_lock();
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&sched_engine->lock, flags);
 
 	/* Mark all executing requests as skipped. */
-	list_for_each_entry(rq, &engine->active.requests, sched.link)
+	list_for_each_entry(rq, &sched_engine->requests, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
 	intel_engine_signal_breadcrumbs(engine);
 
 	/* Flush the queued requests to the timeline list (for retiring). */
-	while ((rb = rb_first_cached(&execlists->queue))) {
+	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 
 		priolist_for_each_request_consume(rq, rn, p) {
@@ -3016,12 +3027,12 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 			}
 		}
 
-		rb_erase_cached(&p->node, &execlists->queue);
+		rb_erase_cached(&p->node, &sched_engine->queue);
 		i915_priolist_free(p);
 	}
 
 	/* On-hold requests will be flushed to timeline upon their release */
-	list_for_each_entry(rq, &engine->active.hold, sched.link)
+	list_for_each_entry(rq, &sched_engine->hold, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
 
 	/* Cancel all attached virtual engines */
@@ -3032,7 +3043,7 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 		rb_erase_cached(rb, &execlists->virtual);
 		RB_CLEAR_NODE(rb);
 
-		spin_lock(&ve->base.active.lock);
+		spin_lock(&ve->base.sched_engine->lock);
 		rq = fetch_and_zero(&ve->request);
 		if (rq) {
 			if (i915_request_mark_eio(rq)) {
@@ -3042,26 +3053,26 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 			}
 			i915_request_put(rq);
 
-			ve->base.execlists.queue_priority_hint = INT_MIN;
+			ve->base.sched_engine->queue_priority_hint = INT_MIN;
 		}
-		spin_unlock(&ve->base.active.lock);
+		spin_unlock(&ve->base.sched_engine->lock);
 	}
 
 	/* Remaining _unready_ requests will be nop'ed when submitted */
 
-	execlists->queue_priority_hint = INT_MIN;
-	execlists->queue = RB_ROOT_CACHED;
+	sched_engine->queue_priority_hint = INT_MIN;
+	sched_engine->queue = RB_ROOT_CACHED;
 
-	GEM_BUG_ON(__tasklet_is_enabled(&execlists->tasklet));
-	execlists->tasklet.callback = nop_submission_tasklet;
+	GEM_BUG_ON(__tasklet_is_enabled(&sched_engine->tasklet));
+	sched_engine->tasklet.callback = nop_submission_tasklet;
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 	rcu_read_unlock();
 }
 
 static void execlists_reset_finish(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 
 	/*
 	 * After a GPU reset, we may have requests to replay. Do so now while
@@ -3073,14 +3084,14 @@ static void execlists_reset_finish(struct intel_engine_cs *engine)
 	 * reset as the next level of recovery, and as a final resort we
 	 * will declare the device wedged.
 	 */
-	GEM_BUG_ON(!reset_in_progress(execlists));
+	GEM_BUG_ON(!reset_in_progress(engine));
 
 	/* And kick in case we missed a new request submission. */
-	if (__tasklet_enable(&execlists->tasklet))
-		__execlists_kick(execlists);
+	if (__tasklet_enable(&sched_engine->tasklet))
+		i915_sched_engine_hi_kick(sched_engine);
 
 	ENGINE_TRACE(engine, "depth->%d\n",
-		     atomic_read(&execlists->tasklet.count));
+		     atomic_read(&sched_engine->tasklet.count));
 }
 
 static void gen8_logical_ring_enable_irq(struct intel_engine_cs *engine)
@@ -3110,11 +3121,59 @@ static bool can_preempt(struct intel_engine_cs *engine)
 	return engine->class != RENDER_CLASS;
 }
 
+static void kick_execlists(const struct i915_request *rq, int prio)
+{
+	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
+	const struct i915_request *inflight;
+
+	/*
+	 * We only need to kick the tasklet once for the high priority
+	 * new context we add into the queue.
+	 */
+	if (prio <= sched_engine->queue_priority_hint)
+		return;
+
+	rcu_read_lock();
+
+	/* Nothing currently active? We're overdue for a submission! */
+	inflight = execlists_active(&rq->engine->execlists);
+	if (!inflight)
+		goto unlock;
+
+	/*
+	 * If we are already the currently executing context, don't
+	 * bother evaluating if we should preempt ourselves.
+	 */
+	if (inflight->context == rq->context)
+		goto unlock;
+
+	ENGINE_TRACE(rq->engine,
+		     "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
+		     prio,
+		     rq->fence.context, rq->fence.seqno,
+		     inflight->fence.context, inflight->fence.seqno,
+		     inflight->sched.attr.priority);
+
+	sched_engine->queue_priority_hint = prio;
+
+	/*
+	 * Allow preemption of low -> normal -> high, but we do
+	 * not allow low priority tasks to preempt other low priority
+	 * tasks under the impression that latency for low priority
+	 * tasks does not matter (as much as background throughput),
+	 * so kiss.
+	 */
+	if (prio >= max(I915_PRIORITY_NORMAL, rq_prio(inflight)))
+		i915_sched_engine_hi_kick(sched_engine);
+
+unlock:
+	rcu_read_unlock();
+}
+
 static void execlists_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = execlists_submit_request;
-	engine->schedule = i915_schedule;
-	engine->execlists.tasklet.callback = execlists_submission_tasklet;
+	engine->sched_engine->tasklet.callback = execlists_submission_tasklet;
 }
 
 static void execlists_shutdown(struct intel_engine_cs *engine)
@@ -3122,7 +3181,7 @@ static void execlists_shutdown(struct intel_engine_cs *engine)
 	/* Synchronise with residual timers and any softirq they raise */
 	del_timer_sync(&engine->execlists.timer);
 	del_timer_sync(&engine->execlists.preempt);
-	tasklet_kill(&engine->execlists.tasklet);
+	i915_sched_engine_kill(engine->sched_engine);
 }
 
 static void execlists_release(struct intel_engine_cs *engine)
@@ -3238,10 +3297,14 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	struct intel_uncore *uncore = engine->uncore;
 	u32 base = engine->mmio_base;
 
-	tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
+	tasklet_setup(&engine->sched_engine->tasklet,
+		      execlists_submission_tasklet);
 	timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
 	timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
 
+	engine->sched_engine->schedule = i915_schedule;
+	engine->sched_engine->kick_backend = kick_execlists;
+
 	logical_ring_default_vfuncs(engine);
 	logical_ring_default_irqs(engine);
 
@@ -3286,7 +3349,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 
 static struct list_head *virtual_queue(struct virtual_engine *ve)
 {
-	return &ve->base.execlists.default_priolist.requests;
+	return &ve->base.sched_engine->default_priolist.requests;
 }
 
 static void rcu_virtual_context_destroy(struct work_struct *wrk)
@@ -3301,7 +3364,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 	if (unlikely(ve->request)) {
 		struct i915_request *old;
 
-		spin_lock_irq(&ve->base.active.lock);
+		spin_lock_irq(&ve->base.sched_engine->lock);
 
 		old = fetch_and_zero(&ve->request);
 		if (old) {
@@ -3310,7 +3373,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 			i915_request_put(old);
 		}
 
-		spin_unlock_irq(&ve->base.active.lock);
+		spin_unlock_irq(&ve->base.sched_engine->lock);
 	}
 
 	/*
@@ -3320,7 +3383,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 	 * rbtrees as in the case it is running in parallel, it may reinsert
 	 * the rb_node into a sibling.
 	 */
-	tasklet_kill(&ve->base.execlists.tasklet);
+	i915_sched_engine_kill(ve->base.sched_engine);
 
 	/* Decouple ourselves from the siblings, no more access allowed. */
 	for (n = 0; n < ve->num_siblings; n++) {
@@ -3330,21 +3393,23 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 		if (RB_EMPTY_NODE(node))
 			continue;
 
-		spin_lock_irq(&sibling->active.lock);
+		spin_lock_irq(&sibling->sched_engine->lock);
 
 		/* Detachment is lazily performed in the execlists tasklet */
 		if (!RB_EMPTY_NODE(node))
 			rb_erase_cached(node, &sibling->execlists.virtual);
 
-		spin_unlock_irq(&sibling->active.lock);
+		spin_unlock_irq(&sibling->sched_engine->lock);
 	}
-	GEM_BUG_ON(__tasklet_is_scheduled(&ve->base.execlists.tasklet));
+	GEM_BUG_ON(__tasklet_is_scheduled(&ve->base.sched_engine->tasklet));
 	GEM_BUG_ON(!list_empty(virtual_queue(ve)));
 
 	lrc_fini(&ve->context);
 	intel_context_fini(&ve->context);
 
 	intel_breadcrumbs_free(ve->base.breadcrumbs);
+	if (ve->base.sched_engine)
+		i915_sched_engine_put(ve->base.sched_engine);
 	intel_engine_free_request_pool(&ve->base);
 
 	kfree(ve->bonds);
@@ -3475,16 +3540,18 @@ static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
 
 	ENGINE_TRACE(&ve->base, "rq=%llx:%lld, mask=%x, prio=%d\n",
 		     rq->fence.context, rq->fence.seqno,
-		     mask, ve->base.execlists.queue_priority_hint);
+		     mask, ve->base.sched_engine->queue_priority_hint);
 
 	return mask;
 }
 
 static void virtual_submission_tasklet(struct tasklet_struct *t)
 {
+	struct i915_sched_engine *sched_engine =
+		from_tasklet(sched_engine, t, tasklet);
 	struct virtual_engine * const ve =
-		from_tasklet(ve, t, base.execlists.tasklet);
-	const int prio = READ_ONCE(ve->base.execlists.queue_priority_hint);
+		(struct virtual_engine *)sched_engine->engine;
+	const int prio = READ_ONCE(ve->base.sched_engine->queue_priority_hint);
 	intel_engine_mask_t mask;
 	unsigned int n;
 
@@ -3503,7 +3570,7 @@ static void virtual_submission_tasklet(struct tasklet_struct *t)
 		if (!READ_ONCE(ve->request))
 			break; /* already handled by a sibling's tasklet */
 
-		spin_lock_irq(&sibling->active.lock);
+		spin_lock_irq(&sibling->sched_engine->lock);
 
 		if (unlikely(!(mask & sibling->mask))) {
 			if (!RB_EMPTY_NODE(&node->rb)) {
@@ -3552,11 +3619,11 @@ static void virtual_submission_tasklet(struct tasklet_struct *t)
 submit_engine:
 		GEM_BUG_ON(RB_EMPTY_NODE(&node->rb));
 		node->prio = prio;
-		if (first && prio > sibling->execlists.queue_priority_hint)
-			tasklet_hi_schedule(&sibling->execlists.tasklet);
+		if (first && prio > sibling->sched_engine->queue_priority_hint)
+			i915_sched_engine_hi_kick(sibling->sched_engine);
 
 unlock_engine:
-		spin_unlock_irq(&sibling->active.lock);
+		spin_unlock_irq(&sibling->sched_engine->lock);
 
 		if (intel_context_inflight(&ve->context))
 			break;
@@ -3574,7 +3641,7 @@ static void virtual_submit_request(struct i915_request *rq)
 
 	GEM_BUG_ON(ve->base.submit_request != virtual_submit_request);
 
-	spin_lock_irqsave(&ve->base.active.lock, flags);
+	spin_lock_irqsave(&ve->base.sched_engine->lock, flags);
 
 	/* By the time we resubmit a request, it may be completed */
 	if (__i915_request_is_complete(rq)) {
@@ -3588,16 +3655,16 @@ static void virtual_submit_request(struct i915_request *rq)
 		i915_request_put(ve->request);
 	}
 
-	ve->base.execlists.queue_priority_hint = rq_prio(rq);
+	ve->base.sched_engine->queue_priority_hint = rq_prio(rq);
 	ve->request = i915_request_get(rq);
 
 	GEM_BUG_ON(!list_empty(virtual_queue(ve)));
 	list_move_tail(&rq->sched.link, virtual_queue(ve));
 
-	tasklet_hi_schedule(&ve->base.execlists.tasklet);
+	i915_sched_engine_hi_kick(ve->base.sched_engine);
 
 unlock:
-	spin_unlock_irqrestore(&ve->base.active.lock, flags);
+	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
 }
 
 static struct ve_bond *
@@ -3681,19 +3748,24 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 
 	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
 
-	intel_engine_init_active(&ve->base, ENGINE_VIRTUAL);
-	intel_engine_init_execlists(&ve->base);
+	ve->base.sched_engine = i915_sched_engine_create(ENGINE_VIRTUAL);
+	if (!ve->base.sched_engine) {
+		kfree(ve);
+		return ERR_PTR(-ENOMEM);
+	}
+	ve->base.sched_engine->engine = &ve->base;
 
 	ve->base.cops = &virtual_context_ops;
 	ve->base.request_alloc = execlists_request_alloc;
 
-	ve->base.schedule = i915_schedule;
+	ve->base.sched_engine->schedule = i915_schedule;
 	ve->base.submit_request = virtual_submit_request;
 	ve->base.bond_execute = virtual_bond_execute;
 
 	INIT_LIST_HEAD(virtual_queue(ve));
-	ve->base.execlists.queue_priority_hint = INT_MIN;
-	tasklet_setup(&ve->base.execlists.tasklet, virtual_submission_tasklet);
+	ve->base.sched_engine->queue_priority_hint = INT_MIN;
+	tasklet_setup(&ve->base.sched_engine->tasklet,
+		      virtual_submission_tasklet);
 
 	intel_context_init(&ve->context, &ve->base);
 
@@ -3721,7 +3793,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 		 * layering if we handle cloning of the requests and
 		 * submitting a copy into each backend.
 		 */
-		if (sibling->execlists.tasklet.callback !=
+		if (sibling->sched_engine->tasklet.callback !=
 		    execlists_submission_tasklet) {
 			err = -ENODEV;
 			goto err_put;
@@ -3756,6 +3828,9 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			 "v%dx%d", ve->base.class, count);
 		ve->base.context_size = sibling->context_size;
 
+		ve->base.sched_engine->kick_backend =
+			sibling->sched_engine->kick_backend;
+
 		ve->base.emit_bb_start = sibling->emit_bb_start;
 		ve->base.emit_flush = sibling->emit_flush;
 		ve->base.emit_init_breadcrumb = sibling->emit_init_breadcrumb;
@@ -3848,17 +3923,18 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 							int indent),
 				   unsigned int max)
 {
+	const struct i915_sched_engine *sched_engine = engine->sched_engine;
 	const struct intel_engine_execlists *execlists = &engine->execlists;
 	struct i915_request *rq, *last;
 	unsigned long flags;
 	unsigned int count;
 	struct rb_node *rb;
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	last = NULL;
 	count = 0;
-	list_for_each_entry(rq, &engine->active.requests, sched.link) {
+	list_for_each_entry(rq, &sched_engine->requests, sched.link) {
 		if (count++ < max - 1)
 			show_request(m, rq, "\t\t", 0);
 		else
@@ -3873,13 +3949,13 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 		show_request(m, last, "\t\t", 0);
 	}
 
-	if (execlists->queue_priority_hint != INT_MIN)
+	if (sched_engine->queue_priority_hint != INT_MIN)
 		drm_printf(m, "\t\tQueue priority hint: %d\n",
-			   READ_ONCE(execlists->queue_priority_hint));
+			   READ_ONCE(sched_engine->queue_priority_hint));
 
 	last = NULL;
 	count = 0;
-	for (rb = rb_first_cached(&execlists->queue); rb; rb = rb_next(rb)) {
+	for (rb = rb_first_cached(&sched_engine->queue); rb; rb = rb_next(rb)) {
 		struct i915_priolist *p = rb_entry(rb, typeof(*p), node);
 
 		priolist_for_each_request(rq, p) {
@@ -3921,7 +3997,7 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 		show_request(m, last, "\t\t", 0);
 	}
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 2b6dffcc2262..14aa31879a37 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -339,9 +339,9 @@ static void reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	u32 head;
 
 	rq = NULL;
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	rcu_read_lock();
-	list_for_each_entry(pos, &engine->active.requests, sched.link) {
+	list_for_each_entry(pos, &engine->sched_engine->requests, sched.link) {
 		if (!__i915_request_is_complete(pos)) {
 			rq = pos;
 			break;
@@ -396,7 +396,7 @@ static void reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	}
 	engine->legacy.ring->head = intel_ring_wrap(engine->legacy.ring, head);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void reset_finish(struct intel_engine_cs *engine)
@@ -408,16 +408,17 @@ static void reset_cancel(struct intel_engine_cs *engine)
 	struct i915_request *request;
 	unsigned long flags;
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	/* Mark all submitted requests as skipped. */
-	list_for_each_entry(request, &engine->active.requests, sched.link)
+	list_for_each_entry(request, &engine->sched_engine->requests,
+			    sched.link)
 		i915_request_put(i915_request_mark_eio(request));
 	intel_engine_signal_breadcrumbs(engine);
 
 	/* Remaining _unready_ requests will be nop'ed when submitted */
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void i9xx_submit_request(struct i915_request *request)
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 32589c6625e1..bd005c1b6fd5 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -253,10 +253,10 @@ static void mock_reset_cancel(struct intel_engine_cs *engine)
 
 	del_timer_sync(&mock->hw_delay);
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	/* Mark all submitted requests as skipped. */
-	list_for_each_entry(rq, &engine->active.requests, sched.link)
+	list_for_each_entry(rq, &engine->sched_engine->requests, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
 	intel_engine_signal_breadcrumbs(engine);
 
@@ -269,7 +269,7 @@ static void mock_reset_cancel(struct intel_engine_cs *engine)
 	}
 	INIT_LIST_HEAD(&mock->hw_queue);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void mock_reset_finish(struct intel_engine_cs *engine)
@@ -283,6 +283,7 @@ static void mock_engine_release(struct intel_engine_cs *engine)
 
 	GEM_BUG_ON(timer_pending(&mock->hw_delay));
 
+	i915_sched_engine_put(engine->sched_engine);
 	intel_breadcrumbs_free(engine->breadcrumbs);
 
 	intel_context_unpin(engine->kernel_context);
@@ -345,14 +346,18 @@ int mock_engine_init(struct intel_engine_cs *engine)
 {
 	struct intel_context *ce;
 
-	intel_engine_init_active(engine, ENGINE_MOCK);
+	engine->sched_engine = i915_sched_engine_create(ENGINE_MOCK);
+	if (!engine->sched_engine)
+		return -ENOMEM;
+	engine->sched_engine->engine = engine;
+
 	intel_engine_init_execlists(engine);
 	intel_engine_init__pm(engine);
 	intel_engine_init_retire(engine);
 
 	engine->breadcrumbs = intel_breadcrumbs_create(NULL);
 	if (!engine->breadcrumbs)
-		return -ENOMEM;
+		goto err_schedule;
 
 	ce = create_kernel_context(engine);
 	if (IS_ERR(ce))
@@ -366,6 +371,8 @@ int mock_engine_init(struct intel_engine_cs *engine)
 
 err_breadcrumbs:
 	intel_breadcrumbs_free(engine->breadcrumbs);
+err_schedule:
+	i915_sched_engine_put(engine->sched_engine);
 	return -ENOMEM;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 1f93591a8c69..f349048ccbf6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -43,7 +43,7 @@ static int wait_for_submit(struct intel_engine_cs *engine,
 			   unsigned long timeout)
 {
 	/* Ignore our own attempts to suppress excess tasklets */
-	tasklet_hi_schedule(&engine->execlists.tasklet);
+	i915_sched_engine_hi_kick(engine->sched_engine);
 
 	timeout += jiffies;
 	do {
@@ -273,7 +273,7 @@ static int live_unlite_restore(struct intel_gt *gt, int prio)
 			};
 
 			/* Alternatively preempt the spinner with ce[1] */
-			engine->schedule(rq[1], &attr);
+			engine->sched_engine->schedule(rq[1], &attr);
 		}
 
 		/* And switch back to ce[0] for good measure */
@@ -606,9 +606,9 @@ static int live_hold_reset(void *arg)
 			err = -EBUSY;
 			goto out;
 		}
-		tasklet_disable(&engine->execlists.tasklet);
+		tasklet_disable(&engine->sched_engine->tasklet);
 
-		engine->execlists.tasklet.callback(&engine->execlists.tasklet);
+		engine->sched_engine->tasklet.callback(&engine->sched_engine->tasklet);
 		GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 		i915_request_get(rq);
@@ -618,7 +618,7 @@ static int live_hold_reset(void *arg)
 		__intel_engine_reset_bh(engine, NULL);
 		GEM_BUG_ON(rq->fence.error != -EIO);
 
-		tasklet_enable(&engine->execlists.tasklet);
+		tasklet_enable(&engine->sched_engine->tasklet);
 		clear_and_wake_up_bit(I915_RESET_ENGINE + id,
 				      &gt->reset.flags);
 		local_bh_enable();
@@ -900,7 +900,7 @@ release_queue(struct intel_engine_cs *engine,
 	i915_request_add(rq);
 
 	local_bh_disable();
-	engine->schedule(rq, &attr);
+	engine->sched_engine->schedule(rq, &attr);
 	local_bh_enable(); /* kick tasklet */
 
 	i915_request_put(rq);
@@ -1183,7 +1183,7 @@ static int live_timeslice_rewind(void *arg)
 		while (i915_request_is_active(rq[A2])) { /* semaphore yield! */
 			/* Wait for the timeslice to kick in */
 			del_timer(&engine->execlists.timer);
-			tasklet_hi_schedule(&engine->execlists.tasklet);
+			i915_sched_engine_hi_kick(engine->sched_engine);
 			intel_engine_flush_submission(engine);
 		}
 		/* -> ELSP[] = { { A:rq1 }, { B:rq1 } } */
@@ -1325,7 +1325,7 @@ static int live_timeslice_queue(void *arg)
 			err = PTR_ERR(rq);
 			goto err_heartbeat;
 		}
-		engine->schedule(rq, &attr);
+		engine->sched_engine->schedule(rq, &attr);
 		err = wait_for_submit(engine, rq, HZ / 2);
 		if (err) {
 			pr_err("%s: Timed out trying to submit semaphores\n",
@@ -1867,7 +1867,7 @@ static int live_late_preempt(void *arg)
 		}
 
 		attr.priority = I915_PRIORITY_MAX;
-		engine->schedule(rq, &attr);
+		engine->sched_engine->schedule(rq, &attr);
 
 		if (!igt_wait_for_spinner(&spin_hi, rq)) {
 			pr_err("High priority context failed to preempt the low priority context\n");
@@ -2480,7 +2480,7 @@ static int live_suppress_self_preempt(void *arg)
 			i915_request_add(rq_b);
 
 			GEM_BUG_ON(i915_request_completed(rq_a));
-			engine->schedule(rq_a, &attr);
+			engine->sched_engine->schedule(rq_a, &attr);
 			igt_spinner_end(&a.spin);
 
 			if (!igt_wait_for_spinner(&b.spin, rq_b)) {
@@ -2612,7 +2612,7 @@ static int live_chain_preempt(void *arg)
 
 			i915_request_get(rq);
 			i915_request_add(rq);
-			engine->schedule(rq, &attr);
+			engine->sched_engine->schedule(rq, &attr);
 
 			igt_spinner_end(&hi.spin);
 			if (i915_request_wait(rq, 0, HZ / 5) < 0) {
@@ -2971,7 +2971,7 @@ static int live_preempt_gang(void *arg)
 				break;
 
 			/* Submit each spinner at increasing priority */
-			engine->schedule(rq, &attr);
+			engine->sched_engine->schedule(rq, &attr);
 		} while (prio <= I915_PRIORITY_MAX &&
 			 !__igt_timeout(end_time, NULL));
 		pr_debug("%s: Preempt chain of %d requests\n",
@@ -3219,7 +3219,7 @@ static int preempt_user(struct intel_engine_cs *engine,
 	i915_request_get(rq);
 	i915_request_add(rq);
 
-	engine->schedule(rq, &attr);
+	engine->sched_engine->schedule(rq, &attr);
 
 	if (i915_request_wait(rq, 0, HZ / 2) < 0)
 		err = -ETIME;
@@ -4593,15 +4593,15 @@ static int reset_virtual_engine(struct intel_gt *gt,
 		err = -EBUSY;
 		goto out_heartbeat;
 	}
-	tasklet_disable(&engine->execlists.tasklet);
+	tasklet_disable(&engine->sched_engine->tasklet);
 
-	engine->execlists.tasklet.callback(&engine->execlists.tasklet);
+	engine->sched_engine->tasklet.callback(&engine->sched_engine->tasklet);
 	GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 	/* Fake a preemption event; failed of course */
-	spin_lock_irq(&engine->active.lock);
+	spin_lock_irq(&engine->sched_engine->lock);
 	__unwind_incomplete_requests(engine);
-	spin_unlock_irq(&engine->active.lock);
+	spin_unlock_irq(&engine->sched_engine->lock);
 	GEM_BUG_ON(rq->engine != engine);
 
 	/* Reset the engine while keeping our active request on hold */
@@ -4612,7 +4612,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(rq->fence.error != -EIO);
 
 	/* Release our grasp on the engine, letting CS flow again */
-	tasklet_enable(&engine->execlists.tasklet);
+	tasklet_enable(&engine->sched_engine->tasklet);
 	clear_and_wake_up_bit(I915_RESET_ENGINE + engine->id, &gt->reset.flags);
 	local_bh_enable();
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 5b63d4df8c93..cbcb800e2ca0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -858,12 +858,12 @@ static int active_engine(void *data)
 		rq[idx] = i915_request_get(new);
 		i915_request_add(new);
 
-		if (engine->schedule && arg->flags & TEST_PRIORITY) {
+		if (engine->sched_engine->schedule && arg->flags & TEST_PRIORITY) {
 			struct i915_sched_attr attr = {
 				.priority =
 					i915_prandom_u32_max_state(512, &prng),
 			};
-			engine->schedule(rq[idx], &attr);
+			engine->sched_engine->schedule(rq[idx], &attr);
 		}
 
 		err = active_request_put(old);
@@ -1702,7 +1702,7 @@ static int __igt_atomic_reset_engine(struct intel_engine_cs *engine,
 				     const struct igt_atomic_section *p,
 				     const char *mode)
 {
-	struct tasklet_struct * const t = &engine->execlists.tasklet;
+	struct tasklet_struct * const t = &engine->sched_engine->tasklet;
 	int err;
 
 	GEM_TRACE("i915_reset_engine(%s:%s) under %s\n",
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index d8f6623524e8..5b40def7cd9d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -49,7 +49,7 @@ static int wait_for_submit(struct intel_engine_cs *engine,
 			   unsigned long timeout)
 {
 	/* Ignore our own attempts to suppress excess tasklets */
-	tasklet_hi_schedule(&engine->execlists.tasklet);
+	i915_sched_engine_hi_kick(engine->sched_engine);
 
 	timeout += jiffies;
 	do {
@@ -1613,12 +1613,12 @@ static void garbage_reset(struct intel_engine_cs *engine,
 
 	local_bh_disable();
 	if (!test_and_set_bit(bit, lock)) {
-		tasklet_disable(&engine->execlists.tasklet);
+		tasklet_disable(&engine->sched_engine->tasklet);
 
 		if (!rq->fence.error)
 			__intel_engine_reset_bh(engine, NULL);
 
-		tasklet_enable(&engine->execlists.tasklet);
+		tasklet_enable(&engine->sched_engine->tasklet);
 		clear_and_wake_up_bit(bit, lock);
 	}
 	local_bh_enable();
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 8784257ec808..7a50c9f4071b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -321,7 +321,7 @@ static int igt_atomic_engine_reset(void *arg)
 		goto out_unlock;
 
 	for_each_engine(engine, gt, id) {
-		struct tasklet_struct *t = &engine->execlists.tasklet;
+		struct tasklet_struct *t = &engine->sched_engine->tasklet;
 
 		if (t->func)
 			tasklet_disable(t);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 38cda5d599a6..b8f9c71af13e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -181,6 +181,7 @@ static void schedule_out(struct i915_request *rq)
 
 static void __guc_dequeue(struct intel_engine_cs *engine)
 {
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_request **first = execlists->inflight;
 	struct i915_request ** const last_port = first + execlists->port_mask;
@@ -189,7 +190,7 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
 	bool submit = false;
 	struct rb_node *rb;
 
-	lockdep_assert_held(&engine->active.lock);
+	lockdep_assert_held(&engine->sched_engine->lock);
 
 	if (last) {
 		if (*++first)
@@ -204,7 +205,7 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
 	 * event.
 	 */
 	port = first;
-	while ((rb = rb_first_cached(&execlists->queue))) {
+	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 		struct i915_request *rq, *rn;
 
@@ -224,11 +225,11 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
 			last = rq;
 		}
 
-		rb_erase_cached(&p->node, &execlists->queue);
+		rb_erase_cached(&p->node, &sched_engine->queue);
 		i915_priolist_free(p);
 	}
 done:
-	execlists->queue_priority_hint =
+	sched_engine->queue_priority_hint =
 		rb ? to_priolist(rb)->priority : INT_MIN;
 	if (submit) {
 		*port = schedule_in(last, port - execlists->inflight);
@@ -240,13 +241,14 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
 
 static void guc_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine =
-		from_tasklet(engine, t, execlists.tasklet);
+	struct i915_sched_engine *sched_engine =
+		from_tasklet(sched_engine, t, tasklet);
+	struct intel_engine_cs * const engine = sched_engine->engine;
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_request **port, *rq;
 	unsigned long flags;
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	for (port = execlists->inflight; (rq = *port); port++) {
 		if (!i915_request_completed(rq))
@@ -262,20 +264,22 @@ static void guc_submission_tasklet(struct tasklet_struct *t)
 
 	__guc_dequeue(engine);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	i915_sched_engine_reset_on_empty(engine->sched_engine);
+
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
 {
 	if (iir & GT_RENDER_USER_INTERRUPT) {
 		intel_engine_signal_breadcrumbs(engine);
-		tasklet_hi_schedule(&engine->execlists.tasklet);
+		i915_sched_engine_hi_kick(engine->sched_engine);
 	}
 }
 
 static void guc_reset_prepare(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 
 	ENGINE_TRACE(engine, "\n");
 
@@ -283,12 +287,12 @@ static void guc_reset_prepare(struct intel_engine_cs *engine)
 	 * Prevent request submission to the hardware until we have
 	 * completed the reset in i915_gem_reset_finish(). If a request
 	 * is completed by one engine, it may then queue a request
-	 * to a second via its execlists->tasklet *just* as we are
+	 * to a second via its sched_engine->tasklet *just* as we are
 	 * calling engine->init_hw() and also writing the ELSP.
-	 * Turning off the execlists->tasklet until the reset is over
+	 * Turning off the sched_engine->tasklet until the reset is over
 	 * prevents the race.
 	 */
-	__tasklet_disable_sync_once(&execlists->tasklet);
+	__tasklet_disable_sync_once(&sched_engine->tasklet);
 }
 
 static void guc_reset_state(struct intel_context *ce,
@@ -319,7 +323,7 @@ static void guc_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	struct i915_request *rq;
 	unsigned long flags;
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	/* Push back any incomplete requests for replay after the reset. */
 	rq = execlists_unwind_incomplete_requests(execlists);
@@ -333,12 +337,12 @@ static void guc_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	guc_reset_state(rq->context, engine, rq->head, stalled);
 
 out_unlock:
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void guc_reset_cancel(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct i915_request *rq, *rn;
 	struct rb_node *rb;
 	unsigned long flags;
@@ -359,16 +363,16 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
 	 * submission's irq state, we also wish to remind ourselves that
 	 * it is irq state.)
 	 */
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	/* Mark all executing requests as skipped. */
-	list_for_each_entry(rq, &engine->active.requests, sched.link) {
+	list_for_each_entry(rq, &engine->sched_engine->requests, sched.link) {
 		i915_request_set_error_once(rq, -EIO);
 		i915_request_mark_complete(rq);
 	}
 
 	/* Flush the queued requests to the timeline list (for retiring). */
-	while ((rb = rb_first_cached(&execlists->queue))) {
+	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 
 		priolist_for_each_request_consume(rq, rn, p) {
@@ -378,28 +382,28 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
 			i915_request_mark_complete(rq);
 		}
 
-		rb_erase_cached(&p->node, &execlists->queue);
+		rb_erase_cached(&p->node, &sched_engine->queue);
 		i915_priolist_free(p);
 	}
 
 	/* Remaining _unready_ requests will be nop'ed when submitted */
 
-	execlists->queue_priority_hint = INT_MIN;
-	execlists->queue = RB_ROOT_CACHED;
+	sched_engine->queue_priority_hint = INT_MIN;
+	sched_engine->queue = RB_ROOT_CACHED;
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void guc_reset_finish(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
+	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 
-	if (__tasklet_enable(&execlists->tasklet))
+	if (__tasklet_enable(&sched_engine->tasklet))
 		/* And kick in case we missed a new request submission. */
-		tasklet_hi_schedule(&execlists->tasklet);
+		i915_sched_engine_hi_kick(sched_engine);
 
 	ENGINE_TRACE(engine, "depth->%d\n",
-		     atomic_read(&execlists->tasklet.count));
+		     atomic_read(&sched_engine->tasklet.count));
 }
 
 /*
@@ -500,7 +504,7 @@ static inline void queue_request(struct intel_engine_cs *engine,
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
-		      i915_sched_lookup_priolist(engine, prio));
+		      i915_sched_lookup_priolist(engine->sched_engine, prio));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
@@ -510,16 +514,16 @@ static void guc_submit_request(struct i915_request *rq)
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	queue_request(engine, rq, rq_prio(rq));
 
-	GEM_BUG_ON(RB_EMPTY_ROOT(&engine->execlists.queue.rb_root));
+	GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
 	GEM_BUG_ON(list_empty(&rq->sched.link));
 
-	tasklet_hi_schedule(&engine->execlists.tasklet);
+	i915_sched_engine_hi_kick(engine->sched_engine);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
@@ -597,7 +601,7 @@ static void guc_release(struct intel_engine_cs *engine)
 {
 	engine->sanitize = NULL; /* no longer in control, nothing to sanitize */
 
-	tasklet_kill(&engine->execlists.tasklet);
+	tasklet_kill(&engine->sched_engine->tasklet);
 
 	intel_engine_cleanup_common(engine);
 	lrc_fini_wa_ctx(engine);
@@ -612,7 +616,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	engine->cops = &guc_context_ops;
 	engine->request_alloc = guc_request_alloc;
 
-	engine->schedule = i915_schedule;
+	engine->sched_engine->schedule = i915_schedule;
 
 	engine->reset.prepare = guc_reset_prepare;
 	engine->reset.rewind = guc_reset_rewind;
@@ -676,7 +680,8 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	 */
 	GEM_BUG_ON(INTEL_GEN(i915) < 11);
 
-	tasklet_setup(&engine->execlists.tasklet, guc_submission_tasklet);
+	tasklet_setup(&engine->sched_engine->tasklet, guc_submission_tasklet);
+	engine->sched_engine->schedule = i915_schedule;
 
 	guc_default_vfuncs(engine);
 	guc_default_irqs(engine);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index bb181fe5d47e..3352f56bcf63 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1247,7 +1247,8 @@ static void record_request(const struct i915_request *request,
 
 static void engine_record_execlists(struct intel_engine_coredump *ee)
 {
-	const struct intel_engine_execlists * const el = &ee->engine->execlists;
+	const struct intel_engine_execlists * const el =
+		&ee->engine->execlists;
 	struct i915_request * const *port = el->active;
 	unsigned int n = 0;
 
@@ -1441,12 +1442,12 @@ capture_engine(struct intel_engine_cs *engine,
 	if (!ee)
 		return NULL;
 
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	rq = intel_engine_find_active_request(engine);
 	if (rq)
 		capture = intel_engine_coredump_add_request(ee, rq,
 							    ATOMIC_MAYFAIL);
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 	if (!capture) {
 		kfree(ee);
 		return NULL;
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 970d8f4986bb..4c0df56e3b86 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -272,11 +272,11 @@ i915_request_active_engine(struct i915_request *rq,
 	 * check that we have acquired the lock on the final engine.
 	 */
 	locked = READ_ONCE(rq->engine);
-	spin_lock_irq(&locked->active.lock);
+	spin_lock_irq(&locked->sched_engine->lock);
 	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
-		spin_unlock(&locked->active.lock);
+		spin_unlock(&locked->sched_engine->lock);
 		locked = engine;
-		spin_lock(&locked->active.lock);
+		spin_lock(&locked->sched_engine->lock);
 	}
 
 	if (i915_request_is_active(rq)) {
@@ -285,7 +285,7 @@ i915_request_active_engine(struct i915_request *rq,
 		ret = true;
 	}
 
-	spin_unlock_irq(&locked->active.lock);
+	spin_unlock_irq(&locked->sched_engine->lock);
 
 	return ret;
 }
@@ -302,10 +302,10 @@ static void remove_from_engine(struct i915_request *rq)
 	 * check that the rq still belongs to the newly locked engine.
 	 */
 	locked = READ_ONCE(rq->engine);
-	spin_lock_irq(&locked->active.lock);
+	spin_lock_irq(&locked->sched_engine->lock);
 	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
-		spin_unlock(&locked->active.lock);
-		spin_lock(&engine->active.lock);
+		spin_unlock(&locked->sched_engine->lock);
+		spin_lock(&engine->sched_engine->lock);
 		locked = engine;
 	}
 	list_del_init(&rq->sched.link);
@@ -316,7 +316,7 @@ static void remove_from_engine(struct i915_request *rq)
 	/* Prevent further __await_execution() registering a cb, then flush */
 	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
 
-	spin_unlock_irq(&locked->active.lock);
+	spin_unlock_irq(&locked->sched_engine->lock);
 
 	__notify_execute_cb_imm(rq);
 }
@@ -481,7 +481,7 @@ static bool __request_in_flight(const struct i915_request *signal)
 	 * may either perform a context switch to the second inflight execlists,
 	 * or it may switch to the pending set of execlists. In the case of the
 	 * latter, it may send the ACK and we process the event copying the
-	 * pending[] over top of inflight[], _overwriting_ our *active. Since
+	 * pending[] over top of inflight[], _overwriting_ our *active-> Since
 	 * this implies the HW is arbitrating and not struck in *active, we do
 	 * not worry about complete accuracy, but we do require no read/write
 	 * tearing of the pointer [the read of the pointer must be valid, even
@@ -490,7 +490,7 @@ static bool __request_in_flight(const struct i915_request *signal)
 	 *
 	 * Note that the read of *execlists->active may race with the promotion
 	 * of execlists->pending[] to execlists->inflight[], overwritting
-	 * the value at *execlists->active. This is fine. The promotion implies
+	 * the value at *execlists->active-> This is fine. The promotion implies
 	 * that we received an ACK from the HW, and so the context is not
 	 * stuck -- if we do not see ourselves in *active, the inflight status
 	 * is valid. If instead we see ourselves being copied into *active,
@@ -545,7 +545,7 @@ __await_execution(struct i915_request *rq,
 
 	/*
 	 * Register the callback first, then see if the signaler is already
-	 * active. This ensures that if we race with the
+	 * active-> This ensures that if we race with the
 	 * __notify_execute_cb from i915_request_submit() and we are not
 	 * included in that list, we get a second bite of the cherry and
 	 * execute it ourselves. After this point, a future
@@ -637,7 +637,7 @@ bool __i915_request_submit(struct i915_request *request)
 	RQ_TRACE(request, "\n");
 
 	GEM_BUG_ON(!irqs_disabled());
-	lockdep_assert_held(&engine->active.lock);
+	lockdep_assert_held(&engine->sched_engine->lock);
 
 	/*
 	 * With the advent of preempt-to-busy, we frequently encounter
@@ -649,9 +649,9 @@ bool __i915_request_submit(struct i915_request *request)
 	 *
 	 * We must remove the request from the caller's priority queue,
 	 * and the caller must only call us when the request is in their
-	 * priority queue, under the active.lock. This ensures that the
+	 * priority queue, under the active->lock. This ensures that the
 	 * request has *not* yet been retired and we can safely move
-	 * the request into the engine->active.list where it will be
+	 * the request into the engine->sched_engine->list where it will be
 	 * dropped upon retiring. (Otherwise if resubmit a *retired*
 	 * request, this would be a horrible use-after-free.)
 	 */
@@ -694,7 +694,7 @@ bool __i915_request_submit(struct i915_request *request)
 	result = true;
 
 	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
-	list_move_tail(&request->sched.link, &engine->active.requests);
+	list_move_tail(&request->sched.link, &engine->sched_engine->requests);
 active:
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &request->fence.flags);
 	set_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags);
@@ -724,11 +724,11 @@ void i915_request_submit(struct i915_request *request)
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	__i915_request_submit(request);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 void __i915_request_unsubmit(struct i915_request *request)
@@ -742,7 +742,7 @@ void __i915_request_unsubmit(struct i915_request *request)
 	RQ_TRACE(request, "\n");
 
 	GEM_BUG_ON(!irqs_disabled());
-	lockdep_assert_held(&engine->active.lock);
+	lockdep_assert_held(&engine->sched_engine->lock);
 
 	/*
 	 * Before we remove this breadcrumb from the signal list, we have
@@ -775,11 +775,11 @@ void i915_request_unsubmit(struct i915_request *request)
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
-	spin_lock_irqsave(&engine->active.lock, flags);
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 
 	__i915_request_unsubmit(request);
 
-	spin_unlock_irqrestore(&engine->active.lock, flags);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
 static void __cancel_request(struct i915_request *rq)
@@ -1343,7 +1343,7 @@ __i915_request_await_execution(struct i915_request *to,
 	}
 
 	/* Couple the dependency tree for PI on this exposed to->fence */
-	if (to->engine->schedule) {
+	if (to->engine->sched_engine->schedule) {
 		err = i915_sched_node_add_dependency(&to->sched,
 						     &from->sched,
 						     I915_DEPENDENCY_WEAK);
@@ -1484,7 +1484,7 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
 		return 0;
 	}
 
-	if (to->engine->schedule) {
+	if (to->engine->sched_engine->schedule) {
 		ret = i915_sched_node_add_dependency(&to->sched,
 						     &from->sched,
 						     I915_DEPENDENCY_EXTERNAL);
@@ -1671,7 +1671,7 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 			__i915_sw_fence_await_dma_fence(&rq->submit,
 							&prev->fence,
 							&rq->dmaq);
-		if (rq->engine->schedule)
+		if (rq->engine->sched_engine->schedule)
 			__i915_sched_node_add_dependency(&rq->sched,
 							 &prev->sched,
 							 &rq->dep,
@@ -1743,8 +1743,8 @@ void __i915_request_queue(struct i915_request *rq,
 	 * decide whether to preempt the entire chain so that it is ready to
 	 * run at the earliest possible convenience.
 	 */
-	if (attr && rq->engine->schedule)
-		rq->engine->schedule(rq, attr);
+	if (attr && rq->engine->sched_engine->schedule)
+		rq->engine->sched_engine->schedule(rq, attr);
 
 	local_bh_disable();
 	__i915_request_queue_bh(rq);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 270f6cd37650..239964bec1fa 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -613,7 +613,7 @@ i915_request_active_timeline(const struct i915_request *rq)
 	 * this submission.
 	 */
 	return rcu_dereference_protected(rq->timeline,
-					 lockdep_is_held(&rq->engine->active.lock));
+					 lockdep_is_held(&rq->engine->sched_engine->lock));
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index efa638c3acc7..28d403a8d7d2 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -40,7 +40,7 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
-static void assert_priolists(struct intel_engine_execlists * const execlists)
+static void assert_priolists(struct i915_sched_engine * const sched_engine)
 {
 	struct rb_node *rb;
 	long last_prio;
@@ -48,11 +48,11 @@ static void assert_priolists(struct intel_engine_execlists * const execlists)
 	if (!IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
 		return;
 
-	GEM_BUG_ON(rb_first_cached(&execlists->queue) !=
-		   rb_first(&execlists->queue.rb_root));
+	GEM_BUG_ON(rb_first_cached(&sched_engine->queue) !=
+		   rb_first(&sched_engine->queue.rb_root));
 
 	last_prio = INT_MAX;
-	for (rb = rb_first_cached(&execlists->queue); rb; rb = rb_next(rb)) {
+	for (rb = rb_first_cached(&sched_engine->queue); rb; rb = rb_next(rb)) {
 		const struct i915_priolist *p = to_priolist(rb);
 
 		GEM_BUG_ON(p->priority > last_prio);
@@ -61,23 +61,22 @@ static void assert_priolists(struct intel_engine_execlists * const execlists)
 }
 
 struct list_head *
-i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
+i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_priolist *p;
 	struct rb_node **parent, *rb;
 	bool first = true;
 
-	lockdep_assert_held(&engine->active.lock);
-	assert_priolists(execlists);
+	lockdep_assert_held(&sched_engine->lock);
+	assert_priolists(sched_engine);
 
-	if (unlikely(execlists->no_priolist))
+	if (unlikely(sched_engine->no_priolist))
 		prio = I915_PRIORITY_NORMAL;
 
 find_priolist:
 	/* most positive priority is scheduled first, equal priorities fifo */
 	rb = NULL;
-	parent = &execlists->queue.rb_root.rb_node;
+	parent = &sched_engine->queue.rb_root.rb_node;
 	while (*parent) {
 		rb = *parent;
 		p = to_priolist(rb);
@@ -92,7 +91,7 @@ i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 	}
 
 	if (prio == I915_PRIORITY_NORMAL) {
-		p = &execlists->default_priolist;
+		p = &sched_engine->default_priolist;
 	} else {
 		p = kmem_cache_alloc(global.slab_priorities, GFP_ATOMIC);
 		/* Convert an allocation failure to a priority bump */
@@ -107,7 +106,7 @@ i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 			 * requests, so if userspace lied about their
 			 * dependencies that reordering may be visible.
 			 */
-			execlists->no_priolist = true;
+			sched_engine->no_priolist = true;
 			goto find_priolist;
 		}
 	}
@@ -116,7 +115,7 @@ i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 	INIT_LIST_HEAD(&p->requests);
 
 	rb_link_node(&p->node, rb, parent);
-	rb_insert_color_cached(&p->node, &execlists->queue, first);
+	rb_insert_color_cached(&p->node, &sched_engine->queue, first);
 
 	return &p->requests;
 }
@@ -130,13 +129,13 @@ struct sched_cache {
 	struct list_head *priolist;
 };
 
-static struct intel_engine_cs *
-sched_lock_engine(const struct i915_sched_node *node,
-		  struct intel_engine_cs *locked,
+static struct i915_sched_engine *
+lock_sched_engine(struct i915_sched_node *node,
+		  struct i915_sched_engine *locked,
 		  struct sched_cache *cache)
 {
 	const struct i915_request *rq = node_to_request(node);
-	struct intel_engine_cs *engine;
+	struct i915_sched_engine *sched_engine;
 
 	GEM_BUG_ON(!locked);
 
@@ -146,81 +145,22 @@ sched_lock_engine(const struct i915_sched_node *node,
 	 * engine lock. The simple ploy we use is to take the lock then
 	 * check that the rq still belongs to the newly locked engine.
 	 */
-	while (locked != (engine = READ_ONCE(rq->engine))) {
-		spin_unlock(&locked->active.lock);
+	while (locked != (sched_engine = rq->engine->sched_engine)) {
+		spin_unlock(&locked->lock);
 		memset(cache, 0, sizeof(*cache));
-		spin_lock(&engine->active.lock);
-		locked = engine;
+		spin_lock(&sched_engine->lock);
+		locked = sched_engine;
 	}
 
-	GEM_BUG_ON(locked != engine);
+	GEM_BUG_ON(locked != sched_engine);
 	return locked;
 }
 
-static inline int rq_prio(const struct i915_request *rq)
-{
-	return rq->sched.attr.priority;
-}
-
-static inline bool need_preempt(int prio, int active)
-{
-	/*
-	 * Allow preemption of low -> normal -> high, but we do
-	 * not allow low priority tasks to preempt other low priority
-	 * tasks under the impression that latency for low priority
-	 * tasks does not matter (as much as background throughput),
-	 * so kiss.
-	 */
-	return prio >= max(I915_PRIORITY_NORMAL, active);
-}
-
-static void kick_submission(struct intel_engine_cs *engine,
-			    const struct i915_request *rq,
-			    int prio)
-{
-	const struct i915_request *inflight;
-
-	/*
-	 * We only need to kick the tasklet once for the high priority
-	 * new context we add into the queue.
-	 */
-	if (prio <= engine->execlists.queue_priority_hint)
-		return;
-
-	rcu_read_lock();
-
-	/* Nothing currently active? We're overdue for a submission! */
-	inflight = execlists_active(&engine->execlists);
-	if (!inflight)
-		goto unlock;
-
-	/*
-	 * If we are already the currently executing context, don't
-	 * bother evaluating if we should preempt ourselves.
-	 */
-	if (inflight->context == rq->context)
-		goto unlock;
-
-	ENGINE_TRACE(engine,
-		     "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
-		     prio,
-		     rq->fence.context, rq->fence.seqno,
-		     inflight->fence.context, inflight->fence.seqno,
-		     inflight->sched.attr.priority);
-
-	engine->execlists.queue_priority_hint = prio;
-	if (need_preempt(prio, rq_prio(inflight)))
-		tasklet_hi_schedule(&engine->execlists.tasklet);
-
-unlock:
-	rcu_read_unlock();
-}
-
 static void __i915_schedule(struct i915_sched_node *node,
 			    const struct i915_sched_attr *attr)
 {
 	const int prio = max(attr->priority, node->attr.priority);
-	struct intel_engine_cs *engine;
+	struct i915_sched_engine *sched_engine;
 	struct i915_dependency *dep, *p;
 	struct i915_dependency stack;
 	struct sched_cache cache;
@@ -295,23 +235,24 @@ static void __i915_schedule(struct i915_sched_node *node,
 	}
 
 	memset(&cache, 0, sizeof(cache));
-	engine = node_to_request(node)->engine;
-	spin_lock(&engine->active.lock);
+	sched_engine = node_to_request(node)->engine->sched_engine;
+	spin_lock(&sched_engine->lock);
 
 	/* Fifo and depth-first replacement ensure our deps execute before us */
-	engine = sched_lock_engine(node, engine, &cache);
+	sched_engine = lock_sched_engine(node, sched_engine, &cache);
 	list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
 		INIT_LIST_HEAD(&dep->dfs_link);
 
 		node = dep->signaler;
-		engine = sched_lock_engine(node, engine, &cache);
-		lockdep_assert_held(&engine->active.lock);
+		sched_engine = lock_sched_engine(node, sched_engine, &cache);
+		lockdep_assert_held(&sched_engine->lock);
 
 		/* Recheck after acquiring the engine->timeline.lock */
 		if (prio <= node->attr.priority || node_signaled(node))
 			continue;
 
-		GEM_BUG_ON(node_to_request(node)->engine != engine);
+		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
+			   sched_engine);
 
 		WRITE_ONCE(node->attr.priority, prio);
 
@@ -329,16 +270,17 @@ static void __i915_schedule(struct i915_sched_node *node,
 		if (i915_request_in_priority_queue(node_to_request(node))) {
 			if (!cache.priolist)
 				cache.priolist =
-					i915_sched_lookup_priolist(engine,
+					i915_sched_lookup_priolist(sched_engine,
 								   prio);
 			list_move_tail(&node->link, cache.priolist);
 		}
 
 		/* Defer (tasklet) submission until after all of our updates. */
-		kick_submission(engine, node_to_request(node), prio);
+		if (sched_engine->kick_backend)
+			sched_engine->kick_backend(node_to_request(node), prio);
 	}
 
-	spin_unlock(&engine->active.lock);
+	spin_unlock(&sched_engine->lock);
 }
 
 void i915_schedule(struct i915_request *rq, const struct i915_sched_attr *attr)
@@ -489,6 +431,50 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 	rcu_read_unlock();
 }
 
+void i915_sched_engine_free(struct kref *kref)
+{
+	struct i915_sched_engine *sched_engine =
+		container_of(kref, typeof(*sched_engine), ref);
+
+	i915_sched_engine_kill(sched_engine); /* flush the callback */
+	kfree(sched_engine);
+}
+
+struct i915_sched_engine *
+i915_sched_engine_create(unsigned int subclass)
+{
+	struct i915_sched_engine *sched_engine;
+
+	sched_engine = kzalloc(sizeof(*sched_engine), GFP_KERNEL);
+	if (!sched_engine)
+		return NULL;
+
+	kref_init(&sched_engine->ref);
+
+	sched_engine->queue = RB_ROOT_CACHED;
+	sched_engine->queue_priority_hint = INT_MIN;
+
+	INIT_LIST_HEAD(&sched_engine->requests);
+	INIT_LIST_HEAD(&sched_engine->hold);
+
+	spin_lock_init(&sched_engine->lock);
+	lockdep_set_subclass(&sched_engine->lock, subclass);
+
+	/*
+	 * Due to an interesting quirk in lockdep's internal debug tracking,
+	 * after setting a subclass we must ensure the lock is used. Otherwise,
+	 * nr_unused_locks is incremented once too often.
+	 */
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	local_irq_disable();
+	lock_map_acquire(&sched_engine->lock.dep_map);
+	lock_map_release(&sched_engine->lock.dep_map);
+	local_irq_enable();
+#endif
+
+	return sched_engine;
+}
+
 static void i915_global_scheduler_shrink(void)
 {
 	kmem_cache_shrink(global.slab_dependencies);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 858a0938f47a..a78b1f50ecb4 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -39,7 +39,7 @@ void i915_schedule(struct i915_request *request,
 		   const struct i915_sched_attr *attr);
 
 struct list_head *
-i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio);
+i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio);
 
 void __i915_priolist_free(struct i915_priolist *p);
 static inline void i915_priolist_free(struct i915_priolist *p)
@@ -53,4 +53,67 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 				     const char *prefix,
 				     int indent);
 
+struct i915_sched_engine *
+i915_sched_engine_create(unsigned int subclass);
+
+void i915_sched_engine_free(struct kref *kref);
+
+static inline struct i915_sched_engine *
+i915_sched_engine_get(struct i915_sched_engine *sched_engine)
+{
+	kref_get(&sched_engine->ref);
+	return sched_engine;
+}
+
+static inline void
+i915_sched_engine_put(struct i915_sched_engine *sched_engine)
+{
+	kref_put(&sched_engine->ref, i915_sched_engine_free);
+}
+
+static inline bool
+i915_sched_engine_is_empty(struct i915_sched_engine *sched_engine)
+{
+	return RB_EMPTY_ROOT(&sched_engine->queue.rb_root);
+}
+
+static inline void
+i915_sched_engine_reset_on_empty(struct i915_sched_engine *sched_engine)
+{
+	if (i915_sched_engine_is_empty(sched_engine))
+		sched_engine->no_priolist = false;
+}
+
+static inline void
+i915_sched_engine_hi_kick(struct i915_sched_engine *sched_engine)
+{
+	tasklet_hi_schedule(&sched_engine->tasklet);
+}
+
+static inline void
+i915_sched_engine_kick(struct i915_sched_engine *sched_engine)
+{
+	tasklet_schedule(&sched_engine->tasklet);
+}
+
+static inline void
+i915_sched_engine_kill(struct i915_sched_engine *sched_engine)
+{
+	tasklet_kill(&sched_engine->tasklet);
+}
+
+static inline void
+sched_engine_active_lock_bh(struct i915_sched_engine *sched_engine)
+{
+	local_bh_disable(); /* prevent local softirq and lock recursion */
+	tasklet_lock(&sched_engine->tasklet);
+}
+
+static inline void
+sched_engine_active_unlock_bh(struct i915_sched_engine *sched_engine)
+{
+	tasklet_unlock(&sched_engine->tasklet);
+	local_bh_enable(); /* restore softirq, and kick ksoftirqd! */
+}
+
 #endif /* _I915_SCHEDULER_H_ */
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 343ed44d5ed4..90b389ba661b 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -91,4 +91,67 @@ struct i915_dependency {
 				&(rq__)->sched.signalers_list, \
 				signal_link)
 
+struct i915_sched_engine {
+	struct kref ref;
+
+	/*
+	 * @lock: Protects requests in priority lists, requests, hold, and
+	 * tasklet while running.
+	 */
+	spinlock_t lock;
+
+	/* Execlist specific lists, needed here as protected by lock */
+	struct list_head requests;
+	struct list_head hold; /* ready requests, but on hold */
+
+	/**
+	 * @tasklet: softirq tasklet for bottom handler
+	 */
+	struct tasklet_struct tasklet;
+
+	/**
+	 * @default_priolist: priority list for I915_PRIORITY_NORMAL
+	 */
+	struct i915_priolist default_priolist;
+
+	/**
+	 * @queue_priority_hint: Highest pending priority.
+	 *
+	 * When we add requests into the queue, or adjust the priority of
+	 * executing requests, we compute the maximum priority of those
+	 * pending requests. We can then use this value to determine if
+	 * we need to preempt the executing requests to service the queue.
+	 * However, since the we may have recorded the priority of an inflight
+	 * request we wanted to preempt but since completed, at the time of
+	 * dequeuing the priority hint may no longer may match the highest
+	 * available request priority.
+	 */
+	int queue_priority_hint;
+
+	/**
+	 * @queue: queue of requests, in priority lists
+	 */
+	struct rb_root_cached queue;
+
+	/**
+	 * @no_priolist: priority lists disabled
+	 */
+	bool no_priolist;
+
+	/* Back pointer to engine */
+	struct intel_engine_cs *engine;
+
+	/* Kick backend */
+	void	(*kick_backend)(const struct i915_request *rq,
+				int prio);
+
+	/*
+	 * Call when the priority on a request has changed and it and its
+	 * dependencies may need rescheduling. Note the request itself may
+	 * not be ready to run!
+	 */
+	void	(*schedule)(struct i915_request *request,
+			    const struct i915_sched_attr *attr);
+};
+
 #endif /* _I915_SCHEDULER_TYPES_H_ */
-- 
2.28.0

