Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A9B58F63
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0225510E698;
	Tue, 16 Sep 2025 07:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FM/C116C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56B410E698;
 Tue, 16 Sep 2025 07:41:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cQv3m62yBz9sm6;
 Tue, 16 Sep 2025 09:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758008500; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fe4+MjApCWo7jGglDayHEOd9HsjjsE6/NjBFpucGOAU=;
 b=FM/C116CR2W9010/KuO+5+je2Bwdy4DbmotdCtq7OPzTezlrhroWXz4LXJ3s0c2CnnPBM4
 Jm4nA+dtOjU7Vf/zhTqhfJtwgSSevUOVBA7yIPFAjS9lqyPy8Z/sYCGkvaqZKzaw+0N9gq
 t0E2HSMTKX4y0Wphs8sQWFROKWPaqE/yK1UsmJLQKuq6pAolK+mZhZ/eTQWcw47vN7pN/7
 8cfmvphsXqHdmBKzHtlJdASlxPpurt/NFPW872hK8SW6pLy/bPIjnExgO7mFnsGr3tZnZp
 TzIB+A4q8VY0fynjJ3y7F25KR2WhRunxEKiAaysagYULdtOe4pxND9np44TLiw==
Message-ID: <9ce2b23820b4d56123eba515b01f282af4380a7c.camel@mailbox.org>
Subject: Re: [RFC v8 04/12] drm/sched: Consolidate entity run queue management
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 16 Sep 2025 09:41:37 +0200
In-Reply-To: <73681fac-ef47-4005-87ad-cea0b91e6813@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-5-tvrtko.ursulin@igalia.com>
 <6fe010e8dc5e8a5db35d8702960f42940e342093.camel@mailbox.org>
 <73681fac-ef47-4005-87ad-cea0b91e6813@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: wm5sjrj4poepb5rcuba5tfpezr3ys538
X-MBO-RS-ID: bbe42caea259c62f92c
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

On Thu, 2025-09-11 at 15:55 +0100, Tvrtko Ursulin wrote:
>=20
> On 11/09/2025 15:20, Philipp Stanner wrote:
> > On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> > > Move the code dealing with entities entering and exiting run queues t=
o
> > > helpers to logically separate it from jobs entering and exiting entit=
ies.
> >=20
> > Sorry if I've asked this before, but does this strictly depend on the
> > preceding patches or could it be branched out?
>=20
> There is no fundamental dependency so I could re-order and pull it ahead=
=20
> if you are certain that is what you prefer?

Well, you know my opinion: If it's a general improvement not directly
necessary for a series, it should be send separately.

For this patch, however, I'm not even sure whether it's really
improving the code base. The number of functions seems the same, just
with different names, and the code base gets even slightly larger.

Can you elaborate a bit on why you think this patch makes sense?

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 | 64=
 ++-------------
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0 8 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 95 +++++++++++++++++++---
> > > =C2=A0=C2=A03 files changed, 91 insertions(+), 76 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 4852006f2308..7a0a52ba87bf 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -456,24 +456,9 @@ drm_sched_job_dependency(struct drm_sched_job *j=
ob,
> > > =C2=A0=C2=A0	return NULL;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static ktime_t
> > > -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_ent=
ity *entity)
> > > -{
> > > -	ktime_t ts;
> > > -
> > > -	lockdep_assert_held(&entity->lock);
> > > -	lockdep_assert_held(&rq->lock);
> > > -
> > > -	ts =3D ktime_add_ns(rq->rr_ts, 1);
> > > -	entity->rr_ts =3D ts;
> > > -	rq->rr_ts =3D ts;
> > > -
> > > -	return ts;
> > > -}
> > > -
> > > =C2=A0=C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct drm=
_sched_entity *entity)
> > > =C2=A0=C2=A0{
> > > -	struct drm_sched_job *sched_job, *next_job;
> > > +	struct drm_sched_job *sched_job;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	sched_job =3D drm_sched_entity_queue_peek(entity);
> > > =C2=A0=C2=A0	if (!sched_job)
> > > @@ -502,26 +487,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(s=
truct drm_sched_entity *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spsc_queue_pop(&entity->job_queue);
> > > =C2=A0=20
> > > -	/*
> > > -	 * Update the entity's location in the min heap according to
> > > -	 * the timestamp of the next job, if any.
> > > -	 */
> > > -	next_job =3D drm_sched_entity_queue_peek(entity);
> > > -	if (next_job) {
> > > -		struct drm_sched_rq *rq;
> > > -		ktime_t ts;
> > > -
> > > -		spin_lock(&entity->lock);
> > > -		rq =3D entity->rq;
> > > -		spin_lock(&rq->lock);
> > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > -			ts =3D next_job->submit_ts;
> > > -		else
> > > -			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > -		spin_unlock(&rq->lock);
> > > -		spin_unlock(&entity->lock);
> > > -	}
> > > +	drm_sched_rq_pop_entity(entity);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Jobs and entities might have different lifecycles. Si=
nce we're
> > > =C2=A0=C2=A0	 * removing the job from the entities queue, set the job=
s entity pointer
> > > @@ -611,30 +577,10 @@ void drm_sched_entity_push_job(struct drm_sched=
_job *sched_job)
> > > =C2=A0=C2=A0	/* first job wakes up scheduler */
> > > =C2=A0=C2=A0	if (first) {
> > > =C2=A0=C2=A0		struct drm_gpu_scheduler *sched;
> > > -		struct drm_sched_rq *rq;
> > > =C2=A0=20
> > > -		/* Add the entity to the run queue */
> > > -		spin_lock(&entity->lock);
> > > -		if (entity->stopped) {
> > > -			spin_unlock(&entity->lock);
> > > -
> > > -			DRM_ERROR("Trying to push to a killed entity\n");
> > > -			return;
> > > -		}
> > > -
> > > -		rq =3D entity->rq;
> > > -		sched =3D rq->sched;
> > > -
> > > -		spin_lock(&rq->lock);
> > > -		drm_sched_rq_add_entity(rq, entity);
> > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> > > -			submit_ts =3D entity->rr_ts;
> > > -		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> > > -
> > > -		spin_unlock(&rq->lock);
> > > -		spin_unlock(&entity->lock);
> > > -
> > > -		drm_sched_wakeup(sched);
> > > +		sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> > > +		if (sched)
> > > +			drm_sched_wakeup(sched);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu=
/drm/scheduler/sched_internal.h
> > > index 7ea5a6736f98..8269c5392a82 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -12,13 +12,11 @@ extern int drm_sched_policy;
> > > =C2=A0=20
> > > =C2=A0=C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > =C2=A0=20
> > > -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity);
> > > +struct drm_gpu_scheduler *
> > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)=
;
> > > =C2=A0=C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > =C2=A0=C2=A0				struct drm_sched_entity *entity);
> > > -
> > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity=
,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq, ktime_t ts);
> > > +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
> > > =C2=A0=20
> > > =C2=A0=C2=A0void drm_sched_entity_select_rq(struct drm_sched_entity *=
entity);
> > > =C2=A0=C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct drm=
_sched_entity *entity);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index 1db0a4aa1d46..c53931e63458 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -151,9 +151,9 @@ static void drm_sched_rq_remove_fifo_locked(struc=
t drm_sched_entity *entity,
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity=
,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity =
*entity,
> > > +					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > > +					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * Both locks need to be grabbed, one to protect from en=
tity->rq change
> > > @@ -191,22 +191,45 @@ static void drm_sched_rq_init(struct drm_gpu_sc=
heduler *sched,
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_rq_add_entity - add an entity
> > > =C2=A0=C2=A0 *
> > > - * @rq: scheduler run queue
> > > =C2=A0=C2=A0 * @entity: scheduler entity
> > > + * @ts: submission timestamp
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Adds a scheduler entity to the run queue.
> > > + *
> > > + * Returns a DRM scheduler pre-selected to handle this entity.
> > > =C2=A0=C2=A0 */
> > > -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> > > +struct drm_gpu_scheduler *
> > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> > > =C2=A0=C2=A0{
> > > -	lockdep_assert_held(&entity->lock);
> > > -	lockdep_assert_held(&rq->lock);
> > > +	struct drm_gpu_scheduler *sched;
> > > +	struct drm_sched_rq *rq;
> > > =C2=A0=20
> > > -	if (!list_empty(&entity->list))
> > > -		return;
> > > +	/* Add the entity to the run queue */
> > > +	spin_lock(&entity->lock);
> > > +	if (entity->stopped) {
> > > +		spin_unlock(&entity->lock);
> > > =C2=A0=20
> > > -	atomic_inc(rq->sched->score);
> > > -	list_add_tail(&entity->list, &rq->entities);
> > > +		DRM_ERROR("Trying to push to a killed entity\n");
> > > +		return NULL;
> > > +	}
> > > +
> > > +	rq =3D entity->rq;
> > > +	spin_lock(&rq->lock);
> > > +	sched =3D rq->sched;
> > > +
> > > +	if (list_empty(&entity->list)) {
> > > +		atomic_inc(sched->score);
> > > +		list_add_tail(&entity->list, &rq->entities);
> > > +	}
> > > +
> > > +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> > > +		ts =3D entity->rr_ts;
> > > +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +
> > > +	spin_unlock(&rq->lock);
> > > +	spin_unlock(&entity->lock);
> > > +
> > > +	return sched;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -235,6 +258,54 @@ void drm_sched_rq_remove_entity(struct drm_sched=
_rq *rq,
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static ktime_t
> > > +drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_ent=
ity *entity)
> > > +{
> > > +	ktime_t ts;
> > > +
> > > +	lockdep_assert_held(&entity->lock);
> > > +	lockdep_assert_held(&rq->lock);
> > > +
> > > +	ts =3D ktime_add_ns(rq->rr_ts, 1);
> > > +	entity->rr_ts =3D ts;
> > > +	rq->rr_ts =3D ts;
> > > +
> > > +	return ts;
> > > +}
> > > +
> > > +/**
> > > + * drm_sched_rq_pop_entity - pops an entity
> > > + *
> > > + * @entity: scheduler entity
> > > + *
> > > + * To be called every time after a job is popped from the entity.
> > > + */
> > > +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> > > +{
> > > +	struct drm_sched_job *next_job;
> > > +	struct drm_sched_rq *rq;
> > > +	ktime_t ts;
> > > +
> > > +	/*
> > > +	 * Update the entity's location in the min heap according to
> > > +	 * the timestamp of the next job, if any.
> > > +	 */
> > > +	next_job =3D drm_sched_entity_queue_peek(entity);
> > > +	if (!next_job)
> > > +		return;
> > > +
> > > +	spin_lock(&entity->lock);
> > > +	rq =3D entity->rq;
> > > +	spin_lock(&rq->lock);
> > > +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > +		ts =3D next_job->submit_ts;
> > > +	else
> > > +		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +	spin_unlock(&rq->lock);
> > > +	spin_unlock(&entity->lock);
> > > +}
> > > +
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_rq_select_entity - Select an entity which pr=
ovides a job to run
> > > =C2=A0=C2=A0 *
> >=20
>=20

