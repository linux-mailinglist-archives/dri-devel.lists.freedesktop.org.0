Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C17676188
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683810EB25;
	Fri, 20 Jan 2023 23:28:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C410EB18;
 Fri, 20 Jan 2023 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674257330; x=1705793330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOYwcAJI38yRwYDU7TNYSF63Z2R+8sQqnDD9n74UuyQ=;
 b=j8xMn3XCou12vGoLSyp8VRQaxy5RY+rw1wYKou5OIQjWapYWWEjn0h6a
 Xbs+7I9tCunCxcItLQT/YzBhWuE6OOlRiVugXXgC9dnS04vpr3kdCdwZ2
 qlTuJSMk15HpDzewdLbO1OZBsR9VoW55/c+RALMGc6XXIlrkqU4C+Gslt
 UhBgeTifj06b+6LCN1g5qKm/kcD4dPZCQbiatT2BAcsy+j+1+xtKyh4j0
 ZrLDD0dbZKPGavU0jTEoySoiWxyLmljAs/HfLqxYsB4JEM03hg+La2D3z
 qVH0Vb+Bg8LHjFd7QnVI1n3+nxBJqEONIwNWLr56hwhECPJAoQFASGkQJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324413563"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="324413563"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693021611"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="693021611"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 15:28:48 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 2/7] drm/i915: Fix up locking around dumping requests lists
Date: Fri, 20 Jan 2023 15:28:26 -0800
Message-Id: <20230120232831.28177-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120232831.28177-1-John.C.Harrison@Intel.com>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The debugfs dump of requests was confused about what state requires
the execlist lock versus the GuC lock. There was also a bunch of
duplicated messy code between it and the error capture code.

So refactor the hung request search into a re-usable function. And
reduce the span of the execlist state lock to only the execlist
specific code paths. In order to do that, also move the report of hold
count (which is an execlist only concept) from the top level dump
function to the lower level execlist specific function. Also, move the
execlist specific code into the execlist source file.

v2: Rename some functions and move to more appropriate files (Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 +++++++++----------
 .../drm/i915/gt/intel_execlists_submission.c  | 27 +++++++
 .../drm/i915/gt/intel_execlists_submission.h  |  4 +
 drivers/gpu/drm/i915/i915_gpu_error.c         | 26 +------
 5 files changed, 73 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 0e24af5efee9c..b58c30ac8ef02 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -250,8 +250,8 @@ void intel_engine_dump_active_requests(struct list_head *requests,
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
 				   ktime_t *now);
 
-struct i915_request *
-intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
+void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
+				  struct intel_context **ce, struct i915_request **rq);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
 struct intel_context *
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index fbc0a81617e89..1d77e27801bce 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2114,17 +2114,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
 	}
 }
 
-static unsigned long list_count(struct list_head *list)
-{
-	struct list_head *pos;
-	unsigned long count = 0;
-
-	list_for_each(pos, list)
-		count++;
-
-	return count;
-}
-
 static unsigned long read_ul(void *p, size_t x)
 {
 	return *(unsigned long *)(p + x);
@@ -2216,11 +2205,11 @@ void intel_engine_dump_active_requests(struct list_head *requests,
 	}
 }
 
-static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
+static void engine_dump_active_requests(struct intel_engine_cs *engine,
+					struct drm_printer *m)
 {
+	struct intel_context *hung_ce = NULL;
 	struct i915_request *hung_rq = NULL;
-	struct intel_context *ce;
-	bool guc;
 
 	/*
 	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
@@ -2229,29 +2218,20 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	 * But the intention here is just to report an instantaneous snapshot
 	 * so that's fine.
 	 */
-	lockdep_assert_held(&engine->sched_engine->lock);
+	intel_engine_get_hung_entity(engine, &hung_ce, &hung_rq);
 
 	drm_printf(m, "\tRequests:\n");
 
-	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
-	if (guc) {
-		ce = intel_engine_get_hung_context(engine);
-		if (ce)
-			hung_rq = intel_context_find_active_request_get(ce);
-	} else {
-		hung_rq = intel_engine_execlist_find_hung_request(engine);
-		if (hung_rq)
-			hung_rq = i915_request_get_rcu(hung_rq);
-	}
-
 	if (hung_rq)
 		engine_dump_request(hung_rq, m, "\t\thung");
+	else if (hung_ce)
+		drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
 
-	if (guc)
+	if (intel_uc_uses_guc_submission(&engine->gt->uc))
 		intel_guc_dump_active_requests(engine, hung_rq, m);
 	else
-		intel_engine_dump_active_requests(&engine->sched_engine->requests,
-						  hung_rq, m);
+		intel_execlist_dump_active_requests(engine, hung_rq, m);
+
 	if (hung_rq)
 		i915_request_put(hung_rq);
 }
@@ -2263,7 +2243,6 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 	struct i915_gpu_error * const error = &engine->i915->gpu_error;
 	struct i915_request *rq;
 	intel_wakeref_t wakeref;
-	unsigned long flags;
 	ktime_t dummy;
 
 	if (header) {
@@ -2300,13 +2279,8 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 		   i915_reset_count(error));
 	print_properties(engine, m);
 
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
 	engine_dump_active_requests(engine, m);
 
-	drm_printf(m, "\tOn hold?: %lu\n",
-		   list_count(&engine->sched_engine->hold));
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
-
 	drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
 	wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
 	if (wakeref) {
@@ -2352,8 +2326,7 @@ intel_engine_create_virtual(struct intel_engine_cs **siblings,
 	return siblings[0]->cops->create_virtual(siblings, count, flags);
 }
 
-struct i915_request *
-intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
+static struct i915_request *engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 {
 	struct i915_request *request, *active = NULL;
 
@@ -2405,6 +2378,33 @@ intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 	return active;
 }
 
+void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
+				  struct intel_context **ce, struct i915_request **rq)
+{
+	unsigned long flags;
+
+	*ce = intel_engine_get_hung_context(engine);
+	if (*ce) {
+		intel_engine_clear_hung_context(engine);
+
+		*rq = intel_context_find_active_request_get(*ce);
+		return;
+	}
+
+	/*
+	 * Getting here with GuC enabled means it is a forced error capture
+	 * with no actual hang. So, no need to attempt the execlist search.
+	 */
+	if (intel_uc_uses_guc_submission(&engine->gt->uc))
+		return;
+
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
+	*rq = engine_execlist_find_hung_request(engine);
+	if (*rq)
+		*rq = i915_request_get_rcu(*rq);
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
+}
+
 void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
 {
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 18ffe55282e59..05995c8577bef 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -4150,6 +4150,33 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
+static unsigned long list_count(struct list_head *list)
+{
+	struct list_head *pos;
+	unsigned long count = 0;
+
+	list_for_each(pos, list)
+		count++;
+
+	return count;
+}
+
+void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,
+					 struct i915_request *hung_rq,
+					 struct drm_printer *m)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&engine->sched_engine->lock, flags);
+
+	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
+
+	drm_printf(m, "\tOn hold?: %lu\n",
+		   list_count(&engine->sched_engine->hold));
+
+	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_execlists.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index a1aa92c983a51..cb07488a03764 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -32,6 +32,10 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 							int indent),
 				   unsigned int max);
 
+void intel_execlist_dump_active_requests(struct intel_engine_cs *engine,
+					 struct i915_request *hung_rq,
+					 struct drm_printer *m);
+
 bool
 intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5c73dfa2fb3f6..b20bd6365615b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1596,35 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
 {
 	struct intel_engine_capture_vma *capture = NULL;
 	struct intel_engine_coredump *ee;
-	struct intel_context *ce;
+	struct intel_context *ce = NULL;
 	struct i915_request *rq = NULL;
-	unsigned long flags;
 
 	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, dump_flags);
 	if (!ee)
 		return NULL;
 
-	ce = intel_engine_get_hung_context(engine);
-	if (ce) {
-		intel_engine_clear_hung_context(engine);
-		rq = intel_context_find_active_request_get(ce);
-		if (!rq || !i915_request_started(rq))
-			goto no_request_capture;
-	} else {
-		/*
-		 * Getting here with GuC enabled means it is a forced error capture
-		 * with no actual hang. So, no need to attempt the execlist search.
-		 */
-		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
-			spin_lock_irqsave(&engine->sched_engine->lock, flags);
-			rq = intel_engine_execlist_find_hung_request(engine);
-			if (rq)
-				rq = i915_request_get_rcu(rq);
-			spin_unlock_irqrestore(&engine->sched_engine->lock,
-					       flags);
-		}
-	}
-	if (!rq)
+	intel_engine_get_hung_entity(engine, &ce, &rq);
+	if (!rq || !i915_request_started(rq))
 		goto no_request_capture;
 
 	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
-- 
2.39.0

