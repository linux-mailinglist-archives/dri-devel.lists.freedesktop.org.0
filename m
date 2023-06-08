Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9172826A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D08710E5CD;
	Thu,  8 Jun 2023 14:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4B110E196;
 Thu,  8 Jun 2023 14:12:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FB1E60B01;
 Thu,  8 Jun 2023 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA3BC433EF;
 Thu,  8 Jun 2023 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686233567;
 bh=jiC9XwKLIhJp7L/2mf5VkOAerj+XVF2GwszxyJwIce0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PdlUNyu6BxgXKeXfUv8gyn2gfLBxInzqG8EY8Erdk53eOUwKsqy8yNDYtag6g1hJo
 UJXUGEGQXr3cH/f6i9MGEM9afRbriAzkd087t3uOCPo0xooekeecvJipUE3F5momEw
 WK4xfcgCRx8IwHaLnk/b/HWaRJlNGvW+NCG8w9/0pAsIUXbZw/+SyQL9AOAHnWykBQ
 cTZsOv8jZZ9iIgECZI2ELlRc9MHvdr1jrLoZ6vgchYgAeSXcy22UKW8n4akgt4TNoJ
 7ezE6Ob3fKQSDESqhBzY/xzA4iZKxg2vHiDEK2sPHSYLO57rL1l2ViDPpWRgi/G4fq
 oYTBCdymVpDgQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q7GNz-0001re-U7; Thu, 08 Jun 2023 16:13:12 +0200
Date: Thu, 8 Jun 2023 16:13:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Adreno devfreq lockdep splat with 6.3-rc2
Message-ID: <ZIHh95IeOPBTvB00@hovoldconsulting.com>
References: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Have you had a chance to look at this regression yet? It prevents us
from using lockdep on the X13s as it is disabled as soon as we start
the GPU.

On Wed, Mar 15, 2023 at 10:19:21AM +0100, Johan Hovold wrote:
> 
> Since 6.3-rc2 (or possibly -rc1), I'm now seeing the below
> devfreq-related lockdep splat.
> 
> I noticed that you posted a fix for something similar here:
> 
> 	https://lore.kernel.org/r/20230312204150.1353517-9-robdclark@gmail.com
> 
> but that particular patch makes no difference.
> 
> From skimming the calltraces below and qos/devfreq related changes in
> 6.3-rc1 it seems like this could be related to:
> 
> 	fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for idle clamp")

Below is an updated splat from 6.4-rc5.

Johan

[ 2941.931507] ======================================================
[ 2941.931509] WARNING: possible circular locking dependency detected
[ 2941.931513] 6.4.0-rc5 #64 Not tainted
[ 2941.931516] ------------------------------------------------------
[ 2941.931518] ring0/359 is trying to acquire lock:
[ 2941.931520] ffff63310e35c078 (&devfreq->lock){+.+.}-{3:3}, at: qos_min_notifier_call+0x28/0x88
[ 2941.931541] 
               but task is already holding lock:
[ 2941.931543] ffff63310e3cace8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x30/0x70
[ 2941.931553] 
               which lock already depends on the new lock.

[ 2941.931555] 
               the existing dependency chain (in reverse order) is:
[ 2941.931556] 
               -> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
[ 2941.931562]        down_write+0x50/0x198
[ 2941.931567]        blocking_notifier_chain_register+0x30/0x8c
[ 2941.931570]        freq_qos_add_notifier+0x68/0x7c
[ 2941.931574]        dev_pm_qos_add_notifier+0xa0/0xf8
[ 2941.931579]        devfreq_add_device.part.0+0x360/0x5a4
[ 2941.931583]        devm_devfreq_add_device+0x74/0xe0
[ 2941.931587]        msm_devfreq_init+0xa0/0x154 [msm]
[ 2941.931624]        msm_gpu_init+0x2fc/0x588 [msm]
[ 2941.931649]        adreno_gpu_init+0x160/0x2d0 [msm]
[ 2941.931675]        a6xx_gpu_init+0x2c0/0x74c [msm]
[ 2941.931699]        adreno_bind+0x180/0x290 [msm]
[ 2941.931723]        component_bind_all+0x124/0x288
[ 2941.931728]        msm_drm_bind+0x1d8/0x6cc [msm]
[ 2941.931752]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
[ 2941.931755]        __component_add+0xa8/0x194
[ 2941.931758]        component_add+0x14/0x20
[ 2941.931761]        dp_display_probe+0x2b4/0x474 [msm]
[ 2941.931785]        platform_probe+0x68/0xd8
[ 2941.931789]        really_probe+0x184/0x3c8
[ 2941.931792]        __driver_probe_device+0x7c/0x16c
[ 2941.931794]        driver_probe_device+0x3c/0x110
[ 2941.931797]        __device_attach_driver+0xbc/0x158
[ 2941.931800]        bus_for_each_drv+0x84/0xe0
[ 2941.931802]        __device_attach+0xa8/0x1d4
[ 2941.931805]        device_initial_probe+0x14/0x20
[ 2941.931807]        bus_probe_device+0xb0/0xb4
[ 2941.931810]        deferred_probe_work_func+0xa0/0xf4
[ 2941.931812]        process_one_work+0x288/0x5bc
[ 2941.931816]        worker_thread+0x74/0x450
[ 2941.931818]        kthread+0x124/0x128
[ 2941.931822]        ret_from_fork+0x10/0x20
[ 2941.931826] 
               -> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
[ 2941.931831]        __mutex_lock+0xa0/0x840
[ 2941.931833]        mutex_lock_nested+0x24/0x30
[ 2941.931836]        dev_pm_qos_remove_notifier+0x34/0x140
[ 2941.931838]        genpd_remove_device+0x3c/0x174
[ 2941.931841]        genpd_dev_pm_detach+0x78/0x1b4
[ 2941.931844]        dev_pm_domain_detach+0x24/0x34
[ 2941.931846]        a6xx_gmu_remove+0x34/0xc4 [msm]
[ 2941.931869]        a6xx_destroy+0xd0/0x160 [msm]
[ 2941.931892]        adreno_unbind+0x40/0x64 [msm]
[ 2941.931916]        component_unbind+0x38/0x6c
[ 2941.931919]        component_unbind_all+0xc8/0xd4
[ 2941.931921]        msm_drm_uninit.isra.0+0x150/0x1c4 [msm]
[ 2941.931945]        msm_drm_bind+0x310/0x6cc [msm]
[ 2941.931967]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
[ 2941.931970]        __component_add+0xa8/0x194
[ 2941.931973]        component_add+0x14/0x20
[ 2941.931976]        dp_display_probe+0x2b4/0x474 [msm]
[ 2941.932000]        platform_probe+0x68/0xd8
[ 2941.932003]        really_probe+0x184/0x3c8
[ 2941.932005]        __driver_probe_device+0x7c/0x16c
[ 2941.932008]        driver_probe_device+0x3c/0x110
[ 2941.932011]        __device_attach_driver+0xbc/0x158
[ 2941.932014]        bus_for_each_drv+0x84/0xe0
[ 2941.932016]        __device_attach+0xa8/0x1d4
[ 2941.932018]        device_initial_probe+0x14/0x20
[ 2941.932021]        bus_probe_device+0xb0/0xb4
[ 2941.932023]        deferred_probe_work_func+0xa0/0xf4
[ 2941.932026]        process_one_work+0x288/0x5bc
[ 2941.932028]        worker_thread+0x74/0x450
[ 2941.932031]        kthread+0x124/0x128
[ 2941.932035]        ret_from_fork+0x10/0x20
[ 2941.932037] 
               -> #2 (&gmu->lock){+.+.}-{3:3}:
[ 2941.932043]        __mutex_lock+0xa0/0x840
[ 2941.932045]        mutex_lock_nested+0x24/0x30
[ 2941.932047]        a6xx_gpu_set_freq+0x30/0x5c [msm]
[ 2941.932071]        msm_devfreq_target+0xb8/0x1a8 [msm]
[ 2941.932094]        devfreq_set_target+0x84/0x27c
[ 2941.932098]        devfreq_update_target+0xc4/0xec
[ 2941.932102]        devfreq_monitor+0x38/0x170
[ 2941.932105]        process_one_work+0x288/0x5bc
[ 2941.932108]        worker_thread+0x74/0x450
[ 2941.932110]        kthread+0x124/0x128
[ 2941.932113]        ret_from_fork+0x10/0x20
[ 2941.932116] 
               -> #1 (&df->lock){+.+.}-{3:3}:
[ 2941.932121]        __mutex_lock+0xa0/0x840
[ 2941.932124]        mutex_lock_nested+0x24/0x30
[ 2941.932126]        msm_devfreq_get_dev_status+0x48/0x134 [msm]
[ 2941.932149]        devfreq_simple_ondemand_func+0x3c/0x144
[ 2941.932153]        devfreq_update_target+0x4c/0xec
[ 2941.932157]        devfreq_monitor+0x38/0x170
[ 2941.932160]        process_one_work+0x288/0x5bc
[ 2941.932162]        worker_thread+0x74/0x450
[ 2941.932165]        kthread+0x124/0x128
[ 2941.932168]        ret_from_fork+0x10/0x20
[ 2941.932171] 
               -> #0 (&devfreq->lock){+.+.}-{3:3}:
[ 2941.932175]        __lock_acquire+0x13d8/0x2188
[ 2941.932178]        lock_acquire+0x1e8/0x310
[ 2941.932180]        __mutex_lock+0xa0/0x840
[ 2941.932182]        mutex_lock_nested+0x24/0x30
[ 2941.932184]        qos_min_notifier_call+0x28/0x88
[ 2941.932188]        notifier_call_chain+0xa0/0x17c
[ 2941.932190]        blocking_notifier_call_chain+0x48/0x70
[ 2941.932193]        pm_qos_update_target+0xdc/0x1d0
[ 2941.932195]        freq_qos_apply+0x68/0x74
[ 2941.932198]        apply_constraint+0x100/0x148
[ 2941.932201]        __dev_pm_qos_update_request+0xb8/0x1fc
[ 2941.932203]        dev_pm_qos_update_request+0x3c/0x64
[ 2941.932206]        msm_devfreq_active+0xf8/0x194 [msm]
[ 2941.932227]        msm_gpu_submit+0x18c/0x1a8 [msm]
[ 2941.932249]        msm_job_run+0x98/0x11c [msm]
[ 2941.932272]        drm_sched_main+0x1a0/0x444 [gpu_sched]
[ 2941.932281]        kthread+0x124/0x128
[ 2941.932284]        ret_from_fork+0x10/0x20
[ 2941.932287] 
               other info that might help us debug this:

[ 2941.932289] Chain exists of:
                 &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->rwsem

[ 2941.932296]  Possible unsafe locking scenario:

[ 2941.932298]        CPU0                    CPU1
[ 2941.932300]        ----                    ----
[ 2941.932301]   rlock(&(c->notifiers)->rwsem);
[ 2941.932304]                                lock(dev_pm_qos_mtx);
[ 2941.932307]                                lock(&(c->notifiers)->rwsem);
[ 2941.932309]   lock(&devfreq->lock);
[ 2941.932312] 
                *** DEADLOCK ***

[ 2941.932313] 4 locks held by ring0/359:
[ 2941.932315]  #0: ffff633110966170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x8c/0x11c [msm]
[ 2941.932342]  #1: ffff633110966208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit+0xdc/0x1a8 [msm]
[ 2941.932368]  #2: ffffa40da2f91ed0 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update_request+0x30/0x64
[ 2941.932374]  #3: ffff63310e3cace8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x30/0x70
[ 2941.932381] 
               stack backtrace:
[ 2941.932383] CPU: 7 PID: 359 Comm: ring0 Not tainted 6.4.0-rc5 #64
[ 2941.932386] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET53W (1.25 ) 10/12/2022
[ 2941.932389] Call trace:
[ 2941.932391]  dump_backtrace+0x9c/0x11c
[ 2941.932395]  show_stack+0x18/0x24
[ 2941.932398]  dump_stack_lvl+0x60/0xac
[ 2941.932402]  dump_stack+0x18/0x24
[ 2941.932405]  print_circular_bug+0x26c/0x348
[ 2941.932407]  check_noncircular+0x134/0x148
[ 2941.932409]  __lock_acquire+0x13d8/0x2188
[ 2941.932411]  lock_acquire+0x1e8/0x310
[ 2941.932414]  __mutex_lock+0xa0/0x840
[ 2941.932416]  mutex_lock_nested+0x24/0x30
[ 2941.932418]  qos_min_notifier_call+0x28/0x88
[ 2941.932421]  notifier_call_chain+0xa0/0x17c
[ 2941.932424]  blocking_notifier_call_chain+0x48/0x70
[ 2941.932426]  pm_qos_update_target+0xdc/0x1d0
[ 2941.932428]  freq_qos_apply+0x68/0x74
[ 2941.932431]  apply_constraint+0x100/0x148
[ 2941.932433]  __dev_pm_qos_update_request+0xb8/0x1fc
[ 2941.932435]  dev_pm_qos_update_request+0x3c/0x64
[ 2941.932437]  msm_devfreq_active+0xf8/0x194 [msm]
[ 2941.932460]  msm_gpu_submit+0x18c/0x1a8 [msm]
[ 2941.932482]  msm_job_run+0x98/0x11c [msm]
[ 2941.932504]  drm_sched_main+0x1a0/0x444 [gpu_sched]
[ 2941.932511]  kthread+0x124/0x128
[ 2941.932514]  ret_from_fork+0x10/0x20
