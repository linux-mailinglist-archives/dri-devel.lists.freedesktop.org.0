Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2293B27CE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2326EA2B;
	Thu, 24 Jun 2021 06:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C2E6E9FC;
 Thu, 24 Jun 2021 06:47:30 +0000 (UTC)
IronPort-SDR: QUY/CfAFiL83ZN5S2msS7BJrwoH7Zn4Y244kqgwiaBNrrJCHvr/Gv9ZUtFndy4RKpPj3zCT72B
 MPkx6iP2zGQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346758"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346758"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: dObRdaGh1MFmLFUbqRT5J4EkhdWU4DP3jjQqj+DdvXIR3pzjzf+lGVlMMW9+zUPW1D70QSM+ct
 /2cXFDzgIngw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390919"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/47] drm/i915/guc: Ensure request ordering via completion
 fences
Date: Thu, 24 Jun 2021 00:04:48 -0700
Message-Id: <20210624070516.21893-20-matthew.brost@intel.com>
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

If two requests are on the same ring, they are explicitly ordered by the
HW. So, a submission fence is sufficient to ensure ordering when using
the new GuC submission interface. Conversely, if two requests share a
timeline and are on the same physical engine but different context this
doesn't ensure ordering on the new GuC submission interface. So, a
completion fence needs to be used to ensure ordering.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   |  1 -
 drivers/gpu/drm/i915/i915_request.c             | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0a6ccdf32316..010e46dd6b16 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -926,7 +926,6 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	 * request doesn't slip through the 'context_pending_disable' fence.
 	 */
 	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		return;
 	}
 	guc_id = prep_context_pending_disable(ce);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 9dad3df5eaf7..d92c9f25c9f4 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -444,6 +444,7 @@ void i915_request_retire_upto(struct i915_request *rq)
 
 	do {
 		tmp = list_first_entry(&tl->requests, typeof(*tmp), link);
+		GEM_BUG_ON(!i915_request_completed(tmp));
 	} while (i915_request_retire(tmp) && tmp != rq);
 }
 
@@ -1405,6 +1406,9 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	return err;
 }
 
+static int
+i915_request_await_request(struct i915_request *to, struct i915_request *from);
+
 int
 i915_request_await_execution(struct i915_request *rq,
 			     struct dma_fence *fence,
@@ -1464,12 +1468,13 @@ await_request_submit(struct i915_request *to, struct i915_request *from)
 	 * the waiter to be submitted immediately to the physical engine
 	 * as it may then bypass the virtual request.
 	 */
-	if (to->engine == READ_ONCE(from->engine))
+	if (to->engine == READ_ONCE(from->engine)) {
 		return i915_sw_fence_await_sw_fence_gfp(&to->submit,
 							&from->submit,
 							I915_FENCE_GFP);
-	else
+	} else {
 		return __i915_request_await_execution(to, from, NULL);
+	}
 }
 
 static int
@@ -1493,7 +1498,8 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
 			return ret;
 	}
 
-	if (is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
+	if (!intel_engine_uses_guc(to->engine) &&
+	    is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
 		ret = await_request_submit(to, from);
 	else
 		ret = emit_semaphore_wait(to, from, I915_FENCE_GFP);
@@ -1654,6 +1660,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 	prev = to_request(__i915_active_fence_set(&timeline->last_request,
 						  &rq->fence));
 	if (prev && !__i915_request_is_complete(prev)) {
+		bool uses_guc = intel_engine_uses_guc(rq->engine);
+
 		/*
 		 * The requests are supposed to be kept in order. However,
 		 * we need to be wary in case the timeline->last_request
@@ -1664,7 +1672,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 			   i915_seqno_passed(prev->fence.seqno,
 					     rq->fence.seqno));
 
-		if (is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask))
+		if ((!uses_guc && is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
+		    (uses_guc && prev->context == rq->context))
 			i915_sw_fence_await_sw_fence(&rq->submit,
 						     &prev->submit,
 						     &rq->submitq);
-- 
2.28.0

