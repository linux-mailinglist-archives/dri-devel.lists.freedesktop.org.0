Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005A6B121F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511F610E146;
	Wed,  8 Mar 2023 19:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2510E146
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 04F8542037;
 Wed,  8 Mar 2023 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678304256;
 bh=bGSmqve6Q1FPtd+ajYOJkWVDvwsz5IUECf9DYdAEDq8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=l3KAZBz67DIrADlxVjsP9aADwc9MBYSxeSyma5bbE93n86EbwmPw9vWiJXjtisZ0q
 avjhhsIer/a3PCMUONJ3FCN5X2lotXnD4Idi4OAu7A4RRMj01UltcWD6a7t71cLIIj
 vuJtJEqAfbJatpwrhRFu3viIJ9h7Oh+qvHoElRhHBHiSB/oZaK0qfAq7YmBlcJNCs6
 VUShYYsOqisv5556rqHxCkLcPWxWCdiQGeDbXo5DaAcIEabW+7FrzTFwSut4xDgVHh
 FRT3wP9tWXZZ2sOcN2Mp8wSumycilGPywC3ixe22hABaSyK1G7Ma4p6sMQGVCQe2aF
 RqTsnWpyB/Zyw==
Message-ID: <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
Date: Thu, 9 Mar 2023 04:37:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
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
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
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

On 09/03/2023 03.12, Christian König wrote:
> Am 08.03.23 um 18:32 schrieb Asahi Lina:
>> [SNIP]
>> Yes but... none of this cleans up jobs that are already submitted by the
>> scheduler and in its pending list, with registered completion callbacks,
>> which were already popped off of the entities.
>>
>> *That* is the problem this patch fixes!
> 
> Ah! Yes that makes more sense now.
> 
>>> We could add a warning when users of this API doesn't do this
>>> correctly, but cleaning up incorrect API use is clearly something we
>>> don't want here.
>> It is the job of the Rust abstractions to make incorrect API use that
>> leads to memory unsafety impossible. So even if you don't want that in
>> C, it's my job to do that for Rust... and right now, I just can't
>> because drm_sched doesn't provide an API that can be safely wrapped
>> without weird bits of babysitting functionality on top (like tracking
>> jobs outside or awkwardly making jobs hold a reference to the scheduler
>> and defer dropping it to another thread).
> 
> Yeah, that was discussed before but rejected.
> 
> The argument was that upper layer needs to wait for the hw to become 
> idle before the scheduler can be destroyed anyway.

Unfortunately, that's not a requirement you can encode in the Rust type
system easily as far as I know, and Rust safety rules mean we need to
make it safe even if the upper layer doesn't do this... (or else we have
to mark the entire drm_sched abstraction unsafe, but that would be a pity).

I know it's a different way of thinking, but it has pretty clear
benefits since with Rust you can actually guarantee that things are safe
overall by just auditing explicitly unsafe code. If we just mark all of
drm_sched unsafe, that means we now need to audit all details about how
the driver uses it for safety. It makes more sense to just make the
abstraction safe, which is much easier to audit.

>>>> Right now, it is not possible to create a safe Rust abstraction for
>>>> drm_sched without doing something like duplicating all job tracking in
>>>> the abstraction, or the above backreference + deferred cleanup mess, or
>>>> something equally silly. So let's just fix the C side please ^^
>>> Nope, as far as I can see this is just not correctly tearing down the
>>> objects in the right order.
>> There's no API to clean up in-flight jobs in a drm_sched at all.
>> Destroying an entity won't do it. So there is no reasonable way to do
>> this at all...
> 
> Yes, this was removed.
> 
>>> So you are trying to do something which is not supposed to work in the
>>> first place.
>> I need to make things that aren't supposed to work impossible to do in
>> the first place, or at least fail gracefully instead of just oopsing
>> like drm_sched does today...
>>
>> If you're convinced there's a way to do this, can you tell me exactly
>> what code sequence I need to run to safely shut down a scheduler
>> assuming all entities are already destroyed? You can't ask me for a list
>> of pending jobs (the scheduler knows this, it doesn't make any sense to
>> duplicate that outside), and you can't ask me to just not do this until
>> all jobs complete execution (because then we either end up with the
>> messy deadlock situation I described if I take a reference, or more
>> duplicative in-flight job count tracking and blocking in the free path
>> of the Rust abstraction, which doesn't make any sense either).
> 
> Good question. We don't have anybody upstream which uses the scheduler 
> lifetime like this.
> 
> Essentially the job list in the scheduler is something we wanted to 
> remove because it causes tons of race conditions during hw recovery.
> 
> When you tear down the firmware queue how do you handle already 
> submitted jobs there?

The firmware queue is itself reference counted and any firmware queue
that has acquired an event notification resource (that is, which is busy
with running or upcoming jobs) hands off a reference to itself into the
event subsystem, so it can get notified of job completions by the
firmware. Then once it becomes idle it unregisters itself, and at that
point if it has no owning userspace queue, that would be the last
reference and it gets dropped. So we don't tear down firmware queues
until they are idle.

(There is a subtle deadlock break in the event module to make this work
out, where we clone a reference to the queue and drop the event
subsystem lock before signaling it of completions, so it can call back
in and take the lock as it unregisters itself if needed. Then the actual
teardown happens when the signaling is complete and that reference clone
is the last one to get dropped.)

If a queue is idle at the firmware level but has upcoming jobs queued in
drm_sched, when those get deleted as part of an explicit drm_sched
teardown (free_job()) the queue notices it lost its upcoming jobs and
relinquishes the event resource if there are no running jobs. I'm not
even sure exactly what order this all happens in in practice (it depends
on structure field order in Rust!), but it doesn't really matter because
either way everything gets cleaned up one way or another.

I actually don't know of any way to actively abort jobs on the firmware,
so this is pretty much the only option I have. I've even seen
long-running compute jobs on macOS run to completion even if you kill
the submitting process, so there might be no way to do this at all.
Though in practice since we unmap everything from the VM anyway when the
userspace stuff gets torn down, almost any normal GPU work is going to
immediately fault at that point (macOS doesn't do this because macOS
effectively does implicit sync with BO tracking at the kernel level...).

By the way, I don't really use the hardware recovery stuff right now.
I'm not even sure if there is a sensible way I could use it, since as I
said we can't exactly abort jobs. I know there are ways to lock up the
firmware/GPU, but so far those have all been things the kernel driver
can prevent, and I'm not even sure if there is any way to recover from
that anyway. The firmware itself has its own timeouts and recovery for
"normal" problems. From the point of view of the driver and everything
above it, in-flight commands during a GPU fault or timeout are just
marked complete by the firmware, after a firmware recovery cycle where
the driver gets notified of the problem (that's when we mark the
commands failed so we can propagate the error). There is no
re-submission or anything, userspace just gets told of the problem but
the queue survives. In the future it might be possible to re-submit
innocent commands (it is possible for a GPU fault to break another
process running concurrently, and this is a problem macOS has too...),
which is still not perfect due to side effects but might work most of
the time, but that depends on the "command patching" stuff I mentioned,
and I'm still not even sure if it will be possible to do safely. There's
a lot of subtlety around what we can and can't do during a firmware
recovery cycle that I haven't even started to investigate yet (the
answer could be "nothing" even).

~~ Lina
