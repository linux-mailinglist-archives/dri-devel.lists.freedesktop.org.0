Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BB73FBA8E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8EE89CDD;
	Mon, 30 Aug 2021 17:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C089CDD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 17:02:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so15200243wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=D+Nad5OlsBSS16xoLQublD0ghsL11extwJCEgynH9MU=;
 b=vhyfyoi3TzT04nzr43jRN47fl8SNnpoyV+UqsFka6SM1Kwzcxbf8f9BX895v1C5TCb
 j7UI3IuZ8/0Y1vXYFmDkkoxSSN/x8FzRHzIy2qzZz4tPToO2klOUDtF+5Y2957WpJcfN
 vpGtrvpqRwH/Yfcrse0NTzmzsb1YxamOmn0f1/yGdNtey+j7wW9sdgVmqTh/I2gjfIHM
 aemmQKbaNVE37KLQE/r4yd/oMs20d8WABZCIeOccrIPy6TkmVbum8Voho4emxvZVrrcS
 PTQs89vw3iuD2gXLbBFbdmMTrlT8QX7QvYJHZhsrwDzzTuM7QM4/sc6iqXIw0dDgCOX0
 SESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D+Nad5OlsBSS16xoLQublD0ghsL11extwJCEgynH9MU=;
 b=EnOnNVvt12eL3Ix330BLAnTU7eRfRDYvP2Y0GuC70wfpmbeHKw9vwb90IUBAgi/He5
 9+scGHRl9dwKVFAfxELPTiiBZ3OPQYQRDw6nqcKeqyQ0P+bBq15Z4JcbFYi1KSLqbf4i
 2wmtWAjEI+Q4+XmGPUJtd9b+kQ6jOYiLdmlHLTW++Rz3yK7sdQZkexGNvctB4mOzXurZ
 B6zbawbYuS7js8FCSLo44pEykxDQTU492R85mUnCuWoT5ha7Nl8qxjH2jw6OsbicQsWd
 j3cPlyrr5lk3ggjfh1dRF9s14ftltjD6dACQsivGu30XBuI+PYKMJE9DUEA37zH22Xh7
 LaXA==
X-Gm-Message-State: AOAM532I55ZzKVxKKJZDxTp3B2ZItO+spm4wq/ULO9rhD+KcgyO1WX0c
 nHO9uz/eGHaCA/PiGrX4rowObDE+vlY=
X-Google-Smtp-Source: ABdhPJxREpGIdt/28dn1GPKDOUra7LyTyAIx0yjxTo9q0IOTWxGHmR4pNPlqGEAc1zYkgkTx+nOhPA==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr21131wmj.127.1630342973520;
 Mon, 30 Aug 2021 10:02:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1cdb:22e7:b4cc:b339?
 ([2a02:908:1252:fb60:1cdb:22e7:b4cc:b339])
 by smtp.gmail.com with ESMTPSA id d9sm19696363wrb.36.2021.08.30.10.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 10:02:53 -0700 (PDT)
Subject: Re: [PATCH 05/12] drm/ttm: move the LRU into resource handling
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20210830085707.209508-1-christian.koenig@amd.com>
 <20210830085707.209508-5-christian.koenig@amd.com>
 <5a3d0707-bd54-cf26-32d7-489e1ca83aa2@amd.com>
 <c489c547-0164-15b5-e129-f4d08bd4756d@gmail.com>
 <2fce2eb0-e8b6-a830-d3a8-cc373528aaee@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5795827b-04d3-3f83-e112-9108640ea301@gmail.com>
Date: Mon, 30 Aug 2021 19:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2fce2eb0-e8b6-a830-d3a8-cc373528aaee@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Am 30.08.21 um 19:00 schrieb Andrey Grodzovsky:
>
> On 2021-08-30 12:55 p.m., Christian König wrote:
>> Am 30.08.21 um 18:53 schrieb Andrey Grodzovsky:
>>>
>>> On 2021-08-30 4:57 a.m., Christian König wrote:
>>>> This way we finally fix the problem that new resource are
>>>> not immediately evict-able after allocation.
>>>>
>>>> That has caused numerous problems including OOM on GDS handling
>>>> and not being able to use TTM as general resource manager.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
>>>>   drivers/gpu/drm/ttm/ttm_bo.c            | 105 ++------------------
>>>>   drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
>>>>   drivers/gpu/drm/ttm/ttm_device.c        |   8 +-
>>>>   drivers/gpu/drm/ttm/ttm_resource.c      | 127 
>>>> ++++++++++++++++++++++++
>>>>   include/drm/ttm/ttm_bo_api.h            |  16 ---
>>>>   include/drm/ttm/ttm_bo_driver.h         |  29 +-----
>>>>   include/drm/ttm/ttm_resource.h          |  35 +++++++
>>>>   9 files changed, 181 insertions(+), 150 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> index 6362e861a3f5..70d2cbb1dbb4 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> @@ -683,12 +683,12 @@ void amdgpu_vm_move_to_lru_tail(struct 
>>>> amdgpu_device *adev,
>>>>         if (vm->bulk_moveable) {
>>>>           spin_lock(&adev->mman.bdev.lru_lock);
>>>> - ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
>>>> +        ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>>>>           spin_unlock(&adev->mman.bdev.lru_lock);
>>>>           return;
>>>>       }
>>>>   -    memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
>>>> +    ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>>>         spin_lock(&adev->mman.bdev.lru_lock);
>>>>       list_for_each_entry(bo_base, &vm->idle, vm_status) {
>>>> @@ -698,11 +698,9 @@ void amdgpu_vm_move_to_lru_tail(struct 
>>>> amdgpu_device *adev,
>>>>           if (!bo->parent)
>>>>               continue;
>>>>   -        ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
>>>> -                    &vm->lru_bulk_move);
>>>> +        ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
>>>>           if (shadow)
>>>>               ttm_bo_move_to_lru_tail(&shadow->tbo,
>>>> -                        shadow->tbo.resource,
>>>>                           &vm->lru_bulk_move);
>>>>       }
>>>>       spin_unlock(&adev->mman.bdev.lru_lock);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> index e646aac9d7a4..41f0de841d72 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>> @@ -471,7 +471,7 @@ static void i915_ttm_adjust_lru(struct 
>>>> drm_i915_gem_object *obj)
>>>>               bo->priority = I915_TTM_PRIO_NO_PAGES;
>>>>       }
>>>>   -    ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>>> +    ttm_bo_move_to_lru_tail(bo, NULL);
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>   }
>>>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 49f4bc97c35a..d5c6e096fd31 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -69,98 +69,16 @@ static void ttm_bo_mem_space_debug(struct 
>>>> ttm_buffer_object *bo,
>>>>       }
>>>>   }
>>>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>>> -{
>>>> -    struct ttm_device *bdev = bo->bdev;
>>>> -
>>>> -    list_del_init(&bo->lru);
>>>> -
>>>> -    if (bdev->funcs->del_from_lru_notify)
>>>> -        bdev->funcs->del_from_lru_notify(bo);
>>>> -}
>>>> -
>>>> -static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos 
>>>> *pos,
>>>> -                     struct ttm_buffer_object *bo)
>>>> -{
>>>> -    if (!pos->first)
>>>> -        pos->first = bo;
>>>> -    pos->last = bo;
>>>> -}
>>>> -
>>>>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>>>> -                 struct ttm_resource *mem,
>>>>                    struct ttm_lru_bulk_move *bulk)
>>>>   {
>>>> -    struct ttm_device *bdev = bo->bdev;
>>>> -    struct ttm_resource_manager *man;
>>>> -
>>>> -    if (!bo->deleted)
>>>> -        dma_resv_assert_held(bo->base.resv);
>>>> -
>>>> -    if (bo->pin_count) {
>>>> -        ttm_bo_del_from_lru(bo);
>>>> -        return;
>>>> -    }
>>>> -
>>>> -    if (!mem)
>>>> -        return;
>>>> -
>>>> -    man = ttm_manager_type(bdev, mem->mem_type);
>>>> -    list_move_tail(&bo->lru, &man->lru[bo->priority]);
>>>> -
>>>> -    if (bdev->funcs->del_from_lru_notify)
>>>> -        bdev->funcs->del_from_lru_notify(bo);
>>>> -
>>>> -    if (bulk && !bo->pin_count) {
>>>> -        switch (bo->resource->mem_type) {
>>>> -        case TTM_PL_TT:
>>>> - ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
>>>> -            break;
>>>> +    dma_resv_assert_held(bo->base.resv);
>>>>   -        case TTM_PL_VRAM:
>>>> - ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
>>>> -            break;
>>>> -        }
>>>> -    }
>>>> +    if (bo->resource)
>>>> +        ttm_resource_move_to_lru_tail(bo->resource, bulk);
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
>>>>   -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
>>>> -{
>>>> -    unsigned i;
>>>> -
>>>> -    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>>> -        struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
>>>> -        struct ttm_resource_manager *man;
>>>> -
>>>> -        if (!pos->first)
>>>> -            continue;
>>>> -
>>>> -        dma_resv_assert_held(pos->first->base.resv);
>>>> -        dma_resv_assert_held(pos->last->base.resv);
>>>> -
>>>> -        man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
>>>> -        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>>> -                    &pos->last->lru);
>>>> -    }
>>>> -
>>>> -    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>>> -        struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
>>>> -        struct ttm_resource_manager *man;
>>>> -
>>>> -        if (!pos->first)
>>>> -            continue;
>>>> -
>>>> -        dma_resv_assert_held(pos->first->base.resv);
>>>> -        dma_resv_assert_held(pos->last->base.resv);
>>>> -
>>>> -        man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
>>>> -        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>>> -                    &pos->last->lru);
>>>> -    }
>>>> -}
>>>> -EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>>>> -
>>>>   static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>>>>                     struct ttm_resource *mem, bool evict,
>>>>                     struct ttm_operation_ctx *ctx,
>>>> @@ -342,7 +260,6 @@ static int ttm_bo_cleanup_refs(struct 
>>>> ttm_buffer_object *bo,
>>>>           return ret;
>>>>       }
>>>>   -    ttm_bo_del_from_lru(bo);
>>>
>>>
>>> Here and in other places this was removed, I assume ttm_resource_fini
>>> should replace it but I don't see where exactly this takes place.
>>
>> Take a look at function ttm_resource_fini().
>>
>> Christian.
>
>
> What I mean is that I don't see where ttm_resource_fini will be called to
> compensate for removal of  ttm_bo_del_from_lru here.

That always called during normal resource destruction, e.g. when we move 
a BO from A to B or destroy a BO.

Otherwise we would leak memory and notice really fast.

Christian.

>
> Andrey
>
>
>>
>>>
>>> Andrey
>>>
>>>
>>>> list_del_init(&bo->ddestroy);
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>       ttm_bo_cleanup_memtype_use(bo);
>>>> @@ -443,7 +360,7 @@ static void ttm_bo_release(struct kref *kref)
>>>>            */
>>>>           if (bo->pin_count) {
>>>>               bo->pin_count = 0;
>>>> -            ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>>> +            ttm_resource_move_to_lru_tail(bo->resource, NULL);
>>>>           }
>>>>             kref_init(&bo->kref);
>>>> @@ -456,7 +373,6 @@ static void ttm_bo_release(struct kref *kref)
>>>>       }
>>>>         spin_lock(&bo->bdev->lru_lock);
>>>> -    ttm_bo_del_from_lru(bo);
>>>>       list_del(&bo->ddestroy);
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>   @@ -670,15 +586,17 @@ int ttm_mem_evict_first(struct ttm_device 
>>>> *bdev,
>>>>               struct ww_acquire_ctx *ticket)
>>>>   {
>>>>       struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
>>>> +    struct ttm_resource *res;
>>>>       bool locked = false;
>>>>       unsigned i;
>>>>       int ret;
>>>>         spin_lock(&bdev->lru_lock);
>>>>       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>>> -        list_for_each_entry(bo, &man->lru[i], lru) {
>>>> +        list_for_each_entry(res, &man->lru[i], lru) {
>>>>               bool busy;
>>>>   +            bo = res->bo;
>>>>               if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
>>>>                                   &locked, &busy)) {
>>>>                   if (busy && !busy_bo && ticket !=
>>>> @@ -696,7 +614,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>>           }
>>>>             /* If the inner loop terminated early, we have our 
>>>> candidate */
>>>> -        if (&bo->lru != &man->lru[i])
>>>> +        if (&res->lru != &man->lru[i])
>>>>               break;
>>>>             bo = NULL;
>>>> @@ -870,9 +788,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>>       }
>>>>     error:
>>>> -    if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
>>>> -        ttm_bo_move_to_lru_tail_unlocked(bo);
>>>> -
>>>>       return ret;
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_bo_mem_space);
>>>> @@ -1012,7 +927,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>>>       bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
>>>>         kref_init(&bo->kref);
>>>> -    INIT_LIST_HEAD(&bo->lru);
>>>>       INIT_LIST_HEAD(&bo->ddestroy);
>>>>       bo->bdev = bdev;
>>>>       bo->type = type;
>>>> @@ -1062,8 +976,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>>>           return ret;
>>>>       }
>>>>   -    ttm_bo_move_to_lru_tail_unlocked(bo);
>>>> -
>>>>       return ret;
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_bo_init_reserved);
>>>> @@ -1165,7 +1077,6 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>           return 0;
>>>>       }
>>>>   -    ttm_bo_del_from_lru(bo);
>>>>       /* TODO: Cleanup the locking */
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index c5d02edaefc0..49b4bedf8715 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -232,7 +232,6 @@ static int ttm_buffer_object_transfer(struct 
>>>> ttm_buffer_object *bo,
>>>>         atomic_inc(&ttm_glob.bo_count);
>>>>       INIT_LIST_HEAD(&fbo->base.ddestroy);
>>>> -    INIT_LIST_HEAD(&fbo->base.lru);
>>>>       fbo->base.moving = NULL;
>>>>       drm_vma_node_reset(&fbo->base.base.vma_node);
>>>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>> index 519deea8e39b..9e0dfceff68c 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>> @@ -134,6 +134,7 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>>>> struct ttm_operation_ctx *ctx,
>>>>   {
>>>>       struct ttm_resource_manager *man;
>>>>       struct ttm_buffer_object *bo;
>>>> +    struct ttm_resource *res;
>>>>       unsigned i, j;
>>>>       int ret;
>>>>   @@ -144,8 +145,11 @@ int ttm_device_swapout(struct ttm_device 
>>>> *bdev, struct ttm_operation_ctx *ctx,
>>>>               continue;
>>>>             for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>>> -            list_for_each_entry(bo, &man->lru[j], lru) {
>>>> -                uint32_t num_pages = PFN_UP(bo->base.size);
>>>> +            list_for_each_entry(res, &man->lru[j], lru) {
>>>> +                uint32_t num_pages;
>>>> +
>>>> +                bo = res->bo;
>>>> +                num_pages = PFN_UP(bo->base.size);
>>>>                     ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>>>                   /* ttm_bo_swapout has dropped the lru_lock */
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index 426e6841fc89..355c542758b5 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -29,6 +29,115 @@
>>>>   #include <drm/ttm/ttm_resource.h>
>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>   +/**
>>>> + * ttm_lru_bulk_move_init - initialize a bulk move structure
>>>> + * @bulk: the structure to init
>>>> + *
>>>> + * For now just memset the structure to zero.
>>>> + */
>>>> +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>>>> +{
>>>> +    memset(bulk, 0, sizeof(*bulk));
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>>>> +
>>>> +/**
>>>> + * ttm_lru_bulk_move_tail
>>>> + *
>>>> + * @bulk: bulk move structure
>>>> + *
>>>> + * Bulk move BOs to the LRU tail, only valid to use when driver 
>>>> makes sure that
>>>> + * resource order never changes. Should be called with 
>>>> ttm_device::lru_lock held.
>>>> + */
>>>> +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>>>> +{
>>>> +    unsigned i;
>>>> +
>>>> +    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>>> +        struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
>>>> +        struct ttm_resource_manager *man;
>>>> +
>>>> +        if (!pos->first)
>>>> +            continue;
>>>> +
>>>> + dma_resv_assert_held(pos->first->bo->base.resv);
>>>> + dma_resv_assert_held(pos->last->bo->base.resv);
>>>> +
>>>> +        man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
>>>> +        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>>> +                    &pos->last->lru);
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>>> +        struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
>>>> +        struct ttm_resource_manager *man;
>>>> +
>>>> +        if (!pos->first)
>>>> +            continue;
>>>> +
>>>> + dma_resv_assert_held(pos->first->bo->base.resv);
>>>> + dma_resv_assert_held(pos->last->bo->base.resv);
>>>> +
>>>> +        man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
>>>> +        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>>> +                    &pos->last->lru);
>>>> +    }
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
>>>> +
>>>> +/* Record a resource position in a bulk move structure */
>>>> +static void ttm_lru_bulk_move_set_pos(struct ttm_lru_bulk_move_pos 
>>>> *pos,
>>>> +                      struct ttm_resource *res)
>>>> +{
>>>> +    if (!pos->first)
>>>> +        pos->first = res;
>>>> +    pos->last = res;
>>>> +}
>>>> +
>>>> +/* Remove a resource from the LRU */
>>>> +static void ttm_resource_del_from_lru(struct ttm_resource *res)
>>>> +{
>>>> +    struct ttm_device *bdev = res->bo->bdev;
>>>> +
>>>> +    list_del_init(&res->lru);
>>>> +
>>>> +    if (bdev->funcs->del_from_lru_notify)
>>>> +        bdev->funcs->del_from_lru_notify(res->bo);
>>>> +}
>>>> +
>>>> +/* Move a resource to the LRU tail and track the bulk position */
>>>> +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>>>> +                   struct ttm_lru_bulk_move *bulk)
>>>> +{
>>>> +    struct ttm_buffer_object *bo = res->bo;
>>>> +    struct ttm_device *bdev = bo->bdev;
>>>> +    struct ttm_resource_manager *man;
>>>> +
>>>> +    if (bo->pin_count) {
>>>> +        ttm_resource_del_from_lru(res);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    man = ttm_manager_type(bdev, res->mem_type);
>>>> +    list_move_tail(&res->lru, &man->lru[bo->priority]);
>>>> +
>>>> +    if (bdev->funcs->del_from_lru_notify)
>>>> +        bdev->funcs->del_from_lru_notify(bo);
>>>> +
>>>> +    if (!bulk)
>>>> +        return;
>>>> +
>>>> +    switch (res->mem_type) {
>>>> +    case TTM_PL_TT:
>>>> + ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
>>>> +        break;
>>>> +
>>>> +    case TTM_PL_VRAM:
>>>> + ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>>>                          const struct ttm_place *place,
>>>>                          struct ttm_resource *res)
>>>> @@ -44,15 +153,33 @@ void ttm_resource_init(struct 
>>>> ttm_buffer_object *bo,
>>>>       res->bus.is_iomem = false;
>>>>       res->bus.caching = ttm_cached;
>>>>       res->bo = bo;
>>>> +    INIT_LIST_HEAD(&res->lru);
>>>>         man = ttm_manager_type(bo->bdev, place->mem_type);
>>>>       atomic64_add(bo->base.size, &man->usage);
>>>> +
>>>> +    spin_lock(&bo->bdev->lru_lock);
>>>> +    ttm_resource_move_to_lru_tail(res, NULL);
>>>> +    spin_unlock(&bo->bdev->lru_lock);
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_resource_init);
>>>>   +/**
>>>> + * ttm_resource_fini
>>>> + *
>>>> + * @res: the resource to clean up
>>>> + *
>>>> + * Make sure the resource is removed from the LRU before destruction.
>>>> + */
>>>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>>>                  struct ttm_resource *res)
>>>>   {
>>>> +    struct ttm_device *bdev = res->bo->bdev;
>>>> +
>>>> +    spin_lock(&bdev->lru_lock);
>>>> +    ttm_resource_del_from_lru(res);
>>>> +    spin_unlock(&bdev->lru_lock);
>>>> +
>>>>       atomic64_sub(res->bo->base.size, &man->usage);
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_resource_fini);
>>>> diff --git a/include/drm/ttm/ttm_bo_api.h 
>>>> b/include/drm/ttm/ttm_bo_api.h
>>>> index f681bbdbc698..0928d8cfb45a 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -56,8 +56,6 @@ struct ttm_placement;
>>>>     struct ttm_place;
>>>>   -struct ttm_lru_bulk_move;
>>>> -
>>>>   /**
>>>>    * enum ttm_bo_type
>>>>    *
>>>> @@ -95,7 +93,6 @@ struct ttm_tt;
>>>>    * @ttm: TTM structure holding system pages.
>>>>    * @evicted: Whether the object was evicted without user-space 
>>>> knowing.
>>>>    * @deleted: True if the object is only a zombie and already 
>>>> deleted.
>>>> - * @lru: List head for the lru list.
>>>>    * @ddestroy: List head for the delayed destroy list.
>>>>    * @swap: List head for swap LRU list.
>>>>    * @moving: Fence set when BO is moving
>>>> @@ -144,7 +141,6 @@ struct ttm_buffer_object {
>>>>        * Members protected by the bdev::lru_lock.
>>>>        */
>>>>   -    struct list_head lru;
>>>>       struct list_head ddestroy;
>>>>         /**
>>>> @@ -308,7 +304,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>>>    * ttm_bo_move_to_lru_tail
>>>>    *
>>>>    * @bo: The buffer object.
>>>> - * @mem: Resource object.
>>>>    * @bulk: optional bulk move structure to remember BO positions
>>>>    *
>>>>    * Move this BO to the tail of all lru lists used to lookup and 
>>>> reserve an
>>>> @@ -316,19 +311,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>>>    * held, and is used to make a BO less likely to be considered 
>>>> for eviction.
>>>>    */
>>>>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>>>> -                 struct ttm_resource *mem,
>>>>                    struct ttm_lru_bulk_move *bulk);
>>>>   -/**
>>>> - * ttm_bo_bulk_move_lru_tail
>>>> - *
>>>> - * @bulk: bulk move structure
>>>> - *
>>>> - * Bulk move BOs to the LRU tail, only valid to use when driver 
>>>> makes sure that
>>>> - * BO order never changes. Should be called with 
>>>> ttm_global::lru_lock held.
>>>> - */
>>>> -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
>>>> -
>>>>   /**
>>>>    * ttm_bo_lock_delayed_workqueue
>>>>    *
>>>> diff --git a/include/drm/ttm/ttm_bo_driver.h 
>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>> index 68d6069572aa..fba2f7d3d34e 100644
>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>> @@ -45,33 +45,6 @@
>>>>   #include "ttm_tt.h"
>>>>   #include "ttm_pool.h"
>>>>   -/**
>>>> - * struct ttm_lru_bulk_move_pos
>>>> - *
>>>> - * @first: first BO in the bulk move range
>>>> - * @last: last BO in the bulk move range
>>>> - *
>>>> - * Positions for a lru bulk move.
>>>> - */
>>>> -struct ttm_lru_bulk_move_pos {
>>>> -    struct ttm_buffer_object *first;
>>>> -    struct ttm_buffer_object *last;
>>>> -};
>>>> -
>>>> -/**
>>>> - * struct ttm_lru_bulk_move
>>>> - *
>>>> - * @tt: first/last lru entry for BOs in the TT domain
>>>> - * @vram: first/last lru entry for BOs in the VRAM domain
>>>> - * @swap: first/last lru entry for BOs on the swap list
>>>> - *
>>>> - * Helper structure for bulk moves on the LRU list.
>>>> - */
>>>> -struct ttm_lru_bulk_move {
>>>> -    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>>>> -    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>>> -};
>>>> -
>>>>   /*
>>>>    * ttm_bo.c
>>>>    */
>>>> @@ -182,7 +155,7 @@ static inline void
>>>>   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>>>>   {
>>>>       spin_lock(&bo->bdev->lru_lock);
>>>> -    ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>>> +    ttm_bo_move_to_lru_tail(bo, NULL);
>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>   }
>>>>   diff --git a/include/drm/ttm/ttm_resource.h 
>>>> b/include/drm/ttm/ttm_resource.h
>>>> index 526fe359c603..5f9797f9d64a 100644
>>>> --- a/include/drm/ttm/ttm_resource.h
>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>> @@ -26,10 +26,12 @@
>>>>   #define _TTM_RESOURCE_H_
>>>>     #include <linux/types.h>
>>>> +#include <linux/list.h>
>>>>   #include <linux/mutex.h>
>>>>   #include <linux/atomic.h>
>>>>   #include <linux/dma-buf-map.h>
>>>>   #include <linux/dma-fence.h>
>>>> +
>>>>   #include <drm/drm_print.h>
>>>>   #include <drm/ttm/ttm_caching.h>
>>>>   #include <drm/ttm/ttm_kmap_iter.h>
>>>> @@ -177,6 +179,33 @@ struct ttm_resource {
>>>>       uint32_t placement;
>>>>       struct ttm_bus_placement bus;
>>>>       struct ttm_buffer_object *bo;
>>>> +    struct list_head lru;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct ttm_lru_bulk_move_pos
>>>> + *
>>>> + * @first: first res in the bulk move range
>>>> + * @last: last res in the bulk move range
>>>> + *
>>>> + * Positions for a lru bulk move.
>>>> + */
>>>> +struct ttm_lru_bulk_move_pos {
>>>> +    struct ttm_resource *first;
>>>> +    struct ttm_resource *last;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct ttm_lru_bulk_move
>>>> + *
>>>> + * @tt: first/last lru entry for resources in the TT domain
>>>> + * @vram: first/last lru entry for resources in the VRAM domain
>>>> + *
>>>> + * Helper structure for bulk moves on the LRU list.
>>>> + */
>>>> +struct ttm_lru_bulk_move {
>>>> +    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>>>> +    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>>>   };
>>>>     /**
>>>> @@ -278,6 +307,12 @@ ttm_resource_manager_usage(struct 
>>>> ttm_resource_manager *man)
>>>>       return atomic64_read(&man->usage);
>>>>   }
>>>>   +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>>>> +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
>>>> +
>>>> +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>>>> +                   struct ttm_lru_bulk_move *bulk);
>>>> +
>>>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>>>                          const struct ttm_place *place,
>>>>                          struct ttm_resource *res);
>>

