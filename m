Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995D8C506E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 13:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2FD10E3D7;
	Tue, 14 May 2024 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYev1rPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01C210E2BE;
 Tue, 14 May 2024 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715684715; x=1747220715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gR9fY9JUVL4SFiIHYLdSqs4CLtD2NZ7n75eikQ3o0wY=;
 b=dYev1rPK4qk9hFFzIVDctsfCctpXLg6K98p8rSi5ELWgI9qjksWM9M/z
 Sj5m1M35jBbCvjEcm0Qf7RAkwK9jL/NPSp1KJqKqQdJAn0c1ZqLSvQmAt
 plsd6tB85MBsmjutlLygxBbCq+1RJS2zZnXBwvQtbk9gUOFZ3WvDJ/6sG
 +bri7ux42LyQJbMBiOFAGClk3C2eWjAsi23iO6iKl8gGhrPhGUuKimCk9
 G1xRHZKerSYAY7O7Cpshn/QRoPg/CAFE/r4S7FHUjk1bwiO7FM51hvLA5
 qRyrXSruG6t1xR0MItIrhNEpxMjaTr8fGCDNE9POUqDMTL0s9Pko5RhY+ Q==;
X-CSE-ConnectionGUID: MBM4iF9JSRi/Cr4aiPigdg==
X-CSE-MsgGUID: WQM44U8vQxuD7RVjFXoBNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15494639"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15494639"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 04:05:14 -0700
X-CSE-ConnectionGUID: yJ85Xtk4RT2XkTC21Jwu+g==
X-CSE-MsgGUID: AQpOFv1tQM2ceX4AzVGJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61476655"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 04:05:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH] drm/i915: Use for_each_child instead of manual for-loop
Date: Tue, 14 May 2024 12:50:31 +0200
Message-ID: <20240514105031.22123-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Simplify child iteration using for_each_child macro
instead of using manual for loop. There is no functional
change.

Cc: John Harrison <John.C.Harrison@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 64 ++++++++++---------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0eaa1064242c..7e88d90e935b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1800,14 +1800,37 @@ __unwind_incomplete_requests(struct intel_context *ce)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
-static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t stalled)
+static void guc_reset_context_state(struct intel_context *ce, intel_engine_mask_t stalled)
 {
-	bool guilty;
 	struct i915_request *rq;
-	unsigned long flags;
+	bool guilty = false;
 	u32 head;
-	int i, number_children = ce->parallel.number_children;
-	struct intel_context *parent = ce;
+
+	if (!intel_context_is_pinned(ce))
+		return;
+
+	rq = intel_context_get_active_request(ce);
+	if (!rq) {
+		head = ce->ring->tail;
+		goto out_replay;
+	}
+
+	if (i915_request_started(rq))
+		guilty = stalled & ce->engine->mask;
+
+	GEM_BUG_ON(i915_active_is_idle(&ce->active));
+	head = intel_ring_wrap(ce->ring, rq->head);
+
+	__i915_request_reset(rq, guilty);
+	i915_request_put(rq);
+out_replay:
+	guc_reset_state(ce, head, guilty);
+}
+
+static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t stalled)
+{
+	struct intel_context *child;
+	unsigned long flags;
 
 	GEM_BUG_ON(intel_context_is_child(ce));
 
@@ -1826,34 +1849,13 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 	 * For each context in the relationship find the hanging request
 	 * resetting each context / request as needed
 	 */
-	for (i = 0; i < number_children + 1; ++i) {
-		if (!intel_context_is_pinned(ce))
-			goto next_context;
-
-		guilty = false;
-		rq = intel_context_get_active_request(ce);
-		if (!rq) {
-			head = ce->ring->tail;
-			goto out_replay;
-		}
-
-		if (i915_request_started(rq))
-			guilty = stalled & ce->engine->mask;
-
-		GEM_BUG_ON(i915_active_is_idle(&ce->active));
-		head = intel_ring_wrap(ce->ring, rq->head);
-
-		__i915_request_reset(rq, guilty);
-		i915_request_put(rq);
-out_replay:
-		guc_reset_state(ce, head, guilty);
-next_context:
-		if (i != number_children)
-			ce = list_next_entry(ce, parallel.child_link);
+	guc_reset_context_state(ce, stalled);
+	for_each_child(ce, child) {
+		guc_reset_context_state(child, stalled);
 	}
 
-	__unwind_incomplete_requests(parent);
-	intel_context_put(parent);
+	__unwind_incomplete_requests(ce);
+	intel_context_put(ce);
 }
 
 void wake_up_all_tlb_invalidate(struct intel_guc *guc)
-- 
2.42.0

