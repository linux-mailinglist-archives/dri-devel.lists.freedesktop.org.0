Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE866E88B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7425710E5E9;
	Tue, 17 Jan 2023 21:37:01 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB56C10E088;
 Tue, 17 Jan 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673991414; x=1705527414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zCLjq2fwuiIkrwTjl39OJ+CMLrbrn0iy5u/pvPh2sA=;
 b=nQwJd4xb9AkEZfLslL5KaW5vWNExaPzTZfjKlF5IY86lokUCUed7hPrC
 NT28nSsdcDHVA879Gc0pd/ekv2P+pFkanHYWAOhuxmXGKxSeDqnjA9xfJ
 oC3Y6483VYjQSR2AyMCykw0j/SQNAM5Bz6iDA7KXO7Y95gQlUNXfy7NbU
 sAt+amJD+UoZg/CYHDSew7lY9Nxn+h4mCKcg7GlabjTELMLafIDpdi8jZ
 CMgncPV01ECWqTgcvqabopvE0Qg7t79A1jQFIi8A9JO6jpxIsew+DORl/
 5pNiUflj+03213493CDIvsJWzrlCAZh08jowiqOq7bD69+pRTqZiOa11g g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312696224"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312696224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988285020"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988285020"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 13:36:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/5] drm/i915: Fix request locking during error capture &
 debugfs dump
Date: Tue, 17 Jan 2023 13:36:26 -0800
Message-Id: <20230117213630.2897570-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
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
 Chris Wilson <chris@chris-wilson.co.uk>,
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
locking, so it needs an external reference count. So no change to that
code itself but the context version does change.

The only other caller is the code for dumping engine state to debugfs.
That code wasn't previously getting an explicit reference at all as it
does everything while holding the execlist specific spinlock. So that
needs updaing as well as that spinlock doesn't help when using GuC
submission. Rather than trying to conditionally get/put depending on
submission model, just change it to always do the get/put.

In addition, intel_guc_find_hung_context() was not acquiring the
correct spinlock before searching the request list. So fix that up too.

Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset
with GuC")
Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context reset")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
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
 drivers/gpu/drm/i915/gt/intel_context.c           |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  7 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.c             |  5 ++---
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index e94365b08f1ef..df64cf1954c1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -552,6 +552,7 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 
 		active = rq;
 	}
+	active = i915_request_get_rcu(active);
 	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
 
 	return active;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 922f1bb22dc68..517d1fb7ae333 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -2236,10 +2236,13 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
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
+		hung_rq = i915_request_get_rcu(hung_rq);
 	}
 
 	if (hung_rq)
@@ -2250,6 +2253,8 @@ static void engine_dump_active_requests(struct intel_engine_cs *engine, struct d
 	else
 		intel_engine_dump_active_requests(&engine->sched_engine->requests,
 						  hung_rq, m);
+	if (hung_rq)
+		i915_request_put(hung_rq);
 }
 
 void intel_engine_dump(struct intel_engine_cs *engine,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..3b34a82d692be 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4820,6 +4820,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 
 	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		bool found;
+
 		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
@@ -4836,10 +4838,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
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
@@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 			xa_lock(&guc->context_lookup);
 			goto done;
 		}
+
 next:
 		intel_context_put(ce);
 		xa_lock(&guc->context_lookup);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 9d5d5a397b64e..4107a0dfcca7d 100644
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
@@ -1618,13 +1619,11 @@ capture_engine(struct intel_engine_cs *engine,
 		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
 			spin_lock_irqsave(&engine->sched_engine->lock, flags);
 			rq = intel_engine_execlist_find_hung_request(engine);
+			rq = i915_request_get_rcu(rq);
 			spin_unlock_irqrestore(&engine->sched_engine->lock,
 					       flags);
 		}
 	}
-	if (rq)
-		rq = i915_request_get_rcu(rq);
-
 	if (!rq)
 		goto no_request_capture;
 
-- 
2.39.0

