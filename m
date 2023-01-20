Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73069675A42
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE7210EAB1;
	Fri, 20 Jan 2023 16:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3704610EAAC;
 Fri, 20 Jan 2023 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232892; x=1705768892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4sks/tWjjU94q+T+5oqy1RrpX6yVaDhq0CWj3DZ+5k=;
 b=FIhEsFfTjIFBUDCVq0h/CoKvCJ1xnfZZJE9bDwH1AcNtGiE7Gd46B3H6
 Al99aqfceK36spkVzFMO32tKkASvrpGzmNussAklEwh58mw7SZWjlQYMV
 He8H65kS8LOst7VE6NVVH3WUZeR+DGDln8gACypkJmT8HukUQfUYLHZmN
 f7X76HQCWyZGT6ZCzSruz9xDCYgqf2aZYKS61Os7VmVNQVUdFQhFriA5a
 vZDyx/Yl9t5OstIKRnopxQyvvIcpkcG4C5SInmXmBRy+koAoKpXjOktoR
 bbqvoq6jXunlQnkQkro0WCGNkF/nrBFEfhEumckq81aJGgrXRXQQ2QlQQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325656830"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="325656830"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749398897"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="749398897"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 08:41:30 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfh023485; Fri, 20 Jan 2023 16:41:30 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915/guc: Update GuC messages in
 intel_guc_submission.c
Date: Fri, 20 Jan 2023 17:40:49 +0100
Message-Id: <20230120164050.1765-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 60 ++++++++-----------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e4..bb98206304ee 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -27,6 +27,7 @@
 
 #include "intel_guc_ads.h"
 #include "intel_guc_capture.h"
+#include "intel_guc_print.h"
 #include "intel_guc_submission.h"
 
 #include "i915_drv.h"
@@ -1443,8 +1444,7 @@ static void guc_init_engine_stats(struct intel_guc *guc)
 		int ret = guc_action_enable_usage_stats(guc);
 
 		if (ret)
-			drm_err(&gt->i915->drm,
-				"Failed to enable usage stats: %d!\n", ret);
+			guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
 	}
 }
 
@@ -3585,8 +3585,7 @@ static int guc_request_alloc(struct i915_request *rq)
 		intel_context_sched_disable_unpin(ce);
 	else if (intel_context_is_closed(ce))
 		if (wait_for(context_close_done(ce), 1500))
-			drm_warn(&guc_to_gt(guc)->i915->drm,
-				 "timed out waiting on context sched close before realloc\n");
+			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
@@ -4349,11 +4348,14 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
 
 	ret = intel_guc_send(guc, (u32 *)&policy->h2g,
 			     __guc_scheduling_policy_action_size(policy));
-	if (ret < 0)
+	if (ret < 0) {
+		guc_probe_error(guc, "Failed to configure global scheduling policies: %pe!\n",
+				ERR_PTR(ret));
 		return ret;
+	}
 
 	if (ret != policy->count) {
-		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
+		guc_warn(guc, "global scheduler policy processed %d of %d KLVs!",
 			 ret, policy->count);
 		if (ret > policy->count)
 			return -EPROTO;
@@ -4367,7 +4369,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 	struct scheduling_policy policy;
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
-	int ret = 0;
+	int ret;
 
 	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
 		return 0;
@@ -4385,10 +4387,6 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 						yield, ARRAY_SIZE(yield));
 
 		ret = __guc_action_set_scheduling_policies(guc, &policy);
-		if (ret)
-			i915_probe_error(gt->i915,
-					 "Failed to configure global scheduling policies: %pe!\n",
-					 ERR_PTR(ret));
 	}
 
 	return ret;
@@ -4487,21 +4485,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
 	struct intel_context *ce;
 
 	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid ctx_id %u\n", ctx_id);
+		guc_err(guc, "Invalid ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	ce = __get_context(guc, ctx_id);
 	if (unlikely(!ce)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is NULL, ctx_id %u\n", ctx_id);
+		guc_err(guc, "Context is NULL, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	if (unlikely(intel_context_is_child(ce))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is child, ctx_id %u\n", ctx_id);
+		guc_err(guc, "Context is child, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
@@ -4516,7 +4511,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4568,7 +4563,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4580,8 +4575,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (unlikely(context_destroyed(ce) ||
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, ctx_id %u\n",
+		guc_err(guc, "Bad context sched_state 0x%x, ctx_id %u\n",
 			ce->guc_state.sched_state, ctx_id);
 		return -EPROTO;
 	}
@@ -4669,7 +4663,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_info(&guc_to_gt(guc)->i915->drm,
+		guc_info(guc,
 			 "Ignoring context reset notification of exiting context 0x%04X on %s",
 			 ce->guc_id.id, ce->engine->name);
 	}
@@ -4683,7 +4677,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	int ctx_id;
 
 	if (unlikely(len != 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4716,13 +4710,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 	u32 status;
 
 	if (unlikely(len != 1)) {
-		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_dbg(guc, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
 	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
 	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
-		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
+		guc_warn(guc, "G2H-Error capture no space");
 
 	intel_guc_capture_process(guc);
 
@@ -4765,13 +4759,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len)
 {
 	struct intel_engine_cs *engine;
-	struct intel_gt *gt = guc_to_gt(guc);
 	u8 guc_class, instance;
 	u32 reason;
 	unsigned long flags;
 
 	if (unlikely(len != 3)) {
-		drm_err(&gt->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4781,8 +4774,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 	engine = intel_guc_lookup_engine(guc, guc_class, instance);
 	if (unlikely(!engine)) {
-		drm_err(&gt->i915->drm,
-			"Invalid engine %d:%d", guc_class, instance);
+		guc_err(guc, "Invalid engine %d:%d", guc_class, instance);
 		return -EPROTO;
 	}
 
@@ -4790,7 +4782,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * This is an unexpected failure of a hardware feature. So, log a real
 	 * error message not just the informational that comes with the reset.
 	 */
-	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
+	guc_err(guc, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
 		guc_class, instance, engine->name, reason);
 
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
@@ -5342,8 +5334,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 
 		GEM_BUG_ON(!is_power_of_2(sibling->mask));
 		if (sibling->mask & ve->base.mask) {
-			DRM_DEBUG("duplicate %s entry in load balancer\n",
-				  sibling->name);
+			guc_dbg(guc, "duplicate %s entry in load balancer\n",
+				sibling->name);
 			err = -EINVAL;
 			goto err_put;
 		}
@@ -5352,8 +5344,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		ve->base.logical_mask |= sibling->logical_mask;
 
 		if (n != 0 && ve->base.class != sibling->class) {
-			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
-				  sibling->class, ve->base.class);
+			guc_dbg(guc, "invalid mixing of engine class, sibling %d, already %d\n",
+				sibling->class, ve->base.class);
 			err = -EINVAL;
 			goto err_put;
 		} else if (n == 0) {
-- 
2.25.1

