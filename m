Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E927B5F3010
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 14:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6610E331;
	Mon,  3 Oct 2022 12:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FC410E331;
 Mon,  3 Oct 2022 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664799407; x=1696335407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R51OAp+f64kQaIBoysffby4cH37ByGJPbCUL8p6RLco=;
 b=NRvqGZ8h9Tf6ku9DY/JQwAmAmNg0ui1gxlHxshX3haxUrzqrKcyxZhUF
 Kanjq6u+H1x8t/BV680hyLLsOZu2T9wH4yihlgve5IxZ5alwoXwPAyPOv
 n/4vWw9qwgiJFDhb16ZIvo8U5lC6R7aXrkshHworCmhZJg3bg5BqtbEdD
 1/BDYee4H/qzSZVmfybpLrWHfp7A51Tr9Yrl5ZkvLUUjBe8vsFhQG8Byl
 O+PeFE1FU8h45Y1mAzmuu3rqC+eBsBaUw2ZV+MtJMi+pMiyp50a5bdo7l
 MwsSrd5c95awitJE6V7uoDrigSvgeeR6N+ckyZpSdPY+ZTcMJmL0zaFE1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366661863"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="366661863"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 05:16:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="712569369"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="712569369"
Received: from praffert-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.196.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 05:16:45 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc: Fix revocation of non-persistent contexts
Date: Mon,  3 Oct 2022 13:16:30 +0100
Message-Id: <20221003121630.694249-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930094716.430937-1-tvrtko.ursulin@linux.intel.com>
References: <20220930094716.430937-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
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

v2:
 * Just call ce->ops->revoke unconditionally. (Andrzej)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 45c64ecf97ee ("drm/i915: Improve user experience and driver robustness under SIGINT or similar")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: <stable@vger.kernel.org> # v6.0+
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +-----
 drivers/gpu/drm/i915/gt/intel_context.c       |  5 ++--
 drivers/gpu/drm/i915/gt/intel_context.h       |  3 +--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++++++----------
 4 files changed, 17 insertions(+), 25 deletions(-)

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
index 654a092ed3d6..e94365b08f1e 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -614,13 +614,12 @@ bool intel_context_ban(struct intel_context *ce, struct i915_request *rq)
 	return ret;
 }
 
-bool intel_context_exit_nonpersistent(struct intel_context *ce,
-				      struct i915_request *rq)
+bool intel_context_revoke(struct intel_context *ce)
 {
 	bool ret = intel_context_set_exiting(ce);
 
 	if (ce->ops->revoke)
-		ce->ops->revoke(ce, rq, ce->engine->props.preempt_timeout_ms);
+		ce->ops->revoke(ce, NULL, ce->engine->props.preempt_timeout_ms);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 8e2d70630c49..be09fb2e883a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -329,8 +329,7 @@ static inline bool intel_context_set_exiting(struct intel_context *ce)
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

