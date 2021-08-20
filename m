Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DF3F36F3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1238B6EB73;
	Fri, 20 Aug 2021 22:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4EC6EB3D;
 Fri, 20 Aug 2021 22:50:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580048"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580048"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098612"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 17/27] drm/i915/guc: Implement multi-lrc reset
Date: Fri, 20 Aug 2021 15:44:36 -0700
Message-Id: <20210820224446.30620-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_context.c       | 11 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 63 +++++++++++++------
 2 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 00d1aee6d199..5615be32879c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -528,20 +528,21 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 
 struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 {
+	struct intel_context *parent = intel_context_to_parent(ce);
 	struct i915_request *rq, *active = NULL;
 	unsigned long flags;
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
 
-	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
+	spin_lock_irqsave(&parent->guc_state.lock, flags);
+	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
 				    sched.link) {
-		if (i915_request_completed(rq))
+		if (i915_request_completed(rq) && rq->context == ce)
 			break;
 
-		active = rq;
+		active = (rq->context == ce) ? rq : active;
 	}
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f0b60fecf253..e34e0ea9136a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -670,6 +670,11 @@ static int rq_prio(const struct i915_request *rq)
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
@@ -1179,10 +1184,13 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
+	bool local_stalled;
 	struct i915_request *rq;
 	unsigned long flags;
 	u32 head;
+	int i, number_children = ce->guc_number_children;
 	bool skip = false;
+	struct intel_context *parent = ce;
 
 	intel_context_get(ce);
 
@@ -1209,25 +1217,34 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	if (unlikely(skip))
 		goto out_put;
 
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
-	__unwind_incomplete_requests(ce);
+		guc_reset_state(ce, head, local_stalled && stalled);
+next_context:
+		if (i != number_children)
+			ce = list_next_entry(ce, guc_child_link);
+	}
+
+	__unwind_incomplete_requests(parent);
 out_put:
-	intel_context_put(ce);
+	intel_context_put(parent);
 }
 
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
@@ -1248,7 +1265,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 
 		xa_unlock(&guc->context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			__guc_reset_context(ce, stalled);
 
 		intel_context_put(ce);
@@ -1340,7 +1358,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 
 		xa_unlock(&guc->context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &&
+		    !intel_context_is_child(ce))
 			guc_cancel_context_requests(ce);
 
 		intel_context_put(ce);
@@ -2031,6 +2050,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	u16 guc_id;
 	bool enabled;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	incr_context_blocked(ce);
@@ -2068,6 +2089,7 @@ static void guc_context_unblock(struct intel_context *ce)
 	bool enable;
 
 	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
@@ -2099,11 +2121,14 @@ static void guc_context_unblock(struct intel_context *ce)
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
@@ -2117,7 +2142,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
 		 */
 		flush_work(&ce_to_guc(ce)->ct.requests.worker);
 
-		guc_context_unblock(ce);
+		guc_context_unblock(block_context);
 		intel_context_put(ce);
 	}
 }
@@ -2143,6 +2168,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	intel_wakeref_t wakeref;
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	guc_flush_submissions(guc);
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-- 
2.32.0

