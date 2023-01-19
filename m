Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC06731F6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 07:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753F10E8BE;
	Thu, 19 Jan 2023 06:50:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDCF10E8B2;
 Thu, 19 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674111033; x=1705647033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PC1u/s3rUs5S4gs/JOT+D60NG4j/0HY+7M6DY6zg/CE=;
 b=aqn1P5yztnXTLzU+gT7eSaimFKrNgETnRCJi9dFwCvO5YSo7bNNuh0iT
 BZ2zuBSg7zwRyccLdQfiKcYxuTLgGTS4SDfpZolItcDl2Hgthhuq5eyXp
 tdDfiNP+mm4ZQUzYXcaLOa8G9xWt+RPVnX/YcSLF7sbh78iTpLb6YL5zN
 nNDw2S/hbV6P6BpgAo+E5ijJbul92ZvTf9utBM1o6BWDLyerVkK3regRA
 aYScpWRdVIgUZ5L7hxEXGIcDVLXigtOgU9yymqcpFW9hmGsyb9tsFwlHh
 xdun59xaxycGW4EBz4odgaHl7Jo6SbF6vP0DvXZuyVBmyJ8k9215+jbbi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323897861"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="323897861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 22:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723385735"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="723385735"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 22:50:20 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/6] drm/i915: Fix request locking during error capture &
 debugfs dump
Date: Wed, 18 Jan 2023 22:49:55 -0800
Message-Id: <20230119065000.1661857-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
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
---
 drivers/gpu/drm/i915/gt/intel_context.c           |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  8 +++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.c             | 12 ++++++------
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index e94365b08f1ef..e7c5509c48ef1 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -552,6 +552,8 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 
 		active = rq;
 	}
+	if (active)
+		active = i915_request_get_rcu(active);
 	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
 
 	return active;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 922f1bb22dc68..6a082658d0082 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2236,10 +2236,14 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
 	if (guc) {
 		ce = intel_engine_get_hung_context(engine);
-		if (ce)
+		if (ce) {
+			/* This will reference count the request (if found) */
 			hung_rq = intel_context_find_active_request(ce);
+		}
 	} else {
 		hung_rq = intel_engine_execlist_find_hung_request(engine);
+		if (hung_rq)
+			hung_rq = i915_request_get_rcu(hung_rq);
 	}
 
 	if (hung_rq)
@@ -2250,6 +2254,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	else
 		intel_engine_dump_active_requests(&engine->sched_engine->requests,
 						  hung_rq, m);
+	if (hung_rq)
+		i915_request_put(hung_rq);
 }
 
 void intel_engine_dump(struct intel_engine_cs *engine,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..d123cbd90a919 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1702,6 +1702,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 			goto next_context;
 
 		guilty = false;
+		/* NB: This gets a reference to the request */
 		rq = intel_context_find_active_request(ce);
 		if (!rq) {
 			head = ce->ring->tail;
@@ -1715,6 +1716,7 @@ static void __guc_reset_context(struct intel_context *ce, intel_engine_mask_t st
 		head = intel_ring_wrap(ce->ring, rq->head);
 
 		__i915_request_reset(rq, guilty);
+		i915_request_put(rq);
 out_replay:
 		guc_reset_state(ce, head, guilty);
 next_context:
@@ -4820,6 +4822,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 
 	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		bool found;
+
 		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
@@ -4836,10 +4840,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
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
@@ -4847,6 +4859,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 			xa_lock(&guc->context_lookup);
 			goto done;
 		}
+
 next:
 		intel_context_put(ce);
 		xa_lock(&guc->context_lookup);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 9d5d5a397b64e..7ea36478ee52d 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1607,6 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
 	ce = intel_engine_get_hung_context(engine);
 	if (ce) {
 		intel_engine_clear_hung_context(engine);
+		/* This will reference count the request (if found) */
 		rq = intel_context_find_active_request(ce);
 		if (!rq || !i915_request_started(rq))
 			goto no_request_capture;
@@ -1618,21 +1619,18 @@ capture_engine(struct intel_engine_cs *engine,
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
 
@@ -1642,6 +1640,8 @@ capture_engine(struct intel_engine_cs *engine,
 	return ee;
 
 no_request_capture:
+	if (rq)
+		i915_request_put(rq);
 	kfree(ee);
 	return NULL;
 }
-- 
2.39.0

