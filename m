Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1242CC43
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE86EB7E;
	Wed, 13 Oct 2021 20:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DD96EB6C;
 Wed, 13 Oct 2021 20:55:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214690390"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214690390"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524782748"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 14/25] drm/i915/guc: Implement multi-lrc reset
Date: Wed, 13 Oct 2021 13:42:20 -0700
Message-Id: <20211013204231.19287-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013204231.19287-1-matthew.brost@intel.com>
References: <20211013204231.19287-1-matthew.brost@intel.com>
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
its children. The parent context owns the reset replaying / canceling
requests as needed.

v2:
 (John Harrison)
  - Simply loop in find active request
  - Add comments to find ative request / reset loop
v3:
 (John Harrison)
  - s/its'/its/g
  - Fix comment when searching for active request
  - Reorder if state in __guc_reset_context

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 15 +++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++++++-----
 2 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 79f321c6c008..6aab60584ee5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -529,20 +529,29 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 
 struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 {
+	struct intel_context *parent = intel_context_to_parent(ce);
 	struct i915_request *rq, *active = NULL;
 	unsigned long flags;
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
 
-	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
+	/*
+	 * We search the parent list to find an active request on the submitted
+	 * context. The parent list contains the requests for all the contexts
+	 * in the relationship so we have to do a compare of each request's
+	 * context.
+	 */
+	spin_lock_irqsave(&parent->guc_state.lock, flags);
+	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
 				    sched.link) {
+		if (rq->context != ce)
+			continue;
 		if (i915_request_completed(rq))
 			break;
 
 		active = rq;
 	}
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f690b7c2b295..bc052d206861 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -683,6 +683,11 @@ static inline int rq_prio(const struct i915_request *rq)
 	return rq->sched.attr.priority;
 }
 
+static inline bool is_multi_lrc(struct intel_context *ce)
+{
+	return intel_context_is_parallel(ce);
+}
+
 static bool is_multi_lrc_rq(struct i915_request *rq)
 {
 	return intel_context_is_parallel(rq->context);
@@ -1218,10 +1223,15 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
+	bool local_stalled;
 	struct i915_request *rq;
 	unsigned long flags;
 	u32 head;
+	int i, number_children = ce->parallel.number_children;
 	bool skip = false;
+	struct intel_context *parent = ce;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	intel_context_get(ce);
 
@@ -1247,25 +1257,38 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	if (unlikely(skip))
 		goto out_put;
 
-	rq = intel_context_find_active_request(ce);
-	if (!rq) {
-		head = ce->ring->tail;
-		stalled = false;
-		goto out_replay;
-	}
+	/*
+	 * For each context in the relationship find the hanging request
+	 * resetting each context / request as needed
+	 */
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
+		if (i915_request_started(rq))
+			local_stalled = true;
 
-	GEM_BUG_ON(i915_active_is_idle(&ce->active));
-	head = intel_ring_wrap(ce->ring, rq->head);
-	__i915_request_reset(rq, stalled);
+		GEM_BUG_ON(i915_active_is_idle(&ce->active));
+		head = intel_ring_wrap(ce->ring, rq->head);
 
+		__i915_request_reset(rq, local_stalled && stalled);
 out_replay:
-	guc_reset_state(ce, head, stalled);
-	__unwind_incomplete_requests(ce);
+		guc_reset_state(ce, head, local_stalled && stalled);
+next_context:
+		if (i != number_children)
+			ce = list_next_entry(ce, parallel.child_link);
+	}
+
+	__unwind_incomplete_requests(parent);
 out_put:
-	intel_context_put(ce);
+	intel_context_put(parent);
 }
 
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
@@ -1286,7 +1309,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 
 		xa_unlock(&guc->context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			__guc_reset_context(ce, stalled);
 
 		intel_context_put(ce);
@@ -1378,7 +1402,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 
 		xa_unlock(&guc->context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			guc_cancel_context_requests(ce);
 
 		intel_context_put(ce);
@@ -2071,6 +2096,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	u16 guc_id;
 	bool enabled;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	incr_context_blocked(ce);
@@ -2125,6 +2152,7 @@ static void guc_context_unblock(struct intel_context *ce)
 	bool enable;
 
 	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
@@ -2151,11 +2179,14 @@ static void guc_context_unblock(struct intel_context *ce)
 static void guc_context_cancel_request(struct intel_context *ce,
 				       struct i915_request *rq)
 {
+	struct intel_context *block_context =
+		request_to_scheduling_context(rq);
+
 	if (i915_sw_fence_signaled(&rq->submit)) {
 		struct i915_sw_fence *fence;
 
 		intel_context_get(ce);
-		fence = guc_context_block(ce);
+		fence = guc_context_block(block_context);
 		i915_sw_fence_wait(fence);
 		if (!i915_request_completed(rq)) {
 			__i915_request_skip(rq);
@@ -2169,7 +2200,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
 		 */
 		flush_work(&ce_to_guc(ce)->ct.requests.worker);
 
-		guc_context_unblock(ce);
+		guc_context_unblock(block_context);
 		intel_context_put(ce);
 	}
 }
@@ -2195,6 +2226,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	intel_wakeref_t wakeref;
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	guc_flush_submissions(guc);
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-- 
2.32.0

