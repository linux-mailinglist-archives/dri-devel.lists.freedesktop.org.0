Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5630435420
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE036E3AE;
	Wed, 20 Oct 2021 19:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621D6E3AC;
 Wed, 20 Oct 2021 19:52:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289715863"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="289715863"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="445056202"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 20 Oct 2021 12:52:42 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/3] drm/i915/guc/slpc: Add waitboost functionality for SLPC
Date: Wed, 20 Oct 2021 12:52:15 -0700
Message-Id: <20211020195216.36173-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
References: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
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

Add helpers in RPS code for handling SLPC and non-SLPC cases.
When a boost is requested in the SLPC case, we can ask GuC to ramp
up the frequency by setting the minimum frequency to RP0. Reset the
frequency back to the min softlimit when there are no more waiters.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 13 ++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h         |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 28 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 ++
 drivers/gpu/drm/i915/i915_request.c         |  2 +-
 5 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 172de6c9f949..023e9c0b9f4a 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -935,6 +935,16 @@ void intel_rps_park(struct intel_rps *rps)
 	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
 }
 
+void intel_rps_update_waiters(struct intel_rps *rps)
+{
+	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+
+	if (rps_uses_slpc(rps))
+		intel_guc_slpc_update_waiters(slpc);
+	else
+		atomic_dec(&rps->num_waiters);
+}
+
 void intel_rps_boost(struct i915_request *rq)
 {
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
@@ -944,6 +954,9 @@ void intel_rps_boost(struct i915_request *rq)
 	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
 		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
 
+		if (rps_uses_slpc(rps))
+			return intel_guc_slpc_boost(rps_to_slpc(rps));
+
 		if (atomic_fetch_inc(&rps->num_waiters))
 			return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 11960d64ca82..4ca9924cb5ed 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -23,6 +23,7 @@ void intel_rps_disable(struct intel_rps *rps);
 void intel_rps_park(struct intel_rps *rps);
 void intel_rps_unpark(struct intel_rps *rps);
 void intel_rps_boost(struct i915_request *rq);
+void intel_rps_update_waiters(struct intel_rps *rps);
 
 int intel_rps_set(struct intel_rps *rps, u8 val);
 void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 4a2acb8f2cc7..a104371a8b79 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -598,6 +598,34 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+void intel_guc_slpc_boost(struct intel_guc_slpc *slpc)
+{
+	/* Raise min freq to boost. It's possible that
+	 * this is greater than current max. But it will
+	 * certainly be limited by RP0. An error setting
+	 * the min param is not fatal.
+	 */
+	if (!slpc->num_waiters)
+		slpc_set_param(slpc,
+			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+			       slpc->boost_freq);
+
+	slpc->num_waiters++;
+}
+
+void intel_guc_slpc_update_waiters(struct intel_guc_slpc *slpc)
+{
+	/* Return min back to the softlimit.
+	 * This is called during request retire,
+	 * so we don't need to fail that if the
+	 * set_param fails.
+	 */
+	if (!(--slpc->num_waiters))
+		slpc_set_param(slpc,
+			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+			       slpc->min_freq_softlimit);
+}
+
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index e45054d5b9b4..25093dfdea0b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -38,5 +38,7 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
 void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
+void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
+void intel_guc_slpc_update_waiters(struct intel_guc_slpc *slpc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 2c3cd6e635b5..ef056137dbe1 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -339,7 +339,7 @@ bool i915_request_retire(struct i915_request *rq)
 	}
 
 	if (test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags))
-		atomic_dec(&rq->engine->gt->rps.num_waiters);
+		intel_rps_update_waiters(&rq->engine->gt->rps);
 
 	/*
 	 * We only loosely track inflight requests across preemption,
-- 
2.25.0

