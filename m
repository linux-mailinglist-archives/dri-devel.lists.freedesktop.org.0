Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51289676187
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5910EB22;
	Fri, 20 Jan 2023 23:28:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CE910EB20;
 Fri, 20 Jan 2023 23:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674257329; x=1705793329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T9AYqIYZKt7e7W+7KvP3P+HNdzseaLMw4tUBhGGSJJI=;
 b=Ziuc7cSvzTx3vSF+N/k2IGB5iSKBPibXuSu2EVBXRPtnpvhpnQ5f2XBG
 P0MSx693zRZDLscwenVUG2sqflDCt3gaGwcSA5zGqoiB/9VDQQPW77iBw
 8kG1E9q4+7huttzV4vFNW3oq5VOqHqgDzjS4d/7mEwhMsRGzg7JA2HKZA
 Fa3so6RceLuYlzFyMURIJpQy5ZtfbF3DeiKHZZlpsAiZkm2dmGsVb3Bvb
 e9rIrf9XrLualYEyRkVIq8EAvo75J1NIOa5C64V0qQNKZ3M42Nh5G40TM
 eG4z8KWHTbLsfoh+v2mw25g/Dyf7m+CPBZf2XOid/28wEN3PufVVfjlR1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324413560"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="324413560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693021608"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="693021608"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 15:28:48 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 1/7] drm/i915: Fix request locking during error capture &
 debugfs dump
Date: Fri, 20 Jan 2023 15:28:25 -0800
Message-Id: <20230120232831.28177-2-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When GuC support was added to error capture, the locking around the
request object was broken. Fix it up.

The context based search manages the spinlocking around the search
internally. So it needs to grab the reference count internally as
well. The execlist only request based search relies on external
locking, so it needs an external reference count but within the
spinlock not outside it.

The only other caller of the context based search is the code for
dumping engine state to debugfs. That code wasn't previously getting
an explicit reference at all as it does everything while holding the
execlist specific spinlock. So, that needs updaing as well as that
spinlock doesn't help when using GuC submission. Rather than trying to
conditionally get/put depending on submission model, just change it to
always do the get/put.

In addition, intel_guc_find_hung_context() was not acquiring the
correct spinlock before searching the request list. So fix that up
too. While at it, add some extra whitespace padding for readability.

v2: Explicitly document adding an extra blank line in some dense code
(Andy Shevchenko). Fix multiple potential null pointer derefs in case
of no request found (some spotted by Tvrtko, but there was more!).
Also fix a leaked request in case of !started and another in
__guc_reset_context now that intel_context_find_active_request is
actually reference counting the returned request.
v3: Add a _get suffix to intel_context_find_active_request now that it
grabs a reference (Daniele).

Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Michael Cheng <michael.cheng@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c           |  4 +++-
 drivers/gpu/drm/i915/gt/intel_context.h           |  3 +--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  6 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c             | 13 ++++++-------
 5 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index e94365b08f1ef..4285c1c71fa12 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -528,7 +528,7 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 	return rq;
 }
 
-struct i915_request *intel_context_find_active_request(struct intel_context *ce)
+struct i915_request *intel_context_find_active_request_get(struct intel_context *ce)
 {
 	struct intel_context *parent = intel_context_to_parent(ce);
 	struct i915_request *rq, *active = NULL;
@@ -552,6 +552,8 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 
 		active = rq;
 	}
+	if (active)
+		active = i915_request_get_rcu(active);
 	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
 
 	return active;
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index fb62b7b8cbcda..ccc80c6607ca8 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -268,8 +268,7 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
 
 struct i915_request *intel_context_create_request(struct intel_context *ce);
 
-struct i915_request *
-intel_context_find_active_request(struct intel_context *ce);
+struct i915_request *intel_context_find_active_request_get(struct intel_context *ce);
 
 static inline bool intel_context_is_barrier(const struct intel_context *ce)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 922f1bb22dc68..fbc0a81617e89 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2237,9 +2237,11 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	if (guc) {
 		ce = intel_engine_get_hung_context(engine);
 		if (ce)
-			hung_rq = intel_context_find_active_request(ce);
+			hung_rq = intel_context_find_active_request_get(ce);
 	} else {
 		hung_rq = intel_engine_execlist_find_hung_request(engine);
+		if (hung_rq)
+			hung_rq = i915_request_get_rcu(hung_rq);
 	}
 
 	if (hung_rq)
@@ -2250,6 +2252,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	else
 		intel_engine_dump_active_requests(&engine->sched_engine->requests,
 						  hung_rq, m);
+	if (hung_rq)
+		i915_request_put(hung_rq);
 }
 
 void intel_engine_dump(struct intel_engine_cs *engine,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..ad4b2848b0f83 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1702,7 +1702,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 			goto next_context;
 
 		guilty = false;
-		rq = intel_context_find_active_request(ce);
+		rq = intel_context_find_active_request_get(ce);
 		if (!rq) {
 			head = ce->ring->tail;
 			goto out_replay;
@@ -1715,6 +1715,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 		head = intel_ring_wrap(ce->ring, rq->head);
 
 		__i915_request_reset(rq, guilty);
+		i915_request_put(rq);
 out_replay:
 		guc_reset_state(ce, head, guilty);
 next_context:
@@ -4820,6 +4821,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 
 	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		bool found;
+
 		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
@@ -4836,10 +4839,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 				goto next;
 		}
 
+		found = false;
+		spin_lock(&ce->guc_state.lock);
 		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
 			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
 				continue;
 
+			found = true;
+			break;
+		}
+		spin_unlock(&ce->guc_state.lock);
+
+		if (found) {
 			intel_engine_set_hung_context(engine, ce);
 
 			/* Can only cope with one hang at a time... */
@@ -4847,6 +4858,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 			xa_lock(&guc->context_lookup);
 			goto done;
 		}
+
 next:
 		intel_context_put(ce);
 		xa_lock(&guc->context_lookup);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 9d5d5a397b64e..5c73dfa2fb3f6 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1607,7 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
 	ce = intel_engine_get_hung_context(engine);
 	if (ce) {
 		intel_engine_clear_hung_context(engine);
-		rq = intel_context_find_active_request(ce);
+		rq = intel_context_find_active_request_get(ce);
 		if (!rq || !i915_request_started(rq))
 			goto no_request_capture;
 	} else {
@@ -1618,21 +1618,18 @@ capture_engine(struct intel_engine_cs *engine,
 		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
 			spin_lock_irqsave(&engine->sched_engine->lock, flags);
 			rq = intel_engine_execlist_find_hung_request(engine);
+			if (rq)
+				rq = i915_request_get_rcu(rq);
 			spin_unlock_irqrestore(&engine->sched_engine->lock,
 					       flags);
 		}
 	}
-	if (rq)
-		rq = i915_request_get_rcu(rq);
-
 	if (!rq)
 		goto no_request_capture;
 
 	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
-	if (!capture) {
-		i915_request_put(rq);
+	if (!capture)
 		goto no_request_capture;
-	}
 	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
 		intel_guc_capture_get_matching_node(engine->gt, ee, ce);
 
@@ -1642,6 +1639,8 @@ capture_engine(struct intel_engine_cs *engine,
 	return ee;
 
 no_request_capture:
+	if (rq)
+		i915_request_put(rq);
 	kfree(ee);
 	return NULL;
 }
-- 
2.39.0

