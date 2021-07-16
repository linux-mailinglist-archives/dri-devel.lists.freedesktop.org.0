Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B13CBD3A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF466EA1B;
	Fri, 16 Jul 2021 19:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970416E9E8;
 Fri, 16 Jul 2021 19:59:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596732"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596732"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238969"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/51] drm/i915: Move active request tracking to a vfunc
Date: Fri, 16 Jul 2021 13:16:58 -0700
Message-Id: <20210716201724.54804-26-matthew.brost@intel.com>
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

Move active request tracking to a backend vfunc rather than assuming all
backends want to do this in the maner. In the case execlists /
ring submission the tracking is on the physical engine while with GuC
submission it is on the context.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
 drivers/gpu/drm/i915/gt/intel_context_types.h |  7 ++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  6 +++
 .../drm/i915/gt/intel_execlists_submission.c  | 40 ++++++++++++++++++
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 22 ++++++++++
 drivers/gpu/drm/i915/gt/mock_engine.c         | 30 ++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 33 +++++++++++++++
 drivers/gpu/drm/i915/i915_request.c           | 41 ++-----------------
 drivers/gpu/drm/i915/i915_request.h           |  2 +
 9 files changed, 147 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 251ff7eea22d..bfb05d8697d1 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -393,6 +393,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 
+	spin_lock_init(&ce->guc_active.lock);
+	INIT_LIST_HEAD(&ce->guc_active.requests);
+
 	ce->guc_id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id_link);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 542c98418771..035108c10b2c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -162,6 +162,13 @@ struct intel_context {
 		struct list_head fences;
 	} guc_state;
 
+	struct {
+		/** lock: protects everything in guc_active */
+		spinlock_t lock;
+		/** requests: active requests on this context */
+		struct list_head requests;
+	} guc_active;
+
 	/* GuC scheduling state flags that do not require a lock. */
 	atomic_t guc_sched_state_no_lock;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 03a81e8d87f4..950fc73ed6af 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -420,6 +420,12 @@ struct intel_engine_cs {
 
 	void		(*release)(struct intel_engine_cs *engine);
 
+	/*
+	 * Add / remove request from engine active tracking
+	 */
+	void		(*add_active_request)(struct i915_request *rq);
+	void		(*remove_active_request)(struct i915_request *rq);
+
 	struct intel_engine_execlists execlists;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index abe48421fd7a..f9b5f54a5abe 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3106,6 +3106,42 @@ static void execlists_park(struct intel_engine_cs *engine)
 	cancel_timer(&engine->execlists.preempt);
 }
 
+static void add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void remove_from_engine(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine, *locked;
+
+	/*
+	 * Virtual engines complicate acquiring the engine timeline lock,
+	 * as their rq->engine pointer is not stable until under that
+	 * engine lock. The simple ploy we use is to take the lock then
+	 * check that the rq still belongs to the newly locked engine.
+	 */
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched_engine->lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched_engine->lock);
+		spin_lock(&engine->sched_engine->lock);
+		locked = engine;
+	}
+	list_del_init(&rq->sched.link);
+
+	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	spin_unlock_irq(&locked->sched_engine->lock);
+
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static bool can_preempt(struct intel_engine_cs *engine)
 {
 	if (GRAPHICS_VER(engine->i915) > 8)
@@ -3206,6 +3242,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 	engine->cops = &execlists_context_ops;
 	engine->request_alloc = execlists_request_alloc;
 	engine->bump_serial = execlist_bump_serial;
+	engine->add_active_request = add_to_engine;
+	engine->remove_active_request = remove_from_engine;
 
 	engine->reset.prepare = execlists_reset_prepare;
 	engine->reset.rewind = execlists_reset_rewind;
@@ -3797,6 +3835,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 			 "v%dx%d", ve->base.class, count);
 		ve->base.context_size = sibling->context_size;
 
+		ve->base.add_active_request = sibling->add_active_request;
+		ve->base.remove_active_request = sibling->remove_active_request;
 		ve->base.emit_bb_start = sibling->emit_bb_start;
 		ve->base.emit_flush = sibling->emit_flush;
 		ve->base.emit_init_breadcrumb = sibling->emit_init_breadcrumb;
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 61469c631057..3b1471c50d40 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -1052,6 +1052,25 @@ static void ring_bump_serial(struct intel_engine_cs *engine)
 	engine->serial++;
 }
 
+static void add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void remove_from_engine(struct i915_request *rq)
+{
+	spin_lock_irq(&rq->engine->sched_engine->lock);
+	list_del_init(&rq->sched.link);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	spin_unlock_irq(&rq->engine->sched_engine->lock);
+
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static void setup_common(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
@@ -1069,6 +1088,9 @@ static void setup_common(struct intel_engine_cs *engine)
 	engine->reset.cancel = reset_cancel;
 	engine->reset.finish = reset_finish;
 
+	engine->add_active_request = add_to_engine;
+	engine->remove_active_request = remove_from_engine;
+
 	engine->cops = &ring_context_ops;
 	engine->request_alloc = ring_request_alloc;
 	engine->bump_serial = ring_bump_serial;
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index fc5a65ab1937..5f86ff79c98c 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -235,6 +235,34 @@ static void mock_submit_request(struct i915_request *request)
 	spin_unlock_irqrestore(&engine->hw_lock, flags);
 }
 
+static void mock_add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void mock_remove_from_engine(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine, *locked;
+
+	/*
+	 * Virtual engines complicate acquiring the engine timeline lock,
+	 * as their rq->engine pointer is not stable until under that
+	 * engine lock. The simple ploy we use is to take the lock then
+	 * check that the rq still belongs to the newly locked engine.
+	 */
+
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched_engine->lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched_engine->lock);
+		spin_lock(&engine->sched_engine->lock);
+		locked = engine;
+	}
+	list_del_init(&rq->sched.link);
+	spin_unlock_irq(&locked->sched_engine->lock);
+}
+
 static void mock_reset_prepare(struct intel_engine_cs *engine)
 {
 }
@@ -327,6 +355,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 	engine->base.emit_flush = mock_emit_flush;
 	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
 	engine->base.submit_request = mock_submit_request;
+	engine->base.add_active_request = mock_add_to_engine;
+	engine->base.remove_active_request = mock_remove_from_engine;
 
 	engine->base.reset.prepare = mock_reset_prepare;
 	engine->base.reset.rewind = mock_reset_rewind;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9f28899ff17f..f8a6077fa3f9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1147,6 +1147,33 @@ static int guc_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void add_to_context(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+
+	spin_lock(&ce->guc_active.lock);
+	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
+	spin_unlock(&ce->guc_active.lock);
+}
+
+static void remove_from_context(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+
+	spin_lock_irq(&ce->guc_active.lock);
+
+	list_del_init(&rq->sched.link);
+	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	spin_unlock_irq(&ce->guc_active.lock);
+
+	atomic_dec(&ce->guc_id_ref);
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static const struct intel_context_ops guc_context_ops = {
 	.alloc = guc_context_alloc,
 
@@ -1567,6 +1594,8 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	engine->cops = &guc_context_ops;
 	engine->request_alloc = guc_request_alloc;
 	engine->bump_serial = guc_bump_serial;
+	engine->add_active_request = add_to_context;
+	engine->remove_active_request = remove_from_context;
 
 	engine->sched_engine->schedule = i915_schedule;
 
@@ -1931,6 +1960,10 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 				 "v%dx%d", ve->base.class, count);
 			ve->base.context_size = sibling->context_size;
 
+			ve->base.add_active_request =
+				sibling->add_active_request;
+			ve->base.remove_active_request =
+				sibling->remove_active_request;
 			ve->base.emit_bb_start = sibling->emit_bb_start;
 			ve->base.emit_flush = sibling->emit_flush;
 			ve->base.emit_init_breadcrumb =
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index b3c792d55321..4eba848b20e3 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -182,7 +182,7 @@ static bool irq_work_imm(struct irq_work *wrk)
 	return false;
 }
 
-static void __notify_execute_cb_imm(struct i915_request *rq)
+void i915_request_notify_execute_cb_imm(struct i915_request *rq)
 {
 	__notify_execute_cb(rq, irq_work_imm);
 }
@@ -256,37 +256,6 @@ i915_request_active_engine(struct i915_request *rq,
 	return ret;
 }
 
-
-static void remove_from_engine(struct i915_request *rq)
-{
-	struct intel_engine_cs *engine, *locked;
-
-	/*
-	 * Virtual engines complicate acquiring the engine timeline lock,
-	 * as their rq->engine pointer is not stable until under that
-	 * engine lock. The simple ploy we use is to take the lock then
-	 * check that the rq still belongs to the newly locked engine.
-	 */
-	locked = READ_ONCE(rq->engine);
-	spin_lock_irq(&locked->sched_engine->lock);
-	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
-		spin_unlock(&locked->sched_engine->lock);
-		spin_lock(&engine->sched_engine->lock);
-		locked = engine;
-	}
-	list_del_init(&rq->sched.link);
-
-	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
-	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
-
-	/* Prevent further __await_execution() registering a cb, then flush */
-	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
-
-	spin_unlock_irq(&locked->sched_engine->lock);
-
-	__notify_execute_cb_imm(rq);
-}
-
 static void __rq_init_watchdog(struct i915_request *rq)
 {
 	rq->watchdog.timer.function = NULL;
@@ -383,9 +352,7 @@ bool i915_request_retire(struct i915_request *rq)
 	 * after removing the breadcrumb and signaling it, so that we do not
 	 * inadvertently attach the breadcrumb to a completed request.
 	 */
-	if (!list_empty(&rq->sched.link))
-		remove_from_engine(rq);
-	atomic_dec(&rq->context->guc_id_ref);
+	rq->engine->remove_active_request(rq);
 	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
 
 	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */
@@ -516,7 +483,7 @@ __await_execution(struct i915_request *rq,
 	if (llist_add(&cb->work.node.llist, &signal->execute_cb)) {
 		if (i915_request_is_active(signal) ||
 		    __request_in_flight(signal))
-			__notify_execute_cb_imm(signal);
+			i915_request_notify_execute_cb_imm(signal);
 	}
 
 	return 0;
@@ -653,7 +620,7 @@ bool __i915_request_submit(struct i915_request *request)
 	result = true;
 
 	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
-	list_move_tail(&request->sched.link, &engine->sched_engine->requests);
+	engine->add_active_request(request);
 active:
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &request->fence.flags);
 	set_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 717e5b292046..128030f43bbf 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -647,4 +647,6 @@ bool
 i915_request_active_engine(struct i915_request *rq,
 			   struct intel_engine_cs **active);
 
+void i915_request_notify_execute_cb_imm(struct i915_request *rq);
+
 #endif /* I915_REQUEST_H */
-- 
2.28.0

