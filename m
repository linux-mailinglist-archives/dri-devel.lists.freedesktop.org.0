Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF057571D2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 04:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9810E2C8;
	Tue, 18 Jul 2023 02:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14F10E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:35:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 6C4DC424BA;
 Tue, 18 Jul 2023 02:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689647756;
 bh=DPckD2pcMitjOq4PnGHXF3nMKOQ/JWjAKnEZEzPdo0w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=OJZUvXtKw3BeyCO8IbXdPGPDd9/x9usKU5vwpZBxXfSCD/0CtaahrxpTvKcvv5l63
 uL0PG8zcnIfpGypsFWqp2FaOoQLqhWn+7a/ojr9ftuW9K6GVp1dfDwVnl1MIQiaaLI
 eJ44Qr66EqBKAlqAO+ckO0i8ndFEe4eZDOSjB6MNdLUrzhPSI0gG1OgfAZ4x7mM2RR
 7EMNbFczDoqxTNf0p5Ktjs7NkpIre2dOd4Ts81y7CGzSRQI8gvM49K9ACtoPzdwEKG
 inuh5ZiR+S8IZquHycUGJNT8yrNv9r/+Uj63u6OHV9zDUwS2YiNDmJCLd2wi5KJ/fa
 wM1fVndieLO/w==
Message-ID: <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
Date: Tue, 18 Jul 2023 11:35:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alyssa@rosenzweig.io, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 00.55, Christian König wrote:
> Am 15.07.23 um 16:14 schrieb alyssa@rosenzweig.io:
>> 15 July 2023 at 00:03, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
>>> On 2023-07-14 05:57, Christian König wrote:
>>>
>>>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>>>
>>>>> On 14/07/2023 17.43, Christian König wrote:
>>>>>
>>>>    Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>    A signaled scheduler fence can outlive its scheduler, since fences are
>>>>    independencly reference counted. Therefore, we can't reference the
>>>>    scheduler in the get_timeline_name() implementation.
>>>>
>>>>    Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>    dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>
>>>>    Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>    ---
>>>>       drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>       drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>       include/drm/gpu_scheduler.h              | 5 +++++
>>>>       3 files changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>>    diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>    b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>    index b2bbc8a68b30..17f35b0b005a 100644
>>>>    --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>    +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>    @@ -389,7 +389,12 @@ static bool
>>>>    drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>                  /*
>>>>                * Fence is from the same scheduler, only need to wait for
>>>>    -         * it to be scheduled
>>>>    +         * it to be scheduled.
>>>>    +         *
>>>>    +         * Note: s_fence->sched could have been freed and reallocated
>>>>    +         * as another scheduler. This false positive case is okay,
>>>>    as if
>>>>    +         * the old scheduler was freed all of its jobs must have
>>>>    +         * signaled their completion fences.
>>>>
>>>>    This is outright nonsense. As long as an entity for a scheduler exists
>>>>    it is not allowed to free up this scheduler.
>>>>
>>>>    So this function can't be called like this.
>>>>
>>>>> As I already explained, the fences can outlive their scheduler. That
>>>>>    means *this* entity certainly exists for *this* scheduler, but the
>>>>>    *dependency* fence might have come from a past scheduler that was
>>>>>    already destroyed along with all of its entities, and its address reused.
>>>>>
>>>>    
>>>>    Well this is function is not about fences, this function is a callback
>>>>    for the entity.
>>>>    
>>>>
>>>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>>>>    being told my comments are "outright nonsense" when you don't even
>>>>>    take the time to understand what the issue is and what I'm trying to
>>>>>    do/document. If you aren't interested in working with me, I'm just
>>>>>    going to give up on drm_sched, wait until Rust gets workqueue support,
>>>>>    and reimplement it in Rust. You can keep your broken fence lifetime
>>>>>    semantics and I'll do my own thing.
>>>>>
>>>>    
>>>>    I'm certainly trying to help here, but you seem to have unrealistic
>>>>    expectations.
>>>>    
>>>>    I perfectly understand what you are trying to do, but you don't seem to
>>>>    understand that this functionality here isn't made for your use case.
>>>>    
>>>>    We can adjust the functionality to better match your requirements, but
>>>>    you can't say it is broken because it doesn't work when you use it not
>>>>    in the way it is intended to be used.
>>>>
>>> I believe "adjusting" functionality to fit some external requirements,
>>> may have unintended consequences, requiring yet more and more "adjustments".
>>> (Or may allow (new) drivers to do wild things which may lead to wild results. :-) )
>>>
>>> We need to be extra careful and wary of this.
>> Either drm/scheduler is common code that we should use for our driver, in which case we need to "adjust" it to fit the requirements of a safe Rust abstraction usable for AGX.
> 
> Well this is the fundamental disagreement we have. As far as I can see
> you don't need to adjust anything in the common drm/scheduler code.
> 
> That code works with quite a bunch of different drivers, including the
> Intel XE which has similar requirements to your work here.
> 
> We can talk about gradually improving the common code, but as Luben
> already wrote as well this needs to be done very carefully.
> 
>>    Or, drm/scheduler is not common code intended for drivers with our requirements, and then we need to be able to write our own scheduler.
>>
>> AMD has NAK'd both options, effectively NAK'ing the driver.
>>
>> I will ask a simple yes/no question: Should we use drm/sched?
> 
> Well, yes.
> 
>>
>> If yes, it will need patches like these,
> 
> No, you don't.
> 
> First of all you need to try to adjust your driver to match the
> requirements of drm/scheduler and *not* the other way around.
> 
>>    and AMD needs to be ok with that and stop NAK'ing them on sight becuase they don't match the existing requirements.
>>
>> If no, we will write our own scheduler in Rust, and AMD needs to be ok with that and not NAK it on sight because it's not drm/sched.
>>
>> Which is it?
>>
>> Note if we write a Rust scheduler, drm/sched and amdgpu will be unaffected. If we do that and AMD comes back and NAKs it -- as said in this thread would "probably" happen -- then it is impossible for us to upstream a driver regardless of whether we use drm/sched.
>>
>> Lina has been polite and accommodating while AMD calls her code "outright nonsense" and gets "outright NAK"s, and puts her into an impossible catch-22 where no matter what she does it's NAK'd.
> 
> Well as far as I can see I'm totally polite as well.
> 
> Pointing out that approaches doesn't seem to make sense and NAKing
> patches is a perfectly normal part of the review process.
> 
> What you need to to is to take a step back and ask yourself why this
> here is facing so much rejection from our side. I have to admit that I
> don't seem to be good at explaining that, cause we are obviously talking
> past each other, but you don't seem to try hard to understand what I'm
> pointing out either.
> 
>> That's not ok.
> 
> As far as I can see it is.
> 
> As maintainer of a commonly used component my first duty is to preserve
> the status quo and prevent modifications which are not well thought
> through. And to be honest those changes here strongly looks like Lina is
> just adjusting the code to match her requirements without looking left
> and right first.
> 
> Regards,
> Christian.
> 
> 

I give up. You are ignoring everything we say, and rejecting everything 
we suggest. We've already explained why drm_sched doesn't work for us. 
I'm tired of repeating the same explanation over and over again only to 
be ignored and told I'm wrong.

I'll start working on a new, much simpler Rust-native scheduler based on 
the workqueue Rust abstractions which are in review.

~~ Lina

