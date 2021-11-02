Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550C144251D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 02:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A099B6F567;
	Tue,  2 Nov 2021 01:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD016F563;
 Tue,  2 Nov 2021 01:26:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="231117058"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="231117058"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 18:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="531385693"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 01 Nov 2021 18:26:47 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
Date: Mon,  1 Nov 2021 18:26:08 -0700
Message-Id: <20211102012608.8609-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20211102012608.8609-1-vinay.belgaumkar@intel.com>
References: <20211102012608.8609-1-vinay.belgaumkar@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to sort through the SLPC/RPS paths of get/set methods.
Boost frequency will be modified as long as it is within the constraints
of RP0 and if it is different from the existing one. We will set min
freq to boost only if there is at least one active waiter.

v2: Add num_boosts to guc_slpc_info and changes for worker function
v3: Review comments (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         | 47 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h         |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 29 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  1 +
 drivers/gpu/drm/i915/i915_sysfs.c           | 19 ++-------
 5 files changed, 82 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 6f310c9d9765..07ff7ba7b2b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -936,6 +936,53 @@ void intel_rps_park(struct intel_rps *rps)
 	GT_TRACE(rps_to_gt(rps), "park:%x\n", rps->cur_freq);
 }
 
+u32 intel_rps_get_boost_frequency(struct intel_rps *rps)
+{
+	struct intel_guc_slpc *slpc;
+
+	if (rps_uses_slpc(rps)) {
+		slpc = rps_to_slpc(rps);
+
+		return slpc->boost_freq;
+	} else {
+		return intel_gpu_freq(rps, rps->boost_freq);
+	}
+}
+
+static int rps_set_boost_freq(struct intel_rps *rps, u32 val)
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
+		return rps_set_boost_freq(rps, freq);
+	}
+}
+
 void intel_rps_dec_waiters(struct intel_rps *rps)
 {
 	struct intel_guc_slpc *slpc;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 407e878d5006..aee12f37d38a 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -24,6 +24,8 @@ void intel_rps_park(struct intel_rps *rps);
 void intel_rps_unpark(struct intel_rps *rps);
 void intel_rps_boost(struct i915_request *rq);
 void intel_rps_dec_waiters(struct intel_rps *rps);
+u32 intel_rps_get_boost_frequency(struct intel_rps *rps);
+int intel_rps_set_boost_frequency(struct intel_rps *rps, u32 freq);
 
 int intel_rps_set(struct intel_rps *rps, u8 val);
 void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index db418396a145..4e1d3cd29164 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -650,6 +650,33 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+int intel_guc_slpc_set_boost_freq(struct intel_guc_slpc *slpc, u32 val)
+{
+	int ret = 0;
+
+	if (val < slpc->min_freq || val > slpc->rp0_freq)
+		return -EINVAL;
+
+	mutex_lock(&slpc->lock);
+
+	if (slpc->boost_freq != val) {
+		/* Apply only if there are active waiters */
+		if (atomic_read(&slpc->num_waiters)) {
+			ret = slpc_force_min_freq(slpc, val);
+			if (ret) {
+				ret = -EIO;
+				goto done;
+			}
+		}
+
+		slpc->boost_freq = val;
+	}
+
+done:
+	mutex_unlock(&slpc->lock);
+	return ret;
+}
+
 void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
 {
 	/*
@@ -687,6 +714,8 @@ int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p
 				   slpc_decode_max_freq(slpc));
 			drm_printf(p, "\tMin freq: %u MHz\n",
 				   slpc_decode_min_freq(slpc));
+			drm_printf(p, "\twaitboosts: %u\n",
+				   slpc->num_boosts);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index d74d6d749bdc..0caa8fee3c04 100644
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
index 1804f4142740..59d441cedc75 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -279,7 +279,7 @@ static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribu
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &i915->gt.rps;
 
-	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->boost_freq));
+	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
 }
 
 static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
@@ -288,7 +288,6 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &dev_priv->gt.rps;
-	bool boost = false;
 	ssize_t ret;
 	u32 val;
 
@@ -296,21 +295,9 @@ static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
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
+	ret = intel_rps_set_boost_frequency(rps, val);
 
-	return count;
+	return ret ?: count;
 }
 
 static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
-- 
2.25.0

