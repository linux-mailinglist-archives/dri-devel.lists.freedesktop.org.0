Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E3753A6D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B6710E7F7;
	Fri, 14 Jul 2023 12:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33F10E7F7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:13:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E69225BC3A;
 Fri, 14 Jul 2023 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689336801;
 bh=DWYGMsjKYj46JY4sKn+xsGrKzmhqcYG/7k01RE2MggE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RNhUBcX3s0W+Zvu0qcG7y44YsnhK7RpOcztyyvrMh4jUpqdIFUVdsaAtArdvI1kvF
 dDnG9Olp8Gy2TsoGTNCL+gDNa2Gw005Qp90wuziuT4GFdKqu5atYBh0k92rJ8CaCem
 XklwuamNyNKzIhLkHHTkx4hOhA4OvR70m3hKOxwQgKV7w+AUDpmMjVfiItubxZv6TQ
 8qxRm3K1ajK/2drxgdAttjR3J5mfWIlw66+Taag37MLlrZkYdwOnPOJzdgwMcLZeKW
 pOtvcCgo4y+pwtfCIVXjlwysoirNNJfRqUHJsMMxwSGFjFTTCKdt8DTT301ONw5dfJ
 232IHUwkNx4GA==
Message-ID: <7e53bc1f-7d1e-fb1c-be45-f03c5bbb8965@asahilina.net>
Date: Fri, 14 Jul 2023 21:13:16 +0900
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
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <6b473196-9f87-d6c8-b289-18f80de78f0a@asahilina.net>
 <003eb810-654e-3a2b-0756-d62440c2d419@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <003eb810-654e-3a2b-0756-d62440c2d419@amd.com>
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

On 14/07/2023 19.18, Christian König wrote:
> Am 14.07.23 um 12:06 schrieb Asahi Lina:
>> On 14/07/2023 18.57, Christian König wrote:
>>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>>> On 14/07/2023 17.43, Christian König wrote:
>>>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>>> A signaled scheduler fence can outlive its scheduler, since fences
>>>>>> are
>>>>>> independencly reference counted. Therefore, we can't reference the
>>>>>> scheduler in the get_timeline_name() implementation.
>>>>>>
>>>>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>>>
>>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>>> ---
>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>>>      drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>>>      include/drm/gpu_scheduler.h              | 5 +++++
>>>>>>      3 files changed, 14 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index b2bbc8a68b30..17f35b0b005a 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -389,7 +389,12 @@ static bool
>>>>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>>>                 /*
>>>>>>               * Fence is from the same scheduler, only need to wait
>>>>>> for
>>>>>> -         * it to be scheduled
>>>>>> +         * it to be scheduled.
>>>>>> +         *
>>>>>> +         * Note: s_fence->sched could have been freed and
>>>>>> reallocated
>>>>>> +         * as another scheduler. This false positive case is okay,
>>>>>> as if
>>>>>> +         * the old scheduler was freed all of its jobs must have
>>>>>> +         * signaled their completion fences.
>>>>>
>>>>> This is outright nonsense. As long as an entity for a scheduler exists
>>>>> it is not allowed to free up this scheduler.
>>>>>
>>>>> So this function can't be called like this.
>>>>
>>>> As I already explained, the fences can outlive their scheduler. That
>>>> means *this* entity certainly exists for *this* scheduler, but the
>>>> *dependency* fence might have come from a past scheduler that was
>>>> already destroyed along with all of its entities, and its address
>>>> reused.
>>>
>>> Well this is function is not about fences, this function is a callback
>>> for the entity.
>>
>> That deals with dependency fences, which could have come from any
>> arbitrary source, including another entity and another scheduler.
> 
> No, they can't. Signaling is certainly mandatory to happen before things
> are released even if we allow to decouple the dma_fence from it's issuer.

That's exactly what I'm saying in my comment. That the fence must be 
signaled if its creator no longer exists, therefore it's okay to 
inadvertently wait on its scheduled fence instead of its finished fence 
(if that one was intended) since everything needs to be signaled at that 
point anyway.

>>
>>>>
>>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>>> being told my comments are "outright nonsense" when you don't even
>>>> take the time to understand what the issue is and what I'm trying to
>>>> do/document. If you aren't interested in working with me, I'm just
>>>> going to give up on drm_sched, wait until Rust gets workqueue support,
>>>> and reimplement it in Rust. You can keep your broken fence lifetime
>>>> semantics and I'll do my own thing.
>>>
>>> I'm certainly trying to help here, but you seem to have unrealistic
>>> expectations.
>>
>> I don't think expecting not to be told my changes are "outright
>> nonsense" is an unrealistic expectation. If you think it is, maybe
>> that's yet another indicator of the culture problems the kernel
>> community has...
> 
> Well I'm just pointing out that you don't seem to understand the
> background of the things and just think this is a bug instead of
> intentional behavior.

I made a change, I explained why that change works with a portion of the 
existing code by updating a comment, and you called that nonsense. It's 
not even a bug, I'm trying to explain why this part isn't a bug even 
with the expectation that fences don't outlive the scheduler. This is 
because I went through the code trying to find problems this approach 
would cause, ran into this tricky case, thought about it for a while, 
realized it wasn't a problem, and figured it needed a comment.

>>> I perfectly understand what you are trying to do, but you don't seem to
>>> understand that this functionality here isn't made for your use case.
>>
>> I do, that's why I'm trying to change things. Right now, this
>> functionality isn't even properly documented, which is why I thought
>> it could be used for my use case, and slowly discovered otherwise.
>> Daniel suggested documenting it, then fixing the mismatches between
>> documentation and reality, which is what I'm doing here.
> 
> Well I know Daniel for something like 10-15 years or so, I'm pretty sure
> that he meant that you document the existing state because otherwise
> this goes against usual patch submission approaches.
> 
>>
>>> We can adjust the functionality to better match your requirements, but
>>> you can't say it is broken because it doesn't work when you use it not
>>> in the way it is intended to be used.
>>
>> I'm saying the idea that a random dma-buf holds onto a chain of
>> references that prevents unloading a driver module that wrote into it
>> (and keeps a bunch of random unrelated objects alive) is a broken
>> state of affairs.
> 
> Well no, this is intentional design. Otherwise the module and with it
> the operations pointer the fences rely on go away.

But this is a drm_sched fence, not a driver fence. That's the point, 
that they should be decoupled. The driver is free to unload and only 
drm_sched would need to stay loaded so its fences continue to be valid. 
Except that's not what happens right now. Right now the drm_sched fence 
hangs onto the hw fence and the whole thing is supposed to keep the 
whole scheduler alive for things not to go boom.

> We already discussed
> that over 10 years ago when Marten came up with the initial dma_fence
> design.
> 
> The resulting problems are very well known and I completely agree that
> they are undesirable, but this is how the framework works and not just
> the scheduler but the rest of the DMA-buf framework as well.

So it's undesirable but you don't want me to change things...

> 
>> It may or may not trickle down to actual problems for users (I would
>> bet it does in some cases but I don't know for sure), but it's a
>> situation that doesn't make any sense.
>>
>> I know I'm triggering actual breakage with my new use case due to
>> this, which is why I'm trying to improve things. But the current state
>> of affairs just doesn't make any sense even if it isn't causing kernel
>> oopses today with other drivers.
>>
>>> You can go ahead and try to re-implement the functionality in Rust, but
>>> then I would reject that pointing out that this should probably be an
>>> extension to the existing code.
>>
>> You keep rejecting my attempts at extending the existing code...
> 
> Well I will try to improve here and push you into the right direction
> instead.

What is the right direction?

So far it's looking more and more like wait until we get workqueues in 
Rust, write a trivial scheduler in the driver, and give up on this whole 
drm_sched thing. Please tell me if there is a better way, because so far 
all you've done is tell me my attempts are not the right way, and 
demotivated me from working on drm_sched at all.

~~ Lina

