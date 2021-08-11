Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A660A3E8794
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 03:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5646E082;
	Wed, 11 Aug 2021 01:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4398F89CBC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 01:16:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="276064756"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="276064756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="675603986"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <gfx-internal-devel@eclists.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 9/9] drm/i915/selftests: Add initial GuC selftest for
 scrubbing lost G2H
Date: Wed, 11 Aug 2021 01:16:22 +0000
Message-Id: <20210811011622.255784-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811011622.255784-1-matthew.brost@intel.com>
References: <20210811011622.255784-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

While debugging an issue with full GT resets I went down a rabbit hole
thinking the scrubbing of lost G2H wasn't working correctly. This proved
to be incorrect as this was working just fine but this chase inspired me
to write a selftest to prove that this works. This simple selftest
injects errors dropping various G2H and then issues a full GT reset
proving that the scrubbing of these G2H doesn't blow up.

v2:
 (Daniel Vetter)
  - Use ifdef instead of macros for selftests

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |  18 +++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  25 ++++
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 6 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e54351a170e2..3a73f3117873 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -198,6 +198,24 @@ struct intel_context {
 	 */
 	u8 guc_prio;
 	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
+
+#ifdef CONFIG_DRM_I915_SELFTEST
+	/**
+	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
+	 */
+	bool drop_schedule_enable;
+
+	/**
+	 * @drop_schedule_disable: Force drop of schedule disable G2H for
+	 * selftest
+	 */
+	bool drop_schedule_disable;
+
+	/**
+	 * @drop_deregister: Force drop of deregister G2H for selftest
+	 */
+	bool drop_deregister;
+#endif
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index da0f8af2c8ab..6914f2247c39 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2617,6 +2617,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 
 	trace_intel_context_deregister_done(ce);
 
+#ifdef CONFIG_DRM_I915_SELFTEST
+	if (unlikely(ce->drop_deregister)) {
+		ce->drop_deregister = false;
+		return 0;
+	}
+#endif
+
 	if (context_wait_for_deregister_to_register(ce)) {
 		struct intel_runtime_pm *runtime_pm =
 			&ce->engine->gt->i915->runtime_pm;
@@ -2671,10 +2678,24 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	trace_intel_context_sched_done(ce);
 
 	if (context_pending_enable(ce)) {
+#ifdef CONFIG_DRM_I915_SELFTEST
+		if (unlikely(ce->drop_schedule_enable)) {
+			ce->drop_schedule_enable = false;
+			return 0;
+		}
+#endif
+
 		clr_context_pending_enable(ce);
 	} else if (context_pending_disable(ce)) {
 		bool banned;
 
+#ifdef CONFIG_DRM_I915_SELFTEST
+		if (unlikely(ce->drop_schedule_disable)) {
+			ce->drop_schedule_disable = false;
+			return 0;
+		}
+#endif
+
 		/*
 		 * Unpin must be done before __guc_signal_context_fence,
 		 * otherwise a race exists between the requests getting
@@ -3046,3 +3067,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
 
 	return false;
 }
+
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+#include "selftest_guc.c"
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
new file mode 100644
index 000000000000..46ca6554f65d
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright �� 2021 Intel Corporation
+ */
+
+#include "selftests/intel_scheduler_helpers.h"
+
+static struct i915_request *nop_user_request(struct intel_context *ce,
+					     struct i915_request *from)
+{
+	struct i915_request *rq;
+	int ret;
+
+	rq = intel_context_create_request(ce);
+	if (IS_ERR(rq))
+		return rq;
+
+	if (from) {
+		ret = i915_sw_fence_await_dma_fence(&rq->submit,
+						    &from->fence, 0,
+						    I915_FENCE_GFP);
+		if (ret < 0) {
+			i915_request_put(rq);
+			return ERR_PTR(ret);
+		}
+	}
+
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	return rq;
+}
+
+static int intel_guc_scrub_ctbs(void *arg)
+{
+	struct intel_gt *gt = arg;
+	int ret = 0;
+	int i;
+	struct i915_request *last[3] = {NULL, NULL, NULL}, *rq;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct intel_context *ce;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+	engine = intel_selftest_find_any_engine(gt);
+
+	/* Submit requests and inject errors forcing G2H to be dropped */
+	for (i = 0; i < 3; ++i) {
+		ce = intel_context_create(engine);
+		if (IS_ERR(ce)) {
+			ret = PTR_ERR(ce);
+			pr_err("Failed to create context, %d: %d\n", i, ret);
+			goto err;
+		}
+
+		switch(i) {
+		case 0:
+			ce->drop_schedule_enable = true;
+			break;
+		case 1:
+			ce->drop_schedule_disable = true;
+			break;
+		case 2:
+			ce->drop_deregister = true;
+			break;
+		}
+
+		rq = nop_user_request(ce, NULL);
+		intel_context_put(ce);
+
+		if (IS_ERR(rq)) {
+			ret = PTR_ERR(rq);
+			pr_err("Failed to create request, %d: %d\n", i, ret);
+			goto err;
+		}
+
+		last[i] = rq;
+	}
+
+	for (i = 0; i < 3; ++i) {
+		ret = i915_request_wait(last[i], 0, HZ);
+		if (ret < 0) {
+			pr_err("Last request failed to complete: %d\n", ret);
+			goto err;
+		}
+		i915_request_put(last[i]);
+		last[i] = NULL;
+	}
+
+	/* Force all H2G / G2H to be submitted / processed */
+	intel_gt_retire_requests(gt);
+	msleep(500);
+
+	/* Scrub missing G2H */
+	intel_gt_handle_error(engine->gt, -1, 0, "selftest reset");
+
+	ret = intel_gt_wait_for_idle(gt, HZ);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err;
+	}
+
+err:
+	for (i = 0; i < 3; ++i)
+		if (last[i])
+			i915_request_put(last[i]);
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+
+	return ret;
+}
+
+int intel_guc_live_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(intel_guc_scrub_ctbs),
+	};
+	struct intel_gt *gt = &i915->gt;
+
+	if (intel_gt_is_wedged(gt))
+		return 0;
+
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return 0;
+
+	return intel_gt_live_subtests(tests, gt);
+}
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index cfa5c4165a4f..3cf6758931f9 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -47,5 +47,6 @@ selftest(execlists, intel_execlists_live_selftests)
 selftest(ring_submission, intel_ring_submission_live_selftests)
 selftest(perf, i915_perf_live_selftests)
 selftest(slpc, intel_slpc_live_selftests)
+selftest(guc, intel_guc_live_selftests)
 /* Here be dragons: keep last to run last! */
 selftest(late_gt_pm, intel_gt_pm_late_selftests)
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 4b328346b48a..310fb83c527e 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -14,6 +14,18 @@
 #define REDUCED_PREEMPT		10
 #define WAIT_FOR_RESET_TIME	10000
 
+struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		return engine;
+
+	pr_err("No valid engine found!\n");
+	return NULL;
+}
+
 int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 				 struct intel_selftest_saved_policy *saved,
 				 u32 modify_type)
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
index 35c098601ac0..ae60bb507f45 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
@@ -10,6 +10,7 @@
 
 struct i915_request;
 struct intel_engine_cs;
+struct intel_gt;
 
 struct intel_selftest_saved_policy {
 	u32 flags;
@@ -23,6 +24,7 @@ enum selftest_scheduler_modify {
 	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
 };
 
+struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
 int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 				 struct intel_selftest_saved_policy *saved,
 				 enum selftest_scheduler_modify modify_type);
-- 
2.32.0

