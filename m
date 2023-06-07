Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB89D7261CF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B0810E4E4;
	Wed,  7 Jun 2023 13:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CA410E4E4;
 Wed,  7 Jun 2023 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686146268; x=1717682268;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DNe5fS5WuKfbKBZJ1ksfduMTgwuqBmlrRmIBZCdeE0Q=;
 b=Z9mjO0KH0deQnM3tVSarhOBJPWkI69mvQ1110rAoQNzczEljwyPpfpGd
 00kLUStp+s9EmJqUVGl3ZNfcAiUqBcREoB9Egm4TQbF8MfcUkwmi628A6
 jMp+TlqGgPeU50zpn10dciLZNEVF0yiQ25r39i4XqJ+OW3Xs1M16hPWjA
 bTRDo1Zrw8D+169G39N8b4r+JD4TnJZ/JMbE/BLKlAl1xYxBgAXiGSlIi
 RElknhVtCsdgONfOpODNv24EGd65NInvNOdQmxatQT5NyJBSnYXbkNyYh
 KDdqmclmZZhkij2LAg6NNtCGjp6UAdyYYK3hMZiHqIriI0HWvGpWF/Iqv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336619590"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="336619590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 06:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739277084"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="739277084"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.20.254])
 ([10.213.20.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 06:57:45 -0700
Message-ID: <3ea4aefb-3ea5-e565-1b58-455d564264f0@intel.com>
Date: Wed, 7 Jun 2023 15:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
Content-Language: en-US
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230606030037.196558-1-zhanjun.dong@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230606030037.196558-1-zhanjun.dong@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.06.2023 05:00, Zhanjun Dong wrote:
> This attemps to avoid circular locing dependency between flush delayed work and intel_gt_reset.
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
>          lock_acquire+0xd8/0x2d0
>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>          intel_gt_init_reset+0x65/0x80 [i915]
>          intel_gt_common_init_early+0xe1/0x170 [i915]
>          intel_root_gt_init_early+0x48/0x60 [i915]
>          i915_driver_probe+0x671/0xcb0 [i915]
>          i915_pci_probe+0xdc/0x210 [i915]
>          pci_device_probe+0x95/0x120
>          really_probe+0x164/0x3c0
>          __driver_probe_device+0x73/0x160
>          driver_probe_device+0x19/0xa0
>          __driver_attach+0xb6/0x180
>          bus_for_each_dev+0x77/0xd0
>          bus_add_driver+0x114/0x210
>          driver_register+0x5b/0x110
>          __pfx_vgem_open+0x3/0x10 [vgem]
>          do_one_initcall+0x57/0x270
>          do_init_module+0x5f/0x220
>          load_module+0x1ca4/0x1f00
>          __do_sys_finit_module+0xb4/0x130
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> -> #2 (fs_reclaim){+.+.}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          fs_reclaim_acquire+0xac/0xe0
>          kmem_cache_alloc+0x32/0x260
>          i915_vma_instance+0xb2/0xc60 [i915]
>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>          vm_fault_gtt+0x22d/0xf60 [i915]
>          __do_fault+0x2f/0x1d0
>          do_pte_missing+0x4a/0xd20
>          __handle_mm_fault+0x5b0/0x790
>          handle_mm_fault+0xa2/0x230
>          do_user_addr_fault+0x3ea/0xa10
>          exc_page_fault+0x68/0x1a0
>          asm_exc_page_fault+0x26/0x30
> 
> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          _intel_gt_reset_lock+0x57/0x330 [i915]
>          guc_timestamp_ping+0x35/0x130 [i915]
>          process_one_work+0x250/0x510
>          worker_thread+0x4f/0x3a0
>          kthread+0xff/0x130
>          ret_from_fork+0x29/0x50
> 
> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>          check_prev_add+0x90/0xc60
>          __lock_acquire+0x1998/0x2590
>          lock_acquire+0xd8/0x2d0
>          __flush_work+0x74/0x530
>          __cancel_work_timer+0x14f/0x1f0
>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>          reset_prepare+0x21/0x60 [i915]
>          intel_gt_reset+0x1dd/0x470 [i915]
>          intel_gt_reset_global+0xfb/0x170 [i915]
>          intel_gt_handle_error+0x368/0x420 [i915]
>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>          i915_wedged_set+0x29/0x40 [i915]
>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>          full_proxy_write+0x52/0x80
>          vfs_write+0xc5/0x4f0
>          ksys_write+0x64/0xe0
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> other info that might help us debug this:
>   Chain exists of:
>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>    Possible unsafe locking scenario:
>          CPU0                    CPU1
>          ----                    ----
>     lock(&gt->reset.mutex);
>                                  lock(fs_reclaim);
>                                  lock(&gt->reset.mutex);
>     lock((work_completion)(&(&guc->timestamp.work)->work));
> 
>   *** DEADLOCK ***
>   3 locks held by kms_pipe_crc_ba/6415:
>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

This unlocks multiple machines on CI, thx.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..22390704542e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1359,7 +1359,7 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>   
>   static void guc_cancel_busyness_worker(struct intel_guc *guc)
>   {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	cancel_delayed_work(&guc->timestamp.work);
>   }
>   
>   static void __reset_guc_busyness_stats(struct intel_guc *guc)

