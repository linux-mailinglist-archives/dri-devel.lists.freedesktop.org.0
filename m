Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7D4550C2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 23:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10E6E303;
	Wed, 17 Nov 2021 22:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896C06E283;
 Wed, 17 Nov 2021 22:50:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221285254"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="221285254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 14:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="536467626"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2021 14:50:21 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gt: Spread virtual engines over idle engines
Date: Wed, 17 Nov 2021 14:49:53 -0800
Message-Id: <20211117224955.28999-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Everytime we come to the end of a virtual engine's context, re-randomise
it's siblings[]. As we schedule the siblings' tasklets in the order they
are in the array, earlier entries are executed first (when idle) and so
will be preferred when scheduling the next virtual request. Currently,
we only update the array when switching onto a new idle engine, so we
prefer to stick on the last execute engine, keeping the work compact.
However, it can be beneficial to spread the work out across idle
engines, so choose another sibling as our preferred target at the end of
the context's execution.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 80 ++++++++++++-------
 1 file changed, 52 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index ca03880fa7e4..b95bbc8fb91a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -539,6 +539,41 @@ static void execlists_schedule_in(struct i915_request *rq, int idx)
 	GEM_BUG_ON(intel_context_inflight(ce) != rq->engine);
 }
 
+static void virtual_xfer_context(struct virtual_engine *ve,
+				 struct intel_engine_cs *engine)
+{
+	unsigned int n;
+
+	if (likely(engine == ve->siblings[0]))
+		return;
+
+	if (!intel_engine_has_relative_mmio(engine))
+		lrc_update_offsets(&ve->context, engine);
+
+	/*
+	 * Move the bound engine to the top of the list for
+	 * future execution. We then kick this tasklet first
+	 * before checking others, so that we preferentially
+	 * reuse this set of bound registers.
+	 */
+	for (n = 1; n < ve->num_siblings; n++) {
+		if (ve->siblings[n] == engine) {
+			swap(ve->siblings[n], ve->siblings[0]);
+			break;
+		}
+	}
+}
+
+static int ve_random_sibling(struct virtual_engine *ve)
+{
+	return prandom_u32_max(ve->num_siblings);
+}
+
+static int ve_random_other_sibling(struct virtual_engine *ve)
+{
+	return 1 + prandom_u32_max(ve->num_siblings - 1);
+}
+
 static void
 resubmit_virtual_request(struct i915_request *rq, struct virtual_engine *ve)
 {
@@ -578,8 +613,23 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
 	    rq->execution_mask != engine->mask)
 		resubmit_virtual_request(rq, ve);
 
-	if (READ_ONCE(ve->request))
+	/*
+	 * Reschedule with a new "preferred" sibling.
+	 *
+	 * The tasklets are executed in the order of ve->siblings[], so
+	 * siblings[0] receives preferrential treatment of greedily checking
+	 * for execution of the virtual engine. At this point, the virtual
+	 * engine is no longer in the current GPU cache due to idleness or
+	 * contention, so it can be executed on any without penalty. We
+	 * re-randomise at this point in order to spread light loads across
+	 * the system, heavy overlapping loads will continue to be greedily
+	 * executed by the first available engine.
+	 */
+	if (READ_ONCE(ve->request)) {
+		virtual_xfer_context(ve,
+				     ve->siblings[ve_random_other_sibling(ve)]);
 		tasklet_hi_schedule(&ve->base.sched_engine->tasklet);
+	}
 }
 
 static void __execlists_schedule_out(struct i915_request * const rq,
@@ -1030,32 +1080,6 @@ first_virtual_engine(struct intel_engine_cs *engine)
 	return NULL;
 }
 
-static void virtual_xfer_context(struct virtual_engine *ve,
-				 struct intel_engine_cs *engine)
-{
-	unsigned int n;
-
-	if (likely(engine == ve->siblings[0]))
-		return;
-
-	GEM_BUG_ON(READ_ONCE(ve->context.inflight));
-	if (!intel_engine_has_relative_mmio(engine))
-		lrc_update_offsets(&ve->context, engine);
-
-	/*
-	 * Move the bound engine to the top of the list for
-	 * future execution. We then kick this tasklet first
-	 * before checking others, so that we preferentially
-	 * reuse this set of bound registers.
-	 */
-	for (n = 1; n < ve->num_siblings; n++) {
-		if (ve->siblings[n] == engine) {
-			swap(ve->siblings[n], ve->siblings[0]);
-			break;
-		}
-	}
-}
-
 static void defer_request(struct i915_request *rq, struct list_head * const pl)
 {
 	LIST_HEAD(list);
@@ -3590,7 +3614,7 @@ static void virtual_engine_initial_hint(struct virtual_engine *ve)
 	 * NB This does not force us to execute on this engine, it will just
 	 * typically be the first we inspect for submission.
 	 */
-	swp = prandom_u32_max(ve->num_siblings);
+	swp = ve_random_sibling(ve);
 	if (swp)
 		swap(ve->siblings[swp], ve->siblings[0]);
 }
-- 
2.34.0

