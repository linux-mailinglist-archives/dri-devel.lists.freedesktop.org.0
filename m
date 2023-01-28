Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532267FAAA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 21:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0610E2C9;
	Sat, 28 Jan 2023 19:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274B910E1F4;
 Sat, 28 Jan 2023 19:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935965; x=1706471965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sYzS5ORKowzdJa5RLvjltXSXytDsflD6HVf6plVr+nk=;
 b=F55zOX8rkl0cGfrmQgoRmXPJ0XoPPcdf+DEr8bcgVDA9ZcT3GybiyUj9
 fdEKNyA4bVzCbaTdMcSMYiUk5Yi1DLDX3I6da3fmFD78m+PkNcKWpI9ib
 SEZsgltv2eORLeInkmQnEkD93fvP9TV/E7LcnnoM4n8uuGuYbvISWaMdk
 wUGKLOeC7rKrlpkIiAozjou98ZBY9HiSXQQsRA991RM47bmmSWZxtXVON
 ImwfE2U+79fi5a8z0daDbmpdfrSkr/50/DsoA0mEWwY+vrXM0s9f5/aj5
 6rGRQziEKWIeghM9pu4C3bCrLC0VOCdjIPP4Q1cw5hDjn81cVcs+e/DwZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978124"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978124"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567948"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567948"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:22 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3BE04333EF;
 Sat, 28 Jan 2023 19:59:22 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/i915/guc: Update GuC messages in
 intel_guc_submission.c
Date: Sat, 28 Jan 2023 20:59:06 +0100
Message-Id: <20230128195907.1837-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

v2: improve few existing messages

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++++-----------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2e6ab0bb5c2b..53f3ed3244d5 100644
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
 
@@ -3586,8 +3586,7 @@ static int guc_request_alloc(struct i915_request *rq)
 		intel_context_sched_disable_unpin(ce);
 	else if (intel_context_is_closed(ce))
 		if (wait_for(context_close_done(ce), 1500))
-			drm_warn(&guc_to_gt(guc)->i915->drm,
-				 "timed out waiting on context sched close before realloc\n");
+			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
@@ -4350,11 +4349,14 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
 
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
@@ -4368,7 +4370,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 	struct scheduling_policy policy;
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
-	int ret = 0;
+	int ret;
 
 	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
 		return 0;
@@ -4386,10 +4388,6 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 						yield, ARRAY_SIZE(yield));
 
 		ret = __guc_action_set_scheduling_policies(guc, &policy);
-		if (ret)
-			i915_probe_error(gt->i915,
-					 "Failed to configure global scheduling policies: %pe!\n",
-					 ERR_PTR(ret));
 	}
 
 	return ret;
@@ -4488,21 +4486,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
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
 
@@ -4517,7 +4512,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4569,7 +4564,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4581,8 +4576,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (unlikely(context_destroyed(ce) ||
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, ctx_id %u\n",
+		guc_err(guc, "Bad context sched_state 0x%x, ctx_id %u\n",
 			ce->guc_state.sched_state, ctx_id);
 		return -EPROTO;
 	}
@@ -4674,8 +4668,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_info(&guc_to_gt(guc)->i915->drm,
-			 "Ignoring context reset notification of exiting context 0x%04X on %s",
+		guc_info(guc, "Ignoring context reset notification of exiting context 0x%04X on %s",
 			 ce->guc_id.id, ce->engine->name);
 	}
 }
@@ -4688,7 +4681,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	int ctx_id;
 
 	if (unlikely(len != 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4721,13 +4714,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 	u32 status;
 
 	if (unlikely(len != 1)) {
-		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_dbg(guc, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
 	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
 	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
-		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
+		guc_warn(guc, "No space for error capture");
 
 	intel_guc_capture_process(guc);
 
@@ -4783,13 +4776,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
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
 
@@ -4799,8 +4791,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 	engine = intel_guc_lookup_engine(guc, guc_class, instance);
 	if (unlikely(!engine)) {
-		drm_err(&gt->i915->drm,
-			"Invalid engine %d:%d", guc_class, instance);
+		guc_err(guc, "Invalid engine %d:%d", guc_class, instance);
 		return -EPROTO;
 	}
 
@@ -4808,7 +4799,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * This is an unexpected failure of a hardware feature. So, log a real
 	 * error message not just the informational that comes with the reset.
 	 */
-	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
+	guc_err(guc, "Engine reset failed on %d:%d (%s) because 0x%08X",
 		guc_class, instance, engine->name, reason);
 
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
@@ -5371,8 +5362,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 
 		GEM_BUG_ON(!is_power_of_2(sibling->mask));
 		if (sibling->mask & ve->base.mask) {
-			DRM_DEBUG("duplicate %s entry in load balancer\n",
-				  sibling->name);
+			guc_dbg(guc, "duplicate %s entry in load balancer\n",
+				sibling->name);
 			err = -EINVAL;
 			goto err_put;
 		}
@@ -5381,8 +5372,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
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

