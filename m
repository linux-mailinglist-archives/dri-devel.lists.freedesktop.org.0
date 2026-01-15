Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD928D24B53
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C695410E757;
	Thu, 15 Jan 2026 13:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jVtBKsOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A5E10E756;
 Thu, 15 Jan 2026 13:18:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA73F60195;
 Thu, 15 Jan 2026 13:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFEFC116D0;
 Thu, 15 Jan 2026 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768483135;
 bh=94bEIHtuz+oCiz2I9eGvkEHfUjfc20UTqevCpHXTH6w=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=jVtBKsOoqsuzcJsT/Txb25euLioINuYETJzq2ytrW/p6xbcTUFvfAqJw+W2yj5WnJ
 50ex9fgbUnP83ZEEVRCG/XANIJ++B9y65WR5hgpzfzGD6RqJLCcvkNiKH2aGmjFlpG
 P6tYfytpxlqTVZIH0eY7OJ97LX/5mWDoc9ntAvCN/8bc6fu4vP14vrX+cgpIfHCju0
 Yo4kg5jDrZtBumfZXRDT5aulHwl6FpMOlJv3QzYb9dozx5JJNXA38AD7rNwDdAUunQ
 HVFrtorhN3e+wcZkfqfYTaenNulDhanAulz2vGNvz79nFEqXWA2a7b1Bzf2kx4yYCP
 KOFfAcvPHsorw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 14:18:52 +0100
Message-Id: <DFP6Y7AJ8ET5.259R75H20S4LA@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 07/28] drm/sched: Account entity GPU time
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
 <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
 <5a267bb7-341d-4a68-9fa9-50166ccd528c@igalia.com>
 <DFP5EFORAYIX.6R67Z52W65PL@kernel.org>
 <a9771f12-7d4b-4441-ab01-51fca86f53bd@igalia.com>
In-Reply-To: <a9771f12-7d4b-4441-ab01-51fca86f53bd@igalia.com>
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

On Thu Jan 15, 2026 at 1:52 PM CET, Tvrtko Ursulin wrote:
> On 15/01/2026 12:06, Danilo Krummrich wrote:
>> On Thu Jan 15, 2026 at 9:56 AM CET, Tvrtko Ursulin wrote:
>>> On 14/01/2026 17:48, Danilo Krummrich wrote:
>>>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>>>> +/**
>>>>> + * drm_sched_entity_stats_job_add_gpu_time - Account job execution t=
ime to entity
>>>>> + * @job: Scheduler job to account.
>>>>> + *
>>>>> + * Accounts the execution time of @job to its respective entity stat=
s object.
>>>>> + */
>>>>> +static inline void
>>>>> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>>>>> +{
>>>>> +	struct drm_sched_entity_stats *stats =3D job->entity_stats;
>>>>> +	struct drm_sched_fence *s_fence =3D job->s_fence;
>>>>> +	ktime_t start, end;
>>>>> +
>>>>> +	start =3D dma_fence_timestamp(&s_fence->scheduled);
>>>>> +	end =3D dma_fence_timestamp(&s_fence->finished);
>>>>> +
>>>>> +	spin_lock(&stats->lock);
>>>>> +	stats->runtime =3D ktime_add(stats->runtime, ktime_sub(end, start))=
;
>>>>> +	spin_unlock(&stats->lock);
>>>>> +}
>>>>
>>>> This shouldn't be an inline function in the header, please move to
>>>> sched_entity.c.
>>>
>>> It is not super pretty for a static inline but it was a pragmatic choic=
e
>>> because it doesn't really belong to sched_entity.c. The whole entity
>>> stats object that is. Jobs and entities have only an association
>>> relationship to struct drm_sched_entity_stats. The only caller for this
>>> is even in sched_main.c while other updates are done in and from sched_=
rq.c.
>>=20
>> But you put drm_sched_entity_stats_release() and drm_sched_entity_stats_=
alloc()
>> into sched_entity.c as well, I don't see how that is different.
>
> Indeed I have. Must have had a different reason back when I wrote it. I=
=20
> will move it.

Just to be clear, please leave those in sched_entity.c and move
drm_sched_entity_stats_job_add_gpu_time() in there as well.

>> Besides, the struct is called struct drm_sched_entity_stats, i.e. stats =
of an
>> entity. The documentation says "execution stats for an entity", so it cl=
early
>> belongs to entites, no?
>>=20
>>> So if pragmatic approach is not acceptable I would even rather create a
>>> new file along the lines of sched_entity_stats.h|c. Unless that turns
>>> out would have some other design wart of leaking knowledge of some othe=
r
>>> part of the scheduler (ie wouldn't be fully standalone).
>>=20
>> Given the above, please just move this function into sched_entity.c.
>>=20
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
>>>>> index f825ad9e2260..4c10c7ba6704 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>   =20
>>>>>    	job->sched =3D sched;
>>>>>    	job->s_priority =3D entity->priority;
>>>>> +	job->entity_stats =3D drm_sched_entity_stats_get(entity->stats);
>>>>>   =20
>>>>>    	drm_sched_fence_init(job->s_fence, job->entity);
>>>>>    }
>>>>> @@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *=
job)
>>>>>    		 * been called.
>>>>>    		 */
>>>>>    		dma_fence_put(&job->s_fence->finished);
>>>>> +		drm_sched_entity_stats_put(job->entity_stats);
>>>>>    	} else {
>>>>>    		/* The job was aborted before it has been committed to be run;
>>>>>    		 * notably, drm_sched_job_arm() has not been called.
>>>>> @@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct wor=
k_struct *w)
>>>>>    		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>    	struct drm_sched_job *job;
>>>>>   =20
>>>>> -	while ((job =3D drm_sched_get_finished_job(sched)))
>>>>> +	while ((job =3D drm_sched_get_finished_job(sched))) {
>>>>> +		drm_sched_entity_stats_job_add_gpu_time(job);
>>>>
>>>> Is it really always OK to update this value in the free job work? What=
 if a new
>>>> job gets scheduled concurrently. Doesn't this hurt accuracy, since the=
 entity
>>>> value has not been updated yet?
>>>
>>> What exactly you mean by entity value?
>>>
>>> If a new job gets scheduled concurrently then it is either just about t=
o
>>> run, still running, both of which are not relevant for this finished
>>> job, and once finished will also end up here to have it's duration
>>> accounted against the stats.
>>=20
>> So, what I mean is that the timeframe between a running job's fence bein=
g
>> signaled due to completion and the this same job is being freed in the f=
ree job
>> work by the driver can be pretty big.
>>=20
>> In the meantime the scheduler might have to take multiple decisions on w=
hich
>> entity is next to be scheduled. And by calling
>> drm_sched_entity_stats_job_add_gpu_time() in drm_sched_job_cleanup() rat=
her than
>> when it's finished fence is signaled we give up on accuracy in terms of
>> fairness, while fairness is the whole purpose of this scheduling approac=
h.
>
> Right, so yes, the entity runtime lags the actual situation by the delay=
=20
> between scheduling and running the free worker.
>
> TBH now the problem is I wrote this so long ago that I don't even=20
> remember what was the reason I moved this from the job done callback to=
=20
> the finished worker. Digging through my branches it happened during=20
> April '25. I will try to remind myself while I am making other tweaks.
>
> But in principle, I am not too concerned with this. In practice this=20
> delay isn't really measurable and for actual fairness much, much, bigger=
=20
> issue is the general lack of preemption in many drivers, coupled with=20
> submitting more than one job per entity at a time.

I might be that in your test environment the impact is not that big, but it
depends on CPU scheduler load and also highly depends the configuration of =
the
submit_wq.

So, unless there is a good reason, I don't see why we would not avoid this
latency.
