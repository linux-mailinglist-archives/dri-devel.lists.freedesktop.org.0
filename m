Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D373DF76B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090226E8F3;
	Tue,  3 Aug 2021 22:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420726E8E7;
 Tue,  3 Aug 2021 22:11:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745915"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745915"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512722"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/46] drm/i915/guc: Implement multi-lrc reset
Date: Tue,  3 Aug 2021 15:29:21 -0700
Message-Id: <20210803222943.27686-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Update context and full GPU reset to work with multi-lrc. The idea is
parent context tracks all the active requests inflight for itself and
its' children. The parent context owns the reset replaying / canceling
requests as needed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 12 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
 2 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 98ef2d0f7a39..c327fd1c24c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -595,20 +595,22 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 
 struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 {
+	struct intel_context *parent = intel_context_is_child(ce) ?
+		ce->parent : ce;
 	struct i915_request *rq, *active = NULL;
 	unsigned long flags;
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
 
-	spin_lock_irqsave(&ce->guc_active.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
+	spin_lock_irqsave(&parent->guc_active.lock, flags);
+	list_for_each_entry_reverse(rq, &parent->guc_active.requests,
 				    sched.link) {
-		if (i915_request_completed(rq))
+		if (i915_request_completed(rq) && rq->context == ce)
 			break;
 
-		active = rq;
+		active = (rq->context == ce) ? rq : active;
 	}
-	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+	spin_unlock_irqrestore(&parent->guc_active.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1cb382f7d79d..30df1c8db491 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -818,6 +818,11 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
+static inline bool is_multi_lrc(struct intel_context *ce)
+{
+	return intel_context_is_parallel(ce);
+}
+
 static inline bool is_multi_lrc_rq(struct i915_request *rq)
 {
 	return intel_context_is_parallel(rq->context);
@@ -1381,6 +1386,8 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		ce->engine->sched_engine;
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	spin_lock(&ce->guc_active.lock);
 	list_for_each_entry_safe(rq, rn,
@@ -1413,8 +1420,12 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
+	bool local_stalled;
 	struct i915_request *rq;
 	u32 head;
+	int i, number_children = ce->guc_number_children;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	intel_context_get(ce);
 
@@ -1426,22 +1437,32 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	 */
 	clr_context_enabled(ce);
 
-	rq = intel_context_find_active_request(ce);
-	if (!rq) {
-		head = ce->ring->tail;
-		stalled = false;
-		goto out_replay;
-	}
+	for (i = 0; i < number_children + 1; ++i) {
+		if (!intel_context_is_pinned(ce))
+			goto next_context;
+
+		local_stalled = false;
+		rq = intel_context_find_active_request(ce);
+		if (!rq) {
+			head = ce->ring->tail;
+			goto out_replay;
+		}
 
-	if (!i915_request_started(rq))
-		stalled = false;
+		GEM_BUG_ON(i915_active_is_idle(&ce->active));
+		head = intel_ring_wrap(ce->ring, rq->head);
 
-	GEM_BUG_ON(i915_active_is_idle(&ce->active));
-	head = intel_ring_wrap(ce->ring, rq->head);
-	__i915_request_reset(rq, stalled);
+		if (i915_request_started(rq))
+			local_stalled = true;
 
+		__i915_request_reset(rq, local_stalled && stalled);
 out_replay:
-	guc_reset_state(ce, head, stalled);
+		guc_reset_state(ce, head, local_stalled && stalled);
+next_context:
+		if (i != number_children)
+			ce = list_next_entry(ce, guc_child_link);
+	}
+	ce = intel_context_to_parent(ce);
+
 	__unwind_incomplete_requests(ce);
 	ce->guc_num_rq_submit_no_id = 0;
 	intel_context_put(ce);
@@ -1458,9 +1479,11 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 	}
 
 	xa_for_each(&guc->context_lookup, index, ce)
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			__guc_reset_context(ce, stalled);
 
+	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
 }
 
@@ -1513,7 +1536,8 @@ gse_cancel_requests(struct guc_submit_engine *gse)
 		struct i915_priolist *p = to_priolist(rb);
 
 		priolist_for_each_request_consume(rq, rn, p) {
-			struct intel_context *ce = rq->context;
+			struct intel_context *ce =
+				request_to_scheduling_context(rq);
 
 			list_del_init(&rq->sched.link);
 
@@ -1543,7 +1567,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 	int i;
 
 	xa_for_each(&guc->context_lookup, index, ce)
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			guc_cancel_context_requests(ce);
 
 	for (i = 0; i < GUC_SUBMIT_ENGINE_MAX; ++i)
@@ -2823,6 +2848,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	intel_wakeref_t wakeref;
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	gse_flush_submissions(ce_to_gse(ce));
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-- 
2.28.0

