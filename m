Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8676F560
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041BB10E68C;
	Thu,  3 Aug 2023 22:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096CF10E687;
 Thu,  3 Aug 2023 22:02:32 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-78372b896d0so49603239f.2; 
 Thu, 03 Aug 2023 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100150; x=1691704950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9SzfK8f8benMkFPZZn5M0dDI6Vik7V2Z9qVmakjIP4=;
 b=NXFC0SgMR6lPcGAuZ/t4OFEGCGcljI+NjqkglYS6burKBeyQa3c/KPDvGFw/b8XhZ5
 3Bnn3wRzAdzocpWpqmG8UBKZQJ69ZDqNy3UfGr42OSlem4HHZhZozxf7zQC5RQ3C3EYP
 935LW07FwynLc+PUcp2FMfYZLLY3cOZCtAmy7ns6XY7slbsobF4RRiU3Beev+RVQz1aR
 ycPInvnsfP8VS+2KOcfQOvgppfKGHwcvcdqDgWBckEaP4zIzdZ4UN63yf3NEYyC34WCP
 pMU0e4SxOVDvedCdyvh9nvrls0BQ6i/8QbtCcXyXaCEWLVrgYD+yBIklV3fTdTuZJieS
 jy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100150; x=1691704950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9SzfK8f8benMkFPZZn5M0dDI6Vik7V2Z9qVmakjIP4=;
 b=F1Xn0TpRMus9wc5kC0arGstFBOrSyXQkU6kHSJ0ThbXR2lubmbZvzM5UN+WlPV5JRH
 4dpXyKT7yCiTk7NgKLvVNlQrYwm32+edp/xt95SY3K5WYMSqWtiTd7PxepBrqj294qzu
 9lMuJSl2ZzdGnn/4lTWXKXc0zXMiF5VWx1J+zHWmroiU8J5m/xvxyetNwkLi3cRQCayF
 1K2q+m9EbqgnxBJDW/Bw6XoK7gh2pyoy9OKxu/nt56lzPUoUEywybbzj8XOCUoICmzv0
 t7ruB5xz+2HUdQdlquRKiS5KdDQ2l71ijXIZ1grNl5ik565ocitSjt9wylYx4zYD1roy
 yRUQ==
X-Gm-Message-State: AOJu0Ywu6t15TxliDdZh20ofHWQ7xL6WAre0GMXdsdtzQtzXmFzHLxHu
 HECQJ87vSJmsdaNqlmvg82JWX9AuSZM=
X-Google-Smtp-Source: AGHT+IEvjEDBfu4lY4atvoirKumYSBHJnt6vhnxOGdlriuw7JUtNLetHs5BWQXz9p3e9w+IJkTSYTg==
X-Received: by 2002:a92:cda9:0:b0:346:779a:ff70 with SMTP id
 g9-20020a92cda9000000b00346779aff70mr87434ild.28.1691100150510; 
 Thu, 03 Aug 2023 15:02:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 bt26-20020a63291a000000b0056438ae5e29sm294747pgb.43.2023.08.03.15.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] interconnect: Fix locking for runpm vs reclaim
Date: Thu,  3 Aug 2023 15:01:54 -0700
Message-ID: <20230803220202.78036-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For cases where icc_bw_set() can be called in callbaths that could
deadlock against shrinker/reclaim, such as runpm resume, we need to
decouple the icc locking.  Introduce a new icc_bw_lock for cases where
we need to serialize bw aggregation and update to decouple that from
paths that require memory allocation such as node/link creation/
destruction.

Fixes this lockdep splat:

   ======================================================
   WARNING: possible circular locking dependency detected
   6.2.0-rc8-debug+ #554 Not tainted
   ------------------------------------------------------
   ring0/132 is trying to acquire lock:
   ffffff80871916d0 (&gmu->lock){+.+.}-{3:3}, at: a6xx_pm_resume+0xf0/0x234

   but task is already holding lock:
   ffffffdb5aee57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0x68/0x150

   which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

   -> #4 (dma_fence_map){++++}-{0:0}:
          __dma_fence_might_wait+0x74/0xc0
          dma_resv_lockdep+0x1f4/0x2f4
          do_one_initcall+0x104/0x2bc
          kernel_init_freeable+0x344/0x34c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #3 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
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

   -> #2 (fs_reclaim){+.+.}-{0:0}:
          __fs_reclaim_acquire+0x3c/0x48
          fs_reclaim_acquire+0x54/0xa8
          slab_pre_alloc_hook.constprop.0+0x40/0x25c
          __kmem_cache_alloc_node+0x60/0x1cc
          __kmalloc+0xd8/0x100
          kzalloc.constprop.0+0x14/0x20
          icc_node_create_nolock+0x4c/0xc4
          icc_node_create+0x38/0x58
          qcom_icc_rpmh_probe+0x1b8/0x248
          platform_probe+0x70/0xc4
          really_probe+0x158/0x290
          __driver_probe_device+0xc8/0xe0
          driver_probe_device+0x44/0x100
          __driver_attach+0xf8/0x108
          bus_for_each_dev+0x78/0xc4
          driver_attach+0x2c/0x38
          bus_add_driver+0xd0/0x1d8
          driver_register+0xbc/0xf8
          __platform_driver_register+0x30/0x3c
          qnoc_driver_init+0x24/0x30
          do_one_initcall+0x104/0x2bc
          kernel_init_freeable+0x344/0x34c
          kernel_init+0x30/0x134
          ret_from_fork+0x10/0x20

   -> #1 (icc_lock){+.+.}-{3:3}:
          __mutex_lock+0xcc/0x3c8
          mutex_lock_nested+0x30/0x44
          icc_set_bw+0x88/0x2b4
          _set_opp_bw+0x8c/0xd8
          _set_opp+0x19c/0x300
          dev_pm_opp_set_opp+0x84/0x94
          a6xx_gmu_resume+0x18c/0x804
          a6xx_pm_resume+0xf8/0x234
          adreno_runtime_resume+0x2c/0x38
          pm_generic_runtime_resume+0x30/0x44
          __rpm_callback+0x15c/0x174
          rpm_callback+0x78/0x7c
          rpm_resume+0x318/0x524
          __pm_runtime_resume+0x78/0xbc
          adreno_load_gpu+0xc4/0x17c
          msm_open+0x50/0x120
          drm_file_alloc+0x17c/0x228
          drm_open_helper+0x74/0x118
          drm_open+0xa0/0x144
          drm_stub_open+0xd4/0xe4
          chrdev_open+0x1b8/0x1e4
          do_dentry_open+0x2f8/0x38c
          vfs_open+0x34/0x40
          path_openat+0x64c/0x7b4
          do_filp_open+0x54/0xc4
          do_sys_openat2+0x9c/0x100
          do_sys_open+0x50/0x7c
          __arm64_sys_openat+0x28/0x34
          invoke_syscall+0x8c/0x128
          el0_svc_common.constprop.0+0xa0/0x11c
          do_el0_svc+0xac/0xbc
          el0_svc+0x48/0xa0
          el0t_64_sync_handler+0xac/0x13c
          el0t_64_sync+0x190/0x194

   -> #0 (&gmu->lock){+.+.}-{3:3}:
          __lock_acquire+0xe00/0x1060
          lock_acquire+0x1e0/0x2f8
          __mutex_lock+0xcc/0x3c8
          mutex_lock_nested+0x30/0x44
          a6xx_pm_resume+0xf0/0x234
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
     &gmu->lock --> mmu_notifier_invalidate_range_start --> dma_fence_map

    Possible unsafe locking scenario:

          CPU0                    CPU1
          ----                    ----
     lock(dma_fence_map);
                                  lock(mmu_notifier_invalidate_range_start);
                                  lock(dma_fence_map);
     lock(&gmu->lock);

    *** DEADLOCK ***

   2 locks held by ring0/132:
    #0: ffffff8087191170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x64/0x150
    #1: ffffffdb5aee57e8 (dma_fence_map){++++}-{0:0}, at: msm_job_run+0x68/0x150

   stack backtrace:
   CPU: 7 PID: 132 Comm: ring0 Not tainted 6.2.0-rc8-debug+ #554
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
    a6xx_pm_resume+0xf0/0x234
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/interconnect/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 5fac448c28fd..e15a92a79df1 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -28,6 +28,7 @@ static LIST_HEAD(icc_providers);
 static int providers_count;
 static bool synced_state;
 static DEFINE_MUTEX(icc_lock);
+static DEFINE_MUTEX(icc_bw_lock);
 static struct dentry *icc_debugfs_dir;
 
 static void icc_summary_show_one(struct seq_file *s, struct icc_node *n)
@@ -631,7 +632,7 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 	if (WARN_ON(IS_ERR(path) || !path->num_nodes))
 		return -EINVAL;
 
-	mutex_lock(&icc_lock);
+	mutex_lock(&icc_bw_lock);
 
 	old_avg = path->reqs[0].avg_bw;
 	old_peak = path->reqs[0].peak_bw;
@@ -663,7 +664,7 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 		apply_constraints(path);
 	}
 
-	mutex_unlock(&icc_lock);
+	mutex_unlock(&icc_bw_lock);
 
 	trace_icc_set_bw_end(path, ret);
 
@@ -872,6 +873,7 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider)
 		return;
 
 	mutex_lock(&icc_lock);
+	mutex_lock(&icc_bw_lock);
 
 	node->provider = provider;
 	list_add_tail(&node->node_list, &provider->nodes);
@@ -900,6 +902,7 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider)
 	node->avg_bw = 0;
 	node->peak_bw = 0;
 
+	mutex_unlock(&icc_bw_lock);
 	mutex_unlock(&icc_lock);
 }
 EXPORT_SYMBOL_GPL(icc_node_add);
@@ -1025,6 +1028,7 @@ void icc_sync_state(struct device *dev)
 		return;
 
 	mutex_lock(&icc_lock);
+	mutex_lock(&icc_bw_lock);
 	synced_state = true;
 	list_for_each_entry(p, &icc_providers, provider_list) {
 		dev_dbg(p->dev, "interconnect provider is in synced state\n");
-- 
2.41.0

