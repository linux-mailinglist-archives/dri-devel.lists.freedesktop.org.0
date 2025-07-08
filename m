Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FABAFCA37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405FD10E612;
	Tue,  8 Jul 2025 12:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KC4VngdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7B810E610;
 Tue,  8 Jul 2025 12:19:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bc0Xg2rbbz9smB;
 Tue,  8 Jul 2025 14:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751977171; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSI5LAmi3mMBYhT7ZREIYI+TQpGMUQHtGlN0jXwacUc=;
 b=KC4VngdOsQRoBoCvULF6lcyQM4BIy0cmzy2ftJ0BONP/W11QMxgeCD+XsczrezjTCq1dFE
 VGebNF0x64adNikodPfvQTSwD/dkJNaq6KX71xi7RAWrTKgVHMcPy9ehqXVgyjJXuIDXkx
 HIxtB2the4vhMqbEu7AbFyrXEdr+EwqoqhQg0jxVY/6heW+irp609OgeiSXrf3+X93XXs5
 eeGaYa7g6NHziKmbamtYPjA9RWisERbNWc2mB29oYgCCvX+97fGooNg1uRQzDXIZs/jD4B
 +cfRrybm3Gu+s+ypyM+zw4ZqCKh5gakKA8iM2ugPTesXCzo32f9yYWq8BObHFg==
Message-ID: <6a41840e57075ffa2ff385a940e2088e66cc7d08.camel@mailbox.org>
Subject: Re: [PATCH v6 14/15] drm/sched: Queue all free credits in one
 worker invocation
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Tue, 08 Jul 2025 14:19:27 +0200
In-Reply-To: <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8f1e45c262641111aeb
X-MBO-RS-META: bxfsfzgpnme4tmswk3coz5316kqnifpr
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-07-08 at 10:51 +0100, Tvrtko Ursulin wrote:
> There is no reason to queue just a single job if scheduler can take
> more
> and re-queue the worker to queue more. We can simply feed the
> hardware
> with as much as it can take in one go and hopefully win some latency.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0=C2=A0 2 -
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | 13=
2 ++++++++++---------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 12 +-
> =C2=A03 files changed, 64 insertions(+), 82 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> b/drivers/gpu/drm/scheduler/sched_internal.h
> index 15d78abc48df..1a5c2f255223 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
> =C2=A0	u64		vruntime;
> =C2=A0};
> =C2=A0
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity);
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> =C2=A0
> =C2=A0void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 35025edea669..1fb3f1da4821 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct
> drm_gpu_scheduler *sched)
> =C2=A0	return credits;
> =C2=A0}
> =C2=A0
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - * @entity: the scheduler entity
> - *
> - * Return true if we can push at least one more job from @entity,
> false
> - * otherwise.
> - */
> -bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *s_job;
> -
> -	s_job =3D drm_sched_entity_queue_peek(entity);
> -	if (!s_job)
> -		return false;
> -
> -	/* If a job exceeds the credit limit, truncate it to the
> credit limit
> -	 * itself to guarantee forward progress.
> -	 */
> -	if (s_job->credits > sched->credit_limit) {
> -		dev_WARN(sched->dev,
> -			 "Jobs may not exceed the credit limit,
> truncate.\n");
> -		s_job->credits =3D sched->credit_limit;
> -	}
> -
> -	return drm_sched_available_credits(sched) >=3D s_job->credits;
> -}
> -
> =C2=A0/**
> =C2=A0 * drm_sched_run_job_queue - enqueue run-job work
> =C2=A0 * @sched: scheduler instance
> @@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched =3D
> =C2=A0		container_of(w, struct drm_gpu_scheduler,
> work_run_job);
> +	u32 job_credits, submitted_credits =3D 0;
> =C2=A0	struct drm_sched_entity *entity;
> -	struct dma_fence *fence;
> =C2=A0	struct drm_sched_fence *s_fence;
> =C2=A0	struct drm_sched_job *sched_job;
> -	int r;
> +	struct dma_fence *fence;
> =C2=A0
> -	/* Find entity with a ready job */
> -	entity =3D drm_sched_rq_select_entity(sched, sched->rq);
> -	if (IS_ERR_OR_NULL(entity))
> -		return;	/* No more work */
> +	while (!READ_ONCE(sched->pause_submit)) {

I had it on my agenda whether we can remove these atomic booleans once
and for all. If we can't, we probably want to document why they are
there.

> +		/* Find entity with a ready job */
> +		entity =3D drm_sched_rq_select_entity(sched, sched-
> >rq);
> +		if (!entity)
> +			break;	/* No more work */
> +
> +		sched_job =3D drm_sched_entity_queue_peek(entity);
> +		if (!sched_job) {
> +			complete_all(&entity->entity_idle);
> +			continue;
> +		}
> +
> +		job_credits =3D sched_job->credits;
> +		/*
> +		 * If a job exceeds the credit limit truncate it to
> guarantee
> +		 * forward progress.
> +		 */
> +		if (dev_WARN_ONCE(sched->dev, job_credits > sched-
> >credit_limit,
> +				=C2=A0 "Jobs may not exceed the credit
> limit, truncating.\n"))
> +			job_credits =3D sched_job->credits =3D sched-
> >credit_limit;
> +
> +		if (job_credits >
> drm_sched_available_credits(sched)) {
> +			complete_all(&entity->entity_idle);
> +			break;
> +		}
> +
> +		sched_job =3D drm_sched_entity_pop_job(entity);
> +		if (!sched_job) {
> +			/* Top entity is not yet runnable after all
> */
> +			complete_all(&entity->entity_idle);
> +			continue;
> +		}
> +
> +		s_fence =3D sched_job->s_fence;
> +		drm_sched_job_begin(sched_job);
> +		trace_drm_sched_job_run(sched_job, entity);
> +		submitted_credits +=3D job_credits;
> +		atomic_add(job_credits, &sched->credit_count);
> +
> +		fence =3D sched->ops->run_job(sched_job);
> +		drm_sched_fence_scheduled(s_fence, fence);
> +
> +		if (!IS_ERR_OR_NULL(fence)) {
> +			int r;
> +
> +			/* Drop for original kref_init of the fence
> */
> +			dma_fence_put(fence);

Not sure if you're aware, but this is based on quite some outdated
code. In mainline this function has been reworked a while ago.


P.

> +
> +			r =3D dma_fence_add_callback(fence,
> &sched_job->cb,
> +						=C2=A0=C2=A0
> drm_sched_job_done_cb);
> +			if (r =3D=3D -ENOENT)
> +				drm_sched_job_done(sched_job, fence-
> >error);
> +			else if (r)
> +				DRM_DEV_ERROR(sched->dev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fence add callback
> failed (%d)\n", r);
> +		} else {
> +			drm_sched_job_done(sched_job, IS_ERR(fence)
> ?
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(fence)
> : 0);
> +		}
> =C2=A0
> -	sched_job =3D drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> =C2=A0		complete_all(&entity->entity_idle);
> -		drm_sched_run_job_queue(sched);
> -		return;
> =C2=A0	}
> =C2=A0
> -	s_fence =3D sched_job->s_fence;
> -
> -	atomic_add(sched_job->credits, &sched->credit_count);
> -	drm_sched_job_begin(sched_job);
> -
> -	trace_drm_sched_job_run(sched_job, entity);
> -	/*
> -	 * The run_job() callback must by definition return a fence
> whose
> -	 * refcount has been incremented for the scheduler already.
> -	 */
> -	fence =3D sched->ops->run_job(sched_job);
> -	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> -
> -	if (!IS_ERR_OR_NULL(fence)) {
> -		r =3D dma_fence_add_callback(fence, &sched_job->cb,
> -					=C2=A0=C2=A0 drm_sched_job_done_cb);
> -		if (r =3D=3D -ENOENT)
> -			drm_sched_job_done(sched_job, fence->error);
> -		else if (r)
> -			DRM_DEV_ERROR(sched->dev, "fence add
> callback failed (%d)\n", r);
> -
> -		dma_fence_put(fence);
> -	} else {
> -		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -				=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> -	}
> -
> -	wake_up(&sched->job_scheduled);
> -	drm_sched_run_job_queue(sched);
> +	if (submitted_credits)
> +		wake_up(&sched->job_scheduled);
> =C2=A0}
> =C2=A0
> =C2=A0static struct workqueue_struct *drm_sched_alloc_wq(const char *name=
)
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
> b/drivers/gpu/drm/scheduler/sched_rq.c
> index e22f9ff88822..f0afdc0bd417 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct
> drm_sched_entity *entity)
> =C2=A0 *
> =C2=A0 * Find oldest waiting ready entity.
> =C2=A0 *
> - * Return an entity if one is found; return an error-pointer (!NULL)
> if an
> - * entity was ready, but the scheduler had insufficient credits to
> accommodate
> - * its job; return NULL, if no ready entity was found.
> + * Return an entity if one is found or NULL if no ready entity was
> found.
> =C2=A0 */
> =C2=A0struct drm_sched_entity *
> =C2=A0drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> @@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct
> drm_gpu_scheduler *sched,
> =C2=A0
> =C2=A0		entity =3D rb_entry(rb, struct drm_sched_entity,
> rb_tree_node);
> =C2=A0		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the
> current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> =C2=A0			reinit_completion(&entity->entity_idle);
> =C2=A0			break;
> =C2=A0		}

