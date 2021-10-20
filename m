Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC4435421
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C706E3D3;
	Wed, 20 Oct 2021 19:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9689FF9;
 Wed, 20 Oct 2021 19:52:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289715870"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="289715870"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="445056217"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 20 Oct 2021 12:52:44 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 3/3] drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
Date: Wed, 20 Oct 2021 12:52:16 -0700
Message-Id: <20211020195216.36173-4-vinay.belgaumkar@intel.com>
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

Add a helper to sort through the SLPC/RPS cases of get/set methods.
Boost frequency will be modified as long as it is within the constraints
of RP0 and if it is different from the existing one. We will set min
freq to boost only if there is an active waiter.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 44 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h         |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 18 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  1 +
 drivers/gpu/drm/i915/i915_sysfs.c           | 21 ++--------
 5 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 023e9c0b9f4a..19c57aac9553 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -935,6 +935,50 @@ void intel_rps_park(struct intel_rps *rps)
 	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
 }
 
+u32 intel_rps_get_boost_frequency(struct intel_rps *rps)
+{
+	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
+
+	if (rps_uses_slpc(rps))
+		return slpc->boost_freq;
+	else
+		return intel_gpu_freq(rps, rps->boost_freq);
+}
+
+static int set_boost_freq(struct intel_rps *rps, u32 val)
+{
+	bool boost = false;
+
+	/* Validate against (static) hardware limits */
+	val = intel_freq_opcode(rps, val);
+	if (val < rps->min_freq || val > rps->max_freq)
+		return -EINVAL;
+
+	mutex_lock(&rps->lock);
+	if (val != rps->boost_freq) {
+		rps->boost_freq = val;
+		boost = atomic_read(&rps->num_waiters);
+	}
+	mutex_unlock(&rps->lock);
+	if (boost)
+		schedule_work(&rps->work);
+
+	return 0;
+}
+
+int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq)
+{
+	struct intel_guc_slpc *slpc;
+
+	if (rps_uses_slpc(rps)) {
+		slpc = rps_to_slpc(rps);
+
+		return intel_guc_slpc_set_boost_freq(slpc, freq);
+	} else {
+		return set_boost_freq(rps, freq);
+	}
+}
+
 void intel_rps_update_waiters(struct intel_rps *rps)
 {
 	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 4ca9924cb5ed..ce81094cf58e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -24,6 +24,8 @@ void intel_rps_park(struct intel_rps *rps);
 void intel_rps_unpark(struct intel_rps *rps);
 void intel_rps_boost(struct i915_request *rq);
 void intel_rps_update_waiters(struct intel_rps *rps);
+u32 intel_rps_get_boost_frequency(struct intel_rps *rps);
+int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq);
 
 int intel_rps_set(struct intel_rps *rps, u8 val);
 void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index a104371a8b79..7881bc1a5af8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -613,6 +613,24 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc)
 	slpc->num_waiters++;
 }
 
+int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	if (val < slpc->min_freq || val > slpc->rp0_freq)
+		return -EINVAL;
+
+	if (val != slpc->boost_freq) {
+		slpc->boost_freq = val;
+
+		/* Apply only if there are active waiters */
+		if (slpc->num_waiters)
+			return slpc_set_param(slpc,
+					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					      slpc->boost_freq);
+	}
+
+ 	return 0;
+}
+
 void intel_guc_slpc_update_waiters(struct intel_guc_slpc *slpc)
 {
 	/* Return min back to the softlimit.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 25093dfdea0b..d8191f2b965b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -34,6 +34,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
+int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index cdf0e9c6fd73..c62eb0c8eb45 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -280,7 +280,7 @@ static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribu
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &i915->gt.rps;
 
-	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->boost_freq));
+	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
 }
 
 static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
@@ -289,7 +289,6 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &dev_priv->gt.rps;
-	bool boost = false;
 	ssize_t ret;
 	u32 val;
 
@@ -297,21 +296,9 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
 	if (ret)
 		return ret;
 
-	/* Validate against (static) hardware limits */
-	val = intel_freq_opcode(rps, val);
-	if (val < rps->min_freq || val > rps->max_freq)
-		return -EINVAL;
-
-	mutex_lock(&rps->lock);
-	if (val != rps->boost_freq) {
-		rps->boost_freq = val;
-		boost = atomic_read(&rps->num_waiters);
-	}
-	mutex_unlock(&rps->lock);
-	if (boost)
-		schedule_work(&rps->work);
-
-	return count;
+	ret = intel_rps_set_boost_frequency(rps, val);
+ 
+	return ret ?: count;
 }
 
 static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
-- 
2.25.0

