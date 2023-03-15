Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B16BABEF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B4910E9C5;
	Wed, 15 Mar 2023 09:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A31810E98B;
 Wed, 15 Mar 2023 09:18:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59CD5B81D17;
 Wed, 15 Mar 2023 09:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017D3C433EF;
 Wed, 15 Mar 2023 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678871895;
 bh=+19G3QxqEoOf1ES1QUxNpw3hDUNgR7ZP5PGazby/haA=;
 h=Date:From:To:Cc:Subject:From;
 b=PtNxJduEQLGBkb2SGhYOtpDbPezhKAIZKK4AgMp8ykTeXjUpMkRlyUjZQBLnxayr0
 nluyKdlCfiXd8nfjGZbjdssE05b6Sg2ZKmZ2pFfgsu2M6BizHWdZX5of6QycPXoMjY
 BUKDkj20YGWVlidC1v08sBwN/Qzu8B21E8UREv3Ix1Lkv6D5b/s8zIcEp2THqSC32C
 +H8WPhnmT3T5SB15+2/uqg21B4RSHaeCGUDCic3L/xtXdTJqCV3/qxyibE1it1Mq4a
 5AnIU6wTlDsi9kJoIGjiGQDr2EkyHyIn23Je0xstHrJiIolA1ZDjw9tQ2MufEEIsaM
 F0TKO/PzhHkzg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pcNI1-0006nT-6N; Wed, 15 Mar 2023 10:19:21 +0100
Date: Wed, 15 Mar 2023 10:19:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Adreno devfreq lockdep splat with 6.3-rc2
Message-ID: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Since 6.3-rc2 (or possibly -rc1), I'm now seeing the below
devfreq-related lockdep splat.

I noticed that you posted a fix for something similar here:

	https://lore.kernel.org/r/20230312204150.1353517-9-robdclark@gmail.com

but that particular patch makes no difference.

From skimming the calltraces below and qos/devfreq related changes in
6.3-rc1 it seems like this could be related to:

	fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for idle clamp")

Johan


[   35.389822] ======================================================
[   35.389824] WARNING: possible circular locking dependency detected
[   35.389826] 6.3.0-rc2 #208 Not tainted
[   35.389828] ------------------------------------------------------
[   35.389829] ring0/348 is trying to acquire lock:
[   35.389830] ffff43424cfa2078 (&devfreq->lock){+.+.}-{3:3}, at: qos_min_notifier_call+0x28/0x88
[   35.389845] 
               but task is already holding lock:
[   35.389846] ffff4342432b78e8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0xa0
[   35.389855] 
               which lock already depends on the new lock.

[   35.389856] 
               the existing dependency chain (in reverse order) is:
[   35.389857] 
               -> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
[   35.389861]        lock_acquire+0x68/0x84
[   35.389865]        down_write+0x58/0xfc
[   35.389869]        blocking_notifier_chain_register+0x30/0x8c
[   35.389872]        freq_qos_add_notifier+0x68/0x7c
[   35.389876]        dev_pm_qos_add_notifier+0xe8/0x114
[   35.389881]        devfreq_add_device.part.0+0x360/0x5a4
[   35.389884]        devm_devfreq_add_device+0x74/0xe0
[   35.389886]        msm_devfreq_init+0xa0/0x154 [msm]
[   35.389915]        msm_gpu_init+0x320/0x5b0 [msm]
[   35.389933]        adreno_gpu_init+0x164/0x2d8 [msm]
[   35.389951]        a6xx_gpu_init+0x270/0x608 [msm]
[   35.389968]        adreno_bind+0x184/0x284 [msm]
[   35.389983]        component_bind_all+0x124/0x288
[   35.389989]        msm_drm_bind+0x1d8/0x6a8 [msm]
[   35.390004]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
[   35.390007]        __component_add+0xa8/0x194
[   35.390010]        component_add+0x14/0x20
[   35.390012]        dp_display_probe+0x2b4/0x474 [msm]
[   35.390029]        platform_probe+0x68/0xd8
[   35.390031]        really_probe+0x184/0x3c8
[   35.390034]        __driver_probe_device+0x7c/0x188
[   35.390036]        driver_probe_device+0x3c/0x110
[   35.390039]        __device_attach_driver+0xbc/0x158
[   35.390041]        bus_for_each_drv+0x84/0xe0
[   35.390044]        __device_attach+0xa8/0x1d4
[   35.390046]        device_initial_probe+0x14/0x20
[   35.390049]        bus_probe_device+0xac/0xb0
[   35.390051]        deferred_probe_work_func+0xa0/0xf4
[   35.390053]        process_one_work+0x288/0x6c4
[   35.390056]        worker_thread+0x74/0x450
[   35.390058]        kthread+0x118/0x11c
[   35.390060]        ret_from_fork+0x10/0x20
[   35.390063] 
               -> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
[   35.390066]        lock_acquire+0x68/0x84
[   35.390068]        __mutex_lock+0x98/0x428
[   35.390072]        mutex_lock_nested+0x2c/0x38
[   35.390074]        dev_pm_qos_remove_notifier+0x34/0x140
[   35.390077]        genpd_remove_device+0x3c/0x174
[   35.390081]        genpd_dev_pm_detach+0x78/0x1b4
[   35.390083]        dev_pm_domain_detach+0x24/0x34
[   35.390085]        a6xx_gmu_remove+0x64/0xd0 [msm]
[   35.390101]        a6xx_destroy+0xa8/0x138 [msm]
[   35.390116]        adreno_unbind+0x40/0x64 [msm]
[   35.390131]        component_unbind+0x38/0x6c
[   35.390134]        component_unbind_all+0xc8/0xd4
[   35.390136]        msm_drm_uninit.isra.0+0x168/0x1dc [msm]
[   35.390152]        msm_drm_bind+0x2f4/0x6a8 [msm]
[   35.390167]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
[   35.390170]        __component_add+0xa8/0x194
[   35.390172]        component_add+0x14/0x20
[   35.390175]        dp_display_probe+0x2b4/0x474 [msm]
[   35.390190]        platform_probe+0x68/0xd8
[   35.390192]        really_probe+0x184/0x3c8
[   35.390194]        __driver_probe_device+0x7c/0x188
[   35.390197]        driver_probe_device+0x3c/0x110
[   35.390199]        __device_attach_driver+0xbc/0x158
[   35.390201]        bus_for_each_drv+0x84/0xe0
[   35.390203]        __device_attach+0xa8/0x1d4
[   35.390206]        device_initial_probe+0x14/0x20
[   35.390208]        bus_probe_device+0xac/0xb0
[   35.390210]        deferred_probe_work_func+0xa0/0xf4
[   35.390212]        process_one_work+0x288/0x6c4
[   35.390214]        worker_thread+0x74/0x450
[   35.390216]        kthread+0x118/0x11c
[   35.390217]        ret_from_fork+0x10/0x20
[   35.390219] 
               -> #2 (&gmu->lock){+.+.}-{3:3}:
[   35.390222]        lock_acquire+0x68/0x84
[   35.390224]        __mutex_lock+0x98/0x428
[   35.390226]        mutex_lock_nested+0x2c/0x38
[   35.390229]        a6xx_gpu_set_freq+0x30/0x5c [msm]
[   35.390245]        msm_devfreq_target+0xb4/0x218 [msm]
[   35.390260]        devfreq_set_target+0x84/0x2f4
[   35.390262]        devfreq_update_target+0xc4/0xec
[   35.390263]        devfreq_monitor+0x38/0x1f0
[   35.390265]        process_one_work+0x288/0x6c4
[   35.390267]        worker_thread+0x74/0x450
[   35.390269]        kthread+0x118/0x11c
[   35.390270]        ret_from_fork+0x10/0x20
[   35.390272] 
               -> #1 (&df->lock){+.+.}-{3:3}:
[   35.390275]        lock_acquire+0x68/0x84
[   35.390276]        __mutex_lock+0x98/0x428
[   35.390279]        mutex_lock_nested+0x2c/0x38
[   35.390281]        msm_devfreq_get_dev_status+0x48/0x134 [msm]
[   35.390296]        devfreq_simple_ondemand_func+0x3c/0x144
[   35.390298]        devfreq_update_target+0x4c/0xec
[   35.390300]        devfreq_monitor+0x38/0x1f0
[   35.390302]        process_one_work+0x288/0x6c4
[   35.390304]        worker_thread+0x74/0x450
[   35.390305]        kthread+0x118/0x11c
[   35.390307]        ret_from_fork+0x10/0x20
[   35.390308] 
               -> #0 (&devfreq->lock){+.+.}-{3:3}:
[   35.390311]        __lock_acquire+0x1394/0x21fc
[   35.390313]        lock_acquire.part.0+0xc4/0x1fc
[   35.390314]        lock_acquire+0x68/0x84
[   35.390316]        __mutex_lock+0x98/0x428
[   35.390319]        mutex_lock_nested+0x2c/0x38
[   35.390321]        qos_min_notifier_call+0x28/0x88
[   35.390323]        blocking_notifier_call_chain+0x6c/0xa0
[   35.390325]        pm_qos_update_target+0xdc/0x24c
[   35.390327]        freq_qos_apply+0x68/0x74
[   35.390329]        apply_constraint+0x100/0x148
[   35.390331]        __dev_pm_qos_update_request+0xb8/0x278
[   35.390333]        dev_pm_qos_update_request+0x3c/0x64
[   35.390335]        msm_devfreq_active+0xf8/0x194 [msm]
[   35.390350]        msm_gpu_submit+0x18c/0x1a8 [msm]
[   35.390365]        msm_job_run+0xbc/0x140 [msm]
[   35.390380]        drm_sched_main+0x1a0/0x528 [gpu_sched]
[   35.390387]        kthread+0x118/0x11c
[   35.390388]        ret_from_fork+0x10/0x20
[   35.390390] 
               other info that might help us debug this:

[   35.390391] Chain exists of:
                 &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->rwsem

[   35.390395]  Possible unsafe locking scenario:

[   35.390396]        CPU0                    CPU1
[   35.390397]        ----                    ----
[   35.390397]   lock(&(c->notifiers)->rwsem);
[   35.390399]                                lock(dev_pm_qos_mtx);
[   35.390401]                                lock(&(c->notifiers)->rwsem);
[   35.390403]   lock(&devfreq->lock);
[   35.390405] 
                *** DEADLOCK ***

[   35.390406] 4 locks held by ring0/348:
[   35.390407]  #0: ffff43424cfa1170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0xb0/0x140 [msm]
[   35.390426]  #1: ffff43424cfa1208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_submit+0xdc/0x1a8 [msm]
[   35.390443]  #2: ffffdbf2a5472718 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_update_request+0x30/0x64
[   35.390448]  #3: ffff4342432b78e8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_notifier_call_chain+0x34/0xa0
[   35.390452] 
               stack backtrace:
[   35.390454] CPU: 4 PID: 348 Comm: ring0 Not tainted 6.3.0-rc2 #208
[   35.390456] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET32D (1.04 ) 03/16/2020
[   35.390458] Call trace:
[   35.390460]  dump_backtrace+0xa4/0x128
[   35.390463]  show_stack+0x18/0x24
[   35.390465]  dump_stack_lvl+0x60/0xac
[   35.390469]  dump_stack+0x18/0x24
[   35.390470]  print_circular_bug+0x24c/0x2f8
[   35.390472]  check_noncircular+0x134/0x148
[   35.390473]  __lock_acquire+0x1394/0x21fc
[   35.390475]  lock_acquire.part.0+0xc4/0x1fc
[   35.390477]  lock_acquire+0x68/0x84
[   35.390478]  __mutex_lock+0x98/0x428
[   35.390481]  mutex_lock_nested+0x2c/0x38
[   35.390483]  qos_min_notifier_call+0x28/0x88
[   35.390485]  blocking_notifier_call_chain+0x6c/0xa0
[   35.390487]  pm_qos_update_target+0xdc/0x24c
[   35.390489]  freq_qos_apply+0x68/0x74
[   35.390491]  apply_constraint+0x100/0x148
[   35.390493]  __dev_pm_qos_update_request+0xb8/0x278
[   35.390495]  dev_pm_qos_update_request+0x3c/0x64
[   35.390497]  msm_devfreq_active+0xf8/0x194 [msm]
[   35.390512]  msm_gpu_submit+0x18c/0x1a8 [msm]
[   35.390527]  msm_job_run+0xbc/0x140 [msm]
[   35.390542]  drm_sched_main+0x1a0/0x528 [gpu_sched]
[   35.390547]  kthread+0x118/0x11c
[   35.390548]  ret_from_fork+0x10/0x20
