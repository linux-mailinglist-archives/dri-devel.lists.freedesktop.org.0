Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69475377A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D443B10E858;
	Fri, 14 Jul 2023 10:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAA10E858
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:07:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2B7674258C;
 Fri, 14 Jul 2023 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689329240;
 bh=+k7jknX5+ndLtniexngpV4nILqymb+1YEEaevrPJ7mY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=B/KNawnUd32ttB5jiCjlUgzoyq3SaOulne1jdjAX6omr2WFDz5UFRuu7JVqXAiqSX
 WxiQW0tGGOzlosgFY8PwzYUUukCzdw5R7AAHvNikQw/bgf0CZWBXF+GNixK/XbkwtV
 GMgzujqnnXSPYVrhiLj7vouGo3uOgXt27UEvLKRR1y1+nDriugoc/tKmp7F9o01YS3
 keBy9stVz5eZs4XsXmV0tyodpIV6Wje3NSUVVUZcBztY0U3lZrXDQYRkr1CGDvvh03
 Ixpc26gnT+oJvuoFrje/wwceF8s+a+pDHvkjoxcOQNzCccvzLsX5Ih2RqYgGwbGrax
 gcp9e9o9+J4YA==
Message-ID: <768fbf06-130d-6980-1915-9bbd53f73671@asahilina.net>
Date: Fri, 14 Jul 2023 19:07:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <5c7278b9-e63e-4ddf-1988-1e02087fb988@asahilina.net>
 <65d5237c-ef85-845f-6a8e-818e78d74bf4@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <65d5237c-ef85-845f-6a8e-818e78d74bf4@amd.com>
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 18.51, Christian König wrote:
> Am 14.07.23 um 11:44 schrieb Asahi Lina:
>> On 14/07/2023 17.43, Christian König wrote:
>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>>> independencly reference counted. Therefore, we can't reference the
>>>> scheduler in the get_timeline_name() implementation.
>>>>
>>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>     drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>     include/drm/gpu_scheduler.h              | 5 +++++
>>>>     3 files changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index b2bbc8a68b30..17f35b0b005a 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -389,7 +389,12 @@ static bool
>>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>                /*
>>>>              * Fence is from the same scheduler, only need to wait for
>>>> -         * it to be scheduled
>>>> +         * it to be scheduled.
>>>> +         *
>>>> +         * Note: s_fence->sched could have been freed and reallocated
>>>> +         * as another scheduler. This false positive case is okay,
>>>> as if
>>>> +         * the old scheduler was freed all of its jobs must have
>>>> +         * signaled their completion fences.
>>>
>>> This is outright nonsense. As long as an entity for a scheduler exists
>>> it is not allowed to free up this scheduler.
>>>
>>> So this function can't be called like this.
>>>
>>>>              */
>>>>             fence = dma_fence_get(&s_fence->scheduled);
>>>>             dma_fence_put(entity->dependency);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> index ef120475e7c6..06a0eebcca10 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> @@ -68,7 +68,7 @@ static const char
>>>> *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>>>     static const char *drm_sched_fence_get_timeline_name(struct
>>>> dma_fence *f)
>>>>     {
>>>>         struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>> -    return (const char *)fence->sched->name;
>>>> +    return (const char *)fence->sched_name;
>>>>     }
>>>>        static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>>>> @@ -216,6 +216,8 @@ void drm_sched_fence_init(struct drm_sched_fence
>>>> *fence,
>>>>         unsigned seq;
>>>>            fence->sched = entity->rq->sched;
>>>> +    strlcpy(fence->sched_name, entity->rq->sched->name,
>>>> +        sizeof(fence->sched_name));
>>>>         seq = atomic_inc_return(&entity->fence_seq);
>>>>         dma_fence_init(&fence->scheduled,
>>>> &drm_sched_fence_ops_scheduled,
>>>>                    &fence->lock, entity->fence_context, seq);
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index e95b4837e5a3..4fa9523bd47d 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -305,6 +305,11 @@ struct drm_sched_fence {
>>>>              * @lock: the lock used by the scheduled and the finished
>>>> fences.
>>>>              */
>>>>         spinlock_t            lock;
>>>> +        /**
>>>> +         * @sched_name: the name of the scheduler that owns this
>>>> fence. We
>>>> +     * keep a copy here since fences can outlive their scheduler.
>>>> +         */
>>>> +    char sched_name[16];
>>>
>>> This just mitigates the problem, but doesn't fix it.
>>
>> Could you point out any remaining issues so we can fix them? Right now
>> this absolutely *is* broken and this fixes the breakage I observed. If
>> there are other bugs remaining, I'd like to know what they are so I
>> can fix them.
>>
>>> The real issue is that the hw fence is kept around much longer than
>>> that.
>>
>> As far as I know, the whole point of scheduler fences is to decouple
>> the hw fences from the consumers.
> 
> Well yes and no. The decoupling is for the signaling, it's not
> decoupling the lifetime.

When I spoke with Daniel I understood the intent was also to decouple 
the lifetime.

>> I already talked with Daniel about this. The current behavior is
>> broken. These fences can live forever. It is broken to require that
>> they outlive the driver that produced them.
>>
>>> Additional to that I'm not willing to increase the scheduler fence size
>>> like that just to decouple them from the scheduler.
>>
>> Did you read my explanation on the cover letter as to how this is just
>> broken right now? We need to fix this. If you have a better suggestion
>> I'll take it. Doing nothing is not an option.
> 
> Well this isn't broken at all. This works exactly like intended, you
> just want to use it for something it wasn't made for.
> 
> That scheduler fences could be changed to outlive the scheduler which
> issued them is possible, but this is certainly a new requirement.
> 
> Especially since we need to grab additional references to make sure that
> the module isn't unloaded in such a case.

Yes, that's a remaining issue. The fences need to grab a module 
reference to make sure drm_sched doesn't get unloaded until they're all 
really gone. I can add that in v2.

It would also be desirable to drop the hw fence as soon as it signals, 
instead of keeping a reference to it forever.

~~ Lina

