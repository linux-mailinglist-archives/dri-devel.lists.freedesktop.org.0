Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D745935A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 17:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08FA89B0C;
	Mon, 22 Nov 2021 16:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AF789B05;
 Mon, 22 Nov 2021 16:47:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="258661455"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="258661455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:47:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="509028553"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 08:47:04 -0800
Date: Mon, 22 Nov 2021 22:20:12 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 2/4] drm/i915: Use __GFP_KSWAPD_RECLAIM in
 the capture code
Message-ID: <20211122165012.GB13257@intel.com>
References: <20211108174547.979714-1-thomas.hellstrom@linux.intel.com>
 <20211108174547.979714-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108174547.979714-3-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-08 at 18:45:45 +0100, Thomas Hellström wrote:
> The capture code is typically run entirely in the fence signalling
> critical path. We're about to add lockdep annotation in an upcoming patch
> which reveals a lockdep splat similar to the below one.
> 
> Fix the associated potential deadlocks using __GFP_KSWAPD_RECLAIM
> (which is the same as GFP_WAIT, but open-coded for clarity) rather than
> GFP_KERNEL for memory allocation in the capture path. This has the
> potential drawback that capture might fail in situations with memory
> pressure.
> 
> [  234.842048] WARNING: possible circular locking dependency detected
> [  234.842050] 5.15.0-rc7+ #20 Tainted: G     U  W
> [  234.842052] ------------------------------------------------------
> [  234.842054] gem_exec_captur/1180 is trying to acquire lock:
> [  234.842056] ffffffffa3e51c00 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc+0x4d/0x330
> [  234.842063]
>                but task is already holding lock:
> [  234.842064] ffffffffa3f57620 (dma_fence_map){++++}-{0:0}, at: i915_vma_snapshot_resource_pin+0x27/0x30 [i915]
> [  234.842138]
>                which lock already depends on the new lock.
> 
> [  234.842140]
>                the existing dependency chain (in reverse order) is:
> [  234.842142]
>                -> #2 (dma_fence_map){++++}-{0:0}:
> [  234.842145]        __dma_fence_might_wait+0x41/0xa0
> [  234.842149]        dma_resv_lockdep+0x1dc/0x28f
> [  234.842151]        do_one_initcall+0x58/0x2d0
> [  234.842154]        kernel_init_freeable+0x273/0x2bf
> [  234.842157]        kernel_init+0x16/0x120
> [  234.842160]        ret_from_fork+0x1f/0x30
> [  234.842163]
>                -> #1 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> [  234.842166]        fs_reclaim_acquire+0x6d/0xd0
> [  234.842168]        __kmalloc_node+0x51/0x3a0
> [  234.842171]        alloc_cpumask_var_node+0x1b/0x30
> [  234.842174]        native_smp_prepare_cpus+0xc7/0x292
> [  234.842177]        kernel_init_freeable+0x160/0x2bf
> [  234.842179]        kernel_init+0x16/0x120
> [  234.842181]        ret_from_fork+0x1f/0x30
> [  234.842184]
>                -> #0 (fs_reclaim){+.+.}-{0:0}:
> [  234.842186]        __lock_acquire+0x1161/0x1dc0
> [  234.842189]        lock_acquire+0xb5/0x2b0
> [  234.842192]        fs_reclaim_acquire+0xa1/0xd0
> [  234.842193]        __kmalloc+0x4d/0x330
> [  234.842196]        i915_vma_coredump_create+0x78/0x5b0 [i915]
> [  234.842253]        intel_engine_coredump_add_vma+0x36/0xe0 [i915]
> [  234.842307]        __i915_gpu_coredump+0x290/0x5e0 [i915]
> [  234.842365]        i915_capture_error_state+0x57/0xa0 [i915]
> [  234.842415]        intel_gt_handle_error+0x348/0x3e0 [i915]
> [  234.842462]        intel_gt_debugfs_reset_store+0x3c/0x90 [i915]
> [  234.842504]        simple_attr_write+0xc1/0xe0
> [  234.842507]        full_proxy_write+0x53/0x80
> [  234.842509]        vfs_write+0xbc/0x350
> [  234.842513]        ksys_write+0x58/0xd0
> [  234.842514]        do_syscall_64+0x38/0x90
> [  234.842516]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  234.842519]
>                other info that might help us debug this:
> 
> [  234.842521] Chain exists of:
>                  fs_reclaim --> mmu_notifier_invalidate_range_start --> dma_fence_map
> 
> [  234.842526]  Possible unsafe locking scenario:
> 
> [  234.842528]        CPU0                    CPU1
> [  234.842529]        ----                    ----
> [  234.842531]   lock(dma_fence_map);
> [  234.842532]                                lock(mmu_notifier_invalidate_range_start);
> [  234.842535]                                lock(dma_fence_map);
> [  234.842537]   lock(fs_reclaim);
> [  234.842539]
>                 *** DEADLOCK ***
> 
> [  234.842540] 4 locks held by gem_exec_captur/1180:
> [  234.842543]  #0: ffff9007812d9460 (sb_writers#17){.+.+}-{0:0}, at: ksys_write+0x58/0xd0
> [  234.842547]  #1: ffff900781d9ecb8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write+0x3a/0xe0
> [  234.842552]  #2: ffffffffc11913a8 (capture_mutex){+.+.}-{3:3}, at: i915_capture_error_state+0x1a/0xa0 [i915]
> [  234.842602]  #3: ffffffffa3f57620 (dma_fence_map){++++}-{0:0}, at: i915_vma_snapshot_resource_pin+0x27/0x30 [i915]
> [  234.842656]
>                stack backtrace:
> [  234.842658] CPU: 0 PID: 1180 Comm: gem_exec_captur Tainted: G     U  W         5.15.0-rc7+ #20
> [  234.842661] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 0403 01/26/2021
> [  234.842664] Call Trace:
> [  234.842666]  dump_stack_lvl+0x57/0x72
> [  234.842669]  check_noncircular+0xde/0x100
> [  234.842672]  ? __lock_acquire+0x3bf/0x1dc0
> [  234.842675]  __lock_acquire+0x1161/0x1dc0
> [  234.842678]  lock_acquire+0xb5/0x2b0
> [  234.842680]  ? __kmalloc+0x4d/0x330
> [  234.842683]  ? finish_task_switch.isra.0+0xf2/0x360
> [  234.842686]  ? i915_vma_coredump_create+0x78/0x5b0 [i915]
> [  234.842734]  fs_reclaim_acquire+0xa1/0xd0
> [  234.842737]  ? __kmalloc+0x4d/0x330
> [  234.842739]  __kmalloc+0x4d/0x330
> [  234.842742]  i915_vma_coredump_create+0x78/0x5b0 [i915]
> [  234.842793]  ? capture_vma+0xbe/0x110 [i915]
> [  234.842844]  intel_engine_coredump_add_vma+0x36/0xe0 [i915]
> [  234.842892]  __i915_gpu_coredump+0x290/0x5e0 [i915]
> [  234.842939]  i915_capture_error_state+0x57/0xa0 [i915]
> [  234.842985]  intel_gt_handle_error+0x348/0x3e0 [i915]
> [  234.843032]  ? __mutex_lock+0x81/0x830
> [  234.843035]  ? simple_attr_write+0x3a/0xe0
> [  234.843038]  ? __lock_acquire+0x3bf/0x1dc0
> [  234.843041]  intel_gt_debugfs_reset_store+0x3c/0x90 [i915]
> [  234.843083]  ? _copy_from_user+0x45/0x80
> [  234.843086]  simple_attr_write+0xc1/0xe0
> [  234.843089]  full_proxy_write+0x53/0x80
> [  234.843091]  vfs_write+0xbc/0x350
> [  234.843094]  ksys_write+0x58/0xd0
> [  234.843096]  do_syscall_64+0x38/0x90
> [  234.843098]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  234.843101] RIP: 0033:0x7fa467480877
> [  234.843103] Code: 75 05 48 83 c4 58 c3 e8 37 4e ff ff 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> [  234.843108] RSP: 002b:00007ffd14d79b08 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [  234.843112] RAX: ffffffffffffffda RBX: 00007ffd14d79b60 RCX: 00007fa467480877
> [  234.843114] RDX: 0000000000000014 RSI: 00007ffd14d79b60 RDI: 0000000000000007
> [  234.843116] RBP: 0000000000000007 R08: 0000000000000000 R09: 00007ffd14d79ab0
> [  234.843119] R10: ffffffffffffffff R11: 0000000000000246 R12: 0000000000000014
> [  234.843121] R13: 0000000000000000 R14: 00007ffd14d79b60 R15: 0000000000000005
> 
> v5:
> - Use __GFP_KSWAPD_RECLAIM rather than __GFP_NOWAIT for clarity.
>   (Daniel Vetter)
> v6:
> - Include an instance in execlists_capture_work().
> - Rework the commit message due to patch reordering.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Looks good to me 

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 3 ++-
>  drivers/gpu/drm/i915/i915_gpu_error.c                | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index ca03880fa7e4..a69df5e9e77a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2186,7 +2186,8 @@ struct execlists_capture {
>  static void execlists_capture_work(struct work_struct *work)
>  {
>  	struct execlists_capture *cap = container_of(work, typeof(*cap), work);
> -	const gfp_t gfp = GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +	const gfp_t gfp = __GFP_KSWAPD_RECLAIM | __GFP_RETRY_MAYFAIL |
> +		__GFP_NOWARN;
>  	struct intel_engine_cs *engine = cap->rq->engine;
>  	struct intel_gt_coredump *gt = cap->error->gt;
>  	struct intel_engine_capture_vma *vma;
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 14de64282697..b1e4ce0f798f 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -49,7 +49,7 @@
>  #include "i915_memcpy.h"
>  #include "i915_scatterlist.h"
>  
> -#define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
> +#define ALLOW_FAIL (__GFP_KSWAPD_RECLAIM | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
>  #define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
>  
>  static void __sg_set_buf(struct scatterlist *sg,
> -- 
> 2.31.1
> 
