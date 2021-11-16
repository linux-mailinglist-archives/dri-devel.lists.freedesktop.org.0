Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5A453A84
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 21:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FB589D4A;
	Tue, 16 Nov 2021 20:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C763F89D4A;
 Tue, 16 Nov 2021 20:04:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="320029237"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="320029237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 12:04:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="645591579"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 12:04:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Check return value of i915_request_mark_eio before
 calling put
Date: Tue, 16 Nov 2021 11:59:02 -0800
Message-Id: <20211116195902.26649-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_request_mark_eio can return NULL and in some cases this return
value was unconditionally passed to i915_request_put. i915_request_put
in turn calls dma_fence_put on &rq->fence. dma_fence_put checks for NULL
and short circuits. This all just happens to work because rq->fence is
first member in the i915_request structure. Even though this works it is
all rather dodgy, be safe and check the return of i915_request_mark_eio
before calling i915_request_put.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 ++++--
 drivers/gpu/drm/i915/gt/intel_ring_submission.c      | 3 ++-
 drivers/gpu/drm/i915/gt/mock_engine.c                | 3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 9 ++++++---
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index ca03880fa7e4..fb7e64f78722 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3073,7 +3073,8 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 
 	/* Mark all executing requests as skipped. */
 	list_for_each_entry(rq, &engine->sched_engine->requests, sched.link)
-		i915_request_put(i915_request_mark_eio(rq));
+		if (i915_request_mark_eio(rq))
+			i915_request_put(rq);
 	intel_engine_signal_breadcrumbs(engine);
 
 	/* Flush the queued requests to the timeline list (for retiring). */
@@ -3093,7 +3094,8 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 
 	/* On-hold requests will be flushed to timeline upon their release */
 	list_for_each_entry(rq, &sched_engine->hold, sched.link)
-		i915_request_put(i915_request_mark_eio(rq));
+		if (i915_request_mark_eio(rq))
+			i915_request_put(rq);
 
 	/* Cancel all attached virtual engines */
 	while ((rb = rb_first_cached(&execlists->virtual))) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 586dca1731ce..fc73f8744758 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -419,7 +419,8 @@ static void reset_cancel(struct intel_engine_cs *engine)
 
 	/* Mark all submitted requests as skipped. */
 	list_for_each_entry(request, &engine->sched_engine->requests, sched.link)
-		i915_request_put(i915_request_mark_eio(request));
+		if (i915_request_mark_eio(request))
+			i915_request_put(request);
 	intel_engine_signal_breadcrumbs(engine);
 
 	/* Remaining _unready_ requests will be nop'ed when submitted */
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 8b89215afe46..aae5e8dadd26 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -285,7 +285,8 @@ static void mock_reset_cancel(struct intel_engine_cs *engine)
 
 	/* Mark all submitted requests as skipped. */
 	list_for_each_entry(rq, &engine->sched_engine->requests, sched.link)
-		i915_request_put(i915_request_mark_eio(rq));
+		if (i915_request_mark_eio(rq))
+			i915_request_put(rq);
 	intel_engine_signal_breadcrumbs(engine);
 
 	/* Cancel and submit all pending requests. */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d7e49f7c1dba..42bd2a8c6751 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -642,7 +642,8 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * request resubmitted after the context was banned.
 	 */
 	if (unlikely(intel_context_is_banned(ce))) {
-		i915_request_put(i915_request_mark_eio(rq));
+		if (i915_request_mark_eio(rq))
+			i915_request_put(rq);
 		intel_engine_signal_breadcrumbs(ce->engine);
 		return 0;
 	}
@@ -1638,7 +1639,8 @@ static void guc_cancel_context_requests(struct intel_context *ce)
 	spin_lock_irqsave(&sched_engine->lock, flags);
 	spin_lock(&ce->guc_state.lock);
 	list_for_each_entry(rq, &ce->guc_state.requests, sched.link)
-		i915_request_put(i915_request_mark_eio(rq));
+		if (i915_request_mark_eio(rq))
+			i915_request_put(rq);
 	spin_unlock(&ce->guc_state.lock);
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
@@ -1679,7 +1681,8 @@ guc_cancel_sched_engine_requests(struct i915_sched_engine *sched_engine)
 
 			__i915_request_submit(rq);
 
-			i915_request_put(i915_request_mark_eio(rq));
+			if (i915_request_mark_eio(rq))
+				i915_request_put(rq);
 		}
 
 		rb_erase_cached(&p->node, &sched_engine->queue);
-- 
2.33.1

