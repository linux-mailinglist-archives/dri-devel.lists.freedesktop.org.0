Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439253B9764
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0346EC04;
	Thu,  1 Jul 2021 20:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6BC6EBB7;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436154"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436154"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564417"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/53] drm/i915/selftests: Allow for larger engine counts
Date: Thu,  1 Jul 2021 13:23:40 -0700
Message-Id: <20210701202427.1547543-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Increasing the engine count causes a couple of local array variables
to exceed the kernel stack limit. So make them dynamic allocations
instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 10 ++++--
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 32 ++++++++++++-------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 08896ae027d5..1e7fe2222479 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3561,12 +3561,16 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 #define BATCH BIT(0)
 {
 	struct task_struct *tsk[I915_NUM_ENGINES] = {};
-	struct preempt_smoke arg[I915_NUM_ENGINES];
+	struct preempt_smoke *arg;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 	unsigned long count;
 	int err = 0;
 
+	arg = kmalloc_array(I915_NUM_ENGINES, sizeof(*arg), GFP_KERNEL);
+	if (!arg)
+		return -ENOMEM;
+
 	for_each_engine(engine, smoke->gt, id) {
 		arg[id] = *smoke;
 		arg[id].engine = engine;
@@ -3574,7 +3578,7 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 			arg[id].batch = NULL;
 		arg[id].count = 0;
 
-		tsk[id] = kthread_run(smoke_crescendo_thread, &arg,
+		tsk[id] = kthread_run(smoke_crescendo_thread, arg,
 				      "igt/smoke:%d", id);
 		if (IS_ERR(tsk[id])) {
 			err = PTR_ERR(tsk[id]);
@@ -3603,6 +3607,8 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 
 	pr_info("Submitted %lu crescendo:%x requests across %d engines and %d contexts\n",
 		count, flags, smoke->gt->info.num_engines, smoke->ncontext);
+
+	kfree(arg);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 7ebc4edb8ecf..7a38ce40feb2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -1175,31 +1175,36 @@ live_gpu_reset_workarounds(void *arg)
 {
 	struct intel_gt *gt = arg;
 	intel_wakeref_t wakeref;
-	struct wa_lists lists;
+	struct wa_lists *lists;
 	bool ok;
 
 	if (!intel_has_gpu_reset(gt))
 		return 0;
 
+	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
+	if (!lists)
+		return -ENOMEM;
+
 	pr_info("Verifying after GPU reset...\n");
 
 	igt_global_reset_lock(gt);
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	reference_lists_init(gt, &lists);
+	reference_lists_init(gt, lists);
 
-	ok = verify_wa_lists(gt, &lists, "before reset");
+	ok = verify_wa_lists(gt, lists, "before reset");
 	if (!ok)
 		goto out;
 
 	intel_gt_reset(gt, ALL_ENGINES, "live_workarounds");
 
-	ok = verify_wa_lists(gt, &lists, "after reset");
+	ok = verify_wa_lists(gt, lists, "after reset");
 
 out:
-	reference_lists_fini(gt, &lists);
+	reference_lists_fini(gt, lists);
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 	igt_global_reset_unlock(gt);
+	kfree(lists);
 
 	return ok ? 0 : -ESRCH;
 }
@@ -1214,16 +1219,20 @@ live_engine_reset_workarounds(void *arg)
 	struct igt_spinner spin;
 	struct i915_request *rq;
 	intel_wakeref_t wakeref;
-	struct wa_lists lists;
+	struct wa_lists *lists;
 	int ret = 0;
 
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
+	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
+	if (!lists)
+		return -ENOMEM;
+
 	igt_global_reset_lock(gt);
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	reference_lists_init(gt, &lists);
+	reference_lists_init(gt, lists);
 
 	for_each_engine(engine, gt, id) {
 		bool ok;
@@ -1235,7 +1244,7 @@ live_engine_reset_workarounds(void *arg)
 			break;
 		}
 
-		ok = verify_wa_lists(gt, &lists, "before reset");
+		ok = verify_wa_lists(gt, lists, "before reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1247,7 +1256,7 @@ live_engine_reset_workarounds(void *arg)
 			goto err;
 		}
 
-		ok = verify_wa_lists(gt, &lists, "after idle reset");
+		ok = verify_wa_lists(gt, lists, "after idle reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1282,7 +1291,7 @@ live_engine_reset_workarounds(void *arg)
 		igt_spinner_end(&spin);
 		igt_spinner_fini(&spin);
 
-		ok = verify_wa_lists(gt, &lists, "after busy reset");
+		ok = verify_wa_lists(gt, lists, "after busy reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1294,9 +1303,10 @@ live_engine_reset_workarounds(void *arg)
 			break;
 	}
 
-	reference_lists_fini(gt, &lists);
+	reference_lists_fini(gt, lists);
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 	igt_global_reset_unlock(gt);
+	kfree(lists);
 
 	igt_flush_test(gt->i915);
 
-- 
2.25.4

