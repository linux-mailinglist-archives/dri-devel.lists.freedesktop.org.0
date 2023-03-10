Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7E6B3A14
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26E710E991;
	Fri, 10 Mar 2023 09:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256E210E991
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:17:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C911242458;
 Fri, 10 Mar 2023 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678439823;
 bh=byVIkKMWTjR5Cmmkm2Sp0a3H/NhMOyuFcm8eO+lduw0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GFcv0+O/5n+8+AJuByxDlTv+ETZEtPpn0IGI1rL3l+wdJRFBLIFKEi20htg6gpqYC
 gKhQFbAjkpgl8b9Bom9Oe2pDywjci1y671teftJpwKSbxBfKREWnx0ALiD+lQk48qL
 x3u30njGL1YIyrKgvmGBM7/wku/rawL3uupmvSQ4qLNboPqku9ZMK+hun9JP8/mESk
 SowUGQcrRTGiiUlgSYHV2LXRlhw78QOqbLOkV4SIGlelO/4ekH6D5av4SdSqx0xxXs
 DQcfpvFXU/ONTz6Cnn05CtrYZukcnBM4gdVO0alOrehj5kbxxcFL5VSQ9SKkGpZxSh
 Wox7Qpbe39hyQ==
Message-ID: <146ef94e-d3ac-c978-025a-b3a9ec3026a6@asahilina.net>
Date: Fri, 10 Mar 2023 18:16:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Faith Ekstrand <faith.ekstrand@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
 <d36046e6-acf5-89a3-46b4-1c813ca925c8@asahilina.net>
 <f89fad4d05bc1e603fb166569e20102ceb09fb4c.camel@collabora.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <f89fad4d05bc1e603fb166569e20102ceb09fb4c.camel@collabora.com>
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
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/03/2023 03.50, Faith Ekstrand wrote:
> Jumping in here quick... (Sorry, I was out yesterday and was ignoring
> my e-mail on Tuesday so I could finally type some compiler code.)
> 
> On Thu, 2023-03-09 at 18:14 +0900, Asahi Lina wrote:
>> On 09/03/2023 17.05, Christian König wrote:
>>> Am 09.03.23 um 07:30 schrieb Asahi Lina:
>>>> On 09/03/2023 05.14, Christian König wrote:
>>>>>> I think you mean wake_up_interruptible(). That would be
>>>>>> drm_sched_job_done(), on the fence callback when a job
>>>>>> completes, which
>>>>>> as I keep saying is the same logic used for
>>>>>> hw_rq_count/hw_submission_limit tracking.
>>>>> As the documentation to wait_event says:
>>>>>
>>>>>    * wake_up() has to be called after changing any variable
>>>>> that could
>>>>>    * change the result of the wait condition.
>>>>>
>>>>> So what you essentially try to do here is to skip that and say
>>>>> drm_sched_job_done() would call that anyway, but when you read
>>>>> any
>>>>> variable to determine that state then as far as I can see
>>>>> nothing is
>>>>> guarantying that order.
>>>> The driver needs to guarantee that any changes to that state
>>>> precede a
>>>> job completion fence signal of course, that's the entire idea of
>>>> the
>>>> API. It's supposed to represent a check for per-scheduler (or
>>>> more
>>>> specific, but not more global) resources that are released on job
>>>> completion. Of course if you misuse the API you could cause a
>>>> problem,
>>>> but what I'm trying to say is that the API as designed and when
>>>> used as
>>>> intended does work properly.
>>>>
>>>> Put another way: job completions always need to cause the sched
>>>> main
>>>> loop to run an iteration anyway (otherwise we wouldn't make
>>>> forward
>>>> progress), and job completions are exactly the signal that the
>>>> can_run_job() condition may have changed.
>>>>
>>>>> The only other possibility how you could use the callback
>>>>> correctly
>>>>> would be to call drm_fence_is_signaled() to query the state of
>>>>> your hw
>>>>> submission from the same fence which is then signaled. But then
>>>>> the
>>>>> question is once more why you don't give that fence directly to
>>>>> the
>>>>> scheduler?
>>>> But the driver is supposed to guarantee that the ordering is
>>>> always 1.
>>>> resources freed, 2. fence signaled. So you don't need to check
>>>> for the
>>>> fence, you can just check for the resource state.
>>>
>>> Yeah, but this is exactly what the dma_fence framework tried to
>>> prevent. 
>>> We try very hard to avoid such side channel signaling :)
>>
>> Right, and it's fine, I can use the fences directly easily enough.
>> I'm
>> just trying to explain why my original idea works too, even if it's
>> not
>> the best solution for other reasons!
>>
>> Of course I don't have the context of what other drivers are doing or
>> did historically and what the pitfalls are, so I can't know what the
>> "right" solution for any of this is in that context. I did my best to
>> understand the drm_sched code and come up with a solution that works
>> (which it does) without any more info. When I saw the hw submission
>> limit stuff, I thought "okay, I need the same thing but with slightly
>> more complex logic, so let's add a callback so the driver can
>> customize
>> it and do its own inflight counting".
> 
> So, I think there's a difference here between "impossible to implement
> correctly", "likely to be implemented correctly", and "impossible to
> implement incorrectly".  It's obviously possible to implement
> correctly.  You can just always return true or do exactly the same
> check or do some simple thing where you can guarantee that it will only
> ever return false when there's a bunch of other stuff in the queue. 
> That doesn't mean that it's likely to be implemented correctly by some
> other driver.  Some idiot will come along and try to take advantage of
> it and cause themselves horrible problems.
> 
> And, to be clear, for the purposes of this discussion, we're ALL
> idiots, myself included.  If there's one thing the DRM community has
> learned over the years, it's that drivers are so complex that we all
> turn into idiots at some point, relative to the complexity of the code
> and hardware behavior.  That's why things like dma_fence are written so
> incredibly defensively and why we're so harsh about the rules.  It's
> the rules and not our individual smarts that keep us from making
> mistakes.  (Kinda like Rust, in a way.)  So while I appreciate the
> frustration of "I'm just trying to do something that's clearly correct
> here", that doesn't mean that then next person to come by and fix a bug
> by tweaking that callback isn't going to screw it up irreparably.  That
> person may even be you in 6 to 12 months after this e-mail thread is a
> distant memory.
> 
> So, yes, does the implementation you have today work without deadlocks
> or starvation?  Maybe it does.  I've not verified.  Is the suggested
> callback a giant foot-gun in the already treacherous territory of
> scheduling and fencing?  Yeah, it probably is and there's another way
> to implement the same behavior which is likely safer in the long run.

I understand that... I just wish the response had been along the lines
of "this is a huge footgun for these reasons, and you don't need it
because you can do it this other way instead", not "the concept is
completely broken, NAK".

If the discussion were phrased around how the API can be used and
abused, then I can understand what the concern is. But it was somehow
always about me and what I'm doing...

> This is clearly going against the idea of having jobs only depend on 
> fences and nothing else which is mandatory for correct memory management.

That implies what I'm doing breaks memory management (and that it is
obvious).

> And to make it clear this is unfortunately a complete NAK to this 
> approach! You can't do this!

Again that I can't do it... and then we got an argument over whether the
code is actually broken or not. But that doesn't even matter, since the
issue is how easy the API is to use or misuse, not whether I actually
misuse it...

I'll switch to prepare_job() fences for the next version, so it's not an
issue. Using that didn't even cross my mind because, knowing nothing
about the intended usage here, the prepare_job() callback docs are quite
obtuse:

> Called when the scheduler is considering scheduling this job next> to get another struct dma_fence for this job to block on. Once i>
returns NULL, run_job() may be called.
> 
> Can be NULL if no additional preparation to the dependencies are necessary.> Skipped when jobs are killed instead of run.

What's a "dependency"? To me that sounded like execution dependencies,
and we clearly express those in the jobs themselves ahead of time. But
it turns out the purpose of this callback is to grab resources just in
time before execution or block on them becoming available through a
fence, and then it makes a lot more sense how to use it to do in-flight
command count limiting.

Aside: now that I understand this, I'm tempted to make the Rust
signature for this return a Result<(), Fence>. Returning a fence is
essentially the "error" case here, and that means in the implementation
you can just do:

if job.foo_res.is_none() {
    job.foo_res = Some(foo.get_resource()?);
}
if job.bar_res.is_none() {
    job.bar_res = Some(bar.get_resource()?);
}

As long as all the get_resource() calls return a Result<Resource, Fence>.

There's even more undocumented subtlety here though, since as far as I
can tell if all the resources aren't always grabbed in the same order,
or more than one of a single resource is grabbed separately you could
deadlock or even livelock?

This is theoretical since right now I don't handle this properly at all
other than the command count limit (I need the command struct fixup
system for this to be reasonably possible), but for example, I'll need
1-3 event IDs per job, and if I grab them one by one, you could end up
deadlocking with all event IDs used by jobs waiting for more. And if I
don't store them eagerly (so drop the IDs if you can't get all of them),
then you can end up with livelocks where every scheduler is grabbing an
ID, then dropping it when we can't get another one, which signals a
fence for another blocked scheduler to grab another ID, which then drops
it because it can't get more, etc. So I probably need to grab a number
of event IDs atomically.

> Also, in a weird way, I think these conversations are sometimes better
> than documentation.  It took a while to get around to it all but
> there's a lot of context that was brought together in this e-mail
> thread that wouldn't have been in the docs no matter how good they are.
> A lot of it isn't an isolated thing that should clearly be explained in
> the run_job docs.  It's subtle interactions which happen when all the
> pieces come together.  I see this complaint a lot about Vulkan as well.
> There are behaviors which only become evident when you find the right 5
> pieces of the spec and put them all together and squint.  It'd be good
> to call those out sometimes but there's no way we can document all of
> them.

That's true, but I think we could improve things a lot even with just
better docs and more hyperlinking between docs... For example, the GEM
and DMA fence docs do have quite a bit of prose that gets you some
context (even if it's a bit outdated and not complete). But drm_sched
just has one paragraph and a list giving a high-level design, and then
goes straight into function docs. It definitely takes putting together
the sched, fence, dma_resv, etc. docs together to get the big picture,
but if those docs all at least point at each other and are individually
reasonably complete, then we'd have a chance ^^

~~ Lina
