Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC083D030C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B346E5AB;
	Tue, 20 Jul 2021 20:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005CB6E51B;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="190909009"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="190909009"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906071"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 13/42] drm/i915/guc: Selftest for GuC flow control
Date: Tue, 20 Jul 2021 13:57:33 -0700
Message-Id: <20210720205802.39610-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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

Add 5 selftests for hard (from user space) to recreate flow conditions.
Test listed below:

1. A test to verify that the number of guc_ids can be exhausted and all
submissions still complete.

2. A test to verify that the flow control state machine can recover from
a full GPU reset.

3. A teset to verify that the lrcd registration slots can be exhausted
and all submissions still complete.

4. A test to verify that the H2G channel can deadlock and a full GPU
reset recovers the system.

5. A test to stress to CTB channel but submitting to lots of contexts
and then immediately destroy the contexts.

Tests 1, 2, and 3 also ensure when the flow control is triggered by
unready requests those unready requests do not DoS ready requests.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  43 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   9 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  16 +
 .../i915/gt/uc/intel_guc_submission_types.h   |   2 +
 .../i915/gt/uc/selftest_guc_flow_control.c    | 581 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../i915/selftests/intel_scheduler_helpers.c  |  12 +
 .../i915/selftests/intel_scheduler_helpers.h  |   1 +
 9 files changed, 661 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index b299a6772823..466cc6227503 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -103,6 +103,12 @@ struct intel_guc {
 
 	/* To serialize the intel_guc_send actions */
 	struct mutex send_mutex;
+
+	I915_SELFTEST_DECLARE(bool gse_hang_expected;)
+	I915_SELFTEST_DECLARE(bool deadlock_expected;)
+	I915_SELFTEST_DECLARE(bool bad_desc_expected;)
+	I915_SELFTEST_DECLARE(bool inject_bad_sched_disable;)
+	I915_SELFTEST_DECLARE(bool inject_corrupt_h2g;)
 };
 
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 92976d205478..59adf06e821b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -3,7 +3,6 @@
  * Copyright © 2016-2019 Intel Corporation
  */
 
-#include <linux/circ_buf.h>
 #include <linux/ktime.h>
 #include <linux/time64.h>
 #include <linux/timekeeping.h>
@@ -414,8 +413,9 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
-	if (unlikely(desc->status))
-		goto corrupted;
+	if (!I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
+		if (unlikely(desc->status))
+			goto corrupted;
 
 	GEM_BUG_ON(tail > size);
 
@@ -443,6 +443,15 @@ static int ct_write(struct intel_guc_ct *ct,
 		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
 		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
 
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+	if (ct_to_guc(ct)->inject_corrupt_h2g) {
+		header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, 3) |
+			 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len + 5) |
+			 FIELD_PREP(GUC_CTB_MSG_0_FENCE, 0xdead);
+		ct_to_guc(ct)->inject_corrupt_h2g = false;
+	}
+#endif
+
 	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
 		GUC_HXG_TYPE_REQUEST;
 	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
@@ -481,8 +490,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	return 0;
 
 corrupted:
-	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
-		 desc->head, desc->tail, desc->status);
+	if (I915_SELFTEST_ONLY(ct_to_guc(ct)->bad_desc_expected))
+		CT_DEBUG(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
+			 desc->head, desc->tail, desc->status);
+	else
+		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
+			 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
 }
@@ -539,9 +552,18 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
 		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
 
-		CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
-			 ktime_ms_delta(ktime_get(), ct->stall_time),
-			 send->status, recv->status);
+		/*
+		 * CI doesn't like error messages, demote to debug if deadlock was
+		 * intentionally hit.
+		 */
+		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
+			CT_DEBUG(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+				 ktime_ms_delta(ktime_get(), ct->stall_time),
+				 send->status, recv->status);
+		else
+			CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+				 ktime_ms_delta(ktime_get(), ct->stall_time),
+				 send->status, recv->status);
 		ct->ctbs.send.broken = true;
 	}
 
@@ -764,8 +786,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
-	if (unlikely(ct->ctbs.send.broken))
-		return -EPIPE;
+	if (!I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
+		if (unlikely(ct->ctbs.send.broken))
+			return -EPIPE;
 
 	if (flags & INTEL_GUC_CT_SEND_NB)
 		return ct_send_nb(ct, action, len, flags);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 7b34026d264a..bafc511771f1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -6,6 +6,7 @@
 #ifndef _INTEL_GUC_CT_H_
 #define _INTEL_GUC_CT_H_
 
+#include <linux/circ_buf.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -115,4 +116,12 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
 
 void intel_guc_ct_print_info(struct intel_guc_ct *ct, struct drm_printer *p);
 
+static inline bool intel_guc_ct_is_recv_buffer_empty(struct intel_guc_ct *ct)
+{
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
+
+	return atomic_read(&ctb->space) ==
+		(CIRC_SPACE(0, 0, ctb->size) - ctb->resv_space);
+}
+
 #endif /* _INTEL_GUC_CT_H_ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 8c3332e24d59..65f59497e7ef 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -818,6 +818,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 			GEM_WARN_ON(ret);	/* Unexpected */
 			goto deadlk;
 		}
+		I915_SELFTEST_DECLARE(++gse->tasklets_submit_count;)
 	}
 
 	/*
@@ -2092,7 +2093,15 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 		GUC_CONTEXT_DISABLE
 	};
 
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+	if (guc->inject_bad_sched_disable &&
+	    guc_id == GUC_INVALID_LRC_ID)
+		guc->inject_bad_sched_disable = false;
+	else
+		GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
+#else
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
+#endif
 
 	trace_intel_context_sched_disable(ce);
 
@@ -2739,6 +2748,9 @@ static void retire_worker_sched_disable(struct guc_submit_engine *gse,
 		guc_id = prep_context_pending_disable(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
+		if (I915_SELFTEST_ONLY(guc->inject_bad_sched_disable))
+			guc_id = GUC_INVALID_LRC_ID;
+
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			__guc_context_sched_disable(guc, ce, guc_id);
 
@@ -3991,3 +4003,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
 
 	return false;
 }
+
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+#include "selftest_guc_flow_control.c"
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
index 0c224ab18c02..7069b7248f55 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
@@ -47,6 +47,8 @@ struct guc_submit_engine {
 		STALL_MOVE_LRC_TAIL,
 		STALL_ADD_REQUEST,
 	} submission_stall_reason;
+
+	I915_SELFTEST_DECLARE(u64 tasklets_submit_count;)
 };
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
new file mode 100644
index 000000000000..f31ab2674b2b
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright �� 2021 Intel Corporation
+ */
+
+#include "selftests/igt_spinner.h"
+#include "selftests/igt_reset.h"
+#include "selftests/intel_scheduler_helpers.h"
+#include "gt/intel_engine_heartbeat.h"
+#include "gem/selftests/mock_context.h"
+
+static int __request_add_spin(struct i915_request *rq, struct igt_spinner *spin)
+{
+	int err = 0;
+
+	i915_request_get(rq);
+	i915_request_add(rq);
+	if (spin && !igt_wait_for_spinner(spin, rq))
+		err = -ETIMEDOUT;
+
+	return err;
+}
+
+static struct i915_request *nop_kernel_request(struct intel_engine_cs *engine)
+{
+	struct i915_request *rq;
+
+	rq = intel_engine_create_kernel_request(engine);
+	if (IS_ERR(rq))
+		return rq;
+
+	i915_request_get(rq);
+	i915_request_add(rq);
+
+	return rq;
+}
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
+static int nop_request_wait(struct intel_engine_cs *engine, bool kernel,
+			    bool flow_control)
+{
+	struct i915_gpu_error *global = &engine->gt->i915->gpu_error;
+	unsigned int reset_count = i915_reset_count(global);
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct guc_submit_engine *gse = guc->gse[GUC_SUBMIT_ENGINE_SINGLE_LRC];
+	u64 tasklets_submit_count = gse->tasklets_submit_count;
+	struct intel_context *ce;
+	struct i915_request *nop;
+	int ret;
+
+	if (kernel) {
+		nop = nop_kernel_request(engine);
+	} else {
+		ce = intel_context_create(engine);
+		if (IS_ERR(ce))
+			return PTR_ERR(ce);
+		nop = nop_user_request(ce, NULL);
+		intel_context_put(ce);
+	}
+	if (IS_ERR(nop))
+		return PTR_ERR(nop);
+
+	ret = intel_selftest_wait_for_rq(nop);
+	i915_request_put(nop);
+	if (ret)
+		return ret;
+
+	if (!flow_control &&
+	    gse->tasklets_submit_count != tasklets_submit_count) {
+		pr_err("Flow control for single-lrc unexpectedly kicked in\n");
+		ret = -EINVAL;
+	}
+
+	if (flow_control &&
+	    gse->tasklets_submit_count == tasklets_submit_count) {
+		pr_err("Flow control for single-lrc did not kick in\n");
+		ret = -EINVAL;
+	}
+
+	if (i915_reset_count(global) != reset_count) {
+		pr_err("Unexpected GPU reset during single-lrc submit\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+#define NUM_GUC_ID		256
+#define NUM_CONTEXT		1024
+#define NUM_RQ_PER_CONTEXT	2
+#define HEARTBEAT_INTERVAL	1500
+
+static int __intel_guc_flow_control_guc(void *arg, bool limit_guc_ids, bool hang)
+{
+	struct intel_gt *gt = arg;
+	struct intel_guc *guc = &gt->uc.guc;
+	struct guc_submit_engine *gse = guc->gse[GUC_SUBMIT_ENGINE_SINGLE_LRC];
+	struct intel_context **contexts;
+	int ret = 0;
+	int i, j, k;
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *spin_rq = NULL, *last = NULL;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct i915_gpu_error *global = &gt->i915->gpu_error;
+	unsigned int reset_count;
+	u64 tasklets_submit_count = gse->tasklets_submit_count;
+	u32 old_beat;
+
+	contexts = kmalloc(sizeof(*contexts) * NUM_CONTEXT, GFP_KERNEL);
+	if (!contexts) {
+		pr_err("Context array allocation failed\n");
+		return -ENOMEM;
+	}
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	if (limit_guc_ids)
+		guc->num_guc_ids = NUM_GUC_ID;
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
+			pr_err("Failed to boost heartbeat interval: %d\n", ret);
+			goto err;
+		}
+	}
+
+	/* Create spinner to block requests in below loop */
+	ret = igt_spinner_init(&spin, engine->gt);
+	if (ret) {
+		pr_err("Failed to create spinner: %d\n", ret);
+		goto err_heartbeat;
+	}
+	spin_rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
+	intel_context_put(ce);
+	if (IS_ERR(spin_rq)) {
+		ret = PTR_ERR(spin_rq);
+		pr_err("Failed to create spinner request: %d\n", ret);
+		goto err_heartbeat;
+	}
+	ret = __request_add_spin(spin_rq, &spin);
+	if (ret) {
+		pr_err("Failed to add Spinner request: %d\n", ret);
+		goto err_spin_rq;
+	}
+
+	/*
+	 * Create of lot of requests in a loop to trigger the flow control state
+	 * machine. Using a three level loop as it is interesting to hit flow
+	 * control with more than 1 request on each context in a row and also
+	 * interleave requests with other contexts.
+	 */
+	for (i = 0; i < NUM_RQ_PER_CONTEXT; ++i) {
+		for (j = 0; j < NUM_CONTEXT; ++j) {
+			for (k = 0; k < NUM_RQ_PER_CONTEXT; ++k) {
+				bool first_pass = !i && !k;
+
+				if (last)
+					i915_request_put(last);
+				last = NULL;
+
+				if (first_pass)
+					contexts[j] = intel_context_create(engine);
+				ce = contexts[j];
+
+				if (IS_ERR(ce)) {
+					ret = PTR_ERR(ce);
+					pr_err("Failed to create context, %d,%d,%d: %d\n",
+					       i, j, k, ret);
+					goto err_spin_rq;
+				}
+
+				last = nop_user_request(ce, spin_rq);
+				if (first_pass)
+					intel_context_put(ce);
+				if (IS_ERR(last)) {
+					ret = PTR_ERR(last);
+					pr_err("Failed to create request, %d,%d,%d: %d\n",
+					       i, j, k, ret);
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
+	ret = nop_request_wait(engine, false, true);
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
+	ret = i915_request_wait(last, 0, hang ? HZ * 30 : HZ * 10);
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
+static int intel_guc_flow_control_guc_ids(void *arg)
+{
+	return __intel_guc_flow_control_guc(arg, true, false);
+}
+
+static int intel_guc_flow_control_lrcd_reg(void *arg)
+{
+	return __intel_guc_flow_control_guc(arg, false, false);
+}
+
+static int intel_guc_flow_control_hang_state_machine(void *arg)
+{
+	return __intel_guc_flow_control_guc(arg, true, true);
+}
+
+#define NUM_RQ_STRESS_CTBS	0x4000
+static int intel_guc_flow_control_stress_ctbs(void *arg)
+{
+	struct intel_gt *gt = arg;
+	int ret = 0;
+	int i;
+	struct intel_context *ce;
+	struct i915_request *last = NULL, *rq;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct i915_gpu_error *global = &gt->i915->gpu_error;
+	unsigned int reset_count;
+	struct intel_guc *guc = &gt->uc.guc;
+	struct intel_guc_ct_buffer *ctb = &guc->ct.ctbs.recv;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	reset_count = i915_reset_count(global);
+	engine = intel_selftest_find_any_engine(gt);
+
+	/*
+	 * Create a bunch of requests, and then idle the GT which will create a
+	 * lot of H2G / G2H traffic.
+	 */
+	for (i = 0; i < NUM_RQ_STRESS_CTBS; ++i) {
+		ce = intel_context_create(engine);
+		if (IS_ERR(ce)) {
+			ret = PTR_ERR(ce);
+			pr_err("Failed to create context, %d: %d\n", i, ret);
+			goto err;
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
+		if (last)
+			i915_request_put(last);
+		last = rq;
+	}
+
+	ret = i915_request_wait(last, 0, HZ * 10);
+	if (ret < 0) {
+		pr_err("Last request failed to complete: %d\n", ret);
+		goto err;
+	}
+	i915_request_put(last);
+	last = NULL;
+
+	ret = intel_gt_wait_for_idle(gt, HZ * 10);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err;
+	}
+
+	if (i915_reset_count(global) != reset_count) {
+		pr_err("Unexpected GPU reset\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = nop_request_wait(engine, true, false);
+	if (ret < 0) {
+		pr_err("Kernel NOP failed to complete: %d\n", ret);
+		goto err;
+	}
+
+	ret = nop_request_wait(engine, false, false);
+	if (ret < 0) {
+		pr_err("User NOP failed to complete: %d\n", ret);
+		goto err;
+	}
+
+	ret = intel_gt_wait_for_idle(gt, HZ);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err;
+	}
+
+	ret = wait_for(intel_guc_ct_is_recv_buffer_empty(&guc->ct), HZ);
+	if (ret) {
+		pr_err("Recv CTB not expected value=%d,%d outstanding_ctb=%d\n",
+		       atomic_read(&ctb->space),
+		       CIRC_SPACE(0, 0, ctb->size) - ctb->resv_space,
+		       atomic_read(&guc->outstanding_submission_g2h));
+		ret = -EINVAL;
+		goto err;
+	}
+
+err:
+	if (last)
+		i915_request_put(last);
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+
+	return ret;
+}
+
+#define NUM_RQ_DEADLOCK		2048
+static int __intel_guc_flow_control_deadlock_h2g(void *arg, bool bad_desc)
+{
+	struct intel_gt *gt = arg;
+	struct intel_guc *guc = &gt->uc.guc;
+	int ret = 0;
+	int i;
+	struct intel_context *ce;
+	struct i915_request *last = NULL, *rq;
+	intel_wakeref_t wakeref;
+	struct intel_engine_cs *engine;
+	struct i915_gpu_error *global = &gt->i915->gpu_error;
+	unsigned int reset_count;
+	u32 old_beat;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	reset_count = i915_reset_count(global);
+	engine = intel_selftest_find_any_engine(gt);
+
+	old_beat = engine->props.heartbeat_interval_ms;
+	ret = intel_engine_set_heartbeat(engine, HEARTBEAT_INTERVAL);
+	if (ret) {
+		pr_err("Failed to boost heartbeat interval: %d\n", ret);
+		goto err;
+	}
+
+	guc->inject_corrupt_h2g = true;
+	if (bad_desc)
+		guc->bad_desc_expected = true;
+	else
+		guc->deadlock_expected = true;
+
+	for (i = 0; i < NUM_RQ_DEADLOCK; ++i) {
+		ce = intel_context_create(engine);
+		if (IS_ERR(ce)) {
+			ret = PTR_ERR(ce);
+			pr_err("Failed to create context, %d: %d\n", i, ret);
+			goto err_heartbeat;
+		}
+
+		rq = nop_user_request(ce, NULL);
+		intel_context_put(ce);
+
+		if (IS_ERR(rq)) {
+			ret = PTR_ERR(rq);
+			pr_err("Failed to create request, %d: %d\n", i, ret);
+			goto err_heartbeat;
+		}
+
+		if (last)
+			i915_request_put(last);
+		last = rq;
+	}
+
+	pr_debug("Number requests before deadlock: %d\n", i);
+
+	ret = i915_request_wait(last, 0, HZ * 5);
+	if (ret < 0) {
+		pr_err("Last request failed to complete: %d\n", ret);
+		goto err_heartbeat;
+	}
+	i915_request_put(last);
+	last = NULL;
+
+	ret = intel_gt_wait_for_idle(gt, HZ * 10);
+	if (ret < 0) {
+		pr_err("GT failed to idle: %d\n", ret);
+		goto err_heartbeat;
+	}
+
+	if (i915_reset_count(global) == reset_count) {
+		pr_err("Failed to record a GPU reset\n");
+		ret = -EINVAL;
+		goto err_heartbeat;
+	}
+
+	ret = nop_request_wait(engine, true, false);
+	if (ret < 0) {
+		pr_err("Kernel NOP failed to complete: %d\n", ret);
+		goto err_heartbeat;
+	}
+
+	ret = nop_request_wait(engine, false, false);
+	if (ret < 0) {
+		pr_err("User NOP failed to complete: %d\n", ret);
+		goto err_heartbeat;
+	}
+
+err_heartbeat:
+	if (last)
+		i915_request_put(last);
+	intel_engine_set_heartbeat(engine, old_beat);
+err:
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
+	guc->inject_corrupt_h2g = false;
+	guc->deadlock_expected = false;
+	guc->bad_desc_expected = false;
+
+	return ret;
+}
+
+static int intel_guc_flow_control_deadlock_h2g(void *arg)
+{
+	return __intel_guc_flow_control_deadlock_h2g(arg, false);
+}
+
+static int intel_guc_flow_control_bad_desc_h2g(void *arg)
+{
+	return __intel_guc_flow_control_deadlock_h2g(arg, true);
+}
+
+int intel_guc_flow_control(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(intel_guc_flow_control_stress_ctbs),
+		SUBTEST(intel_guc_flow_control_guc_ids),
+		SUBTEST(intel_guc_flow_control_lrcd_reg),
+		SUBTEST(intel_guc_flow_control_hang_state_machine),
+		SUBTEST(intel_guc_flow_control_deadlock_h2g),
+		SUBTEST(intel_guc_flow_control_bad_desc_h2g),
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
index e2fd1b61af71..d9bd732b741a 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -47,5 +47,6 @@ selftest(hangcheck, intel_hangcheck_live_selftests)
 selftest(execlists, intel_execlists_live_selftests)
 selftest(ring_submission, intel_ring_submission_live_selftests)
 selftest(perf, i915_perf_live_selftests)
+selftest(guc_flow_control, intel_guc_flow_control)
 /* Here be dragons: keep last to run last! */
 selftest(late_gt_pm, intel_gt_pm_late_selftests)
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index ebd6d69b3315..f83c8c6c0d9b 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -15,6 +15,18 @@
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
index 050bc5a8ba8b..01ba01603837 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
@@ -31,5 +31,6 @@ int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 int intel_selftest_restore_policy(struct intel_engine_cs *engine,
 				  struct intel_selftest_saved_policy *saved);
 int intel_selftest_wait_for_rq( struct i915_request *rq);
+struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
 
 #endif
-- 
2.28.0

