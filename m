Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A65F07F0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A6E10EC4B;
	Fri, 30 Sep 2022 09:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C80010E099;
 Fri, 30 Sep 2022 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664531245; x=1696067245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+vT/T/PvstqWkHENH1n6KVuOR/vFMEz2rhIQUKxKOlw=;
 b=YLO9WrPlnM/ZFaHAYb7hXUZrp2XrGB97QXRuiKvitkV+dGR52kODc5sy
 MNU+HxbdqDvbHBz5PC35qqdGa2BeQA6+rb/oWdD0L7/0PzKhCYjTAjVzO
 pWxUzL1R7sHretST/DnYLLsarQRUjtKJehUVyS66DNhNARAllsG2ogX7p
 Uv0Okm9JfTiw5dgZrSb7ToOqRLlNEfWkZB4ju+FgNgfMWhgMUFaWXzJAL
 mLSteBDQT2Hpq2WnZ8KYoZdB3jCb0xjZt/ihacj8L//+qJ7KanMDbXmMa
 0gGiHptrs8coCY+a18Vm5QnTcJMyZH5exV0GMuaEo4Ly56489AutILfSi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303638771"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303638771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:47:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="655900931"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="655900931"
Received: from dsawant-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.195.50])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:47:22 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Fix revocation of non-persistent contexts
Date: Fri, 30 Sep 2022 10:47:16 +0100
Message-Id: <20220930094716.430937-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Patch which added graceful exit for non-persistent contexts missed the
fact it is not enough to set the exiting flag on a context and let the
backend handle it from there.

GuC backend cannot handle it because it runs independently in the
firmware and driver might not see the requests ever again. Patch also
missed the fact some usages of intel_context_is_banned in the GuC backend
needed replacing with newly introduced intel_context_is_schedulable.

Fix the first issue by calling into backend revoke when we know this is
the last chance to do it. Fix the second issue by replacing
intel_context_is_banned with intel_context_is_schedulable, which should
always be safe since latter is a superset of the former.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 45c64ecf97ee ("drm/i915: Improve user experience and driver robustness under SIGINT or similar")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +-----
 drivers/gpu/drm/i915/gt/intel_context.c       | 14 +++++++---
 drivers/gpu/drm/i915/gt/intel_context.h       |  8 +-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++++++----------
 4 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 0bcde53c50c6..1e29b1e6d186 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1387,14 +1387,8 @@ kill_engines(struct i915_gem_engines *engines, bool exit, bool persistent)
 	 */
 	for_each_gem_engine(ce, engines, it) {
 		struct intel_engine_cs *engine;
-		bool skip = false;
 
-		if (exit)
-			skip = intel_context_set_exiting(ce);
-		else if (!persistent)
-			skip = intel_context_exit_nonpersistent(ce, NULL);
-
-		if (skip)
+		if ((exit || !persistent) && intel_context_revoke(ce))
 			continue; /* Already marked. */
 
 		/*
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 654a092ed3d6..398b2a9eed61 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -614,13 +614,19 @@ bool intel_context_ban(struct intel_context *ce, struct i915_request *rq)
 	return ret;
 }
 
-bool intel_context_exit_nonpersistent(struct intel_context *ce,
-				      struct i915_request *rq)
+bool intel_context_revoke(struct intel_context *ce)
 {
 	bool ret = intel_context_set_exiting(ce);
 
-	if (ce->ops->revoke)
-		ce->ops->revoke(ce, rq, ce->engine->props.preempt_timeout_ms);
+	if (!ret && intel_engine_uses_guc(ce->engine)) {
+		/*
+		 * With GuC backend we have to notify it of revocation as soon
+		 * as the exiting flag is set.
+		 */
+		if (ce->ops->revoke)
+			ce->ops->revoke(ce, NULL,
+					ce->engine->props.preempt_timeout_ms);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 8e2d70630c49..40f8809d14ea 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -319,18 +319,12 @@ static inline bool intel_context_is_schedulable(const struct intel_context *ce)
 	       !test_bit(CONTEXT_BANNED, &ce->flags);
 }
 
-static inline bool intel_context_is_exiting(const struct intel_context *ce)
-{
-	return test_bit(CONTEXT_EXITING, &ce->flags);
-}
-
 static inline bool intel_context_set_exiting(struct intel_context *ce)
 {
 	return test_and_set_bit(CONTEXT_EXITING, &ce->flags);
 }
 
-bool intel_context_exit_nonpersistent(struct intel_context *ce,
-				      struct i915_request *rq);
+bool intel_context_revoke(struct intel_context *ce);
 
 static inline bool
 intel_context_force_single_submission(const struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ef295a94060..88a4476b8e92 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -685,7 +685,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	 * Corner case where requests were sitting in the priority list or a
 	 * request resubmitted after the context was banned.
 	 */
-	if (unlikely(intel_context_is_banned(ce))) {
+	if (unlikely(!intel_context_is_schedulable(ce))) {
 		i915_request_put(i915_request_mark_eio(rq));
 		intel_engine_signal_breadcrumbs(ce->engine);
 		return 0;
@@ -871,15 +871,15 @@ static int guc_wq_item_append(struct intel_guc *guc,
 			      struct i915_request *rq)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
-	int ret = 0;
+	int ret;
 
-	if (likely(!intel_context_is_banned(ce))) {
-		ret = __guc_wq_item_append(rq);
+	if (unlikely(!intel_context_is_schedulable(ce)))
+		return 0;
 
-		if (unlikely(ret == -EBUSY)) {
-			guc->stalled_request = rq;
-			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
-		}
+	ret = __guc_wq_item_append(rq);
+	if (unlikely(ret == -EBUSY)) {
+		guc->stalled_request = rq;
+		guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
 	}
 
 	return ret;
@@ -898,7 +898,7 @@ static bool multi_lrc_submit(struct i915_request *rq)
 	 * submitting all the requests generated in parallel.
 	 */
 	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
-		intel_context_is_banned(ce);
+	       !intel_context_is_schedulable(ce);
 }
 
 static int guc_dequeue_one_context(struct intel_guc *guc)
@@ -967,7 +967,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 		struct intel_context *ce = request_to_scheduling_context(last);
 
 		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
-			     !intel_context_is_banned(ce))) {
+			     intel_context_is_schedulable(ce))) {
 			ret = try_context_registration(ce, false);
 			if (unlikely(ret == -EPIPE)) {
 				goto deadlk;
@@ -1577,7 +1577,7 @@ static void guc_reset_state(struct intel_context *ce, u32 head, bool scrub)
 {
 	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
 
-	if (intel_context_is_banned(ce))
+	if (!intel_context_is_schedulable(ce))
 		return;
 
 	GEM_BUG_ON(!intel_context_is_pinned(ce));
@@ -4518,12 +4518,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
-	if (likely(!intel_context_is_banned(ce))) {
+	if (likely(intel_context_is_schedulable(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
 		drm_info(&guc_to_gt(guc)->i915->drm,
-			 "Ignoring context reset notification of banned context 0x%04X on %s",
+			 "Ignoring context reset notification of exiting context 0x%04X on %s",
 			 ce->guc_id.id, ce->engine->name);
 	}
 }
-- 
2.34.1

