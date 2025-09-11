Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2839B53518
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA1E10E396;
	Thu, 11 Sep 2025 14:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yWGVaQ+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110D210E396
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:21:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cN08m2VPcz9tgv;
 Thu, 11 Sep 2025 16:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1757600456; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9lSwKhfafMrSPgz7DYbpdSUhxnTh+jm6q67RDi/IwA=;
 b=yWGVaQ+fpnfIRMusJIQtAgw4+uB8k5cImmoqBwby/R6yTEyCU1LzzrN5UAaswHAPl3z8La
 QvmAINZbgpKh0JXV3+4IUrt2yxABiqETKzM8/s4kqDyY0fYD5h/84+ByBr7fzQ/UMOdmuf
 ak/IhS0YFHvABH+ZPBuvMQWwMe8hVv1c/61+zcZeamxDn3P56neRrobAHyl8Ldmdcumpm6
 xqZK71J/sA7bYu7HM5tE1OvyeUr+P2u3l4+10/XlNQzrxCSXxKtXikk196k+bKFK6xqssC
 kCaETuThl4CgyG8cxBprMGL5if1Uet1PLPWpTjE6jckHPZhhvhMn+H177ypJuQ==
Message-ID: <6fe010e8dc5e8a5db35d8702960f42940e342093.camel@mailbox.org>
Subject: Re: [RFC v8 04/12] drm/sched: Consolidate entity run queue management
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Thu, 11 Sep 2025 16:20:51 +0200
In-Reply-To: <20250903101820.63032-5-tvrtko.ursulin@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 48b7dd62d37761f4630
X-MBO-RS-META: y75wbn7hqs4byfejdaxbz3kmbfdabycr
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

On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> Move the code dealing with entities entering and exiting run queues to
> helpers to logically separate it from jobs entering and exiting entities.

Sorry if I've asked this before, but does this strictly depend on the
preceding patches or could it be branched out?

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 | 64 ++-------=
------
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | 95=
 +++++++++++++++++++---
> =C2=A03 files changed, 91 insertions(+), 76 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 4852006f2308..7a0a52ba87bf 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -456,24 +456,9 @@ drm_sched_job_dependency(struct drm_sched_job *job,
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> -static ktime_t
> -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity =
*entity)
> -{
> -	ktime_t ts;
> -
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	ts =3D ktime_add_ns(rq->rr_ts, 1);
> -	entity->rr_ts =3D ts;
> -	rq->rr_ts =3D ts;
> -
> -	return ts;
> -}
> -
> =C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_ent=
ity *entity)
> =C2=A0{
> -	struct drm_sched_job *sched_job, *next_job;
> +	struct drm_sched_job *sched_job;
> =C2=A0
> =C2=A0	sched_job =3D drm_sched_entity_queue_peek(entity);
> =C2=A0	if (!sched_job)
> @@ -502,26 +487,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struc=
t drm_sched_entity *entity)
> =C2=A0
> =C2=A0	spsc_queue_pop(&entity->job_queue);
> =C2=A0
> -	/*
> -	 * Update the entity's location in the min heap according to
> -	 * the timestamp of the next job, if any.
> -	 */
> -	next_job =3D drm_sched_entity_queue_peek(entity);
> -	if (next_job) {
> -		struct drm_sched_rq *rq;
> -		ktime_t ts;
> -
> -		spin_lock(&entity->lock);
> -		rq =3D entity->rq;
> -		spin_lock(&rq->lock);
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -			ts =3D next_job->submit_ts;
> -		else
> -			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> -		spin_unlock(&rq->lock);
> -		spin_unlock(&entity->lock);
> -	}
> +	drm_sched_rq_pop_entity(entity);
> =C2=A0
> =C2=A0	/* Jobs and entities might have different lifecycles. Since we're
> =C2=A0	 * removing the job from the entities queue, set the jobs entity p=
ointer
> @@ -611,30 +577,10 @@ void drm_sched_entity_push_job(struct drm_sched_job=
 *sched_job)
> =C2=A0	/* first job wakes up scheduler */
> =C2=A0	if (first) {
> =C2=A0		struct drm_gpu_scheduler *sched;
> -		struct drm_sched_rq *rq;
> =C2=A0
> -		/* Add the entity to the run queue */
> -		spin_lock(&entity->lock);
> -		if (entity->stopped) {
> -			spin_unlock(&entity->lock);
> -
> -			DRM_ERROR("Trying to push to a killed entity\n");
> -			return;
> -		}
> -
> -		rq =3D entity->rq;
> -		sched =3D rq->sched;
> -
> -		spin_lock(&rq->lock);
> -		drm_sched_rq_add_entity(rq, entity);
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> -			submit_ts =3D entity->rr_ts;
> -		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> -
> -		spin_unlock(&rq->lock);
> -		spin_unlock(&entity->lock);
> -
> -		drm_sched_wakeup(sched);
> +		sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> +		if (sched)
> +			drm_sched_wakeup(sched);
> =C2=A0	}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index 7ea5a6736f98..8269c5392a82 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -12,13 +12,11 @@ extern int drm_sched_policy;
> =C2=A0
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> =C2=A0
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity);
> +struct drm_gpu_scheduler *
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0				struct drm_sched_entity *entity);
> -
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq, ktime_t ts);
> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
> =C2=A0
> =C2=A0void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
> =C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_ent=
ity *entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1db0a4aa1d46..c53931e63458 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -151,9 +151,9 @@ static void drm_sched_rq_remove_fifo_locked(struct dr=
m_sched_entity *entity,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)
> +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *ent=
ity,
> +					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> +					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * Both locks need to be grabbed, one to protect from entity->rq c=
hange
> @@ -191,22 +191,45 @@ static void drm_sched_rq_init(struct drm_gpu_schedu=
ler *sched,
> =C2=A0/**
> =C2=A0 * drm_sched_rq_add_entity - add an entity
> =C2=A0 *
> - * @rq: scheduler run queue
> =C2=A0 * @entity: scheduler entity
> + * @ts: submission timestamp
> =C2=A0 *
> =C2=A0 * Adds a scheduler entity to the run queue.
> + *
> + * Returns a DRM scheduler pre-selected to handle this entity.
> =C2=A0 */
> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> +struct drm_gpu_scheduler *
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> =C2=A0{
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_rq *rq;
> =C2=A0
> -	if (!list_empty(&entity->list))
> -		return;
> +	/* Add the entity to the run queue */
> +	spin_lock(&entity->lock);
> +	if (entity->stopped) {
> +		spin_unlock(&entity->lock);
> =C2=A0
> -	atomic_inc(rq->sched->score);
> -	list_add_tail(&entity->list, &rq->entities);
> +		DRM_ERROR("Trying to push to a killed entity\n");
> +		return NULL;
> +	}
> +
> +	rq =3D entity->rq;
> +	spin_lock(&rq->lock);
> +	sched =3D rq->sched;
> +
> +	if (list_empty(&entity->list)) {
> +		atomic_inc(sched->score);
> +		list_add_tail(&entity->list, &rq->entities);
> +	}
> +
> +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> +		ts =3D entity->rr_ts;
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +
> +	return sched;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -235,6 +258,54 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq =
*rq,
> =C2=A0	spin_unlock(&rq->lock);
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
> +
> +	return ts;
> +}
> +
> +/**
> + * drm_sched_rq_pop_entity - pops an entity
> + *
> + * @entity: scheduler entity
> + *
> + * To be called every time after a job is popped from the entity.
> + */
> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *next_job;
> +	struct drm_sched_rq *rq;
> +	ktime_t ts;
> +
> +	/*
> +	 * Update the entity's location in the min heap according to
> +	 * the timestamp of the next job, if any.
> +	 */
> +	next_job =3D drm_sched_entity_queue_peek(entity);
> +	if (!next_job)
> +		return;
> +
> +	spin_lock(&entity->lock);
> +	rq =3D entity->rq;
> +	spin_lock(&rq->lock);
> +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +		ts =3D next_job->submit_ts;
> +	else
> +		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_sched_rq_select_entity - Select an entity which provides a j=
ob to run
> =C2=A0 *

