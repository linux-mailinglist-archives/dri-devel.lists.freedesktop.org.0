Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D4D20A12
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 18:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07410E634;
	Wed, 14 Jan 2026 17:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dqs2jsyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C4610E1CB;
 Wed, 14 Jan 2026 17:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CD56441D6;
 Wed, 14 Jan 2026 17:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9993C4CEF7;
 Wed, 14 Jan 2026 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768412899;
 bh=2wiV/q/zC+XkjZ/cVcpsOvrVpiD/BLMSojQnfCtXnWw=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=Dqs2jsyG0vUz8fUHhgGtgOPiO6A17Ax2BbjwtyDz6gcXdIR2tzqwdP9qfgz7DjQWS
 peWRWvHncAq3qcVeAcflyoszk33XGWKy11179Wwf1RgPT2VId1QzWY2GIEMsn6w2RY
 ejslwFUtDpJCSgCnoHeYcdVSaQAf1ULf8QqpvdqcrNfX5tvG7zn6LXYqLD12HZk5rh
 GksP+irFmKX+SIcHXfj+YO0ZCu0bJbRxtsISIEdUikKAfKdUly035w0VSc/Axy9pyH
 v+NEvEX55ab/5LVVhpUCfb3WPu1vjbpwLZy7pI/MsRUhWUgcRgFZ6X8b5Uo6m+ht4u
 tXkxhh0GekW2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:48:16 +0100
Message-Id: <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 07/28] drm/sched: Account entity GPU time
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
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

On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
> +/**
> + * drm_sched_entity_stats_alloc - Allocate a new struct drm_sched_entity=
_stats object
> + *
> + * Return: Pointer to newly allocated struct drm_sched_entity_stats obje=
ct.
> + */
> +static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)

NIT: This function allocates and initializes the structure, hence something
along the lines of *_new() is a better fit.

> +{
> +	struct drm_sched_entity_stats *stats;
> +
> +	stats =3D kzalloc(sizeof(*stats), GFP_KERNEL);
> +	if (!stats)
> +		return NULL;
> +
> +	kref_init(&stats->kref);
> +	spin_lock_init(&stats->lock);
> +
> +	return stats;
> +}

<snip>

> +/**
> + * struct drm_sched_entity_stats - execution stats for an entity.
> + * @kref: reference count for the object.
> + * @lock: lock guarding the @runtime updates.
> + * @runtime: time entity spent on the GPU.
> + *
> + * Because jobs and entities have decoupled lifetimes, ie. we cannot acc=
ess the

The beginning of this sentence seems slightly broken.

> + * entity once the job is completed and we know how much time it took on=
 the
> + * GPU, we need to track these stats in a separate object which is then
> + * reference counted by both entities and jobs.
> + */
> +struct drm_sched_entity_stats {
> +	struct kref	kref;
> +	spinlock_t	lock;
> +	ktime_t		runtime;

We can avoid the lock entirely by using a atomic64_t instead. ktime_t is ju=
st a
typedef for s64.

> +};

<snip>

> +/**
> + * drm_sched_entity_stats_job_add_gpu_time - Account job execution time =
to entity
> + * @job: Scheduler job to account.
> + *
> + * Accounts the execution time of @job to its respective entity stats ob=
ject.
> + */
> +static inline void
> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
> +{
> +	struct drm_sched_entity_stats *stats =3D job->entity_stats;
> +	struct drm_sched_fence *s_fence =3D job->s_fence;
> +	ktime_t start, end;
> +
> +	start =3D dma_fence_timestamp(&s_fence->scheduled);
> +	end =3D dma_fence_timestamp(&s_fence->finished);
> +
> +	spin_lock(&stats->lock);
> +	stats->runtime =3D ktime_add(stats->runtime, ktime_sub(end, start));
> +	spin_unlock(&stats->lock);
> +}

This shouldn't be an inline function in the header, please move to
sched_entity.c.

> +
>  #endif
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index f825ad9e2260..4c10c7ba6704 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> =20
>  	job->sched =3D sched;
>  	job->s_priority =3D entity->priority;
> +	job->entity_stats =3D drm_sched_entity_stats_get(entity->stats);
> =20
>  	drm_sched_fence_init(job->s_fence, job->entity);
>  }
> @@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  		 * been called.
>  		 */
>  		dma_fence_put(&job->s_fence->finished);
> +		drm_sched_entity_stats_put(job->entity_stats);
>  	} else {
>  		/* The job was aborted before it has been committed to be run;
>  		 * notably, drm_sched_job_arm() has not been called.
> @@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct work_st=
ruct *w)
>  		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *job;
> =20
> -	while ((job =3D drm_sched_get_finished_job(sched)))
> +	while ((job =3D drm_sched_get_finished_job(sched))) {
> +		drm_sched_entity_stats_job_add_gpu_time(job);

Is it really always OK to update this value in the free job work? What if a=
 new
job gets scheduled concurrently. Doesn't this hurt accuracy, since the enti=
ty
value has not been updated yet?

>  		sched->ops->free_job(job);
> +	}
