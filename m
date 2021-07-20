Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7051B3D0483
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D536E591;
	Tue, 20 Jul 2021 22:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DF16E59D;
 Tue, 20 Jul 2021 22:21:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="211056152"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="211056152"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:21:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="500940120"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 15:21:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/18] drm/i915/guc: Insert fence on context when deregistering
Date: Tue, 20 Jul 2021 15:39:10 -0700
Message-Id: <20210720223921.56160-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720223921.56160-1-matthew.brost@intel.com>
References: <20210720223921.56160-1-matthew.brost@intel.com>
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

Sometimes during context pinning a context with the same guc_id is
registered with the GuC. In this a case deregister must be done before
the context can be registered. A fence is inserted on all requests while
the deregister is in flight. Once the G2H is received indicating the
deregistration is complete the context is registered and the fence is
released.

v2:
 (John H)
  - Fix commit message

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  1 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 51 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_request.h           |  8 +++
 4 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 32fd6647154b..ad7197c5910f 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -385,6 +385,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	mutex_init(&ce->pin_mutex);
 
 	spin_lock_init(&ce->guc_state.lock);
+	INIT_LIST_HEAD(&ce->guc_state.fences);
 
 	ce->guc_id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id_link);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 606c480aec26..e0e3a937f709 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -147,6 +147,11 @@ struct intel_context {
 		 * submission
 		 */
 		u8 sched_state;
+		/*
+		 * fences: maintains of list of requests that have a submit
+		 * fence related to GuC submission
+		 */
+		struct list_head fences;
 	} guc_state;
 
 	/* GuC scheduling state flags that do not require a lock. */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 6940b9d62118..8fd4479bad14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -932,6 +932,30 @@ static const struct intel_context_ops guc_context_ops = {
 	.destroy = guc_context_destroy,
 };
 
+static void __guc_signal_context_fence(struct intel_context *ce)
+{
+	struct i915_request *rq;
+
+	lockdep_assert_held(&ce->guc_state.lock);
+
+	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
+		i915_sw_fence_complete(&rq->submit);
+
+	INIT_LIST_HEAD(&ce->guc_state.fences);
+}
+
+static void guc_signal_context_fence(struct intel_context *ce)
+{
+	unsigned long flags;
+
+	GEM_BUG_ON(!context_wait_for_deregister_to_register(ce));
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	clr_context_wait_for_deregister_to_register(ce);
+	__guc_signal_context_fence(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+}
+
 static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
 {
 	return new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
@@ -942,6 +966,7 @@ static int guc_request_alloc(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
 	struct intel_guc *guc = ce_to_guc(ce);
+	unsigned long flags;
 	int ret;
 
 	GEM_BUG_ON(!intel_context_is_pinned(rq->context));
@@ -986,7 +1011,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
 	 */
 	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
-		return 0;
+		goto out;
 
 	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
 	if (unlikely(ret < 0))
@@ -1002,6 +1027,28 @@ static int guc_request_alloc(struct i915_request *rq)
 
 	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
 
+out:
+	/*
+	 * We block all requests on this context if a G2H is pending for a
+	 * context deregistration as the GuC will fail a context registration
+	 * while this G2H is pending. Once a G2H returns, the fence is released
+	 * that is blocking these requests (see guc_signal_context_fence).
+	 *
+	 * We can safely check the below field outside of the lock as it isn't
+	 * possible for this field to transition from being clear to set but
+	 * converse is possible, hence the need for the check within the lock.
+	 */
+	if (likely(!context_wait_for_deregister_to_register(ce)))
+		return 0;
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (context_wait_for_deregister_to_register(ce)) {
+		i915_sw_fence_await(&rq->submit);
+
+		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
 	return 0;
 }
 
@@ -1298,7 +1345,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			register_context(ce);
-		clr_context_wait_for_deregister_to_register(ce);
+		guc_signal_context_fence(ce);
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 5deb65ec5fa5..717e5b292046 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -285,6 +285,14 @@ struct i915_request {
 		struct hrtimer timer;
 	} watchdog;
 
+	/*
+	 * Requests may need to be stalled when using GuC submission waiting for
+	 * certain GuC operations to complete. If that is the case, stalled
+	 * requests are added to a per context list of stalled requests. The
+	 * below list_head is the link in that list.
+	 */
+	struct list_head guc_fence_link;
+
 	I915_SELFTEST_DECLARE(struct {
 		struct list_head link;
 		unsigned long delay;
-- 
2.28.0

