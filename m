Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7ECBEC40
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2BC10E241;
	Mon, 15 Dec 2025 15:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="lA9hRUnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E0C10E241
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:53:44 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so43679925e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765814023; x=1766418823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pH2Z/DaD19HT9evWYCHDaM379AqSHqnWuEigqNTYVb4=;
 b=lA9hRUnvHj48J0fjq44Bu8KBZzVcvYophIA6nPPe0dbM31JzXxcLecjtjZsCFHpRpw
 UawLeWGaB6A1j1DlWoZknOozavaIDk8LY9OZpP6L2XHlK0Og3EDsO2b0qkTfnYEGoo4Z
 DA2uRNt/wKwausJtMsKpsfva6GFhSw6K/+nANKvpm97KFa2dyGZ3+pguYSDVX1KfPX71
 wwIR0LZUnbNNAO9CKcvC7qEMELirbGsCHikKEgQNrU46YA4CGrG4g1xiv1XYz8268RiT
 zOCAvKIU6R+TSRby8JnW83s8TE5CCdlpoE6rPqhH73ORhL5MXAGlRCMj837dUewquoqD
 McEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765814023; x=1766418823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pH2Z/DaD19HT9evWYCHDaM379AqSHqnWuEigqNTYVb4=;
 b=Oztj0eD41AOPNx/ILLdw9GvUH/Dtl93CWzFii+Ji6dKFvyJFQHC4eF8orNoi6+CeX6
 3HG96TG2JAVD2w476g6EaKE0nyauKK6ZhxfXHxopZ1xAOMlq2MXK9LevEHr1z6xFyOf2
 J9VEf9KCDV6pu/25igw5FTUt9giKmKsGPKYGypgyJIFSo7QBf4pbBn81oExJGmJNuA9x
 Rm633WjM3UL23/8QRfuPKWVnkvE+SiNvgzfVDNZ9TRaS+jkorZuVy5yAUa/xml3WXYMZ
 cr7vnecXLiSncNLxeI5e+YczjiwdQ7357rKaEVKuXf6xWa12qIj9PWbi0hGepa4zCp9V
 wUKQ==
X-Gm-Message-State: AOJu0YyUXMPmL4R0sknPDiBTyMQHtYrsexhlbpv3LzOhmlMC+jhDFX+W
 WFLs2Jg3TSMDYIf+lFFG4iXFvuY5MZLhlaYMK8zCpoA2YPiFHXYEaHgayhPH8pCTu5I=
X-Gm-Gg: AY/fxX40sjMvlqXVUbXY5dTM49bAuTQHCUMq4V9ULsVT50fWD/JjJQA6qaR0dJx4s0Y
 efCdzk6Qa438mbZi4IbNPNEDiJwtUFnTOGqO73RcQtVT6vKoCHVyVBoWBjS1pMLR6qD1Zo7zV5M
 x5K72TcokA+dlO9pmrx6fQbGPbhirCvDdN8B25pIDWYQ47G5ASm/L98O0E1veSWWmgvwFuwfTg2
 vjIX3eXQCbvUPODCdhpWIgQpS9IqtUrb0UMGodMNWjuy+EJizgOyCAqzWbpUy3KkVq+NLsr6QBf
 P+NAdY59iMUhsHGjyRvtdZ5eDgUqxgncNhd5OpvUknqCMDVV8l/NMTOmqqrdCCxrAFg0NJilUDk
 y7aa88wx5j2GwXaW0VSULuYRAIlRuCTToAYBTYxZbfRpca5aMO4fLMVTj+SVlUblqd6I9ZuPZ8C
 aJS3lTi8rFi/+WO8N4Lh8nI9067JfO+Wf/WrCvGbuWzpo=
X-Google-Smtp-Source: AGHT+IHTVGfAebs9MrJLRGYlmqwnfYkRsZXOHzsD0dnLIwwJMmBpk5bJBt40F4PJceNMZDgVs7o5qA==
X-Received: by 2002:a05:600c:19cd:b0:47a:819f:3acf with SMTP id
 5b1f17b1804b1-47a8f8abfa7mr122682085e9.10.1765814022581; 
 Mon, 15 Dec 2025 07:53:42 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6e5baasm206481405e9.13.2025.12.15.07.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 07:53:42 -0800 (PST)
Message-ID: <07ad04cd-de4e-4c12-823d-cb3024816382@ursulin.net>
Date: Mon, 15 Dec 2025 15:53:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
 <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
 <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
 <e19284e2-ff38-415d-a44d-0ab610032d24@ursulin.net>
 <6e2e258a-0c20-4229-8301-5a217f29eea6@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <6e2e258a-0c20-4229-8301-5a217f29eea6@amd.com>
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


On 15/12/2025 15:38, Christian König wrote:
> On 12/15/25 10:20, Tvrtko Ursulin wrote:
>>
>> On 12/12/2025 15:50, Christian König wrote:
>>> On 12/11/25 16:13, Tvrtko Ursulin wrote:
>>>>
>>>> On 11/12/2025 13:16, Christian König wrote:
>>>>> Using the inline lock is now the recommended way for dma_fence implementations.
>>>>>
>>>>> So use this approach for the scheduler fences as well just in case if
>>>>> anybody uses this as blueprint for its own implementation.
>>>>>
>>>>> Also saves about 4 bytes for the external spinlock.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>>>>>     include/drm/gpu_scheduler.h             | 4 ----
>>>>>     2 files changed, 3 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> index 08ccbde8b2f5..47471b9e43f9 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>>>         /* If we already have an earlier deadline, keep it: */
>>>>>         if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>>>             ktime_before(fence->deadline, deadline)) {
>>>>> -        spin_unlock_irqrestore(&fence->lock, flags);
>>>>> +        dma_fence_unlock_irqrestore(f, flags);
>>>>
>>>> Rebase error I guess. Pull into the locking helpers patch.
>>>
>>> No that is actually completely intentional here.
>>>
>>> Previously we had a separate lock which protected both the DMA-fences as well as the deadline state.
>>>
>>> Now we turn that upside down by dropping the separate lock and protecting the deadline state with the dma_fence lock instead.
>>
>> I don't follow. The code is currently like this:
>>
>> static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>                            ktime_t deadline)
>> {
>>      struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>      struct dma_fence *parent;
>>      unsigned long flags;
>>
>>      spin_lock_irqsave(&fence->lock, flags);
>>
>>      /* If we already have an earlier deadline, keep it: */
>>      if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>          ktime_before(fence->deadline, deadline)) {
>>          spin_unlock_irqrestore(&fence->lock, flags);
>>          return;
>>      }
>>
>>      fence->deadline = deadline;
>>      set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>
>>      spin_unlock_irqrestore(&fence->lock, flags);...
>>
>> The diff changes one out of the three lock/unlock operations. Other two are changed in 3/19. All three should surely be changed in the same patch.
> 
> We could change those spin_lock/unlock calls in patch #3, but I don't think that this is clean.
> 
> See the code here currently uses fence->lock and patch #3 would change it to use fence->finished->lock instead. That might be the pointer at the moment, but that is just by coincident and not design.
> 
> Only this change here ontop makes it intentional that we use fence->finished->lock for everything.

Sorry I still don't follow. After 3/19 and before this 9/19 the function 
looks like this:

static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
						  ktime_t deadline)
{
	struct drm_sched_fence *fence = to_drm_sched_fence(f);
	struct dma_fence *parent;
	unsigned long flags;

	dma_fence_lock_irqsave(f, flags);

	/* If we already have an earlier deadline, keep it: */
	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
	    ktime_before(fence->deadline, deadline)) {
		spin_unlock_irqrestore(&fence->lock, flags);
		return;
	}

	fence->deadline = deadline;
	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);

	dma_fence_unlock_irqrestore(f, flags);

Notice the lonely spin_unlock_irqrestore on the early return path while 
other two use the dma_fence_(un)lock helpers. Am I blind or how is that 
clean?

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>             return;
>>>>>         }
>>>>>     @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>           fence->owner = owner;
>>>>>         fence->drm_client_id = drm_client_id;
>>>>> -    spin_lock_init(&fence->lock);
>>>>>           return fence;
>>>>>     }
>>>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>         fence->sched = entity->rq->sched;
>>>>>         seq = atomic_inc_return(&entity->fence_seq);
>>>>>         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>> -               &fence->lock, entity->fence_context, seq);
>>>>> +               NULL, entity->fence_context, seq);
>>>>>         dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>> -               &fence->lock, entity->fence_context + 1, seq);
>>>>> +               NULL, entity->fence_context + 1, seq);
>>>>>     }
>>>>>       module_init(drm_sched_fence_slab_init);
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index fb88301b3c45..b77f24a783e3 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>>>>              * belongs to.
>>>>>              */
>>>>>         struct drm_gpu_scheduler    *sched;
>>>>> -        /**
>>>>> -         * @lock: the lock used by the scheduled and the finished fences.
>>>>> -         */
>>>>> -    spinlock_t            lock;
>>>>>             /**
>>>>>              * @owner: job owner for debugging
>>>>>              */
>>>>
>>>
>>
> 

