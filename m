Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4F3D02DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800236E4E3;
	Tue, 20 Jul 2021 20:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC206E4DE;
 Tue, 20 Jul 2021 20:40:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885363"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885363"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906058"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 04/42] drm/i915/guc: Don't return -EAGAIN to user when
 guc_ids exhausted
Date: Tue, 20 Jul 2021 13:57:24 -0700
Message-Id: <20210720205802.39610-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

Rather than returning -EAGAIN to the user when no guc_ids are available,
implement a fair sharing algorithm in the kernel which blocks submissons
until guc_ids become available. Submissions are released one at a time,
based on priority, until the guc_id pressure is released to ensure fair
sharing of the guc_ids. Once the pressure is fully released, the normal
guc_id allocation (at request creation time in guc_request_alloc) can
resume as this allocation path should be significantly faster and a fair
sharing algorithm isn't needed when guc_ids are plentifully.

The fair sharing algorithm is implemented by forcing all submissions to
the tasklet which serializes submissions, dequeuing one at a time.

If the submission doesn't have a guc_id and new guc_id can't be found,
two lists are searched, one list with contexts that are not pinned but
still registered with the guc (searched first) and another list with
contexts that are pinned but do not have any submissions actively in
inflight (scheduling enabled + registered, searched second). If no
guc_ids can be found we kick a workqueue which will retire requests
hopefully freeing a guc_id. The workqueue + tasklet ping / pong back and
forth until a guc_id can be found.

Once a guc_id is found, we may have to disable context scheduling
depending on which list the context is stolen from. When we disable
scheduling, we block the tasklet from executing until the completion G2H
returns. The disable scheduling must be issued from the workqueue
because of the locking structure. When we deregister a context, we also
do the same thing (waiting on the G2H) but we can safely issue the
deregister H2G from the tasklet.

Once all the G2H have returned we can trigger a submission on the
context.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  26 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 806 ++++++++++++++++--
 drivers/gpu/drm/i915/i915_request.h           |   6 +
 4 files changed, 755 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index fe555551c2d2..6008ac5aa0cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -185,6 +185,9 @@ struct intel_context {
 	/* GuC LRC descriptor reference count */
 	atomic_t guc_id_ref;
 
+	/* Number of rq submitted without a guc_id */
+	u16 guc_num_rq_submit_no_id;
+
 	/*
 	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
 	 */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 8f4f44f71a39..cad4db2fd686 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -33,7 +33,28 @@ struct intel_guc {
 
 	/* Global engine used to submit requests to GuC */
 	struct i915_sched_engine *sched_engine;
-	struct i915_request *stalled_request;
+
+	/* Global state related to submission tasklet */
+	struct i915_request *stalled_rq;
+	struct intel_context *stalled_context;
+	struct work_struct retire_worker;
+	unsigned long flags;
+	int total_num_rq_with_no_guc_id;
+
+	/*
+	 * Submisson stall reason. See intel_guc_submission.c for detailed
+	 * description.
+	 */
+	enum {
+		STALL_NONE,
+		STALL_GUC_ID_WORKQUEUE,
+		STALL_GUC_ID_TASKLET,
+		STALL_SCHED_DISABLE,
+		STALL_REGISTER_CONTEXT,
+		STALL_DEREGISTER_CONTEXT,
+		STALL_MOVE_LRC_TAIL,
+		STALL_ADD_REQUEST,
+	} submission_stall_reason;
 
 	/* intel_guc_recv interrupt related state */
 	spinlock_t irq_lock;
@@ -55,7 +76,8 @@ struct intel_guc {
 	struct ida guc_ids;
 	u32 num_guc_ids;
 	u32 max_guc_ids;
-	struct list_head guc_id_list;
+	struct list_head guc_id_list_no_ref;
+	struct list_head guc_id_list_unpinned;
 
 	bool submission_supported;
 	bool submission_selected;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index c6069fe2f23c..ec9b0e7eacc7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -59,6 +59,25 @@
  * ELSP context descriptor dword into Work Item.
  * See guc_add_request()
  *
+ * GuC flow control state machine:
+ * The tasklet, workqueue (retire_worker), and the G2H handlers together more or
+ * less form a state machine which is used to submit requests + flow control
+ * requests, while waiting on resources / actions, if necessary. The enum,
+ * submission_stall_reason, controls the handoff of stalls between these
+ * entities with stalled_rq & stalled_context being the arguments. Each state
+ * described below.
+ *
+ * STALL_NONE			No stall condition
+ * STALL_GUC_ID_WORKQUEUE	Workqueue will try to free guc_ids
+ * STALL_GUC_ID_TASKLET		Tasklet will try to find guc_id
+ * STALL_SCHED_DISABLE		Workqueue will issue context schedule disable
+ *				H2G
+ * STALL_REGISTER_CONTEXT	Tasklet needs to register context
+ * STALL_DEREGISTER_CONTEXT	G2H handler is waiting for context deregister,
+ *				will register context upon receipt of G2H
+ * STALL_MOVE_LRC_TAIL		Tasklet will try to move LRC tail
+ * STALL_ADD_REQUEST		Tasklet will try to add the request (submit
+ *				context)
  */
 
 /* GuC Virtual Engine */
@@ -72,6 +91,83 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
+/*
+ * Global GuC flags helper functions
+ */
+enum {
+	GUC_STATE_TASKLET_BLOCKED,
+	GUC_STATE_GUC_IDS_EXHAUSTED,
+};
+
+static bool tasklet_blocked(struct intel_guc *guc)
+{
+	return test_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+}
+
+static void set_tasklet_blocked(struct intel_guc *guc)
+{
+	lockdep_assert_held(&guc->sched_engine->lock);
+	set_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+}
+
+static void __clr_tasklet_blocked(struct intel_guc *guc)
+{
+	lockdep_assert_held(&guc->sched_engine->lock);
+	clear_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+}
+
+static void clr_tasklet_blocked(struct intel_guc *guc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->sched_engine->lock, flags);
+	__clr_tasklet_blocked(guc);
+	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+}
+
+static bool guc_ids_exhausted(struct intel_guc *guc)
+{
+	return test_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
+}
+
+static bool test_and_update_guc_ids_exhausted(struct intel_guc *guc)
+{
+	unsigned long flags;
+	bool ret = false;
+
+	/*
+	 * Strict ordering on checking if guc_ids are exhausted isn't required,
+	 * so let's avoid grabbing the submission lock if possible.
+	 */
+	if (guc_ids_exhausted(guc)) {
+		spin_lock_irqsave(&guc->sched_engine->lock, flags);
+		ret = guc_ids_exhausted(guc);
+		if (ret)
+			++guc->total_num_rq_with_no_guc_id;
+		spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+	}
+
+	return ret;
+}
+
+static void set_and_update_guc_ids_exhausted(struct intel_guc *guc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->sched_engine->lock, flags);
+	++guc->total_num_rq_with_no_guc_id;
+	set_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
+	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+}
+
+static void clr_guc_ids_exhausted(struct intel_guc *guc)
+{
+	lockdep_assert_held(&guc->sched_engine->lock);
+	GEM_BUG_ON(guc->total_num_rq_with_no_guc_id);
+
+	clear_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which do
  * not require a lock as all state transitions are mutually exclusive. i.e. It
@@ -82,7 +178,10 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
 #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
 #define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
-#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		3
+#define SCHED_STATE_NO_LOCK_BLOCK_TASKLET		BIT(3)
+#define SCHED_STATE_NO_LOCK_GUC_ID_STOLEN		BIT(4)
+#define SCHED_STATE_NO_LOCK_NEEDS_REGISTER		BIT(5)
+#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		6
 #define SCHED_STATE_NO_LOCK_BLOCKED \
 	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
 #define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
@@ -161,6 +260,60 @@ static inline void clr_context_registered(struct intel_context *ce)
 		   &ce->guc_sched_state_no_lock);
 }
 
+static inline bool context_block_tasklet(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_BLOCK_TASKLET);
+}
+
+static inline void set_context_block_tasklet(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_BLOCK_TASKLET,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_block_tasklet(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_BLOCK_TASKLET,
+		   &ce->guc_sched_state_no_lock);
+}
+
+static inline bool context_guc_id_stolen(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_GUC_ID_STOLEN);
+}
+
+static inline void set_context_guc_id_stolen(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_GUC_ID_STOLEN,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_guc_id_stolen(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_GUC_ID_STOLEN,
+		   &ce->guc_sched_state_no_lock);
+}
+
+static inline bool context_needs_register(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_NEEDS_REGISTER);
+}
+
+static inline void set_context_needs_register(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_NEEDS_REGISTER,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_needs_register(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_NEEDS_REGISTER,
+		   &ce->guc_sched_state_no_lock);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock, aside from the special case where the functions are called
@@ -415,9 +568,12 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
 					      true, timeout);
 }
 
-static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
+static inline bool request_has_no_guc_id(struct i915_request *rq)
+{
+	return test_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
+}
 
-static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
+static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
 	int err = 0;
 	struct intel_context *ce = rq->context;
@@ -436,18 +592,15 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		goto out;
 	}
 
+	/* Ensure context is in correct state before a submission */
+	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
+	GEM_BUG_ON(request_has_no_guc_id(rq));
 	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
+	GEM_BUG_ON(context_needs_register(ce));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
-
-	/*
-	 * Corner case where the GuC firmware was blown away and reloaded while
-	 * this context was pinned.
-	 */
-	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
-		err = guc_lrc_desc_pin(ce, false);
-		if (unlikely(err))
-			goto out;
-	}
+	GEM_BUG_ON(context_pending_disable(ce));
+	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
+	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
 
 	if (unlikely(context_blocked(ce)))
 		goto out;
@@ -455,6 +608,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	enabled = context_enabled(ce);
 
 	if (!enabled) {
+		GEM_BUG_ON(context_pending_enable(ce));
+
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = ce->guc_id;
 		action[len++] = GUC_CONTEXT_ENABLE;
@@ -482,6 +637,68 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	return err;
 }
 
+static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
+{
+	int ret;
+
+	lockdep_assert_held(&guc->sched_engine->lock);
+
+	ret = __guc_add_request(guc, rq);
+	if (ret == -EBUSY) {
+		guc->stalled_rq = rq;
+		guc->submission_stall_reason = STALL_ADD_REQUEST;
+	} else {
+		guc->stalled_rq = NULL;
+		guc->submission_stall_reason = STALL_NONE;
+	}
+
+	return ret;
+}
+
+static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
+
+static int tasklet_register_context(struct intel_guc *guc,
+				    struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+	int ret = 0;
+
+	/* Check state */
+	lockdep_assert_held(&guc->sched_engine->lock);
+	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
+	GEM_BUG_ON(request_has_no_guc_id(rq));
+	GEM_BUG_ON(context_guc_id_invalid(ce));
+	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
+
+	/*
+	 * The guc_id is getting pinned during the tasklet and we need to
+	 * register this context or a corner case where the GuC firwmare was
+	 * blown away and reloaded while this context was pinned
+	 */
+	if (unlikely((!lrc_desc_registered(guc, ce->guc_id) ||
+		      context_needs_register(ce)) &&
+		     !intel_context_is_banned(ce))) {
+		GEM_BUG_ON(context_pending_disable(ce));
+		GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
+
+		ret = guc_lrc_desc_pin(ce, false);
+
+		if (likely(ret != -EBUSY))
+			clr_context_needs_register(ce);
+
+		if (unlikely(ret == -EBUSY)) {
+			guc->stalled_rq = rq;
+			guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
+		} else if (unlikely(ret == -EINPROGRESS)) {
+			guc->stalled_rq = rq;
+			guc->submission_stall_reason = STALL_DEREGISTER_CONTEXT;
+		}
+	}
+
+	return ret;
+}
+
+
 static inline void guc_set_lrc_tail(struct i915_request *rq)
 {
 	rq->context->lrc_reg_state[CTX_RING_TAIL] =
@@ -493,77 +710,142 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
+static void kick_retire_wq(struct intel_guc *guc)
+{
+	queue_work(system_unbound_wq, &guc->retire_worker);
+}
+
+static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq);
+
 static int guc_dequeue_one_context(struct intel_guc *guc)
 {
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
-	struct i915_request *last = NULL;
-	bool submit = false;
+	struct i915_request *last = guc->stalled_rq;
+	bool submit = !!last;
 	struct rb_node *rb;
 	int ret;
 
 	lockdep_assert_held(&sched_engine->lock);
+	GEM_BUG_ON(guc->stalled_context);
+	GEM_BUG_ON(!submit && guc->submission_stall_reason);
 
-	if (guc->stalled_request) {
-		submit = true;
-		last = guc->stalled_request;
-		goto resubmit;
-	}
+	if (submit) {
+		/* Flow control conditions */
+		switch (guc->submission_stall_reason) {
+		case STALL_GUC_ID_TASKLET:
+			goto done;
+		case STALL_REGISTER_CONTEXT:
+			goto register_context;
+		case STALL_MOVE_LRC_TAIL:
+			goto move_lrc_tail;
+		case STALL_ADD_REQUEST:
+			goto add_request;
+		default:
+			GEM_BUG_ON("Invalid stall state");
+		}
+	} else {
+		GEM_BUG_ON(!guc->total_num_rq_with_no_guc_id &&
+			   guc_ids_exhausted(guc));
 
-	while ((rb = rb_first_cached(&sched_engine->queue))) {
-		struct i915_priolist *p = to_priolist(rb);
-		struct i915_request *rq, *rn;
+		while ((rb = rb_first_cached(&sched_engine->queue))) {
+			struct i915_priolist *p = to_priolist(rb);
+			struct i915_request *rq, *rn;
 
-		priolist_for_each_request_consume(rq, rn, p) {
-			if (last && rq->context != last->context)
-				goto done;
+			priolist_for_each_request_consume(rq, rn, p) {
+				if (last && rq->context != last->context)
+					goto done;
 
-			list_del_init(&rq->sched.link);
+				list_del_init(&rq->sched.link);
 
-			__i915_request_submit(rq);
+				__i915_request_submit(rq);
 
-			trace_i915_request_in(rq, 0);
-			last = rq;
-			submit = true;
-		}
+				trace_i915_request_in(rq, 0);
+				last = rq;
+				submit = true;
+			}
 
-		rb_erase_cached(&p->node, &sched_engine->queue);
-		i915_priolist_free(p);
+			rb_erase_cached(&p->node, &sched_engine->queue);
+			i915_priolist_free(p);
+		}
 	}
+
 done:
 	if (submit) {
+		struct intel_context *ce = last->context;
+
+		if (ce->guc_num_rq_submit_no_id) {
+			ret = tasklet_pin_guc_id(guc, last);
+			if (ret)
+				goto blk_tasklet_kick;
+		}
+
+register_context:
+		ret = tasklet_register_context(guc, last);
+		if (unlikely(ret == -EINPROGRESS))
+			goto blk_tasklet;
+		else if (unlikely(ret == -EPIPE))
+			goto deadlk;
+		else if (ret == -EBUSY)
+			goto schedule_tasklet;
+		else if (unlikely(ret != 0)) {
+			GEM_WARN_ON(ret);	/* Unexpected */
+			goto deadlk;
+		}
+
+move_lrc_tail:
 		guc_set_lrc_tail(last);
-resubmit:
+
+add_request:
 		ret = guc_add_request(guc, last);
 		if (unlikely(ret == -EPIPE))
 			goto deadlk;
-		else if (ret == -EBUSY) {
-			tasklet_schedule(&sched_engine->tasklet);
-			guc->stalled_request = last;
-			return false;
+		else if (ret == -EBUSY)
+			goto schedule_tasklet;
+		else if (unlikely(ret != 0)) {
+			GEM_WARN_ON(ret);	/* Unexpected */
+			goto deadlk;
 		}
 	}
 
-	guc->stalled_request = NULL;
+	/*
+	 * No requests without a guc_id, enable guc_id allocation at request
+	 * creation time (guc_request_alloc).
+	 */
+	if (!guc->total_num_rq_with_no_guc_id)
+		clr_guc_ids_exhausted(guc);
+
 	return submit;
 
+schedule_tasklet:
+	tasklet_schedule(&sched_engine->tasklet);
+	return false;
+
 deadlk:
 	sched_engine->tasklet.callback = NULL;
 	tasklet_disable_nosync(&sched_engine->tasklet);
 	return false;
+
+blk_tasklet_kick:
+	kick_retire_wq(guc);
+blk_tasklet:
+	set_tasklet_blocked(guc);
+	return false;
 }
 
 static void guc_submission_tasklet(struct tasklet_struct *t)
 {
 	struct i915_sched_engine *sched_engine =
 		from_tasklet(sched_engine, t, tasklet);
+	struct intel_guc *guc = sched_engine->private_data;
 	unsigned long flags;
 	bool loop;
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	do {
-		loop = guc_dequeue_one_context(sched_engine->private_data);
-	} while (loop);
+	if (likely(!tasklet_blocked(guc)))
+		do {
+			loop = guc_dequeue_one_context(guc);
+		} while (loop);
 
 	i915_sched_engine_reset_on_empty(sched_engine);
 
@@ -646,6 +928,14 @@ submission_disabled(struct intel_guc *guc)
 			!__tasklet_is_enabled(&sched_engine->tasklet));
 }
 
+static void kick_tasklet(struct intel_guc *guc)
+{
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+
+	if (likely(!tasklet_blocked(guc)))
+		tasklet_hi_schedule(&sched_engine->tasklet);
+}
+
 static void disable_submission(struct intel_guc *guc)
 {
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
@@ -669,8 +959,16 @@ static void enable_submission(struct intel_guc *guc)
 	    __tasklet_enable(&sched_engine->tasklet)) {
 		GEM_BUG_ON(!guc->ct.enabled);
 
+		/* Reset tasklet state */
+		guc->stalled_rq = NULL;
+		if (guc->stalled_context)
+			intel_context_put(guc->stalled_context);
+		guc->stalled_context = NULL;
+		guc->submission_stall_reason = STALL_NONE;
+		guc->flags = 0;
+
 		/* And kick in case we missed a new request submission. */
-		tasklet_hi_schedule(&sched_engine->tasklet);
+		kick_tasklet(guc);
 	}
 	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
 }
@@ -848,6 +1146,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 out_replay:
 	guc_reset_state(ce, head, stalled);
 	__unwind_incomplete_requests(ce);
+	ce->guc_num_rq_submit_no_id = 0;
 	intel_context_put(ce);
 }
 
@@ -879,6 +1178,7 @@ static void guc_cancel_context_requests(struct intel_context *ce)
 	spin_lock(&ce->guc_active.lock);
 	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
 		i915_request_put(i915_request_mark_eio(rq));
+	ce->guc_num_rq_submit_no_id = 0;
 	spin_unlock(&ce->guc_active.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
@@ -915,11 +1215,15 @@ guc_cancel_sched_engine_requests(struct i915_sched_engine *sched_engine)
 		struct i915_priolist *p = to_priolist(rb);
 
 		priolist_for_each_request_consume(rq, rn, p) {
+			struct intel_context *ce = rq->context;
+
 			list_del_init(&rq->sched.link);
 
 			__i915_request_submit(rq);
 
 			i915_request_put(i915_request_mark_eio(rq));
+
+			ce->guc_num_rq_submit_no_id = 0;
 		}
 
 		rb_erase_cached(&p->node, &sched_engine->queue);
@@ -970,6 +1274,51 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
+static void retire_worker_sched_disable(struct intel_guc *guc,
+					struct intel_context *ce);
+
+static void retire_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc =
+		container_of(w, struct intel_guc, retire_worker);
+
+	/*
+	 * It is possible that another thread issues the schedule disable + that
+	 * G2H completes moving the state machine further along to a point
+	 * where nothing needs to be done here. Let's be paranoid and kick the
+	 * tasklet in that case.
+	 */
+	if (guc->submission_stall_reason != STALL_SCHED_DISABLE &&
+	    guc->submission_stall_reason != STALL_GUC_ID_WORKQUEUE) {
+		kick_tasklet(guc);
+		return;
+	}
+
+	if (guc->submission_stall_reason == STALL_SCHED_DISABLE) {
+		GEM_BUG_ON(!guc->stalled_context);
+		GEM_BUG_ON(context_guc_id_invalid(guc->stalled_context));
+
+		retire_worker_sched_disable(guc, guc->stalled_context);
+	}
+
+	/*
+	 * guc_id pressure, always try to release it regardless of state,
+	 * albeit after possibly issuing a schedule disable as that is async
+	 * operation.
+	 */
+	intel_gt_retire_requests(guc_to_gt(guc));
+
+	if (guc->submission_stall_reason == STALL_GUC_ID_WORKQUEUE) {
+		GEM_BUG_ON(guc->stalled_context);
+
+		/* Hopefully guc_ids are now available, kick tasklet */
+		guc->submission_stall_reason = STALL_GUC_ID_TASKLET;
+		clr_tasklet_blocked(guc);
+
+		kick_tasklet(guc);
+	}
+}
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -993,9 +1342,12 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
 
 	spin_lock_init(&guc->contexts_lock);
-	INIT_LIST_HEAD(&guc->guc_id_list);
+	INIT_LIST_HEAD(&guc->guc_id_list_no_ref);
+	INIT_LIST_HEAD(&guc->guc_id_list_unpinned);
 	ida_init(&guc->guc_ids);
 
+	INIT_WORK(&guc->retire_worker, retire_worker_func);
+
 	return 0;
 }
 
@@ -1012,10 +1364,28 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
 				 struct i915_request *rq,
 				 int prio)
 {
+	bool empty = i915_sched_engine_is_empty(sched_engine);
+
 	GEM_BUG_ON(!list_empty(&rq->sched.link));
 	list_add_tail(&rq->sched.link,
 		      i915_sched_lookup_priolist(sched_engine, prio));
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+
+	if (empty)
+		kick_tasklet(&rq->engine->gt->uc.guc);
+}
+
+static bool need_tasklet(struct intel_guc *guc, struct intel_context *ce)
+{
+	struct i915_sched_engine * const sched_engine =
+		ce->engine->sched_engine;
+
+	lockdep_assert_held(&sched_engine->lock);
+
+	return guc_ids_exhausted(guc) || submission_disabled(guc) ||
+		guc->stalled_rq || guc->stalled_context ||
+		!lrc_desc_registered(guc, ce->guc_id) ||
+		!i915_sched_engine_is_empty(sched_engine);
 }
 
 static int guc_bypass_tasklet_submit(struct intel_guc *guc,
@@ -1029,8 +1399,6 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 
 	guc_set_lrc_tail(rq);
 	ret = guc_add_request(guc, rq);
-	if (ret == -EBUSY)
-		guc->stalled_request = rq;
 
 	if (unlikely(ret == -EPIPE))
 		disable_submission(guc);
@@ -1047,11 +1415,10 @@ static void guc_submit_request(struct i915_request *rq)
 	/* Will be called from irq-context when using foreign fences. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	if (submission_disabled(guc) || guc->stalled_request ||
-	    !i915_sched_engine_is_empty(sched_engine))
+	if (need_tasklet(guc, rq->context))
 		queue_request(sched_engine, rq, rq_prio(rq));
 	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
-		tasklet_hi_schedule(&sched_engine->tasklet);
+		kick_tasklet(guc);
 
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
@@ -1083,32 +1450,71 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 }
 
-static int steal_guc_id(struct intel_guc *guc)
+/*
+ * We have two lists for guc_ids available to steal. One list is for contexts
+ * that to have a zero guc_id_ref but are still pinned (scheduling enabled, only
+ * available inside tasklet) and the other is for contexts that are not pinned
+ * but still registered (available both outside and inside tasklet). Stealing
+ * from the latter only requires a deregister H2G, while the former requires a
+ * schedule disable H2G + a deregister H2G.
+ */
+static struct list_head *get_guc_id_list(struct intel_guc *guc,
+					 bool unpinned)
+{
+	if (unpinned)
+		return &guc->guc_id_list_unpinned;
+	else
+		return &guc->guc_id_list_no_ref;
+}
+
+static int steal_guc_id(struct intel_guc *guc, bool unpinned)
 {
 	struct intel_context *ce;
 	int guc_id;
+	struct list_head *guc_id_list = get_guc_id_list(guc, unpinned);
 
 	lockdep_assert_held(&guc->contexts_lock);
 
-	if (!list_empty(&guc->guc_id_list)) {
-		ce = list_first_entry(&guc->guc_id_list,
+	if (!list_empty(guc_id_list)) {
+		ce = list_first_entry(guc_id_list,
 				      struct intel_context,
 				      guc_id_link);
 
+		/* Ensure context getting stolen in expected state */
 		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
 		GEM_BUG_ON(context_guc_id_invalid(ce));
+		GEM_BUG_ON(context_guc_id_stolen(ce));
 
 		list_del_init(&ce->guc_id_link);
 		guc_id = ce->guc_id;
 		clr_context_registered(ce);
-		set_context_guc_id_invalid(ce);
+
+		/*
+		 * If stealing from the pinned list, defer invalidating
+		 * the guc_id until the retire workqueue processes this
+		 * context.
+		 */
+		if (!unpinned) {
+			GEM_BUG_ON(guc->stalled_context);
+			guc->stalled_context = intel_context_get(ce);
+			set_context_guc_id_stolen(ce);
+		} else {
+			set_context_guc_id_invalid(ce);
+		}
+
 		return guc_id;
 	} else {
 		return -EAGAIN;
 	}
 }
 
-static int assign_guc_id(struct intel_guc *guc, u16 *out)
+enum {	/* Return values for pin_guc_id / assign_guc_id */
+	SAME_GUC_ID		=0,
+	NEW_GUC_ID_DISABLED	=1,
+	NEW_GUC_ID_ENABLED	=2,
+};
+
+static int assign_guc_id(struct intel_guc *guc, u16 *out, bool tasklet)
 {
 	int ret;
 
@@ -1116,17 +1522,33 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out)
 
 	ret = new_guc_id(guc);
 	if (unlikely(ret < 0)) {
-		ret = steal_guc_id(guc);
-		if (ret < 0)
-			return ret;
+		ret = steal_guc_id(guc, true);
+		if (ret >= 0) {
+			*out = ret;
+			ret = NEW_GUC_ID_DISABLED;
+		} else if (ret < 0 && tasklet) {
+			/*
+			 * We only steal a guc_id from a context with scheduling
+			 * enabled if guc_ids are exhausted and we are submitting
+			 * from the tasklet.
+			 */
+			ret = steal_guc_id(guc, false);
+			if (ret >= 0) {
+				*out = ret;
+				ret = NEW_GUC_ID_ENABLED;
+			}
+		}
+	} else {
+		*out = ret;
+		ret = SAME_GUC_ID;
 	}
 
-	*out = ret;
-	return 0;
+	return ret;
 }
 
 #define PIN_GUC_ID_TRIES	4
-static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
+static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
+		      bool tasklet)
 {
 	int ret = 0;
 	unsigned long flags, tries = PIN_GUC_ID_TRIES;
@@ -1136,11 +1558,15 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 try_again:
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 
+	if (!tasklet && guc_ids_exhausted(guc)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
 	if (context_guc_id_invalid(ce)) {
-		ret = assign_guc_id(guc, &ce->guc_id);
-		if (ret)
+		ret = assign_guc_id(guc, &ce->guc_id, tasklet);
+		if (unlikely(ret < 0))
 			goto out_unlock;
-		ret = 1;	/* Indidcates newly assigned guc_id */
 	}
 	if (!list_empty(&ce->guc_id_link))
 		list_del_init(&ce->guc_id_link);
@@ -1156,8 +1582,11 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	 * attempting to retire more requests. Double the sleep period each
 	 * subsequent pass before finally giving up. The sleep period has max of
 	 * 100ms and minimum of 1ms.
+	 *
+	 * We only try this if outside the tasklet, inside the tasklet we have a
+	 * (slower, more complex, blocking) different flow control algorithm.
 	 */
-	if (ret == -EAGAIN && --tries) {
+	if (ret == -EAGAIN && --tries && !tasklet) {
 		if (PIN_GUC_ID_TRIES - tries > 1) {
 			unsigned int timeslice_shifted =
 				ce->engine->props.timeslice_duration_ms <<
@@ -1174,16 +1603,26 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 	return ret;
 }
 
-static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
+static void unpin_guc_id(struct intel_guc *guc,
+			 struct intel_context *ce,
+			 bool unpinned)
 {
 	unsigned long flags;
 
 	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
 
 	spin_lock_irqsave(&guc->contexts_lock, flags);
-	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id_link) &&
-	    !atomic_read(&ce->guc_id_ref))
-		list_add_tail(&ce->guc_id_link, &guc->guc_id_list);
+
+	if (!list_empty(&ce->guc_id_link))
+		list_del_init(&ce->guc_id_link);
+
+	if (!context_guc_id_invalid(ce) && !context_guc_id_stolen(ce) &&
+	    !atomic_read(&ce->guc_id_ref)) {
+		struct list_head *head = get_guc_id_list(guc, unpinned);
+
+		list_add_tail(&ce->guc_id_link, head);
+	}
+
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 }
 
@@ -1285,6 +1724,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
+	GEM_BUG_ON(context_guc_id_invalid(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -1327,6 +1767,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 		trace_intel_context_steal_guc_id(ce);
 		if (!loop) {
 			set_context_wait_for_deregister_to_register(ce);
+			set_context_block_tasklet(ce);
 			intel_context_get(ce);
 		} else {
 			bool disabled;
@@ -1354,7 +1795,14 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			ret = deregister_context(ce, ce->guc_id, loop);
 		if (unlikely(ret == -EBUSY)) {
 			clr_context_wait_for_deregister_to_register(ce);
+			clr_context_block_tasklet(ce);
 			intel_context_put(ce);
+		} else if (!loop && !ret) {
+			/*
+			 * A context de-registration has been issued from within
+			 * the tasklet. Need to block until it complete.
+			 */
+			return -EINPROGRESS;
 		} else if (unlikely(ret == -ENODEV))
 			ret = 0;	/* Will get registered later */
 	} else {
@@ -1409,7 +1857,9 @@ static void guc_context_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
-	unpin_guc_id(guc, ce);
+	GEM_BUG_ON(context_enabled(ce));
+
+	unpin_guc_id(guc, ce, true);
 	lrc_unpin(ce);
 }
 
@@ -1736,6 +2186,8 @@ static void guc_context_destroy(struct kref *kref)
 	unsigned long flags;
 	bool disabled;
 
+	GEM_BUG_ON(context_guc_id_stolen(ce));
+
 	/*
 	 * If the guc_id is invalid this context has been stolen and we can free
 	 * it immediately. Also can be freed immediately if the context is not
@@ -1894,6 +2346,9 @@ static void add_to_context(struct i915_request *rq)
 	spin_lock(&ce->guc_active.lock);
 	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
 
+	if (unlikely(request_has_no_guc_id(rq)))
+		++ce->guc_num_rq_submit_no_id;
+
 	if (rq->guc_prio == GUC_PRIO_INIT) {
 		rq->guc_prio = new_guc_prio;
 		add_context_inflight_prio(ce, rq->guc_prio);
@@ -1933,7 +2388,12 @@ static void remove_from_context(struct i915_request *rq)
 
 	spin_unlock_irq(&ce->guc_active.lock);
 
-	atomic_dec(&ce->guc_id_ref);
+	if (likely(!request_has_no_guc_id(rq)))
+		atomic_dec(&ce->guc_id_ref);
+	else
+		--ce_to_guc(rq->context)->total_num_rq_with_no_guc_id;
+	unpin_guc_id(ce_to_guc(ce), ce, false);
+
 	i915_request_notify_execute_cb_imm(rq);
 }
 
@@ -1985,13 +2445,144 @@ static void guc_signal_context_fence(struct intel_context *ce)
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 }
 
-static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
+static void invalidate_guc_id_sched_disable(struct intel_context *ce)
+{
+	set_context_guc_id_invalid(ce);
+	wmb();
+	clr_context_guc_id_stolen(ce);
+}
+
+static void retire_worker_sched_disable(struct intel_guc *guc,
+					struct intel_context *ce)
+{
+	unsigned long flags;
+	bool disabled;
+
+	guc->stalled_context = NULL;
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	disabled = submission_disabled(guc);
+	if (!disabled && !context_pending_disable(ce) && context_enabled(ce)) {
+		/*
+		 * Still enabled, issue schedule disable + configure state so
+		 * when G2H returns tasklet is kicked.
+		 */
+
+		struct intel_runtime_pm *runtime_pm =
+			&ce->engine->gt->i915->runtime_pm;
+		intel_wakeref_t wakeref;
+		u16 guc_id;
+
+		/*
+		 * We add +2 here as the schedule disable complete CTB handler
+		 * calls intel_context_sched_disable_unpin (-2 to pin_count).
+		 */
+		GEM_BUG_ON(!atomic_read(&ce->pin_count));
+		atomic_add(2, &ce->pin_count);
+
+		set_context_block_tasklet(ce);
+		guc_id = prep_context_pending_disable(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		with_intel_runtime_pm(runtime_pm, wakeref)
+			__guc_context_sched_disable(guc, ce, guc_id);
+
+		invalidate_guc_id_sched_disable(ce);
+	} else if (!disabled && context_pending_disable(ce)) {
+		/*
+		 * Schedule disable in flight, set bit to kick tasklet in G2H
+		 * handler and call it a day.
+		 */
+
+		set_context_block_tasklet(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		invalidate_guc_id_sched_disable(ce);
+	} else {
+		/* Schedule disable is done, kick tasklet */
+
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		invalidate_guc_id_sched_disable(ce);
+
+		guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
+		clr_tasklet_blocked(guc);
+
+		kick_tasklet(ce_to_guc(ce));
+	}
+
+	intel_context_put(ce);
+}
+
+static bool context_needs_lrc_desc_pin(struct intel_context *ce, bool new_guc_id)
 {
 	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
 		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id)) &&
 		!submission_disabled(ce_to_guc(ce));
 }
 
+static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+	int ret = 0;
+
+	lockdep_assert_held(&guc->sched_engine->lock);
+	GEM_BUG_ON(!ce->guc_num_rq_submit_no_id);
+
+	if (atomic_add_unless(&ce->guc_id_ref, ce->guc_num_rq_submit_no_id, 0))
+		goto out;
+
+	ret = pin_guc_id(guc, ce, true);
+	if (unlikely(ret < 0)) {
+		/*
+		 * No guc_ids available, disable the tasklet and kick the retire
+		 * workqueue hopefully freeing up some guc_ids.
+		 */
+		guc->stalled_rq = rq;
+		guc->submission_stall_reason = STALL_GUC_ID_WORKQUEUE;
+		return ret;
+	}
+
+	if (ce->guc_num_rq_submit_no_id - 1 > 0)
+		atomic_add(ce->guc_num_rq_submit_no_id - 1,
+			   &ce->guc_id_ref);
+
+	if (context_needs_lrc_desc_pin(ce, !!ret))
+		set_context_needs_register(ce);
+
+	if (ret == NEW_GUC_ID_ENABLED) {
+		guc->stalled_rq = rq;
+		guc->submission_stall_reason = STALL_SCHED_DISABLE;
+	}
+
+	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
+out:
+	guc->total_num_rq_with_no_guc_id -= ce->guc_num_rq_submit_no_id;
+	GEM_BUG_ON(guc->total_num_rq_with_no_guc_id < 0);
+
+	list_for_each_entry_reverse(rq, &ce->guc_active.requests, sched.link)
+		if (request_has_no_guc_id(rq)) {
+			--ce->guc_num_rq_submit_no_id;
+			clear_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED,
+				  &rq->fence.flags);
+		} else if (!ce->guc_num_rq_submit_no_id) {
+			break;
+		}
+
+	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
+
+	/*
+	 * When NEW_GUC_ID_ENABLED is returned it means we are stealing a guc_id
+	 * from a context that has scheduling enabled. We have to disable
+	 * scheduling before deregistering the context and it isn't safe to do
+	 * in the tasklet because of lock inversion (ce->guc_state.lock must be
+	 * acquired before guc->sched_engine->lock). To work around this
+	 * we do the schedule disable in retire workqueue and block the tasklet
+	 * until the schedule done G2H returns. Returning non-zero here kicks
+	 * the workqueue.
+	 */
+	return (ret == NEW_GUC_ID_ENABLED) ? ret : 0;
+}
+
 static int guc_request_alloc(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
@@ -2001,6 +2592,15 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	GEM_BUG_ON(!intel_context_is_pinned(rq->context));
 
+	/*
+	 * guc_ids are exhausted, don't allocate one here, defer to submission
+	 * in the tasklet.
+	 */
+	if (test_and_update_guc_ids_exhausted(guc)) {
+		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
+		goto out;
+	}
+
 	/*
 	 * Flush enough space to reduce the likelihood of waiting after
 	 * we start building the request - in which case we will just
@@ -2030,9 +2630,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * when guc_ids are being stolen due to over subscription. By the time
 	 * this function is reached, it is guaranteed that the guc_id will be
 	 * persistent until the generated request is retired. Thus, sealing these
-	 * race conditions. It is still safe to fail here if guc_ids are
-	 * exhausted and return -EAGAIN to the user indicating that they can try
-	 * again in the future.
+	 * race conditions.
 	 *
 	 * There is no need for a lock here as the timeline mutex ensures at
 	 * most one context can be executing this code path at once. The
@@ -2043,10 +2641,26 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
 		goto out;
 
-	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
-	if (unlikely(ret < 0))
+	ret = pin_guc_id(guc, ce, false);	/* > 0 indicates new guc_id */
+	if (unlikely(ret == -EAGAIN)) {
+		/*
+		 * No guc_ids available, so we force this submission and all
+		 * future submissions to be serialized in the tasklet, sharing
+		 * the guc_ids on a per submission basis to ensure (more) fair
+		 * scheduling of submissions. Once the tasklet is flushed of
+		 * submissions we return to allocating guc_ids in this function.
+		 */
+		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
+		set_and_update_guc_ids_exhausted(guc);
+
+		return 0;
+	} else if (unlikely(ret < 0)) {
 		return ret;
-	if (context_needs_register(ce, !!ret)) {
+	}
+
+	GEM_BUG_ON(ret == NEW_GUC_ID_ENABLED);
+
+	if (context_needs_lrc_desc_pin(ce, !!ret)) {
 		ret = guc_lrc_desc_pin(ce, true);
 		if (unlikely(ret)) {	/* unwind */
 			if (ret == -EPIPE) {
@@ -2054,7 +2668,7 @@ static int guc_request_alloc(struct i915_request *rq)
 				goto out;	/* GPU will be reset */
 			}
 			atomic_dec(&ce->guc_id_ref);
-			unpin_guc_id(guc, ce);
+			unpin_guc_id(guc, ce, true);
 			return ret;
 		}
 	}
@@ -2325,7 +2939,7 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
 					  struct intel_context *ce)
 {
 	if (context_guc_id_invalid(ce))
-		pin_guc_id(guc, ce);
+		pin_guc_id(guc, ce, false);
 	guc_lrc_desc_pin(ce, true);
 }
 
@@ -2591,6 +3205,16 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			register_context(ce, true);
 		guc_signal_context_fence(ce);
+		if (context_block_tasklet(ce)) {
+			GEM_BUG_ON(guc->submission_stall_reason !=
+				   STALL_DEREGISTER_CONTEXT);
+
+			clr_context_block_tasklet(ce);
+			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
+			clr_tasklet_blocked(guc);
+
+			kick_tasklet(ce_to_guc(ce));
+		}
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
@@ -2654,6 +3278,14 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		guc_blocked_fence_complete(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
+		if (context_block_tasklet(ce)) {
+			clr_context_block_tasklet(ce);
+			guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
+			clr_tasklet_blocked(guc);
+
+			kick_tasklet(ce_to_guc(ce));
+		}
+
 		if (banned) {
 			guc_cancel_context_requests(ce);
 			intel_engine_signal_breadcrumbs(ce->engine);
@@ -2682,10 +3314,8 @@ static void capture_error_state(struct intel_guc *guc,
 
 static void guc_context_replay(struct intel_context *ce)
 {
-	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
-
 	__guc_reset_context(ce, true);
-	tasklet_hi_schedule(&sched_engine->tasklet);
+	kick_tasklet(ce_to_guc(ce));
 }
 
 static void guc_handle_context_reset(struct intel_guc *guc,
@@ -2844,8 +3474,16 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 		   atomic_read(&guc->outstanding_submission_g2h));
 	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
 	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
-	drm_printf(p, "GuC tasklet count: %u\n\n",
+	drm_printf(p, "GuC tasklet count: %u\n",
 		   atomic_read(&sched_engine->tasklet.count));
+	drm_printf(p, "GuC submit flags: 0x%04lx\n", guc->flags);
+	drm_printf(p, "GuC total number request without guc_id: %d\n",
+		   guc->total_num_rq_with_no_guc_id);
+	drm_printf(p, "GuC stall reason: %d\n", guc->submission_stall_reason);
+	drm_printf(p, "GuC stalled request: %s\n",
+		   yesno(guc->stalled_rq));
+	drm_printf(p, "GuC stalled context: %s\n\n",
+		   yesno(guc->stalled_context));
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	drm_printf(p, "Requests in GuC submit tasklet:\n");
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index f0463d19c712..5f304fd02071 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -139,6 +139,12 @@ enum {
 	 * the GPU. Here we track such boost requests on a per-request basis.
 	 */
 	I915_FENCE_FLAG_BOOST,
+
+	/*
+	 * I915_FENCE_FLAG_GUC_ID_NOT_PINNED - Set to signal the GuC submission
+	 * tasklet that the guc_id isn't pinned.
+	 */
+	I915_FENCE_FLAG_GUC_ID_NOT_PINNED,
 };
 
 /**
-- 
2.28.0

