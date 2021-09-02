Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7803FE6DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51A66E444;
	Thu,  2 Sep 2021 00:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F95F6E42F;
 Thu,  2 Sep 2021 00:52:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="282625314"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="282625314"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030207"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 17/25] drm/i915/guc: Release submit fence from an irq_work
Date: Wed,  1 Sep 2021 17:50:14 -0700
Message-Id: <20210902005022.711767-18-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

A subsequent patch will flip the locking hierarchy from
ce->guc_state.lock -> sched_engine->lock to sched_engine->lock ->
ce->guc_state.lock. As such we need to release the submit fence for a
request from an IRQ to break a lock inversion - i.e. the fence must be
release went holding ce->guc_state.lock and the releasing of the can
acquire sched_engine->lock.

v2:
 (Daniele)
  - Delete request from list before calling irq_work_queue

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_request.h           |  5 +++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 8509e827a8d0..7c7cbd57d568 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2035,17 +2035,32 @@ static const struct intel_context_ops guc_context_ops = {
 	.create_virtual = guc_create_virtual,
 };
 
+static void submit_work_cb(struct irq_work *wrk)
+{
+	struct i915_request *rq = container_of(wrk, typeof(*rq), submit_work);
+
+	might_lock(&rq->engine->sched_engine->lock);
+	i915_sw_fence_complete(&rq->submit);
+}
+
 static void __guc_signal_context_fence(struct intel_context *ce)
 {
-	struct i915_request *rq;
+	struct i915_request *rq, *rn;
 
 	lockdep_assert_held(&ce->guc_state.lock);
 
 	if (!list_empty(&ce->guc_state.fences))
 		trace_intel_context_fence_release(ce);
 
-	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
-		i915_sw_fence_complete(&rq->submit);
+	/*
+	 * Use an IRQ to ensure locking order of sched_engine->lock ->
+	 * ce->guc_state.lock is preserved.
+	 */
+	list_for_each_entry_safe(rq, rn, &ce->guc_state.fences,
+				 guc_fence_link) {
+		list_del(&rq->guc_fence_link);
+		irq_work_queue(&rq->submit_work);
+	}
 
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 }
@@ -2155,6 +2170,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	if (context_wait_for_deregister_to_register(ce) ||
 	    context_pending_disable(ce)) {
+		init_irq_work(&rq->submit_work, submit_work_cb);
 		i915_sw_fence_await(&rq->submit);
 
 		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 1bc1349ba3c2..d818cfbfc41d 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -218,6 +218,11 @@ struct i915_request {
 	};
 	struct llist_head execute_cb;
 	struct i915_sw_fence semaphore;
+	/**
+	 * @submit_work: complete submit fence from an IRQ if needed for
+	 * locking hierarchy reasons.
+	 */
+	struct irq_work submit_work;
 
 	/*
 	 * A list of everyone we wait upon, and everyone who waits upon us.
-- 
2.25.1

