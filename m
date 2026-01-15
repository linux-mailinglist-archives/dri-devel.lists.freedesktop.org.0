Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD2D24623
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 13:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3C310E740;
	Thu, 15 Jan 2026 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sgM70cgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528110E73F;
 Thu, 15 Jan 2026 12:06:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D954B601B6;
 Thu, 15 Jan 2026 12:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358F9C16AAE;
 Thu, 15 Jan 2026 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768478765;
 bh=1zLqS6UrIiqxCeVgF7KQg6HX5nS/nZt8sJ2Yi0vZmEI=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=sgM70cgYgd9DtSFmvzw25EYN3bFfGjFKtS9weeK6IsN9jj4ZG5zTbre90U+rtxrVD
 d0R0+AALvDhw2qi16eUVyUcXD4EFkKAJOAhacd5OnSah0gtCz4XnPbcERG/hhyuCRB
 33ls2j/++JGfLqTaC3KCakKaR3CXHg2l8tLfr8/tTfk+cNdke0KV5WxQxps1mO0R5q
 iQ91Lf7N6Dxp+Il16iJEeXNTXUX/38GDHuWHFbvu5zvLGiVJ0g8lugMSiO/DrkMtK4
 VIdm6/zI9U40NvkH3rIKYtRG5q2JmN6p/qyTvFn9nGDLlW7GvzdErL8xelAA1IVP9C
 lcNom+ZbKYUyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 13:06:02 +0100
Message-Id: <DFP5EFORAYIX.6R67Z52W65PL@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 07/28] drm/sched: Account entity GPU time
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
 <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
 <5a267bb7-341d-4a68-9fa9-50166ccd528c@igalia.com>
In-Reply-To: <5a267bb7-341d-4a68-9fa9-50166ccd528c@igalia.com>
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

On Thu Jan 15, 2026 at 9:56 AM CET, Tvrtko Ursulin wrote:
> On 14/01/2026 17:48, Danilo Krummrich wrote:
>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>> +/**
>>> + * struct drm_sched_entity_stats - execution stats for an entity.
>>> + * @kref: reference count for the object.
>>> + * @lock: lock guarding the @runtime updates.
>>> + * @runtime: time entity spent on the GPU.
>>> + *
>>> + * Because jobs and entities have decoupled lifetimes, ie. we cannot a=
ccess the
>>=20
>> The beginning of this sentence seems slightly broken.
>
> Suggest me an alternative because I don't see it?

Nevermind, I misread, the sentence seems fine gramatically. However,...

>>> + * entity once the job is completed and we know how much time it took =
on the

...this seems wrong. It should say something like "once the job has been ta=
ken
from the entity queue". There is no guarantee that the entity the job origi=
nated
from lives until the job is completed.

>>> + * GPU, we need to track these stats in a separate object which is the=
n
>>> + * reference counted by both entities and jobs.
>>> + */
>>> +struct drm_sched_entity_stats {
>>> +	struct kref	kref;
>>> +	spinlock_t	lock;
>>> +	ktime_t		runtime;
>>=20
>> We can avoid the lock entirely by using a atomic64_t instead. ktime_t is=
 just a
>> typedef for s64.
>
> Later in the series lock is needed (more members get added) so I wanted=
=20
> to avoid the churn of converting the atomic64_t to ktime_t in the fair=20
> policy patch.

Fair enough. Are those subsequently fields in some relationship with the
timestamp, i.e. do those fields need to be updated all together atomically?

>>> +};
>>=20
>> <snip>
>>=20
>>> +/**
>>> + * drm_sched_entity_stats_job_add_gpu_time - Account job execution tim=
e to entity
>>> + * @job: Scheduler job to account.
>>> + *
>>> + * Accounts the execution time of @job to its respective entity stats =
object.
>>> + */
>>> +static inline void
>>> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>>> +{
>>> +	struct drm_sched_entity_stats *stats =3D job->entity_stats;
>>> +	struct drm_sched_fence *s_fence =3D job->s_fence;
>>> +	ktime_t start, end;
>>> +
>>> +	start =3D dma_fence_timestamp(&s_fence->scheduled);
>>> +	end =3D dma_fence_timestamp(&s_fence->finished);
>>> +
>>> +	spin_lock(&stats->lock);
>>> +	stats->runtime =3D ktime_add(stats->runtime, ktime_sub(end, start));
>>> +	spin_unlock(&stats->lock);
>>> +}
>>=20
>> This shouldn't be an inline function in the header, please move to
>> sched_entity.c.
>
> It is not super pretty for a static inline but it was a pragmatic choice=
=20
> because it doesn't really belong to sched_entity.c. The whole entity=20
> stats object that is. Jobs and entities have only an association=20
> relationship to struct drm_sched_entity_stats. The only caller for this=
=20
> is even in sched_main.c while other updates are done in and from sched_rq=
.c.

But you put drm_sched_entity_stats_release() and drm_sched_entity_stats_all=
oc()
into sched_entity.c as well, I don't see how that is different.

Besides, the struct is called struct drm_sched_entity_stats, i.e. stats of =
an
entity. The documentation says "execution stats for an entity", so it clear=
ly
belongs to entites, no?

> So if pragmatic approach is not acceptable I would even rather create a=
=20
> new file along the lines of sched_entity_stats.h|c. Unless that turns=20
> out would have some other design wart of leaking knowledge of some other=
=20
> part of the scheduler (ie wouldn't be fully standalone).

Given the above, please just move this function into sched_entity.c.

>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
>>> index f825ad9e2260..4c10c7ba6704 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>  =20
>>>   	job->sched =3D sched;
>>>   	job->s_priority =3D entity->priority;
>>> +	job->entity_stats =3D drm_sched_entity_stats_get(entity->stats);
>>>  =20
>>>   	drm_sched_fence_init(job->s_fence, job->entity);
>>>   }
>>> @@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *jo=
b)
>>>   		 * been called.
>>>   		 */
>>>   		dma_fence_put(&job->s_fence->finished);
>>> +		drm_sched_entity_stats_put(job->entity_stats);
>>>   	} else {
>>>   		/* The job was aborted before it has been committed to be run;
>>>   		 * notably, drm_sched_job_arm() has not been called.
>>> @@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct work_=
struct *w)
>>>   		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>   	struct drm_sched_job *job;
>>>  =20
>>> -	while ((job =3D drm_sched_get_finished_job(sched)))
>>> +	while ((job =3D drm_sched_get_finished_job(sched))) {
>>> +		drm_sched_entity_stats_job_add_gpu_time(job);
>>=20
>> Is it really always OK to update this value in the free job work? What i=
f a new
>> job gets scheduled concurrently. Doesn't this hurt accuracy, since the e=
ntity
>> value has not been updated yet?
>
> What exactly you mean by entity value?
>
> If a new job gets scheduled concurrently then it is either just about to=
=20
> run, still running, both of which are not relevant for this finished=20
> job, and once finished will also end up here to have it's duration=20
> accounted against the stats.

So, what I mean is that the timeframe between a running job's fence being
signaled due to completion and the this same job is being freed in the free=
 job
work by the driver can be pretty big.

In the meantime the scheduler might have to take multiple decisions on whic=
h
entity is next to be scheduled. And by calling
drm_sched_entity_stats_job_add_gpu_time() in drm_sched_job_cleanup() rather=
 than
when it's finished fence is signaled we give up on accuracy in terms of
fairness, while fairness is the whole purpose of this scheduling approach.

- Danilo
