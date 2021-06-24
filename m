Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8F3B2798
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610396E9FD;
	Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A668F6E848;
 Thu, 24 Jun 2021 06:47:27 +0000 (UTC)
IronPort-SDR: PVfmmf3XNDoUNvD4nTB2kaoX9KdMCD5PM3F3MkWHKpQpsVH5MuwPEWTJ6ohB+9Nc3KxL1DyfCr
 91VyLQzace7A==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="293039163"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="293039163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: hIqrhrTbfq+L2SL5+gD8gpizXw54G12PZ4IT+rAoOPg3/rvIvUydXWSDoewMqqD2pKc5l8OHOo
 7su/bg5RxGog==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390914"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/47] drm/i915/guc: Extend deregistration fence to schedule
 disable
Date: Thu, 24 Jun 2021 00:04:46 -0700
Message-Id: <20210624070516.21893-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0386ccd5a481..0a6ccdf32316 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -918,7 +918,19 @@ static void guc_context_sched_disable(struct intel_context *ce)
 		goto unpin;
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
+
+	/*
+	 * We have to check if the context has been pinned again as another pin
+	 * operation is allowed to pass this function. Checking the pin count
+	 * here synchronizes this function with guc_request_alloc ensuring a
+	 * request doesn't slip through the 'context_pending_disable' fence.
+	 */
+	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return;
+	}
 	guc_id = prep_context_pending_disable(ce);
+
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	with_intel_runtime_pm(runtime_pm, wakeref)
@@ -1123,19 +1135,22 @@ static int guc_request_alloc(struct i915_request *rq)
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
@@ -1484,10 +1499,18 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
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

