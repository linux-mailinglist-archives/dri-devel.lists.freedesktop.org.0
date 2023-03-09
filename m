Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CAB6B1A18
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 04:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B687410E785;
	Thu,  9 Mar 2023 03:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E4E10E783;
 Thu,  9 Mar 2023 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678333586; x=1709869586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1GsCqygqZosqG+YplvTPYZohYMGaVM7K2Vt0d/lbcM=;
 b=DY7msg4fqkswZoX2u8AN7MfWvEKVTU8y5nNkhyXGnnnXIwYXbDrzmgd5
 +te4ZzbKlBMYGV6Gu/l1eKvCCY7LAoWNj412Bc6ggk3w2OFW7Z9ZRJK5Y
 FhUgrIs26Eqe+9pDnB1I+4erE8Ia7GVtNtGB1W/Hkf3WvfPPnbHwdXcsM
 r+kAR5fv9SUqPCZEJSEg2jzYPYTjPVJRI+pN16tixXTjkRqb5R5kJMgq+
 K/UPIk/lVpLtudbnV1HYIyRwjl5qR/N14Mk/heDy+hyvAw5in5b0me9/P
 jxUvXYqU7/RGNhw/tkljml/ExdqeAgb6rZv5J/pLwqJH9C6c7HfIjZXCv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320173789"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="320173789"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820462275"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="820462275"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/pmu: Use functions common with sysfs to read
 actual freq
Date: Wed,  8 Mar 2023 19:46:20 -0800
Message-Id: <20230309034621.1008458-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
References: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose intel_rps_read_actual_frequency_fw to read the actual freq without
taking forcewake for use by PMU. The code is refactored to use a common set
of functions across sysfs and PMU. Using common functions with sysfs in PMU
solves the issues of missing support for MTL and missing support for older
generations (prior to Gen6). It also future proofs the PMU where sometimes
code has been updated for sysfs and PMU has been missed.

Fixes: 22009b6dad66 ("drm/i915/mtl: Modify CAGF functions for MTL")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8280
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 46 +++++++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_rps.h |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c     | 10 +++----
 3 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4d0dc9de23f9..3957c5ee5cba 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2046,16 +2046,6 @@ void intel_rps_sanitize(struct intel_rps *rps)
 		rps_disable_interrupts(rps);
 }
 
-u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
-{
-	struct drm_i915_private *i915 = rps_to_i915(rps);
-	i915_reg_t rpstat;
-
-	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
-
-	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
-}
-
 u32 intel_rps_read_rpstat(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
@@ -2089,10 +2079,11 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	return cagf;
 }
 
-static u32 read_cagf(struct intel_rps *rps)
+static u32 __read_cagf(struct intel_rps *rps, bool take_fw)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
+	i915_reg_t r = INVALID_MMIO_REG;
 	u32 freq;
 
 	/*
@@ -2100,22 +2091,30 @@ static u32 read_cagf(struct intel_rps *rps)
 	 * registers will return 0 freq when GT is in RC6
 	 */
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
-		freq = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
+		r = MTL_MIRROR_TARGET_WP1;
 	} else if (GRAPHICS_VER(i915) >= 12) {
-		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
+		r = GEN12_RPSTAT1;
 	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
+		goto exit;
 	} else if (GRAPHICS_VER(i915) >= 6) {
-		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
+		r = GEN6_RPSTAT1;
 	} else {
-		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
+		r = MEMSTAT_ILK;
 	}
 
+	freq = take_fw ? intel_uncore_read(uncore, r) : intel_uncore_read_fw(uncore, r);
+exit:
 	return intel_rps_get_cagf(rps, freq);
 }
 
+static u32 read_cagf(struct intel_rps *rps)
+{
+	return __read_cagf(rps, true);
+}
+
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 {
 	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
@@ -2128,6 +2127,23 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 	return freq;
 }
 
+static u32 read_cagf_fw(struct intel_rps *rps)
+{
+	return __read_cagf(rps, false);
+}
+
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps)
+{
+	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
+	intel_wakeref_t wakeref;
+	u32 freq = 0;
+
+	with_intel_runtime_pm_if_in_use(rpm, wakeref)
+		freq = intel_gpu_freq(rps, read_cagf_fw(rps));
+
+	return freq;
+}
+
 u32 intel_rps_read_punit_req(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index c622962c6bef..2d5b3ef58606 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -39,6 +39,7 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
 u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
 u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_raw_freq(struct intel_rps *rps);
@@ -52,7 +53,6 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
 u32 intel_rps_read_punit_req(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
 u32 intel_rps_read_rpstat(struct intel_rps *rps);
-u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
 void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index a76c5ce9513d..7ece883a7d95 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -392,14 +392,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * case we assume the system is running at the intended
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
-		val = intel_rps_read_rpstat_fw(rps);
-		if (val)
-			val = intel_rps_get_cagf(rps, val);
-		else
-			val = rps->cur_freq;
+		val = intel_rps_read_actual_frequency_fw(rps);
+		if (!val)
+			val = intel_gpu_freq(rps, rps->cur_freq);
 
 		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
-				intel_gpu_freq(rps, val), period_ns / 1000);
+				val, period_ns / 1000);
 	}
 
 	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
-- 
2.38.0

