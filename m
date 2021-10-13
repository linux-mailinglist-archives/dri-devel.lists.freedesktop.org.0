Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5E42C690
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B716E0BF;
	Wed, 13 Oct 2021 16:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3CD6E0BF;
 Wed, 13 Oct 2021 16:41:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214626790"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214626790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:41:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="480877847"
Received: from peteratz-mobl.ger.corp.intel.com (HELO [10.252.43.54])
 ([10.252.43.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:41:44 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use dma_resv_iter for waiting in
 i915_gem_object_wait_reservation.
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211013111817.1886880-1-maarten.lankhorst@linux.intel.com>
 <20211013123203.1953276-1-maarten.lankhorst@linux.intel.com>
 <YWbmm6UqJ8JDa9WD@phenom.ffwll.local>
 <b7434459-de5c-3e8c-c94b-61f189e138e7@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <44103aed-72a6-9794-5520-dd1c7e8d4f4d@linux.intel.com>
Date: Wed, 13 Oct 2021 18:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b7434459-de5c-3e8c-c94b-61f189e138e7@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 13-10-2021 om 17:37 schreef Tvrtko Ursulin:
>
> On 13/10/2021 15:00, Daniel Vetter wrote:
>> On Wed, Oct 13, 2021 at 02:32:03PM +0200, Maarten Lankhorst wrote:
>>> No memory should be allocated when calling i915_gem_object_wait,
>>> because it may be called to idle a BO when evicting memory.
>>>
>>> Fix this by using dma_resv_iter helpers to call
>>> i915_gem_object_wait_fence() on each fence, which cleans up the code a lot.
>>> Also remove dma_resv_prune, it's questionably.
>>>
>>> This will result in the following lockdep splat.
>>>
>>> <4> [83.538517] ======================================================
>>> <4> [83.538520] WARNING: possible circular locking dependency detected
>>> <4> [83.538522] 5.15.0-rc5-CI-Trybot_8062+ #1 Not tainted
>>> <4> [83.538525] ------------------------------------------------------
>>> <4> [83.538527] gem_render_line/5242 is trying to acquire lock:
>>> <4> [83.538530] ffffffff8275b1e0 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc_track_caller+0x56/0x270
>>> <4> [83.538538]
>>> but task is already holding lock:
>>> <4> [83.538540] ffff88813471d1e0 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c7/0x970 [i915]
>>> <4> [83.538638]
>>> which lock already depends on the new lock.
>>> <4> [83.538642]
>>> the existing dependency chain (in reverse order) is:
>>> <4> [83.538645]
>>> -> #1 (&vm->mutex/1){+.+.}-{3:3}:
>>> <4> [83.538649]        lock_acquire+0xd3/0x310
>>> <4> [83.538654]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]
>>> <4> [83.538730]        i915_address_space_init+0xf5/0x1b0 [i915]
>>> <4> [83.538794]        ppgtt_init+0x55/0x70 [i915]
>>> <4> [83.538856]        gen8_ppgtt_create+0x44/0x5d0 [i915]
>>> <4> [83.538912]        i915_ppgtt_create+0x28/0xf0 [i915]
>>> <4> [83.538971]        intel_gt_init+0x130/0x3b0 [i915]
>>> <4> [83.539029]        i915_gem_init+0x14b/0x220 [i915]
>>> <4> [83.539100]        i915_driver_probe+0x97e/0xdd0 [i915]
>>> <4> [83.539149]        i915_pci_probe+0x43/0x1d0 [i915]
>>> <4> [83.539197]        pci_device_probe+0x9b/0x110
>>> <4> [83.539201]        really_probe+0x1b0/0x3b0
>>> <4> [83.539205]        __driver_probe_device+0xf6/0x170
>>> <4> [83.539208]        driver_probe_device+0x1a/0x90
>>> <4> [83.539210]        __driver_attach+0x93/0x160
>>> <4> [83.539213]        bus_for_each_dev+0x72/0xc0
>>> <4> [83.539216]        bus_add_driver+0x14b/0x1f0
>>> <4> [83.539220]        driver_register+0x66/0xb0
>>> <4> [83.539222]        hdmi_get_spk_alloc+0x1f/0x50 [snd_hda_codec_hdmi]
>>> <4> [83.539227]        do_one_initcall+0x53/0x2e0
>>> <4> [83.539230]        do_init_module+0x55/0x200
>>> <4> [83.539234]        load_module+0x2700/0x2980
>>> <4> [83.539237]        __do_sys_finit_module+0xaa/0x110
>>> <4> [83.539241]        do_syscall_64+0x37/0xb0
>>> <4> [83.539244]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> <4> [83.539247]
>>> -> #0 (fs_reclaim){+.+.}-{0:0}:
>>> <4> [83.539251]        validate_chain+0xb37/0x1e70
>>> <4> [83.539254]        __lock_acquire+0x5a1/0xb70
>>> <4> [83.539258]        lock_acquire+0xd3/0x310
>>> <4> [83.539260]        fs_reclaim_acquire+0x9d/0xd0
>>> <4> [83.539264]        __kmalloc_track_caller+0x56/0x270
>>> <4> [83.539267]        krealloc+0x48/0xa0
>>> <4> [83.539270]        dma_resv_get_fences+0x1c3/0x280
>>> <4> [83.539274]        i915_gem_object_wait+0x1ff/0x410 [i915]
>>> <4> [83.539342]        i915_gem_evict_for_node+0x16b/0x440 [i915]
>>> <4> [83.539412]        i915_gem_gtt_reserve+0xff/0x130 [i915]
>>> <4> [83.539482]        i915_vma_pin_ww+0x765/0x970 [i915]
>>> <4> [83.539556]        eb_validate_vmas+0x6fe/0x8e0 [i915]
>>> <4> [83.539626]        i915_gem_do_execbuffer+0x9a6/0x20a0 [i915]
>>> <4> [83.539693]        i915_gem_execbuffer2_ioctl+0x11f/0x2c0 [i915]
>>> <4> [83.539759]        drm_ioctl_kernel+0xac/0x140
>>> <4> [83.539763]        drm_ioctl+0x201/0x3d0
>>> <4> [83.539766]        __x64_sys_ioctl+0x6a/0xa0
>>> <4> [83.539769]        do_syscall_64+0x37/0xb0
>>> <4> [83.539772]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> <4> [83.539775]
>>> other info that might help us debug this:
>>> <4> [83.539778]  Possible unsafe locking scenario:
>>> <4> [83.539781]        CPU0                    CPU1
>>> <4> [83.539783]        ----                    ----
>>> <4> [83.539785]   lock(&vm->mutex/1);
>>> <4> [83.539788]                                lock(fs_reclaim);
>>> <4> [83.539791]                                lock(&vm->mutex/1);
>>> <4> [83.539794]   lock(fs_reclaim);
>>> <4> [83.539796]
>>>   *** DEADLOCK ***
>>> <4> [83.539799] 3 locks held by gem_render_line/5242:
>>> <4> [83.539802]  #0: ffffc90000d4bbf0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_gem_do_execbuffer+0x8e5/0x20a0 [i915]
>>> <4> [83.539870]  #1: ffff88811e48bae8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: eb_validate_vmas+0x81/0x8e0 [i915]
>>> <4> [83.539936]  #2: ffff88813471d1e0 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c7/0x970 [i915]
>>> <4> [83.540011]
>>> stack backtrace:
>>> <4> [83.540014] CPU: 2 PID: 5242 Comm: gem_render_line Not tainted 5.15.0-rc5-CI-Trybot_8062+ #1
>>> <4> [83.540019] Hardware name: Intel(R) Client Systems NUC11TNHi3/NUC11TNBi3, BIOS TNTGL357.0038.2020.1124.1648 11/24/2020
>>> <4> [83.540023] Call Trace:
>>> <4> [83.540026]  dump_stack_lvl+0x56/0x7b
>>> <4> [83.540030]  check_noncircular+0x12e/0x150
>>> <4> [83.540034]  ? _raw_spin_unlock_irqrestore+0x50/0x60
>>> <4> [83.540038]  validate_chain+0xb37/0x1e70
>>> <4> [83.540042]  __lock_acquire+0x5a1/0xb70
>>> <4> [83.540046]  lock_acquire+0xd3/0x310
>>> <4> [83.540049]  ? __kmalloc_track_caller+0x56/0x270
>>> <4> [83.540052]  ? find_held_lock+0x2d/0x90
>>> <4> [83.540055]  ? dma_resv_get_fences+0x1c3/0x280
>>> <4> [83.540058]  fs_reclaim_acquire+0x9d/0xd0
>>> <4> [83.540061]  ? __kmalloc_track_caller+0x56/0x270
>>> <4> [83.540064]  __kmalloc_track_caller+0x56/0x270
>>> <4> [83.540067]  krealloc+0x48/0xa0
>>> <4> [83.540070]  dma_resv_get_fences+0x1c3/0x280
>>> <4> [83.540074]  i915_gem_object_wait+0x1ff/0x410 [i915]
>>> <4> [83.540143]  i915_gem_evict_for_node+0x16b/0x440 [i915]
>>> <4> [83.540212]  i915_gem_gtt_reserve+0xff/0x130 [i915]
>>> <4> [83.540281]  i915_vma_pin_ww+0x765/0x970 [i915]
>>> <4> [83.540354]  eb_validate_vmas+0x6fe/0x8e0 [i915]
>>> <4> [83.540420]  i915_gem_do_execbuffer+0x9a6/0x20a0 [i915]
>>> <4> [83.540485]  ? lockdep_hardirqs_on+0xbf/0x130
>>> <4> [83.540490]  ? __lock_acquire+0x5c0/0xb70
>>> <4> [83.540495]  i915_gem_execbuffer2_ioctl+0x11f/0x2c0 [i915]
>>> <4> [83.540559]  ? i915_gem_do_execbuffer+0x20a0/0x20a0 [i915]
>>> <4> [83.540622]  drm_ioctl_kernel+0xac/0x140
>>> <4> [83.540625]  drm_ioctl+0x201/0x3d0
>>> <4> [83.540628]  ? i915_gem_do_execbuffer+0x20a0/0x20a0 [i915]
>>> <4> [83.540691]  __x64_sys_ioctl+0x6a/0xa0
>>> <4> [83.540694]  do_syscall_64+0x37/0xb0
>>> <4> [83.540697]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>>> <4> [83.540700] RIP: 0033:0x7fc314edc50b
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> Yay for ditching i915/dma_resv_utils.c while we're at it!
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> When Christian sent this patch I've raised one possibly important difference difference (from msg id e0954bdd-2183-f662-8192-c44f931c602b@linux.intel.com):
>
> """
> Converting this one could be problematic. It's the wait ioctl which used to grab an atomic snapshot and wait for that rendering to complete. With this change I think it has the potential to run forever keeps catching new activity against the same object.
>
> I am not sure whether or not the difference is relevant for how userspace uses it but I think needs discussion.
>
> Hm actually there are internal callers as well, and at least some of those have the object locked. Would a wider refactoring to separate those into buckets (locked vs unlocked) make sense?
> """
I think it's harmless. In case of locked you can still use the unlocked calls, they just put in a bit more effort that isn't needed.
>
> I don't have sufficient knowledge on how userspace might be using gem_wait to call whether it is a problem or not, or how big. Thoughts?

Other drivers (nouveau, amdgpu) all implement the wait ioctl in the same way, I am not aware of any issues there.

In theory it could be a problem, in practice you wouldn't wait for a bo to idle unless you're the one that's going to use it next.

> Regards,
>
> Tvrtko
>
>>
>>> ---
>>>   drivers/gpu/drm/i915/Makefile                |  1 -
>>>   drivers/gpu/drm/i915/dma_resv_utils.c        | 17 ------
>>>   drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -----
>>>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  1 -
>>>   drivers/gpu/drm/i915/gem/i915_gem_wait.c     | 56 +++-----------------
>>>   5 files changed, 8 insertions(+), 80 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
>>>   delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>> index 21b05ed0e4e8..88bb326d9031 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -58,7 +58,6 @@ i915-y += i915_drv.o \
>>>     # core library code
>>>   i915-y += \
>>> -    dma_resv_utils.o \
>>>       i915_memcpy.o \
>>>       i915_mm.o \
>>>       i915_sw_fence.o \
>>> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
>>> deleted file mode 100644
>>> index 7df91b7e4ca8..000000000000
>>> --- a/drivers/gpu/drm/i915/dma_resv_utils.c
>>> +++ /dev/null
>>> @@ -1,17 +0,0 @@
>>> -// SPDX-License-Identifier: MIT
>>> -/*
>>> - * Copyright © 2020 Intel Corporation
>>> - */
>>> -
>>> -#include <linux/dma-resv.h>
>>> -
>>> -#include "dma_resv_utils.h"
>>> -
>>> -void dma_resv_prune(struct dma_resv *resv)
>>> -{
>>> -    if (dma_resv_trylock(resv)) {
>>> -        if (dma_resv_test_signaled(resv, true))
>>> -            dma_resv_add_excl_fence(resv, NULL);
>>> -        dma_resv_unlock(resv);
>>> -    }
>>> -}
>>> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
>>> deleted file mode 100644
>>> index b9d8fb5f8367..000000000000
>>> --- a/drivers/gpu/drm/i915/dma_resv_utils.h
>>> +++ /dev/null
>>> @@ -1,13 +0,0 @@
>>> -/* SPDX-License-Identifier: MIT */
>>> -/*
>>> - * Copyright © 2020 Intel Corporation
>>> - */
>>> -
>>> -#ifndef DMA_RESV_UTILS_H
>>> -#define DMA_RESV_UTILS_H
>>> -
>>> -struct dma_resv;
>>> -
>>> -void dma_resv_prune(struct dma_resv *resv);
>>> -
>>> -#endif /* DMA_RESV_UTILS_H */
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>>> index c80e6c1d2bcb..5375f3f9f016 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>>> @@ -15,7 +15,6 @@
>>>     #include "gt/intel_gt_requests.h"
>>>   -#include "dma_resv_utils.h"
>>>   #include "i915_trace.h"
>>>     static bool swap_available(void)
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> index f909aaa09d9c..e59304a76b2c 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> @@ -10,7 +10,6 @@
>>>     #include "gt/intel_engine.h"
>>>   -#include "dma_resv_utils.h"
>>>   #include "i915_gem_ioctls.h"
>>>   #include "i915_gem_object.h"
>>>   @@ -37,56 +36,17 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>>>                    unsigned int flags,
>>>                    long timeout)
>>>   {
>>> -    struct dma_fence *excl;
>>> -    bool prune_fences = false;
>>> -
>>> -    if (flags & I915_WAIT_ALL) {
>>> -        struct dma_fence **shared;
>>> -        unsigned int count, i;
>>> -        int ret;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *fence;
>>>   -        ret = dma_resv_get_fences(resv, &excl, &count, &shared);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> -        for (i = 0; i < count; i++) {
>>> -            timeout = i915_gem_object_wait_fence(shared[i],
>>> -                                 flags, timeout);
>>> -            if (timeout < 0)
>>> -                break;
>>> +    dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>   -            dma_fence_put(shared[i]);
>>> -        }
>>> -
>>> -        for (; i < count; i++)
>>> -            dma_fence_put(shared[i]);
>>> -        kfree(shared);
>>> -
>>> -        /*
>>> -         * If both shared fences and an exclusive fence exist,
>>> -         * then by construction the shared fences must be later
>>> -         * than the exclusive fence. If we successfully wait for
>>> -         * all the shared fences, we know that the exclusive fence
>>> -         * must all be signaled. If all the shared fences are
>>> -         * signaled, we can prune the array and recover the
>>> -         * floating references on the fences/requests.
>>> -         */
>>> -        prune_fences = count && timeout >= 0;
>>> -    } else {
>>> -        excl = dma_resv_get_excl_unlocked(resv);
>>> +        timeout = i915_gem_object_wait_fence(fence, flags, timeout);
>>> +        if (timeout <= 0)
>>> +            break;
>>>       }
>>> -
>>> -    if (excl && timeout >= 0)
>>> -        timeout = i915_gem_object_wait_fence(excl, flags, timeout);
>>> -
>>> -    dma_fence_put(excl);
>>> -
>>> -    /*
>>> -     * Opportunistically prune the fences iff we know they have *all* been
>>> -     * signaled.
>>> -     */
>>> -    if (prune_fences)
>>> -        dma_resv_prune(resv);
>>> +    dma_resv_iter_end(&cursor);
>>>         return timeout;
>>>   }
>>> -- 
>>> 2.33.0
>>>
>>

