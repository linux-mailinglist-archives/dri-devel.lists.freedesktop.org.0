Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4F7782BD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 23:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E626410E60E;
	Thu, 10 Aug 2023 21:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B28110E5AE;
 Thu, 10 Aug 2023 21:32:16 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686b9964ae2so1086678b3a.3; 
 Thu, 10 Aug 2023 14:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691703135; x=1692307935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SzqL1AaWOP4SSGlcRMCtR0TSaiWd13HEr/TubpNtqSc=;
 b=buTPGjO7rDRwfI8FDohmzRZ7DWKHc6StwkBICns2JCL4bVk+KhgpyW84owa88K9nkJ
 xDvsbgkBp+1ewXDsnftyzYro0WH9WliJ7/I68KimyxDR2N3Q4T0E2Iv1U7Vx6U2zMRX9
 zXTIFs8GLmOp/3pMPbEX8FMB3eRbDIkxUvWHm0kJrIMkDpsUubnL5tzouH62NCZN9VQ2
 mHLnoUzRdO3tTY5ZoF1fxoWJo3Y4DPV6+tbo1OrISmI3P4NWAjXqDzT8fJRuXpCUFKD1
 gnIFnh5xCZ6hZ1uvwfodYkY9gBvdG1sRZAaA12b0iuoVSYJ99whDZquRiU82R+VhD8/R
 HSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691703135; x=1692307935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzqL1AaWOP4SSGlcRMCtR0TSaiWd13HEr/TubpNtqSc=;
 b=QbtL4ai4kVJXS1iIiFYa7HXlHGIafFkEexAFU3N4oE5lRPO2XJeG83/jaD2fJ0e65k
 a9zZXS+QEdtW6sXWhHJ+iwv/5BCxslMZ0ZGQjBJ5LqrRrJC7piJIv+CKaZDyua8RQxfl
 EBzFsVfPA87IbJYnEhEYdbUpegAisIXzTwIM89mUQqUDWCZFFOll1PAe5pSrgzQmKfPO
 oUmvs18Y/1kJrzQIKcKdeMJGCgC7gqPXE2OMM4Re4YYv4Zvp3oYCN++H9PSeWHl3jFVP
 s2BzVYlwGYTyd5wf7BYpc7aKk+KPKbSds9AcnTeUz7j3DLlGZK21ic17mPu5ZZM61IYG
 aTgQ==
X-Gm-Message-State: AOJu0Yxypw45NPa7OPO4+j5d33ysi+GM1b0x+Pa7lixTZ8LtQyH/tWYt
 ra/QRSmzr0wAOj/mZvFexC+JXr3Kx8Y=
X-Google-Smtp-Source: AGHT+IHBayCHDT3Cpx/3BQlhp0VZyaUBwzvUljQvjul1uNKEXehslvUWEOeHlCQFaeZoK1WeJMZUrA==
X-Received: by 2002:a05:6a20:7fa9:b0:115:5ed5:34d3 with SMTP id
 d41-20020a056a207fa900b001155ed534d3mr301345pzj.20.1691703135051; 
 Thu, 10 Aug 2023 14:32:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a633703000000b0056334a7b9b2sm2004112pga.33.2023.08.10.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 14:32:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Push gpu lock down past runpm
Date: Thu, 10 Aug 2023 14:31:41 -0700
Message-ID: <20230810213141.153011-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid holding gpu lock when calling runpm, to avoid this lockdep splat:

   ======================================================
   WARNING: possible circular locking dependency detected
   6.4.3-debug+ #14 Not tainted
   ------------------------------------------------------
   ring0/373 is trying to acquire lock:
   ffffffead86efb98 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x70/0x98

   but task is already holding lock:
   ffffff809cd19170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x7c/0x128 [msm]

   which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

   -> #4 (&gpu->lock){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          msm_job_run+0x7c/0x128 [msm]
          drm_sched_main+0x264/0x354 [gpu_sched]
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #3 (dma_fence_map){++++}-{0:0}:
          __dma_fence_might_wait+0x74/0xc0
          dma_resv_lockdep+0x1f0/0x2e8
          do_one_initcall+0xb4/0x214
          kernel_init_freeable+0x338/0x33c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #2 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
          fs_reclaim_acquire+0x7c/0x9c
          slab_pre_alloc_hook.constprop.0+0x40/0x250
          __kmem_cache_alloc_node+0x60/0x18c
          kmalloc_node_trace+0x40/0x84
          alloc_worker+0x2c/0x64
          init_rescuer+0x34/0xe0
          workqueue_init+0x168/0x1fc
          kernel_init_freeable+0x15c/0x33c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #1 (fs_reclaim){+.+.}-{0:0}:
          __fs_reclaim_acquire+0x3c/0x48
          fs_reclaim_acquire+0x50/0x9c
          slab_pre_alloc_hook.constprop.0+0x40/0x250
          __kmem_cache_alloc_node+0x60/0x18c
          kmalloc_trace+0x44/0x88
          clk_rcg2_dfs_determine_rate+0x60/0x214
          clk_core_determine_round_nolock+0xb8/0xf0
          clk_core_round_rate_nolock+0x84/0x118
          clk_core_round_rate_nolock+0xd8/0x118
          clk_round_rate+0x6c/0xd0
          geni_se_clk_tbl_get+0x78/0xc0
          geni_se_clk_freq_match+0x44/0xe4
          get_spi_clk_cfg+0x50/0xf4
          geni_spi_set_clock_and_bw+0x54/0x104
          spi_geni_prepare_message+0x130/0x174
          __spi_pump_transfer_message+0x200/0x4d8
          __spi_sync+0x13c/0x23c
          spi_sync_locked+0x18/0x24
          do_cros_ec_pkt_xfer_spi+0x124/0x3f0
          cros_ec_xfer_high_pri_work+0x28/0x3c
          kthread_worker_fn+0x14c/0x27c
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #0 (prepare_lock){+.+.}-{3:3}:
          __lock_acquire+0xdf8/0x109c
          lock_acquire+0x234/0x284
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          clk_prepare_lock+0x70/0x98
          clk_prepare+0x24/0x50
          clk_bulk_prepare+0x50/0x9c
          a6xx_gmu_resume+0x94/0x800 [msm]
          a6xx_gmu_pm_resume+0x38/0x158 [msm]
          adreno_runtime_resume+0x2c/0x38 [msm]
          pm_generic_runtime_resume+0x30/0x44
          __rpm_callback+0x4c/0x134
          rpm_callback+0x78/0x7c
          rpm_resume+0x3a4/0x46c
          __pm_runtime_resume+0x78/0xbc
          pm_runtime_get_sync.isra.0+0x14/0x20 [msm]
          msm_gpu_submit+0x4c/0x12c [msm]
          msm_job_run+0x88/0x128 [msm]
          drm_sched_main+0x264/0x354 [gpu_sched]
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   other info that might help us debug this:
   Chain exists of:
     prepare_lock --> dma_fence_map --> &gpu->lock
    Possible unsafe locking scenario:
          CPU0                    CPU1
          ----                    ----
     lock(&gpu->lock);
                                  lock(dma_fence_map);
                                  lock(&gpu->lock);
     lock(prepare_lock);

    *** DEADLOCK ***
   2 locks held by ring0/373:
    #0: ffffffead875ae50 (dma_fence_map){++++}-{0:0}, at: drm_sched_main+0x54/0x354 [gpu_sched]
    #1: ffffff809cd19170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x7c/0x128 [msm]

   stack backtrace:
   CPU: 2 PID: 373 Comm: ring0 Not tainted 6.4.3-debug+ #14
   Hardware name: Google Villager (rev1+) with LTE (DT)
   Call trace:
    dump_backtrace+0xb4/0xf0
    show_stack+0x20/0x30
    dump_stack_lvl+0x60/0x84
    dump_stack+0x18/0x24
    print_circular_bug+0x1cc/0x234
    check_noncircular+0x78/0xac
    __lock_acquire+0xdf8/0x109c
    lock_acquire+0x234/0x284
    __mutex_lock+0xc8/0x388
    mutex_lock_nested+0x2c/0x38
    clk_prepare_lock+0x70/0x98
    clk_prepare+0x24/0x50
    clk_bulk_prepare+0x50/0x9c
    a6xx_gmu_resume+0x94/0x800 [msm]
    a6xx_gmu_pm_resume+0x38/0x158 [msm]
    adreno_runtime_resume+0x2c/0x38 [msm]
    pm_generic_runtime_resume+0x30/0x44
    __rpm_callback+0x4c/0x134
    rpm_callback+0x78/0x7c
    rpm_resume+0x3a4/0x46c
    __pm_runtime_resume+0x78/0xbc
    pm_runtime_get_sync.isra.0+0x14/0x20 [msm]
    msm_gpu_submit+0x4c/0x12c [msm]
    msm_job_run+0x88/0x128 [msm]
    drm_sched_main+0x264/0x354 [gpu_sched]
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c        | 11 ++++++-----
 drivers/gpu/drm/msm/msm_ringbuffer.c |  7 ++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 243f988c65b7..0a5e28410e68 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -749,13 +749,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned long flags;
 
-	WARN_ON(!mutex_is_locked(&gpu->lock));
-
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-	msm_gpu_hw_init(gpu);
+	mutex_lock(&gpu->lock);
 
-	submit->seqno = submit->hw_fence->seqno;
+	msm_gpu_hw_init(gpu);
 
 	update_sw_cntrs(gpu);
 
@@ -781,8 +779,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	gpu->funcs->submit(gpu, submit);
 	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
-	pm_runtime_put(&gpu->pdev->dev);
 	hangcheck_timer_reset(gpu);
+
+	mutex_unlock(&gpu->lock);
+
+	pm_runtime_put(&gpu->pdev->dev);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index cb9cf41bcb9b..9d6e2e10d25a 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -21,6 +21,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	msm_fence_init(submit->hw_fence, fctx);
 
+	submit->seqno = submit->hw_fence->seqno;
+
 	mutex_lock(&priv->lru.lock);
 
 	for (i = 0; i < submit->nr_bos; i++) {
@@ -32,13 +34,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	mutex_unlock(&priv->lru.lock);
 
-	/* TODO move submit path over to using a per-ring lock.. */
-	mutex_lock(&gpu->lock);
-
 	msm_gpu_submit(gpu, submit);
 
-	mutex_unlock(&gpu->lock);
-
 	return dma_fence_get(submit->hw_fence);
 }
 
-- 
2.41.0

