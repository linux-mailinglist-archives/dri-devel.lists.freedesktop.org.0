Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7923FE6C9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E366E424;
	Thu,  2 Sep 2021 00:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709786E416;
 Thu,  2 Sep 2021 00:52:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198468244"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198468244"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030168"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 06/25] drm/i915/guc: Workaround reset G2H is received after
 schedule done G2H
Date: Wed,  1 Sep 2021 17:50:03 -0700
Message-Id: <20210902005022.711767-7-daniele.ceraolospurio@intel.com>
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

If the context is reset as a result of the request cancellation the
context reset G2H is received after schedule disable done G2H which is
the wrong order. The schedule disable done G2H release the waiting
request cancellation code which resubmits the context. This races
with the context reset G2H which also wants to resubmit the context but
in this case it really should be a NOP as request cancellation code owns
the resubmit. Use some clever tricks of checking the context state to
seal this race until the GuC firmware is fixed.

v2:
 (Checkpatch)
  - Fix typos
v3:
 (Daniele)
  - State that is a bug in the GuC firmware

Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 31bbfe5479ae..f9e3725b94c1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -833,17 +833,33 @@ __unwind_incomplete_requests(struct intel_context *ce)
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
 	struct i915_request *rq;
+	unsigned long flags;
 	u32 head;
+	bool skip = false;
 
 	intel_context_get(ce);
 
 	/*
-	 * GuC will implicitly mark the context as non-schedulable
-	 * when it sends the reset notification. Make sure our state
-	 * reflects this change. The context will be marked enabled
-	 * on resubmission.
+	 * GuC will implicitly mark the context as non-schedulable when it sends
+	 * the reset notification. Make sure our state reflects this change. The
+	 * context will be marked enabled on resubmission.
+	 *
+	 * XXX: If the context is reset as a result of the request cancellation
+	 * this G2H is received after the schedule disable complete G2H which is
+	 * wrong as this creates a race between the request cancellation code
+	 * re-submitting the context and this G2H handler. This is a bug in the
+	 * GuC but can be worked around in the meantime but converting this to a
+	 * NOP if a pending enable is in flight as this indicates that a request
+	 * cancellation has occurred.
 	 */
-	clr_context_enabled(ce);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (likely(!context_pending_enable(ce)))
+		clr_context_enabled(ce);
+	else
+		skip = true;
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(skip))
+		goto out_put;
 
 	rq = intel_context_find_active_request(ce);
 	if (!rq) {
@@ -862,6 +878,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 out_replay:
 	guc_reset_state(ce, head, stalled);
 	__unwind_incomplete_requests(ce);
+out_put:
 	intel_context_put(ce);
 }
 
@@ -1598,6 +1615,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
 			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
 					true);
 		}
+
+		/*
+		 * XXX: Racey if context is reset, see comment in
+		 * __guc_reset_context().
+		 */
+		flush_work(&ce_to_guc(ce)->ct.requests.worker);
+
 		guc_context_unblock(ce);
 	}
 }
@@ -2712,7 +2736,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
-	if (likely(!intel_context_is_banned(ce))) {
+	/*
+	 * XXX: Racey if request cancellation has occurred, see comment in
+	 * __guc_reset_context().
+	 */
+	if (likely(!intel_context_is_banned(ce) &&
+		   !context_blocked(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	}
-- 
2.25.1

