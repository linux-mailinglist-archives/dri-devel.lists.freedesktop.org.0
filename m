Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA36BC2FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 01:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEEF10E399;
	Thu, 16 Mar 2023 00:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41FC10E308;
 Thu, 16 Mar 2023 00:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678927687; x=1710463687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6pTUSFFZU4VE9HSxtxTQU2jzPiCNwLQ0kRBHmDgjF2A=;
 b=L+RaVRGNYBcM6W+8X6P+aRChFWUK+p6kr61MFaP0trWmvsPTdUwpAP4E
 ew+OSa4JYZPB1f6DbFjrYNcsyacTk7ei2zI+tmx4lKHYrnUkvwtsPq/CX
 mnH2D/8vfQgpaNJwgBHI3ZCy5XvFGmgUK7d8w+warROLuMFP2R3wQqxnE
 1MK7971ghCG27ZaVkOtNOQq8extbnIrnffeI49y9ziaVUpyPVWFmnlpq1
 E5ym9L+gClE8Bc3U97mjWuDzoevsMZqMrODcqXkPzv79EnFqdDc7BcM/5
 bTh3Sr1ui/Y2bs6H88ovmkqmDaM31JRPVLVyjydqMChtKQ81wYnyzaVQK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365541955"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="365541955"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 17:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="748660583"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="748660583"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 17:48:06 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Use functions common with sysfs to read actual
 freq
Date: Wed, 15 Mar 2023 17:48:00 -0700
Message-Id: <20230316004800.2539753-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose intel_rps_read_actual_frequency_fw to read the actual freq without
taking forcewake for use by PMU. The code is refactored to use a common set
of functions across sysfs and PMU. Using common functions with sysfs in PMU
solves the issues of missing support for MTL and missing support for older
generations (prior to Gen6). It also future proofs the PMU where sometimes
code has been updated for sysfs and PMU has been missed.

v2: Remove runtime_pm_if_in_use from read_actual_frequency_fw (Tvrtko)

v3: (Tvrtko)
 - Remove goto in __read_cagf
 - Unexport intel_rps_get_cagf and intel_rps_read_punit_req

Fixes: 22009b6dad66 ("drm/i915/mtl: Modify CAGF functions for MTL")
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8280
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 38 ++++++++++++++++-------------
 drivers/gpu/drm/i915/gt/intel_rps.h |  4 +--
 drivers/gpu/drm/i915/i915_pmu.c     | 10 +++-----
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4d0dc9de23f96..6d7395aa404a2 100644
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
@@ -2066,7 +2056,7 @@ u32 intel_rps_read_rpstat(struct intel_rps *rps)
 	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
 }
 
-u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
+static u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
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
 	} else if (GRAPHICS_VER(i915) >= 6) {
-		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
+		r = GEN6_RPSTAT1;
 	} else {
-		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
+		r = MEMSTAT_ILK;
 	}
 
+	if (i915_mmio_reg_valid(r))
+		freq = take_fw ? intel_uncore_read(uncore, r) : intel_uncore_read_fw(uncore, r);
+
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
@@ -2128,7 +2127,12 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 	return freq;
 }
 
-u32 intel_rps_read_punit_req(struct intel_rps *rps)
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps)
+{
+	return intel_gpu_freq(rps, __read_cagf(rps, false));
+}
+
+static u32 intel_rps_read_punit_req(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index c622962c6befb..a3fa987aa91f1 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -37,8 +37,8 @@ void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
 
 int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
-u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
 u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_raw_freq(struct intel_rps *rps);
@@ -49,10 +49,8 @@ int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val);
 u32 intel_rps_get_rp0_frequency(struct intel_rps *rps);
 u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
 u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
-u32 intel_rps_read_punit_req(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
 u32 intel_rps_read_rpstat(struct intel_rps *rps);
-u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
 void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index a76c5ce9513d3..7ece883a7d956 100644
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

