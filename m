Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21A48BB57
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 00:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94F10E65A;
	Tue, 11 Jan 2022 23:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296A410E64D;
 Tue, 11 Jan 2022 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641943024; x=1673479024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAhAJyY5hfyV7jeXnAGTvViBL+fOq3h+6xLRMaua2Og=;
 b=M550J2Qt9g3dUwq281iKlnkqpJ9iSUDTg//W+wT7wxqLZtxTx/bXtTaM
 KypFnQqfiaVkBd6fHRev8zroVZ7JO1DfKbfpCbrqGKOyq5wa4+N+Kaua7
 D1fyzAw/N0R30t8+NyOLlUFxhH2lPQKasUEqlSZNrChqFi9qRCWbei/oC
 cAB5inveGDv4BjWKsZg7iYpKRzC0QqedEfbF+SDsc2Ywqs8d/Tqbr8w9Q
 oX7HojVYBsWrES5ua3wVLhn4jeYTMUyi1dWPU4G82yJHMVVy8nR27gcI4
 KC2h44/I12SNQD4ARzzqq051lKilKrRbGEu7yufTEXPvR2a1P6TuDRBRG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="230950980"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="230950980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; d="scan'208";a="613375823"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 15:17:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/i915/guc: Remove hacks for reset and schedule disable
 G2H being received out of order
Date: Tue, 11 Jan 2022 15:11:09 -0800
Message-Id: <20220111231109.23244-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111231109.23244-1-matthew.brost@intel.com>
References: <20220111231109.23244-1-matthew.brost@intel.com>
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

In the i915 there are several hacks in place to make request cancelation
work with an old version of the GuC which delivered the G2H indicating
schedule disable is done before G2H indicating a context reset. Version
69 fixes this, so we can remove these hacks.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 30 ++-----------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23a40f10d376d..3918f1be114fa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1533,7 +1533,6 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	unsigned long flags;
 	u32 head;
 	int i, number_children = ce->parallel.number_children;
-	bool skip = false;
 	struct intel_context *parent = ce;
 
 	GEM_BUG_ON(intel_context_is_child(ce));
@@ -1544,23 +1543,10 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	 * GuC will implicitly mark the context as non-schedulable when it sends
 	 * the reset notification. Make sure our state reflects this change. The
 	 * context will be marked enabled on resubmission.
-	 *
-	 * XXX: If the context is reset as a result of the request cancellation
-	 * this G2H is received after the schedule disable complete G2H which is
-	 * wrong as this creates a race between the request cancellation code
-	 * re-submitting the context and this G2H handler. This is a bug in the
-	 * GuC but can be worked around in the meantime but converting this to a
-	 * NOP if a pending enable is in flight as this indicates that a request
-	 * cancellation has occurred.
 	 */
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	if (likely(!context_pending_enable(ce)))
-		clr_context_enabled(ce);
-	else
-		skip = true;
+	clr_context_enabled(ce);
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-	if (unlikely(skip))
-		goto out_put;
 
 	/*
 	 * For each context in the relationship find the hanging request
@@ -1592,7 +1578,6 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	}
 
 	__unwind_incomplete_requests(parent);
-out_put:
 	intel_context_put(parent);
 }
 
@@ -2531,12 +2516,6 @@ static void guc_context_cancel_request(struct intel_context *ce,
 					true);
 		}
 
-		/*
-		 * XXX: Racey if context is reset, see comment in
-		 * __guc_reset_context().
-		 */
-		flush_work(&ce_to_guc(ce)->ct.requests.worker);
-
 		guc_context_unblock(block_context);
 		intel_context_put(ce);
 	}
@@ -3971,12 +3950,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
-	/*
-	 * XXX: Racey if request cancellation has occurred, see comment in
-	 * __guc_reset_context().
-	 */
-	if (likely(!intel_context_is_banned(ce) &&
-		   !context_blocked(ce))) {
+	if (likely(!intel_context_is_banned(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-- 
2.34.1

