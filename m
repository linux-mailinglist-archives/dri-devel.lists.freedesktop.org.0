Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F332195CD40
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AAD10E752;
	Fri, 23 Aug 2024 13:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiSzosMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732E10E721;
 Fri, 23 Aug 2024 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418594; x=1755954594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cx+XmcS3z2vAt1vxfiWyFW+VmG7nPyNluzVKg+zEmi4=;
 b=RiSzosMOAD1UuhvLdIhczoizfZDcL+Iwgpf3rKg3h1x0ZZU9ZW3V1ztA
 hy2uIlyZjmtL3n13JIxPNNWYP0Fd518CPdLyYftQClhHecV6n6bwodFH1
 +pfYok8isUVsmOW259/QEUoc5QRTMHSmd47KEp2as2GST8mqS3wr7F4FJ
 /58ytIF1WrmD9bHYFCSpWBsW3vtgLoYOljitKWhZDbCuF45NscCyoinDq
 8qdVpy3RnY2tlxkOBO8adtPGGQnc+FGr8fdhUCVtkcQ00ZDAD3tQI8qf9
 Ok7uMkHctinQa+mubRp+3cajv55Cp1iyqiCaTe5q9VD4+gCV7bEHthqMn Q==;
X-CSE-ConnectionGUID: IAdZxnAIRpWrDRBUTUeA6Q==
X-CSE-MsgGUID: PrVrBLJLQFSnXaEDeFk4LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22483304"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22483304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:09:53 -0700
X-CSE-ConnectionGUID: rnV/eNmnQ+SnO/5DFK9ltg==
X-CSE-MsgGUID: r1qrTqEJRFSXC1bFocEXxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66614342"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:09:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 06/15] drm/i915/gt: Introduce for_each_enabled_engine() and
 apply it in selftests
Date: Fri, 23 Aug 2024 15:08:46 +0200
Message-ID: <20240823130855.72436-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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

Selftests should run only on enabled engines, as disabled engines
are not intended for use. A practical example is when, on DG2
machines, the user chooses to utilize only one CCS stream instead
of all four.

To address this, introduce the for_each_enabled_engine() loop,
which will skip engines when they are marked as RB_EMPTY.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.h            | 12 +++++
 drivers/gpu/drm/i915/gt/selftest_context.c    |  6 +--
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  6 +--
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |  6 +--
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 52 +++++++++----------
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 22 ++++----
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 18 +++----
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |  6 +--
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |  4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +--
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 14 ++---
 drivers/gpu/drm/i915/gt/selftest_timeline.c   | 14 ++---
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |  2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 14 ++---
 17 files changed, 102 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 998ca029b73a..1c9d861241ad 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -188,6 +188,18 @@ int intel_gt_tiles_init(struct drm_i915_private *i915);
 	     (id__)++) \
 		for_each_if ((engine__) = (gt__)->engine[(id__)])
 
+/*
+ * Iterator over all initialized and enabled engines. Some engines, like CCS,
+ * may be "disabled" (i.e., not exposed to the user). Disabling is indicated
+ * by marking the rb_node as empty.
+ */
+#define for_each_enabled_engine(engine__, gt__, id__) \
+	for ((id__) = 0; \
+	     (id__) < I915_NUM_ENGINES; \
+	     (id__)++) \
+		for_each_if (((engine__) = (gt__)->engine[(id__)]) && \
+			     (!RB_EMPTY_NODE(&(engine__)->uabi_node)))
+
 /* Iterator over subset of engines selected by mask */
 #define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
 	for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 5eb46700dc4e..9976e231248d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -157,7 +157,7 @@ static int live_context_size(void *arg)
 	 * HW tries to write past the end of one.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct file *saved;
 
 		if (!engine->context_size)
@@ -311,7 +311,7 @@ static int live_active_context(void *arg)
 	enum intel_engine_id id;
 	int err = 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = __live_active_context(engine);
 		if (err)
 			break;
@@ -424,7 +424,7 @@ static int live_remote_context(void *arg)
 	enum intel_engine_id id;
 	int err = 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = __live_remote_context(engine);
 		if (err)
 			break;
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 5ffa5e30f419..038723a401df 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -142,7 +142,7 @@ static int perf_mi_bb_start(void *arg)
 		return 0;
 
 	wakeref = perf_begin(gt);
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce = engine->kernel_context;
 		struct i915_vma *batch;
 		u32 cycles[COUNT];
@@ -270,7 +270,7 @@ static int perf_mi_noop(void *arg)
 		return 0;
 
 	wakeref = perf_begin(gt);
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce = engine->kernel_context;
 		struct i915_vma *base, *nop;
 		u32 cycles[COUNT];
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index 9e4f0e417b3b..74d4c2dc69cf 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -160,7 +160,7 @@ static int live_idle_flush(void *arg)
 
 	/* Check that we can flush the idle barriers */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		st_engine_heartbeat_disable(engine);
 		err = __live_idle_pulse(engine, intel_engine_flush_barriers);
 		st_engine_heartbeat_enable(engine);
@@ -180,7 +180,7 @@ static int live_idle_pulse(void *arg)
 
 	/* Check that heartbeat pulses flush the idle barriers */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		st_engine_heartbeat_disable(engine);
 		err = __live_idle_pulse(engine, intel_engine_pulse);
 		st_engine_heartbeat_enable(engine);
@@ -246,7 +246,7 @@ static int live_heartbeat_off(void *arg)
 	if (!CONFIG_DRM_I915_HEARTBEAT_INTERVAL)
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		if (!intel_engine_has_preemption(engine))
 			continue;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
index 10e556a7eac4..1da3bddbf02e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
@@ -203,7 +203,7 @@ static int live_engine_timestamps(void *arg)
 	if (GRAPHICS_VER(gt->i915) < 8)
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		int err;
 
 		st_engine_heartbeat_disable(engine);
@@ -257,7 +257,7 @@ static int live_engine_busy_stats(void *arg)
 		return -ENOMEM;
 
 	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		ktime_t busyness, dummy;
 		ktime_t de, dt;
@@ -363,7 +363,7 @@ static int live_engine_pm(void *arg)
 	}
 
 	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		const typeof(*igt_atomic_phases) *p;
 
 		for (p = igt_atomic_phases; p->name; p++) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 4202df5b8c12..4179f9c0d650 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -120,7 +120,7 @@ static int live_sanitycheck(void *arg)
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		struct i915_request *rq;
 
@@ -177,7 +177,7 @@ static int live_unlite_restore(struct intel_gt *gt, int prio)
 		return err;
 
 	err = 0;
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce[2] = {};
 		struct i915_request *rq[2];
 		struct igt_live_test t;
@@ -339,7 +339,7 @@ static int live_unlite_ring(void *arg)
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce[2] = {};
 		struct i915_request *rq;
 		struct igt_live_test t;
@@ -488,7 +488,7 @@ static int live_pin_rewind(void *arg)
 	 * To simulate this, let's apply a bit of deliberate sabotague.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		struct i915_request *rq;
 		struct intel_ring *ring;
@@ -596,7 +596,7 @@ static int live_hold_reset(void *arg)
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		struct i915_request *rq;
 
@@ -703,7 +703,7 @@ static int live_error_interrupt(void *arg)
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		const struct error_phase *p;
 		int err = 0;
 
@@ -938,7 +938,7 @@ slice_semaphore_queue(struct intel_engine_cs *outer,
 	if (IS_ERR(head))
 		return PTR_ERR(head);
 
-	for_each_engine(engine, outer->gt, id) {
+	for_each_enabled_engine(engine, outer->gt, id) {
 		if (!intel_engine_has_preemption(engine))
 			continue;
 
@@ -1018,7 +1018,7 @@ static int live_timeslice_preempt(void *arg)
 	if (err)
 		goto err_pin;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		if (!intel_engine_has_preemption(engine))
 			continue;
 
@@ -1124,7 +1124,7 @@ static int live_timeslice_rewind(void *arg)
 	if (!CONFIG_DRM_I915_TIMESLICE_DURATION)
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		enum { A1, A2, B1 };
 		enum { X = 1, Z, Y };
 		struct i915_request *rq[3] = {};
@@ -1325,7 +1325,7 @@ static int live_timeslice_queue(void *arg)
 	if (err)
 		goto err_pin;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_sched_attr attr = { .priority = I915_PRIORITY_MAX };
 		struct i915_request *rq, *nop;
 
@@ -1425,7 +1425,7 @@ static int live_timeslice_nopreempt(void *arg)
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		struct i915_request *rq;
 		unsigned long timeslice;
@@ -1578,7 +1578,7 @@ static int live_busywait_preempt(void *arg)
 	if (err)
 		goto err_vma;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *lo, *hi;
 		struct igt_live_test t;
 		u32 *cs;
@@ -1754,7 +1754,7 @@ static int live_preempt(void *arg)
 	if (igt_spinner_init(&spin_lo, gt))
 		goto err_spin_hi;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct igt_live_test t;
 		struct i915_request *rq;
 
@@ -1847,7 +1847,7 @@ static int live_late_preempt(void *arg)
 	/* Make sure ctx_lo stays before ctx_hi until we trigger preemption. */
 	ctx_lo->sched.priority = 1;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct igt_live_test t;
 		struct i915_request *rq;
 
@@ -1969,7 +1969,7 @@ static int live_nopreempt(void *arg)
 		goto err_client_a;
 	b.ctx->sched.priority = I915_PRIORITY_MAX;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq_a, *rq_b;
 
 		if (!intel_engine_has_preemption(engine))
@@ -2396,7 +2396,7 @@ static int live_preempt_cancel(void *arg)
 	if (preempt_client_init(gt, &data.b))
 		goto err_client_a;
 
-	for_each_engine(data.engine, gt, id) {
+	for_each_enabled_engine(data.engine, gt, id) {
 		if (!intel_engine_has_preemption(data.engine))
 			continue;
 
@@ -2463,7 +2463,7 @@ static int live_suppress_self_preempt(void *arg)
 	if (preempt_client_init(gt, &b))
 		goto err_client_a;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq_a, *rq_b;
 		int depth;
 
@@ -2570,7 +2570,7 @@ static int live_chain_preempt(void *arg)
 	if (preempt_client_init(gt, &lo))
 		goto err_client_hi;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_sched_attr attr = { .priority = I915_PRIORITY_MAX };
 		struct igt_live_test t;
 		struct i915_request *rq;
@@ -2928,7 +2928,7 @@ static int live_preempt_ring(void *arg)
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		int n;
 
 		if (!intel_engine_has_preemption(engine))
@@ -2971,7 +2971,7 @@ static int live_preempt_gang(void *arg)
 	 * high priority levels into execution order.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq = NULL;
 		struct igt_live_test t;
 		IGT_TIMEOUT(end_time);
@@ -3277,7 +3277,7 @@ static int live_preempt_user(void *arg)
 		return PTR_ERR(result);
 	}
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *client[3] = {};
 		struct igt_live_test t;
 		int i;
@@ -3393,7 +3393,7 @@ static int live_preempt_timeout(void *arg)
 	if (igt_spinner_init(&spin_lo, gt))
 		goto err_ctx_lo;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		unsigned long saved_timeout;
 		struct i915_request *rq;
 
@@ -3567,7 +3567,7 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 
 	memset(arg, 0, I915_NUM_ENGINES * sizeof(*arg));
 
-	for_each_engine(engine, smoke->gt, id) {
+	for_each_enabled_engine(engine, smoke->gt, id) {
 		arg[id] = *smoke;
 		arg[id].engine = engine;
 		if (!(flags & BATCH))
@@ -3585,7 +3585,7 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 	}
 
 	count = 0;
-	for_each_engine(engine, smoke->gt, id) {
+	for_each_enabled_engine(engine, smoke->gt, id) {
 		if (IS_ERR_OR_NULL(worker[id]))
 			continue;
 
@@ -3613,7 +3613,7 @@ static int smoke_random(struct preempt_smoke *smoke, unsigned int flags)
 
 	count = 0;
 	do {
-		for_each_engine(smoke->engine, smoke->gt, id) {
+		for_each_enabled_engine(smoke->engine, smoke->gt, id) {
 			struct i915_gem_context *ctx = smoke_context(smoke);
 			int err;
 
@@ -3876,7 +3876,7 @@ static int live_virtual_engine(void *arg)
 	if (intel_uc_uses_guc_submission(&gt->uc))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = nop_virtual_engine(gt, &engine, 1, 1, 0);
 		if (err) {
 			pr_err("Failed to wrap engine %s: err=%d\n",
diff --git a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
index 33351deeea4f..ddc4b5623f19 100644
--- a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
@@ -95,7 +95,7 @@ static int live_gt_clocks(void *arg)
 	wakeref = intel_gt_pm_get(gt);
 	intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		u32 cycles;
 		u32 expected;
 		u64 time;
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 9ce8ff1c04fe..1bfdb7a80334 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -296,7 +296,7 @@ static int igt_hang_sanitycheck(void *arg)
 	if (err)
 		return err;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_wedge_me w;
 		long timeout;
 
@@ -360,7 +360,7 @@ static int igt_reset_nop(void *arg)
 	reset_count = i915_reset_count(global);
 	count = 0;
 	do {
-		for_each_engine(engine, gt, id) {
+		for_each_enabled_engine(engine, gt, id) {
 			struct intel_context *ce;
 			int i;
 
@@ -433,7 +433,7 @@ static int igt_reset_nop_engine(void *arg)
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		unsigned int reset_count, reset_engine_count, count;
 		struct intel_context *ce;
 		IGT_TIMEOUT(end_time);
@@ -553,7 +553,7 @@ static int igt_reset_fail_engine(void *arg)
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		unsigned int count;
 		struct intel_context *ce;
 		IGT_TIMEOUT(end_time);
@@ -700,7 +700,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 			return err;
 	}
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		unsigned int reset_count, reset_engine_count;
 		unsigned long count;
 		bool using_guc = intel_engine_uses_guc(engine);
@@ -990,7 +990,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 	if (!threads)
 		return -ENOMEM;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		unsigned long device = i915_reset_count(global);
 		unsigned long count = 0, reported;
 		bool using_guc = intel_engine_uses_guc(engine);
@@ -1010,7 +1010,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 		}
 
 		memset(threads, 0, sizeof(*threads) * I915_NUM_ENGINES);
-		for_each_engine(other, gt, tmp) {
+		for_each_enabled_engine(other, gt, tmp) {
 			struct kthread_worker *worker;
 
 			threads[tmp].resets =
@@ -1185,7 +1185,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 		}
 
 unwind:
-		for_each_engine(other, gt, tmp) {
+		for_each_enabled_engine(other, gt, tmp) {
 			int ret;
 
 			if (!threads[tmp].worker)
@@ -1621,7 +1621,7 @@ static int wait_for_others(struct intel_gt *gt,
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		if (engine == exclude)
 			continue;
 
@@ -1649,7 +1649,7 @@ static int igt_reset_queue(void *arg)
 	if (err)
 		goto unlock;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_selftest_saved_policy saved;
 		struct i915_request *prev;
 		IGT_TIMEOUT(end_time);
@@ -1982,7 +1982,7 @@ static int igt_reset_engines_atomic(void *arg)
 		struct intel_engine_cs *engine;
 		enum intel_engine_id id;
 
-		for_each_engine(engine, gt, id) {
+		for_each_enabled_engine(engine, gt, id) {
 			err = igt_atomic_reset_engine(engine, p);
 			if (err)
 				goto out;
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index e17b8777d21d..fa786b9eab8d 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -171,7 +171,7 @@ static int live_lrc_layout(void *arg)
 	GEM_BUG_ON(offset_in_page(lrc));
 
 	err = 0;
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		u32 *hw;
 		int dw;
 
@@ -294,7 +294,7 @@ static int live_lrc_fixed(void *arg)
 	 * the context image.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		const struct {
 			u32 reg;
 			u32 offset;
@@ -516,7 +516,7 @@ static int live_lrc_state(void *arg)
 	if (IS_ERR(scratch))
 		return PTR_ERR(scratch);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = __live_lrc_state(engine, scratch);
 		if (err)
 			break;
@@ -710,7 +710,7 @@ static int live_lrc_gpr(void *arg)
 	if (IS_ERR(scratch))
 		return PTR_ERR(scratch);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		st_engine_heartbeat_disable(engine);
 
 		err = __live_lrc_gpr(engine, scratch, false);
@@ -867,7 +867,7 @@ static int live_lrc_timestamp(void *arg)
 	 * with a second request (carrying more poison into the timestamp).
 	 */
 
-	for_each_engine(data.engine, gt, id) {
+	for_each_enabled_engine(data.engine, gt, id) {
 		int i, err = 0;
 
 		st_engine_heartbeat_disable(data.engine);
@@ -1525,7 +1525,7 @@ static int live_lrc_isolation(void *arg)
 	 * context image and attempt to modify that list from a remote context.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		int i;
 
 		/* Just don't even ask */
@@ -1713,7 +1713,7 @@ static int lrc_wabb_ctx(void *arg, bool per_ctx)
 	enum intel_engine_id id;
 	int err = 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		intel_engine_pm_get(engine);
 		err = __lrc_wabb_ctx(engine, per_ctx);
 		intel_engine_pm_put(engine);
@@ -1849,7 +1849,7 @@ static int live_lrc_garbage(void *arg)
 	if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST_BROKEN))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		I915_RND_STATE(prng);
 		int err = 0, i;
 
@@ -1951,7 +1951,7 @@ static int live_pphwsp_runtime(void *arg)
 	 * is monotonic.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = __live_pphwsp_runtime(engine);
 		if (err)
 			break;
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index d73e438fb85f..6fd9fb0cd9f6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -271,7 +271,7 @@ static int live_mocs_kernel(void *arg)
 	if (err)
 		return err;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		intel_engine_pm_get(engine);
 		err = check_mocs_engine(&mocs, engine->kernel_context);
 		intel_engine_pm_put(engine);
@@ -297,7 +297,7 @@ static int live_mocs_clean(void *arg)
 	if (err)
 		return err;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 
 		ce = mocs_context_create(engine);
@@ -400,7 +400,7 @@ static int live_mocs_reset(void *arg)
 		return err;
 
 	igt_global_reset_lock(gt);
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		bool using_guc = intel_engine_uses_guc(engine);
 		struct intel_selftest_saved_policy saved;
 		struct intel_context *ce;
diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
index 1aa1446c8fb0..ad60103c90a2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
@@ -165,7 +165,7 @@ randomised_engines(struct intel_gt *gt,
 	int n;
 
 	n = 0;
-	for_each_engine(engine, gt, id)
+	for_each_enabled_engine(engine, gt, id)
 		n++;
 	if (!n)
 		return NULL;
@@ -175,7 +175,7 @@ randomised_engines(struct intel_gt *gt,
 		return NULL;
 
 	n = 0;
-	for_each_engine(engine, gt, id)
+	for_each_enabled_engine(engine, gt, id)
 		engines[n++] = engine;
 
 	i915_prandom_shuffle(engines, sizeof(*engines), n, prng);
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 2cfc23c58e90..548e00ec47bd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -55,7 +55,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (err)
 		goto err_lock;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		struct i915_request *rq;
 
@@ -113,7 +113,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	if (mask == ALL_ENGINES) {
 		intel_gt_reset(gt, mask, NULL);
 	} else {
-		for_each_engine(engine, gt, id) {
+		for_each_enabled_engine(engine, gt, id) {
 			if (mask & engine->mask)
 				intel_engine_reset(engine, NULL);
 		}
@@ -197,7 +197,7 @@ static int igt_reset_engines_stolen(void *arg)
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		err = __igt_reset_stolen(gt, engine->mask, engine->name);
 		if (err)
 			return err;
@@ -326,7 +326,7 @@ static int igt_atomic_engine_reset(void *arg)
 	if (!igt_force_reset(gt))
 		goto out_unlock;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct tasklet_struct *t = &engine->sched_engine->tasklet;
 
 		if (t->func)
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 87ceb0f374b6..a447fec027e1 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -259,7 +259,7 @@ static int live_ctx_switch_wa(void *arg)
 	 * and equally important it was wasn't run when we don't!
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_vma *saved_wa;
 		int err;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index dcef8d498919..49f23d19bd70 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -242,7 +242,7 @@ int live_rps_clock_interval(void *arg)
 
 	intel_gt_check_clock_frequency(gt);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		u32 cycles;
 		u64 dt;
@@ -401,7 +401,7 @@ int live_rps_control(void *arg)
 	rps->work.func = dummy_rps_work;
 
 	wakeref = intel_gt_pm_get(gt);
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		ktime_t min_dt, max_dt;
 		int f, limit;
@@ -629,7 +629,7 @@ int live_rps_frequency_cs(void *arg)
 	saved_work = rps->work.func;
 	rps->work.func = dummy_rps_work;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		struct i915_vma *vma;
 		u32 *cancel, *cntr;
@@ -768,7 +768,7 @@ int live_rps_frequency_srm(void *arg)
 	saved_work = rps->work.func;
 	rps->work.func = dummy_rps_work;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		struct i915_vma *vma;
 		u32 *cancel, *cntr;
@@ -1051,7 +1051,7 @@ int live_rps_interrupt(void *arg)
 	saved_work = rps->work.func;
 	rps->work.func = dummy_rps_work;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		/* Keep the engine busy with a spinner; expect an UP! */
 		if (pm_events & GEN6_PM_RP_UP_THRESHOLD) {
 			intel_gt_pm_wait_for_idle(engine->gt);
@@ -1157,7 +1157,7 @@ int live_rps_power(void *arg)
 	saved_work = rps->work.func;
 	rps->work.func = dummy_rps_work;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		struct {
 			u64 power;
@@ -1259,7 +1259,7 @@ int live_rps_dynamic(void *arg)
 	if (intel_rps_uses_timer(rps))
 		pr_info("RPS has timer support\n");
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq;
 		struct {
 			ktime_t dt;
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index fa36cf920bde..47d6f02808ba 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -543,7 +543,7 @@ static int live_hwsp_engine(void *arg)
 		return -ENOMEM;
 
 	count = 0;
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		if (!intel_engine_can_store_dword(engine))
 			continue;
 
@@ -619,7 +619,7 @@ static int live_hwsp_alternate(void *arg)
 
 	count = 0;
 	for (n = 0; n < NUM_TIMELINES; n++) {
-		for_each_engine(engine, gt, id) {
+		for_each_enabled_engine(engine, gt, id) {
 			struct intel_timeline *tl;
 			struct i915_request *rq;
 
@@ -691,7 +691,7 @@ static int live_hwsp_wrap(void *arg)
 	if (err)
 		goto out_free;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		const u32 *hwsp_seqno[2];
 		struct i915_request *rq;
 		u32 seqno[2];
@@ -1016,7 +1016,7 @@ static int live_hwsp_read(void *arg)
 			goto out;
 	}
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		unsigned long count = 0;
 		IGT_TIMEOUT(end_time);
@@ -1188,7 +1188,7 @@ static int live_hwsp_rollover_kernel(void *arg)
 	 * see a seqno rollover.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce = engine->kernel_context;
 		struct intel_timeline *tl = ce->timeline;
 		struct i915_request *rq[3] = {};
@@ -1266,7 +1266,7 @@ static int live_hwsp_rollover_user(void *arg)
 	 * on the user's timeline.
 	 */
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_request *rq[3] = {};
 		struct intel_timeline *tl;
 		struct intel_context *ce;
@@ -1357,7 +1357,7 @@ static int live_hwsp_recycle(void *arg)
 	 */
 
 	count = 0;
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		IGT_TIMEOUT(end_time);
 
 		if (!intel_engine_can_store_dword(engine))
diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c b/drivers/gpu/drm/i915/gt/selftest_tlb.c
index 3941f2d6fa47..ea52fe24901f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
+++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
@@ -293,7 +293,7 @@ mem_tlbinv(struct intel_gt *gt,
 	}
 
 	err = 0;
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_gem_ww_ctx ww;
 		struct intel_context *ce;
 		int bit;
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 14a8b25b6204..55f9f5c556c3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -70,7 +70,7 @@ reference_lists_init(struct intel_gt *gt, struct wa_lists *lists)
 	gt_init_workarounds(gt, &lists->gt_wa_list);
 	wa_init_finish(&lists->gt_wa_list);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct i915_wa_list *wal = &lists->engine[id].wa_list;
 
 		wa_init_start(wal, gt, "REF", engine->name);
@@ -89,7 +89,7 @@ reference_lists_fini(struct intel_gt *gt, struct wa_lists *lists)
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 
-	for_each_engine(engine, gt, id)
+	for_each_enabled_engine(engine, gt, id)
 		intel_wa_list_free(&lists->engine[id].wa_list);
 
 	intel_wa_list_free(&lists->gt_wa_list);
@@ -764,7 +764,7 @@ static int live_dirty_whitelist(void *arg)
 	if (GRAPHICS_VER(gt->i915) < 7) /* minimum requirement for LRI, SRM, LRM */
 		return 0;
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 		int err;
 
@@ -794,7 +794,7 @@ static int live_reset_whitelist(void *arg)
 	/* If we reset the gpu, we should not lose the RING_NONPRIV */
 	igt_global_reset_lock(gt);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		if (engine->whitelist.count == 0)
 			continue;
 
@@ -1089,7 +1089,7 @@ static int live_isolated_whitelist(void *arg)
 		}
 	}
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce[2];
 
 		if (!engine->kernel_context->vm)
@@ -1172,7 +1172,7 @@ verify_wa_lists(struct intel_gt *gt, struct wa_lists *lists,
 
 	ok &= wa_list_verify(gt, &lists->gt_wa_list, str);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_context *ce;
 
 		ce = intel_context_create(engine);
@@ -1257,7 +1257,7 @@ live_engine_reset_workarounds(void *arg)
 
 	reference_lists_init(gt, lists);
 
-	for_each_engine(engine, gt, id) {
+	for_each_enabled_engine(engine, gt, id) {
 		struct intel_selftest_saved_policy saved;
 		bool using_guc = intel_engine_uses_guc(engine);
 		bool ok;
-- 
2.45.2

