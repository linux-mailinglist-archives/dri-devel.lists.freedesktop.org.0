Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF663F812A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA416E527;
	Thu, 26 Aug 2021 03:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B106E4E8;
 Thu, 26 Aug 2021 03:28:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811079"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811079"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738580"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Subject: [PATCH 21/27] drm/i915/guc: Proper xarray usage for contexts_lookup
Date: Wed, 25 Aug 2021 20:23:21 -0700
Message-Id: <20210826032327.18078-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
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

Lock the xarray and take ref to the context if needed.

v2:
 (Checkpatch)
  - Add new line after declaration
 (Daniel Vetter)
  - Correct put / get accounting in xa_for_loops
v3:
 (Checkpatch)
  - Extra new line

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 102 +++++++++++++++---
 1 file changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2aa25cc4ac4b..2c6a6453d332 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -606,8 +606,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 	unsigned long index, flags;
 	bool pending_disable, pending_enable, deregister, destroyed, banned;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		/*
+		 * Corner case where the ref count on the object is zero but and
+		 * deregister G2H was lost. In this case we don't touch the ref
+		 * count and finish the destroy of the context.
+		 */
+		bool do_put = kref_get_unless_zero(&ce->ref);
+
+		xa_unlock(&guc->context_lookup);
+
+		spin_lock(&ce->guc_state.lock);
 
 		/*
 		 * Once we are at this point submission_disabled() is guaranteed
@@ -623,7 +633,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		banned = context_banned(ce);
 		init_sched_state(ce);
 
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		spin_unlock(&ce->guc_state.lock);
+
+		GEM_BUG_ON(!do_put && !destroyed);
 
 		if (pending_enable || destroyed || deregister) {
 			decr_outstanding_submission_g2h(guc);
@@ -646,13 +658,19 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 			}
 			intel_context_sched_disable_unpin(ce);
 			decr_outstanding_submission_g2h(guc);
-			spin_lock_irqsave(&ce->guc_state.lock, flags);
+
+			spin_lock(&ce->guc_state.lock);
 			guc_blocked_fence_complete(ce);
-			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+			spin_unlock(&ce->guc_state.lock);
 
 			intel_context_put(ce);
 		}
+
+		if (do_put)
+			intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static inline bool
@@ -871,16 +889,29 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
 
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
 	}
 
-	xa_for_each(&guc->context_lookup, index, ce)
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!kref_get_unless_zero(&ce->ref))
+			continue;
+
+		xa_unlock(&guc->context_lookup);
+
 		if (intel_context_is_pinned(ce))
 			__guc_reset_context(ce, stalled);
 
+		intel_context_put(ce);
+
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
 }
@@ -955,11 +986,24 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
+
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!kref_get_unless_zero(&ce->ref))
+			continue;
+
+		xa_unlock(&guc->context_lookup);
 
-	xa_for_each(&guc->context_lookup, index, ce)
 		if (intel_context_is_pinned(ce))
 			guc_cancel_context_requests(ce);
 
+		intel_context_put(ce);
+
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	guc_cancel_sched_engine_requests(guc->sched_engine);
 
 	/* GuC is blown away, drop all references to contexts */
@@ -2849,21 +2893,28 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 	struct intel_context *ce;
 	struct i915_request *rq;
 	unsigned long index;
+	unsigned long flags;
 
 	/* Reset called during driver load? GuC not yet initialised! */
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		if (!intel_context_is_pinned(ce))
+		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
+		xa_unlock(&guc->context_lookup);
+
+		if (!intel_context_is_pinned(ce))
+			goto next;
+
 		if (intel_engine_is_virtual(ce->engine)) {
 			if (!(ce->engine->mask & engine->mask))
-				continue;
+				goto next;
 		} else {
 			if (ce->engine != engine)
-				continue;
+				goto next;
 		}
 
 		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
@@ -2873,9 +2924,16 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 			intel_engine_set_hung_context(engine, ce);
 
 			/* Can only cope with one hang at a time... */
-			return;
+			intel_context_put(ce);
+			xa_lock(&guc->context_lookup);
+			goto done;
 		}
+next:
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+done:
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
@@ -2891,23 +2949,34 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
-		if (!intel_context_is_pinned(ce))
+		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
+		xa_unlock(&guc->context_lookup);
+
+		if (!intel_context_is_pinned(ce))
+			goto next;
+
 		if (intel_engine_is_virtual(ce->engine)) {
 			if (!(ce->engine->mask & engine->mask))
-				continue;
+				goto next;
 		} else {
 			if (ce->engine != engine)
-				continue;
+				goto next;
 		}
 
-		spin_lock_irqsave(&ce->guc_active.lock, flags);
+		spin_lock(&ce->guc_active.lock);
 		intel_engine_dump_active_requests(&ce->guc_active.requests,
 						  hung_rq, m);
-		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+		spin_unlock(&ce->guc_active.lock);
+
+next:
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_submission_print_info(struct intel_guc *guc,
@@ -2961,7 +3030,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
 		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
@@ -2980,6 +3051,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 
 		guc_log_context_priority(p, ce);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static struct intel_context *
-- 
2.32.0

