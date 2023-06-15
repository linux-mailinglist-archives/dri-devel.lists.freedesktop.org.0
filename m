Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8473216D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7B110E54E;
	Thu, 15 Jun 2023 21:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBF410E086;
 Thu, 15 Jun 2023 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686863748; x=1718399748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+T844Ue2Hzf8hWrfF/AB7P1iv/4o0SLinxSJuXFrmH0=;
 b=FckVwOAafPa/6y3NjCvfMDZ8cKPEdi0DsGuW/p1yBHLdx91trEiVYFrH
 B6Ep/tDmZM3Foh4EvxBd12RrhCEWexDPXbR6pLzzGUX4EZaErIJykGQYv
 rRoCwrg+he77IuSr26QAGwlD8PIZW9DHEHaSsZMUG/rBGDc0seP55VrQU
 BsvXpmv1IBKrufCbBevh0+qcCIRuh6W7PO9pEP7dXO8OYIyv7Ut4yIdyC
 z0aSs6EH9468OmMBK0I50KH8QjCPoG+4rFRsw6yKuOV686RjIwb+xCQWE
 Oe18etYVpCMZ/C03VIsLedWSxBlCZarFJyjqP8c5exDgTuai7PKv0d5h9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339383505"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="339383505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 14:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782649274"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="782649274"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 14:15:46 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Date: Thu, 15 Jun 2023 14:15:42 -0700
Message-Id: <20230615211542.963700-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.

WARNING: possible circular locking dependency detected
6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
------------------------------------------------------
kms_pipe_crc_ba/6415 is trying to acquire lock:
ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530

but task is already holding lock:
ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #3 (&gt->reset.mutex){+.+.}-{3:3}:
        lock_acquire+0xd8/0x2d0
        i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
        intel_gt_init_reset+0x65/0x80 [i915]
        intel_gt_common_init_early+0xe1/0x170 [i915]
        intel_root_gt_init_early+0x48/0x60 [i915]
        i915_driver_probe+0x671/0xcb0 [i915]
        i915_pci_probe+0xdc/0x210 [i915]
        pci_device_probe+0x95/0x120
        really_probe+0x164/0x3c0
        __driver_probe_device+0x73/0x160
        driver_probe_device+0x19/0xa0
        __driver_attach+0xb6/0x180
        bus_for_each_dev+0x77/0xd0
        bus_add_driver+0x114/0x210
        driver_register+0x5b/0x110
        __pfx_vgem_open+0x3/0x10 [vgem]
        do_one_initcall+0x57/0x270
        do_init_module+0x5f/0x220
        load_module+0x1ca4/0x1f00
        __do_sys_finit_module+0xb4/0x130
        do_syscall_64+0x3c/0x90
        entry_SYSCALL_64_after_hwframe+0x72/0xdc

-> #2 (fs_reclaim){+.+.}-{0:0}:
        lock_acquire+0xd8/0x2d0
        fs_reclaim_acquire+0xac/0xe0
        kmem_cache_alloc+0x32/0x260
        i915_vma_instance+0xb2/0xc60 [i915]
        i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
        vm_fault_gtt+0x22d/0xf60 [i915]
        __do_fault+0x2f/0x1d0
        do_pte_missing+0x4a/0xd20
        __handle_mm_fault+0x5b0/0x790
        handle_mm_fault+0xa2/0x230
        do_user_addr_fault+0x3ea/0xa10
        exc_page_fault+0x68/0x1a0
        asm_exc_page_fault+0x26/0x30

-> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
        lock_acquire+0xd8/0x2d0
        _intel_gt_reset_lock+0x57/0x330 [i915]
        guc_timestamp_ping+0x35/0x130 [i915]
        process_one_work+0x250/0x510
        worker_thread+0x4f/0x3a0
        kthread+0xff/0x130
        ret_from_fork+0x29/0x50

-> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
        check_prev_add+0x90/0xc60
        __lock_acquire+0x1998/0x2590
        lock_acquire+0xd8/0x2d0
        __flush_work+0x74/0x530
        __cancel_work_timer+0x14f/0x1f0
        intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
        intel_uc_reset_prepare+0x9c/0x120 [i915]
        reset_prepare+0x21/0x60 [i915]
        intel_gt_reset+0x1dd/0x470 [i915]
        intel_gt_reset_global+0xfb/0x170 [i915]
        intel_gt_handle_error+0x368/0x420 [i915]
        intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
        i915_wedged_set+0x29/0x40 [i915]
        simple_attr_write_xsigned.constprop.0+0xb4/0x110
        full_proxy_write+0x52/0x80
        vfs_write+0xc5/0x4f0
        ksys_write+0x64/0xe0
        do_syscall_64+0x3c/0x90
        entry_SYSCALL_64_after_hwframe+0x72/0xdc

other info that might help us debug this:
 Chain exists of:
  (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
  Possible unsafe locking scenario:
        CPU0                    CPU1
        ----                    ----
   lock(&gt->reset.mutex);
                                lock(fs_reclaim);
                                lock(&gt->reset.mutex);
   lock((work_completion)(&(&guc->timestamp.work)->work));

 *** DEADLOCK ***
 3 locks held by kms_pipe_crc_ba/6415:
  #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
  #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
  #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]

v2: Add sync flag to guc_cancel_busyness_worker to ensure reset path calls asynchronous cancel.
v3: Add sync flag to intel_guc_submission_disable to ensure reset path calls asynchronous cancel.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c           |  4 ++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..ef4300246ce1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1357,9 +1357,12 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
 	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
 }
 
-static void guc_cancel_busyness_worker(struct intel_guc *guc)
+static void guc_cancel_busyness_worker(struct intel_guc *guc, bool sync)
 {
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	if (sync)
+		cancel_delayed_work_sync(&guc->timestamp.work);
+	else
+		cancel_delayed_work(&guc->timestamp.work);
 }
 
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
@@ -1370,7 +1373,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
 	unsigned long flags;
 	ktime_t unused;
 
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, false);
 
 	spin_lock_irqsave(&guc->timestamp.lock, flags);
 
@@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
 
 static void guc_fini_engine_stats(struct intel_guc *guc)
 {
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, true);
 }
 
 void intel_guc_busyness_park(struct intel_gt *gt)
@@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 	 * and causes an unclaimed register access warning. Cancel the worker
 	 * synchronously here.
 	 */
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, true);
 
 	/*
 	 * Before parking, we should sample engine busyness stats if we need to.
@@ -4501,9 +4504,9 @@ int intel_guc_submission_enable(struct intel_guc *guc)
 }
 
 /* Note: By the time we're here, GuC may have already been reset */
-void intel_guc_submission_disable(struct intel_guc *guc)
+void intel_guc_submission_disable(struct intel_guc *guc, bool sync)
 {
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, sync);
 
 	/* Semaphore interrupt disable and route to host */
 	guc_route_semaphores(guc, false);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c57b29cdb1a6..a77de0d6ed58 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -16,7 +16,7 @@ struct intel_engine_cs;
 void intel_guc_submission_init_early(struct intel_guc *guc);
 int intel_guc_submission_init(struct intel_guc *guc);
 int intel_guc_submission_enable(struct intel_guc *guc);
-void intel_guc_submission_disable(struct intel_guc *guc);
+void intel_guc_submission_disable(struct intel_guc *guc, bool sync);
 void intel_guc_submission_fini(struct intel_guc *guc);
 int intel_guc_preempt_work_create(struct intel_guc *guc);
 void intel_guc_preempt_work_destroy(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 18250fb64bd8..edf13f89830e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -566,7 +566,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	 * We've failed to load the firmware :(
 	 */
 err_submission:
-	intel_guc_submission_disable(guc);
+	intel_guc_submission_disable(guc, true);
 err_log_capture:
 	__uc_capture_load_err_log(uc);
 err_rps:
@@ -597,7 +597,7 @@ static void __uc_fini_hw(struct intel_uc *uc)
 		return;
 
 	if (intel_uc_uses_guc_submission(uc))
-		intel_guc_submission_disable(guc);
+		intel_guc_submission_disable(guc, false);
 
 	__uc_sanitize(uc);
 }
-- 
2.34.1

