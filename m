Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955F3D138B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EAB6EC66;
	Wed, 21 Jul 2021 16:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47436EC66;
 Wed, 21 Jul 2021 16:12:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297028344"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297028344"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564787137"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:12:51 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] drm/i915/guc/slpc: Add SLPC selftest
Date: Wed, 21 Jul 2021 09:11:19 -0700
Message-Id: <20210721161120.24610-14-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tests that exercise the SLPC get/set frequency interfaces.

Clamp_max will set max frequency to multiple levels and check
that SLPC requests frequency lower than or equal to it.

Clamp_min will set min frequency to different levels and check
if SLPC requests are higher or equal to those levels.

v2: Address review comments (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
 drivers/gpu/drm/i915/gt/selftest_slpc.c       | 318 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_slpc.h       |  12 +
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 4 files changed, 332 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.h

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 48d4147165a9..6237332835fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2318,4 +2318,5 @@ EXPORT_SYMBOL_GPL(i915_gpu_turbo_disable);
 
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_rps.c"
+#include "selftest_slpc.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
new file mode 100644
index 000000000000..be3c664f714a
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "selftest_slpc.h"
+
+#define NUM_STEPS 5
+#define H2G_DELAY 50000
+#define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
+
+static int set_min_freq(struct intel_guc_slpc *slpc, int freq)
+{
+	int ret;
+
+	ret = intel_guc_slpc_set_min_freq(slpc, freq);
+	if (ret) {
+		pr_err("Could not set min frequency to [%d]\n", freq);
+		return ret;
+	} else {
+		/* Delay to ensure h2g completes */
+		delay_for_h2g();
+	}
+
+	return ret;
+}
+
+static int set_max_freq(struct intel_guc_slpc *slpc, int freq)
+{
+	int ret;
+
+	ret = intel_guc_slpc_set_max_freq(slpc, freq);
+	if (ret) {
+		pr_err("Could not set maximum frequency [%d]\n",
+			freq);
+		return ret;
+	} else {
+		/* Delay to ensure h2g completes */
+		delay_for_h2g();
+	}
+
+	return ret;
+}
+
+int live_slpc_clamp_min(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_gt *gt = &i915->gt;
+	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
+	struct intel_rps *rps = &gt->rps;
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	struct igt_spinner spin;
+	u32 slpc_min_freq, slpc_max_freq;
+	int err = 0;
+
+	if (!intel_uc_uses_guc_slpc(&gt->uc))
+		return 0;
+
+	if (igt_spinner_init(&spin, gt))
+		return -ENOMEM;
+
+	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
+		pr_err("Could not get SLPC max freq\n");
+		return -EIO;
+	}
+
+	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
+		pr_err("Could not get SLPC min freq\n");
+		return -EIO;
+	}
+
+	if (slpc_min_freq == slpc_max_freq) {
+		pr_err("Min/Max are fused to the same value\n");
+		return -EINVAL;
+	}
+
+	intel_gt_pm_wait_for_idle(gt);
+	intel_gt_pm_get(gt);
+	for_each_engine(engine, gt, id) {
+		struct i915_request *rq;
+		u32 step, min_freq, req_freq;
+		u32 act_freq, max_act_freq;
+
+		if (!intel_engine_can_store_dword(engine))
+			continue;
+
+		/* Go from min to max in 5 steps */
+		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
+		max_act_freq = slpc_min_freq;
+		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
+							min_freq += step)
+		{
+			err = set_min_freq(slpc, min_freq);
+			if (err)
+				break;
+
+			st_engine_heartbeat_disable(engine);
+
+			rq = igt_spinner_create_request(&spin,
+					engine->kernel_context,
+					MI_NOOP);
+			if (IS_ERR(rq)) {
+				err = PTR_ERR(rq);
+				st_engine_heartbeat_enable(engine);
+				break;
+			}
+
+			i915_request_add(rq);
+
+			if (!igt_wait_for_spinner(&spin, rq)) {
+				pr_err("%s: Spinner did not start\n",
+					engine->name);
+				igt_spinner_end(&spin);
+				st_engine_heartbeat_enable(engine);
+				intel_gt_set_wedged(engine->gt);
+				err = -EIO;
+				break;
+			}
+
+			/* Wait for GuC to detect business and raise
+			 * requested frequency if necessary */
+			delay_for_h2g();
+
+			req_freq = intel_rps_read_punit_req_frequency(rps);
+
+			/* GuC requests freq in multiples of 50/3 MHz */
+			if (req_freq < (min_freq - 50/3)) {
+				pr_err("SWReq is %d, should be at least %d\n", req_freq,
+					min_freq - 50/3);
+				igt_spinner_end(&spin);
+				st_engine_heartbeat_enable(engine);
+				err = -EINVAL;
+				break;
+			}
+
+			act_freq =  intel_rps_read_actual_frequency(rps);
+			if (act_freq > max_act_freq)
+				max_act_freq = act_freq;
+
+			igt_spinner_end(&spin);
+			st_engine_heartbeat_enable(engine);
+		}
+
+		pr_info("Max actual frequency for %s was %d\n",
+				engine->name, max_act_freq);
+
+		/* Actual frequency should rise above min */
+		if (max_act_freq == slpc_min_freq) {
+			pr_err("Actual freq did not rise above min\n");
+			err = -EINVAL;
+		}
+
+		if (err)
+			break;
+	}
+
+	/* Restore min/max frequencies */
+	set_max_freq(slpc, slpc_max_freq);
+	set_min_freq(slpc, slpc_min_freq);
+
+	if (igt_flush_test(gt->i915))
+		err = -EIO;
+
+	intel_gt_pm_put(gt);
+	igt_spinner_fini(&spin);
+	intel_gt_pm_wait_for_idle(gt);
+
+	return err;
+}
+
+int live_slpc_clamp_max(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_gt *gt = &i915->gt;
+	struct intel_guc_slpc *slpc;
+	struct intel_rps *rps;
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	struct igt_spinner spin;
+	int err = 0;
+	u32 slpc_min_freq, slpc_max_freq;
+
+	slpc = &gt->uc.guc.slpc;
+	rps = &gt->rps;
+
+	if (!intel_uc_uses_guc_slpc(&gt->uc))
+		return 0;
+
+	if (igt_spinner_init(&spin, gt))
+		return -ENOMEM;
+
+	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
+		pr_err("Could not get SLPC max freq\n");
+		return -EIO;
+	}
+
+	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
+		pr_err("Could not get SLPC min freq\n");
+		return -EIO;
+	}
+
+	if (slpc_min_freq == slpc_max_freq) {
+		pr_err("Min/Max are fused to the same value\n");
+		return -EINVAL;
+	}
+
+	intel_gt_pm_wait_for_idle(gt);
+	intel_gt_pm_get(gt);
+	for_each_engine(engine, gt, id) {
+		struct i915_request *rq;
+		u32 max_freq, req_freq;
+		u32 act_freq, max_act_freq;
+		u32 step;
+
+		if (!intel_engine_can_store_dword(engine))
+			continue;
+
+		/* Go from max to min in 5 steps */
+		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
+		max_act_freq = slpc_min_freq;
+		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
+							max_freq -= step)
+		{
+			err = set_max_freq(slpc, max_freq);
+			if (err)
+				break;
+
+			st_engine_heartbeat_disable(engine);
+
+			rq = igt_spinner_create_request(&spin,
+						engine->kernel_context,
+						MI_NOOP);
+			if (IS_ERR(rq)) {
+				st_engine_heartbeat_enable(engine);
+				err = PTR_ERR(rq);
+				break;
+			}
+
+			i915_request_add(rq);
+
+			if (!igt_wait_for_spinner(&spin, rq)) {
+				pr_err("%s: SLPC spinner did not start\n",
+				       engine->name);
+				igt_spinner_end(&spin);
+				st_engine_heartbeat_enable(engine);
+				intel_gt_set_wedged(engine->gt);
+				err = -EIO;
+				break;
+			}
+
+			delay_for_h2g();
+
+			/* Verify that SWREQ indeed was set to specific value */
+			req_freq = intel_rps_read_punit_req_frequency(rps);
+
+			/* GuC requests freq in multiples of 50/3 MHz */
+			if (req_freq > (max_freq + 50/3)) {
+				pr_err("SWReq is %d, should be at most %d\n", req_freq,
+					max_freq + 50/3);
+				igt_spinner_end(&spin);
+				st_engine_heartbeat_enable(engine);
+				err = -EINVAL;
+				break;
+			}
+
+			act_freq =  intel_rps_read_actual_frequency(rps);
+			if (act_freq > max_act_freq)
+				max_act_freq = act_freq;
+
+			st_engine_heartbeat_enable(engine);
+			igt_spinner_end(&spin);
+
+			if (err)
+				break;
+		}
+
+		pr_info("Max actual frequency for %s was %d\n",
+				engine->name, max_act_freq);
+
+		/* Actual frequency should rise above min */
+		if (max_act_freq == slpc_min_freq) {
+			pr_err("Actual freq did not rise above min\n");
+			err = -EINVAL;
+		}
+
+		if (igt_flush_test(gt->i915)) {
+			err = -EIO;
+			break;
+		}
+
+		if (err)
+			break;
+	}
+
+	/* Restore min/max freq */
+	set_max_freq(slpc, slpc_max_freq);
+	set_min_freq(slpc, slpc_min_freq);
+
+	intel_gt_pm_put(gt);
+	igt_spinner_fini(&spin);
+	intel_gt_pm_wait_for_idle(gt);
+
+	return err;
+}
+
+int intel_slpc_live_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(live_slpc_clamp_max),
+		SUBTEST(live_slpc_clamp_min),
+	};
+
+	if (intel_gt_is_wedged(&i915->gt))
+		return 0;
+
+	return i915_live_subtests(tests, i915);
+}
diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.h b/drivers/gpu/drm/i915/gt/selftest_slpc.h
new file mode 100644
index 000000000000..0480e62ed3d7
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef SELFTEST_SLPC_H
+#define SELFTEST_SLPC_H
+
+int live_slpc_clamp_max(void *arg);
+int live_slpc_clamp_min(void *arg);
+
+#endif /* SELFTEST_SLPC_H */
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index e2fd1b61af71..1746a56dda06 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -47,5 +47,6 @@ selftest(hangcheck, intel_hangcheck_live_selftests)
 selftest(execlists, intel_execlists_live_selftests)
 selftest(ring_submission, intel_ring_submission_live_selftests)
 selftest(perf, i915_perf_live_selftests)
+selftest(slpc, intel_slpc_live_selftests)
 /* Here be dragons: keep last to run last! */
 selftest(late_gt_pm, intel_gt_pm_late_selftests)
-- 
2.25.0

