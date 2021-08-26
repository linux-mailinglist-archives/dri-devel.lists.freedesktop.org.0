Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA63F8119
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074176E4F4;
	Thu, 26 Aug 2021 03:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8C6E4EA;
 Thu, 26 Aug 2021 03:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811080"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811080"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738583"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 22/27] drm/i915/guc: Drop pin count check trick between
 sched_disable and re-pin
Date: Wed, 25 Aug 2021 20:23:22 -0700
Message-Id: <20210826032327.18078-23-matthew.brost@intel.com>
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

Drop pin count check trick between a sched_disable and re-pin, now rely
on the lock and counter of the number of committed requests to determine
if scheduling should be disabled on the context.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 53 +++++++++++--------
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index d2f798ef678c..3a5d98e908f4 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -169,6 +169,8 @@ struct intel_context {
 		struct list_head fences;
 		/* GuC context blocked fence */
 		struct i915_sw_fence blocked;
+		/* GuC committed requests */
+		int number_committed_requests;
 	} guc_state;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2c6a6453d332..14a512533c39 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -249,6 +249,25 @@ static inline void decr_context_blocked(struct intel_context *ce)
 	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
 }
 
+static inline bool context_has_committed_requests(struct intel_context *ce)
+{
+	return !!ce->guc_state.number_committed_requests;
+}
+
+static inline void incr_context_committed_requests(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	++ce->guc_state.number_committed_requests;
+	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
+}
+
+static inline void decr_context_committed_requests(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	--ce->guc_state.number_committed_requests;
+	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
+}
+
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return ce->guc_id == GUC_INVALID_LRC_ID;
@@ -1749,24 +1768,18 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	/*
-	 * We have to check if the context has been disabled by another thread.
-	 * We also have to check if the context has been pinned again as another
-	 * pin operation is allowed to pass this function. Checking the pin
-	 * count, within ce->guc_state.lock, synchronizes this function with
-	 * guc_request_alloc ensuring a request doesn't slip through the
-	 * 'context_pending_disable' fence. Checking within the spin lock (can't
-	 * sleep) ensures another process doesn't pin this context and generate
-	 * a request before we set the 'context_pending_disable' flag here.
+	 * We have to check if the context has been disabled by another thread,
+	 * check if submssion has been disabled to seal a race with reset and
+	 * finally check if any more requests have been committed to the
+	 * context ensursing that a request doesn't slip through the
+	 * 'context_pending_disable' fence.
 	 */
-	if (unlikely(!context_enabled(ce) || submission_disabled(guc))) {
+	if (unlikely(!context_enabled(ce) || submission_disabled(guc) ||
+		     context_has_committed_requests(ce))) {
 		clr_context_enabled(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		goto unpin;
 	}
-	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		return;
-	}
 	guc_id = prep_context_pending_disable(ce);
 
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
@@ -1796,6 +1809,7 @@ static void __guc_context_destroy(struct intel_context *ce)
 		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
 		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
 		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+	GEM_BUG_ON(ce->guc_state.number_committed_requests);
 
 	lrc_fini(ce);
 	intel_context_fini(ce);
@@ -2026,6 +2040,10 @@ static void remove_from_context(struct i915_request *rq)
 
 	spin_unlock_irq(&ce->guc_active.lock);
 
+	spin_lock_irq(&ce->guc_state.lock);
+	decr_context_committed_requests(ce);
+	spin_unlock_irq(&ce->guc_state.lock);
+
 	atomic_dec(&ce->guc_id_ref);
 	i915_request_notify_execute_cb_imm(rq);
 }
@@ -2176,15 +2194,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * schedule enable or context registration if either G2H is pending
 	 * respectfully. Once a G2H returns, the fence is released that is
 	 * blocking these requests (see guc_signal_context_fence).
-	 *
-	 * We can safely check the below fields outside of the lock as it isn't
-	 * possible for these fields to transition from being clear to set but
-	 * converse is possible, hence the need for the check within the lock.
 	 */
-	if (likely(!context_wait_for_deregister_to_register(ce) &&
-		   !context_pending_disable(ce)))
-		return 0;
-
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	if (context_wait_for_deregister_to_register(ce) ||
 	    context_pending_disable(ce)) {
@@ -2193,6 +2203,7 @@ static int guc_request_alloc(struct i915_request *rq)
 
 		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
 	}
+	incr_context_committed_requests(ce);
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	return 0;
-- 
2.32.0

