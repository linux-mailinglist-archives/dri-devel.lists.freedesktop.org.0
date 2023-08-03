Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649B76F0B9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 19:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078FC10E0AB;
	Thu,  3 Aug 2023 17:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654EC10E646;
 Thu,  3 Aug 2023 17:34:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so8624875ad.0; 
 Thu, 03 Aug 2023 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691084077; x=1691688877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L4TXYPD45EHbghvtzyWN/qvkCMAlXnuXoz+iz5Vo9Co=;
 b=rSMgguLd+k8WEEQiEzLpXB2v9EeB/n6q6Gir6e2qP237l781RZVNyVsMEggSre066G
 HRGs0R0f3CiXGZtfG3gExQFGvOl54qnxXVyvLkS4uAnh6WIzDTc4P4++YOeE5vjAZSZP
 jcc87HFsHCxszLyakR+uOMYP0Whr51+SejVNaJRHPgM/3x8qyWkl4jSGVokEQG87cJ0j
 njqWwl2WFwMC6rsshjB3yxWxhJxQEjHnKIcIrFCqT6Wt8KSAZ/yaQ7xg2k+UP/gMfBtq
 AxfdtKLL6lhRb5ZmgRp2fRdpS5ATiE4Zpay/FNpujswogmIMs8oPZWaQsK8D5NY+Q1t6
 vLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691084077; x=1691688877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4TXYPD45EHbghvtzyWN/qvkCMAlXnuXoz+iz5Vo9Co=;
 b=U2D8wYJKk4Zz0IYesXao9XlfDHbecXyp+IvfkD6qsZYhYKEnxOH9cMWs2VUHnF34PL
 frGXrRW8Bkl2nmZcvOF+6D93p+klsx+awCW8q7Yy494LqUkqA+GA8lIAHd+qvLhOXf7i
 p90nJ5GeIAee9cpid4CweEs2IG9jpFZN5uuegnUe5/Ojnh/1TMEo2wpxm5Swbr6ITPov
 6rQ25OTtCK7qs0YHqLZJrpbOr3ALq7F5imFRzS5FJCXSTE27Gikv8JmuQlt0PUXyySDX
 a49HB0zA4cIqoHv7LMNCE6Gi9YAaT//Ji6PbTOxQxgP20PmsMtJ8qhkHNjySj0LmCp0i
 xQSg==
X-Gm-Message-State: ABy/qLa3PPRxSgrs6k1vR3ZRIEV9Q4YENMOJu+mwCqSJizNM+fSCrYBF
 3k4VW9nUeaDuWs1D//BWJYNdHvNRf5o=
X-Google-Smtp-Source: APBJJlEoCw8W0IYH2JiJiF0KDQXMZHv4o6fnfqfuk9RhScIA8xl4jYnHvu6oB1F0i1vanVWCJaeGow==
X-Received: by 2002:a17:902:7d8e:b0:1bb:c5a9:6b26 with SMTP id
 a14-20020a1709027d8e00b001bbc5a96b26mr16758611plm.5.1691084077089; 
 Thu, 03 Aug 2023 10:34:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170902c38500b001b89536974bsm125720plg.202.2023.08.03.10.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 10:34:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix GMU lockdep splat
Date: Thu,  3 Aug 2023 10:34:28 -0700
Message-ID: <20230803173431.48947-1-robdclark@gmail.com>
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

For normal GPU devfreq, we need to acquire the GMU lock while already
holding devfreq locks.  But in the teardown path, we were calling
dev_pm_domain_detach() while already holding the GMU lock, resulting in
this lockdep splat:

   ======================================================
   WARNING: possible circular locking dependency detected
   6.4.3-debug+ #3 Not tainted
   ------------------------------------------------------
   ring0/391 is trying to acquire lock:
   ffffff80a025c078 (&devfreq->lock){+.+.}-{3:3}, at: qos_notifier_call+0x30/0x74

   but task is already holding lock:
   ffffff809b8c1ce8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0x78

   which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

   -> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
          down_write+0x58/0x74
          __blocking_notifier_chain_register+0x64/0x84
          blocking_notifier_chain_register+0x1c/0x28
          freq_qos_add_notifier+0x5c/0x7c
          dev_pm_qos_add_notifier+0xd4/0xf0
          devfreq_add_device+0x42c/0x560
          devm_devfreq_add_device+0x6c/0xb8
          msm_devfreq_init+0xa8/0x16c [msm]
          msm_gpu_init+0x368/0x54c [msm]
          adreno_gpu_init+0x248/0x2b0 [msm]
          a6xx_gpu_init+0x2d0/0x384 [msm]
          adreno_bind+0x264/0x2bc [msm]
          component_bind_all+0x124/0x1f4
          msm_drm_bind+0x2d0/0x5f4 [msm]
          try_to_bring_up_aggregate_device+0x88/0x1a4
          __component_add+0xd4/0x128
          component_add+0x1c/0x28
          dp_display_probe+0x37c/0x3c0 [msm]
          platform_probe+0x70/0xc0
          really_probe+0x148/0x280
          __driver_probe_device+0xfc/0x114
          driver_probe_device+0x44/0x100
          __device_attach_driver+0x64/0xdc
          bus_for_each_drv+0xb0/0xd8
          __device_attach+0xe4/0x140
          device_initial_probe+0x1c/0x28
          bus_probe_device+0x44/0xb0
          deferred_probe_work_func+0xb0/0xc8
          process_one_work+0x288/0x3d8
          worker_thread+0x1f0/0x260
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          dev_pm_qos_remove_notifier+0x3c/0xc8
          genpd_remove_device+0x40/0x11c
          genpd_dev_pm_detach+0x88/0x130
          dev_pm_domain_detach+0x2c/0x3c
          a6xx_gmu_remove+0x44/0xdc [msm]
          a6xx_destroy+0x7c/0xa4 [msm]
          adreno_unbind+0x50/0x64 [msm]
          component_unbind+0x44/0x64
          component_unbind_all+0xb4/0xbc
          msm_drm_uninit.isra.0+0x124/0x17c [msm]
          msm_drm_bind+0x340/0x5f4 [msm]
          try_to_bring_up_aggregate_device+0x88/0x1a4
          __component_add+0xd4/0x128
          component_add+0x1c/0x28
          dp_display_probe+0x37c/0x3c0 [msm]
          platform_probe+0x70/0xc0
          really_probe+0x148/0x280
          __driver_probe_device+0xfc/0x114
          driver_probe_device+0x44/0x100
          __device_attach_driver+0x64/0xdc
          bus_for_each_drv+0xb0/0xd8
          __device_attach+0xe4/0x140
          device_initial_probe+0x1c/0x28
          bus_probe_device+0x44/0xb0
          deferred_probe_work_func+0xb0/0xc8
          process_one_work+0x288/0x3d8
          worker_thread+0x1f0/0x260
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #2 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          a6xx_gpu_set_freq+0x38/0x64 [msm]
          msm_devfreq_target+0x170/0x18c [msm]
          devfreq_set_target+0x90/0x1e4
          devfreq_update_target+0xb4/0xf0
          update_devfreq+0x1c/0x28
          devfreq_monitor+0x3c/0x10c
          process_one_work+0x288/0x3d8
          worker_thread+0x1f0/0x260
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #1 (&df->lock){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          msm_devfreq_get_dev_status+0x4c/0x104 [msm]
          devfreq_simple_ondemand_func+0x5c/0x128
          devfreq_update_target+0x68/0xf0
          update_devfreq+0x1c/0x28
          devfreq_monitor+0x3c/0x10c
          process_one_work+0x288/0x3d8
          worker_thread+0x1f0/0x260
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #0 (&devfreq->lock){+.+.}-{3:3}:
          __lock_acquire+0xdf8/0x109c
          lock_acquire+0x234/0x284
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          qos_notifier_call+0x30/0x74
          qos_min_notifier_call+0x1c/0x28
          notifier_call_chain+0xf4/0x114
          blocking_notifier_call_chain+0x4c/0x78
          pm_qos_update_target+0x184/0x190
          freq_qos_apply+0x4c/0x64
          apply_constraint+0xf8/0xfc
          __dev_pm_qos_update_request+0x138/0x164
          dev_pm_qos_update_request+0x44/0x68
          msm_devfreq_boost+0x40/0x70 [msm]
          msm_devfreq_active+0xc0/0xf0 [msm]
          msm_gpu_submit+0xc8/0x12c [msm]
          msm_job_run+0x88/0x128 [msm]
          drm_sched_main+0x240/0x324 [gpu_sched]
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   other info that might help us debug this:
   Chain exists of:
     &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->rwsem
    Possible unsafe locking scenario:
          CPU0                    CPU1
          ----                    ----
     rlock(&(c->notifiers)->rwsem);
                                  lock(dev_pm_qos_mtx);
                                  lock(&(c->notifiers)->rwsem);
     lock(&devfreq->lock);

    *** DEADLOCK ***
   4 locks held by ring0/391:
    #0: ffffff809c811170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x7c/0x128 [msm]
    #1: ffffff809c811208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit+0xa8/0x12c [msm]
    #2: ffffffecbbb46600 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update_request+0x38/0x68
    #3: ffffff809b8c1ce8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0x78

   stack backtrace:
   CPU: 6 PID: 391 Comm: ring0 Not tainted 6.4.3debug+ #3
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
    qos_notifier_call+0x30/0x74
    qos_min_notifier_call+0x1c/0x28
    notifier_call_chain+0xf4/0x114
    blocking_notifier_call_chain+0x4c/0x78
    pm_qos_update_target+0x184/0x190
    freq_qos_apply+0x4c/0x64
    apply_constraint+0xf8/0xfc
    __dev_pm_qos_update_request+0x138/0x164
    dev_pm_qos_update_request+0x44/0x68
    msm_devfreq_boost+0x40/0x70 [msm]
    msm_devfreq_active+0xc0/0xf0 [msm]
    msm_gpu_submit+0xc8/0x12c [msm]
    msm_job_run+0x88/0x128 [msm]
    drm_sched_main+0x240/0x324 [gpu_sched]
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20

Fix this by only synchronizing access to gmu->initialized.

Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 ++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 --
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index bf7f855f4a34..3e0033666a2a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1441,8 +1441,15 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 
-	if (!gmu->initialized)
+	mutex_lock(&gmu->lock);
+	if (!gmu->initialized) {
+		mutex_unlock(&gmu->lock);
 		return;
+	}
+
+	gmu->initialized = false;
+
+	mutex_unlock(&gmu->lock);
 
 	pm_runtime_force_suspend(gmu->dev);
 
@@ -1472,8 +1479,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
-
-	gmu->initialized = false;
 }
 
 static int cxpd_notifier_cb(struct notifier_block *nb,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9be3260c8033..67dd2eeecf62 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2091,9 +2091,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 
 	a6xx_llc_slices_destroy(a6xx_gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
 	a6xx_gmu_remove(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-- 
2.41.0

