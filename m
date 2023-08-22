Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 441807848FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D310E3CC;
	Tue, 22 Aug 2023 18:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4710E3C9;
 Tue, 22 Aug 2023 18:02:32 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so3888630b3a.0; 
 Tue, 22 Aug 2023 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727352; x=1693332152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azXqC48nCq3Nd2xmDDFqonleBrNUa9rXdZ8wwR7mDDQ=;
 b=if6/5taqc1FNbZsDP8pI9S2/mtp1Y7aF5kjheNse6mUvsSWWTLW4zulXZ4Hvq+wgi+
 K91HxaCNvqpATqUG0jkqo69nwqSPiCV+Er2WCaqOC7lE4R4ORoa68Qulh00du9xw2naH
 lLqlJq0S27EVqmpKExTEd4BG0T8x1YmCCFUVMnS5YELocP/iCLrYfUJ19cJ2+rMlp1BA
 O9u1KR/2rSCfMCVlW7nrOiFuMacQCtBv13dBOvRmemC/am+3zxNE/B20dcIaQZpv5Rcv
 tTIsL4ZVJ0Ko6LfZeV6yH216r1zpwjnzI1eoPLWmXjt+bu0QrYxDFPSZ9ZB/aTfLCOcD
 BBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727352; x=1693332152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azXqC48nCq3Nd2xmDDFqonleBrNUa9rXdZ8wwR7mDDQ=;
 b=jTsIUmY4ueVI/L6xB+2Iikn5VSt6eE0pE1Kx6FxSOAJ2RjTMjNRI8GaDr2G0MGZxZ6
 6009S9IuF2AHh6EvY7g7qFEDPtS4xnceMmEiQ0wWTNw0TdwScosEh6d4UxalYyUODv0Q
 5+24HyLQL83MQ9yo/R11LfeCegijlyp5HrBRtVdBD5W9WfOPPsKtOSKCQzMt+rCqo7lS
 lKMB871HunWfF4pLgFIQcIGW+euouWAPwliX52qwiuCIEwGXkkZ8IWvvWcNzcRcYap6w
 gFByjOKupfxhuf4ysB25pF11iggXrulvukpM+rFOB+63vyxdIPxrDU9XXRqMT/Ciq9QJ
 CR6Q==
X-Gm-Message-State: AOJu0YwWxzo338FxuWbcGcrd0c4q83u+bGwu1btnyvBj2eDnVFbfADM0
 B+bMfpozD5E/Kjnf/Lp0Dy3tDuD3a+g=
X-Google-Smtp-Source: AGHT+IGeE/wafAzcwEKsQQB5cpdsHKFZPRpzlFbFqvKUP8JwsoYsYg0yKDFpDf74uA73Y++c0bwV1g==
X-Received: by 2002:a05:6a20:8e29:b0:148:3a48:1eff with SMTP id
 y41-20020a056a208e2900b001483a481effmr13569143pzj.23.1692727351392; 
 Tue, 22 Aug 2023 11:02:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a637517000000b00563c1aa277asm8329462pgc.6.2023.08.22.11.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:02:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/11] PM / devfreq: Drop unneed locking to appease lockdep
Date: Tue, 22 Aug 2023 11:01:48 -0700
Message-ID: <20230822180208.95556-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the process of adding lockdep annotation for GPU job_run() path to
catch potential deadlocks against the shrinker/reclaim path, I turned
up this lockdep splat:

   ======================================================
   WARNING: possible circular locking dependency detected
   6.2.0-rc8-debug+ #556 Not tainted
   ------------------------------------------------------
   ring0/123 is trying to acquire lock:
   ffffff8087219078 (&devfreq->lock){+.+.}-{3:3}, at: devfreq_monitor_resume+0x3c/0xf0

   but task is already holding lock:
   ffffffd6f64e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0x68/0x150

   which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

   -> #3 (dma_fence_map){++++}-{0:0}:
          __dma_fence_might_wait+0x74/0xc0
          dma_resv_lockdep+0x1f4/0x2f4
          do_one_initcall+0x104/0x2bc
          kernel_init_freeable+0x344/0x34c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
          fs_reclaim_acquire+0x80/0xa8
          slab_pre_alloc_hook.constprop.0+0x40/0x25c
          __kmem_cache_alloc_node+0x60/0x1cc
          __kmalloc+0xd8/0x100
          topology_parse_cpu_capacity+0x8c/0x178
          get_cpu_for_node+0x88/0xc4
          parse_cluster+0x1b0/0x28c
          parse_cluster+0x8c/0x28c
          init_cpu_topology+0x168/0x188
          smp_prepare_cpus+0x24/0xf8
          kernel_init_freeable+0x18c/0x34c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #1 (fs_reclaim){+.+.}-{0:0}:
          __fs_reclaim_acquire+0x3c/0x48
          fs_reclaim_acquire+0x54/0xa8
          slab_pre_alloc_hook.constprop.0+0x40/0x25c
          __kmem_cache_alloc_node+0x60/0x1cc
          __kmalloc_node_track_caller+0xb8/0xe0
          kstrdup+0x70/0x90
          kstrdup_const+0x38/0x48
          kvasprintf_const+0x48/0xbc
          kobject_set_name_vargs+0x40/0xb0
          dev_set_name+0x64/0x8c
          devfreq_add_device+0x31c/0x55c
          devm_devfreq_add_device+0x6c/0xb8
          msm_devfreq_init+0xa8/0x16c
          msm_gpu_init+0x38c/0x570
          adreno_gpu_init+0x1b4/0x2b4
          a6xx_gpu_init+0x15c/0x3e4
          adreno_bind+0x218/0x254
          component_bind_all+0x114/0x1ec
          msm_drm_bind+0x2b8/0x608
          try_to_bring_up_aggregate_device+0x88/0x1a4
          __component_add+0xec/0x13c
          component_add+0x1c/0x28
          dsi_dev_attach+0x28/0x34
          dsi_host_attach+0xdc/0x124
          mipi_dsi_attach+0x30/0x44
          devm_mipi_dsi_attach+0x2c/0x70
          ti_sn_bridge_probe+0x298/0x2c4
          auxiliary_bus_probe+0x7c/0x94
          really_probe+0x158/0x290
          __driver_probe_device+0xc8/0xe0
          driver_probe_device+0x44/0x100
          __device_attach_driver+0x64/0xdc
          bus_for_each_drv+0xa0/0xc8
          __device_attach+0xd8/0x168
          device_initial_probe+0x1c/0x28
          bus_probe_device+0x38/0xa0
          deferred_probe_work_func+0xc8/0xe0
          process_one_work+0x2d8/0x478
          process_scheduled_works+0x4c/0x50
          worker_thread+0x218/0x274
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #0 (&devfreq->lock){+.+.}-{3:3}:
          __lock_acquire+0xe00/0x1060
          lock_acquire+0x1e0/0x2f8
          __mutex_lock+0xcc/0x3c8
          mutex_lock_nested+0x30/0x44
          devfreq_monitor_resume+0x3c/0xf0
          devfreq_simple_ondemand_handler+0x54/0x7c
          devfreq_resume_device+0xa4/0xe8
          msm_devfreq_resume+0x78/0xa8
          a6xx_pm_resume+0x110/0x234
          adreno_runtime_resume+0x2c/0x38
          pm_generic_runtime_resume+0x30/0x44
          __rpm_callback+0x15c/0x174
          rpm_callback+0x78/0x7c
          rpm_resume+0x318/0x524
          __pm_runtime_resume+0x78/0xbc
          pm_runtime_get_sync.isra.0+0x14/0x20
          msm_gpu_submit+0x58/0x178
          msm_job_run+0x78/0x150
          drm_sched_main+0x290/0x370
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   other info that might help us debug this:

   Chain exists of:
     &devfreq->lock --> mmu_notifier_invalidate_range_start --> dma_fence_map

    Possible unsafe locking scenario:

          CPU0                    CPU1
          ----                    ----
     lock(dma_fence_map);
                                  lock(mmu_notifier_invalidate_range_start);
                                  lock(dma_fence_map);
     lock(&devfreq->lock);

    *** DEADLOCK ***

   2 locks held by ring0/123:
    #0: ffffff8087201170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x64/0x150
    #1: ffffffd6f64e57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0x68/0x150

   stack backtrace:
   CPU: 6 PID: 123 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #556
   Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
   Call trace:
    dump_backtrace.part.0+0xb4/0xf8
    show_stack+0x20/0x38
    dump_stack_lvl+0x9c/0xd0
    dump_stack+0x18/0x34
    print_circular_bug+0x1b4/0x1f0
    check_noncircular+0x78/0xac
    __lock_acquire+0xe00/0x1060
    lock_acquire+0x1e0/0x2f8
    __mutex_lock+0xcc/0x3c8
    mutex_lock_nested+0x30/0x44
    devfreq_monitor_resume+0x3c/0xf0
    devfreq_simple_ondemand_handler+0x54/0x7c
    devfreq_resume_device+0xa4/0xe8
    msm_devfreq_resume+0x78/0xa8
    a6xx_pm_resume+0x110/0x234
    adreno_runtime_resume+0x2c/0x38
    pm_generic_runtime_resume+0x30/0x44
    __rpm_callback+0x15c/0x174
    rpm_callback+0x78/0x7c
    rpm_resume+0x318/0x524
    __pm_runtime_resume+0x78/0xbc
    pm_runtime_get_sync.isra.0+0x14/0x20
    msm_gpu_submit+0x58/0x178
    msm_job_run+0x78/0x150
    drm_sched_main+0x290/0x370
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20

The issue is that we cannot be holding any lock while doing memory
allocations that is also needed in the job_run (and in the case of
devfreq, this means runpm_resume()) because lockdep sees this as a
potential dependency.

Fortunately there is really no reason to hold the devfreq lock when
we are creating the devfreq device, as it is not yet visible to any
other task.  The only reason it was needed was for a lockdep assert
in devfreq_get_freq_range().  Instead, split this up into an internal
fxn that is used in the devfreq_add_device() (where the lock is not
required).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/devfreq/devfreq.c | 46 ++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e36cbb920ec8..e5558ec68ce8 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -111,23 +111,13 @@ static unsigned long find_available_max_freq(struct devfreq *devfreq)
 	return max_freq;
 }
 
-/**
- * devfreq_get_freq_range() - Get the current freq range
- * @devfreq:	the devfreq instance
- * @min_freq:	the min frequency
- * @max_freq:	the max frequency
- *
- * This takes into consideration all constraints.
- */
-void devfreq_get_freq_range(struct devfreq *devfreq,
-			    unsigned long *min_freq,
-			    unsigned long *max_freq)
+static void __get_freq_range(struct devfreq *devfreq,
+			     unsigned long *min_freq,
+			     unsigned long *max_freq)
 {
 	unsigned long *freq_table = devfreq->freq_table;
 	s32 qos_min_freq, qos_max_freq;
 
-	lockdep_assert_held(&devfreq->lock);
-
 	/*
 	 * Initialize minimum/maximum frequency from freq table.
 	 * The devfreq drivers can initialize this in either ascending or
@@ -158,6 +148,23 @@ void devfreq_get_freq_range(struct devfreq *devfreq,
 	if (*min_freq > *max_freq)
 		*min_freq = *max_freq;
 }
+
+/**
+ * devfreq_get_freq_range() - Get the current freq range
+ * @devfreq:	the devfreq instance
+ * @min_freq:	the min frequency
+ * @max_freq:	the max frequency
+ *
+ * This takes into consideration all constraints.
+ */
+void devfreq_get_freq_range(struct devfreq *devfreq,
+			    unsigned long *min_freq,
+			    unsigned long *max_freq)
+{
+	lockdep_assert_held(&devfreq->lock);
+
+	__get_freq_range(devfreq, min_freq, max_freq);
+}
 EXPORT_SYMBOL(devfreq_get_freq_range);
 
 /**
@@ -810,7 +817,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	mutex_init(&devfreq->lock);
-	mutex_lock(&devfreq->lock);
 	devfreq->dev.parent = dev;
 	devfreq->dev.class = devfreq_class;
 	devfreq->dev.release = devfreq_dev_release;
@@ -823,17 +829,14 @@ struct devfreq *devfreq_add_device(struct device *dev,
 
 	if (devfreq->profile->timer < 0
 		|| devfreq->profile->timer >= DEVFREQ_TIMER_NUM) {
-		mutex_unlock(&devfreq->lock);
 		err = -EINVAL;
 		goto err_dev;
 	}
 
 	if (!devfreq->profile->max_state || !devfreq->profile->freq_table) {
-		mutex_unlock(&devfreq->lock);
 		err = set_freq_table(devfreq);
 		if (err < 0)
 			goto err_dev;
-		mutex_lock(&devfreq->lock);
 	} else {
 		devfreq->freq_table = devfreq->profile->freq_table;
 		devfreq->max_state = devfreq->profile->max_state;
@@ -841,19 +844,17 @@ struct devfreq *devfreq_add_device(struct device *dev,
 
 	devfreq->scaling_min_freq = find_available_min_freq(devfreq);
 	if (!devfreq->scaling_min_freq) {
-		mutex_unlock(&devfreq->lock);
 		err = -EINVAL;
 		goto err_dev;
 	}
 
 	devfreq->scaling_max_freq = find_available_max_freq(devfreq);
 	if (!devfreq->scaling_max_freq) {
-		mutex_unlock(&devfreq->lock);
 		err = -EINVAL;
 		goto err_dev;
 	}
 
-	devfreq_get_freq_range(devfreq, &min_freq, &max_freq);
+	__get_freq_range(devfreq, &min_freq, &max_freq);
 
 	devfreq->suspend_freq = dev_pm_opp_get_suspend_opp_freq(dev);
 	devfreq->opp_table = dev_pm_opp_get_opp_table(dev);
@@ -865,7 +866,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	dev_set_name(&devfreq->dev, "%s", dev_name(dev));
 	err = device_register(&devfreq->dev);
 	if (err) {
-		mutex_unlock(&devfreq->lock);
 		put_device(&devfreq->dev);
 		goto err_out;
 	}
@@ -876,7 +876,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 				    devfreq->max_state),
 			GFP_KERNEL);
 	if (!devfreq->stats.trans_table) {
-		mutex_unlock(&devfreq->lock);
 		err = -ENOMEM;
 		goto err_devfreq;
 	}
@@ -886,7 +885,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 			sizeof(*devfreq->stats.time_in_state),
 			GFP_KERNEL);
 	if (!devfreq->stats.time_in_state) {
-		mutex_unlock(&devfreq->lock);
 		err = -ENOMEM;
 		goto err_devfreq;
 	}
@@ -896,8 +894,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 
 	srcu_init_notifier_head(&devfreq->transition_notifier_list);
 
-	mutex_unlock(&devfreq->lock);
-
 	err = dev_pm_qos_add_request(dev, &devfreq->user_min_freq_req,
 				     DEV_PM_QOS_MIN_FREQUENCY, 0);
 	if (err < 0)
-- 
2.41.0

