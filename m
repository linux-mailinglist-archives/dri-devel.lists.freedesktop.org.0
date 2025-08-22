Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E90B31140
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 10:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83910EA85;
	Fri, 22 Aug 2025 08:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PlvZalPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E77E10EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kdMq8ChGSJjXJN17X+xE1CVnnANVCQMFLhvBK6mO7p0=; b=PlvZalPtL+5Usjmg/8K4O2gOD5
 Q38vekNcPKXiQOnFju+aunlehpDZqY2b3+5SgJ5WlOQQYntY81lg843kJQl9/SepG3An87qI17lEf
 rIoskZDF+tji4ZwHAX+E5fxCE5O/2Lo092B6xbb1kfaun/TN9ZwmqolTL94dovj3i28G3tByOjg4V
 Mr1gGEbcjg7qVNY6nuLiPbr9/xvChd4UazWHDhV4dcDD+S2ix/hzVyE9H8PMTW9UM4tH+hCYYUK2B
 ap9FWU0Vj4lkjGYQ9eqLC8LsPsYLZK8fhViYk+aLysr0aqH3LArTW4F9EzWGDAxvxk9Xrxrc/73y/
 iaYl8nPg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1upMpW-0000TU-Nq; Fri, 22 Aug 2025 10:08:58 +0200
Message-ID: <c9b44bdc-7718-4edc-a2db-89d40cda4a15@igalia.com>
Date: Fri, 22 Aug 2025 09:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona.vetter@ffwll.ch, phasta@mailbox.org, airlied@gmail.com,
 dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
 <125ecf34-4f9f-4310-8f87-586da9a78977@igalia.com>
 <0a381201-3a73-48e9-ad5b-550abf141022@amd.com>
 <66e1e772-da61-4422-9f50-1dfeaf92282b@igalia.com>
 <f055a604-ba68-4652-adee-14d5f4575ec0@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f055a604-ba68-4652-adee-14d5f4575ec0@amd.com>
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


On 21/08/2025 13:46, Christian König wrote:
> On 13.08.25 13:59, Tvrtko Ursulin wrote:
>>> Good point. Could be that someone is using a pure kernel thread for fence signaling. Going to check for that instead of a worker.
>>
>> Ok, I am curious how to do it reliably. Non-null current and PF_KTHREAD and PF_WQ_WORKER not set?
> 
> If I'm not completely mistaken (current->flags & PF_KTHREAD) should do it, but I need to double check that as well.
> 
>>>> Even the fact opportunistic signalling needs to bypass the assert makes it sound like there isn't anything fundamentally wrong with signalling from task context.
>>>>
>>>
>>> Opportunistic signaling can happen from everywhere. But when an implementation tries to signal it from an IOCTL that is certainly invalid.
>>>
>>>> The first patch also feels a bit too much if it has no purpose apart from checking the new asserts would otherwise trigger.
>>>
>>> The sw_sync code is is only used for testing and debugging. See the Kconfig of it:
>>>
>>>             A sync object driver that uses a 32bit counter to coordinate
>>>             synchronization.  Useful when there is no hardware primitive backing
>>>             the synchronization.
>>>
>>>             WARNING: improper use of this can result in deadlocking kernel
>>>             drivers from userspace. Intended for test and debug only.
>>>
>>
>> But it is adding kernel code for a questionable benefit.
> 
> The whole sw_sync is questionable to begin with.
> 
> We had that for a couple of years already until we finally realized the problem with the infinite fences.
> 
> Today it should only be used for unit testing.
> 
>> What about calling the non-asserting version instead of adding complexity? It is kernel code so should be fine.
> 
> That would give other implementations both the possibility and impression that this is ok. And that is something I would really like to avoid.

I think a "big fat" comment next to the (only?) caller should be enough 
and on balance better than complicating the code for a debug component, 
which even adds an artificial/misleading limitation. I mean a 
complication plus limitation, with the sole purpose of making the assert 
feasible does not sound like the best option.

Perhaps a patch to checkpatch too to flag "no new users of this api 
should be added"? I wonder if there is a generic way to tie checkpatch 
with a list of deprecated API and if not should one be proposed.

Regards,

Tvrtko

>> Because even with the worker sw_sync can still create infinite fences. Worker just defeats the asserts so I do not see the value in complicating it.
> 
> Yeah, I mean completely ripping out the sw_sync would be indeed better. But that would break existing unit tests.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>
>>>>> Signed-off-by: Christian König <ckoenig@able.fritz.box>
>>>>> ---
>>>>>     drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>>>>>     include/linux/dma-fence.h   |  9 ++++--
>>>>>     2 files changed, 51 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index 3f78c56b58dc..2bce620eacac 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>>>>>     }
>>>>>     #endif
>>>>>     -
>>>>>     /**
>>>>> - * dma_fence_signal_timestamp_locked - signal completion of a fence
>>>>> + * dma_fence_signal_internal - internal signal completion of a fence
>>>>>      * @fence: the fence to signal
>>>>>      * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>>>>      *
>>>>> - * Signal completion for software callbacks on a fence, this will unblock
>>>>> - * dma_fence_wait() calls and run all the callbacks added with
>>>>> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>>>> - * can only go from the unsignaled to the signaled state and not back, it will
>>>>> - * only be effective the first time. Set the timestamp provided as the fence
>>>>> - * signal timestamp.
>>>>> - *
>>>>> - * Unlike dma_fence_signal_timestamp(), this function must be called with
>>>>> - * &dma_fence.lock held.
>>>>> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
>>>>> + * by drivers or external code directly.
>>>>>      *
>>>>>      * Returns 0 on success and a negative error value when @fence has been
>>>>>      * signalled already.
>>>>>      */
>>>>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>> -                      ktime_t timestamp)
>>>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>>>>>     {
>>>>>         struct dma_fence_cb *cur, *tmp;
>>>>>         struct list_head cb_list;
>>>>>           lockdep_assert_held(fence->lock);
>>>>> -
>>>>>         if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>                           &fence->flags)))
>>>>>             return -EINVAL;
>>>>> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>           return 0;
>>>>>     }
>>>>> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>>>>> +EXPORT_SYMBOL(dma_fence_signal_internal);
>>>>> +
>>>>> +/**
>>>>> + * dma_fence_signal_timestamp_locked - signal completion of a fence
>>>>> + * @fence: the fence to signal
>>>>> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>>>> + *
>>>>> + * Signal completion for software callbacks on a fence, this will unblock
>>>>> + * dma_fence_wait() calls and run all the callbacks added with
>>>>> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
>>>>> + * can only go from the unsignaled to the signaled state and not back, it will
>>>>> + * only be effective the first time. Set the timestamp provided as the fence
>>>>> + * signal timestamp.
>>>>> + *
>>>>> + * Unlike dma_fence_signal_timestamp(), this function must be called with
>>>>> + * &dma_fence.lock held.
>>>>> + *
>>>>> + * Returns 0 on success and a negative error value when @fence has been
>>>>> + * signalled already.
>>>>> + */
>>>>> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>> +                      ktime_t timestamp)
>>>>> +{
>>>>> +    /*
>>>>> +     * We have the re-occurring problem that people try to invent a
>>>>> +     * DMA-fences implementation which signals fences based on an userspace
>>>>> +     * IOCTL.
>>>>> +     *
>>>>> +     * This is well known as source of hard to track down crashes and is
>>>>> +     * documented to be an invalid approach. The problem is that it seems
>>>>> +     * to work during initial testing and only long term tests points out
>>>>> +     * why this can never work correctly.
>>>>> +     *
>>>>> +     * So give at least a warning when people try to signal a fence from
>>>>> +     * task context and not from interrupts or a work item. This check is
>>>>> +     * certainly not perfect but better than nothing.
>>>>> +     */
>>>>> +    WARN_ON_ONCE(!in_interrupt() && !current_work());
>>>>> +    return dma_fence_signal_internal(fence, timestamp);
>>>>> +}
>>>>>       /**
>>>>>      * dma_fence_signal_timestamp - signal completion of a fence
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 64639e104110..8dbcd66989b8 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>>>>>     int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>>>>     int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>                           ktime_t timestamp);
>>>>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>>>>>     signed long dma_fence_default_wait(struct dma_fence *fence,
>>>>>                        bool intr, signed long timeout);
>>>>>     int dma_fence_add_callback(struct dma_fence *fence,
>>>>> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>>             return true;
>>>>>           if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>>> -        dma_fence_signal_locked(fence);
>>>>> +        dma_fence_signal_internal(fence, ktime_get());
>>>>>             return true;
>>>>>         }
>>>>>     @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>>     static inline bool
>>>>>     dma_fence_is_signaled(struct dma_fence *fence)
>>>>>     {
>>>>> +    unsigned long flags;
>>>>> +
>>>>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>>             return true;
>>>>>           if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>>>> -        dma_fence_signal(fence);
>>>>> +        spin_lock_irqsave(fence->lock, flags);
>>>>> +        dma_fence_signal_internal(fence, ktime_get());
>>>>> +        spin_unlock_irqrestore(fence->lock, flags);
>>>>>             return true;
>>>>>         }
>>>>>     
>>>>
>>>
>>
> 

