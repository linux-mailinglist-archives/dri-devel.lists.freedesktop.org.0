Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BF1CBD2AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E8910E3B4;
	Mon, 15 Dec 2025 09:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="jgHEetFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A1910E3BA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:28:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42f9ece6387so1263194f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765790934; x=1766395734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EAtcjZJ1KFt4vG40Vt/bBeVLEUo5XHFl070hFfHMjwg=;
 b=jgHEetFYRnDr0RTgJ+ouAzvLoLpCAFq2eHuGzkXycbONg7w/3Fwq0UFf/UogFzrbHF
 22tooWRMfLlzQNs/rGp657P4BV1bMTAnT3jRR8gld68/xL4g1bTTcdQmj7R6HkN0oYs1
 crn15lDYH06pMB8RdpbmBXgozH35x/ydr1n5/Ue37ZPM3IOqL7chZGs3ealMe2stMz/e
 0O7iKK+Uk9VPTbf7czQSTS0t2PDfblN8qPWaG50StB8v1fZQ6uebravDaLPVUXFIqfUx
 hxYGdv3wMfCs/Ue12qLRcQr+HB/n6xtr/osfgk/gKCp3Fu6rlUy28zILpdg0Nk3GINh/
 xbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765790934; x=1766395734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAtcjZJ1KFt4vG40Vt/bBeVLEUo5XHFl070hFfHMjwg=;
 b=DzgvNy0erNO0mwX/+BfXYk+1oEv3QH7WSNK7MDHxj7VxDGAiwahAlNNx9fjW6QJf4o
 Yoy3BSm5sxNhPSzOSYBLU7XZoQ7WaBaLd44ga8tqYAb1UUkoKWpRPnGk+mRZD0fMFWCC
 mrZmvTKGYLB3JpiVlnXr0flW1kCb5i8b7KfWqbF9H0W10lSnm7M99bG3AmEHzKwqQySV
 7qYe2ICku/HYtD/Ea6z3aeIqwNuHGUjY3wKxcfsbJS6yOdmd8aazoCpg63J/GoH2E5HX
 yZ9LXmzM188qJciZLnCCV4TIVqFL2BJDBIF5xHThpi4kCQ84I7FFnK9zdJJTl/U8nbdY
 8haQ==
X-Gm-Message-State: AOJu0Yz17O1Iwxx4UP1vcTZI0Lgr0qDP6tUvDCZcTAu7SuQzqsJkf0Vi
 UQOWECfp22AG1yzvxU/tYocGtjIEi+r4js0RQ4bdztc+QVxZLZqFP1wqcudy9aXmNc4=
X-Gm-Gg: AY/fxX7AO/8EEJq7xd5sf1U7/XT6qwIPK2CPGPylGsRHDMzhWxSrJtNAcqdn+PuO0Kz
 J6MxD/Y9LoeRVw1G0sewicICARQN7xTAsiPgeCshxYnaNyHkrKZFJCBjc49SRDS8qG5aPkt8NMm
 yM5GIVTB/BWgBZ3yscaHqs12ETUhJtE7PAEl3vHzKNWeF/OdqpDZ0TjTW7A24qz6TpyG2ZLOt2n
 5MsSIe48aqg8Cgke/tPKcTTeBeZtRgb7M1OnFI9WBsGLYjzAk58noQDloQYWe8NqFDbL20kx1OH
 cx7GTnNsVhqUjUekoU/rZj9/CMHEzQYqToKwD7tIgw6vwQEcT0AOzK4KnVbDu5MqtmzNHaRk8MG
 hp1GtpdCpjWaU05nNFSvFs5JCDAYg1xIs0T0O3HaWG4gfD45XNZ6FTMX/KPToHiL4vqUg+qhLyt
 ORH5dQxgrz+s+QZNzwodSDtvpcuP8ACcDY
X-Google-Smtp-Source: AGHT+IFXH8wSN8XfQzRpdT4pbJByZBNo9xGfM1a4FczP/iYQS3xnPAVWQ1Lm6WcgFgjUtyCCUyZMuQ==
X-Received: by 2002:a05:6000:2883:b0:431:266:d13a with SMTP id
 ffacd0b85a97d-4310266d6d9mr390220f8f.48.1765790933891; 
 Mon, 15 Dec 2025 01:28:53 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b750sm27657113f8f.42.2025.12.15.01.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 01:28:53 -0800 (PST)
Message-ID: <8212f7d1-cc41-4ac0-899e-0d86efedb318@ursulin.net>
Date: Mon, 15 Dec 2025 09:28:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] drm/amdgpu: independence for the amdgpu_fence! v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-12-christian.koenig@amd.com>
 <e426d618-3d6e-4d93-b6fd-4c5e1b11d9f2@ursulin.net>
 <792385a7-ac0f-4e39-a6e7-3b09bfe0b4e7@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <792385a7-ac0f-4e39-a6e7-3b09bfe0b4e7@amd.com>
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


On 12/12/2025 15:49, Christian König wrote:
> On 12/11/25 16:53, Tvrtko Ursulin wrote:
>>
>> On 11/12/2025 13:16, Christian König wrote:
>>> This allows amdgpu_fences to outlive the amdgpu module.
>>>
>>> v2: use dma_fence_get_rcu_safe to be NULL safe here.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 63 +++++++----------------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 -
>>>    2 files changed, 20 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index c7843e336310..c636347801c1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -112,8 +112,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
>>>        af->ring = ring;
>>>          seq = ++ring->fence_drv.sync_seq;
>>> -    dma_fence_init(fence, &amdgpu_fence_ops,
>>> -               &ring->fence_drv.lock,
>>> +    dma_fence_init(fence, &amdgpu_fence_ops, NULL,
>>>                   adev->fence_context + ring->idx, seq);
>>>          amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
>>> @@ -467,7 +466,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring)
>>>        timer_setup(&ring->fence_drv.fallback_timer, amdgpu_fence_fallback, 0);
>>>          ring->fence_drv.num_fences_mask = ring->num_hw_submission * 2 - 1;
>>> -    spin_lock_init(&ring->fence_drv.lock);
>>>        ring->fence_drv.fences = kcalloc(ring->num_hw_submission * 2, sizeof(void *),
>>>                         GFP_KERNEL);
>>>    @@ -654,16 +652,20 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
>>>        struct amdgpu_fence_driver *drv = &ring->fence_drv;
>>>        unsigned long flags;
>>>    -    spin_lock_irqsave(&drv->lock, flags);
>>> +    rcu_read_lock();
>>>        for (unsigned int i = 0; i <= drv->num_fences_mask; ++i) {
>>>            struct dma_fence *fence;
>>>    -        fence = rcu_dereference_protected(drv->fences[i],
>>> -                          lockdep_is_held(&drv->lock));
>>> -        if (fence && !dma_fence_is_signaled_locked(fence))
>>> +        fence = dma_fence_get_rcu(drv->fences[i]);
>>
>> dma_fence_get_rcu is not safe against passing a NULL fence in, while the existing code makes it look like drv->fence[] slot can contain NULL at this point?
>>
>> amdgpu_fence_process() is the place which can NULL the slots? Irq context? Why is that safe with no reference held from clearing the slot to operating on the fence?
> 
> The slots are never cleared. It can only be that they are NULL when the driver is loaded.

Are you sure?

bool amdgpu_fence_process(struct amdgpu_ring *ring)
{
...
		ptr = &drv->fences[last_seq];

		/* There is always exactly one thread signaling this fence slot */
		fence = rcu_dereference_protected(*ptr, 1);
		RCU_INIT_POINTER(*ptr, NULL);

The above looks like it can set slots to NULL. At least if the code is 
reachable. I don't claim that it is because I could not easily follow 
the logic behind the high level scheme fence driver and associated state 
implements.

> I've switched over to dma_fence_get_rcu_safe() where appropriated.

You mean below in amdgpu_fence_driver_guilty_force_completion? In 
amdgpu_fence_driver_set_error you are sure it is not needed so the 
existing code is too careful?

Regards,

Tvrtko

>>
>>> +        if (!fence)
>>> +            continue;
>>> +
>>> +        dma_fence_lock_irqsave(fence, flags);
>>> +        if (!dma_fence_is_signaled_locked(fence))
>>>                dma_fence_set_error(fence, error);
>>> +        dma_fence_unlock_irqrestore(fence, flags);
>>>        }
>>> -    spin_unlock_irqrestore(&drv->lock, flags);
>>> +    rcu_read_unlock();
>>>    }
>>>      /**
>>> @@ -714,16 +716,19 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>>>        seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
>>>          /* mark all fences from the guilty context with an error */
>>> -    spin_lock_irqsave(&ring->fence_drv.lock, flags);
>>> +    rcu_read_lock();
>>>        do {
>>>            last_seq++;
>>>            last_seq &= ring->fence_drv.num_fences_mask;
>>>              ptr = &ring->fence_drv.fences[last_seq];
>>> -        rcu_read_lock();
>>> -        unprocessed = rcu_dereference(*ptr);
>>> +        unprocessed = dma_fence_get_rcu_safe(ptr);
>>
>> Similar concern like the above.
>>
>> Regards,
>>
>> Tvrtko
>>> +
>>> +        if (!unprocessed)
>>> +            continue;
>>>    -        if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
>>> +        dma_fence_lock_irqsave(unprocessed, flags);
>>> +        if (dma_fence_is_signaled_locked(unprocessed)) {
>>>                fence = container_of(unprocessed, struct amdgpu_fence, base);
>>>                  if (fence == af)
>>> @@ -731,9 +736,10 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>>>                else if (fence->context == af->context)
>>>                    dma_fence_set_error(&fence->base, -ECANCELED);
>>>            }
>>> -        rcu_read_unlock();
>>> +        dma_fence_unlock_irqrestore(unprocessed, flags);
>>> +        dma_fence_put(unprocessed);
>>>        } while (last_seq != seq);
>>> -    spin_unlock_irqrestore(&ring->fence_drv.lock, flags);
>>> +    rcu_read_unlock();
>>>        /* signal the guilty fence */
>>>        amdgpu_fence_write(ring, (u32)af->base.seqno);
>>>        amdgpu_fence_process(ring);
>>> @@ -823,39 +829,10 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>>>        return true;
>>>    }
>>>    -/**
>>> - * amdgpu_fence_free - free up the fence memory
>>> - *
>>> - * @rcu: RCU callback head
>>> - *
>>> - * Free up the fence memory after the RCU grace period.
>>> - */
>>> -static void amdgpu_fence_free(struct rcu_head *rcu)
>>> -{
>>> -    struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>> -
>>> -    /* free fence_slab if it's separated fence*/
>>> -    kfree(to_amdgpu_fence(f));
>>> -}
>>> -
>>> -/**
>>> - * amdgpu_fence_release - callback that fence can be freed
>>> - *
>>> - * @f: fence
>>> - *
>>> - * This function is called when the reference count becomes zero.
>>> - * It just RCU schedules freeing up the fence.
>>> - */
>>> -static void amdgpu_fence_release(struct dma_fence *f)
>>> -{
>>> -    call_rcu(&f->rcu, amdgpu_fence_free);
>>> -}
>>> -
>>>    static const struct dma_fence_ops amdgpu_fence_ops = {
>>>        .get_driver_name = amdgpu_fence_get_driver_name,
>>>        .get_timeline_name = amdgpu_fence_get_timeline_name,
>>>        .enable_signaling = amdgpu_fence_enable_signaling,
>>> -    .release = amdgpu_fence_release,
>>>    };
>>>      /*
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> index 7a27c6c4bb44..9cbf63454004 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> @@ -125,7 +125,6 @@ struct amdgpu_fence_driver {
>>>        unsigned            irq_type;
>>>        struct timer_list        fallback_timer;
>>>        unsigned            num_fences_mask;
>>> -    spinlock_t            lock;
>>>        struct dma_fence        **fences;
>>>    };
>>>    
>>
> 

