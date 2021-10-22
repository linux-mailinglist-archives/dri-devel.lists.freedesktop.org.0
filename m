Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB5436F71
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 03:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DF56E519;
	Fri, 22 Oct 2021 01:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439226E511;
 Fri, 22 Oct 2021 01:34:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290035872"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="290035872"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="527754469"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>,
	<john.c.harrison@intel.com>
Subject: [PATCH 1/3] drm/i915/guc: Do error capture asynchronously
Date: Thu, 21 Oct 2021 18:29:37 -0700
Message-Id: <20211022012939.22363-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211022012939.22363-1-matthew.brost@intel.com>
References: <20211022012939.22363-1-matthew.brost@intel.com>
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

An error capture allocates memory, memory allocations depend on resets,
and resets need to flush the G2H handlers to seal several races. If the
error capture is done from the G2H handler this creates a circular
dependency. To work around this, do a error capture in a work queue
asynchronously from the G2H handler. This should be fine as (eventually)
all register state is put into a buffer by the GuC so it is safe to
restart the context before the error capture is complete. At worst, a
full GT reset clobbers an error capture and some information is lost.

Example of lockdep splat below:

[  154.625989] ======================================================
[  154.632195] WARNING: possible circular locking dependency detected
[  154.638393] 5.14.0-rc5-guc+ #50 Tainted: G     U
[  154.643991] ------------------------------------------------------
[  154.650196] i915_selftest/1673 is trying to acquire lock:
[  154.655621] ffff8881079cb918 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}, at: __flush_work+0x350/0x4d0 [  154.665826]
               but task is already holding lock:
[  154.671682] ffff8881079cbfb8 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0xf0/0x300 [i915] [  154.680659]
               which lock already depends on the new lock.

[  154.688857]
               the existing dependency chain (in reverse order) is:
[  154.696365]
               -> #2 (&gt->reset.mutex){+.+.}-{3:3}:
[  154.702571]        lock_acquire+0xd2/0x300
[  154.706695]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]
[  154.712959]        intel_gt_init_reset+0x61/0x80 [i915]
[  154.718258]        intel_gt_init_early+0xe6/0x120 [i915]
[  154.723648]        i915_driver_probe+0x592/0xdc0 [i915]
[  154.728942]        i915_pci_probe+0x43/0x1c0 [i915]
[  154.733891]        pci_device_probe+0x9b/0x110
[  154.738362]        really_probe+0x1a6/0x3a0
[  154.742568]        __driver_probe_device+0xf9/0x170
[  154.747468]        driver_probe_device+0x19/0x90
[  154.752114]        __driver_attach+0x99/0x170
[  154.756492]        bus_for_each_dev+0x73/0xc0
[  154.760870]        bus_add_driver+0x14b/0x1f0
[  154.765248]        driver_register+0x67/0xb0
[  154.769542]        i915_init+0x18/0x8c [i915]
[  154.773964]        do_one_initcall+0x53/0x2e0
[  154.778343]        do_init_module+0x56/0x210
[  154.782639]        load_module+0x25fc/0x29f0
[  154.786934]        __do_sys_finit_module+0xae/0x110
[  154.791835]        do_syscall_64+0x38/0xc0
[  154.795958]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  154.801558]
               -> #1 (fs_reclaim){+.+.}-{0:0}:
[  154.807241]        lock_acquire+0xd2/0x300
[  154.811361]        fs_reclaim_acquire+0x9e/0xd0
[  154.815914]        kmem_cache_alloc_trace+0x30/0x790
[  154.820899]        i915_gpu_coredump_alloc+0x53/0x1a0 [i915]
[  154.826649]        i915_gpu_coredump+0x39/0x560 [i915]
[  154.831866]        i915_capture_error_state+0xa/0x70 [i915]
[  154.837513]        intel_guc_context_reset_process_msg+0x174/0x1f0 [i915]
[  154.844383]        ct_incoming_request_worker_func+0x130/0x1b0 [i915]
[  154.850898]        process_one_work+0x264/0x590
[  154.855451]        worker_thread+0x4b/0x3a0
[  154.859655]        kthread+0x147/0x170
[  154.863428]        ret_from_fork+0x1f/0x30
[  154.867548]
               -> #0 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}:
[  154.875747]        check_prev_add+0x90/0xc30
[  154.880042]        __lock_acquire+0x1643/0x2110
[  154.884595]        lock_acquire+0xd2/0x300
[  154.888715]        __flush_work+0x373/0x4d0
[  154.892920]        intel_guc_submission_reset_prepare+0xf3/0x340 [i915]
[  154.899606]        intel_uc_reset_prepare+0x40/0x50 [i915]
[  154.905166]        reset_prepare+0x55/0x60 [i915]
[  154.909946]        intel_gt_reset+0x11c/0x300 [i915]
[  154.914984]        do_device_reset+0x13/0x20 [i915]
[  154.919936]        check_whitelist_across_reset+0x166/0x250 [i915]
[  154.926212]        live_reset_whitelist.cold+0x6a/0x7a [i915]
[  154.932037]        __i915_subtests.cold+0x20/0x74 [i915]
[  154.937428]        __run_selftests.cold+0x96/0xee [i915]
[  154.942816]        i915_live_selftests+0x2c/0x60 [i915]
[  154.948125]        i915_pci_probe+0x93/0x1c0 [i915]
[  154.953076]        pci_device_probe+0x9b/0x110
[  154.957545]        really_probe+0x1a6/0x3a0
[  154.961749]        __driver_probe_device+0xf9/0x170
[  154.966653]        driver_probe_device+0x19/0x90
[  154.971290]        __driver_attach+0x99/0x170
[  154.975671]        bus_for_each_dev+0x73/0xc0
[  154.980053]        bus_add_driver+0x14b/0x1f0
[  154.984431]        driver_register+0x67/0xb0
[  154.988725]        i915_init+0x18/0x8c [i915]
[  154.993149]        do_one_initcall+0x53/0x2e0
[  154.997527]        do_init_module+0x56/0x210
[  155.001822]        load_module+0x25fc/0x29f0
[  155.006118]        __do_sys_finit_module+0xae/0x110
[  155.011019]        do_syscall_64+0x38/0xc0
[  155.015139]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  155.020729]
               other info that might help us debug this:

[  155.028752] Chain exists of:
                 (work_completion)(&ct->requests.worker) --> fs_reclaim --> &gt->reset.mutex

[  155.041294]  Possible unsafe locking scenario:

[  155.047240]        CPU0                    CPU1
[  155.051791]        ----                    ----
[  155.056344]   lock(&gt->reset.mutex);
[  155.060026]                                lock(fs_reclaim);
[  155.065706]                                lock(&gt->reset.mutex);
[  155.071912]   lock((work_completion)(&ct->requests.worker));
[  155.077595]
                *** DEADLOCK ***

v2: Resolve ce within lock, requeue workqueue if list not empty

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  7 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 10 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 55 +++++++++++++++++--
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 5634d14052bc..c8990d7c030a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -406,6 +406,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 
 	INIT_LIST_HEAD(&ce->parallel.child_list);
 
+	INIT_LIST_HEAD(&ce->guc_capture_link);
+
 	/*
 	 * Initialize fence to be complete as this is expected to be complete
 	 * unless there is a pending schedule disable outstanding.
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 9e0177dc5484..ca714c866512 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -276,6 +276,13 @@ struct intel_context {
 		} guc;
 	} parallel;
 
+	/**
+	 * @guc_capture_link: in guc->submission_state.capture_list when an
+	 * error capture is pending on this context, protected by
+	 * guc->submission_state.lock
+	 */
+	struct list_head guc_capture_link;
+
 #ifdef CONFIG_DRM_I915_SELFTEST
 	/**
 	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 31cf9fb48c7e..540a567268ef 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -114,6 +114,16 @@ struct intel_guc {
 		 * function as it might be in an atomic context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
+		/**
+		 * @capture_list: list of intel_context that need to capture
+		 * error state
+		 */
+		struct list_head capture_list;
+		/**
+		 * @capture_worker: worker to do error capture when the GuC
+		 * signals a context has been reset
+		 */
+		struct work_struct capture_worker;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d7710debcd47..57c07244b3c5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -91,8 +91,8 @@
  * used for all of GuC submission but that could change in the future.
  *
  * guc->submission_state.lock
- * Global lock for GuC submission state. Protects guc_ids and destroyed contexts
- * list.
+ * Global lock for GuC submission state. Protects guc_ids, destroyed contexts
+ * list, and capture list.
  *
  * ce->guc_state.lock
  * Protects everything under ce->guc_state. Ensures that a context is in the
@@ -1478,6 +1478,8 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 
 static void destroyed_worker_func(struct work_struct *w);
 
+static void capture_worker_func(struct work_struct *w);
+
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
  * at firmware loading time.
@@ -1506,6 +1508,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
+	INIT_LIST_HEAD(&guc->submission_state.capture_list);
+	INIT_WORK(&guc->submission_state.capture_worker, capture_worker_func);
 
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
@@ -3652,17 +3656,56 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
-static void capture_error_state(struct intel_guc *guc,
-				struct intel_context *ce)
+static void capture_worker_func(struct work_struct *w)
 {
+	struct intel_guc *guc = container_of(w, struct intel_guc,
+					     submission_state.capture_worker);
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+	struct intel_engine_cs *engine;
+	struct intel_context *ce;
+	unsigned long flags;
 	intel_wakeref_t wakeref;
 
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	ce = list_first_entry(&guc->submission_state.capture_list,
+			      struct intel_context, guc_capture_link);
+	list_del_init(&ce->guc_capture_link);
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	engine = __context_to_physical_engine(ce);
 	intel_engine_set_hung_context(engine, ce);
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		i915_capture_error_state(gt, engine->mask);
+		i915_capture_error_state(gt, ce->engine->mask);
+
+	if (!list_empty(&guc->submission_state.capture_list))
+		queue_work(system_unbound_wq,
+			   &guc->submission_state.capture_worker);
+}
+
+static void capture_error_state(struct intel_guc *guc,
+				struct intel_context *ce)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	list_add_tail(&guc->submission_state.capture_list,
+		      &ce->guc_capture_link);
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	/*
+	 * We do the error capture async as an error capture can allocate
+	 * memory, the reset path must flush the G2H handler in order to seal
+	 * several races, and the memory allocations depend on the reset path
+	 * (circular dependecy if error capture done here in the G2H handler).
+	 * Doing the error capture async should be ok, as (eventually) all
+	 * register state is captured in buffer by the GuC (i.e. it ok to
+	 * restart the context before the error capture is complete).
+	 */
+	queue_work(system_unbound_wq, &guc->submission_state.capture_worker);
 	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
 }
 
-- 
2.32.0

