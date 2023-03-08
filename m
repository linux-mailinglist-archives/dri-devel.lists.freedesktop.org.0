Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C16B0BED
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E30010E5F5;
	Wed,  8 Mar 2023 14:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F8B10E5F6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 14:54:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 77318419B4;
 Wed,  8 Mar 2023 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678287241;
 bh=+F2IE9mYcrZU9xlDbgO4z41NX87Z8Z/O5LvIJKtyeMY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ztMiA7oVkDrIm0IJcNP8cghNEdjwO4Bp4sfNi+CEwU60gJKGmq6DoT4wxKI2aeQ+j
 RIXIheVLmjEbHvDfVNFY4pY0mNYgLrpmHrJ9Syfj3JAsqa5J0yIAaUjleNiJIC59bp
 nJ67E45kQ5f36WrSgRAtQ7kO19dnQrmgtnralQ7zBxPp0ExMSOs4NptX/f7Q5KTxbd
 EhB0UWjuXFAuFanI6hPckpWJyPVmk7/cJuLBg5W+OxLSxWmaxSlGgOA50uefH8bE64
 ZJoUHChD8Irel5Ce3ju+PT91TgmhHcTjXFRlGoI9mkZ27JqPLaiAR7H9IX23IOlxcj
 bcnp5P3N/oE6A==
Message-ID: <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
Date: Wed, 8 Mar 2023 23:53:52 +0900
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
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
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

On 08/03/2023 19.00, Christian König wrote:
> Am 08.03.23 um 10:41 schrieb Asahi Lina:
>> On 08/03/2023 17.46, Christian König wrote:
>>> Am 07.03.23 um 15:25 schrieb Asahi Lina:
>>>> Some hardware may require more complex resource utilization accounting
>>>> than the simple job count supported by drm_sched internally. Add a
>>>> can_run_job callback to allow drivers to implement more logic before
>>>> deciding whether to run a GPU job.
>>> Well complete NAK.
>>>
>>> This is clearly going against the idea of having jobs only depend on
>>> fences and nothing else which is mandatory for correct memory management.
>>>
>>> If the hw is busy with something you need to return the fence for this
>>> from the prepare_job callback so that the scheduler can be notified when
>>> the hw is available again.
>> I think you misunderstood the intent here... This isn't about job
>> dependencies, it's about in-flight resource limits.
>>
>> drm_sched already has a hw_submission_limit that specifies the number of
>> submissions that can be in flight, but that doesn't work for us because
>> each job from drm_sched's point of view consists of multiple commands
>> split among 3 firmware queues. The firmware can only support up to 128
>> work commands in flight per queue (barriers don't count), otherwise it
>> overflows a fixed-size buffer.
>>
>> So we need more complex accounting of how many underlying commands are
>> in flight per queue to determine whether it is safe to run a new job,
>> and that is what this callback accomplishes. This has to happen even
>> when individual jobs have no buffer/resource dependencies between them
>> (which is what the fences would express).
> 
> Yeah, I already assumed that you have something like this.
> 
> And to make it clear this is unfortunately a complete NAK to this 
> approach! You can't do this!

I think you still have some significant misconception about how this
driver works and uses drm_sched... I would appreciate it if you listen
and try to understand the design before giving hard NAKs... (this isn't
a Radeon)

> The background is that core memory management requires that signaling a 
> fence only depends on signaling other fences and hardware progress and 
> nothing else. Otherwise you immediately run into problems because of 
> circle dependencies or what we call infinite fences.

And hardware progress is exactly the only dependency here...

> Jason Ekstrand gave a create presentation on that problem a few years 
> ago on LPC. I strongly suggest you google that one up.

Faith Ekstrand (it looks like you mistyped that name...) is the person
who proposed that I should use drm_sched in this way (see below), we've
had a few private meetings about this design ^^

>> You can see the driver implementation of that callback in
>> drivers/gpu/drm/asahi/queue/mod.rs (QueueJob::can_run()), which then
>> calls into drivers/gpu/drm/asahi/workqueue.rs (Job::can_submit()) that
>> does the actual available slot count checks.
>>
>> The can_run_job logic is written to mirror the hw_submission_limit logic
>> (just a bit later in the sched main loop since we need to actually pick
>> a job to do the check), and just like for that case, completion of any
>> job in the same scheduler will cause another run of the main loop and
>> another check (which is exactly what we want here).
> 
> Yeah and that hw_submission_limit is based on a fence signaling again.

I don't think so...? It's just an atomic that gets checked in
drm_sched_ready(). There are no extra fences involved (other than the
job completion fences that trigger another scheduler run). The idea is
that when the hardware queue makes forward progress you check against
the limit again and submit more jobs as needed. I'm doing the same exact
thing, I'm just using more complex logic for the notion of in-flight
queue limits!

> When you have some firmware limitation that a job needs resources which 
> are currently in use by other submissions then those other submissions 
> have fences as well and you can return those in the prepare_job callback.
> 
> If those other submissions don't have fences, then you have a major 
> design problem inside your driver and we need to get back to square one 
> and talk about that dependency handling.

I think we have a disconnect in our views of what is going on here...

This hardware has firmware-side scheduling with an arbitrary (as far as
I know) number of queues. There is one scheduler instance and one entity
per userspace queue (not global!). These queues process jobs in some
logical sequence, though at the firmware level they get split into up to
three queues each (and there is some parallelism allowed). The
limitation here is in the number of in-flight jobs per firmware queue,
not global.

There is no way for things to deadlock. If jobs have been submitted to
the firmware queue, that means their dependencies were signaled already.
Jobs have intra-job dependencies via driver barriers (which drm_sched
knows nothing about), but the submission code in the driver guarantees
that they are deadlock-free since you can only barrier on past commands,
which by definition submit first.

If a firmware queue is full, drm_sched blocks. Since it is full, that
means it will run those commands (since they have no outside
dependencies and they are already queued and ready to run by the
firmware), eventually space will be freed, and each time a job completes
drm_sched will do the can_run_job check again and decide whether to run
a new job.

Since the firmware queues contain commands which only have past-facing
barriers on other already submitted commands, by definition they will
become empty at some point as long as the firmware is making forward
progress. And therefore, by definition, can_run_job will eventually
return true at some point after a job completion fence is signaled (the
one for the last job submitted prior). There is a check in the driver to
ensure that we do not allow submissions which, by themselves, would
exceed the queued command limit (we actually just limit to 64 commands
overall right now, which is conservative but seems reasonable given the
128-per-firmware-queue limit).

I get the feeling that you are conflating pending jobs with submitted
jobs. This isn't about how many jobs you can have pending in drm_sched
before running them or anything like that. Of course, at that point,
arbitrary dependencies come into play and you can end up with deadlocks
on dependency fences. But that's not the case here. What can_run_job is
waiting on is guaranteed to make forward progress.

>> This case (potentially scheduling more than the FW job limit) is rare
>> but handling it is necessary, since otherwise the entire job
>> completion/tracking logic gets screwed up on the firmware end and queues
>> end up stuck (I've managed to trigger this before).
> 
> Actually that's a pretty normal use case. I've have rejected similar 
> requirements like this before as well.
> 
> For an example how this can work see amdgpu_job_prepare_job(): 
> https://elixir.bootlin.com/linux/v6.3-rc1/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L251
> 
> The gang submit gives and example of a global fence lock and the VMIDs 
> are an example of a global shared firmware resource.

But the resource can_run_job is checking on isn't globally shared! It's
specific to this scheduler instance, just like hw_submission_limit is,
so as long as the firmware behind the scheduler is making forward
progress, the resource will be guaranteed to be freed until another job
can run.

I actually know I have a different theoretical deadlock issue along
these lines in the driver because right now we grab actually global
resources (including a VMID) before job submission to drm_sched. This is
a known issue, and to fix it without reducing performance I need to
introduce some kind of "patching/fixup" system for firmware commands
(because we need to inject those identifiers in dozens of places, but we
don't want to construct those commands from scratch at job run time
because that introduces latency at the wrong time and makes error
handling/validation more complicated and error-prone), and that is
exactly what should happen in prepare_job, as you say. And yes, at that
point that should use fences to block when those resources are
exhausted. But that's a different discussion we should have when
reviewing the driver, it has nothing to do with the DRM abstractions nor
the can_run_job callback I'm adding here nor the firmware queue length
limit issue! (And also the global hardware devices are plentiful enough
that I would be very surprised if anyone ever deadlocks it in practice
even with the current code, so I honestly don't think that should be a
blocker for driver submission either, I can and will fix it later...)

~~ Lina
