Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D862075C4B1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650B210E648;
	Fri, 21 Jul 2023 10:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D40710E648
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 10:33:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 3F35041E2F;
 Fri, 21 Jul 2023 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689935608;
 bh=zA7QqkJrQHaeSCtuze/bEJkPxa8Nq0sBwRpV2KfaplM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=0dmLnmuW463tIZx3DZBoHYkR/UjVmGKZD6d047N7vinsmPGJMS+FAMoK9FVUhyzD+
 9wLwx5b9rFRuHmHxeB6jWpG3U4wNMNcmomsjUfwAiyHj2dzt+7GPmyFBfg56A3oMUD
 54dsIX7pBTLkx/AysHrsElm46ssB488fgqmCIoW6z6EYakwixVRUzwY3gj25dGm3dG
 sKj5G2BhyYmrCPORj/5pZPXijpnhgyNHUj6buLdepCYuwtitLUxL1FRivlAf1wPF+f
 oBob4KIfChQaaLOQwj1Zj/eE4GQW1GhTr8CLstpPVKbI2ufNhnOCNL7JaB2PTiqlZx
 WjTfTL3BFdkxw==
Message-ID: <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
Date: Fri, 21 Jul 2023 19:33:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alyssa@rosenzweig.io, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
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

On 18/07/2023 14.45, Luben Tuikov wrote:
> On 2023-07-17 22:35, Asahi Lina wrote:
>> On 18/07/2023 00.55, Christian König wrote:
>>> Am 15.07.23 um 16:14 schrieb alyssa@rosenzweig.io:
>>>> 15 July 2023 at 00:03, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
>>>>> On 2023-07-14 05:57, Christian König wrote:
>>>>>
>>>>>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>>>>>
>>>>>>> On 14/07/2023 17.43, Christian König wrote:
>>>>>>>
>>>>>>     Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>>>     A signaled scheduler fence can outlive its scheduler, since fences are
>>>>>>     independencly reference counted. Therefore, we can't reference the
>>>>>>     scheduler in the get_timeline_name() implementation.
>>>>>>
>>>>>>     Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>>>     dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>>>
>>>>>>     Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>>>     ---
>>>>>>        drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>>>        drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>>>        include/drm/gpu_scheduler.h              | 5 +++++
>>>>>>        3 files changed, 14 insertions(+), 2 deletions(-)
>>>>>>
>>>>>>     diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>     b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>     index b2bbc8a68b30..17f35b0b005a 100644
>>>>>>     --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>     +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>     @@ -389,7 +389,12 @@ static bool
>>>>>>     drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>>>                   /*
>>>>>>                 * Fence is from the same scheduler, only need to wait for
>>>>>>     -         * it to be scheduled
>>>>>>     +         * it to be scheduled.
>>>>>>     +         *
>>>>>>     +         * Note: s_fence->sched could have been freed and reallocated
>>>>>>     +         * as another scheduler. This false positive case is okay,
>>>>>>     as if
>>>>>>     +         * the old scheduler was freed all of its jobs must have
>>>>>>     +         * signaled their completion fences.
>>>>>>
>>>>>>     This is outright nonsense. As long as an entity for a scheduler exists
>>>>>>     it is not allowed to free up this scheduler.
>>>>>>
>>>>>>     So this function can't be called like this.
>>>>>>
>>>>>>> As I already explained, the fences can outlive their scheduler. That
>>>>>>>     means *this* entity certainly exists for *this* scheduler, but the
>>>>>>>     *dependency* fence might have come from a past scheduler that was
>>>>>>>     already destroyed along with all of its entities, and its address reused.
>>>>>>>
>>>>>>     
>>>>>>     Well this is function is not about fences, this function is a callback
>>>>>>     for the entity.
>>>>>>     
>>>>>>
>>>>>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>>>>>>     being told my comments are "outright nonsense" when you don't even
>>>>>>>     take the time to understand what the issue is and what I'm trying to
>>>>>>>     do/document. If you aren't interested in working with me, I'm just
>>>>>>>     going to give up on drm_sched, wait until Rust gets workqueue support,
>>>>>>>     and reimplement it in Rust. You can keep your broken fence lifetime
>>>>>>>     semantics and I'll do my own thing.
>>>>>>>
>>>>>>     
>>>>>>     I'm certainly trying to help here, but you seem to have unrealistic
>>>>>>     expectations.
>>>>>>     
>>>>>>     I perfectly understand what you are trying to do, but you don't seem to
>>>>>>     understand that this functionality here isn't made for your use case.
>>>>>>     
>>>>>>     We can adjust the functionality to better match your requirements, but
>>>>>>     you can't say it is broken because it doesn't work when you use it not
>>>>>>     in the way it is intended to be used.
>>>>>>
>>>>> I believe "adjusting" functionality to fit some external requirements,
>>>>> may have unintended consequences, requiring yet more and more "adjustments".
>>>>> (Or may allow (new) drivers to do wild things which may lead to wild results. :-) )
>>>>>
>>>>> We need to be extra careful and wary of this.
>>>> Either drm/scheduler is common code that we should use for our driver, in which case we need to "adjust" it to fit the requirements of a safe Rust abstraction usable for AGX.
>>>
>>> Well this is the fundamental disagreement we have. As far as I can see
>>> you don't need to adjust anything in the common drm/scheduler code.
>>>
>>> That code works with quite a bunch of different drivers, including the
>>> Intel XE which has similar requirements to your work here.
>>>
>>> We can talk about gradually improving the common code, but as Luben
>>> already wrote as well this needs to be done very carefully.
>>>
>>>>     Or, drm/scheduler is not common code intended for drivers with our requirements, and then we need to be able to write our own scheduler.
>>>>
>>>> AMD has NAK'd both options, effectively NAK'ing the driver.
>>>>
>>>> I will ask a simple yes/no question: Should we use drm/sched?
>>>
>>> Well, yes.
>>>
>>>>
>>>> If yes, it will need patches like these,
>>>
>>> No, you don't.
>>>
>>> First of all you need to try to adjust your driver to match the
>>> requirements of drm/scheduler and *not* the other way around.
>>>
>>>>     and AMD needs to be ok with that and stop NAK'ing them on sight becuase they don't match the existing requirements.
>>>>
>>>> If no, we will write our own scheduler in Rust, and AMD needs to be ok with that and not NAK it on sight because it's not drm/sched.
>>>>
>>>> Which is it?
>>>>
>>>> Note if we write a Rust scheduler, drm/sched and amdgpu will be unaffected. If we do that and AMD comes back and NAKs it -- as said in this thread would "probably" happen -- then it is impossible for us to upstream a driver regardless of whether we use drm/sched.
>>>>
>>>> Lina has been polite and accommodating while AMD calls her code "outright nonsense" and gets "outright NAK"s, and puts her into an impossible catch-22 where no matter what she does it's NAK'd.
>>>
>>> Well as far as I can see I'm totally polite as well.
>>>
>>> Pointing out that approaches doesn't seem to make sense and NAKing
>>> patches is a perfectly normal part of the review process.
>>>
>>> What you need to to is to take a step back and ask yourself why this
>>> here is facing so much rejection from our side. I have to admit that I
>>> don't seem to be good at explaining that, cause we are obviously talking
>>> past each other, but you don't seem to try hard to understand what I'm
>>> pointing out either.
>>>
>>>> That's not ok.
>>>
>>> As far as I can see it is.
>>>
>>> As maintainer of a commonly used component my first duty is to preserve
>>> the status quo and prevent modifications which are not well thought
>>> through. And to be honest those changes here strongly looks like Lina is
>>> just adjusting the code to match her requirements without looking left
>>> and right first.
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>
>> I give up. You are ignoring everything we say, and rejecting everything
>> we suggest. We've already explained why drm_sched doesn't work for us.
>> I'm tired of repeating the same explanation over and over again only to
>> be ignored and told I'm wrong.
>>
>> I'll start working on a new, much simpler Rust-native scheduler based on
>> the workqueue Rust abstractions which are in review.
>>
>> ~~ Lina
>>
> 
> Perhaps it is worth having a reset and just trying to clarify requirements
> one at a time, even if that involves describing a change on a single line
> in a single file.

I've already tried to explain the issue. The DRM scheduler design, as it 
stands today, makes it impractical to write a safe Rust abstraction for 
it. This is a fact. Christian has repeatedly NAKed my attempts at 
changing it to make such a safe abstraction possible, and is clearly 
opposed to the fundamental lifetime requirements change I am trying to 
make here. Therefore, we are at an impasse.

It's unfortunate, but given this situation, the DRM scheduler will not 
be available to Rust DRM drivers. I thought the goal of the DRM 
subsystem common code was to cater to multiple drivers and usage 
approaches, with an emphasis on doing things "right" and avoiding design 
issues that are common mistakes in driver design. Clearly, this is not 
the case for all of DRM, at least not the DRM scheduler.

In software engineering, complex lifetime requirements are an 
anti-pattern, which is one reason why Rust draws a line between safe and 
unsafe APIs. For a safe API, it is up to the API developer to design it 
such that it cannot be misused in a way that causes memory safety 
issues, and the only lifetime requirements it can impose are those that 
can be expressed in the Rust type system and statically checked at 
compile time. The DRM scheduler's complex chain of lifetime requirements 
cannot, and wrapping it in enough glue to remove those lifetime 
requirements would require about as much code as just rewriting it, as 
well as add unacceptable duplication and overhead.

In kernel Rust, we strive to only have safe APIs for components which 
have no fundamental reason for being unsafe (things like direct memory 
mapping and raw hardware access). The DRM scheduler does not fall into 
one of those "inherently unsafe" categories, so it doesn't make sense to 
provide a raw unsafe API for it. Doing so would just expose Rust code to 
the kind of subtle safety implications that cause memory problems every 
day in C. If I were to use drm_sched's unsafe API "as is" in my driver, 
it would *by far* be the least auditable, most complex usage of unsafe 
code in the entire driver, and I have no confidence that I would be able 
to get it right and keep it right as the driver changes.

I don't see a reason why this cannot be simply fixed in drm_sched, but 
Christian disagrees, and has repeatedly (and strongly) NAKed my attempts 
at doing so, and indeed NAKed the entire premise of the change in 
lifetime requirements itself. So here we are. There is no solution that 
will work for everyone that involves drm_sched.

So I don't have a choice other than to just not use drm_sched and roll 
my own. I will happily move that Rust implementation to common code if 
another Rust driver comes along and wants to use it. I'm not sure if 
that kind of thing can be easily made available to C drivers in reverse, 
but I guess we'll cross that bridge when a C driver expresses interest 
in using it.

So far it seems existing C drivers are happy with drm_sched's design and 
complex lifetime requirements, even though they aren't even documented. 
Perhaps they managed to reverse engineer them from the source, or 
someone told the authors about it (certainly nobody told me when I 
started using drm_sched). Or maybe a bunch of the drm_scheduler users 
are actually broken and have memory safety issues in corner cases. I 
don't know, though if I had to bet, I'd bet on the second option.

Actually, let's do a quick search and find out!

panfrost_remove() -> panfrost_device_fini() -> panfrost_job_fini() -> 
drm_sched_fini()

There is a direct, synchronous path between device removal and 
destroying the DRM scheduler. At no point does it wait for any jobs to 
complete. That's what patch #3 in this series tries to fix.

In fact, it doesn't even keep the entities alive! It calls 
drm_dev_unregister() before everything else, but as the docs for the DRM 
driver lifetimes clearly say (see, docs!), objects visible to userspace 
must survive that and only be released from the release callback. 
drm_sched entities are created/destroyed from 
panfrost_job_open()/panfrost_job_close(), which are called from 
panfrost_open() and panfrost_postclose(), which are the userspace file 
open/close functions.

That one I fix in the Rust abstraction already (that one's relatively 
easy to fix), so it doesn't need a drm_sched patch from my point of 
view, but it is yet another subtle, undocumented lifetime requirement 
that is, evidently, impossible to know about and get right without 
documentation.

Meanwhile, panfrost_fence_ops has no remove() callback, which means 
there is no reference path stopping device removal (and therefore 
scheduler teardown) or even module unload while driver fences are still 
alive. That leads to the UAF patch #2 in this series tries to fix.

In other words, as far as I can tell, the panfrost driver gets 
*everything* wrong when it comes to the DRM scheduler lifetime 
requirements, and will crash and burn if the driver is unbound while 
jobs are in flight, anyone has a file descriptor open at all, or even if 
any shared buffer holding a DRM scheduler fence from it is bound to the 
display controller at that time.

This is why this kind of design is not allowed in Rust. Because nobody 
gets it right. *Especially* not without docs. I assumed, like the 
authors of the Panfrost driver clearly assumed, that the DRM scheduler 
API would not have these crazy undocumented hidden requirements. The 
only reason I found out the hard way is I happen to create and destroy 
schedulers all the time, not just once globally, so I would hit the bugs 
and dangling pointers much more often than Panfrost users who, most 
likely, never unbind their devices. But we both have the same problem.

I think I've done all I can to explain the issues and try to fix them, 
so the ball is in your court now. If you want to keep the current 
design, that's fine, but Rust code will not be a drm_sched user in that 
case. And the rest of the DRM folks in the C world will have to contend 
with these issues and fix all the problems in the C drivers (I'm sure 
panfrost isn't the only one, it's just literally the first one I looked at).

As for me, I'm happy to write a simple workqueue-based Rust scheduler 
suitable for firmware-managed scheduler devices. Honestly, at this 
point, I have very little faith left in my ability to fix all these 
issues in drm_sched (I know there's at least one more lurking, I saw a 
NULL deref but I wasn't able to reproduce it nor divine how it possibly 
happened). That, combined with the hostility from the AMD folks about my 
attempts to improve drm_sched even just a little bit, makes that 
decision very easy.

Farewell, DRM scheduler. It was nice trying to work with you, but things 
just didn't work out. I won't be submitting a v2 to this series myself. 
Please ping me if you fix all these fundamental design issues with 
drm_sched and think I might actually be able to use it safely in Rust 
one day. If the API design is solid and safe and the implementation done 
in a way that inspires confidence at that time maybe we can yank out my 
Rust solution when the time comes and switch back to drm_sched.

Just please don't expect me to do the work any more, I've done 
everything I can and this now has to come from you, not me. I've spent 
way more time understanding drm_sched, auditing its code, understanding 
its design intent, trying to fix it, and getting yelled at for it than 
it would take to write a new, clean, safe Rust scheduler. I don't regret 
some of the time spent (some of the implementation details of drm_sched 
have taught me useful things), but I'm not prepared to spend any more, 
sorry.

~~ Lina

