Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD16BCC808
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710F10E32C;
	Fri, 10 Oct 2025 10:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UGt5tCJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827AD10E32C;
 Fri, 10 Oct 2025 10:18:39 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cjjPl4yl8z9tHG;
 Fri, 10 Oct 2025 12:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760091515; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJilGx9iz6bOIlnFm8T5AIUhlwAHxXiPJknVFVfkvlI=;
 b=UGt5tCJJ7bdarQUoqvakIbXSY5WzRzHoQAoxWsDCllaa4uCLUscKP871AAU9dmpCjaQxVb
 Cql4Fd7l1S6QWv+xDpDw9PkeRUxGalGybzPzhedGMH70jGSnv/OOwVXAHfhyTvU8VcXvGu
 i+t/tmAYwNt5jztUzFomhl8lQKJ//5DiOEb8raRHWmYUTE/I6LplpA/y09tfx5Hq8mKZBD
 WUiBbqCiI3uOd4lnIsBnFpuGUD17GLRyL6lhX7KUA45ltUBwx07qGR1WZnfhvXkr7uWZTv
 NRqR4Gn/x+96EAccaag819S8pHqTOZeVjNEoQ3vqbu1ESR8Ij4Ui8YkYpFjt2g==
Message-ID: <d5dc0f456835f86a6b67791e535f69ae72c7dff0.camel@mailbox.org>
Subject: Re: [PATCH 04/28] drm/sched: Implement RR via FIFO
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 10 Oct 2025 12:18:31 +0200
In-Reply-To: <20251008085359.52404-5-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 7xgrmmn6zgrjrfhma86t4yatfii7rc4a
X-MBO-RS-ID: 0290fc2b224b1abb36f
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

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> Round-robin being the non-default policy and unclear how much it is used,
> we can notice that it can be implemented using the FIFO data structures i=
f
> we only invent a fake submit timestamp which is monotonically increasing
> inside drm_sched_rq instances.
>=20
> So instead of remembering which was the last entity the scheduler worker
> picked we can simply bump the picked one to the bottom of the tree, which
> ensures round-robin behaviour between all active queued jobs.
>=20
> If the picked job was the last from a given entity, we remember the
> assigned fake timestamp and use it to re-insert the job once it re-joins
> the queue. This ensures job neither overtakes all already queued jobs,

s/job/the job

> neither it goes last. Instead it keeps the position after the currently
> queued jobs and before the ones which haven't yet been queued at the poin=
t
> the entity left the queue.

I think I got how it works. If you want you can phrase it a bit more
direct that the "last_entity" field is only needed for RR.

>=20
> Advantage is that we can consolidate to a single code path and remove a
> bunch of code. Downside is round-robin mode now needs to lock on the job
> pop path but that should not be visible.

s/visible/have a measurable performance impact

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 51 ++++++++++------
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 76 ++---------=
-------------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++--
> =C2=A03 files changed, 51 insertions(+), 92 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 5a4697f636f2..4852006f2308 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -456,9 +456,24 @@ drm_sched_job_dependency(struct drm_sched_job *job,
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> +static ktime_t
> +drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity =
*entity)
> +{
> +	ktime_t ts;
> +
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	ts =3D ktime_add_ns(rq->rr_ts, 1);
> +	entity->rr_ts =3D ts;
> +	rq->rr_ts =3D ts;

This also updates / set the time stamp. Any idea for a better function
name?

> +
> +	return ts;
> +}
> +
> =C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_ent=
ity *entity)
> =C2=A0{
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job, *next_job;
> =C2=A0
> =C2=A0	sched_job =3D drm_sched_entity_queue_peek(entity);
> =C2=A0	if (!sched_job)
> @@ -491,21 +506,21 @@ struct drm_sched_job *drm_sched_entity_pop_job(stru=
ct drm_sched_entity *entity)
> =C2=A0	 * Update the entity's location in the min heap according to
> =C2=A0	 * the timestamp of the next job, if any.
> =C2=A0	 */
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO) {
> -		struct drm_sched_job *next;
> +	next_job =3D drm_sched_entity_queue_peek(entity);
> +	if (next_job) {
> +		struct drm_sched_rq *rq;
> +		ktime_t ts;
> =C2=A0
> -		next =3D drm_sched_entity_queue_peek(entity);
> -		if (next) {
> -			struct drm_sched_rq *rq;
> -
> -			spin_lock(&entity->lock);
> -			rq =3D entity->rq;
> -			spin_lock(&rq->lock);
> -			drm_sched_rq_update_fifo_locked(entity, rq,
> -							next->submit_ts);
> -			spin_unlock(&rq->lock);
> -			spin_unlock(&entity->lock);
> -		}
> +		spin_lock(&entity->lock);
> +		rq =3D entity->rq;
> +		spin_lock(&rq->lock);
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +			ts =3D next_job->submit_ts;
> +		else
> +			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +		spin_unlock(&rq->lock);
> +		spin_unlock(&entity->lock);
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Jobs and entities might have different lifecycles. Since we're
> @@ -612,9 +627,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *=
sched_job)
> =C2=A0
> =C2=A0		spin_lock(&rq->lock);
> =C2=A0		drm_sched_rq_add_entity(rq, entity);
> -
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> +			submit_ts =3D entity->rr_ts;
> +		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> =C2=A0
> =C2=A0		spin_unlock(&rq->lock);
> =C2=A0		spin_unlock(&entity->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 8b8c55b25762..8e62541b439a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -185,7 +185,6 @@ static void drm_sched_rq_init(struct drm_sched_rq *rq=
,
> =C2=A0	spin_lock_init(&rq->lock);
> =C2=A0	INIT_LIST_HEAD(&rq->entities);
> =C2=A0	rq->rb_tree_root =3D RB_ROOT_CACHED;
> -	rq->current_entity =3D NULL;
> =C2=A0	rq->sched =3D sched;
> =C2=A0}
> =C2=A0
> @@ -231,74 +230,13 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq=
 *rq,
> =C2=A0	atomic_dec(rq->sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> -	if (rq->current_entity =3D=3D entity)
> -		rq->current_entity =3D NULL;
> -
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -		drm_sched_rq_remove_fifo_locked(entity, rq);
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
> =C2=A0
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_sched_rq_select_entity_rr - Select an entity which could provide =
a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Try to find the next ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if =
an
> - * entity was ready, but the scheduler had insufficient credits to accom=
modate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> -{
> -	struct drm_sched_entity *entity;
> -
> -	spin_lock(&rq->lock);
> -
> -	entity =3D rq->current_entity;
> -	if (entity) {
> -		list_for_each_entry_continue(entity, &rq->entities, list) {
> -			if (drm_sched_entity_is_ready(entity))
> -				goto found;
> -		}
> -	}
> -
> -	list_for_each_entry(entity, &rq->entities, list) {
> -		if (drm_sched_entity_is_ready(entity))
> -			goto found;
> -
> -		if (entity =3D=3D rq->current_entity)
> -			break;
> -	}
> -
> -	spin_unlock(&rq->lock);
> -
> -	return NULL;
> -
> -found:
> -	if (!drm_sched_can_queue(sched, entity)) {
> -		/*
> -		 * If scheduler cannot take more jobs signal the caller to not
> -		 * consider lower priority queues.
> -		 */
> -		entity =3D ERR_PTR(-ENOSPC);
> -	} else {
> -		rq->current_entity =3D entity;
> -		reinit_completion(&entity->entity_idle);
> -	}
> -
> -	spin_unlock(&rq->lock);
> -
> -	return entity;
> -}
> -
> -/**
> - * drm_sched_rq_select_entity_fifo - Select an entity which provides a j=
ob to run
> + * drm_sched_rq_select_entity - Select an entity which provides a job to=
 run
> =C2=A0 *
> =C2=A0 * @sched: the gpu scheduler
> =C2=A0 * @rq: scheduler run queue to check.
> @@ -310,8 +248,8 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_schedule=
r *sched,
> =C2=A0 * its job; return NULL, if no ready entity was found.
> =C2=A0 */
> =C2=A0static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			=C2=A0=C2=A0 struct drm_sched_rq *rq)
> =C2=A0{
> =C2=A0	struct rb_node *rb;
> =C2=A0
> @@ -1093,15 +1031,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *s=
ched)
> =C2=A0static struct drm_sched_entity *
> =C2=A0drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> =C2=A0{
> -	struct drm_sched_entity *entity;
> +	struct drm_sched_entity *entity =3D NULL;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	/* Start with the highest priority.
> =C2=A0	 */
> =C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		entity =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> +		entity =3D drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
> =C2=A0		if (entity)
> =C2=A0			break;
> =C2=A0	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..8992393ed200 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -94,7 +94,8 @@ struct drm_sched_entity {
> =C2=A0	 * @lock:
> =C2=A0	 *
> =C2=A0	 * Lock protecting the run-queue (@rq) to which this entity belong=
s,
> -	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
> +	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
> +	 * the @rr_ts field.
> =C2=A0	 */
> =C2=A0	spinlock_t			lock;
> =C2=A0
> @@ -142,6 +143,13 @@ struct drm_sched_entity {
> =C2=A0	 */
> =C2=A0	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 priority;
> =C2=A0
> +	/**
> +	 * @rr_ts:
> +	 *
> +	 * Fake timestamp of the last popped job from the entity.
> +	 */
> +	ktime_t				rr_ts;
> +
> =C2=A0	/**
> =C2=A0	 * @job_queue: the list of jobs of this entity.
> =C2=A0	 */
> @@ -239,8 +247,8 @@ struct drm_sched_entity {
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root and @current_entity.
> - * @current_entity: the entity which is to be scheduled.
> + * @lock: protects @entities, @rb_tree_root and @rr_ts.
> + * @rr_ts: monotonically incrementing fake timestamp for RR mode

nit: add a full stop '.', as most other docu lines have one

> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priority queue of entities for=
 FIFO scheduling
> =C2=A0 *
> @@ -253,7 +261,7 @@ struct drm_sched_rq {
> =C2=A0
> =C2=A0	spinlock_t			lock;
> =C2=A0	/* Following members are protected by the @lock: */
> -	struct drm_sched_entity		*current_entity;
> +	ktime_t				rr_ts;
> =C2=A0	struct list_head		entities;
> =C2=A0	struct rb_root_cached		rb_tree_root;
> =C2=A0};

