Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C36B1F9E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6DD10E7BA;
	Thu,  9 Mar 2023 09:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B1210E7BD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 09:15:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 8699741F78;
 Thu,  9 Mar 2023 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678353304;
 bh=5NvQExJBE/2u/mwalmBIy0G1FlF3VvdxJMh+roXHaLw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KbySdjG9+l7bYziRG7wlG0Uny+k+kSCwHuz0PRkGZSuiH0e2GjLTVETfhUFxliLN9
 0BgYaDMv6QGsz/z9oI3hs3XE9Us2YKlYl526TjYqlP6x4PcqpDoDN2n1ReOAXKQukZ
 xgEWb3sefmBsFzJqIO9TYEt/8g6+Eo3SYTuk8tM1NCers6bdARbpAvPl+2VLDf1d+o
 n1baBbYKEeRxORaDt87nOEUNCIH249QGBDwbawpQ1U3+QqD7lXMyAQpnUQbijSSujD
 KNEYqNjWXpWm2bbFi8/ZJwNPg7g8x0IkK+FVPXZC5uzG74iwtS0jtnDVLTy9rjYM1N
 XCJh32fO005nw==
Message-ID: <d36046e6-acf5-89a3-46b4-1c813ca925c8@asahilina.net>
Date: Thu, 9 Mar 2023 18:14:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
 <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
 <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
 <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
 <3e5e0120-50fd-51c0-d817-5b1dc4c14e97@asahilina.net>
 <f93448e6-4133-8a49-a12e-7a7012cb5409@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <f93448e6-4133-8a49-a12e-7a7012cb5409@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 17.05, Christian König wrote:
> Am 09.03.23 um 07:30 schrieb Asahi Lina:
>> On 09/03/2023 05.14, Christian König wrote:
>>>> I think you mean wake_up_interruptible(). That would be
>>>> drm_sched_job_done(), on the fence callback when a job completes, which
>>>> as I keep saying is the same logic used for
>>>> hw_rq_count/hw_submission_limit tracking.
>>> As the documentation to wait_event says:
>>>
>>>    * wake_up() has to be called after changing any variable that could
>>>    * change the result of the wait condition.
>>>
>>> So what you essentially try to do here is to skip that and say
>>> drm_sched_job_done() would call that anyway, but when you read any
>>> variable to determine that state then as far as I can see nothing is
>>> guarantying that order.
>> The driver needs to guarantee that any changes to that state precede a
>> job completion fence signal of course, that's the entire idea of the
>> API. It's supposed to represent a check for per-scheduler (or more
>> specific, but not more global) resources that are released on job
>> completion. Of course if you misuse the API you could cause a problem,
>> but what I'm trying to say is that the API as designed and when used as
>> intended does work properly.
>>
>> Put another way: job completions always need to cause the sched main
>> loop to run an iteration anyway (otherwise we wouldn't make forward
>> progress), and job completions are exactly the signal that the
>> can_run_job() condition may have changed.
>>
>>> The only other possibility how you could use the callback correctly
>>> would be to call drm_fence_is_signaled() to query the state of your hw
>>> submission from the same fence which is then signaled. But then the
>>> question is once more why you don't give that fence directly to the
>>> scheduler?
>> But the driver is supposed to guarantee that the ordering is always 1.
>> resources freed, 2. fence signaled. So you don't need to check for the
>> fence, you can just check for the resource state.
> 
> Yeah, but this is exactly what the dma_fence framework tried to prevent. 
> We try very hard to avoid such side channel signaling :)

Right, and it's fine, I can use the fences directly easily enough. I'm
just trying to explain why my original idea works too, even if it's not
the best solution for other reasons!

Of course I don't have the context of what other drivers are doing or
did historically and what the pitfalls are, so I can't know what the
"right" solution for any of this is in that context. I did my best to
understand the drm_sched code and come up with a solution that works
(which it does) without any more info. When I saw the hw submission
limit stuff, I thought "okay, I need the same thing but with slightly
more complex logic, so let's add a callback so the driver can customize
it and do its own inflight counting".

After this discussion, I can see that this is equivalent to doing the
same check in prepare_job() followed by returning the oldest running
job's fence (as long as there's no race there... it should be fine if
the fence reference is taken first, before the resource check, or if
everything is done within the same critical section taking the firmware
queue lock), so I'm happy to switch to that and drop this patch.

But keep in mind none of this is documented, and there's no way for us
driver authors to understand what we're supposed to do without
documentation. As I said I spent a long time trying to understand
drm_sched, and then my original attempt missed the drm_sched_fini()
issue with dangling jobs and Alyssa managed to hit an oops on the test
branch, I guessed what the problem was from her trace, figured out a way
to reproduce it (the kill-loop glmark2 thing), and fixed it in the next
patch in this series. So even trying my best to figure out how to do
this, reading the code and what scarce docs there are, I managed to miss
something that caused a potential oops on the first try. If I can't even
get the API usage right after spending hours on it trying really hard
not to (because it's not just about my driver, I need the Rust
abstraction to be safe for any driver), there's no way I'm going to
divine what approaches to resource/dependency signaling are
problematic/easy to abuse... the most I can hope for is "I got the
wrapper right and the API/driver interaction is correct and guarantees
forward progress if the driver follows the rules".

So when I submit something, and you reply with "Well complete NAK",
that's just not nice. Honestly, I was kind of upset when I got that
email. It sounded as if you were saying my solution was completely
broken and couldn't work, but no matter how I looked at it I couldn't
figure out how it's broken. And then it took several emails to even
understand what you were suggesting with the prepare_job callback (and
yes, that works too and is probably harder to abuse than a new
callback). I'm trying really hard to make this all work and be correct,
and of course I make mistakes too... but then I look at the code and no
matter what I can come up with it seems to work and be correct, what am
I supposed to do? I'm happy to learn and figure out better approaches
for everything that lead to better drivers, but I need an actual
explanation of the issues, not just a NAK...

I also would appreciate it if people give me the benefit of the doubt
and let me explain what I'm doing and how I'm doing it and how this
hardware works, because the whole thing is subtle to the core and very
different to other GPUs. Honestly, I don't think any reviewer that
hasn't spent hours poring over the driver/abstraction code could
confidently say that a certain subtle sync issue exists at a first pass
(other than for really obvious bad code sequences). I'm happy to look
into issues and I definitely want to know what cases to look at and what
to check for and fix anything we find... but isn't it better if we work
together instead of shouting "this is broken" at the first hint of
possible trouble?

> But putting that issue aside for a moment. What I don't get is when you 
> have such intra queue dependencies, then why can't you check that at a 
> much higher level?
> 
> In other words even userspace should be able to predict that for it's 
> submissions X amount of resources are needed and when all of my 
> submissions run in parallel that won't work.

Technically yes, but we can't trust userspace to honor this, since
overflowing the firmware queue breaks everything, so the kernel has to
do the check... plus we're trying to insulate userspace from the details
of how work is queued at the firmware. We need to support multiple
firmware versions including future ones we can't predict yet without
breaking UAPI, so the less the UAPI depends on firmware details, the
better. That's why at the UAPI level, this is boiled down to a simpler
"max commands per submission" limit that gets passed in the params
struct, which is conservative, and then the kernel can deal with the
actual in-flight count tracking and only submit things to the hardware
when they fit.

In the future we could even support job splitting on the kernel side and
remove the max commands per submission limit altogether (though it
probably still makes sense to have for other reasons, like bounding how
much kernel/firmware memory a single queue can consume, so I'm not sure
this is even worth doing at all).

> Asking the firmware for a status is usually a magnitudes slower than 
> just computing it before submission.

I'm not asking the firmware for status, I'm just asking my own firmware
queue code how many slots are currently free in each backing queue.
That's just based on internal driver state, there is no firmware round trip!

I could technically compute this before submission and figure out how
much work has been queued and pre-populate fences that ensure we never
exceed the max, but honestly that's a lot more code to track job sizes
and I don't think it makes sense when I can just ask "Do we have space?
No? Okay, return the oldest running job fence for now and try again when
it completes" in prepare_job(). Maybe it's faster in pathological cases
to do something fancier, but let's wait until Vulkan works and we can
run real AAA games and see where the bottlenecks are before going down
the optimization road ^^

~~ Lina
