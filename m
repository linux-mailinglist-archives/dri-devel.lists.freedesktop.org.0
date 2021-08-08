Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0D3E3C0D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 19:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EBB89A9A;
	Sun,  8 Aug 2021 17:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05B689A6D;
 Sun,  8 Aug 2021 17:50:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="275624399"
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="275624399"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 10:50:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="482935737"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 10:50:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915/guc: Fix several issues related to resets /
 request cancelation
Date: Sun,  8 Aug 2021 11:07:55 -0700
Message-Id: <20210808180757.81440-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210808180757.81440-1-matthew.brost@intel.com>
References: <20210808180757.81440-1-matthew.brost@intel.com>
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

Resets are notoriously hard to get fully working and notoriously racey,
especially with selftests / IGTs that do all sorts of wild things that
would be near impossible to hit during normal use cases. Even though
likely impossible to hit, anything selftests / IGTs uncover needs to be
fixed. This patch addresses 7 such issues.

1. A small race that could result in incorrect accounting of the number
of outstanding G2H. Basically prior to this patch we did not increment
the number of outstanding G2H if we encoutered a GT reset while sending
a H2G. This was incorrect as the context state had already been updated
to anticipate a G2H response thus the counter should be incremented.

2. When unwinding requests on a reset context, if other requests in the
context are in the priority list the requests could be resubmitted out
of seqno order. Traverse the list of active requests in reserve and
append to the head of the priority list to fix this.

3. Don't drop ce->guc_active.lock when unwinding a context after reset.
At one point we had to drop this because of a lock inversion but that is
no longer the case. It is much safer to hold the lock so let's do that.

4. Prior to this patch the blocked context counter was cleared on
init_sched_state (used during registering a context & resets) which is
incorrect. This state needs to be persistent or the counter can read the
incorrect value.

5. Flush the work queue for GuC generated G2H messages during a GT reset.

6. Do not clear enable during a context reset if a schedule enable is in
flight.

7. When unblocking a context, do not enable scheduling if the context is
banned.

Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 87d8dc8f51b9..cd8df078ca87 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -152,7 +152,7 @@ static inline void init_sched_state(struct intel_context *ce)
 {
 	/* Only should be called from guc_lrc_desc_pin() */
 	atomic_set(&ce->guc_sched_state_no_lock, 0);
-	ce->guc_state.sched_state = 0;
+	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
 }
 
 static inline bool
@@ -360,11 +360,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 {
 	int err;
 
-	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
-
-	if (!err && g2h_len_dw)
+	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
+	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	if (err == -EBUSY && g2h_len_dw)
+		atomic_dec(&guc->outstanding_submission_g2h);
+
 	return err;
 }
 
@@ -725,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 			wait_for_reset(guc, &guc->outstanding_submission_g2h);
 		} while (!list_empty(&guc->ct.requests.incoming));
 	}
+
+	/* Flush any GuC generated G2H */
+	while (!list_empty(&guc->ct.requests.incoming))
+		msleep(1);
+
 	scrub_guc_desc_for_outstanding_g2h(guc);
 }
 
@@ -797,14 +804,13 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	spin_lock(&ce->guc_active.lock);
-	list_for_each_entry_safe(rq, rn,
-				 &ce->guc_active.requests,
-				 sched.link) {
+	list_for_each_entry_safe_reverse(rq, rn,
+					 &ce->guc_active.requests,
+					 sched.link) {
 		if (i915_request_completed(rq))
 			continue;
 
 		list_del_init(&rq->sched.link);
-		spin_unlock(&ce->guc_active.lock);
 
 		__i915_request_unsubmit(rq);
 
@@ -816,10 +822,8 @@ __unwind_incomplete_requests(struct intel_context *ce)
 		}
 		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
 
-		list_add_tail(&rq->sched.link, pl);
+		list_add(&rq->sched.link, pl);
 		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
-
-		spin_lock(&ce->guc_active.lock);
 	}
 	spin_unlock(&ce->guc_active.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
@@ -828,17 +832,23 @@ __unwind_incomplete_requests(struct intel_context *ce)
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
 	struct i915_request *rq;
+	unsigned long flags;
 	u32 head;
 
 	intel_context_get(ce);
 
 	/*
-	 * GuC will implicitly mark the context as non-schedulable
-	 * when it sends the reset notification. Make sure our state
-	 * reflects this change. The context will be marked enabled
-	 * on resubmission.
+	 * GuC will implicitly mark the context as non-schedulable when it sends
+	 * the reset notification. Make sure our state reflects this change. The
+	 * context will be marked enabled on resubmission. A small window exists
+	 * where the context could be block & unblocked (scheduling enable) while
+	 * this reset was inflight. If a scheduling enable is already is in
+	 * flight do not clear the enable.
 	 */
-	clr_context_enabled(ce);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (!context_pending_enable(ce))
+		clr_context_enabled(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	rq = intel_context_find_active_request(ce);
 	if (!rq) {
@@ -1562,6 +1572,7 @@ static void guc_context_unblock(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	if (unlikely(submission_disabled(guc) ||
+		     intel_context_is_banned(ce) ||
 		     !intel_context_is_pinned(ce) ||
 		     context_pending_disable(ce) ||
 		     context_blocked(ce) > 1)) {
-- 
2.28.0

