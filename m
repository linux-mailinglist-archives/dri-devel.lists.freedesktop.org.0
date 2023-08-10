Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC177820E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 22:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCFA10E4F7;
	Thu, 10 Aug 2023 20:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AA910E5EF;
 Thu, 10 Aug 2023 20:21:25 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bda00e7543so7133505ad.0; 
 Thu, 10 Aug 2023 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691698885; x=1692303685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uM9oSpoHkYT2DcfSPpn70J1M+BqeZpakFeN9BFvYGzE=;
 b=bCqhtWyEB2t09xb65w/pVDjkpdX6VKNl7wZgQ92Ih3+86M71/5vq2AbinuqUHbGJ1n
 Nk9x4I0bsOtDdprY/JS2D648XkQqZMd/4cZXoPWINjDQoXKsM0n1SswZjfgjnKgK0dFM
 ZNdNtrByyWs/qC0/oXQ+HtmXaBhkOmQxXEX17yeLCSgLA3i76TIzhhdHA2yurNthQPcc
 83wDQsfZT6UkXEYJ5c85VN22BNISO2i+aQIz01Avg1tQ8FY+gtyXImTUx3JF2czI7Gv/
 E71GcJkcYtIISPLdohoAHrArdPaVV2usIZ/r4ebsiowGDFlkL4gw0DDkD0Korbz7LCp0
 rx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691698885; x=1692303685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uM9oSpoHkYT2DcfSPpn70J1M+BqeZpakFeN9BFvYGzE=;
 b=SqJQD8/caromEF2HqpJihmwk4ikWYQ19PFOO+A7DMcBgPnQG5hW79N+nH9MKicEpew
 RPiIrXB9lq3ONtfGlrTAG3MlIk/cd1OAICgw5aoYlzIEq75r2d5C7nLAPh0ZY/gS+bHd
 KzcV5mSpBQqBO6UkDMr9u3mEuHWtlfzRN8nTTymwMsLRSRfwkT7yFaw7HyFWW8NHkSTB
 hVm5+ffeXY9aMTmfgxycrX8VPAaFgFaLbjAAwCV6BiG0jUpRAIPBHSw6HEoJhNm4A1Sl
 9j00f+MoRMCgyqa44Jf3ArjAnbMhgK0GsORNiWc9ymYDSv0Syl2kO0kH3a7Rm/y+QkJO
 vWxA==
X-Gm-Message-State: AOJu0YwQw9St69C4K+7wTOTwgGOvOtzifL86naUDGFLNb70jOuePb/2N
 Hcytchd9LzMrO/sXBuGFaviiMxx9uTs=
X-Google-Smtp-Source: AGHT+IHbAS2wQug/C4bgk4YFQ4QP3+Kmb+w8MV68jK8pSrNMnu97wRc/+PpQfmI19PE2qwm2bAXwFw==
X-Received: by 2002:a17:902:bb91:b0:1b8:4ec2:5200 with SMTP id
 m17-20020a170902bb9100b001b84ec25200mr2845817pls.2.1691698884604; 
 Thu, 10 Aug 2023 13:21:24 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b001ab2b4105ddsm2190292plh.60.2023.08.10.13.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 13:21:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Push down GMU lock
Date: Thu, 10 Aug 2023 13:21:14 -0700
Message-ID: <20230810202118.138386-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fix another lockdep splat by pushing the GMU lock further down in the
pm_resume path, so that we aren't holding it while preparing/enabling
clks.  Fixes:

   ======================================================
   WARNING: possible circular locking dependency detected
   ------------------------------------------------------
   6.4.3-debug+ #14 Not tainted
   ffffffe487cefb98 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x70/0x98
   ring0/408 is trying to acquire lock:
   already holding lock:

   ffffff809600c6c0 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}, at: a6xx_gmu_pm_resume+0x40/0x170 [msm]

   which lock already depends on the new lock.
   the existing dependency chain (in reverse order) is:

   -> #4 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}:

          mutex_lock_nested+0x2c/0x38
          __mutex_lock+0xc8/0x388
          msm_devfreq_target+0x170/0x18c [msm]
          a6xx_gpu_set_freq+0x38/0x64 [msm]
          devfreq_update_target+0xb4/0xf0
          devfreq_set_target+0x90/0x1e4
          devfreq_monitor+0x3c/0x10c
          update_devfreq+0x1c/0x28
          worker_thread+0x1f0/0x260
          process_one_work+0x288/0x3d8
          ret_from_fork+0x10/0x20
          kthread+0xf0/0x100
   -> #3 (&df->lock){+.+.}-{3:3}:

          mutex_lock_nested+0x2c/0x38
          __mutex_lock+0xc8/0x388
          devfreq_simple_ondemand_func+0x5c/0x128
          msm_devfreq_get_dev_status+0x4c/0x104 [msm]
          update_devfreq+0x1c/0x28
          devfreq_update_target+0x68/0xf0
          process_one_work+0x288/0x3d8
          devfreq_monitor+0x3c/0x10c
          kthread+0xf0/0x100
          worker_thread+0x1f0/0x260

          ret_from_fork+0x10/0x20
          devfreq_add_device+0x1b4/0x564
   -> #2 (&devfreq->lock){+.+.}-{3:3}:
          msm_devfreq_init+0xa8/0x16c [msm]
          devm_devfreq_add_device+0x6c/0xb8
          adreno_gpu_init+0x248/0x2b0 [msm]
          msm_gpu_init+0x368/0x54c [msm]
          adreno_bind+0x264/0x2bc [msm]
          a6xx_gpu_init+0x2d0/0x384 [msm]
          msm_drm_bind+0x2d0/0x5f4 [msm]
          component_bind_all+0x124/0x1f4
          __component_add+0xd4/0x128
          try_to_bring_up_aggregate_device+0x88/0x1a4
          dp_display_probe+0x37c/0x3c0 [msm]
          component_add+0x1c/0x28
          really_probe+0x148/0x280
          platform_probe+0x70/0xc0
          driver_probe_device+0x44/0x100
          __driver_probe_device+0xfc/0x114
          bus_for_each_drv+0xb0/0xd8
          __device_attach_driver+0x64/0xdc
          device_initial_probe+0x1c/0x28
          __device_attach+0xe4/0x140
          deferred_probe_work_func+0xb0/0xc8
          bus_probe_device+0x44/0xb0
          worker_thread+0x1f0/0x260
          process_one_work+0x288/0x3d8
          ret_from_fork+0x10/0x20
          kthread+0xf0/0x100
   -> #1 (fs_reclaim){+.+.}-{0:0}:

          fs_reclaim_acquire+0x50/0x9c
          __fs_reclaim_acquire+0x3c/0x48
          __kmem_cache_alloc_node+0x60/0x18c
          slab_pre_alloc_hook.constprop.0+0x40/0x250
          clk_rcg2_dfs_determine_rate+0x60/0x214
          kmalloc_trace+0x44/0x88
          clk_core_round_rate_nolock+0x84/0x118
          clk_core_determine_round_nolock+0xb8/0xf0
          clk_round_rate+0x6c/0xd0
          clk_core_round_rate_nolock+0xd8/0x118
          geni_se_clk_freq_match+0x44/0xe4
          geni_se_clk_tbl_get+0x78/0xc0
          geni_spi_set_clock_and_bw+0x54/0x104
          get_spi_clk_cfg+0x50/0xf4
          __spi_pump_transfer_message+0x200/0x4d8
          spi_geni_prepare_message+0x130/0x174
          spi_sync_locked+0x18/0x24
          __spi_sync+0x13c/0x23c
          cros_ec_xfer_high_pri_work+0x28/0x3c
          do_cros_ec_pkt_xfer_spi+0x124/0x3f0
          kthread+0xf0/0x100
          kthread_worker_fn+0x14c/0x27c

          ret_from_fork+0x10/0x20
          __lock_acquire+0xdf8/0x109c
   -> #0 (prepare_lock){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          lock_acquire+0x234/0x284
          clk_prepare_lock+0x70/0x98
          mutex_lock_nested+0x2c/0x38
          clk_bulk_prepare+0x50/0x9c
          clk_prepare+0x24/0x50
          a6xx_gmu_pm_resume+0x48/0x170 [msm]
          a6xx_gmu_resume+0x94/0x7d8 [msm]
          pm_generic_runtime_resume+0x30/0x44
          adreno_runtime_resume+0x2c/0x38 [msm]
          rpm_callback+0x78/0x7c
          __rpm_callback+0x4c/0x134
          __pm_runtime_resume+0x78/0xbc
          rpm_resume+0x3a4/0x46c
          msm_gpu_submit+0x4c/0x12c [msm]
          pm_runtime_get_sync.isra.0+0x14/0x20 [msm]
          drm_sched_main+0x264/0x354 [gpu_sched]
          msm_job_run+0x88/0x128 [msm]
          ret_from_fork+0x10/0x20
          kthread+0xf0/0x100
   other info that might help us debug this:

   Chain exists of:

     prepare_lock --> &df->lock --> &a6xx_gpu->gmu.lock

    Possible unsafe locking scenario:
          ----                    ----
          CPU0                    CPU1
                                  lock(&df->lock);
     lock(&a6xx_gpu->gmu.lock);
     lock(prepare_lock);
                                  lock(&a6xx_gpu->gmu.lock);
    *** DEADLOCK ***

   3 locks held by ring0/408:

    #1: ffffff809600c170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x7c/0x128 [msm]
    #0: ffffffe487d5ae50 (dma_fence_map){++++}-{0:0}, at: drm_sched_main+0x54/0x354 [gpu_sched]

    #2: ffffff809600c6c0 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}, at: a6xx_gmu_pm_resume+0x40/0x170 [msm]
   CPU: 1 PID: 408 Comm: ring0 Not tainted 6.4.3-debug+ #14
   stack backtrace:
   Call trace:
   Hardware name: Google Villager (rev1+) with LTE (DT)
    show_stack+0x20/0x30
    dump_backtrace+0xb4/0xf0
    dump_stack+0x18/0x24
    dump_stack_lvl+0x60/0x84
    check_noncircular+0x78/0xac
    print_circular_bug+0x1cc/0x234
    lock_acquire+0x234/0x284
    __lock_acquire+0xdf8/0x109c
    mutex_lock_nested+0x2c/0x38
    __mutex_lock+0xc8/0x388
    clk_prepare+0x24/0x50
    clk_prepare_lock+0x70/0x98
    a6xx_gmu_resume+0x94/0x7d8 [msm]
    clk_bulk_prepare+0x50/0x9c
    adreno_runtime_resume+0x2c/0x38 [msm]
    a6xx_gmu_pm_resume+0x48/0x170 [msm]
    __rpm_callback+0x4c/0x134
    pm_generic_runtime_resume+0x30/0x44
    rpm_resume+0x3a4/0x46c
    rpm_callback+0x78/0x7c
    pm_runtime_get_sync.isra.0+0x14/0x20 [msm]
    __pm_runtime_resume+0x78/0xbc
    msm_job_run+0x88/0x128 [msm]
    msm_gpu_submit+0x4c/0x12c [msm]
    drm_sched_main+0x264/0x354 [gpu_sched]
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3e0033666a2a..5eb0e812f168 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -965,6 +965,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the bus quota to a reasonable value for boot */
 	a6xx_gmu_set_initial_bw(gpu, gmu);
 
+	mutex_lock(&gmu->lock);
+
 	/* Enable the GMU interrupt */
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
 	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_MASK, ~A6XX_GMU_IRQ_MASK);
@@ -1009,6 +1011,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 		pm_runtime_put(gmu->dev);
 	}
 
+	mutex_unlock(&gmu->lock);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 67dd2eeecf62..da300dce10fa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1914,9 +1914,7 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 
 	trace_msm_gpu_resume(0);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_resume(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
 	if (ret)
 		return ret;
 
-- 
2.41.0

