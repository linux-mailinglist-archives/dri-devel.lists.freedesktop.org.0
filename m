Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C18868A9D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D95C10E898;
	Tue, 27 Feb 2024 08:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/IY+/o8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E894F10E895;
 Tue, 27 Feb 2024 08:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709021583; x=1740557583;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nTXjCQDVpE4inbUOdaieKGvNWwoEnEx+yNGFrD745fI=;
 b=b/IY+/o8zV+lSjuuWvO5C+qBTWwY1IzG5oJ8Y24m1GNuttYpFjpHo07w
 6ELX5V/3lZj0hYPnId55k/SQcfDtb7bGQBn4HpSnF6uhjY/MuFVXWTdJv
 AJQJP3dOIqhxrmRzj3cy6/78666IK0HqMsMtzFbgZWsKaC5wAUK7tYzCH
 TiFHtlQW7BLCK9AuzIbNGjuwdVOI2FxrsBpx8ZDjk2JTzGsETNkI4sV5E
 5fDyFHNvztSQ1dqKx7w9TPe5UGygw7zujKpjo2Xyo2MQ7AFcDQ2sFASik
 eekmyVHCmL4KG73rXpQX555geesCTeRbuFbMHj6/n7hIvEQ3IE4NvNItm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3210597"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3210597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11731368"
Received: from iserpi-mobl.ger.corp.intel.com (HELO [10.252.23.63])
 ([10.252.23.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 00:13:01 -0800
Message-ID: <0f30f854-fac1-4741-a0c7-086a7c1dd062@intel.com>
Date: Tue, 27 Feb 2024 08:12:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: improve idle/busy handling v4
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240126140916.1577-1-christian.koenig@amd.com>
 <20240126140916.1577-2-christian.koenig@amd.com>
 <ce167d0a18781733eeb4974b92ff5038a5241a70.camel@linux.intel.com>
 <e59e4c53-7c22-4162-9ef5-cb399383782e@gmail.com>
 <53178cc5-9a8d-477b-be2b-2f783e8a1aa7@gmail.com>
 <b99455de655c067a1820b2273e1258bb35f3fbdd.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <b99455de655c067a1820b2273e1258bb35f3fbdd.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2024 20:21, Thomas Hellström wrote:
> Hi, Christian
> 
> On Fri, 2024-02-23 at 15:30 +0100, Christian König wrote:
>> Am 06.02.24 um 13:56 schrieb Christian König:
>>> Am 06.02.24 um 13:53 schrieb Thomas Hellström:
>>>> Hi, Christian,
>>>>
>>>> On Fri, 2024-01-26 at 15:09 +0100, Christian König wrote:
>>>>> Previously we would never try to move a BO into the preferred
>>>>> placements
>>>>> when it ever landed in a busy placement since those were
>>>>> considered
>>>>> compatible.
>>>>>
>>>>> Rework the whole handling and finally unify the idle and busy
>>>>> handling.
>>>>> ttm_bo_validate() is now responsible to try idle placement
>>>>> first and
>>>>> then
>>>>> use the busy placement if that didn't worked.
>>>>>
>>>>> Drawback is that we now always try the idle placement first for
>>>>> each
>>>>> validation which might cause some additional CPU overhead on
>>>>> overcommit.
>>>>>
>>>>> v2: fix kerneldoc warning and coding style
>>>>> v3: take care of XE as well
>>>>> v4: keep the ttm_bo_mem_space functionality as it is for now,
>>>>> only
>>>>> add
>>>>>       new handling for ttm_bo_validate as suggested by Thomas
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com> v3
>>>> Sending this through xe CI, will try to review asap.
>>>
>>> Take your time. At the moment people are bombarding me with work
>>> and I
>>> have only two hands and one head as well :(
>>
>> So I've digged myself out of that hole and would rather like to get
>> this
>> new feature into 6.9.
>>
>> Any time to review it? I can also plan some time to review your LRU
>> changes next week.
>>
>> Thanks,
>> Christian.
> 
> Sorry for the late response. Was planning to review but saw that there
> was still an xe CI failure.
> 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129579v1/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
> I haven't really had time to look into what might be causing this,
> though.
Maybe in ttm_bo_alloc_resource():

@@ -772,7 +772,7 @@ static int ttm_bo_alloc_resource(struct 
ttm_buffer_object *bo,

                 do {
                         ret = ttm_resource_alloc(bo, place, res);
-                       if (unlikely(ret != -ENOSPC))
+                       if (unlikely(ret && ret != -ENOSPC))
                                 return ret;
                         if (likely(!ret) || !force_space)
                                 break;

Otherwise we allocate VRAM but never correctly synchronise against the 
move fence, since we missed adding it to the BO. When we trigger async 
evictions that would explain the above test failure where we detect VRAM 
corruption, since someone else is still using the VRAM we allocated. 
What do you think?

> 
> /Thomas
> 
>>
>>>
>>> Christian.
>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_bo.c       | 231 +++++++++++++-------
>>>>> -------
>>>>> -- 
>>>>>    drivers/gpu/drm/ttm/ttm_resource.c |  16 +-
>>>>>    include/drm/ttm/ttm_resource.h     |   3 +-
>>>>>    3 files changed, 121 insertions(+), 129 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> index ba3f09e2d7e6..b12f435542a9 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> @@ -724,64 +724,36 @@ static int ttm_bo_add_move_fence(struct
>>>>> ttm_buffer_object *bo,
>>>>>        return ret;
>>>>>    }
>>>>>    -/*
>>>>> - * Repeatedly evict memory from the LRU for @mem_type until we
>>>>> create enough
>>>>> - * space, or we've evicted everything and there isn't enough
>>>>> space.
>>>>> - */
>>>>> -static int ttm_bo_mem_force_space(struct ttm_buffer_object
>>>>> *bo,
>>>>> -                  const struct ttm_place *place,
>>>>> -                  struct ttm_resource **mem,
>>>>> -                  struct ttm_operation_ctx *ctx)
>>>>> -{
>>>>> -    struct ttm_device *bdev = bo->bdev;
>>>>> -    struct ttm_resource_manager *man;
>>>>> -    struct ww_acquire_ctx *ticket;
>>>>> -    int ret;
>>>>> -
>>>>> -    man = ttm_manager_type(bdev, place->mem_type);
>>>>> -    ticket = dma_resv_locking_ctx(bo->base.resv);
>>>>> -    do {
>>>>> -        ret = ttm_resource_alloc(bo, place, mem);
>>>>> -        if (likely(!ret))
>>>>> -            break;
>>>>> -        if (unlikely(ret != -ENOSPC))
>>>>> -            return ret;
>>>>> -        ret = ttm_mem_evict_first(bdev, man, place, ctx,
>>>>> -                      ticket);
>>>>> -        if (unlikely(ret != 0))
>>>>> -            return ret;
>>>>> -    } while (1);
>>>>> -
>>>>> -    return ttm_bo_add_move_fence(bo, man, *mem, ctx-
>>>>>> no_wait_gpu);
>>>>> -}
>>>>> -
>>>>>    /**
>>>>> - * ttm_bo_mem_space
>>>>> + * ttm_bo_alloc_resource - Allocate backing store for a BO
>>>>>     *
>>>>> - * @bo: Pointer to a struct ttm_buffer_object. the data of
>>>>> which
>>>>> - * we want to allocate space for.
>>>>> - * @placement: Proposed new placement for the buffer object.
>>>>> - * @mem: A struct ttm_resource.
>>>>> + * @bo: Pointer to a struct ttm_buffer_object of which we want
>>>>> a
>>>>> resource for
>>>>> + * @placement: Proposed new placement for the buffer object
>>>>>     * @ctx: if and how to sleep, lock buffers and alloc memory
>>>>> + * @force_space: If we should evict buffers to force space
>>>>> + * @res: The resulting struct ttm_resource.
>>>>>     *
>>>>> - * Allocate memory space for the buffer object pointed to by
>>>>> @bo,
>>>>> using
>>>>> - * the placement flags in @placement, potentially evicting
>>>>> other
>>>>> idle buffer objects.
>>>>> - * This function may sleep while waiting for space to become
>>>>> available.
>>>>> + * Allocates a resource for the buffer object pointed to by
>>>>> @bo,
>>>>> using the
>>>>> + * placement flags in @placement, potentially evicting other
>>>>> buffer
>>>>> objects when
>>>>> + * @force_space is true.
>>>>> + * This function may sleep while waiting for resources to
>>>>> become
>>>>> available.
>>>>>     * Returns:
>>>>> - * -EBUSY: No space available (only if no_wait == 1).
>>>>> + * -EBUSY: No space available (only if no_wait == true).
>>>>>     * -ENOSPC: Could not allocate space for the buffer object,
>>>>> either
>>>>> due to
>>>>>     * fragmentation or concurrent allocators.
>>>>>     * -ERESTARTSYS: An interruptible sleep was interrupted by a
>>>>> signal.
>>>>>     */
>>>>> -int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>>> -            struct ttm_placement *placement,
>>>>> -            struct ttm_resource **mem,
>>>>> -            struct ttm_operation_ctx *ctx)
>>>>> +static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>>>>> +                 struct ttm_placement *placement,
>>>>> +                 struct ttm_operation_ctx *ctx,
>>>>> +                 bool force_space,
>>>>> +                 struct ttm_resource **res)
>>>>>    {
>>>>>        struct ttm_device *bdev = bo->bdev;
>>>>> -    bool type_found = false;
>>>>> +    struct ww_acquire_ctx *ticket;
>>>>>        int i, ret;
>>>>>    +    ticket = dma_resv_locking_ctx(bo->base.resv);
>>>>>        ret = dma_resv_reserve_fences(bo->base.resv, 1);
>>>>>        if (unlikely(ret))
>>>>>            return ret;
>>>>> @@ -790,98 +762,73 @@ int ttm_bo_mem_space(struct
>>>>> ttm_buffer_object
>>>>> *bo,
>>>>>            const struct ttm_place *place = &placement-
>>>>>> placement[i];
>>>>>            struct ttm_resource_manager *man;
>>>>>    -        if (place->flags & TTM_PL_FLAG_FALLBACK)
>>>>> -            continue;
>>>>> -
>>>>>            man = ttm_manager_type(bdev, place->mem_type);
>>>>>            if (!man || !ttm_resource_manager_used(man))
>>>>>                continue;
>>>>>    -        type_found = true;
>>>>> -        ret = ttm_resource_alloc(bo, place, mem);
>>>>> -        if (ret == -ENOSPC)
>>>>> +        if (place->flags & (force_space ?
>>>>> TTM_PL_FLAG_DESIRED :
>>>>> +                    TTM_PL_FLAG_FALLBACK))
>>>>> +            continue;
>>>>> +
>>>>> +        do {
>>>>> +            ret = ttm_resource_alloc(bo, place, res);
>>>>> +            if (unlikely(ret != -ENOSPC))
>>>>> +                return ret;
>>>>> +            if (likely(!ret) || !force_space)
>>>>> +                break;
>>>>> +
>>>>> +            ret = ttm_mem_evict_first(bdev, man, place,
>>>>> ctx,
>>>>> +                          ticket);
>>>>> +            if (unlikely(ret == -EBUSY))
>>>>> +                break;
>>>>> +            if (unlikely(ret))
>>>>> +                return ret;
>>>>> +        } while (1);
>>>>> +        if (ret)
>>>>>                continue;
>>>>> -        if (unlikely(ret))
>>>>> -            goto error;
>>>>>    -        ret = ttm_bo_add_move_fence(bo, man, *mem, ctx-
>>>>>> no_wait_gpu);
>>>>> +        ret = ttm_bo_add_move_fence(bo, man, *res, ctx-
>>>>>> no_wait_gpu);
>>>>>            if (unlikely(ret)) {
>>>>> -            ttm_resource_free(bo, mem);
>>>>> +            ttm_resource_free(bo, res);
>>>>>                if (ret == -EBUSY)
>>>>>                    continue;
>>>>>    -            goto error;
>>>>> +            return ret;
>>>>>            }
>>>>>            return 0;
>>>>>        }
>>>>>    -    for (i = 0; i < placement->num_placement; ++i) {
>>>>> -        const struct ttm_place *place = &placement-
>>>>>> placement[i];
>>>>> -        struct ttm_resource_manager *man;
>>>>> -
>>>>> -        if (place->flags & TTM_PL_FLAG_DESIRED)
>>>>> -            continue;
>>>>> -
>>>>> -        man = ttm_manager_type(bdev, place->mem_type);
>>>>> -        if (!man || !ttm_resource_manager_used(man))
>>>>> -            continue;
>>>>> -
>>>>> -        type_found = true;
>>>>> -        ret = ttm_bo_mem_force_space(bo, place, mem, ctx);
>>>>> -        if (likely(!ret))
>>>>> -            return 0;
>>>>> -
>>>>> -        if (ret && ret != -EBUSY)
>>>>> -            goto error;
>>>>> -    }
>>>>> -
>>>>> -    ret = -ENOSPC;
>>>>> -    if (!type_found) {
>>>>> -        pr_err(TTM_PFX "No compatible memory type found\n");
>>>>> -        ret = -EINVAL;
>>>>> -    }
>>>>> -
>>>>> -error:
>>>>> -    return ret;
>>>>> +    return -ENOSPC;
>>>>>    }
>>>>> -EXPORT_SYMBOL(ttm_bo_mem_space);
>>>>>    -static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>>>>> -                  struct ttm_placement *placement,
>>>>> -                  struct ttm_operation_ctx *ctx)
>>>>> +/*
>>>>> + * ttm_bo_mem_space - Wrapper around ttm_bo_alloc_resource
>>>>> + *
>>>>> + * @bo: Pointer to a struct ttm_buffer_object of which we want
>>>>> a
>>>>> resource for
>>>>> + * @placement: Proposed new placement for the buffer object
>>>>> + * @res: The resulting struct ttm_resource.
>>>>> + * @ctx: if and how to sleep, lock buffers and alloc memory
>>>>> + *
>>>>> + * Tries both idle allocation and forcefully eviction of
>>>>> buffers.
>>>>> See
>>>>> + * ttm_bo_alloc_resource for details.
>>>>> + */
>>>>> +int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>>> +             struct ttm_placement *placement,
>>>>> +             struct ttm_resource **res,
>>>>> +             struct ttm_operation_ctx *ctx)
>>>>>    {
>>>>> -    struct ttm_resource *mem;
>>>>> -    struct ttm_place hop;
>>>>> +    bool force_space = false;
>>>>>        int ret;
>>>>>    -    dma_resv_assert_held(bo->base.resv);
>>>>> +    do {
>>>>> +        ret = ttm_bo_alloc_resource(bo, placement, ctx,
>>>>> +                        force_space, res);
>>>>> +        force_space = !force_space;
>>>>> +    } while (ret == -ENOSPC && force_space);
>>>>>    -    /*
>>>>> -     * Determine where to move the buffer.
>>>>> -     *
>>>>> -     * If driver determines move is going to need
>>>>> -     * an extra step then it will return -EMULTIHOP
>>>>> -     * and the buffer will be moved to the temporary
>>>>> -     * stop and the driver will be called to make
>>>>> -     * the second hop.
>>>>> -     */
>>>>> -    ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
>>>>> -    if (ret)
>>>>> -        return ret;
>>>>> -bounce:
>>>>> -    ret = ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
>>>>> -    if (ret == -EMULTIHOP) {
>>>>> -        ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx,
>>>>> &hop);
>>>>> -        if (ret)
>>>>> -            goto out;
>>>>> -        /* try and move to final place now. */
>>>>> -        goto bounce;
>>>>> -    }
>>>>> -out:
>>>>> -    if (ret)
>>>>> -        ttm_resource_free(bo, &mem);
>>>>>        return ret;
>>>>>    }
>>>>> +EXPORT_SYMBOL(ttm_bo_mem_space);
>>>>>      /**
>>>>>     * ttm_bo_validate
>>>>> @@ -902,6 +849,9 @@ int ttm_bo_validate(struct
>>>>> ttm_buffer_object *bo,
>>>>>                struct ttm_placement *placement,
>>>>>                struct ttm_operation_ctx *ctx)
>>>>>    {
>>>>> +    struct ttm_resource *res;
>>>>> +    struct ttm_place hop;
>>>>> +    bool force_space;
>>>>>        int ret;
>>>>>          dma_resv_assert_held(bo->base.resv);
>>>>> @@ -912,20 +862,53 @@ int ttm_bo_validate(struct
>>>>> ttm_buffer_object
>>>>> *bo,
>>>>>        if (!placement->num_placement)
>>>>>            return ttm_bo_pipeline_gutting(bo);
>>>>>    -    /* Check whether we need to move buffer. */
>>>>> -    if (bo->resource && ttm_resource_compatible(bo->resource,
>>>>> placement))
>>>>> -        return 0;
>>>>> +    force_space = false;
>>>>> +    do {
>>>>> +        /* Check whether we need to move buffer. */
>>>>> +        if (bo->resource &&
>>>>> +            ttm_resource_compatible(bo->resource, placement,
>>>>> +                        force_space))
>>>>> +            return 0;
>>>>>    -    /* Moving of pinned BOs is forbidden */
>>>>> -    if (bo->pin_count)
>>>>> -        return -EINVAL;
>>>>> +        /* Moving of pinned BOs is forbidden */
>>>>> +        if (bo->pin_count)
>>>>> +            return -EINVAL;
>>>>> +
>>>>> +        /*
>>>>> +         * Determine where to move the buffer.
>>>>> +         *
>>>>> +         * If driver determines move is going to need
>>>>> +         * an extra step then it will return -EMULTIHOP
>>>>> +         * and the buffer will be moved to the temporary
>>>>> +         * stop and the driver will be called to make
>>>>> +         * the second hop.
>>>>> +         */
>>>>> +        ret = ttm_bo_alloc_resource(bo, placement, ctx,
>>>>> force_space,
>>>>> +                        &res);
>>>>> +        force_space = !force_space;
>>>>> +        if (ret == -ENOSPC)
>>>>> +            continue;
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +
>>>>> +bounce:
>>>>> +        ret = ttm_bo_handle_move_mem(bo, res, false, ctx,
>>>>> &hop);
>>>>> +        if (ret == -EMULTIHOP) {
>>>>> +            ret = ttm_bo_bounce_temp_buffer(bo, &res,
>>>>> ctx, &hop);
>>>>> +            /* try and move to final place now. */
>>>>> +            if (!ret)
>>>>> +                goto bounce;
>>>>> +        }
>>>>> +        if (ret) {
>>>>> +            ttm_resource_free(bo, &res);
>>>>> +            return ret;
>>>>> +        }
>>>>> +
>>>>> +    } while (ret && force_space);
>>>>>    -    ret = ttm_bo_move_buffer(bo, placement, ctx);
>>>>>        /* For backward compatibility with userspace */
>>>>>        if (ret == -ENOSPC)
>>>>>            return -ENOMEM;
>>>>> -    if (ret)
>>>>> -        return ret;
>>>>>          /*
>>>>>         * We might need to add a TTM.
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> index fb14f7716cf8..65155f2013ca 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>> @@ -295,11 +295,13 @@ bool ttm_resource_intersects(struct
>>>>> ttm_device
>>>>> *bdev,
>>>>>     *
>>>>>     * @res: the resource to check
>>>>>     * @placement: the placement to check against
>>>>> + * @evicting: true if the caller is doing evictions
>>>>>     *
>>>>>     * Returns true if the placement is compatible.
>>>>>     */
>>>>>    bool ttm_resource_compatible(struct ttm_resource *res,
>>>>> -                 struct ttm_placement *placement)
>>>>> +                 struct ttm_placement *placement,
>>>>> +                 bool evicting)
>>>>>    {
>>>>>        struct ttm_buffer_object *bo = res->bo;
>>>>>        struct ttm_device *bdev = bo->bdev;
>>>>> @@ -315,14 +317,20 @@ bool ttm_resource_compatible(struct
>>>>> ttm_resource *res,
>>>>>            if (res->mem_type != place->mem_type)
>>>>>                continue;
>>>>>    +        if (place->flags & (evicting ? TTM_PL_FLAG_DESIRED :
>>>>> +                    TTM_PL_FLAG_FALLBACK))
>>>>> +            continue;
>>>>> +
>>>>> +        if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
>>>>> +            !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
>>>>> +            continue;
>>>>> +
>>>>>            man = ttm_manager_type(bdev, res->mem_type);
>>>>>            if (man->func->compatible &&
>>>>>                !man->func->compatible(man, res, place, bo-
>>>>>> base.size))
>>>>>                continue;
>>>>>    -        if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
>>>>> -             (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
>>>>> -            return true;
>>>>> +        return true;
>>>>>        }
>>>>>        return false;
>>>>>    }
>>>>> diff --git a/include/drm/ttm/ttm_resource.h
>>>>> b/include/drm/ttm/ttm_resource.h
>>>>> index 1afa13f0c22b..7561023db43d 100644
>>>>> --- a/include/drm/ttm/ttm_resource.h
>>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>>> @@ -366,7 +366,8 @@ bool ttm_resource_intersects(struct
>>>>> ttm_device
>>>>> *bdev,
>>>>>                     const struct ttm_place *place,
>>>>>                     size_t size);
>>>>>    bool ttm_resource_compatible(struct ttm_resource *res,
>>>>> -                 struct ttm_placement *placement);
>>>>> +                 struct ttm_placement *placement,
>>>>> +                 bool evicting);
>>>>>    void ttm_resource_set_bo(struct ttm_resource *res,
>>>>>                 struct ttm_buffer_object *bo);
>>>
>>
> 
