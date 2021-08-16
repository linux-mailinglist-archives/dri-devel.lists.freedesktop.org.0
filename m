Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8A3ED829
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C822F89FC9;
	Mon, 16 Aug 2021 13:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5055E89E36;
 Mon, 16 Aug 2021 13:56:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607062"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607062"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091164"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 05/22] drm/i915/guc: Workaround reset G2H is received after
 schedule done G2H
Date: Mon, 16 Aug 2021 06:51:22 -0700
Message-Id: <20210816135139.10060-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816135139.10060-1-matthew.brost@intel.com>
References: <20210816135139.10060-1-matthew.brost@intel.com>
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

If the context is reset as a result of the request cancelation the
context reset G2H is received after schedule disable done G2H which is
likely the wrong order. The schedule disable done G2H release the
waiting request cancelation code which resubmits the context. This races
with the context reset G2H which also wants to resubmit the context but
in this case it really should be a NOP as request cancelation code owns
the resubmit. Use some clever tricks of checking the context state to
seal this race until if / when the GuC firmware is fixed.

v2:
 (Checkpatch)
  - Fix typos

Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 ++++++++++++++++---
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3cd2da6f5c03..c3b7bf7319dd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -826,17 +826,35 @@ __unwind_incomplete_requests(struct intel_context *ce)
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
+	 * likely wrong as this creates a race between the request cancellation
+	 * code re-submitting the context and this G2H handler. This likely
+	 * should be fixed in the GuC but until if / when that gets fixed we
+	 * need to workaround this. Convert this function to a NOP if a pending
+	 * enable is in flight as this indicates that a request cancellation has
+	 * occurred.
 	 */
-	clr_context_enabled(ce);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (likely(!context_pending_enable(ce))) {
+		clr_context_enabled(ce);
+	} else {
+		skip = true;
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(skip))
+		goto out_put;
 
 	rq = intel_context_find_active_request(ce);
 	if (!rq) {
@@ -855,6 +873,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 out_replay:
 	guc_reset_state(ce, head, stalled);
 	__unwind_incomplete_requests(ce);
+out_put:
 	intel_context_put(ce);
 }
 
@@ -1599,6 +1618,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
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
@@ -2719,7 +2745,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
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
2.32.0

