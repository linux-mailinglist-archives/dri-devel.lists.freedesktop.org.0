Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCD7273A1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 02:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B908E10E579;
	Thu,  8 Jun 2023 00:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E08310E574;
 Thu,  8 Jun 2023 00:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686183550; x=1717719550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rV5doyc7X/1sumq6Mfpb9gZBcdY3AwiDKHAObdgHPwQ=;
 b=SDNWf8t2NqtKC2YHIPsrdO4fmp8EL0EXamAaSDnDB7Khpx+dzB20AkJH
 wFX2DFcXwiyre+WrZHPEFRYErSwFKlpLLJaXbHytoGSDabtSiUjvNYnjc
 GSWT/nD7Ye0Fs7ZUXVL2krcI+vV68fk3JQ/baIYTU5tkr+SzDu5FuaTbR
 RpHvn56DvV9NdM9iLh6DAFhyLhFcgm3LZ1iMpopYPj7agjbe3kf++VO/3
 beUldDDqVFCmc6gFaMwbMNc07JSnnqqnZ4zU6V6kt9MXncL+mSSry0qC2
 1Aq5AwC40MvMZo6jBLG4+RiJKomrozQe1MU/b6WnZ/X+sCrUGM+HU7Hua w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="422995186"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="422995186"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 17:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1039886767"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="1039886767"
Received: from operepel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.58.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 17:19:07 -0700
Date: Thu, 8 Jun 2023 02:19:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
Message-ID: <ZIEedejxx6DvpFgS@ashyti-mobl2.lan>
References: <20230607190350.287644-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607190350.287644-1-zhanjun.dong@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dong,

On Wed, Jun 07, 2023 at 12:03:50PM -0700, Zhanjun Dong wrote:
> This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
> Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.
> 
> WARNING: possible circular locking dependency detected
> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
> ------------------------------------------------------
> kms_pipe_crc_ba/6415 is trying to acquire lock:
> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
> 
> but task is already holding lock:
> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
> 
> which lock already depends on the new lock.
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>         lock_acquire+0xd8/0x2d0
>         i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>         intel_gt_init_reset+0x65/0x80 [i915]
>         intel_gt_common_init_early+0xe1/0x170 [i915]
>         intel_root_gt_init_early+0x48/0x60 [i915]
>         i915_driver_probe+0x671/0xcb0 [i915]
>         i915_pci_probe+0xdc/0x210 [i915]
>         pci_device_probe+0x95/0x120
>         really_probe+0x164/0x3c0
>         __driver_probe_device+0x73/0x160
>         driver_probe_device+0x19/0xa0
>         __driver_attach+0xb6/0x180
>         bus_for_each_dev+0x77/0xd0
>         bus_add_driver+0x114/0x210
>         driver_register+0x5b/0x110
>         __pfx_vgem_open+0x3/0x10 [vgem]
>         do_one_initcall+0x57/0x270
>         do_init_module+0x5f/0x220
>         load_module+0x1ca4/0x1f00
>         __do_sys_finit_module+0xb4/0x130
>         do_syscall_64+0x3c/0x90
>         entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> -> #2 (fs_reclaim){+.+.}-{0:0}:
>         lock_acquire+0xd8/0x2d0
>         fs_reclaim_acquire+0xac/0xe0
>         kmem_cache_alloc+0x32/0x260
>         i915_vma_instance+0xb2/0xc60 [i915]
>         i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>         vm_fault_gtt+0x22d/0xf60 [i915]
>         __do_fault+0x2f/0x1d0
>         do_pte_missing+0x4a/0xd20
>         __handle_mm_fault+0x5b0/0x790
>         handle_mm_fault+0xa2/0x230
>         do_user_addr_fault+0x3ea/0xa10
>         exc_page_fault+0x68/0x1a0
>         asm_exc_page_fault+0x26/0x30
> 
> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>         lock_acquire+0xd8/0x2d0
>         _intel_gt_reset_lock+0x57/0x330 [i915]
>         guc_timestamp_ping+0x35/0x130 [i915]
>         process_one_work+0x250/0x510
>         worker_thread+0x4f/0x3a0
>         kthread+0xff/0x130
>         ret_from_fork+0x29/0x50
> 
> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>         check_prev_add+0x90/0xc60
>         __lock_acquire+0x1998/0x2590
>         lock_acquire+0xd8/0x2d0
>         __flush_work+0x74/0x530
>         __cancel_work_timer+0x14f/0x1f0
>         intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>         intel_uc_reset_prepare+0x9c/0x120 [i915]
>         reset_prepare+0x21/0x60 [i915]
>         intel_gt_reset+0x1dd/0x470 [i915]
>         intel_gt_reset_global+0xfb/0x170 [i915]
>         intel_gt_handle_error+0x368/0x420 [i915]
>         intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>         i915_wedged_set+0x29/0x40 [i915]
>         simple_attr_write_xsigned.constprop.0+0xb4/0x110
>         full_proxy_write+0x52/0x80
>         vfs_write+0xc5/0x4f0
>         ksys_write+0x64/0xe0
>         do_syscall_64+0x3c/0x90
>         entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> other info that might help us debug this:
>  Chain exists of:
>   (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>   Possible unsafe locking scenario:
>         CPU0                    CPU1
>         ----                    ----
>    lock(&gt->reset.mutex);
>                                 lock(fs_reclaim);
>                                 lock(&gt->reset.mutex);
>    lock((work_completion)(&(&guc->timestamp.work)->work));
> 
>  *** DEADLOCK ***
>  3 locks held by kms_pipe_crc_ba/6415:
>   #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>   #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>   #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Andrzej's r-b is missing here.

> ---

Please add a version to your patch and a changelog.

Thanks,
Andi
