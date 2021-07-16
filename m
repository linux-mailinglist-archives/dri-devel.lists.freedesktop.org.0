Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8203CBD1F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE746EA11;
	Fri, 16 Jul 2021 19:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6C26E9D4;
 Fri, 16 Jul 2021 19:59:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596717"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238907"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/51] drm/i915/guc: Ensure request ordering via completion
 fences
Date: Fri, 16 Jul 2021 13:16:45 -0700
Message-Id: <20210716201724.54804-13-matthew.brost@intel.com>
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

If two requests are on the same ring, they are explicitly ordered by the
HW. So, a submission fence is sufficient to ensure ordering when using
the new GuC submission interface. Conversely, if two requests share a
timeline and are on the same physical engine but different context this
doesn't ensure ordering on the new GuC submission interface. So, a
completion fence needs to be used to ensure ordering.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 -
 drivers/gpu/drm/i915/i915_request.c               | 12 ++++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9dc1a256e185..4443cc6f5320 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -933,7 +933,6 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	 * a request before we set the 'context_pending_disable' flag here.
 	 */
 	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		return;
 	}
 	guc_id = prep_context_pending_disable(ce);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index b48c4905d3fc..2b2b63cba06c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -432,6 +432,7 @@ void i915_request_retire_upto(struct i915_request *rq)
 
 	do {
 		tmp = list_first_entry(&tl->requests, typeof(*tmp), link);
+		GEM_BUG_ON(!i915_request_completed(tmp));
 	} while (i915_request_retire(tmp) && tmp != rq);
 }
 
@@ -1380,6 +1381,9 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	return err;
 }
 
+static int
+i915_request_await_request(struct i915_request *to, struct i915_request *from);
+
 int
 i915_request_await_execution(struct i915_request *rq,
 			     struct dma_fence *fence)
@@ -1465,7 +1469,8 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
 			return ret;
 	}
 
-	if (is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
+	if (!intel_engine_uses_guc(to->engine) &&
+	    is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
 		ret = await_request_submit(to, from);
 	else
 		ret = emit_semaphore_wait(to, from, I915_FENCE_GFP);
@@ -1626,6 +1631,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 	prev = to_request(__i915_active_fence_set(&timeline->last_request,
 						  &rq->fence));
 	if (prev && !__i915_request_is_complete(prev)) {
+		bool uses_guc = intel_engine_uses_guc(rq->engine);
+
 		/*
 		 * The requests are supposed to be kept in order. However,
 		 * we need to be wary in case the timeline->last_request
@@ -1636,7 +1643,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
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

