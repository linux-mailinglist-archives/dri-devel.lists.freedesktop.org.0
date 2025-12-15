Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43870CBDD35
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E41010E38A;
	Mon, 15 Dec 2025 12:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="cHoCyfpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583F10E38A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:34:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so5187830a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 04:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765802077; x=1766406877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8/i1qNju9K5zECwfur3W8keJQC0TrioWbvreUe4OlCI=;
 b=cHoCyfpV6WLYJ31IGXaPF5TLV2/iatk/A8MTSsEylSlz5O3QYQA423KQt44dfvqF4p
 GbXiTjYHXLkSuK/jZfAQtiEI6cZTPs0ncJ/QoSe2hq7ABwU56xDtaG1DF7bLlx+gI0JG
 QJHghuW/tp07mvtdh9TaJGi8w5o6sR9ah7hPi4N1gi5FEKaGKYAyTWZSplT1cgLKdZy3
 +G7wDlrPQ9ZGVhdkIc/QG6hVKQ8NIxFxj9GhzMWhLvHFtQGUS6Z/gQl2DhZZlscNToHk
 0ArRuWY8SwSF5S6fnNteTd4TD3JJxMyoq68fVydyqGSmjVZQvpbGk4Amqmkcr+8MJ03f
 O3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765802077; x=1766406877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/i1qNju9K5zECwfur3W8keJQC0TrioWbvreUe4OlCI=;
 b=uATQ5KpekNFqBmtvkssznvgD3UpO4x9ClC/KcoqHiEFljlXoUD3rAkFV49NAlpUSAw
 fOLfruz8+IyjYu2WSKYWd5m6V7TCyCnKL6fqdFiRBzEWOZQUoVLNPFFv/C8zHGjTYLdd
 xPO2kSQp6BSwGEdP+lTuvTtNaK85OSvI59++m2z5MBdZ04BSEPrp+lSYPA7qXFfh3WU0
 vf+iW6Q0w0PuQtV4nFVSKOb6s4DXua2OHxSFhMH0WxqC0eLuZa3YUuhJTmge+suDTHQZ
 MBz1g5pBZwHayxVnknPD+BxvJGUIhPbHF1PXOloF/FRD8/WHvwmZDYUfLlYLfIdnSd4b
 w1LQ==
X-Gm-Message-State: AOJu0Yx7rwXqhEpiQjAsQOPm17gfbqmUpGrEGjc9KHWjIeyBwpshjC6i
 gfeU0mQh4DQCAdWk3uV4XZXUqehri2hMMpJjHvxPtPXlK/qV3EOU50wtrTmKlgmHBg8=
X-Gm-Gg: AY/fxX6EfOqtIOAgsT/6dduJOtm6oT4lk67YwJ1lQezo4U7zerjX7AxX7yM9BHTO2yz
 e46hD3n8UDgz/vsKOdHxo/fYQ6O6/SRzYjuhsPLCJG7arUKPpMAIqpsr/4cL/WtcJrWA/xhTRir
 4xFIMEaBiA7MlSemig5gy8f2WTnYwjBfGVjPgBjvximCi3QM73zEKwkpExJ4oEB9+7nu29Rpe5h
 kd2hU9BXQP/AdZPPVA8be7lMr3b3Q0HV9YU4ZyFcdwAwzM8oVbbmDGl5fu3yBB5f6zcZKkzTVMv
 73rJGJkWYwMaJcti4eSROAYUsLbJB8viXsc93yWCvIsMNJr1kbaugyxPP4WuWxmYH7bN6215z1Y
 Wmipbjeg6U1sDlmJefevdjO++v9gO6AwjMNuUUNJsp9e+9zFiVscOCc59VIdwya1thCYQ4j1ONu
 tCtMM5zBBzG1pfIeLNA+vY2/Udt1vCR6f9
X-Google-Smtp-Source: AGHT+IE5xmcBboZt1XorfOfkMbv6sG/vGdtTLmoF7pzL8nIird81E0XIr0M/HvhY2Nwn69Q1ww7TKA==
X-Received: by 2002:a05:6402:4407:b0:645:d34b:8166 with SMTP id
 4fb4d7f45d1cf-6499b3009abmr10238924a12.26.1765802076128; 
 Mon, 15 Dec 2025 04:34:36 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982040e2bsm13307367a12.6.2025.12.15.04.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 04:34:35 -0800 (PST)
Message-ID: <1ecc48a6-b653-4e75-86c8-d9517e03d13f@ursulin.net>
Date: Mon, 15 Dec 2025 12:34:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] drm/amdgpu: independence for the amdgpu_userq_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-16-christian.koenig@amd.com>
 <3276bb85-3bcc-4f55-95b1-4c05fe198d31@ursulin.net>
 <82a1a8d9-633e-4da4-aefc-1aa9266298ee@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <82a1a8d9-633e-4da4-aefc-1aa9266298ee@amd.com>
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


On 12/12/2025 15:46, Christian König wrote:
> On 12/11/25 17:12, Tvrtko Ursulin wrote:
>>
>> On 11/12/2025 13:16, Christian König wrote:
>>> This allows amdgpu_userq_fences to outlive the amdgpu module.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
>>>    .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
>>>    .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
>>>    3 files changed, 11 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 2dfbddcef9ab..f206297aae8b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -3155,11 +3155,7 @@ static int __init amdgpu_init(void)
>>>          r = amdgpu_sync_init();
>>>        if (r)
>>> -        goto error_sync;
>>> -
>>> -    r = amdgpu_userq_fence_slab_init();
>>> -    if (r)
>>> -        goto error_fence;
>>> +        return r;
>>>          DRM_INFO("amdgpu kernel modesetting enabled.\n");
>>>        amdgpu_register_atpx_handler();
>>> @@ -3176,12 +3172,6 @@ static int __init amdgpu_init(void)
>>>          /* let modprobe override vga console setting */
>>>        return pci_register_driver(&amdgpu_kms_pci_driver);
>>> -
>>> -error_fence:
>>> -    amdgpu_sync_fini();
>>> -
>>> -error_sync:
>>> -    return r;
>>>    }
>>>      static void __exit amdgpu_exit(void)
>>> @@ -3191,7 +3181,6 @@ static void __exit amdgpu_exit(void)
>>>        amdgpu_unregister_atpx_handler();
>>>        amdgpu_acpi_release();
>>>        amdgpu_sync_fini();
>>> -    amdgpu_userq_fence_slab_fini();
>>>        mmu_notifier_synchronize();
>>>        amdgpu_xcp_drv_release();
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> index eba9fb359047..bb19f72770b0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>> @@ -33,26 +33,6 @@
>>>    #include "amdgpu_userq_fence.h"
>>>      static const struct dma_fence_ops amdgpu_userq_fence_ops;
>>> -static struct kmem_cache *amdgpu_userq_fence_slab;
>>> -
>>> -int amdgpu_userq_fence_slab_init(void)
>>> -{
>>> -    amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
>>> -                            sizeof(struct amdgpu_userq_fence),
>>> -                            0,
>>> -                            SLAB_HWCACHE_ALIGN,
>>> -                            NULL);
>>> -    if (!amdgpu_userq_fence_slab)
>>> -        return -ENOMEM;
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -void amdgpu_userq_fence_slab_fini(void)
>>> -{
>>> -    rcu_barrier();
>>
>> What was this rcu_barrier() for? Cargo culted or more to it?
> 
> All dma_fences are RCU protected. When they are backed by a kmem_cache you need to make sure to wait for an RCU grace period to pass before destroying the kmem_cache.

You are right, on a deeper look the built-in protection inside 
kmem_cache_destroy() only handles the simple kfree_rcu() case and not 
arbitrary call_rcu() destructors.

> 
> Since the dma_fence framework now uses kfree_rcu that shouldn't be problematic any more.
> 
> 
>>> -    kmem_cache_destroy(amdgpu_userq_fence_slab);
>>> -}
>>>      static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
>>>    {
>>> @@ -227,7 +207,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
>>>      static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
>>>    {
>>> -    *userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
>>> +    *userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
>> This GFP_ATOMIC is suboptimal for sure being on the ioctl path. It is outside of the scope for this patch, but once my userq cleanup patches get reviewed next on my list was to try and understand this.
>>>        return *userq_fence ? 0 : -ENOMEM;
>>>    }
>>>    @@ -243,12 +223,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>>        if (!fence_drv)
>>>            return -EINVAL;
>>>    -    spin_lock_init(&userq_fence->lock);
>>>        INIT_LIST_HEAD(&userq_fence->link);
>>>        fence = &userq_fence->base;
>>>        userq_fence->fence_drv = fence_drv;
>>>    -    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
>>>                 fence_drv->context, seq);
>>>          amdgpu_userq_fence_driver_get(fence_drv);
>>> @@ -318,35 +297,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
>>>        rptr = amdgpu_userq_fence_read(fence_drv);
>>>        wptr = fence->base.seqno;
>>>    -    if (rptr >= wptr)
>>> +    if (rptr >= wptr) {
>>> +        amdgpu_userq_fence_driver_put(fence->fence_drv);
>>
>> fence_drv is in a local already.
>>
>>> +        fence->fence_drv = NULL;
>>
>> amdgpu_userq_fence_get_timeline_name could now oops somehow?
>>
>>> +
>>> +        kvfree(fence->fence_drv_array);
>>> +        fence->fence_drv_array = NULL;
>>
>> Not sure if this is safe either. amdgpu_userq_fence_driver_process() drops its reference before it unlinks the fence from the list. Can someone external trigger the fence_is_signaled check, before the interrupt processing kicks in, which will clear fence_drv_array, and so amdgpu_userq_fence_driver_process() would oops?
> 
> Oh, good question. I need to double check that.

Okay thanks, I will await the next re-spin.

Regards,

Tvrtko

>>
>>>            return true;
>>> +    }
>>>          return false;
>>>    }
>>>    -static void amdgpu_userq_fence_free(struct rcu_head *rcu)
>>> -{
>>> -    struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
>>> -    struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
>>> -    struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
>>> -
>>> -    /* Release the fence driver reference */
>>> -    amdgpu_userq_fence_driver_put(fence_drv);
>>> -
>>> -    kvfree(userq_fence->fence_drv_array);
>>> -    kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
>>> -}
>>> -
>>> -static void amdgpu_userq_fence_release(struct dma_fence *f)
>>> -{
>>> -    call_rcu(&f->rcu, amdgpu_userq_fence_free);
>>> -}
>>> -
>>>    static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>>        .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>>        .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>>        .signaled = amdgpu_userq_fence_signaled,
>>> -    .release = amdgpu_userq_fence_release,
>>>    };
>>>      /**
>>> @@ -560,7 +526,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>>>        r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
>>>        if (r) {
>>>            mutex_unlock(&userq_mgr->userq_mutex);
>>> -        kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
>>> +        kfree(userq_fence);
>>>            goto put_gobj_write;
>>>        }
>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>>> index d76add2afc77..6f04782f3ea9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
>>> @@ -31,11 +31,6 @@
>>>      struct amdgpu_userq_fence {
>>>        struct dma_fence base;
>>> -    /*
>>> -     * This lock is necessary to synchronize the
>>> -     * userqueue dma fence operations.
>>> -     */
>>> -    spinlock_t lock;
>>>        struct list_head link;
>>>        unsigned long fence_drv_array_count;
>>>        struct amdgpu_userq_fence_driver *fence_drv;
>>> @@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
>>>        char timeline_name[TASK_COMM_LEN];
>>>    };
>>>    -int amdgpu_userq_fence_slab_init(void);
>>> -void amdgpu_userq_fence_slab_fini(void);
>>> -
>>>    void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
>>>    void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
>>>    int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
>>
> 

