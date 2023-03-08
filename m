Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5286B11B5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1D10E6EA;
	Wed,  8 Mar 2023 19:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD4110E6EA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:06:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 79E5141A42;
 Wed,  8 Mar 2023 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678302368;
 bh=2ZFUPHRiala1ewPgf5jjl+nYdasObPYidSLmF0fc2Bc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=xGK13dGerKtuNyek2vL04pI3DQqhyNkedkXZWtr1m6m/1SXRl4c+TthsqdteAWhE/
 i2gHeHdnlkCgULYw5VHAuyUG9uG50GlTH4IHqTatQGXMU3odhK2xYVXXy8ZjzSV3os
 yqLw75zORDJQMIhTdbQ4TRmv0UUB4a9XmVosIZHFika1KnbH4tmwFMm3QhqtgARAH1
 vPqePeWFXO8gDcYLZDy/BJGtAC57McIW3gvvq7MhyZBQfGxzzsgVcaXUsHdyJM1P3p
 33zheVulpmo+7hZe+FCRJC7EBLkQJQ+wWhxm9e3yWkezxwbipNMAlwdRuRwZJe2vv0
 v5kb64D10sJKQ==
Message-ID: <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
Date: Thu, 9 Mar 2023 04:05:59 +0900
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
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
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

On 09/03/2023 02.57, Christian König wrote:
> Am 08.03.23 um 17:44 schrieb Asahi Lina:
>> On 09/03/2023 00.30, Christian König wrote:
>>> Am 08.03.23 um 15:53 schrieb Asahi Lina:
>>>> [SNIP]
>>>>> The background is that core memory management requires that signaling a
>>>>> fence only depends on signaling other fences and hardware progress and
>>>>> nothing else. Otherwise you immediately run into problems because of
>>>>> circle dependencies or what we call infinite fences.
>>>> And hardware progress is exactly the only dependency here...
>>> Well then you should have a fence for that hardware progress.
>> I do, it's the prior job hardware completion fences that drm_sched
>> already knows about!
>>
>> Yes, I could return those in the prepare callback, it just means I need
>> to start stashing fence references in the underlying firmware job queue
>> command objects so I can find out what is the oldest pending fence is,
>> and return it when a queue is full. As long as drm_sched doesn't mind if
>> I keep giving it fences (since multiple commands can have to complete
>> before there is space) or the occasional already signaled fence (because
>> this process is inherently racy), it should work fine.
> 
> Well this handling is intentional and necessary, but see below for a 
> more in deep explanation.
> 
>> If you think this is the better way, I'll do it that way and drop this
>> patch. It just seemed simpler to do it with another callback, since
>> drm_sched is already tracking those fences and doing a hardware queue
>> limit check anyway, and that way I can avoid tracking the fences down
>> into the hardware queue code... *
> 
> Well it's not the better way, it's the only way that works.
> 
> I have to admit that my bet on your intentions was wrong, but even that 
> use case doesn't work correctly.
> 
> See when your callback returns false it is perfectly possible that all 
> hw fences are signaled between returning that information and processing it.
> 
> The result would be that the scheduler goes to sleep and never wakes up 
> again.

That can't happen, because it will just go into another iteration of the
drm_sched main loop since there is an entity available still.

Rather there is probably the opposite bug in this patch: the can_run_job
logic should be moved into the wait_event_interruptible() condition
check, otherwise I think it can end up busy-looping since the condition
itself can be true even when the can_run_job check blocks it.

But there is no risk of it going to sleep and never waking up because
job completions will wake up the waitqueue by definition, and that
happens after the driver-side queues are popped. If this problem could
happen, then the existing hw_submission_limit logic would be broken in
the same way. It is logically equivalent in how it works.

Basically, if properly done in wait_event_interruptible, it is exactly
the logic of that macro that prevents this race condition and makes
everything work at all. Without it, drm_sched would be completely broken.

> As I said we exercised those ideas before and yes this approach here 
> came up before as well and no it doesn't work.

It can never deadlock with this patch as it stands (though it could busy
loop), and if properly moved into the wait_event_interruptible(), it
would also never busy loop and work entirely as intended. The actual API
change is sound.

I don't know why you're trying so hard to convince everyone that this
approach is fundamentally broken... It might be a bad idea for other
reasons, it might encourage incorrect usage, it might not be the best
option, there are plenty of arguments you can make... but you just keep
trying to make an argument that it just can't work at all for some
reason. Why? I already said I'm happy dropping it in favor of the fences...

It's intended to mirror the hw_submission_limit logic. If you think this
is broken, then that's broken too. They are equivalent mechanisms.

>> This particular issue aside, fairness in global resource allocation is a
>> conversation I'd love to have! Right now the driver doesn't try to
>> ensure that, a queue can easily monopolize certain hardware resources
>> (though one queue can only monopolize one of each, so you'd need
>> something like 63 queues with 63 distinct VMs all submitting
>> free-running jobs back to back in order to starve other queues of
>> resources forever). For starters, one thing I'm thinking of doing is
>> reserving certain subsets of hardware resources for queues with a given
>> priority, so you can at least guarantee forward progress of
>> higher-priority queues when faced with misbehaving lower-priority
>> queues. But if we want to guarantee proper fairness, I think I'll have
>> to start doing things like switching to a CPU-roundtrip submission model
>> when resources become scarce (to guarantee that queues actually release
>> the resources once in a while) and then figure out how to add fairness
>> to the allocation code...
>>
>> But let's have that conversation when we talk about the driver (or maybe
>> on IRC or something?), right now I'm more interested in getting the
>> abstractions reviewed ^^
> 
> Well that stuff is highly problematic as well. The fairness aside you 
> risk starvation which in turn breaks the guarantee of forward progress.
> 
> In this particular case you can catch this with a timeout for the hw 
> operation, but you should consider blocking that from the sw side as well.

In the current state I actually think it's not really that problematic,
because the resources are acquired directly in the ioctl path. So that
can block if starved, but if that can cause overall forward progress to
stop because some fence doesn't get signaled, then so can just not doing
the ioctl in the first place, so there's not much point (userspace can
always misbehave with its fence usage...). By the time anything gets
submitted to drm_sched, the resources are already guaranteed to be
acquired, we never block in the run callback.

It needs to be fixed of course, but if the threat model is a malicious
GPU process, well, there are many other ways to DoS your system... and I
don't think it's very likely that 63+ queues (which usually means 63+
processes with OpenGL) will end up accidentally starving the GPU in a
tight loop at the same time. I'd love to hear about real-world scenarios
where this kind of thing has been a real problem and not just a
theoretical one though... maybe I'm missing something?

Basically my priorities with the driver are:

1. Make sure it never crashes
2. Make sure it works well for real users
3. Make it work smoothly for real users under reasonable load
(priorities, CPU scheduler interactions, etc.)
4. Make it handle accidental problems more gracefully (OOMs etc, I need
to look into private GEM BO accounting to processes so the OOM killer
has better data to work with)
5. Make it more robust against deliberate abuse/starvation (this should
matter more once we have some kind of paravirtualization solution...)

And right now we're somewhere between 2 and 3. So if there are cases
where this resource acquisition stuff can cause a problem for real
users, I'll want to fix it earlier. But if this is more theoretical than
anything (with the resource limits of AGX GPUs), I'd rather focus on
things like memory accounting and shrinker support first.

>> We don't even have a shrinker yet, and I'm sure that's going to be a lot
>> of fun when we add it too... but yes, if we can't do any memory
>> allocations in some of these callbacks (is this documented anywhere?),
>> that's going to be interesting...
> 
> Yes, that is all part of the dma_fence documentation. It's just 
> absolutely not obvious what all this means.

I mean is there any documentation on how this interacts with drm_sched?
Like, am I not allowed to allocate memory in prepare()? What about
run()? What about GPU interrupt work? (not a raw IRQ handler context, I
mean the execution path from GPU IRQ to drm_sched run() fences getting
signaled)

>> It's not all bad news though! All memory allocations are fallible in
>> kernel Rust (and therefore explicit, and also failures have to be
>> explicitly handled or propagated), so it's pretty easy to point out
>> where they are, and there are already discussions of higher-level
>> tooling to enforce rules like that (and things like wait contexts).
>> Also, Rust makes it a lot easier to refactor code in general and not be
>> scared that you're going to regress everything, so I'm not really
>> worried if I need to turn a chunk of the driver on its head to solve
>> some of these problems in the future ^^ (I already did that when I
>> switched it from the "demo" synchronous submission model to the proper
>> explicit sync + fences one.)
> 
> Yeah, well the problem isn't that you run into memory allocation failure.

What I mean is that the mandatory failure handling means it's relatively
easy to audit where memory allocations can actually happen.

> The problem is rather something like this:
> 1. You try to allocate memory to signal your fence.
> 2. This memory allocation can't be fulfilled and goes to sleep to wait 
> for reclaim.
> 3. On another CPU reclaim is running and through the general purpose 
> shrinker, page fault or MMU notifier ends up wait for your dma_fence.
> 
> You don't even need to implement the shrinker for this to go boom 
> extremely easy.

Hmm, can you actually get something waiting on a dma_fence like that
today with this driver? We don't have a shrinker, we don't have
synchronous page faults or MMU notifications for the GPU, and this is
explicit sync so all in/out fences cross over into userspace so surely
they can't be trusted anyway?

I'm definitely not familiar with the intricacies of DMA fences and how
they interact with everything else yet, but it's starting to sound like
either this isn't quite broken for our simple driver yet, or it must be
broken pretty much everywhere in some way...

> So everything involved with signaling the fence can allocate memory only 
> with GFP_ATOMIC and only if you absolutely have to.

I don't think we even have a good story for passing around gfp_flags in
Rust code so that will be interesting... though I need to actually audit
the code paths and see how many allocations we really do. I know I alloc
some vectors for holding completed commands and stuff like that, but I'm
pretty sure I can fix that one with some reworking, and I'm not sure how
many other random things there really are...? Obviously most allocations
happen at command creation time, on completion you mostly get a lot of
freeing, so maybe I can just eliminate all allocs and not worry about
GFP_ATOMIC.

~~ Lina
