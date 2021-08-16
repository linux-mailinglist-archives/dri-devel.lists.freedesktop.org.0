Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9A3ED82A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80E889FC3;
	Mon, 16 Aug 2021 13:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658E889E3F;
 Mon, 16 Aug 2021 13:57:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607084"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607084"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:57:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091188"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:57:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 19/22] drm/i915/guc: Proper xarray usage for contexts_lookup
Date: Mon, 16 Aug 2021 06:51:36 -0700
Message-Id: <20210816135139.10060-20-matthew.brost@intel.com>
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

Lock the xarray and take ref to the context if needed.

v2:
 (Checkpatch)
  - Add new line after declaration

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 84 ++++++++++++++++---
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ba19b99173fc..2ecb2f002bed 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -599,8 +599,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
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
@@ -616,7 +626,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 		banned = context_banned(ce);
 		init_sched_state(ce);
 
-		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		spin_unlock(&ce->guc_state.lock);
+
+		GEM_BUG_ON(!do_put && !destroyed);
 
 		if (pending_enable || destroyed || deregister) {
 			atomic_dec(&guc->outstanding_submission_g2h);
@@ -645,7 +657,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
 
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
@@ -866,16 +883,26 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
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
+		intel_context_get(ce);
+		xa_unlock(&guc->context_lookup);
+
 		if (intel_context_is_pinned(ce))
 			__guc_reset_context(ce, stalled);
 
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	/* GuC is blown away, drop all references to contexts */
 	xa_destroy(&guc->context_lookup);
 }
@@ -950,11 +977,21 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
+
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	xa_for_each(&guc->context_lookup, index, ce) {
+		intel_context_get(ce);
+		xa_unlock(&guc->context_lookup);
 
-	xa_for_each(&guc->context_lookup, index, ce)
 		if (intel_context_is_pinned(ce))
 			guc_cancel_context_requests(ce);
 
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
+	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	guc_cancel_sched_engine_requests(guc->sched_engine);
 
 	/* GuC is blown away, drop all references to contexts */
@@ -2848,21 +2885,26 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 	struct intel_context *ce;
 	struct i915_request *rq;
 	unsigned long index;
+	unsigned long flags;
 
 	/* Reset called during driver load? GuC not yet initialised! */
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		intel_context_get(ce);
+		xa_unlock(&guc->context_lookup);
+
 		if (!intel_context_is_pinned(ce))
-			continue;
+			goto next;
 
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
@@ -2872,9 +2914,17 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
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
+
 	}
+done:
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
@@ -2890,23 +2940,32 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 	if (unlikely(!guc_submission_initialized(guc)))
 		return;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		intel_context_get(ce);
+		xa_unlock(&guc->context_lookup);
+
 		if (!intel_context_is_pinned(ce))
-			continue;
+			goto next;
 
 		if (intel_engine_is_virtual(ce->engine)) {
 			if (!(ce->engine->mask & engine->mask))
-				continue;
+				goto next;
 		} else {
 			if (ce->engine != engine)
-				continue;
+				goto next;
 		}
 
 		spin_lock_irqsave(&ce->guc_active.lock, flags);
 		intel_engine_dump_active_requests(&ce->guc_active.requests,
 						  hung_rq, m);
 		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+
+next:
+		intel_context_put(ce);
+		xa_lock(&guc->context_lookup);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 void intel_guc_submission_print_info(struct intel_guc *guc,
@@ -2960,7 +3019,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long index;
+	unsigned long flags;
 
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
 		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
@@ -2979,6 +3040,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 
 		guc_log_context_priority(p, ce);
 	}
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static struct intel_context *
-- 
2.32.0

