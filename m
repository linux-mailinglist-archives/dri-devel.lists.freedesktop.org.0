Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB63DF784
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37C6E923;
	Tue,  3 Aug 2021 22:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA3B6E17E;
 Tue,  3 Aug 2021 22:11:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193393475"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="193393475"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512727"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/46] drm/i915/guc: Extend GuC flow control selftest for
 multi-lrc
Date: Tue,  3 Aug 2021 15:29:26 -0700
Message-Id: <20210803222943.27686-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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

Prove multi-lrc and single-lrc are independent.
Prove multi-lrc guc_ids flow control works.
Prove multi-lrc hanging the tastlet can recover from a GPU reset.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../i915/gt/uc/selftest_guc_flow_control.c    | 299 ++++++++++++++++++
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  15 +-
 2 files changed, 312 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
index f31ab2674b2b..9cfecf9d368e 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
@@ -110,6 +110,65 @@ static int nop_request_wait(struct intel_engine_cs *engine, bool kernel,
 	return ret;
 }
 
+static int multi_lrc_not_blocked(struct intel_gt *gt, bool flow_control)
+{
+	struct intel_guc *guc = &gt->uc.guc;
+	struct i915_gpu_error *global = &gt->i915->gpu_error;
+	struct guc_submit_engine *gse = guc->gse[GUC_SUBMIT_ENGINE_MULTI_LRC];
+	unsigned int reset_count = i915_reset_count(global);
+	u64 tasklets_submit_count = gse->tasklets_submit_count;
+	struct intel_context *parent;
+	struct i915_request *rq;
+	int ret;
+
+	parent = multi_lrc_create_parent(gt, VIDEO_DECODE_CLASS, 0);
+	if (IS_ERR(parent)) {
+		pr_err("Failed creating multi-lrc contexts: %ld",
+		       PTR_ERR(parent));
+		return PTR_ERR(parent);
+	} else if (!parent) {
+		pr_debug("Not enough engines in class: %d",
+			 VIDEO_DECODE_CLASS);
+		return 0;
+	}
+
+	rq = multi_lrc_nop_request(parent, NULL);
+	if (IS_ERR(rq)) {
+		ret = PTR_ERR(rq);
+		pr_err("Failed creating multi-lrc requests: %d", ret);
+		goto out;
+	}
+
+	ret = intel_selftest_wait_for_rq(rq);
+	if (ret)
+		pr_err("Failed waiting on multi-lrc request: %d", ret);
+
+	i915_request_put(rq);
+	if (ret)
+		goto out;
+
+	if (!flow_control &&
+	    gse->tasklets_submit_count != tasklets_submit_count) {
+		pr_err("Flow control for multi-lrc unexpectedly kicked in\n");
+		ret = -EINVAL;
+	}
+
+	if (flow_control &&
+	    gse->tasklets_submit_count == tasklets_submit_count) {
+		pr_err("Flow control for multi-lrc did not kick in\n");
+		ret = -EINVAL;
+	}
+
+	if (i915_reset_count(global) != reset_count) {
+		pr_err("Unexpected GPU reset during multi-lrc submit\n");
+		ret = -EINVAL;
+	}
+
+out:
+	multi_lrc_context_put(parent);
+	return ret;
+}
+
 #define NUM_GUC_ID		256
 #define NUM_CONTEXT		1024
 #define NUM_RQ_PER_CONTEXT	2
@@ -240,6 +299,13 @@ static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang
 		goto err_spin_rq;
 	}
 
+	/* Ensure Multi-LRC not blocked */
+	ret = multi_lrc_not_blocked(gt, !limit_guc_ids);
+	if (ret < 0) {
+		pr_err("Multi-lrc can't make progress: %d\n", ret);
+		goto err_spin_rq;
+	}
+
 	/* Inject hang in flow control state machine */
 	if (hang) {
 		guc->gse_hang_expected = true;
@@ -559,6 +625,237 @@ static int intel_guc_flow_control_bad_desc_h2g(void *arg)
 	return __intel_guc_flow_control_deadlock_h2g(arg, true);
 }
 
+#define NUM_CONTEXT_MULTI_LRC	256
+
+static int
+__intel_guc_flow_control_multi_lrc_guc(void *arg, bool limit_guc_ids, bool hang)
+{
+	struct intel_gt *gt = arg;
+	struct intel_guc *guc = &gt->uc.guc;
+	struct guc_submit_engine *gse = guc->gse[GUC_SUBMIT_ENGINE_MULTI_LRC];
+	struct intel_context **contexts;
+	int ret = 0;
+	int i, j, k;
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *spin_rq, *last = NULL;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct i915_gpu_error *global = &gt->i915->gpu_error;
+	unsigned int reset_count;
+	u64 tasklets_submit_count = gse->tasklets_submit_count;
+	u32 old_beat;
+
+	if (limit_guc_ids)
+		guc->num_guc_ids = NUM_GUC_ID;
+
+	contexts = kmalloc(sizeof(*contexts) * NUM_CONTEXT, GFP_KERNEL);
+	if (!contexts) {
+		pr_err("Context array allocation failed\n");
+		return -ENOMEM;
+	}
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	ce = intel_context_create(intel_selftest_find_any_engine(gt));
+	if (IS_ERR(ce)) {
+		ret = PTR_ERR(ce);
+		pr_err("Failed to create context: %d\n", ret);
+		goto err;
+	}
+
+	reset_count = i915_reset_count(global);
+	engine = ce->engine;
+
+	old_beat = engine->props.heartbeat_interval_ms;
+	if (hang) {
+		ret = intel_engine_set_heartbeat(engine, HEARTBEAT_INTERVAL);
+		if (ret) {
+			pr_err("Failed to boost heatbeat interval: %d\n", ret);
+			intel_context_put(ce);
+			goto err;
+		}
+	}
+
+	/* Create spinner to block requests in below loop */
+	ret = igt_spinner_init(&spin, engine->gt);
+	if (ret) {
+		pr_err("Failed to create spinner: %d\n", ret);
+		intel_context_put(ce);
+		goto err_heartbeat;
+	}
+	spin_rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	intel_context_put(ce);
+	if (IS_ERR(spin_rq)) {
+		ret = PTR_ERR(spin_rq);
+		pr_err("Failed to create spinner request: %d\n", ret);
+		goto err_spin_rq;
+	}
+	ret = __request_add_spin(spin_rq, &spin);
+	if (ret) {
+		pr_err("Failed to add Spinner request: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+	for (i = 0; i < NUM_RQ_PER_CONTEXT; ++i) {
+		for (j = 0; j < NUM_CONTEXT_MULTI_LRC; ++j) {
+			for (k = 0; k < NUM_RQ_PER_CONTEXT; ++k) {
+				bool first_pass = !i && !k;
+
+				if (last)
+					i915_request_put(last);
+				last = NULL;
+				if (first_pass)
+					contexts[j] = multi_lrc_create_parent(gt, VIDEO_DECODE_CLASS, 0);
+				ce = contexts[j];
+
+				if (IS_ERR(ce)) {
+					ret = PTR_ERR(ce);
+					pr_err("Failed to create context: %d\n", ret);
+					goto err_spin_rq;
+				} else if (!ce) {
+					ret = 0;
+					goto err_spin_rq;
+				}
+
+				last = multi_lrc_nop_request(ce, spin_rq);
+				if (first_pass)
+					multi_lrc_context_put(ce);
+				if (IS_ERR(last)) {
+					ret = PTR_ERR(last);
+					pr_err("Failed to create request: %d\n", ret);
+					goto err_spin_rq;
+				}
+			}
+		}
+	}
+
+	/* Verify GuC submit engine state */
+	if (limit_guc_ids && !guc_ids_exhausted(gse)) {
+		pr_err("guc_ids not exhausted\n");
+		ret = -EINVAL;
+		goto err_spin_rq;
+	}
+	if (!limit_guc_ids && guc_ids_exhausted(gse)) {
+		pr_err("guc_ids exhausted\n");
+		ret = -EINVAL;
+		goto err_spin_rq;
+	}
+
+	/* Ensure no DoS from unready requests */
+	ret = multi_lrc_not_blocked(gt, true);
+	if (ret < 0) {
+		pr_err("Multi-lrc DoS: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+	/* Ensure Single-LRC not blocked, not in flow control */
+	ret = nop_request_wait(engine, false, !limit_guc_ids);
+	if (ret < 0) {
+		pr_err("User NOP request DoS: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+	/* Inject hang in flow control state machine */
+	if (hang) {
+		guc->gse_hang_expected = true;
+		guc->inject_bad_sched_disable = true;
+	}
+
+	/* Release blocked requests */
+	igt_spinner_end(&spin);
+	ret = intel_selftest_wait_for_rq(spin_rq);
+	if (ret) {
+		pr_err("Spin request failed to complete: %d\n", ret);
+		goto err_spin_rq;
+	}
+	i915_request_put(spin_rq);
+	igt_spinner_fini(&spin);
+	spin_rq = NULL;
+
+	/* Wait for last request / GT to idle */
+	ret = i915_request_wait(last, 0, hang ? HZ * 30 : HZ * 5);
+	if (ret < 0) {
+		pr_err("Last request failed to complete: %d\n", ret);
+		goto err_spin_rq;
+	}
+	i915_request_put(last);
+	last = NULL;
+	ret = intel_gt_wait_for_idle(gt, HZ * 5);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+	/* Check state after idle */
+	if (guc_ids_exhausted(gse)) {
+		pr_err("guc_ids exhausted after last request signaled\n");
+		ret = -EINVAL;
+		goto err_spin_rq;
+	}
+	if (hang) {
+		if (i915_reset_count(global) == reset_count) {
+			pr_err("Failed to record a GPU reset\n");
+			ret = -EINVAL;
+			goto err_spin_rq;
+		}
+	} else {
+		if (i915_reset_count(global) != reset_count) {
+			pr_err("Unexpected GPU reset\n");
+			ret = -EINVAL;
+			goto err_spin_rq;
+		}
+		if (gse->tasklets_submit_count == tasklets_submit_count) {
+			pr_err("Flow control failed to kick in\n");
+			ret = -EINVAL;
+			goto err_spin_rq;
+		}
+	}
+
+	/* Verify requests can be submitted after flow control */
+	ret = nop_request_wait(engine, true, false);
+	if (ret < 0) {
+		pr_err("Kernel NOP failed to complete: %d\n", ret);
+		goto err_spin_rq;
+	}
+	ret = nop_request_wait(engine, false, false);
+	if (ret < 0) {
+		pr_err("User NOP failed to complete: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+err_spin_rq:
+	if (spin_rq) {
+		igt_spinner_end(&spin);
+		intel_selftest_wait_for_rq(spin_rq);
+		i915_request_put(spin_rq);
+		igt_spinner_fini(&spin);
+		intel_gt_wait_for_idle(gt, HZ * 5);
+	}
+err_heartbeat:
+	if (last)
+		i915_request_put(last);
+	intel_engine_set_heartbeat(engine, old_beat);
+err:
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+	guc->num_guc_ids = guc->max_guc_ids;
+	guc->gse_hang_expected = false;
+	guc->inject_bad_sched_disable = false;
+	kfree(contexts);
+
+	return ret;
+}
+
+static int intel_guc_flow_control_multi_lrc_guc_ids(void *arg)
+{
+	return __intel_guc_flow_control_multi_lrc_guc(arg, true, false);
+}
+
+static int intel_guc_flow_control_multi_lrc_hang(void *arg)
+{
+	return __intel_guc_flow_control_multi_lrc_guc(arg, true, true);
+}
+
 int intel_guc_flow_control(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
@@ -566,6 +863,8 @@ int intel_guc_flow_control(struct drm_i915_private *i915)
 		SUBTEST(intel_guc_flow_control_guc_ids),
 		SUBTEST(intel_guc_flow_control_lrcd_reg),
 		SUBTEST(intel_guc_flow_control_hang_state_machine),
+		SUBTEST(intel_guc_flow_control_multi_lrc_guc_ids),
+		SUBTEST(intel_guc_flow_control_multi_lrc_hang),
 		SUBTEST(intel_guc_flow_control_deadlock_h2g),
 		SUBTEST(intel_guc_flow_control_bad_desc_h2g),
 	};
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index 82eb666bba51..21b4a79778ef 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -62,11 +62,12 @@ static void multi_lrc_context_put(struct intel_context *ce)
 }
 
 static struct i915_request *
-multi_lrc_nop_request(struct intel_context *ce)
+multi_lrc_nop_request(struct intel_context *ce, struct i915_request *from)
 {
 	struct intel_context *child;
 	struct i915_request *rq, *child_rq;
 	int i = 0;
+	int ret;
 
 	GEM_BUG_ON(!intel_context_is_parent(ce));
 
@@ -74,6 +75,16 @@ multi_lrc_nop_request(struct intel_context *ce)
 	if (IS_ERR(rq))
 		return rq;
 
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
 	i915_request_get(rq);
 	i915_request_add(rq);
 
@@ -112,7 +123,7 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
 		return 0;
 	}
 
-	rq = multi_lrc_nop_request(parent);
+	rq = multi_lrc_nop_request(parent, NULL);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
 		pr_err("Failed creating requests: %d", ret);
-- 
2.28.0

