Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46106B1039
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7E610E6CB;
	Wed,  8 Mar 2023 17:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7797410E6BA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:32:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 96794419B4;
 Wed,  8 Mar 2023 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678296770;
 bh=HWkpUzg9UwVOHkBiXvlyUXvsTrcBh6j30MRpGAK5nWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KDeScRTHTqtyIsgxWn4/K8+dzXSWrtJ0Fz7SbUfNJ6ndPrmKN420iXzRNPSNYfT0X
 P5otNSSfHyom4zIDXDNnAZ89F40It8vG178z9Y5Jm77TW5TUgXhfmGiz9UfjmZKd+b
 cCmlNTdTi4OFHOlIDUUxO9Hxf3qUXI4KLeNZPVNCS1xCyxUHyYe2+ZnnwxGZqo/c9D
 aDkfNQ86zRTjA1WSJ8PrMy5SzMGDwKKvuk307JmGUVk4vThwKu08XA0O6HFylAIfsK
 zI3yjnXbEvvZlJVKYBP3dICi32ELGQhAXvFTr1a3giLkp1jhTVhL8JhhbP6mmt4fyx
 NUMW1j4faWDdw==
Message-ID: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
Date: Thu, 9 Mar 2023 02:32:41 +0900
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
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
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

On 09/03/2023 00.42, Christian König wrote:
> Am 08.03.23 um 16:18 schrieb Asahi Lina:
>> On 08/03/2023 19.03, Christian König wrote:
>>> Am 08.03.23 um 10:57 schrieb Maarten Lankhorst:
>>>> On 2023-03-07 15:25, Asahi Lina wrote:
>>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>>> causes segfaults and other badness when job completion fences are
>>>>> signaled after the scheduler is torn down.
>>>>>
>>>>> Explicitly detach all jobs from their completion callbacks and free
>>>>> them. This makes it possible to write a sensible safe abstraction for
>>>>> drm_sched, without having to externally duplicate the tracking of
>>>>> in-flight jobs.
>>>>>
>>>>> This shouldn't regress any existing drivers, since calling
>>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>>> be a no-op if there are no pending jobs.
>>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 27
>>>>> +++++++++++++++++++++++++--
>>>>>    1 file changed, 25 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 5c0add2c7546..0aab1e0aebdd 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1119,10 +1119,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>    {
>>>>>        struct drm_sched_entity *s_entity;
>>>>> +    struct drm_sched_job *s_job, *tmp;
>>>>>        int i;
>>>>>    -    if (sched->thread)
>>>>> -        kthread_stop(sched->thread);
>>>>> +    if (!sched->thread)
>>>>> +        return;
>>>>> +
>>>>> +    /*
>>>>> +     * Stop the scheduler, detaching all jobs from their hardware
>>>>> callbacks
>>>>> +     * and cleaning up complete jobs.
>>>>> +     */
>>>>> +    drm_sched_stop(sched, NULL);
>>>>> +
>>>>> +    /*
>>>>> +     * Iterate through the pending job list and free all jobs.
>>>>> +     * This assumes the driver has either guaranteed jobs are
>>>>> already stopped, or that
>>>>> +     * otherwise it is responsible for keeping any necessary data
>>>>> structures for
>>>>> +     * in-progress jobs alive even when the free_job() callback is
>>>>> called early (e.g. by
>>>>> +     * putting them in its own queue or doing its own refcounting).
>>>>> +     */
>>>>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>>> +        spin_lock(&sched->job_list_lock);
>>>>> +        list_del_init(&s_job->list);
>>>>> +        spin_unlock(&sched->job_list_lock);
>>>>> +        sched->ops->free_job(s_job);
>>>>> +    }
>>>> I would stop the kthread first, then delete all jobs without spinlock
>>>> since nothing else can race against sched_fini?
>>>>
>>>> If you do need the spinlock, It would need to guard
>>>> list_for_each_entry too.
>>> Well this case here actually should not happen in the first place.
>> "This should not happen in the first place" is how you end up with C
>> APIs that have corner cases that lead to kernel oopses...
>>
>> The idea with Rust abstractions is that it needs to be actually
>> impossible to create memory safety problems for the user of the
>> abstraction, you can't impose arbitrary constraints like "you must wait
>> for all jobs to finish before destroying the scheduler"... it needs to
>> be intrinsically safe.
>>
>>> Jobs depend on their device, so as long as there are jobs there should
>>> also be a reference to the scheduler.
>> These schedulers are created dynamically per userspace queue. The memory
>> management and reference counting involved make it safe to destroy the
>> scheduler even when behind the scenes hardware jobs are still running,
>> as long as drm_sched itself doesn't crash on fences firing without a
>> scheduler (which is what this patch fixes).
> 
> We have originally rejected that approach, but I still think it might 
> work if done right.
> 
>> This is the power of Rust: it forces you to architect your code in a way
>> that you don't have complex high-level dependencies that span the entire
>> driver and are difficult to prove hold. In my driver, you can kill a
>> process and that destroys the drm_sched, closes all GEM objects,
>> everything, even if the GPU is still running jobs from that process. The
>> worst that can happen is that the GPU faults as in-use userspace buffers
>> are unmapped out from under the running user job, but that's fine (GPU
>> faults are recoverable). The actual firmware resources, queues, etc. in
>> use are all kept alive until the commands finish executing (or fault,
>> which is just an abnormal completion), even if the userspace process
>> that owned them is long gone. I've tested this extensively by doing
>> things like large-resolution glmark runs in a loop that get `kill -9`'d
>> repeatedly, and it works very well! Tons of GPU faults but no firmware
>> crashes, no oopses, nothing. And the firmware *will* crash irrecoverably
>> if anything goes wrong with its shared memory structures, so that it
>> doesn't is pretty good evidence that all this works!
> 
> Well testing is no prove at all of a correct design.

Well, I'm guessing you don't have a formal correctness proof for amdgpu
either... ^^

There's actually no way to prove my design is correct, since this is a
reverse engineered driver that talks to proprietary firmware and I don't
have the benefit of both open and internal docs like you AMD people
have, never mind access to firmware source code... all I can do is try
to understand how it should work based on how macOS does things and
running tests, and then design something that should work with it. I
spent months writing a prototype Python driver before even starting on
the real DRM driver (long story...), and I keep going back to it to test
little details of the firmware interface. There's over 3300 lines of
just firmware structure definitions, it's kind of crazy...

But even with all that... this driver has no right to be as stable as it
is, considering I wrote it in just a few months. It hasn't even been a
year since I started working on AGX at all! As I mentioned in the cover
letter, we've gotten zero reports of oopses in production. I tried
fuzzing the UAPI and all I managed to do was crash the firmware after a
lot of GPU faults (that was a subtle firmware data cache coherency
issue, now fixed), the driver itself was fine. I didn't have to debug
the OOM error codepaths when we first started running Xonotic on 8GB RAM
machines with no texture compression support on high quality texture
settings (bad combination...), it all just worked even though all those
error/cleanup paths had never been tested before at all. The only memory
leaks I managed to cause were due to circular references between VMs and
GEM objects (tricky to avoid, I did manage to miss one special case
object in the first driver release...), everything else just cleans
itself up by design. And it's not because I'm a genius or anything like
that... it's because Rust just makes getting all this right *so* much
easier than C.

So I can at least say I'm quite confident that, as long as my
understanding of the firmware structure lifetimes is correct and I
encode it in the Rust object model the driver uses to represent them,
things will work without crashing without relying on high-level
invariants like "you must wait for all job completions before tearing
down the top-level scheduler for a user queue" ^^

>>> What could be is that you have allocated a scheduler instance
>>> dynamically, but even then you should first tear down all entities and
>>> then the scheduler.
>> This is about creating a safe Rust abstraction, so we can't impose
>> requirements on users like that, the abstraction has to take care of it.
>> Unfortunately, the jobs cannot depend on the scheduler at the
>> abstraction level. I tried that (putting a reference counted reference
>> to the scheduler in the job abstraction), but it doesn't work because a
>> job completing can end up dropping the last reference to the scheduler,
>> and then you end up trying to stop and clean up the scheduler from a
>> callback called from the scheduler kthread itself, which deadlocks. We
>> could throw those cleanups into a workqueue or something, but that's
>> just adding bandages around the problem that the drm_sched interface
>> today is just not safe without this patch...
> 
> Well that won't work like this. The scheduler has a pretty clear tear 
> down procedure.

Well... I wouldn't call it "clear". I had to reverse engineer this from
reading drm_sched source code, the docs don't tell you. The entire
documentation of "drm_sched_fini()" is as follows:

"Tears down and cleans up the scheduler."

That's it.

This is why I had so much trouble writing this abstraction, and I spent
hours reading the drm_sched code to understand how it worked in order to
use the API correctly... and yet...

> 
> And that procedure implies that all entities which might provide jobs 
> are destroyed before the scheduler is destroyed.

Yes, I do this: the entity abstraction holds a reference to the
scheduler for this reason, so the scheduler can only be destroyed once
all entities are destroyed. But...
> Destroying the entities in turn cleans up the pending jobs inside of 
> them.

Yes but... none of this cleans up jobs that are already submitted by the
scheduler and in its pending list, with registered completion callbacks,
which were already popped off of the entities.

*That* is the problem this patch fixes!

> We could add a warning when users of this API doesn't do this 
> correctly, but cleaning up incorrect API use is clearly something we 
> don't want here.

It is the job of the Rust abstractions to make incorrect API use that
leads to memory unsafety impossible. So even if you don't want that in
C, it's my job to do that for Rust... and right now, I just can't
because drm_sched doesn't provide an API that can be safely wrapped
without weird bits of babysitting functionality on top (like tracking
jobs outside or awkwardly making jobs hold a reference to the scheduler
and defer dropping it to another thread).

>> Right now, it is not possible to create a safe Rust abstraction for
>> drm_sched without doing something like duplicating all job tracking in
>> the abstraction, or the above backreference + deferred cleanup mess, or
>> something equally silly. So let's just fix the C side please ^^
> 
> Nope, as far as I can see this is just not correctly tearing down the 
> objects in the right order.

There's no API to clean up in-flight jobs in a drm_sched at all.
Destroying an entity won't do it. So there is no reasonable way to do
this at all...

> So you are trying to do something which is not supposed to work in the 
> first place.

I need to make things that aren't supposed to work impossible to do in
the first place, or at least fail gracefully instead of just oopsing
like drm_sched does today...

If you're convinced there's a way to do this, can you tell me exactly
what code sequence I need to run to safely shut down a scheduler
assuming all entities are already destroyed? You can't ask me for a list
of pending jobs (the scheduler knows this, it doesn't make any sense to
duplicate that outside), and you can't ask me to just not do this until
all jobs complete execution (because then we either end up with the
messy deadlock situation I described if I take a reference, or more
duplicative in-flight job count tracking and blocking in the free path
of the Rust abstraction, which doesn't make any sense either).

~~ Lina
