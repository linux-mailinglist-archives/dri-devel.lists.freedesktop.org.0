Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238843F811E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2D6E516;
	Thu, 26 Aug 2021 03:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15A96E4DE;
 Thu, 26 Aug 2021 03:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811077"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811077"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738570"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 18/27] drm/i915/guc: Release submit fence from an irq_work
Date: Wed, 25 Aug 2021 20:23:18 -0700
Message-Id: <20210826032327.18078-19-matthew.brost@intel.com>
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
index baf789f37d42..c86aae0899e5 100644
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
2.32.0

