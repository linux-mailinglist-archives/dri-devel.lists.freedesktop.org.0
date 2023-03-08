Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E16B0F1C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6053610E69D;
	Wed,  8 Mar 2023 16:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B676E10E69D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:45:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C825E41F78;
 Wed,  8 Mar 2023 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678293899;
 bh=29Ql9uS0dOj1yvIkv0GVQh4AYL/oVB298bp+u+P9JTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IbIQf0PDYFghhHZMzyX70pEtfpIIh8ebh/ASlD0gXlzpq8Zhn7JeWxp2YDjeFa9/0
 QpUH02RH5KiZpp0jGxAWQE68jfPP1xGlwYI0Zv3EYCNtmvlSlCir2uSF9iAEVY3NKk
 uo+xoSqbDWIvtXz8BYqsWSSqz2voHveOsmpgGlpLA7l6fErEtNBjswxb9MxuZxxnYn
 aV0DKhYHGPVzQoqbJ/v6Gcv10dU2v9omqmZzxpFrRgxJunH6KIpUiUy9yCiCyHXgNc
 Xotalcp7YEqBZlgQsWtGGSs3I0SIQx3x0ep2HONZf7YpaENikJ67g78v5wUrhWbxQ4
 TQuORWWa07OVg==
Message-ID: <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
Date: Thu, 9 Mar 2023 01:44:50 +0900
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
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
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

On 09/03/2023 00.30, Christian König wrote:
> Am 08.03.23 um 15:53 schrieb Asahi Lina:
>> [SNIP]
>>> The background is that core memory management requires that signaling a
>>> fence only depends on signaling other fences and hardware progress and
>>> nothing else. Otherwise you immediately run into problems because of
>>> circle dependencies or what we call infinite fences.
>> And hardware progress is exactly the only dependency here...
> 
> Well then you should have a fence for that hardware progress.

I do, it's the prior job hardware completion fences that drm_sched
already knows about!

Yes, I could return those in the prepare callback, it just means I need
to start stashing fence references in the underlying firmware job queue
command objects so I can find out what is the oldest pending fence is,
and return it when a queue is full. As long as drm_sched doesn't mind if
I keep giving it fences (since multiple commands can have to complete
before there is space) or the occasional already signaled fence (because
this process is inherently racy), it should work fine.

If you think this is the better way, I'll do it that way and drop this
patch. It just seemed simpler to do it with another callback, since
drm_sched is already tracking those fences and doing a hardware queue
limit check anyway, and that way I can avoid tracking the fences down
into the hardware queue code... *

(But I still maintain what I'm trying to do here is entirely correct and
deadlock-free! If you prefer I use prepare_job and return prior job
fences from that instead, that's very different from NAKing the patch
saying it's broken...)

* If you're wondering how the fences get signaled at all then: callback
closures that capture a reference to the fence when firmware commands
are constructed and submitted. I know, I know, fancy Rust stuff... ^^
If you'd rather have me use the fences for the blocking, I'll probably
just drop the signaling bit from the closures so we don't need to keep
two redundant fence references in different places per command. I still
need the closures for command completion processing though, since I use
them to process statistics too...

>>> Jason Ekstrand gave a create presentation on that problem a few years
>>> ago on LPC. I strongly suggest you google that one up.
>> Faith Ekstrand (it looks like you mistyped that name...)
> 
> My fault I was really just mistyping that :)

It's all good ^^

> 
> I see that we have a disconnection here. As far as I can see you can use 
> the can_run callback in only three ways:
> 
> 1. To check for some userspace dependency (We don't need to discuss 
> that, it's evil and we both know it).
> 
> 2. You check for some hw resource availability. Similar to VMID on 
> amdgpu hw.
> 
>      This is what I think you do here (but I might be wrong).

It isn't... I agree, it would be problematic. It doesn't make any sense
to check for global resources this way, not just because you might
deadlock but also because there might be nothing to signal to the
scheduler that a resource was freed at all once it is!

> But this 
> would be extremely problematic because you can then live lock.
>      E.g. queue A keeps submitting jobs which take only a few resources 
> and by doing so delays submitting jobs from queue B indefinitely.

This particular issue aside, fairness in global resource allocation is a
conversation I'd love to have! Right now the driver doesn't try to
ensure that, a queue can easily monopolize certain hardware resources
(though one queue can only monopolize one of each, so you'd need
something like 63 queues with 63 distinct VMs all submitting
free-running jobs back to back in order to starve other queues of
resources forever). For starters, one thing I'm thinking of doing is
reserving certain subsets of hardware resources for queues with a given
priority, so you can at least guarantee forward progress of
higher-priority queues when faced with misbehaving lower-priority
queues. But if we want to guarantee proper fairness, I think I'll have
to start doing things like switching to a CPU-roundtrip submission model
when resources become scarce (to guarantee that queues actually release
the resources once in a while) and then figure out how to add fairness
to the allocation code...

But let's have that conversation when we talk about the driver (or maybe
on IRC or something?), right now I'm more interested in getting the
abstractions reviewed ^^

> 3. You have an intra queue dependency. E.g. you have jobs which take X 
> amount of resources, you can submit only to a specific limit.
>      But in this case you should be able to return fences from the same 
> queue as dependency and won't need that callback.

Yes, I can do this. I can just do the same check can_run_job() does and
if it fails, pick the oldest job in the full firmware queue and return
its fence (it just means I need to keep track of those fences there, as
I said above).

>      We would just need to adjust drm_sched_entity_add_dependency_cb() a 
> bit because dependencies from the same queue are currently filtered out 
> because it assumes a pipeline nature of submission (e.g. previous 
> submissions are finished before new submissions start).

Actually that should be fine, because I'd be returning the underlying
hardware completion fences (what the run() callback returns) which the
driver owns, and wouldn't be recognized as belonging to the sched.

>> I actually know I have a different theoretical deadlock issue along
>> these lines in the driver because right now we grab actually global
>> resources (including a VMID) before job submission to drm_sched. This is
>> a known issue, and to fix it without reducing performance I need to
>> introduce some kind of "patching/fixup" system for firmware commands
>> (because we need to inject those identifiers in dozens of places, but we
>> don't want to construct those commands from scratch at job run time
>> because that introduces latency at the wrong time and makes error
>> handling/validation more complicated and error-prone), and that is
>> exactly what should happen in prepare_job, as you say. And yes, at that
>> point that should use fences to block when those resources are
>> exhausted. But that's a different discussion we should have when
>> reviewing the driver, it has nothing to do with the DRM abstractions nor
>> the can_run_job callback I'm adding here nor the firmware queue length
>> limit issue! (And also the global hardware devices are plentiful enough
>> that I would be very surprised if anyone ever deadlocks it in practice
>> even with the current code, so I honestly don't think that should be a
>> blocker for driver submission either, I can and will fix it later...)
> 
> Well this is what I thought about those problems in amdgpu as well and 
> it totally shipwrecked.
> 
> We still have memory allocations in the VMID code path which I'm still 
> not sure how to remove.

We don't even have a shrinker yet, and I'm sure that's going to be a lot
of fun when we add it too... but yes, if we can't do any memory
allocations in some of these callbacks (is this documented anywhere?),
that's going to be interesting...

It's not all bad news though! All memory allocations are fallible in
kernel Rust (and therefore explicit, and also failures have to be
explicitly handled or propagated), so it's pretty easy to point out
where they are, and there are already discussions of higher-level
tooling to enforce rules like that (and things like wait contexts).
Also, Rust makes it a lot easier to refactor code in general and not be
scared that you're going to regress everything, so I'm not really
worried if I need to turn a chunk of the driver on its head to solve
some of these problems in the future ^^ (I already did that when I
switched it from the "demo" synchronous submission model to the proper
explicit sync + fences one.)

~~ Lina
