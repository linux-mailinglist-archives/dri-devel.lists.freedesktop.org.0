Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EF69AB67
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2810EFA2;
	Fri, 17 Feb 2023 12:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5334A10EF9D;
 Fri, 17 Feb 2023 12:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676636687; x=1708172687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vPgK6y8a+YEo95dZ7Wxhyfhdpxr+odY+lYANe5ENZdg=;
 b=el5yJ0/H0L9T7+AMk2o5IINJ6MuPu0TmHJ8o5u8i94L+2shoKvCOMwet
 ASbFOuorQkOlvlhOVXO1P+uNdRUqz/1SVnnCLLOPF54KEFGtE8LcPPR+C
 v497BDUOf5YSNmc0pnynRdyzQP+/CB38lKC91g1TORX+NBfsarnsifevB
 JLbE3JVQoZ98v1Q7RRqkjL+3iRQrkVCcSAR1Mygo/+6OZJZ6b5Yd8+OD+
 405Kb+hP/ZpYTQGqNjGi+G7wW8UIcEDvAMRvSWHBWJyl+gCQ1DiuMdFBl
 byTypnXHKfOH+Etrqt3wZRVTLtavxi7I2G0dO850O8sp2bqoBQrU3DRZm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="312341424"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="312341424"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:24:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844562259"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="844562259"
Received: from hlykke-mobl1.ger.corp.intel.com (HELO [10.249.254.184])
 ([10.249.254.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 04:24:44 -0800
Message-ID: <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
Date: Fri, 17 Feb 2023 13:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] drm/suballoc: Introduce a generic suballocation
 manager
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/17/23 12:28, Christian König wrote:
> Am 17.02.23 um 12:21 schrieb Thomas Hellström:
>>
>> On 2/17/23 12:00, Christian König wrote:
>>> Am 16.02.23 um 15:48 schrieb Thomas Hellström:
>>>> Initially we tried to leverage the amdgpu suballocation manager.
>>>> It turnes out, however, that it tries extremely hard not to enable
>>>> signalling on the fences that hold the memory up for freeing, which 
>>>> makes
>>>> it hard to understand and to fix potential issues with it.
>>>>
>>>> So in a simplification effort, introduce a drm suballocation 
>>>> manager as a
>>>> wrapper around an existing allocator (drm_mm) and to avoid using 
>>>> queues
>>>> for freeing, thus avoiding throttling on free which is an undesired
>>>> feature as typically the throttling needs to be done uninterruptible.
>>>>
>>>> This variant is probably more cpu-hungry but can be improved at the 
>>>> cost
>>>> of additional complexity. Ideas for that are documented in the
>>>> drm_suballoc.c file.
>>>>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Co-developed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/Kconfig        |   4 +
>>>>   drivers/gpu/drm/Makefile       |   3 +
>>>>   drivers/gpu/drm/drm_suballoc.c | 301 
>>>> +++++++++++++++++++++++++++++++++
>>>>   include/drm/drm_suballoc.h     | 112 ++++++++++++
>>>>   4 files changed, 420 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>>>   create mode 100644 include/drm/drm_suballoc.h
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index dc0f94f02a82..8fbe57407c60 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -232,6 +232,10 @@ config DRM_GEM_SHMEM_HELPER
>>>>       help
>>>>         Choose this if you need the GEM shmem helper functions
>>>>   +config DRM_SUBALLOC_HELPER
>>>> +    tristate
>>>> +    depends on DRM
>>>> +
>>>>   config DRM_SCHED
>>>>       tristate
>>>>       depends on DRM
>>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>> index ab4460fcd63f..1e04d135e866 100644
>>>> --- a/drivers/gpu/drm/Makefile
>>>> +++ b/drivers/gpu/drm/Makefile
>>>> @@ -88,6 +88,9 @@ obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
>>>>   drm_shmem_helper-y := drm_gem_shmem_helper.o
>>>>   obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
>>>>   +drm_suballoc_helper-y := drm_suballoc.o
>>>> +obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
>>>> +
>>>>   drm_vram_helper-y := drm_gem_vram_helper.o
>>>>   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>>>>   diff --git a/drivers/gpu/drm/drm_suballoc.c 
>>>> b/drivers/gpu/drm/drm_suballoc.c
>>>> new file mode 100644
>>>> index 000000000000..6e0292dea548
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/drm_suballoc.c
>>>> @@ -0,0 +1,301 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2022 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_suballoc.h>
>>>> +
>>>> +/**
>>>> + * DOC:
>>>> + * This suballocator intends to be a wrapper around a range allocator
>>>> + * that is aware also of deferred range freeing with fences. 
>>>> Currently
>>>> + * we hard-code the drm_mm as the range allocator.
>>>> + * The approach, while rather simple, suffers from three performance
>>>> + * issues that can all be fixed if needed at the tradeoff of more 
>>>> and / or
>>>> + * more complex code:
>>>> + *
>>>> + * 1) It's cpu-hungry, the drm_mm allocator is overkill. Either 
>>>> code a
>>>> + * much simpler range allocator, or let the caller decide by 
>>>> providing
>>>> + * ops that wrap any range allocator. Also could avoid waking up 
>>>> unless
>>>> + * there is a reasonable chance of enough space in the range manager.
>>>
>>> That's most likely highly problematic.
>>>
>>> The suballocator in radeon/amdgpu was designed so that it resembles 
>>> a ring buffer and is therefor rather CPU efficient.
>>>
>>> We could make the allocator much more trivial, but using drm_mm for 
>>> this is a sledgehammer and therefore a pretty clear no-go.
>>>
>> I don't think the ring vs non-ring is the big problem here, because 
>> (at least with the original implementation), if allocations are 
>> actually made and released in a ring-like fashion, the drm_mm 
>> free-list would consist of one or two blocks and therefore pretty 
>> efficient even for that case, and if slightly longer that would still 
>> not be an issue compared to the fence lists maintained in the older 
>> allocator.
>>
>> The problem is more all the other stuff that was added and built on 
>> top like the interval / rb tree.
>>
>> I still like the idea (originating from Gallium's helpers) to 
>> separate whatever is allocating from the fence delayed free.
>
> That's actually a bad idea. See the ring like approach works because 
> the fences used in amdgpu/radeon are used in a ring like fashion. E.g. 
> the sub allocator mainly provides the temporary space for page table 
> updates. Those in turn are then used by commands written into a ring 
> buffer.

Well, what I'm saying is that *even* if you have a ring-like allocation 
algorithm, given a simpler drm_mm, I think the suggested code would be 
performing just as well as the one in amdgpu / radeon, on top of 
avoiding throttling on free, or do you have a particular scenario in 
mind that you think would be particularly pathological on this allocator?

>
>>
>> Any chance you could do a quick performance comparison? If not, 
>> anything against merging this without the amd / radeon changes until 
>> we can land a simpler allocator?
>
> Only if you can stick the allocator inside Xe and not drm, cause this 
> seems to be for a different use case than the allocators inside 
> radeon/amdgpu.

Hmm. No It's allocating in a ring-like fashion as well.  Let me put 
together a unit test for benchmaking. I think it would be a failure for 
the community to end up with three separate suballocators doing the 
exact same thing for the same problem, really.

/Thomas

>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Thomas
>>
>>
>> Thomas
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> + *
>>>> + * 2) We unnecessarily install the fence callbacks too early, forcing
>>>> + * enable_signaling() too early causing extra driver effort. This 
>>>> is likely
>>>> + * not an issue if used with the drm_scheduler since it calls
>>>> + * enable_signaling() early anyway.
>>>> + *
>>>> + * 3) Long processing in irq (disabled) context. We've mostly 
>>>> worked around
>>>> + * that already by using the idle_list. If that workaround is 
>>>> deemed to
>>>> + * complex for little gain, we can remove it and use spin_lock_irq()
>>>> + * throughout the manager. If we want to shorten processing in irq 
>>>> context
>>>> + * even further, we can skip the spin_trylock in 
>>>> __drm_suballoc_free() and
>>>> + * avoid freeing allocations from irq context altogeher. However 
>>>> drm_mm
>>>> + * should be quite fast at freeing ranges.
>>>> + *
>>>> + * 4) Shrinker that starts processing the list items in 2) and 3) 
>>>> to play
>>>> + * better with the system.
>>>> + */
>>>> +
>>>> +static void drm_suballoc_process_idle(struct drm_suballoc_manager 
>>>> *sa_manager);
>>>> +
>>>> +/**
>>>> + * drm_suballoc_manager_init() - Initialise the drm_suballoc_manager
>>>> + * @sa_manager: pointer to the sa_manager
>>>> + * @size: number of bytes we want to suballocate
>>>> + * @align: alignment for each suballocated chunk
>>>> + *
>>>> + * Prepares the suballocation manager for suballocations.
>>>> + */
>>>> +void drm_suballoc_manager_init(struct drm_suballoc_manager 
>>>> *sa_manager,
>>>> +                   u64 size, u64 align)
>>>> +{
>>>> +    spin_lock_init(&sa_manager->lock);
>>>> +    spin_lock_init(&sa_manager->idle_list_lock);
>>>> +    mutex_init(&sa_manager->alloc_mutex);
>>>> +    drm_mm_init(&sa_manager->mm, 0, size);
>>>> +    init_waitqueue_head(&sa_manager->wq);
>>>> +    sa_manager->range_size = size;
>>>> +    sa_manager->alignment = align;
>>>> +    INIT_LIST_HEAD(&sa_manager->idle_list);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_suballoc_manager_init);
>>>> +
>>>> +/**
>>>> + * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
>>>> + * @sa_manager: pointer to the sa_manager
>>>> + *
>>>> + * Cleans up the suballocation manager after use. All fences added
>>>> + * with drm_suballoc_free() must be signaled, or we cannot clean up
>>>> + * the entire manager.
>>>> + */
>>>> +void drm_suballoc_manager_fini(struct drm_suballoc_manager 
>>>> *sa_manager)
>>>> +{
>>>> +    drm_suballoc_process_idle(sa_manager);
>>>> +    drm_mm_takedown(&sa_manager->mm);
>>>> +    mutex_destroy(&sa_manager->alloc_mutex);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_suballoc_manager_fini);
>>>> +
>>>> +static void __drm_suballoc_free(struct drm_suballoc *sa)
>>>> +{
>>>> +    struct drm_suballoc_manager *sa_manager = sa->manager;
>>>> +    struct dma_fence *fence;
>>>> +
>>>> +    /*
>>>> +     * In order to avoid protecting the potentially lengthy drm_mm 
>>>> manager
>>>> +     * *allocation* processing with an irq-disabling lock,
>>>> +     * defer touching the drm_mm for freeing until we're in task 
>>>> context,
>>>> +     * with no irqs disabled, or happen to succeed in taking the 
>>>> manager
>>>> +     * lock.
>>>> +     */
>>>> +    if (!in_task() || irqs_disabled()) {
>>>> +        unsigned long irqflags;
>>>> +
>>>> +        if (spin_trylock(&sa_manager->lock))
>>>> +            goto locked;
>>>> +
>>>> + spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
>>>> +        list_add_tail(&sa->idle_link, &sa_manager->idle_list);
>>>> + spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
>>>> +        wake_up(&sa_manager->wq);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    spin_lock(&sa_manager->lock);
>>>> +locked:
>>>> +    drm_mm_remove_node(&sa->node);
>>>> +
>>>> +    fence = sa->fence;
>>>> +    sa->fence = NULL;
>>>> +    spin_unlock(&sa_manager->lock);
>>>> +    /* Maybe only wake if first mm hole is sufficiently large? */
>>>> +    wake_up(&sa_manager->wq);
>>>> +    dma_fence_put(fence);
>>>> +    kfree(sa);
>>>> +}
>>>> +
>>>> +/* Free all deferred idle allocations */
>>>> +static void drm_suballoc_process_idle(struct drm_suballoc_manager 
>>>> *sa_manager)
>>>> +{
>>>> +    /*
>>>> +     * prepare_to_wait() / wake_up() semantics ensure that any list
>>>> +     * addition that was done before wake_up() is visible when
>>>> +     * this code is called from the wait loop.
>>>> +     */
>>>> +    if (!list_empty_careful(&sa_manager->idle_list)) {
>>>> +        struct drm_suballoc *sa, *next;
>>>> +        unsigned long irqflags;
>>>> +        LIST_HEAD(list);
>>>> +
>>>> + spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
>>>> +        list_splice_init(&sa_manager->idle_list, &list);
>>>> + spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
>>>> +
>>>> +        list_for_each_entry_safe(sa, next, &list, idle_link)
>>>> +            __drm_suballoc_free(sa);
>>>> +    }
>>>> +}
>>>> +
>>>> +static void
>>>> +drm_suballoc_fence_signaled(struct dma_fence *fence, struct 
>>>> dma_fence_cb *cb)
>>>> +{
>>>> +    struct drm_suballoc *sa = container_of(cb, typeof(*sa), cb);
>>>> +
>>>> +    __drm_suballoc_free(sa);
>>>> +}
>>>> +
>>>> +static int drm_suballoc_tryalloc(struct drm_suballoc *sa, u64 size)
>>>> +{
>>>> +    struct drm_suballoc_manager *sa_manager = sa->manager;
>>>> +    int err;
>>>> +
>>>> +    drm_suballoc_process_idle(sa_manager);
>>>> +    spin_lock(&sa_manager->lock);
>>>> +    err = drm_mm_insert_node_generic(&sa_manager->mm, &sa->node, 
>>>> size,
>>>> +                     sa_manager->alignment, 0,
>>>> +                     DRM_MM_INSERT_EVICT);
>>>> +    spin_unlock(&sa_manager->lock);
>>>> +    return err;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_suballoc_new() - Make a suballocation.
>>>> + * @sa_manager: pointer to the sa_manager
>>>> + * @size: number of bytes we want to suballocate.
>>>> + * @gfp: Allocation context.
>>>> + * @intr: Whether to sleep interruptibly if sleeping.
>>>> + *
>>>> + * Try to make a suballocation of size @size, which will be rounded
>>>> + * up to the alignment specified in specified in 
>>>> drm_suballoc_manager_init().
>>>> + *
>>>> + * Returns a new suballocated bo, or an ERR_PTR.
>>>> + */
>>>> +struct drm_suballoc*
>>>> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size,
>>>> +         gfp_t gfp, bool intr)
>>>> +{
>>>> +    struct drm_suballoc *sa;
>>>> +    DEFINE_WAIT(wait);
>>>> +    int err = 0;
>>>> +
>>>> +    if (size > sa_manager->range_size)
>>>> +        return ERR_PTR(-ENOSPC);
>>>> +
>>>> +    sa = kzalloc(sizeof(*sa), gfp);
>>>> +    if (!sa)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    /* Avoid starvation using the alloc_mutex */
>>>> +    if (intr)
>>>> +        err = mutex_lock_interruptible(&sa_manager->alloc_mutex);
>>>> +    else
>>>> +        mutex_lock(&sa_manager->alloc_mutex);
>>>> +    if (err) {
>>>> +        kfree(sa);
>>>> +        return ERR_PTR(err);
>>>> +    }
>>>> +
>>>> +    sa->manager = sa_manager;
>>>> +    err = drm_suballoc_tryalloc(sa, size);
>>>> +    if (err != -ENOSPC)
>>>> +        goto out;
>>>> +
>>>> +    for (;;) {
>>>> +        prepare_to_wait(&sa_manager->wq, &wait,
>>>> +                intr ? TASK_INTERRUPTIBLE :
>>>> +                TASK_UNINTERRUPTIBLE);
>>>> +
>>>> +        err = drm_suballoc_tryalloc(sa, size);
>>>> +        if (err != -ENOSPC)
>>>> +            break;
>>>> +
>>>> +        if (intr && signal_pending(current)) {
>>>> +            err = -ERESTARTSYS;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        io_schedule();
>>>> +    }
>>>> +    finish_wait(&sa_manager->wq, &wait);
>>>> +
>>>> +out:
>>>> +    mutex_unlock(&sa_manager->alloc_mutex);
>>>> +    if (!sa->node.size) {
>>>> +        kfree(sa);
>>>> +        WARN_ON(!err);
>>>> +        sa = ERR_PTR(err);
>>>> +    }
>>>> +
>>>> +    return sa;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_suballoc_new);
>>>> +
>>>> +/**
>>>> + * drm_suballoc_free() - Free a suballocation
>>>> + * @suballoc: pointer to the suballocation
>>>> + * @fence: fence that signals when suballocation is idle
>>>> + * @queue: the index to which queue the suballocation will be 
>>>> placed on the free list.
>>>> + *
>>>> + * Free the suballocation. The suballocation can be re-used after 
>>>> @fence
>>>> + * signals.
>>>> + */
>>>> +void
>>>> +drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence)
>>>> +{
>>>> +    if (!sa)
>>>> +        return;
>>>> +
>>>> +    if (!fence || dma_fence_is_signaled(fence)) {
>>>> +        __drm_suballoc_free(sa);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    sa->fence = dma_fence_get(fence);
>>>> +    if (dma_fence_add_callback(fence, &sa->cb, 
>>>> drm_suballoc_fence_signaled))
>>>> +        __drm_suballoc_free(sa);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_suballoc_free);
>>>> +
>>>> +#ifdef CONFIG_DEBUG_FS
>>>> +
>>>> +/**
>>>> + * drm_suballoc_dump_debug_info() - Dump the suballocator state
>>>> + * @sa_manager: The suballoc manager.
>>>> + * @p: Pointer to a drm printer for output.
>>>> + * @suballoc_base: Constant to add to the suballocated offsets on 
>>>> printout.
>>>> + *
>>>> + * This function dumps the suballocator state. Note that the 
>>>> caller has
>>>> + * to explicitly order frees and calls to this function in order 
>>>> for the
>>>> + * freed node to show up as protected by a fence.
>>>> + */
>>>> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager 
>>>> *sa_manager,
>>>> +                  struct drm_printer *p, u64 suballoc_base)
>>>> +{
>>>> +    const struct drm_mm_node *entry;
>>>> +
>>>> +    spin_lock(&sa_manager->lock);
>>>> +    drm_mm_for_each_node(entry, &sa_manager->mm) {
>>>> +        struct drm_suballoc *sa =
>>>> +            container_of(entry, typeof(*sa), node);
>>>> +
>>>> +        drm_printf(p, " ");
>>>> +        drm_printf(p, "[0x%010llx 0x%010llx] size %8lld",
>>>> +               (unsigned long long)suballoc_base + entry->start,
>>>> +               (unsigned long long)suballoc_base + entry->start +
>>>> +               entry->size, (unsigned long long)entry->size);
>>>> +
>>>> +        if (sa->fence)
>>>> +            drm_printf(p, " protected by 0x%016llx on context %llu",
>>>> +                   (unsigned long long)sa->fence->seqno,
>>>> +                   (unsigned long long)sa->fence->context);
>>>> +
>>>> +        drm_printf(p, "\n");
>>>> +    }
>>>> +    spin_unlock(&sa_manager->lock);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
>>>> +#endif
>>>> +
>>>> +MODULE_AUTHOR("Intel Corporation");
>>>> +MODULE_DESCRIPTION("Simple range suballocator helper");
>>>> +MODULE_LICENSE("GPL and additional rights");
>>>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>>>> new file mode 100644
>>>> index 000000000000..910952b3383b
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_suballoc.h
>>>> @@ -0,0 +1,112 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2022 Intel Corporation
>>>> + */
>>>> +#ifndef _DRM_SUBALLOC_H_
>>>> +#define _DRM_SUBALLOC_H_
>>>> +
>>>> +#include <drm/drm_mm.h>
>>>> +
>>>> +#include <linux/dma-fence.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +/**
>>>> + * struct drm_suballoc_manager - Wrapper for fenced range allocations
>>>> + * @mm: The range manager. Protected by @lock.
>>>> + * @range_size: The total size of the range.
>>>> + * @alignment: Range alignment.
>>>> + * @wq: Wait queue for sleeping allocations on contention.
>>>> + * @idle_list: List of idle but not yet freed allocations. 
>>>> Protected by
>>>> + * @idle_list_lock.
>>>> + * @task: Task waiting for allocation. Protected by @lock.
>>>> + */
>>>> +struct drm_suballoc_manager {
>>>> +    /** @lock: Manager lock. Protects @mm. */
>>>> +    spinlock_t lock;
>>>> +    /**
>>>> +     * @idle_list_lock: Lock to protect the idle_list.
>>>> +     * Disable irqs when locking.
>>>> +     */
>>>> +    spinlock_t idle_list_lock;
>>>> +    /** @alloc_mutex: Mutex to protect against stavation. */
>>>> +    struct mutex alloc_mutex;
>>>> +    struct drm_mm mm;
>>>> +    u64 range_size;
>>>> +    u64 alignment;
>>>> +    wait_queue_head_t wq;
>>>> +    struct list_head idle_list;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_suballoc: Suballocated range.
>>>> + * @node: The drm_mm representation of the range.
>>>> + * @fence: dma-fence indicating whether allocation is active or idle.
>>>> + * Assigned on call to free the allocation so doesn't need 
>>>> protection.
>>>> + * @cb: dma-fence callback structure. Used for callbacks when the 
>>>> fence signals.
>>>> + * @manager: The struct drm_suballoc_manager the range belongs to. 
>>>> Immutable.
>>>> + * @idle_link: Link for the manager idle_list. Progected by the
>>>> + * drm_suballoc_manager::idle_lock.
>>>> + */
>>>> +struct drm_suballoc {
>>>> +    struct drm_mm_node node;
>>>> +    struct dma_fence *fence;
>>>> +    struct dma_fence_cb cb;
>>>> +    struct drm_suballoc_manager *manager;
>>>> +    struct list_head idle_link;
>>>> +};
>>>> +
>>>> +void drm_suballoc_manager_init(struct drm_suballoc_manager 
>>>> *sa_manager,
>>>> +                   u64 size, u64 align);
>>>> +
>>>> +void drm_suballoc_manager_fini(struct drm_suballoc_manager 
>>>> *sa_manager);
>>>> +
>>>> +struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager 
>>>> *sa_manager,
>>>> +                      u64 size, gfp_t gfp, bool intr);
>>>> +
>>>> +void drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence 
>>>> *fence);
>>>> +
>>>> +/**
>>>> + * drm_suballoc_soffset - Range start.
>>>> + * @sa: The struct drm_suballoc.
>>>> + *
>>>> + * Return: The start of the allocated range.
>>>> + */
>>>> +static inline u64 drm_suballoc_soffset(struct drm_suballoc *sa)
>>>> +{
>>>> +    return sa->node.start;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_suballoc_eoffset - Range end.
>>>> + * @sa: The struct drm_suballoc.
>>>> + *
>>>> + * Return: The end of the allocated range + 1.
>>>> + */
>>>> +static inline u64 drm_suballoc_eoffset(struct drm_suballoc *sa)
>>>> +{
>>>> +    return sa->node.start + sa->node.size;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_suballoc_size - Range size.
>>>> + * @sa: The struct drm_suballoc.
>>>> + *
>>>> + * Return: The size of the allocated range.
>>>> + */
>>>> +static inline u64 drm_suballoc_size(struct drm_suballoc *sa)
>>>> +{
>>>> +    return sa->node.size;
>>>> +}
>>>> +
>>>> +#ifdef CONFIG_DEBUG_FS
>>>> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager 
>>>> *sa_manager,
>>>> +                  struct drm_printer *p, u64 suballoc_base);
>>>> +#else
>>>> +static inline void
>>>> +drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
>>>> +                 struct drm_printer *p, u64 suballoc_base)
>>>> +{ }
>>>> +
>>>> +#endif
>>>> +
>>>> +#endif /* _DRM_SUBALLOC_H_ */
>>>
>
