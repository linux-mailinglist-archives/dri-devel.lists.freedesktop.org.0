Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B8D3C548
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0E210E5A6;
	Tue, 20 Jan 2026 10:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PKpweqf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B32110E1BA;
 Tue, 20 Jan 2026 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SjakqMqgULXZUBrvJhbtQRUYZHcLZLs5qx8BrGA72Ks=; b=PKpweqf1IBQYkM/B6zSulnZJ1u
 87Uyxz8v9Trkb8IhGP6IQkvl2kZSEr2K9BMqFWSkv7jxk5KZKnYNaGebTplM0FfKVn7gNAbj9GMl/
 gNExZ95zqsjTUGDtJlsIXT3OOblKYyS0ZgurXemYQpZIEnDoEwmMDaGPVOy5ITJ8s91BNHleiztLq
 lEFLOPBKLG1oEeXQ13POVbVQyt+A6UJ6ueBcF65iLkiO8GPh3hX/51eo5IHy3G/WYSEZ1UeszBazi
 GOfl19ylomBylR7koMEB4axYG3yv+mdX6n79cbVCR+Ss/2ZQzEn4oBZRYo7pnix6itb9ZZfaGRd70
 TRnyBK2w==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vi91G-007Wfs-TR; Tue, 20 Jan 2026 11:31:30 +0100
Message-ID: <d23d1b2c-1a60-4246-a144-6cb7137dfb43@igalia.com>
Date: Tue, 20 Jan 2026 10:31:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/28] drm/sched: Account entity GPU time
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
 <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
 <5a267bb7-341d-4a68-9fa9-50166ccd528c@igalia.com>
 <DFP5EFORAYIX.6R67Z52W65PL@kernel.org>
 <a9771f12-7d4b-4441-ab01-51fca86f53bd@igalia.com>
 <DFP6Y7AJ8ET5.259R75H20S4LA@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DFP6Y7AJ8ET5.259R75H20S4LA@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/01/2026 13:18, Danilo Krummrich wrote:
> On Thu Jan 15, 2026 at 1:52 PM CET, Tvrtko Ursulin wrote:
>> On 15/01/2026 12:06, Danilo Krummrich wrote:
>>> On Thu Jan 15, 2026 at 9:56 AM CET, Tvrtko Ursulin wrote:
>>>> On 14/01/2026 17:48, Danilo Krummrich wrote:
>>>>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>>>>> +/**
>>>>>> + * drm_sched_entity_stats_job_add_gpu_time - Account job execution time to entity
>>>>>> + * @job: Scheduler job to account.
>>>>>> + *
>>>>>> + * Accounts the execution time of @job to its respective entity stats object.
>>>>>> + */
>>>>>> +static inline void
>>>>>> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>>>>>> +{
>>>>>> +	struct drm_sched_entity_stats *stats = job->entity_stats;
>>>>>> +	struct drm_sched_fence *s_fence = job->s_fence;
>>>>>> +	ktime_t start, end;
>>>>>> +
>>>>>> +	start = dma_fence_timestamp(&s_fence->scheduled);
>>>>>> +	end = dma_fence_timestamp(&s_fence->finished);
>>>>>> +
>>>>>> +	spin_lock(&stats->lock);
>>>>>> +	stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
>>>>>> +	spin_unlock(&stats->lock);
>>>>>> +}
>>>>>
>>>>> This shouldn't be an inline function in the header, please move to
>>>>> sched_entity.c.
>>>>
>>>> It is not super pretty for a static inline but it was a pragmatic choice
>>>> because it doesn't really belong to sched_entity.c. The whole entity
>>>> stats object that is. Jobs and entities have only an association
>>>> relationship to struct drm_sched_entity_stats. The only caller for this
>>>> is even in sched_main.c while other updates are done in and from sched_rq.c.
>>>
>>> But you put drm_sched_entity_stats_release() and drm_sched_entity_stats_alloc()
>>> into sched_entity.c as well, I don't see how that is different.
>>
>> Indeed I have. Must have had a different reason back when I wrote it. I
>> will move it.
> 
> Just to be clear, please leave those in sched_entity.c and move
> drm_sched_entity_stats_job_add_gpu_time() in there as well.

Yes, done locally.

>>> Besides, the struct is called struct drm_sched_entity_stats, i.e. stats of an
>>> entity. The documentation says "execution stats for an entity", so it clearly
>>> belongs to entites, no?
>>>
>>>> So if pragmatic approach is not acceptable I would even rather create a
>>>> new file along the lines of sched_entity_stats.h|c. Unless that turns
>>>> out would have some other design wart of leaking knowledge of some other
>>>> part of the scheduler (ie wouldn't be fully standalone).
>>>
>>> Given the above, please just move this function into sched_entity.c.
>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index f825ad9e2260..4c10c7ba6704 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>>     
>>>>>>     	job->sched = sched;
>>>>>>     	job->s_priority = entity->priority;
>>>>>> +	job->entity_stats = drm_sched_entity_stats_get(entity->stats);
>>>>>>     
>>>>>>     	drm_sched_fence_init(job->s_fence, job->entity);
>>>>>>     }
>>>>>> @@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>>     		 * been called.
>>>>>>     		 */
>>>>>>     		dma_fence_put(&job->s_fence->finished);
>>>>>> +		drm_sched_entity_stats_put(job->entity_stats);
>>>>>>     	} else {
>>>>>>     		/* The job was aborted before it has been committed to be run;
>>>>>>     		 * notably, drm_sched_job_arm() has not been called.
>>>>>> @@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>>>>>     		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>>     	struct drm_sched_job *job;
>>>>>>     
>>>>>> -	while ((job = drm_sched_get_finished_job(sched)))
>>>>>> +	while ((job = drm_sched_get_finished_job(sched))) {
>>>>>> +		drm_sched_entity_stats_job_add_gpu_time(job);
>>>>>
>>>>> Is it really always OK to update this value in the free job work? What if a new
>>>>> job gets scheduled concurrently. Doesn't this hurt accuracy, since the entity
>>>>> value has not been updated yet?
>>>>
>>>> What exactly you mean by entity value?
>>>>
>>>> If a new job gets scheduled concurrently then it is either just about to
>>>> run, still running, both of which are not relevant for this finished
>>>> job, and once finished will also end up here to have it's duration
>>>> accounted against the stats.
>>>
>>> So, what I mean is that the timeframe between a running job's fence being
>>> signaled due to completion and the this same job is being freed in the free job
>>> work by the driver can be pretty big.
>>>
>>> In the meantime the scheduler might have to take multiple decisions on which
>>> entity is next to be scheduled. And by calling
>>> drm_sched_entity_stats_job_add_gpu_time() in drm_sched_job_cleanup() rather than
>>> when it's finished fence is signaled we give up on accuracy in terms of
>>> fairness, while fairness is the whole purpose of this scheduling approach.
>>
>> Right, so yes, the entity runtime lags the actual situation by the delay
>> between scheduling and running the free worker.
>>
>> TBH now the problem is I wrote this so long ago that I don't even
>> remember what was the reason I moved this from the job done callback to
>> the finished worker. Digging through my branches it happened during
>> April '25. I will try to remind myself while I am making other tweaks.
>>
>> But in principle, I am not too concerned with this. In practice this
>> delay isn't really measurable and for actual fairness much, much, bigger
>> issue is the general lack of preemption in many drivers, coupled with
>> submitting more than one job per entity at a time.
> 
> I might be that in your test environment the impact is not that big, but it
> depends on CPU scheduler load and also highly depends the configuration of the
> submit_wq.
> 
> So, unless there is a good reason, I don't see why we would not avoid this
> latency.

As said, I needed some time to remind myself why I settled on this 
design. Which also means I will document this in the commit message.

There are several reasons actually. On the most basic level, to do it 
from the fence signalling callback would mean at least two locks 
(sched->job_list_lock and entity_stats->lock have to become IRQ safe 
across the code base. Not a deal breaker but good to avoid if feasible.

More importantly, it is a question of the completion timeline and GPU 
time accounting accuracy.

There is that existing, and crucial for accuracy, fence scheduled 
timestamp adjustment code in drm_sched_get_finished_job(). (Look for 
comment "make the scheduler timestamp more accurate".)

When this is done from the worker the ordering is guaranteed. GPU time 
of the head of the pending list will be accounted when it is know to be 
the most accurate it can be. Because it is guaranteed when the next in 
the list is processed that it's scheduled timestamp would have been 
already adjusted, or not needed to be adjusted.

If we move the GPU time accounting to the signalling callback we cannot 
guarantee this any more. If nothing else, the window for opportunistic 
signalling via dma_fence_is_signaled() appears. Could be more reasons 
depending on how drivers do their signaling and which is hidden from the 
scheduler.

In that case, if the callback for the "next" fence fires first the 
scheduled timestamp will not have been adjusted yet. To work around it 
we would need to take the sched->job_list_lock and check for the "not 
head of the list" case, look at the head, which maybe hasn't been 
signalled yet so we would have to assume it (cannot signal from there), 
and adjust. But the previous job could also have been unlinked by then 
so it wouldn't even be reliable. (Parallel thread signals the head, free 
worker runs and unlinks it, all while this callback is running.)

In summary that would be a bit complicated and not even 100% reliable. 
In contrast we have the current design which is both simple and reliable.

While it has the opportunity for GPU time to lag if the free worker is 
delayed, it seems to me those delays are not very relevant in the bigger 
picture. Because "fairness" as approached by the DRM scheduler is a 
loose approximation due more fundamental reasons such as max_credits 
deep submission queues, lack of preemption both in the scheduler and 
some drivers.

Even those same work queue scheduling delays would influence the job 
submission to start with. Ie. if the delays are so bad to influence the 
GPU time fairness, they will be equally bad in ensuring timely (stall 
free) feed of work to the GPU.

Or, if we are talking about the CPU load, there is also the issue of the 
current FIFO and RR algorithms where CPU scheduler decisions influence 
the GPU scheduling even more fundamentally. So the "fair" scheduler is 
even an improvement overall in this aspect since it much better 
decouples the CPU and GPU load when making scheduling decisions.

On balance, I think the current design is good enough for now and it 
does not warrant questionable complications. It could be improved later 
on if it is shown for it to be weaker than expected.

Although I should mention, one other avenue which is already on the 
radar and was prototyped by Pierre-Eric in a different CFS incarnation, 
was something called "late entity selection". That would be something I 
would revisit much rather than the perfect GPU time accounting accuracy. 
Because it can brings impressive user experience gains instantly, even 
without the need for pathological CPU loading.

Hopefully the justification for the simple design sounds agreeable to 
you too. Again, it is something where more accurate and more complicated 
solutions could be revisited on top of the current series if the need 
arises.

Regards,

Tvrtko

