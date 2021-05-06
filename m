Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6059375B38
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A06EE0C;
	Thu,  6 May 2021 18:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F296EDA1;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: XMyCyPpGYSChem0NYCx55uGeNVm0NfhrDY41a7RkJEPNIfDaYSLXWD2+QF9lV8GU6PKXFBJeai
 TxrI2QDHqnaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531036"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: duhu1sLxNn4zNylFlQm3VHvn5PGFkdytZx2yuUkRxc+/0yFr78mRKxeDg+2fE2YqFYb4REx9Tl
 gzld4T4Yursw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583638"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 85/97] drm/i915/guc: Introduce guc_submit_engine object
Date: Thu,  6 May 2021 12:14:39 -0700
Message-Id: <20210506191451.77768-86-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Move fields related to controlling the GuC submission state machine to a
unique object (guc_submit_engine) rather than the global GuC state
(intel_guc). This encapsulation allows multiple instances of submission
objects to operate in parallel and a single instance can block if needed
while another can make forward progress. This is analogous to how the
execlist mode works assigning a schedule object per physical engine but
rather in GuC mode we assign a schedule object based on the blocking
dependencies.

The guc_submit_engine object also encapsulates the i915_sched_engine
object as well.

Lots of find-replace.

Currently only 1 guc_submit_engine instantiated, future patches will
instantiate more.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  33 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 544 +++++++++++-------
 .../i915/gt/uc/intel_guc_submission_types.h   |  53 ++
 drivers/gpu/drm/i915/i915_scheduler.c         |  25 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   5 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   3 +
 6 files changed, 411 insertions(+), 252 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 26a0225f45e9..904f3a941832 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -20,6 +20,11 @@
 
 struct __guc_ads_blob;
 
+enum {
+	GUC_SUBMIT_ENGINE_SINGLE_LRC,
+	GUC_SUBMIT_ENGINE_MAX
+};
+
 /*
  * Top level structure of GuC. It handles firmware loading and manages client
  * pool. intel_guc owns a intel_guc_client to replace the legacy ExecList
@@ -30,31 +35,6 @@ struct intel_guc {
 	struct intel_guc_log log;
 	struct intel_guc_ct ct;
 
-	/* Global engine used to submit requests to GuC */
-	struct i915_sched_engine *sched_engine;
-
-	/* Global state related to submission tasklet */
-	struct i915_request *stalled_rq;
-	struct intel_context *stalled_context;
-	struct work_struct retire_worker;
-	unsigned long flags;
-	int total_num_rq_with_no_guc_id;
-
-	/*
-	 * Submisson stall reason. See intel_guc_submission.c for detailed
-	 * description.
-	 */
-	enum {
-		STALL_NONE,
-		STALL_GUC_ID_WORKQUEUE,
-		STALL_GUC_ID_TASKLET,
-		STALL_SCHED_DISABLE,
-		STALL_REGISTER_CONTEXT,
-		STALL_DEREGISTER_CONTEXT,
-		STALL_MOVE_LRC_TAIL,
-		STALL_ADD_REQUEST,
-	} submission_stall_reason;
-
 	/* intel_guc_recv interrupt related state */
 	spinlock_t irq_lock;
 	unsigned int msg_enabled_mask;
@@ -68,6 +48,8 @@ struct intel_guc {
 		void (*disable)(struct intel_guc *guc);
 	} interrupts;
 
+	struct guc_submit_engine *gse[GUC_SUBMIT_ENGINE_MAX];
+
 	/*
 	 * contexts_lock protects the pool of free guc ids and a linked list of
 	 * guc ids available to be stolden
@@ -76,7 +58,6 @@ struct intel_guc {
 	struct ida guc_ids;
 	u32 num_guc_ids;
 	u32 max_guc_ids;
-	atomic_t num_guc_ids_not_ready;
 	struct list_head guc_id_list_no_ref;
 	struct list_head guc_id_list_unpinned;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index aa5e608deed5..9dc0ffc07cd7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -21,6 +21,7 @@
 #include "gt/intel_ring.h"
 
 #include "intel_guc_submission.h"
+#include "intel_guc_submission_types.h"
 
 #include "i915_drv.h"
 #include "i915_trace.h"
@@ -57,7 +58,7 @@
  * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
  * represents in-order queue. The kernel driver packs ring tail pointer and an
  * ELSP context descriptor dword into Work Item.
- * See guc_add_request()
+ * See gse_add_request()
  *
  * GuC flow control state machine:
  * The tasklet, workqueue (retire_worker), and the G2H handlers together more or
@@ -80,57 +81,57 @@
  *				context)
  */
 
-/* GuC Virtual Engine */
-struct guc_virtual_engine {
-	struct intel_engine_cs base;
-	struct intel_context context;
-};
-
 static struct intel_context *
 guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
 
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
+static inline struct guc_submit_engine *ce_to_gse(struct intel_context *ce)
+{
+	return container_of(ce->engine->sched_engine, struct guc_submit_engine,
+			    sched_engine);
+}
+
 /*
  * Global GuC flags helper functions
  */
 enum {
-	GUC_STATE_TASKLET_BLOCKED,
-	GUC_STATE_GUC_IDS_EXHAUSTED,
+	GSE_STATE_TASKLET_BLOCKED,
+	GSE_STATE_GUC_IDS_EXHAUSTED,
 };
 
-static bool tasklet_blocked(struct intel_guc *guc)
+static bool tasklet_blocked(struct guc_submit_engine *gse)
 {
-	return test_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+	return test_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
 }
 
-static void set_tasklet_blocked(struct intel_guc *guc)
+static void set_tasklet_blocked(struct guc_submit_engine *gse)
 {
-	lockdep_assert_held(&guc->sched_engine->lock);
-	set_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+	lockdep_assert_held(&gse->sched_engine.lock);
+	set_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
 }
 
-static void __clr_tasklet_blocked(struct intel_guc *guc)
+static void __clr_tasklet_blocked(struct guc_submit_engine *gse)
 {
-	lockdep_assert_held(&guc->sched_engine->lock);
-	clear_bit(GUC_STATE_TASKLET_BLOCKED, &guc->flags);
+	lockdep_assert_held(&gse->sched_engine.lock);
+	clear_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
 }
 
-static void clr_tasklet_blocked(struct intel_guc *guc)
+static void clr_tasklet_blocked(struct guc_submit_engine *gse)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&guc->sched_engine->lock, flags);
-	__clr_tasklet_blocked(guc);
-	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+	spin_lock_irqsave(&gse->sched_engine.lock, flags);
+	__clr_tasklet_blocked(gse);
+	spin_unlock_irqrestore(&gse->sched_engine.lock, flags);
 }
 
-static bool guc_ids_exhausted(struct intel_guc *guc)
+static bool guc_ids_exhausted(struct guc_submit_engine *gse)
 {
-	return test_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
+	return test_bit(GSE_STATE_GUC_IDS_EXHAUSTED, &gse->flags);
 }
 
-static bool test_and_update_guc_ids_exhausted(struct intel_guc *guc)
+static bool test_and_update_guc_ids_exhausted(struct guc_submit_engine *gse)
 {
 	unsigned long flags;
 	bool ret = false;
@@ -139,33 +140,33 @@ static bool test_and_update_guc_ids_exhausted(struct intel_guc *guc)
 	 * Strict ordering on checking if guc_ids are exhausted isn't required,
 	 * so let's avoid grabbing the submission lock if possible.
 	 */
-	if (guc_ids_exhausted(guc)) {
-		spin_lock_irqsave(&guc->sched_engine->lock, flags);
-		ret = guc_ids_exhausted(guc);
+	if (guc_ids_exhausted(gse)) {
+		spin_lock_irqsave(&gse->sched_engine.lock, flags);
+		ret = guc_ids_exhausted(gse);
 		if (ret)
-			++guc->total_num_rq_with_no_guc_id;
-		spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+			++gse->total_num_rq_with_no_guc_id;
+		spin_unlock_irqrestore(&gse->sched_engine.lock, flags);
 	}
 
 	return ret;
 }
 
-static void set_and_update_guc_ids_exhausted(struct intel_guc *guc)
+static void set_and_update_guc_ids_exhausted(struct guc_submit_engine *gse)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&guc->sched_engine->lock, flags);
-	++guc->total_num_rq_with_no_guc_id;
-	set_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
-	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+	spin_lock_irqsave(&gse->sched_engine.lock, flags);
+	++gse->total_num_rq_with_no_guc_id;
+	set_bit(GSE_STATE_GUC_IDS_EXHAUSTED, &gse->flags);
+	spin_unlock_irqrestore(&gse->sched_engine.lock, flags);
 }
 
-static void clr_guc_ids_exhausted(struct intel_guc *guc)
+static void clr_guc_ids_exhausted(struct guc_submit_engine *gse)
 {
-	lockdep_assert_held(&guc->sched_engine->lock);
-	GEM_BUG_ON(guc->total_num_rq_with_no_guc_id);
+	lockdep_assert_held(&gse->sched_engine.lock);
+	GEM_BUG_ON(gse->total_num_rq_with_no_guc_id);
 
-	clear_bit(GUC_STATE_GUC_IDS_EXHAUSTED, &guc->flags);
+	clear_bit(GSE_STATE_GUC_IDS_EXHAUSTED, &gse->flags);
 }
 
 /*
@@ -372,6 +373,20 @@ static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
 	return &ce->engine->gt->uc.guc;
 }
 
+static inline struct i915_sched_engine *
+ce_to_sched_engine(struct intel_context *ce)
+{
+	return ce->engine->sched_engine;
+}
+
+static inline struct i915_sched_engine *
+guc_to_sched_engine(struct intel_guc *guc, int index)
+{
+	GEM_BUG_ON(index < 0 || index >= GUC_SUBMIT_ENGINE_MAX);
+
+	return &guc->gse[index]->sched_engine;
+}
+
 static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 {
 	return rb_entry(rb, struct i915_priolist, node);
@@ -591,19 +606,20 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	return err;
 }
 
-static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
+static int gse_add_request(struct guc_submit_engine *gse,
+			   struct i915_request *rq)
 {
 	int ret;
 
-	lockdep_assert_held(&guc->sched_engine->lock);
+	lockdep_assert_held(&gse->sched_engine.lock);
 
-	ret = __guc_add_request(guc, rq);
+	ret = __guc_add_request(gse->guc, rq);
 	if (ret == -EBUSY) {
-		guc->stalled_rq = rq;
-		guc->submission_stall_reason = STALL_ADD_REQUEST;
+		gse->stalled_rq = rq;
+		gse->submission_stall_reason = STALL_ADD_REQUEST;
 	} else {
-		guc->stalled_rq = NULL;
-		guc->submission_stall_reason = STALL_NONE;
+		gse->stalled_rq = NULL;
+		gse->submission_stall_reason = STALL_NONE;
 	}
 
 	return ret;
@@ -611,14 +627,14 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 
 static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
 
-static int tasklet_register_context(struct intel_guc *guc,
+static int tasklet_register_context(struct guc_submit_engine *gse,
 				    struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 	int ret = 0;
 
 	/* Check state */
-	lockdep_assert_held(&guc->sched_engine->lock);
+	lockdep_assert_held(&gse->sched_engine.lock);
 	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
 	GEM_BUG_ON(request_has_no_guc_id(rq));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
@@ -631,7 +647,7 @@ static int tasklet_register_context(struct intel_guc *guc,
 	 * register this context or a corner case where the GuC firwmare was
 	 * blown away and reloaded while this context was pinned
 	 */
-	if (unlikely((!lrc_desc_registered(guc, ce->guc_id) ||
+	if (unlikely((!lrc_desc_registered(gse->guc, ce->guc_id) ||
 		      context_needs_register(ce)) &&
 		     !intel_context_is_banned(ce))) {
 		ret = guc_lrc_desc_pin(ce, false);
@@ -640,11 +656,11 @@ static int tasklet_register_context(struct intel_guc *guc,
 			clr_context_needs_register(ce);
 
 		if (unlikely(ret == -EBUSY)) {
-			guc->stalled_rq = rq;
-			guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
+			gse->stalled_rq = rq;
+			gse->submission_stall_reason = STALL_REGISTER_CONTEXT;
 		} else if (unlikely(ret == -EINPROGRESS)) {
-			guc->stalled_rq = rq;
-			guc->submission_stall_reason = STALL_DEREGISTER_CONTEXT;
+			gse->stalled_rq = rq;
+			gse->submission_stall_reason = STALL_DEREGISTER_CONTEXT;
 		}
 	}
 
@@ -663,28 +679,29 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
-static void kick_retire_wq(struct intel_guc *guc)
+static void kick_retire_wq(struct guc_submit_engine *gse)
 {
-	queue_work(system_unbound_wq, &guc->retire_worker);
+	queue_work(system_unbound_wq, &gse->retire_worker);
 }
 
-static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq);
+static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
+			      struct i915_request *rq);
 
-static int guc_dequeue_one_context(struct intel_guc *guc)
+static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
-	struct i915_request *last = guc->stalled_rq;
+	struct i915_sched_engine * const sched_engine = &gse->sched_engine;
+	struct i915_request *last = gse->stalled_rq;
 	bool submit = !!last;
 	struct rb_node *rb;
 	int ret;
 
 	lockdep_assert_held(&sched_engine->lock);
-	GEM_BUG_ON(guc->stalled_context);
-	GEM_BUG_ON(!submit && guc->submission_stall_reason);
+	GEM_BUG_ON(gse->stalled_context);
+	GEM_BUG_ON(!submit && gse->submission_stall_reason);
 
 	if (submit) {
 		/* Flow control conditions */
-		switch (guc->submission_stall_reason) {
+		switch (gse->submission_stall_reason) {
 		case STALL_GUC_ID_TASKLET:
 			goto done;
 		case STALL_REGISTER_CONTEXT:
@@ -697,8 +714,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 			GEM_BUG_ON("Invalid stall state");
 		}
 	} else {
-		GEM_BUG_ON(!guc->total_num_rq_with_no_guc_id &&
-			   guc_ids_exhausted(guc));
+		GEM_BUG_ON(!gse->total_num_rq_with_no_guc_id &&
+			   guc_ids_exhausted(gse));
 
 		while ((rb = rb_first_cached(&sched_engine->queue))) {
 			struct i915_priolist *p = to_priolist(rb);
@@ -727,13 +744,13 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 		struct intel_context *ce = last->context;
 
 		if (ce->guc_num_rq_submit_no_id) {
-			ret = tasklet_pin_guc_id(guc, last);
+			ret = tasklet_pin_guc_id(gse, last);
 			if (ret)
 				goto blk_tasklet_kick;
 		}
 
 register_context:
-		ret = tasklet_register_context(guc, last);
+		ret = tasklet_register_context(gse, last);
 		if (unlikely(ret == -EINPROGRESS))
 			goto blk_tasklet;
 		else if (unlikely(ret == -EDEADLK))
@@ -749,7 +766,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 		guc_set_lrc_tail(last);
 
 add_request:
-		ret = guc_add_request(guc, last);
+		ret = gse_add_request(gse, last);
 		if (unlikely(ret == -EDEADLK))
 			goto deadlk;
 		else if (ret == -EBUSY)
@@ -764,8 +781,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 	 * No requests without a guc_id, enable guc_id allocation at request
 	 * creation time (guc_request_alloc).
 	 */
-	if (!guc->total_num_rq_with_no_guc_id)
-		clr_guc_ids_exhausted(guc);
+	if (!gse->total_num_rq_with_no_guc_id)
+		clr_guc_ids_exhausted(gse);
 
 	return submit;
 
@@ -780,25 +797,26 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 	return false;
 
 blk_tasklet_kick:
-	kick_retire_wq(guc);
+	kick_retire_wq(gse);
 blk_tasklet:
-	set_tasklet_blocked(guc);
+	set_tasklet_blocked(gse);
 	return false;
 }
 
-static void guc_submission_tasklet(struct tasklet_struct *t)
+static void gse_submission_tasklet(struct tasklet_struct *t)
 {
 	struct i915_sched_engine *sched_engine =
 		from_tasklet(sched_engine, t, tasklet);
-	struct intel_guc *guc = &sched_engine->engine->gt->uc.guc;
+	struct guc_submit_engine *gse =
+		container_of(sched_engine, typeof(*gse), sched_engine);
 	unsigned long flags;
 	bool loop;
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	if (likely(!tasklet_blocked(guc)))
+	if (likely(!tasklet_blocked(gse)))
 		do {
-			loop = guc_dequeue_one_context(guc);
+			loop = gse_dequeue_one_context(gse);
 		} while (loop);
 
 	i915_sched_engine_reset_on_empty(sched_engine);
@@ -871,65 +889,92 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 static inline bool
 submission_disabled(struct intel_guc *guc)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	int i;
+
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+		struct i915_sched_engine *sched_engine =
+			guc_to_sched_engine(guc, i);
+
+		if (unlikely(!__tasklet_is_enabled(&sched_engine->tasklet)))
+			return true;
+	}
 
-	return unlikely(!__tasklet_is_enabled(&sched_engine->tasklet));
+	return false;
 }
 
-static void kick_tasklet(struct intel_guc *guc)
+static void kick_tasklet(struct guc_submit_engine *gse)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	struct i915_sched_engine *sched_engine = &gse->sched_engine;
 
-	if (likely(!tasklet_blocked(guc)))
+	if (likely(!tasklet_blocked(gse)))
 		i915_sched_engine_hi_kick(sched_engine);
 }
 
 static void disable_submission(struct intel_guc *guc)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	int i;
 
-	if (__tasklet_is_enabled(&sched_engine->tasklet)) {
-		GEM_BUG_ON(!guc->ct.enabled);
-		__tasklet_disable_sync_once(&sched_engine->tasklet);
-		sched_engine->tasklet.callback = NULL;
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+		struct i915_sched_engine *sched_engine =
+			guc_to_sched_engine(guc, i);
+
+		if (__tasklet_is_enabled(&sched_engine->tasklet)) {
+			GEM_BUG_ON(!guc->ct.enabled);
+			__tasklet_disable_sync_once(&sched_engine->tasklet);
+			sched_engine->tasklet.callback = NULL;
+		}
 	}
 }
 
 static void enable_submission(struct intel_guc *guc)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
 	unsigned long flags;
+	int i;
 
-	spin_lock_irqsave(&guc->sched_engine->lock, flags);
-	sched_engine->tasklet.callback = guc_submission_tasklet;
-	wmb();
-	if (!__tasklet_is_enabled(&sched_engine->tasklet) &&
-	    __tasklet_enable(&sched_engine->tasklet)) {
-		GEM_BUG_ON(!guc->ct.enabled);
-
-		/* Reset tasklet state */
-		guc->stalled_rq = NULL;
-		if (guc->stalled_context)
-			intel_context_put(guc->stalled_context);
-		guc->stalled_context = NULL;
-		guc->submission_stall_reason = STALL_NONE;
-		guc->flags = 0;
-
-		/* And kick in case we missed a new request submission. */
-		kick_tasklet(guc);
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+		struct i915_sched_engine *sched_engine =
+			guc_to_sched_engine(guc, i);
+		struct guc_submit_engine *gse = guc->gse[i];
+
+		spin_lock_irqsave(&sched_engine->lock, flags);
+		sched_engine->tasklet.callback = gse_submission_tasklet;
+		wmb();
+		if (!__tasklet_is_enabled(&sched_engine->tasklet) &&
+		    __tasklet_enable(&sched_engine->tasklet)) {
+			GEM_BUG_ON(!guc->ct.enabled);
+
+			/* Reset GuC submit engine state */
+			gse->stalled_rq = NULL;
+			if (gse->stalled_context)
+				intel_context_put(gse->stalled_context);
+			gse->stalled_context = NULL;
+			gse->submission_stall_reason = STALL_NONE;
+			gse->flags = 0;
+
+			/* And kick in case we missed a new request submission. */
+			kick_tasklet(gse);
+		}
+		spin_unlock_irqrestore(&sched_engine->lock, flags);
 	}
-	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
 }
 
-static void guc_flush_submissions(struct intel_guc *guc)
+static void gse_flush_submissions(struct guc_submit_engine *gse)
 {
-	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	struct i915_sched_engine * const sched_engine = &gse->sched_engine;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+static void guc_flush_submissions(struct intel_guc *guc)
+{
+	int i;
+
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
+		gse_flush_submissions(guc->gse[i]);
+}
+
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
 	int i;
@@ -1111,13 +1156,12 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 		if (intel_context_is_pinned(ce))
 			__guc_reset_context(ce, stalled);
 
-	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
 }
 
 static void guc_cancel_context_requests(struct intel_context *ce)
 {
-	struct i915_sched_engine *sched_engine = ce_to_guc(ce)->sched_engine;
+	struct i915_sched_engine *sched_engine = ce_to_sched_engine(ce);
 	struct i915_request *rq;
 	unsigned long flags;
 
@@ -1132,8 +1176,9 @@ static void guc_cancel_context_requests(struct intel_context *ce)
 }
 
 static void
-guc_cancel_sched_engine_requests(struct i915_sched_engine *sched_engine)
+gse_cancel_requests(struct guc_submit_engine *gse)
 {
+	struct i915_sched_engine *sched_engine = &gse->sched_engine;
 	struct i915_request *rq, *rn;
 	struct rb_node *rb;
 	unsigned long flags;
@@ -1190,12 +1235,14 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	int i;
 
 	xa_for_each(&guc->context_lookup, index, ce)
 		if (intel_context_is_pinned(ce))
 			guc_cancel_context_requests(ce);
 
-	guc_cancel_sched_engine_requests(guc->sched_engine);
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
+		gse_cancel_requests(guc->gse[i]);
 
 	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
@@ -1222,13 +1269,13 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
-static void retire_worker_sched_disable(struct intel_guc *guc,
+static void retire_worker_sched_disable(struct guc_submit_engine *gse,
 					struct intel_context *ce);
 
 static void retire_worker_func(struct work_struct *w)
 {
-	struct intel_guc *guc =
-		container_of(w, struct intel_guc, retire_worker);
+	struct guc_submit_engine *gse =
+		container_of(w, struct guc_submit_engine, retire_worker);
 
 	/*
 	 * It is possible that another thread issues the schedule disable + that
@@ -1236,17 +1283,17 @@ static void retire_worker_func(struct work_struct *w)
 	 * where nothing needs to be done here. Let's be paranoid and kick the
 	 * tasklet in that case.
 	 */
-	if (guc->submission_stall_reason != STALL_SCHED_DISABLE &&
-	    guc->submission_stall_reason != STALL_GUC_ID_WORKQUEUE) {
-		kick_tasklet(guc);
+	if (gse->submission_stall_reason != STALL_SCHED_DISABLE &&
+	    gse->submission_stall_reason != STALL_GUC_ID_WORKQUEUE) {
+		kick_tasklet(gse);
 		return;
 	}
 
-	if (guc->submission_stall_reason == STALL_SCHED_DISABLE) {
-		GEM_BUG_ON(!guc->stalled_context);
-		GEM_BUG_ON(context_guc_id_invalid(guc->stalled_context));
+	if (gse->submission_stall_reason == STALL_SCHED_DISABLE) {
+		GEM_BUG_ON(!gse->stalled_context);
+		GEM_BUG_ON(context_guc_id_invalid(gse->stalled_context));
 
-		retire_worker_sched_disable(guc, guc->stalled_context);
+		retire_worker_sched_disable(gse, gse->stalled_context);
 	}
 
 	/*
@@ -1254,16 +1301,16 @@ static void retire_worker_func(struct work_struct *w)
 	 * albeit after possibly issuing a schedule disable as that is async
 	 * operation.
 	 */
-	intel_gt_retire_requests(guc_to_gt(guc));
+	intel_gt_retire_requests(guc_to_gt(gse->guc));
 
-	if (guc->submission_stall_reason == STALL_GUC_ID_WORKQUEUE) {
-		GEM_BUG_ON(guc->stalled_context);
+	if (gse->submission_stall_reason == STALL_GUC_ID_WORKQUEUE) {
+		GEM_BUG_ON(gse->stalled_context);
 
 		/* Hopefully guc_ids are now available, kick tasklet */
-		guc->submission_stall_reason = STALL_GUC_ID_TASKLET;
-		clr_tasklet_blocked(guc);
+		gse->submission_stall_reason = STALL_GUC_ID_TASKLET;
+		clr_tasklet_blocked(gse);
 
-		kick_tasklet(guc);
+		kick_tasklet(gse);
 	}
 }
 
@@ -1294,18 +1341,24 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->guc_id_list_unpinned);
 	ida_init(&guc->guc_ids);
 
-	INIT_WORK(&guc->retire_worker, retire_worker_func);
-
 	return 0;
 }
 
 void intel_guc_submission_fini(struct intel_guc *guc)
 {
+	int i;
+
 	if (!guc->lrc_desc_pool)
 		return;
 
 	guc_lrc_desc_pool_destroy(guc);
-	i915_sched_engine_put(guc->sched_engine);
+
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+		struct i915_sched_engine *sched_engine =
+			guc_to_sched_engine(guc, i);
+
+		i915_sched_engine_put(sched_engine);
+	}
 }
 
 static inline void queue_request(struct i915_sched_engine *sched_engine,
@@ -1320,22 +1373,22 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
 	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
 
 	if (empty)
-		kick_tasklet(&rq->engine->gt->uc.guc);
+		kick_tasklet(ce_to_gse(rq->context));
 }
 
 /* Macro to tweak heuristic, using a simple over 50% not ready for now */
 #define TOO_MANY_GUC_IDS_NOT_READY(avail, consumed) \
 	(consumed > avail / 2)
-static bool too_many_guc_ids_not_ready(struct intel_guc *guc,
+static bool too_many_guc_ids_not_ready(struct guc_submit_engine *gse,
 				       struct intel_context *ce)
 {
 	u32 available_guc_ids, guc_ids_consumed;
 
-	available_guc_ids = guc->num_guc_ids;
-	guc_ids_consumed = atomic_read(&guc->num_guc_ids_not_ready);
+	available_guc_ids = gse->guc->num_guc_ids;
+	guc_ids_consumed = atomic_read(&gse->num_guc_ids_not_ready);
 
 	if (TOO_MANY_GUC_IDS_NOT_READY(available_guc_ids, guc_ids_consumed)) {
-		set_and_update_guc_ids_exhausted(guc);
+		set_and_update_guc_ids_exhausted(gse);
 		return true;
 	}
 
@@ -1344,34 +1397,35 @@ static bool too_many_guc_ids_not_ready(struct intel_guc *guc,
 
 static void incr_num_rq_not_ready(struct intel_context *ce)
 {
-	struct intel_guc *guc = ce_to_guc(ce);
+	struct guc_submit_engine *gse = ce_to_gse(ce);
 
 	if (!atomic_fetch_add(1, &ce->guc_num_rq_not_ready))
-		atomic_inc(&guc->num_guc_ids_not_ready);
+		atomic_inc(&gse->num_guc_ids_not_ready);
 }
 
 void intel_guc_decr_num_rq_not_ready(struct intel_context *ce)
 {
-	struct intel_guc *guc = ce_to_guc(ce);
+	struct guc_submit_engine *gse = ce_to_gse(ce);
 
-	if (atomic_fetch_add(-1, &ce->guc_num_rq_not_ready) == 1)
-		atomic_dec(&guc->num_guc_ids_not_ready);
+	if (atomic_fetch_add(-1, &ce->guc_num_rq_not_ready) == 1) {
+		GEM_BUG_ON(!atomic_read(&gse->num_guc_ids_not_ready));
+		atomic_dec(&gse->num_guc_ids_not_ready);
+	}
 }
 
-static bool need_tasklet(struct intel_guc *guc, struct intel_context *ce)
+static bool need_tasklet(struct guc_submit_engine *gse, struct intel_context *ce)
 {
-	struct i915_sched_engine * const sched_engine =
-		ce->engine->sched_engine;
+	struct i915_sched_engine * const sched_engine = &gse->sched_engine;
 
 	lockdep_assert_held(&sched_engine->lock);
 
-	return guc_ids_exhausted(guc) || submission_disabled(guc) ||
-		guc->stalled_rq || guc->stalled_context ||
-		!lrc_desc_registered(guc, ce->guc_id) ||
+	return guc_ids_exhausted(gse) || submission_disabled(gse->guc) ||
+		gse->stalled_rq || gse->stalled_context ||
+		!lrc_desc_registered(gse->guc, ce->guc_id) ||
 		!i915_sched_engine_is_empty(sched_engine);
 }
 
-static int guc_bypass_tasklet_submit(struct intel_guc *guc,
+static int gse_bypass_tasklet_submit(struct guc_submit_engine *gse,
 				     struct i915_request *rq)
 {
 	int ret;
@@ -1381,27 +1435,27 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 	trace_i915_request_in(rq, 0);
 
 	guc_set_lrc_tail(rq);
-	ret = guc_add_request(guc, rq);
+	ret = gse_add_request(gse, rq);
 
 	if (unlikely(ret == -EDEADLK))
-		disable_submission(guc);
+		disable_submission(gse->guc);
 
 	return ret;
 }
 
 static void guc_submit_request(struct i915_request *rq)
 {
+	struct guc_submit_engine *gse = ce_to_gse(rq->context);
 	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
-	struct intel_guc *guc = &rq->engine->gt->uc.guc;
 	unsigned long flags;
 
 	/* Will be called from irq-context when using foreign fences. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	if (need_tasklet(guc, rq->context))
+	if (need_tasklet(gse, rq->context))
 		queue_request(sched_engine, rq, rq_prio(rq));
-	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
-		kick_tasklet(guc);
+	else if (gse_bypass_tasklet_submit(gse, rq) == -EBUSY)
+		kick_tasklet(gse);
 
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 
@@ -1478,8 +1532,9 @@ static int steal_guc_id(struct intel_guc *guc, bool unpinned)
 		 * context.
 		 */
 		if (!unpinned) {
-			GEM_BUG_ON(guc->stalled_context);
-			guc->stalled_context = intel_context_get(ce);
+			GEM_BUG_ON(ce_to_gse(ce)->stalled_context);
+
+			ce_to_gse(ce)->stalled_context = intel_context_get(ce);
 			set_context_guc_id_stolen(ce);
 		} else {
 			set_context_guc_id_invalid(ce);
@@ -1539,7 +1594,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
 try_again:
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 
-	if (!tasklet && guc_ids_exhausted(guc)) {
+	if (!tasklet && guc_ids_exhausted(ce_to_gse(ce))) {
 		ret = -EAGAIN;
 		goto out_unlock;
 	}
@@ -1860,7 +1915,7 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	struct intel_guc *guc = ce_to_guc(ce);
 	unsigned long flags;
 
-	guc_flush_submissions(guc);
+	gse_flush_submissions(ce_to_gse(ce));
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	set_context_banned(ce);
@@ -1936,7 +1991,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	with_intel_runtime_pm(runtime_pm, wakeref)
-		__guc_context_sched_disable(guc, ce, guc_id);
+		__guc_context_sched_disable(ce_to_guc(ce), ce, guc_id);
 
 	return;
 unpin:
@@ -2077,7 +2132,7 @@ static void remove_from_context(struct i915_request *rq)
 	if (likely(!request_has_no_guc_id(rq)))
 		atomic_dec(&ce->guc_id_ref);
 	else
-		--ce_to_guc(rq->context)->total_num_rq_with_no_guc_id;
+		--ce_to_gse(rq->context)->total_num_rq_with_no_guc_id;
 	unpin_guc_id(ce_to_guc(ce), ce, false);
 
 	i915_request_notify_execute_cb_imm(rq);
@@ -2136,15 +2191,15 @@ static void invalidate_guc_id_sched_disable(struct intel_context *ce)
 	clr_context_guc_id_stolen(ce);
 }
 
-static void retire_worker_sched_disable(struct intel_guc *guc,
+static void retire_worker_sched_disable(struct guc_submit_engine *gse,
 					struct intel_context *ce)
 {
 	unsigned long flags;
 	bool disabled;
 
-	guc->stalled_context = NULL;
+	gse->stalled_context = NULL;
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	disabled = submission_disabled(guc);
+	disabled = submission_disabled(gse->guc);
 	if (!disabled && !context_pending_disable(ce) && context_enabled(ce)) {
 		/*
 		 * Still enabled, issue schedule disable + configure state so
@@ -2168,7 +2223,7 @@ static void retire_worker_sched_disable(struct intel_guc *guc,
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			__guc_context_sched_disable(guc, ce, guc_id);
+			__guc_context_sched_disable(gse->guc, ce, guc_id);
 
 		invalidate_guc_id_sched_disable(ce);
 	} else if (!disabled && context_pending_disable(ce)) {
@@ -2188,10 +2243,10 @@ static void retire_worker_sched_disable(struct intel_guc *guc,
 
 		invalidate_guc_id_sched_disable(ce);
 
-		guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
-		clr_tasklet_blocked(guc);
+		gse->submission_stall_reason = STALL_REGISTER_CONTEXT;
+		clr_tasklet_blocked(gse);
 
-		kick_tasklet(ce_to_guc(ce));
+		kick_tasklet(gse);
 	}
 
 	intel_context_put(ce);
@@ -2204,25 +2259,26 @@ static bool context_needs_lrc_desc_pin(struct intel_context *ce, bool new_guc_id
 		!submission_disabled(ce_to_guc(ce));
 }
 
-static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq)
+static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
+			      struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 	int ret = 0;
 
-	lockdep_assert_held(&guc->sched_engine->lock);
+	lockdep_assert_held(&gse->sched_engine.lock);
 	GEM_BUG_ON(!ce->guc_num_rq_submit_no_id);
 
 	if (atomic_add_unless(&ce->guc_id_ref, ce->guc_num_rq_submit_no_id, 0))
 		goto out;
 
-	ret = pin_guc_id(guc, ce, true);
+	ret = pin_guc_id(gse->guc, ce, true);
 	if (unlikely(ret < 0)) {
 		/*
 		 * No guc_ids available, disable the tasklet and kick the retire
 		 * workqueue hopefully freeing up some guc_ids.
 		 */
-		guc->stalled_rq = rq;
-		guc->submission_stall_reason = STALL_GUC_ID_WORKQUEUE;
+		gse->stalled_rq = rq;
+		gse->submission_stall_reason = STALL_GUC_ID_WORKQUEUE;
 		return ret;
 	}
 
@@ -2234,14 +2290,14 @@ static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq)
 		set_context_needs_register(ce);
 
 	if (ret == NEW_GUC_ID_ENABLED) {
-		guc->stalled_rq = rq;
-		guc->submission_stall_reason = STALL_SCHED_DISABLE;
+		gse->stalled_rq = rq;
+		gse->submission_stall_reason = STALL_SCHED_DISABLE;
 	}
 
 	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
 out:
-	guc->total_num_rq_with_no_guc_id -= ce->guc_num_rq_submit_no_id;
-	GEM_BUG_ON(guc->total_num_rq_with_no_guc_id < 0);
+	gse->total_num_rq_with_no_guc_id -= ce->guc_num_rq_submit_no_id;
+	GEM_BUG_ON(gse->total_num_rq_with_no_guc_id < 0);
 
 	list_for_each_entry_reverse(rq, &ce->guc_active.requests, sched.link)
 		if (request_has_no_guc_id(rq)) {
@@ -2259,7 +2315,7 @@ static int tasklet_pin_guc_id(struct intel_guc *guc, struct i915_request *rq)
 	 * from a context that has scheduling enabled. We have to disable
 	 * scheduling before deregistering the context and it isn't safe to do
 	 * in the tasklet because of lock inversion (ce->guc_state.lock must be
-	 * acquired before guc->sched_engine->lock). To work around this
+	 * acquired before gse->sched_engine.lock). To work around this
 	 * we do the schedule disable in retire workqueue and block the tasklet
 	 * until the schedule done G2H returns. Returning non-zero here kicks
 	 * the workqueue.
@@ -2271,6 +2327,7 @@ static int guc_request_alloc(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 	struct intel_guc *guc = ce_to_guc(ce);
+	struct guc_submit_engine *gse = ce_to_gse(ce);
 	unsigned long flags;
 	int ret;
 
@@ -2282,8 +2339,8 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * ready to submit). Don't allocate one here, defer to submission in the
 	 * tasklet.
 	 */
-	if (test_and_update_guc_ids_exhausted(guc) ||
-	    too_many_guc_ids_not_ready(guc, ce)) {
+	if (test_and_update_guc_ids_exhausted(gse) ||
+	    too_many_guc_ids_not_ready(gse, ce)) {
 		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
 		goto out;
 	}
@@ -2338,7 +2395,7 @@ static int guc_request_alloc(struct i915_request *rq)
 		 * submissions we return to allocating guc_ids in this function.
 		 */
 		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
-		set_and_update_guc_ids_exhausted(guc);
+		set_and_update_guc_ids_exhausted(gse);
 		incr_num_rq_not_ready(ce);
 
 		return 0;
@@ -2729,10 +2786,37 @@ static inline void guc_default_irqs(struct intel_engine_cs *engine)
 	intel_engine_set_irq_handler(engine, cs_irq_handler);
 }
 
+static void guc_sched_engine_destroy(struct kref *kref)
+{
+	struct i915_sched_engine *sched_engine =
+		container_of(kref, typeof(*sched_engine), ref);
+	struct guc_submit_engine *gse =
+		container_of(sched_engine, typeof(*gse), sched_engine);
+
+	i915_sched_engine_kill(sched_engine); /* flush the callback */
+	kfree(gse);
+}
+
+static void guc_submit_engine_init(struct intel_guc *guc,
+				   struct guc_submit_engine *gse,
+				   int id)
+{
+	i915_sched_engine_init(&gse->sched_engine, ENGINE_VIRTUAL);
+	INIT_WORK(&gse->retire_worker, retire_worker_func);
+	tasklet_setup(&gse->sched_engine.tasklet, gse_submission_tasklet);
+	gse->sched_engine.schedule = i915_schedule;
+	gse->sched_engine.disabled = guc_sched_engine_disabled;
+	gse->sched_engine.destroy = guc_sched_engine_destroy;
+	gse->guc = guc;
+	gse->id = id;
+}
+
 int intel_guc_submission_setup(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
 	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct i915_sched_engine *sched_engine;
+	int ret, i;
 
 	/*
 	 * The setup relies on several assumptions (e.g. irqs always enabled)
@@ -2740,19 +2824,20 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	 */
 	GEM_BUG_ON(INTEL_GEN(i915) < 11);
 
-	if (!guc->sched_engine) {
-		guc->sched_engine = i915_sched_engine_create(ENGINE_VIRTUAL);
-		if (!guc->sched_engine)
-			return -ENOMEM;
-
-		guc->sched_engine->schedule = i915_schedule;
-		guc->sched_engine->disabled = guc_sched_engine_disabled;
-		guc->sched_engine->engine = engine;
-		tasklet_setup(&guc->sched_engine->tasklet,
-			      guc_submission_tasklet);
+	if (!guc->gse[0]) {
+		for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+			guc->gse[i] = kzalloc(sizeof(*guc->gse[i]), GFP_KERNEL);
+			if (!guc->gse[i]) {
+				ret = -ENOMEM;
+				goto put_sched_engine;
+			}
+			guc_submit_engine_init(guc, guc->gse[i], i);
+		}
 	}
+
+	sched_engine = guc_to_sched_engine(guc, GUC_SUBMIT_ENGINE_SINGLE_LRC);
 	i915_sched_engine_put(engine->sched_engine);
-	engine->sched_engine = i915_sched_engine_get(guc->sched_engine);
+	engine->sched_engine = i915_sched_engine_get(sched_engine);
 
 	guc_default_vfuncs(engine);
 	guc_default_irqs(engine);
@@ -2768,6 +2853,16 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	engine->release = guc_release;
 
 	return 0;
+
+put_sched_engine:
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i) {
+		struct i915_sched_engine *sched_engine =
+			guc_to_sched_engine(guc, i);
+
+		if (sched_engine)
+			i915_sched_engine_put(sched_engine);
+	}
+	return ret;
 }
 
 void intel_guc_submission_enable(struct intel_guc *guc)
@@ -2863,14 +2958,16 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 			register_context(ce, true);
 		guc_signal_context_fence(ce);
 		if (context_block_tasklet(ce)) {
-			GEM_BUG_ON(guc->submission_stall_reason !=
+			struct guc_submit_engine *gse = ce_to_gse(ce);
+
+			GEM_BUG_ON(gse->submission_stall_reason !=
 				   STALL_DEREGISTER_CONTEXT);
 
 			clr_context_block_tasklet(ce);
-			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
-			clr_tasklet_blocked(guc);
+			gse->submission_stall_reason = STALL_MOVE_LRC_TAIL;
+			clr_tasklet_blocked(gse);
 
-			kick_tasklet(ce_to_guc(ce));
+			kick_tasklet(gse);
 		}
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
@@ -2935,11 +3032,13 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 		if (context_block_tasklet(ce)) {
+			struct guc_submit_engine *gse = ce_to_gse(ce);
+
 			clr_context_block_tasklet(ce);
-			guc->submission_stall_reason = STALL_REGISTER_CONTEXT;
-			clr_tasklet_blocked(guc);
+			gse->submission_stall_reason = STALL_REGISTER_CONTEXT;
+			clr_tasklet_blocked(gse);
 
-			kick_tasklet(ce_to_guc(ce));
+			kick_tasklet(gse);
 		}
 
 		if (banned) {
@@ -2971,7 +3070,7 @@ static void capture_error_state(struct intel_guc *guc,
 static void guc_context_replay(struct intel_context *ce)
 {
 	__guc_reset_context(ce, true);
-	kick_tasklet(ce_to_guc(ce));
+	kick_tasklet(ce_to_gse(ce));
 }
 
 static void guc_handle_context_reset(struct intel_guc *guc,
@@ -3115,32 +3214,29 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 	}
 }
 
-void intel_guc_log_submission_info(struct intel_guc *guc,
-				   struct drm_printer *p)
+static void gse_log_submission_info(struct guc_submit_engine *gse,
+				    struct drm_printer *p, int id)
 {
-	struct i915_sched_engine *sched_engine = guc->sched_engine;
+	struct i915_sched_engine *sched_engine = &gse->sched_engine;
 	struct rb_node *rb;
 	unsigned long flags;
 
-	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
-		   atomic_read(&guc->outstanding_submission_g2h));
-	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
-	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
-	drm_printf(p, "GuC tasklet count: %u\n",
+	drm_printf(p, "GSE[%d] tasklet count: %u\n", id,
 		   atomic_read(&sched_engine->tasklet.count));
-	drm_printf(p, "GuC submit flags: 0x%04lx\n", guc->flags);
-	drm_printf(p, "GuC total number request without guc_id: %d\n",
-		   guc->total_num_rq_with_no_guc_id);
-	drm_printf(p, "GuC Number GuC IDs not ready: %d\n",
-		   atomic_read(&guc->num_guc_ids_not_ready));
-	drm_printf(p, "GuC stall reason: %d\n", guc->submission_stall_reason);
-	drm_printf(p, "GuC stalled request: %s\n",
-		   yesno(guc->stalled_rq));
-	drm_printf(p, "GuC stalled context: %s\n\n",
-		   yesno(guc->stalled_context));
+	drm_printf(p, "GSE[%d] submit flags: 0x%04lx\n", id, gse->flags);
+	drm_printf(p, "GSE[%d] total number request without guc_id: %d\n",
+		   id, gse->total_num_rq_with_no_guc_id);
+	drm_printf(p, "GSE[%d] Number GuC IDs not ready: %d\n",
+		   id, atomic_read(&gse->num_guc_ids_not_ready));
+	drm_printf(p, "GSE[%d] stall reason: %d\n",
+		   id, gse->submission_stall_reason);
+	drm_printf(p, "GSE[%d] stalled request: %s\n",
+		   id, yesno(gse->stalled_rq));
+	drm_printf(p, "GSE[%d] stalled context: %s\n\n",
+		   id, yesno(gse->stalled_context));
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
-	drm_printf(p, "Requests in GuC submit tasklet:\n");
+	drm_printf(p, "Requests in GSE[%d] submit tasklet:\n", id);
 	for (rb = rb_first_cached(&sched_engine->queue); rb; rb = rb_next(rb)) {
 		struct i915_priolist *pl = to_priolist(rb);
 		struct i915_request *rq;
@@ -3154,6 +3250,20 @@ void intel_guc_log_submission_info(struct intel_guc *guc,
 	drm_printf(p, "\n");
 }
 
+void intel_guc_log_submission_info(struct intel_guc *guc,
+				   struct drm_printer *p)
+{
+	int i;
+
+	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
+		   atomic_read(&guc->outstanding_submission_g2h));
+	drm_printf(p, "GuC Number GuC IDs: %d\n", guc->num_guc_ids);
+	drm_printf(p, "GuC Max Number GuC IDs: %d\n\n", guc->max_guc_ids);
+
+	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
+		gse_log_submission_info(guc->gse[i], p, i);
+}
+
 void intel_guc_log_context_info(struct intel_guc *guc,
 				struct drm_printer *p)
 {
@@ -3185,6 +3295,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 {
 	struct guc_virtual_engine *ve;
 	struct intel_guc *guc;
+	struct i915_sched_engine *sched_engine;
 	unsigned int n;
 	int err;
 
@@ -3193,6 +3304,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 		return ERR_PTR(-ENOMEM);
 
 	guc = &siblings[0]->gt->uc.guc;
+	sched_engine = guc_to_sched_engine(guc, GUC_SUBMIT_ENGINE_SINGLE_LRC);
 
 	ve->base.i915 = siblings[0]->i915;
 	ve->base.gt = siblings[0]->gt;
@@ -3206,7 +3318,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 
 	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
 
-	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
+	ve->base.sched_engine = i915_sched_engine_get(sched_engine);
 
 	ve->base.cops = &virtual_guc_context_ops;
 	ve->base.request_alloc = guc_request_alloc;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
new file mode 100644
index 000000000000..e45c2f00f09c
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2014-2019 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_SUBMISSION_TYPES_H_
+#define _INTEL_GUC_SUBMISSION_TYPES_H_
+
+#include "gt/intel_engine_types.h"
+#include "gt/intel_context_types.h"
+#include "i915_scheduler_types.h"
+
+struct intel_guc;
+struct i915_request;
+
+/* GuC Virtual Engine */
+struct guc_virtual_engine {
+	struct intel_engine_cs base;
+	struct intel_context context;
+};
+
+/*
+ * Object which encapsulates the globally operated on i915_sched_engine +
+ * the GuC submission state machine described in intel_guc_submission.c.
+ */
+struct guc_submit_engine {
+	struct i915_sched_engine sched_engine;
+	struct work_struct retire_worker;
+	struct intel_guc *guc;
+	struct i915_request *stalled_rq;
+	struct intel_context *stalled_context;
+	unsigned long flags;
+	int total_num_rq_with_no_guc_id;
+	atomic_t num_guc_ids_not_ready;
+	int id;
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
+};
+
+#endif
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 72a9bee3026f..51644de0e9ca 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -431,7 +431,7 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 	rcu_read_unlock();
 }
 
-void i915_sched_engine_free(struct kref *kref)
+static void default_destroy(struct kref *kref)
 {
 	struct i915_sched_engine *sched_engine =
 		container_of(kref, typeof(*sched_engine), ref);
@@ -445,20 +445,15 @@ static bool default_disabled(struct i915_sched_engine *sched_engine)
 	return false;
 }
 
-struct i915_sched_engine *
-i915_sched_engine_create(unsigned int subclass)
+void i915_sched_engine_init(struct i915_sched_engine *sched_engine,
+			    unsigned int subclass)
 {
-	struct i915_sched_engine *sched_engine;
-
-	sched_engine = kzalloc(sizeof(*sched_engine), GFP_KERNEL);
-	if (!sched_engine)
-		return NULL;
-
 	kref_init(&sched_engine->ref);
 
 	sched_engine->queue = RB_ROOT_CACHED;
 	sched_engine->queue_priority_hint = INT_MIN;
 	sched_engine->disabled = default_disabled;
+	sched_engine->destroy = default_destroy;
 
 	INIT_LIST_HEAD(&sched_engine->requests);
 	INIT_LIST_HEAD(&sched_engine->hold);
@@ -477,7 +472,19 @@ i915_sched_engine_create(unsigned int subclass)
 	lock_map_release(&sched_engine->lock.dep_map);
 	local_irq_enable();
 #endif
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
 
+	i915_sched_engine_init(sched_engine, subclass);
+ 
 	return sched_engine;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index ec8dfa87cbb6..92627f72182a 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -53,6 +53,9 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 				     const char *prefix,
 				     int indent);
 
+void i915_sched_engine_init(struct i915_sched_engine *sched_engine,
+			    unsigned int subclass);
+
 struct i915_sched_engine *
 i915_sched_engine_create(unsigned int subclass);
 
@@ -68,7 +71,7 @@ i915_sched_engine_get(struct i915_sched_engine *sched_engine)
 static inline void
 i915_sched_engine_put(struct i915_sched_engine *sched_engine)
 {
-	kref_put(&sched_engine->ref, i915_sched_engine_free);
+	kref_put(&sched_engine->ref, sched_engine->destroy);
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index a7183792d110..a0b755a27140 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -141,6 +141,9 @@ struct i915_sched_engine {
 	/* Back pointer to engine */
 	struct intel_engine_cs *engine;
 
+	/* Destroy schedule engine */
+	void	(*destroy)(struct kref *kref);
+
 	/* Schedule engine is disabled by backend */
 	bool	(*disabled)(struct i915_sched_engine *sched_engine);
 
-- 
2.28.0

