Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D585375B28
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053EE6EE02;
	Thu,  6 May 2021 18:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2C86ED0E;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: DobjcZnFAFEPHMeYU4u41nfKyI9nkY8wD3JonagZGQHC5V4nAj4v7fAHhLAIcDN51wTv99odyc
 XLiJ/TZ99fhQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531012"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: mUeoGbs2QMmDc08VzGUpVA54x64278nkAyIsb/H7sz37QCv5W03orK7L1Vge77i8SJ/hwXfbX4
 FP5/zJLJrRPw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583494"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 44/97] drm/i915/guc: Implement GuC submission tasklet
Date: Thu,  6 May 2021 12:13:58 -0700
Message-Id: <20210506191451.77768-45-matthew.brost@intel.com>
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

Implement GuC submission tasklet for new interface. The new GuC
interface uses H2G to submit contexts to the GuC. Since H2G use a single
channel, a single tasklet submits is used for the submission path. As
such a global struct intel_engine_cs has been added to leverage the
existing scheduling code.

Also the per engine interrupt handler has been updated to disable the
rescheduling of the physical engine tasklet, when using GuC scheduling,
as the physical engine tasklet is no longer used.

In this patch the field, guc_id, has been added to intel_context and is
not assigned. Patches later in the series will assign this value.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 233 +++++++++---------
 3 files changed, 127 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index ed8c447a7346..bb6fef7eae52 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -136,6 +136,15 @@ struct intel_context {
 	struct intel_sseu sseu;
 
 	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
+
+	/* GuC scheduling state that does not require a lock. */
+	atomic_t guc_sched_state_no_lock;
+
+	/*
+	 * GuC lrc descriptor ID - Not assigned in this patch but future patches
+	 * in the series will.
+	 */
+	u16 guc_id;
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 2eb6c497e43c..d32866fe90ad 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -30,6 +30,10 @@ struct intel_guc {
 	struct intel_guc_log log;
 	struct intel_guc_ct ct;
 
+	/* Global engine used to submit requests to GuC */
+	struct i915_sched_engine *sched_engine;
+	struct i915_request *stalled_request;
+
 	/* intel_guc_recv interrupt related state */
 	spinlock_t irq_lock;
 	unsigned int msg_enabled_mask;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index c2b6d27404b7..0955a8b00ee8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -60,6 +60,30 @@
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
+/*
+ * Below is a set of functions which control the GuC scheduling state which do
+ * not require a lock as all state transitions are mutually exclusive. i.e. It
+ * is not possible for the context pinning code and submission, for the same
+ * context, to be executing simultaneously.
+ */
+#define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
+static inline bool context_enabled(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_ENABLED);
+}
+
+static inline void set_context_enabled(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_ENABLED, &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_enabled(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
+		   &ce->guc_sched_state_no_lock);
+}
+
 static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 {
 	return rb_entry(rb, struct i915_priolist, node);
@@ -122,37 +146,29 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
 }
 
-static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
+static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
-	/* Leaving stub as this function will be used in future patches */
-}
+	int err;
+	struct intel_context *ce = rq->context;
+	u32 action[3];
+	int len = 0;
+	bool enabled = context_enabled(ce);
 
-/*
- * When we're doing submissions using regular execlists backend, writing to
- * ELSP from CPU side is enough to make sure that writes to ringbuffer pages
- * pinned in mappable aperture portion of GGTT are visible to command streamer.
- * Writes done by GuC on our behalf are not guaranteeing such ordering,
- * therefore, to ensure the flush, we're issuing a POSTING READ.
- */
-static void flush_ggtt_writes(struct i915_vma *vma)
-{
-	if (i915_vma_is_map_and_fenceable(vma))
-		intel_uncore_posting_read_fw(vma->vm->gt->uncore,
-					     GUC_STATUS);
-}
+	if (!enabled) {
+		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
+		action[len++] = ce->guc_id;
+		action[len++] = GUC_CONTEXT_ENABLE;
+	} else {
+		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
+		action[len++] = ce->guc_id;
+	}
 
-static void guc_submit(struct intel_engine_cs *engine,
-		       struct i915_request **out,
-		       struct i915_request **end)
-{
-	struct intel_guc *guc = &engine->gt->uc.guc;
+	err = intel_guc_send_nb(guc, action, len);
 
-	do {
-		struct i915_request *rq = *out++;
+	if (!enabled && !err)
+		set_context_enabled(ce);
 
-		flush_ggtt_writes(rq->ring->vma);
-		guc_add_request(guc, rq);
-	} while (out != end);
+	return err;
 }
 
 static inline int rq_prio(const struct i915_request *rq)
@@ -160,125 +176,88 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
-static struct i915_request *schedule_in(struct i915_request *rq, int idx)
-{
-	trace_i915_request_in(rq, idx);
-
-	/*
-	 * Currently we are not tracking the rq->context being inflight
-	 * (ce->inflight = rq->engine). It is only used by the execlists
-	 * backend at the moment, a similar counting strategy would be
-	 * required if we generalise the inflight tracking.
-	 */
-
-	__intel_gt_pm_get(rq->engine->gt);
-	return i915_request_get(rq);
-}
-
-static void schedule_out(struct i915_request *rq)
-{
-	trace_i915_request_out(rq);
-
-	intel_gt_pm_put_async(rq->engine->gt);
-	i915_request_put(rq);
-}
-
-static void __guc_dequeue(struct intel_engine_cs *engine)
+static int guc_dequeue_one_context(struct intel_guc *guc)
 {
-	struct i915_sched_engine * const sched_engine = engine->sched_engine;
-	struct intel_engine_execlists * const execlists = &engine->execlists;
-	struct i915_request **first = execlists->inflight;
-	struct i915_request ** const last_port = first + execlists->port_mask;
-	struct i915_request *last = first[0];
-	struct i915_request **port;
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	struct i915_request *last = NULL;
 	bool submit = false;
 	struct rb_node *rb;
+	int ret;
 
-	lockdep_assert_held(&engine->sched_engine->lock);
-
-	if (last) {
-		if (*++first)
-			return;
+	lockdep_assert_held(&sched_engine->lock);
 
-		last = NULL;
+	if (guc->stalled_request) {
+		submit = true;
+		last = guc->stalled_request;
+		goto resubmit;
 	}
 
-	/*
-	 * We write directly into the execlists->inflight queue and don't use
-	 * the execlists->pending queue, as we don't have a distinct switch
-	 * event.
-	 */
-	port = first;
 	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 		struct i915_request *rq, *rn;
 
 		priolist_for_each_request_consume(rq, rn, p) {
-			if (last && rq->context != last->context) {
-				if (port == last_port)
-					goto done;
-
-				*port = schedule_in(last,
-						    port - execlists->inflight);
-				port++;
-			}
+			if (last && rq->context != last->context)
+				goto done;
 
 			list_del_init(&rq->sched.link);
+
 			__i915_request_submit(rq);
-			submit = true;
+
+			trace_i915_request_in(rq, 0);
 			last = rq;
+			submit = true;
 		}
 
 		rb_erase_cached(&p->node, &sched_engine->queue);
 		i915_priolist_free(p);
 	}
 done:
-	sched_engine->queue_priority_hint =
-		rb ? to_priolist(rb)->priority : INT_MIN;
 	if (submit) {
-		*port = schedule_in(last, port - execlists->inflight);
-		*++port = NULL;
-		guc_submit(engine, first, port);
+		last->context->lrc_reg_state[CTX_RING_TAIL] =
+			intel_ring_set_tail(last->ring, last->tail);
+resubmit:
+		/*
+		 * We only check for -EBUSY here even though it is possible for
+		 * -EDEADLK to be returned. If -EDEADLK is returned, the GuC has
+		 * died and a full GPU needs to be done. The hangcheck will
+		 * eventually detect that the GuC has died and trigger this
+		 * reset so no need to handle -EDEADLK here.
+		 */
+		ret = guc_add_request(guc, last);
+		if (ret == -EBUSY) {
+			i915_sched_engine_kick(sched_engine);
+			guc->stalled_request = last;
+			return false;
+		}
 	}
-	execlists->active = execlists->inflight;
+
+	guc->stalled_request = NULL;
+	return submit;
 }
 
 static void guc_submission_tasklet(struct tasklet_struct *t)
 {
 	struct i915_sched_engine *sched_engine =
 		from_tasklet(sched_engine, t, tasklet);
-	struct intel_engine_cs * const engine = sched_engine->engine;
-	struct intel_engine_execlists * const execlists = &engine->execlists;
-	struct i915_request **port, *rq;
 	unsigned long flags;
+	bool loop;
 
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-
-	for (port = execlists->inflight; (rq = *port); port++) {
-		if (!i915_request_completed(rq))
-			break;
+	spin_lock_irqsave(&sched_engine->lock, flags);
 
-		schedule_out(rq);
-	}
-	if (port != execlists->inflight) {
-		int idx = port - execlists->inflight;
-		int rem = ARRAY_SIZE(execlists->inflight) - idx;
-		memmove(execlists->inflight, port, rem * sizeof(*port));
-	}
-
-	__guc_dequeue(engine);
+	do {
+		loop = guc_dequeue_one_context(&sched_engine->engine->gt->uc.guc);
+	} while (loop);
 
-	i915_sched_engine_reset_on_empty(engine->sched_engine);
+	i915_sched_engine_reset_on_empty(sched_engine);
 
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
 static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
 {
-	if (iir & GT_RENDER_USER_INTERRUPT) {
+	if (iir & GT_RENDER_USER_INTERRUPT)
 		intel_engine_signal_breadcrumbs(engine);
-		i915_sched_engine_hi_kick(engine->sched_engine);
-	}
 }
 
 static void guc_reset_prepare(struct intel_engine_cs *engine)
@@ -351,6 +330,10 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
 	struct rb_node *rb;
 	unsigned long flags;
 
+	/* Can be called during boot if GuC fails to load */
+	if (!engine->gt)
+		return;
+
 	ENGINE_TRACE(engine, "\n");
 
 	/*
@@ -437,8 +420,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
 
 void intel_guc_submission_fini(struct intel_guc *guc)
 {
-	if (guc->lrc_desc_pool)
-		guc_lrc_desc_pool_destroy(guc);
+	if (!guc->lrc_desc_pool)
+		return;
+
+	guc_lrc_desc_pool_destroy(guc);
+	i915_sched_engine_put(guc->sched_engine);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -503,32 +489,32 @@ static int guc_request_alloc(struct i915_request *request)
 	return 0;
 }
 
-static inline void queue_request(struct intel_engine_cs *engine,
+static inline void queue_request(struct i915_sched_engine *sched_engine,
 				 struct i915_request *rq,
 				 int prio)
 {
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
-		      i915_sched_lookup_priolist(engine->sched_engine, prio));
+		      i915_sched_lookup_priolist(sched_engine, prio));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 }
 
 static void guc_submit_request(struct i915_request *rq)
 {
-	struct intel_engine_cs *engine = rq->engine;
+	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
+	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	queue_request(engine, rq, rq_prio(rq));
+	queue_request(sched_engine, rq, rq_prio(rq));
 
-	GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
+	GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
 	GEM_BUG_ON(list_empty(&rq->sched.link));
 
-	i915_sched_engine_hi_kick(engine->sched_engine);
+	i915_sched_engine_hi_kick(sched_engine);
 
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
@@ -606,8 +592,6 @@ static void guc_release(struct intel_engine_cs *engine)
 {
 	engine->sanitize = NULL; /* no longer in control, nothing to sanitize */
 
-	tasklet_kill(&engine->sched_engine->tasklet);
-
 	intel_engine_cleanup_common(engine);
 	lrc_fini_wa_ctx(engine);
 }
@@ -678,6 +662,7 @@ static inline void guc_default_irqs(struct intel_engine_cs *engine)
 int intel_guc_submission_setup(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
+	struct intel_guc *guc = &engine->gt->uc.guc;
 
 	/*
 	 * The setup relies on several assumptions (e.g. irqs always enabled)
@@ -685,8 +670,18 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	 */
 	GEM_BUG_ON(INTEL_GEN(i915) < 11);
 
-	tasklet_setup(&engine->sched_engine->tasklet, guc_submission_tasklet);
-	engine->sched_engine->schedule = i915_schedule;
+	if (!guc->sched_engine) {
+		guc->sched_engine = i915_sched_engine_create(ENGINE_VIRTUAL);
+		if (!guc->sched_engine)
+			return -ENOMEM;
+
+		guc->sched_engine->schedule = i915_schedule;
+		guc->sched_engine->engine = engine;
+		tasklet_setup(&guc->sched_engine->tasklet,
+			      guc_submission_tasklet);
+	}
+	i915_sched_engine_put(engine->sched_engine);
+	engine->sched_engine = i915_sched_engine_get(guc->sched_engine);
 
 	guc_default_vfuncs(engine);
 	guc_default_irqs(engine);
-- 
2.28.0

