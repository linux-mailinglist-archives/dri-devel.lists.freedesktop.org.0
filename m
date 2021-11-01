Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A665A4412C9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 05:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF77F89B05;
	Mon,  1 Nov 2021 04:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F389B05;
 Mon,  1 Nov 2021 04:40:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="231208245"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="231208245"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2021 21:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="582497818"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2021 21:40:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/3] drm/i915/guc/slpc: Add waitboost functionality for SLPC
Date: Sun, 31 Oct 2021 21:39:36 -0700
Message-Id: <20211101043937.35747-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20211101043937.35747-1-vinay.belgaumkar@intel.com>
References: <20211101043937.35747-1-vinay.belgaumkar@intel.com>
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

Add helper in RPS code for handling SLPC and non-SLPC paths.
When boost is requested in the SLPC path, we can ask GuC to ramp
up the frequency req by setting the minimum frequency to boost freq.
Reset freq back to the min softlimit when there are no more waiters.

v2: Schedule a worker thread which can boost freq from within
an interrupt context as well.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 26 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h         |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 19 +++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  1 +
 drivers/gpu/drm/i915/i915_request.c         |  2 +-
 5 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 5e275f8dda8c..b2d5b1747086 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -936,8 +936,23 @@ void intel_rps_park(struct intel_rps *rps)
 	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
 }
 
+void intel_rps_dec_waiters(struct intel_rps *rps)
+{
+	struct intel_guc_slpc *slpc;
+
+	if (rps_uses_slpc(rps)) {
+		slpc = rps_to_slpc(rps);
+
+		intel_guc_slpc_dec_waiters(slpc);
+	} else {
+		atomic_dec(&rps->num_waiters);
+	}
+}
+
 void intel_rps_boost(struct i915_request *rq)
 {
+	struct intel_guc_slpc *slpc;
+
 	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
 		return;
 
@@ -945,6 +960,17 @@ void intel_rps_boost(struct i915_request *rq)
 	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
 		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
 
+		if (rps_uses_slpc(rps)) {
+			slpc = rps_to_slpc(rps);
+
+			/* Return if old value is non zero */
+			if (atomic_fetch_inc(&slpc->num_waiters))
+				return;
+
+			if (intel_rps_get_requested_frequency(rps) < slpc->boost_freq)
+				schedule_work(&slpc->boost_work);
+		}
+
 		if (atomic_fetch_inc(&rps->num_waiters))
 			return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 11960d64ca82..407e878d5006 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -23,6 +23,7 @@ void intel_rps_disable(struct intel_rps *rps);
 void intel_rps_park(struct intel_rps *rps);
 void intel_rps_unpark(struct intel_rps *rps);
 void intel_rps_boost(struct i915_request *rq);
+void intel_rps_dec_waiters(struct intel_rps *rps);
 
 int intel_rps_set(struct intel_rps *rps, u8 val);
 void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index cc51987b2535..65da454b6693 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -445,7 +445,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	    val > slpc->max_freq_softlimit)
 		return -EINVAL;
 
+	/* Need a lock now since waitboost can be modifying min as well */
+	mutex_lock(&slpc->lock);
+
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+
 		ret = slpc_set_param(slpc,
 				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 				     val);
@@ -458,6 +462,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	if (!ret)
 		slpc->min_freq_softlimit = val;
 
+	mutex_unlock(&slpc->lock);
+
 	return ret;
 }
 
@@ -643,6 +649,19 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
+{
+	/* Return min back to the softlimit.
+	 * This is called during request retire,
+	 * so we don't need to fail that if the
+	 * set_param fails.
+	 */
+	mutex_lock(&slpc->lock);
+	if (atomic_dec_and_test(&slpc->num_waiters))
+		slpc_force_min_freq(slpc, slpc->min_freq_softlimit);
+	mutex_unlock(&slpc->lock);
+}
+
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index b62528647770..d74d6d749bdc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -39,5 +39,6 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
 void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
 void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
+void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 2c3cd6e635b5..08f38e86231d 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -339,7 +339,7 @@ bool i915_request_retire(struct i915_request *rq)
 	}
 
 	if (test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags))
-		atomic_dec(&rq->engine->gt->rps.num_waiters);
+		intel_rps_dec_waiters(&rq->engine->gt->rps);
 
 	/*
 	 * We only loosely track inflight requests across preemption,
-- 
2.25.0

