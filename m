Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2BF558BC1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552E10E4AF;
	Thu, 23 Jun 2022 23:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950210E2F0;
 Thu, 23 Jun 2022 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656027243; x=1687563243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PV/IyNFlWOJKkMk0aPYmCRNXssa43xqbzAPuI24wwc4=;
 b=Lf7TjhlWUlBti6nWTLuWED+1rrWm1Mw+S/qIO7JXAxZZw4CTgNYaHeoR
 7Jcox8zaKuCp1icezZWPs52nEleTNttXiNk/XwZ0lrkYUr2Vm6RSwav23
 g4IvPR4E4WB10KwoamxaSPCs8+lCHU7OFdpYrx5EHT/9r3aXcjlj3zpiq
 WQq9w2l1tUPTVNFmxL/h2tn/yzMifTcomOtfCzdAU4oe0+KfxJPVhAomA
 D4LImWzrV6onz33WaG2+SEzTDf0JqOWviSbb2g8Ge0fVAjVlxyn0GuyWb
 yYeFmpEBCXXALZK/chktmCAo4odlISnTu358kVGhoPwlsgHxoqkS4XUTt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="306335755"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="306335755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 16:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; d="scan'208";a="691265084"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2022 16:34:02 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Add a new SLPC selftest
Date: Thu, 23 Jun 2022 16:33:20 -0700
Message-Id: <20220623233320.11041-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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

This test will validate we can achieve actual frequency of RP0. Pcode
grants frequencies based on what GuC is requesting. However, thermal
throttling can limit what is being granted. Add a test to request for
max, but don't fail the test if RP0 is not granted due to throttle
reasons.

Also optimize the selftest by using a common run_test function to avoid
code duplication. Rename the "clamp" tests to vary_max_freq and vary_min_freq.

v2: Fix compile warning
v3: Review comments (Ashutosh). Added a FIXME for the media RP0 case.

Fixes 8ee2c227822e ("drm/i915/guc/slpc: Add SLPC selftest")

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c | 324 ++++++++++++------------
 1 file changed, 157 insertions(+), 167 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index b768cea5943d..2b8c10b4e38a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -8,6 +8,11 @@
 #define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
 #define FREQUENCY_REQ_UNIT	DIV_ROUND_CLOSEST(GT_FREQUENCY_MULTIPLIER, \
 						  GEN9_FREQ_SCALER)
+enum test_type {
+	VARY_MIN,
+	VARY_MAX,
+	MAX_GRANTED
+};
 
 static int slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 {
@@ -36,147 +41,115 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
 	return ret;
 }
 
-static int live_slpc_clamp_min(void *arg)
+static int vary_max_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
+			 u32 *max_act_freq)
 {
-	struct drm_i915_private *i915 = arg;
-	struct intel_gt *gt = to_gt(i915);
-	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
-	struct intel_rps *rps = &gt->rps;
-	struct intel_engine_cs *engine;
-	enum intel_engine_id id;
-	struct igt_spinner spin;
-	u32 slpc_min_freq, slpc_max_freq;
+	u32 step, max_freq, req_freq;
+	u32 act_freq;
 	int err = 0;
 
-	if (!intel_uc_uses_guc_slpc(&gt->uc))
-		return 0;
+	/* Go from max to min in 5 steps */
+	step = (slpc->rp0_freq - slpc->min_freq) / NUM_STEPS;
+	*max_act_freq = slpc->min_freq;
+	for (max_freq = slpc->rp0_freq; max_freq > slpc->min_freq;
+				max_freq -= step) {
+		err = slpc_set_max_freq(slpc, max_freq);
+		if (err)
+			break;
 
-	if (igt_spinner_init(&spin, gt))
-		return -ENOMEM;
+		req_freq = intel_rps_read_punit_req_frequency(rps);
 
-	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
-		pr_err("Could not get SLPC max freq\n");
-		return -EIO;
-	}
+		/* GuC requests freq in multiples of 50/3 MHz */
+		if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
+			pr_err("SWReq is %d, should be at most %d\n", req_freq,
+				max_freq + FREQUENCY_REQ_UNIT);
+			err = -EINVAL;
+		}
 
-	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
-		pr_err("Could not get SLPC min freq\n");
-		return -EIO;
-	}
+		act_freq =  intel_rps_read_actual_frequency(rps);
+		if (act_freq > *max_act_freq)
+			*max_act_freq = act_freq;
 
-	if (slpc_min_freq == slpc_max_freq) {
-		pr_err("Min/Max are fused to the same value\n");
-		return -EINVAL;
+		if (err)
+			break;
 	}
 
-	intel_gt_pm_wait_for_idle(gt);
-	intel_gt_pm_get(gt);
-	for_each_engine(engine, gt, id) {
-		struct i915_request *rq;
-		u32 step, min_freq, req_freq;
-		u32 act_freq, max_act_freq;
+	return err;
+}
 
-		if (!intel_engine_can_store_dword(engine))
-			continue;
+static int vary_min_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
+			 u32 *max_act_freq)
+{
+	u32 step, min_freq, req_freq;
+	u32 act_freq;
+	int err = 0;
 
-		/* Go from min to max in 5 steps */
-		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
-		max_act_freq = slpc_min_freq;
-		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
-					min_freq += step) {
-			err = slpc_set_min_freq(slpc, min_freq);
-			if (err)
-				break;
-
-			st_engine_heartbeat_disable(engine);
-
-			rq = igt_spinner_create_request(&spin,
-							engine->kernel_context,
-							MI_NOOP);
-			if (IS_ERR(rq)) {
-				err = PTR_ERR(rq);
-				st_engine_heartbeat_enable(engine);
-				break;
-			}
+	/* Go from min to max in 5 steps */
+	step = (slpc->rp0_freq - slpc->min_freq) / NUM_STEPS;
+	*max_act_freq = slpc->min_freq;
+	for (min_freq = slpc->min_freq; min_freq < slpc->rp0_freq;
+				min_freq += step) {
+		err = slpc_set_min_freq(slpc, min_freq);
+		if (err)
+			break;
 
-			i915_request_add(rq);
+		req_freq = intel_rps_read_punit_req_frequency(rps);
 
-			if (!igt_wait_for_spinner(&spin, rq)) {
-				pr_err("%s: Spinner did not start\n",
-				       engine->name);
-				igt_spinner_end(&spin);
-				st_engine_heartbeat_enable(engine);
-				intel_gt_set_wedged(engine->gt);
-				err = -EIO;
-				break;
-			}
+		/* GuC requests freq in multiples of 50/3 MHz */
+		if (req_freq < (min_freq - FREQUENCY_REQ_UNIT)) {
+			pr_err("SWReq is %d, should be at least %d\n", req_freq,
+				min_freq - FREQUENCY_REQ_UNIT);
+			err = -EINVAL;
+		}
 
-			/* Wait for GuC to detect business and raise
-			 * requested frequency if necessary.
-			 */
-			delay_for_h2g();
+		act_freq =  intel_rps_read_actual_frequency(rps);
+		if (act_freq > *max_act_freq)
+			*max_act_freq = act_freq;
 
-			req_freq = intel_rps_read_punit_req_frequency(rps);
+		if (err)
+			break;
+	}
 
-			/* GuC requests freq in multiples of 50/3 MHz */
-			if (req_freq < (min_freq - FREQUENCY_REQ_UNIT)) {
-				pr_err("SWReq is %d, should be at least %d\n", req_freq,
-				       min_freq - FREQUENCY_REQ_UNIT);
-				igt_spinner_end(&spin);
-				st_engine_heartbeat_enable(engine);
-				err = -EINVAL;
-				break;
-			}
+	return err;
+}
 
-			act_freq =  intel_rps_read_actual_frequency(rps);
-			if (act_freq > max_act_freq)
-				max_act_freq = act_freq;
+static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps, u32 *max_act_freq)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+	u32 perf_limit_reasons;
+	int err = 0;
 
-			igt_spinner_end(&spin);
-			st_engine_heartbeat_enable(engine);
-		}
+	err = slpc_set_min_freq(slpc, slpc->rp0_freq);
+	if (err)
+		return err;
 
-		pr_info("Max actual frequency for %s was %d\n",
-			engine->name, max_act_freq);
+	*max_act_freq =  intel_rps_read_actual_frequency(rps);
+	if (!(*max_act_freq == slpc->rp0_freq)) {
+		/* Check if there was some throttling by pcode */
+		perf_limit_reasons = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
 
-		/* Actual frequency should rise above min */
-		if (max_act_freq == slpc_min_freq) {
-			pr_err("Actual freq did not rise above min\n");
+		/* If not, this is an error */
+		if (!(perf_limit_reasons && GT0_PERF_LIMIT_REASONS_MASK)) {
+			pr_err("Pcode did not grant max freq\n");
 			err = -EINVAL;
-		}
+		} else {
+			pr_info("Pcode throttled frequency 0x%x\n", perf_limit_reasons);
 
-		if (err)
-			break;
+		}
 	}
 
-	/* Restore min/max frequencies */
-	slpc_set_max_freq(slpc, slpc_max_freq);
-	slpc_set_min_freq(slpc, slpc_min_freq);
-
-	if (igt_flush_test(gt->i915))
-		err = -EIO;
-
-	intel_gt_pm_put(gt);
-	igt_spinner_fini(&spin);
-	intel_gt_pm_wait_for_idle(gt);
-
 	return err;
 }
 
-static int live_slpc_clamp_max(void *arg)
+static int run_test(struct intel_gt *gt, int test_type)
 {
-	struct drm_i915_private *i915 = arg;
-	struct intel_gt *gt = to_gt(i915);
-	struct intel_guc_slpc *slpc;
-	struct intel_rps *rps;
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_rps *rps = &gt->rps;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 	struct igt_spinner spin;
-	int err = 0;
 	u32 slpc_min_freq, slpc_max_freq;
-
-	slpc = &gt->uc.guc.slpc;
-	rps = &gt->rps;
+	int err = 0;
 
 	if (!intel_uc_uses_guc_slpc(&gt->uc))
 		return 0;
@@ -203,105 +176,122 @@ static int live_slpc_clamp_max(void *arg)
 	intel_gt_pm_get(gt);
 	for_each_engine(engine, gt, id) {
 		struct i915_request *rq;
-		u32 max_freq, req_freq;
-		u32 act_freq, max_act_freq;
-		u32 step;
+		u32 max_act_freq;
 
 		if (!intel_engine_can_store_dword(engine))
 			continue;
 
-		/* Go from max to min in 5 steps */
-		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
-		max_act_freq = slpc_min_freq;
-		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
-					max_freq -= step) {
-			err = slpc_set_max_freq(slpc, max_freq);
-			if (err)
-				break;
-
-			st_engine_heartbeat_disable(engine);
-
-			rq = igt_spinner_create_request(&spin,
-							engine->kernel_context,
-							MI_NOOP);
-			if (IS_ERR(rq)) {
-				st_engine_heartbeat_enable(engine);
-				err = PTR_ERR(rq);
-				break;
-			}
+		st_engine_heartbeat_disable(engine);
 
-			i915_request_add(rq);
+		rq = igt_spinner_create_request(&spin,
+						engine->kernel_context,
+						MI_NOOP);
+		if (IS_ERR(rq)) {
+			err = PTR_ERR(rq);
+			st_engine_heartbeat_enable(engine);
+			break;
+		}
 
-			if (!igt_wait_for_spinner(&spin, rq)) {
-				pr_err("%s: SLPC spinner did not start\n",
-				       engine->name);
-				igt_spinner_end(&spin);
-				st_engine_heartbeat_enable(engine);
-				intel_gt_set_wedged(engine->gt);
-				err = -EIO;
-				break;
-			}
+		i915_request_add(rq);
+
+		if (!igt_wait_for_spinner(&spin, rq)) {
+			pr_err("%s: Spinner did not start\n",
+			       engine->name);
+			igt_spinner_end(&spin);
+			st_engine_heartbeat_enable(engine);
+			intel_gt_set_wedged(engine->gt);
+			err = -EIO;
+			break;
+		}
 
-			delay_for_h2g();
+		switch (test_type) {
 
-			/* Verify that SWREQ indeed was set to specific value */
-			req_freq = intel_rps_read_punit_req_frequency(rps);
+		case VARY_MIN:
+			err = vary_min_freq(slpc, rps, &max_act_freq);
+			break;
 
-			/* GuC requests freq in multiples of 50/3 MHz */
-			if (req_freq > (max_freq + FREQUENCY_REQ_UNIT)) {
-				pr_err("SWReq is %d, should be at most %d\n", req_freq,
-				       max_freq + FREQUENCY_REQ_UNIT);
+		case VARY_MAX:
+			err = vary_max_freq(slpc, rps, &max_act_freq);
+			break;
+
+		case MAX_GRANTED:
+			/* FIXME: Media engines have a different RP0 */
+			if ((engine->class == VIDEO_DECODE_CLASS) ||
+			    (engine->class == VIDEO_ENHANCEMENT_CLASS)) {
 				igt_spinner_end(&spin);
 				st_engine_heartbeat_enable(engine);
-				err = -EINVAL;
-				break;
+				err = 0;
+				continue;
 			}
 
-			act_freq =  intel_rps_read_actual_frequency(rps);
-			if (act_freq > max_act_freq)
-				max_act_freq = act_freq;
-
-			st_engine_heartbeat_enable(engine);
-			igt_spinner_end(&spin);
-
-			if (err)
-				break;
+			err = max_granted_freq(slpc, rps, &max_act_freq);
+			break;
 		}
 
 		pr_info("Max actual frequency for %s was %d\n",
 			engine->name, max_act_freq);
 
 		/* Actual frequency should rise above min */
-		if (max_act_freq == slpc_min_freq) {
+		if (max_act_freq <= slpc_min_freq) {
 			pr_err("Actual freq did not rise above min\n");
+			pr_err("Perf Limit Reasons: 0x%x\n",
+				intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS));
 			err = -EINVAL;
 		}
 
-		if (igt_flush_test(gt->i915)) {
-			err = -EIO;
-			break;
-		}
+		igt_spinner_end(&spin);
+		st_engine_heartbeat_enable(engine);
 
 		if (err)
 			break;
 	}
 
-	/* Restore min/max freq */
+	/* Restore min/max frequencies */
 	slpc_set_max_freq(slpc, slpc_max_freq);
 	slpc_set_min_freq(slpc, slpc_min_freq);
 
+	if (igt_flush_test(gt->i915))
+		err = -EIO;
+
 	intel_gt_pm_put(gt);
 	igt_spinner_fini(&spin);
 	intel_gt_pm_wait_for_idle(gt);
 
 	return err;
+
+}
+
+static int live_slpc_vary_min(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_gt *gt = to_gt(i915);
+
+	return run_test(gt, VARY_MIN);
+}
+
+static int live_slpc_vary_max(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_gt *gt = to_gt(i915);
+
+	return run_test(gt, VARY_MAX);
+}
+
+/* check if pcode can grant RP0 */
+static int live_slpc_max_granted(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_gt *gt = to_gt(i915);
+
+	return run_test(gt, MAX_GRANTED);
 }
 
 int intel_slpc_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
-		SUBTEST(live_slpc_clamp_max),
-		SUBTEST(live_slpc_clamp_min),
+		SUBTEST(live_slpc_vary_max),
+		SUBTEST(live_slpc_vary_min),
+		SUBTEST(live_slpc_max_granted),
 	};
 
 	if (intel_gt_is_wedged(to_gt(i915)))
-- 
2.35.1

