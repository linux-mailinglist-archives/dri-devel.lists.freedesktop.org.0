Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28C6D923A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C64A10EB3E;
	Thu,  6 Apr 2023 09:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFAE10EB3E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DF7AF42528;
 Thu,  6 Apr 2023 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680771916;
 bh=L2mgRFIsiDrq4UmWAD/bAElglOyJx/ilSQqRLQnCbBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=U4a86YUTEZzifO170+N2QFi7WGWWoj4z4f9W5RP5eHfXd04mqcApRFR+Hz4PPB99o
 O3u2xVKS12xnUUe/0F0H19BMcXzTnAMDRiUn24sapXXi0+tMICoApZQKTmsaQHZbgr
 sNIIo2r86gu1R4q1jLB4dhd8Qxv+TJBPa5RQqevScGgc9gzCY7PkaSE1+bGsvkXAu+
 zy56y4XD4wYshcGbYpQbqcdbycINfy7/Lf5XLhbfnzKBA17Bjfk0406MsjPtxgXAkU
 1iN/CmlOHt5fw85dMZI+oqOi5VLRpsGoLGvX6WW0gkz/yeRhpvJeHmAjzyoLi1hxiJ
 cE9eROoHyWoTQ==
Message-ID: <24fe6e14-0d0a-f874-766d-e8d045d1e80e@asahilina.net>
Date: Thu, 6 Apr 2023 18:05:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, yuq825@gmail.com,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2023 17.27, Daniel Vetter wrote:
> On Thu, 6 Apr 2023 at 10:22, Christian König <christian.koenig@amd.com> wrote:
>>
>> Am 05.04.23 um 18:09 schrieb Luben Tuikov:
>>> On 2023-04-05 10:05, Danilo Krummrich wrote:
>>>> On 4/4/23 06:31, Luben Tuikov wrote:
>>>>> On 2023-03-28 04:54, Lucas Stach wrote:
>>>>>> Hi Danilo,
>>>>>>
>>>>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")
>>>>>>> tries to track the accumulated time that a job was active on the GPU
>>>>>>> writing it to the entity through which the job was deployed to the
>>>>>>> scheduler originally. This is done within drm_sched_get_cleanup_job()
>>>>>>> which fetches a job from the schedulers pending_list.
>>>>>>>
>>>>>>> Doing this can result in a race condition where the entity is already
>>>>>>> freed, but the entity's newly added elapsed_ns field is still accessed
>>>>>>> once the job is fetched from the pending_list.
>>>>>>>
>>>>>>> After drm_sched_entity_destroy() being called it should be safe to free
>>>>>>> the structure that embeds the entity. However, a job originally handed
>>>>>>> over to the scheduler by this entity might still reside in the
>>>>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy()
>>>>>>> already being called and the entity being freed. Hence, we can run into
>>>>>>> a UAF.
>>>>>>>
>>>>>> Sorry about that, I clearly didn't properly consider this case.
>>>>>>
>>>>>>> In my case it happened that a job, as explained above, was just picked
>>>>>>> from the schedulers pending_list after the entity was freed due to the
>>>>>>> client application exiting. Meanwhile this freed up memory was already
>>>>>>> allocated for a subsequent client applications job structure again.
>>>>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to
>>>>>>> reproduce the same corruption over and over again by just using
>>>>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>>>>
>>>>>>> Fixing this issue doesn't seem to be very straightforward though (unless
>>>>>>> I miss something), which is why I'm writing this mail instead of sending
>>>>>>> a fix directly.
>>>>>>>
>>>>>>> Spontaneously, I see three options to fix it:
>>>>>>>
>>>>>>> 1. Rather than embedding the entity into driver specific structures
>>>>>>> (e.g. tied to file_priv) we could allocate the entity separately and
>>>>>>> reference count it, such that it's only freed up once all jobs that were
>>>>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>>>>
>>>>>> My vote is on this or something in similar vain for the long term. I
>>>>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>>>>> more fairness than the current one sometime in the future, which
>>>>>> requires execution time tracking on the entities.
>>>>> Danilo,
>>>>>
>>>>> Using kref is preferable, i.e. option 1 above.
>>>> I think the only real motivation for doing that would be for generically
>>>> tracking job statistics within the entity a job was deployed through. If
>>>> we all agree on tracking job statistics this way I am happy to prepare a
>>>> patch for this option and drop this one:
>>>> https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u
>>> Hmm, I never thought about "job statistics" when I preferred using kref above.
>>> The reason kref is attractive is because one doesn't need to worry about
>>> it--when the last user drops the kref, the release is called to do
>>> housekeeping. If this never happens, we know that we have a bug to debug.
>>
>> Yeah, reference counting unfortunately have some traps as well. For
>> example rarely dropping the last reference from interrupt context or
>> with some unexpected locks help when the cleanup function doesn't expect
>> that is a good recipe for problems as well.
>>
>>> Regarding the patch above--I did look around the code, and it seems safe,
>>> as per your analysis, I didn't see any reference to entity after job submission,
>>> but I'll comment on that thread as well for the record.
>>
>> Reference counting the entities was suggested before. The intentionally
>> avoided that so far because the entity might be the tip of the iceberg
>> of stuff you need to keep around.
>>
>> For example for command submission you also need the VM and when you
>> keep the VM alive you also need to keep the file private alive....
> 
> Yeah refcounting looks often like the easy way out to avoid
> use-after-free issue, until you realize you've just made lifetimes
> unbounded and have some enourmous leaks: entity keeps vm alive, vm
> keeps all the bo alives, somehow every crash wastes more memory
> because vk_device_lost means userspace allocates new stuff for
> everything.

Refcounting everywhere has been working well for us, so well that so far 
all the oopses we've hit have been... drm_sched bugs like this one, not 
anything in the driver. But at least in Rust you have the advantage that 
you can't just forget a decref in a rarely-hit error path (or worse, 
forget an incref somewhere important)... ^^

> If possible a lifetime design where lifetimes have hard bounds and you
> just borrow a reference under a lock (or some other ownership rule) is
> generally much more solid. But also much harder to design correctly
> :-/
> 
>> Additional to that we have some ugly inter dependencies between tearing
>> down an application (potential with a KILL signal from the OOM killer)
>> and backward compatibility for some applications which render something
>> and quit before the rendering is completed in the hardware.
> 
> Yeah I think that part would also be good to sort out once&for all in
> drm/sched, because i915 has/had the same struggle.
> -Daniel
> 

Is this really a thing? I think that's never going to work well for 
explicit sync, since the kernel doesn't even know what BOs it has to 
keep alive for a job... I guess it could keep the entire file and all of 
its objects/VMs/etc alive until all of its submissions complete but... ewww.

Our Mesa implementation synchronously waits for all jobs on context 
destroy for this reason, but if you just kill the app, yeah, you get 
faults as running GPU jobs have BOs yanked out from under them. Kill 
loops make for a good way of testing fault handling...

~~ Lina

