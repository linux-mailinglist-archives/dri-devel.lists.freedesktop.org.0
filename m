Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663413CBD37
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36D6EA0D;
	Fri, 16 Jul 2021 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A0F6E9DE;
 Fri, 16 Jul 2021 19:59:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596715"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596715"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238899"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/51] drm/i915/guc: Extend deregistration fence to schedule
 disable
Date: Fri, 16 Jul 2021 13:16:43 -0700
Message-Id: <20210716201724.54804-11-matthew.brost@intel.com>
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

Extend the deregistration context fence to fence whne a GuC context has
scheduling disable pending.

v2:
 (John H)
  - Update comment why we check the pin count within spin lock

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <john.c.harrison@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 5519c988a6ca..9dc1a256e185 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -922,7 +922,22 @@ static void guc_context_sched_disable(struct intel_context *ce)
 		goto unpin;
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
+
+	/*
+	 * We have to check if the context has been pinned again as another pin
+	 * operation is allowed to pass this function. Checking the pin count,
+	 * within ce->guc_state.lock, synchronizes this function with
+	 * guc_request_alloc ensuring a request doesn't slip through the
+	 * 'context_pending_disable' fence. Checking within the spin lock (can't
+	 * sleep) ensures another process doesn't pin this context and generate
+	 * a request before we set the 'context_pending_disable' flag here.
+	 */
+	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return;
+	}
 	guc_id = prep_context_pending_disable(ce);
+
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	with_intel_runtime_pm(runtime_pm, wakeref)
@@ -1127,19 +1142,22 @@ static int guc_request_alloc(struct i915_request *rq)
 out:
 	/*
 	 * We block all requests on this context if a G2H is pending for a
-	 * context deregistration as the GuC will fail a context registration
-	 * while this G2H is pending. Once a G2H returns, the fence is released
-	 * that is blocking these requests (see guc_signal_context_fence).
+	 * schedule disable or context deregistration as the GuC will fail a
+	 * schedule enable or context registration if either G2H is pending
+	 * respectfully. Once a G2H returns, the fence is released that is
+	 * blocking these requests (see guc_signal_context_fence).
 	 *
-	 * We can safely check the below field outside of the lock as it isn't
-	 * possible for this field to transition from being clear to set but
+	 * We can safely check the below fields outside of the lock as it isn't
+	 * possible for these fields to transition from being clear to set but
 	 * converse is possible, hence the need for the check within the lock.
 	 */
-	if (likely(!context_wait_for_deregister_to_register(ce)))
+	if (likely(!context_wait_for_deregister_to_register(ce) &&
+		   !context_pending_disable(ce)))
 		return 0;
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	if (context_wait_for_deregister_to_register(ce)) {
+	if (context_wait_for_deregister_to_register(ce) ||
+	    context_pending_disable(ce)) {
 		i915_sw_fence_await(&rq->submit);
 
 		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
@@ -1488,10 +1506,18 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
 	} else if (context_pending_disable(ce)) {
+		/*
+		 * Unpin must be done before __guc_signal_context_fence,
+		 * otherwise a race exists between the requests getting
+		 * submitted + retired before this unpin completes resulting in
+		 * the pin_count going to zero and the context still being
+		 * enabled.
+		 */
 		intel_context_sched_disable_unpin(ce);
 
 		spin_lock_irqsave(&ce->guc_state.lock, flags);
 		clr_context_pending_disable(ce);
+		__guc_signal_context_fence(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	}
 
-- 
2.28.0

