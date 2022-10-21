Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760F6072AC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625210E646;
	Fri, 21 Oct 2022 08:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA6310E646;
 Fri, 21 Oct 2022 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666341777; x=1697877777;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a4kA4Lu+tBf02z+i3pSRwPonaOVx6GjZKalE7TnyIyw=;
 b=h2mEqTZdmX60d51Sqmlj/l3Cf0OVjO8pb01s/RdKdxioHDSd7eoj7J2+
 0Rrj6F58rh65RCma2LtOkfdrPzsoBRKuXeOQdcbL62aX4XKe/NdPImh44
 dWlWr1JZBGFlBjzGePu5rFzApRXR6J3SExYJHMJzwdvraInOvX7aLhwhX
 OQQ/LpMXaBfMeigl8BMiBg7rCZQFJrvkznapdYcCeCBRBCjRj8KBFK5aY
 z3frnlQQTsDajjW+tkd+H5c83a2RB+0wZxR3jlY5x5ONpik4FvlXBBXaf
 xxApE3kiZs27rr9ueEbJu1sNfDbJtUwKWDhy8tACGF3iF6u0D90wRXto3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="290258898"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="290258898"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 01:42:56 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="805448428"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="805448428"
Received: from emoriart-mobl.ger.corp.intel.com (HELO [10.213.218.183])
 ([10.213.218.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 01:42:55 -0700
Message-ID: <d7e2578c-cbf7-4aa4-0341-8187dec83350@linux.intel.com>
Date: Fri, 21 Oct 2022 09:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/2] drm/i915/pmu: Connect engine busyness stats from GuC
 to pmu
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211027004821.66097-1-umesh.nerlige.ramappa@intel.com>
 <20211027004821.66097-2-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211027004821.66097-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, daniel.vetter@ffwll.ch,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/10/2021 01:48, Umesh Nerlige Ramappa wrote:

[snip]

> +static void guc_timestamp_ping(struct work_struct *wrk)
> +{
> +	struct intel_guc *guc = container_of(wrk, typeof(*guc),
> +					     timestamp.work.work);
> +	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	intel_wakeref_t wakeref;
> +	unsigned long flags;
> +	int srcu, ret;
> +
> +	/*
> +	 * Synchronize with gt reset to make sure the worker does not
> +	 * corrupt the engine/guc stats.
> +	 */
> +	ret = intel_gt_reset_trylock(gt, &srcu);
> +	if (ret)
> +		return;
> +
> +	spin_lock_irqsave(&guc->timestamp.lock, flags);
> +
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		__update_guc_busyness_stats(guc);

Spotted one splat today: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12268/bat-adlp-4/igt@i915_pm_rpm@basic-pci-d3-state.html

Could be that reset lock needs to be inside the rpm get. Haven't really though about it much, could you please check?

<4> [300.214744]
<4> [300.214753] ======================================================
<4> [300.214755] WARNING: possible circular locking dependency detected
<4> [300.214758] 6.1.0-rc1-CI_DRM_12268-g86e8558e3283+ #1 Not tainted
<4> [300.214761] ------------------------------------------------------
<4> [300.214762] kworker/10:1H/265 is trying to acquire lock:
<4> [300.214765] ffffffff8275e560 (fs_reclaim){+.+.}-{0:0}, at: __kmem_cache_alloc_node+0x27/0x170
<4> [300.214780]
but task is already holding lock:
<4> [300.214782] ffffc900013e7e78 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: process_one_work+0x1eb/0x5b0
<4> [300.214793]
which lock already depends on the new lock.
<4> [300.214794]
the existing dependency chain (in reverse order) is:
<4> [300.214796]
-> #2 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
<4> [300.214801]        lock_acquire+0xd3/0x310
<4> [300.214806]        __flush_work+0x77/0x4e0
<4> [300.214811]        __cancel_work_timer+0x14e/0x1f0
<4> [300.214815]        intel_guc_submission_reset_prepare+0x7a/0x420 [i915]
<4> [300.215119]        intel_uc_reset_prepare+0x44/0x50 [i915]
<4> [300.215360]        reset_prepare+0x21/0x80 [i915]
<4> [300.215561]        intel_gt_reset+0x143/0x340 [i915]
<4> [300.215757]        intel_gt_reset_global+0xeb/0x160 [i915]
<4> [300.215946]        intel_gt_handle_error+0x2c2/0x410 [i915]
<4> [300.216137]        intel_gt_debugfs_reset_store+0x59/0xc0 [i915]
<4> [300.216333]        i915_wedged_set+0xc/0x20 [i915]
<4> [300.216513]        simple_attr_write+0xda/0x100
<4> [300.216520]        full_proxy_write+0x4e/0x80
<4> [300.216525]        vfs_write+0xe3/0x4e0
<4> [300.216531]        ksys_write+0x57/0xd0
<4> [300.216535]        do_syscall_64+0x37/0x90
<4> [300.216542]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
<4> [300.216549]
-> #1 (&gt->reset.mutex){+.+.}-{3:3}:
<4> [300.216556]        lock_acquire+0xd3/0x310
<4> [300.216559]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]
<4> [300.216799]        intel_gt_init_reset+0x61/0x80 [i915]
<4> [300.217018]        intel_gt_common_init_early+0x10c/0x190 [i915]
<4> [300.217227]        intel_root_gt_init_early+0x44/0x60 [i915]
<4> [300.217434]        i915_driver_probe+0x9ab/0xf30 [i915]
<4> [300.217615]        i915_pci_probe+0xa5/0x240 [i915]
<4> [300.217796]        pci_device_probe+0x95/0x110
<4> [300.217803]        really_probe+0xd6/0x350
<4> [300.217811]        __driver_probe_device+0x73/0x170
<4> [300.217816]        driver_probe_device+0x1a/0x90
<4> [300.217821]        __driver_attach+0xbc/0x190
<4> [300.217826]        bus_for_each_dev+0x72/0xc0
<4> [300.217831]        bus_add_driver+0x1bb/0x210
<4> [300.217835]        driver_register+0x66/0xc0
<4> [300.217841]        0xffffffffa093001f
<4> [300.217844]        do_one_initcall+0x53/0x2f0
<4> [300.217849]        do_init_module+0x45/0x1c0
<4> [300.217855]        load_module+0x1d5e/0x1e90
<4> [300.217859]        __do_sys_finit_module+0xaf/0x120
<4> [300.217864]        do_syscall_64+0x37/0x90
<4> [300.217869]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
<4> [300.217875]
-> #0 (fs_reclaim){+.+.}-{0:0}:
<4> [300.217880]        validate_chain+0xb3d/0x2000
<4> [300.217884]        __lock_acquire+0x5a4/0xb70
<4> [300.217888]        lock_acquire+0xd3/0x310
<4> [300.217891]        fs_reclaim_acquire+0xa1/0xd0
<4> [300.217896]        __kmem_cache_alloc_node+0x27/0x170
<4> [300.217899]        __kmalloc+0x43/0x1a0
<4> [300.217903]        acpi_ns_internalize_name+0x44/0x9f
<4> [300.217909]        acpi_ns_get_node_unlocked+0x6b/0xd7
<4> [300.217914]        acpi_ns_get_node+0x3b/0x54
<4> [300.217918]        acpi_get_handle+0x89/0xb7
<4> [300.217922]        acpi_has_method+0x1c/0x40
<4> [300.217928]        acpi_pci_set_power_state+0x42/0xf0
<4> [300.217935]        pci_power_up+0x20/0x1a0
<4> [300.217940]        pci_pm_default_resume_early+0x9/0x30
<4> [300.217945]        pci_pm_runtime_resume+0x29/0x90
<4> [300.217948]        __rpm_callback+0x3d/0x110
<4> [300.217954]        rpm_callback+0x58/0x60
<4> [300.217959]        rpm_resume+0x548/0x760
<4> [300.217963]        __pm_runtime_resume+0x42/0x80
<4> [300.217968]        __intel_runtime_pm_get+0x19/0x80 [i915]
<4> [300.218170]        guc_timestamp_ping+0x63/0xc0 [i915]
<4> [300.218467]        process_one_work+0x272/0x5b0
<4> [300.218472]        worker_thread+0x37/0x370
<4> [300.218477]        kthread+0xed/0x120
<4> [300.218481]        ret_from_fork+0x1f/0x30
<4> [300.218485]
other info that might help us debug this:
<4> [300.218487] Chain exists of:
   fs_reclaim --> &gt->reset.mutex --> (work_completion)(&(&guc->timestamp.work)->work)
<4> [300.218495]  Possible unsafe locking scenario:
<4> [300.218497]        CPU0                    CPU1
<4> [300.218499]        ----                    ----
<4> [300.218501]   lock((work_completion)(&(&guc->timestamp.work)->work));
<4> [300.218505]                                lock(&gt->reset.mutex);
<4> [300.218509]                                lock((work_completion)(&(&guc->timestamp.work)->work));
<4> [300.218512]   lock(fs_reclaim);
<4> [300.218515]
  *** DEADLOCK ***

Regards,

Tvrtko
