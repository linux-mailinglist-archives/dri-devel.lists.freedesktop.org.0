Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145DBD8FCA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9527B10E151;
	Tue, 14 Oct 2025 11:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UQFhsIzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5FA10E151;
 Tue, 14 Oct 2025 11:23:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cmBgH2bSkz9tfM;
 Tue, 14 Oct 2025 13:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760441035; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qyx71z671ubtSzqkBsm0sFO+f6BlEKPfsjzyaNPl+W8=;
 b=UQFhsIzhD8DD5yZu+KZ5DZnlcezc3/HrLVAdYgykxjeJDSMeaH6fO17grIpCcdhnqcILlO
 WFdM/MICavxFC7n1vzFQeBFX/UBwB61uFzpzVPhN/HpRV2lEIizMRM45/54By4A1JY8xgm
 2SUlsj87pri9+2uXMtSimkfGrX83iD0jCQMp4ABUiLIVkSCfmuPE0eDe2q3vI2ArjfZ7ik
 83kO7Sr4RxFkqLBh8mhYBILB3VCmR3hxYWZ+Pmqyr4OfFWzu4LU0DEQkgjlCB4tTmuXpdz
 ILmHmRXgAffiCNsiE9e15nRDavfyBugnoaXsSXcpNdmb13UhX0dUHMHLp5LWwA==
Message-ID: <0305704bf5ee1686f7e78744f806bcaf264d1428.camel@mailbox.org>
Subject: Re: [PATCH 05/28] drm/sched: Consolidate entity run queue management
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Tue, 14 Oct 2025 13:23:52 +0200
In-Reply-To: <4c78fab2-ecf2-45fe-81a5-1ae4e0717d38@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-6-tvrtko.ursulin@igalia.com>
 <762e3469df06787205af88e068d72f60dfaebda4.camel@mailbox.org>
 <fcec969c-5e25-4b81-891d-843ad569d04b@igalia.com>
 <50244c8f2c2dd4488288dabfbda6641389bd07aa.camel@mailbox.org>
 <cf661524-9207-4c52-a056-683b7f1a0ea6@igalia.com>
 <9177786c039cafc5b26bc5b076b98d82b068fb54.camel@mailbox.org>
 <4c78fab2-ecf2-45fe-81a5-1ae4e0717d38@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: bda519da8024ac78ac0
X-MBO-RS-META: ofeb7mtx5qbw9nqsyhck8acnmnd6n7m4
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

On Tue, 2025-10-14 at 11:04 +0100, Tvrtko Ursulin wrote:
>=20
> On 14/10/2025 09:52, Philipp Stanner wrote:
> > On Tue, 2025-10-14 at 08:26 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 14/10/2025 07:53, Philipp Stanner wrote:
> > > > On Sat, 2025-10-11 at 15:19 +0100, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 10/10/2025 11:49, Philipp Stanner wrote:
> > > > > > On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> > > > > > > Move the code dealing with entities entering and exiting run =
queues to
> > > > > > > helpers to logically separate it from jobs entering and exiti=
ng entities.
> > > > > > >=20
> > > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entit=
y.c=C2=A0=C2=A0 | 64 ++-------------
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_inter=
nal.h |=C2=A0 8 +-
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.=
c=C2=A0=C2=A0=C2=A0=C2=A0 | 95 +++++++++++++++++++---
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A03 files changed, 91 insertions(+), 76=
 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drive=
rs/gpu/drm/scheduler/sched_entity.c
> > > > > > > index 4852006f2308..7a0a52ba87bf 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > @@ -456,24 +456,9 @@ drm_sched_job_dependency(struct drm_sche=
d_job *job,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	return NULL;
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > -static ktime_t
> > > > > > > -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_s=
ched_entity *entity)
> > > > > > > -{
> > > > > > > -	ktime_t ts;
> > > > > > > -
> > > > > > > -	lockdep_assert_held(&entity->lock);
> > > > > > > -	lockdep_assert_held(&rq->lock);
> > > > > > > -
> > > > > > > -	ts =3D ktime_add_ns(rq->rr_ts, 1);
> > > > > > > -	entity->rr_ts =3D ts;
> > > > > > > -	rq->rr_ts =3D ts;
> > > > > > > -
> > > > > > > -	return ts;
> > > > > > > -}
> > > > > > > -
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0struct drm_sched_job *drm_sched_entit=
y_pop_job(struct drm_sched_entity *entity)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0{
> > > > > > > -	struct drm_sched_job *sched_job, *next_job;
> > > > > > > +	struct drm_sched_job *sched_job;
> > > > > >=20
> > > > > > `next_job` has been added in a previous job. Have you tried whe=
ther
> > > > > > patch-order can be reversed?
> > > > > >=20
> > > > > > Just asking; I don't want to cause unnecessary work here
> > > > >=20
> > > > > You are correct that there would be some knock on effect on a few=
 other
> > > > > patches in the series but it is definitely doable. Because for ce=
rtain
> > > > > argument can be made it would be logical to have it like that. Bo=
th this
> > > > > patch and "drm/sched: Move run queue related code into a separate=
 file"
> > > > > would be then moved ahead of "drm/sched: Implement RR via FIFO". =
If you
> > > > > prefer it like that I can reshuffle no problem.
> > > >=20
> > > > I mean, it seems to make the overall git diff smaller, which is nic=
e?
> > > >=20
> > > > If you don't see a significant reason against it, I'd say it's a go=
od
> > > > idea.
> > >=20
> > > Okay deal. It isn't anything significant, just re-ordering patches wi=
th
> > > compile testing patches to ensure every step still builds.
>=20
> Completed locally.
>=20
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	sched_job =3D drm_sched_entity_queue=
_peek(entity);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (!sched_job)
> > > > > > > @@ -502,26 +487,7 @@ struct drm_sched_job *drm_sched_entity_p=
op_job(struct drm_sched_entity *entity)
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	spsc_queue_pop(&entity->job_queue);
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > -	/*
> > > > > > > -	 * Update the entity's location in the min heap according t=
o
> > > > > > > -	 * the timestamp of the next job, if any.
> > > > > > > -	 */
> > > > > > > -	next_job =3D drm_sched_entity_queue_peek(entity);
> > > > > > > -	if (next_job) {
> > > > > > > -		struct drm_sched_rq *rq;
> > > > > > > -		ktime_t ts;
> > > > > > > -
> > > > > > > -		spin_lock(&entity->lock);
> > > > > > > -		rq =3D entity->rq;
> > > > > > > -		spin_lock(&rq->lock);
> > > > > > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > > > > > -			ts =3D next_job->submit_ts;
> > > > > > > -		else
> > > > > > > -			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > > > > > -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > > > > > -		spin_unlock(&rq->lock);
> > > > > > > -		spin_unlock(&entity->lock);
> > > > > > > -	}
> > > > > > > +	drm_sched_rq_pop_entity(entity);
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	/* Jobs and entities might have diff=
erent lifecycles. Since we're
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * removing the job from the entitie=
s queue, set the jobs entity pointer
> > > > > > > @@ -611,30 +577,10 @@ void drm_sched_entity_push_job(struct d=
rm_sched_job *sched_job)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	/* first job wakes up scheduler */
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	if (first) {
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		struct drm_gpu_scheduler *sched;
> > > > > > > -		struct drm_sched_rq *rq;
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > -		/* Add the entity to the run queue */
> > > > > > > -		spin_lock(&entity->lock);
> > > > > > > -		if (entity->stopped) {
> > > > > > > -			spin_unlock(&entity->lock);
> > > > > > > -
> > > > > > > -			DRM_ERROR("Trying to push to a killed entity\n");
> > > > > > > -			return;
> > > > > > > -		}
> > > > > > > -
> > > > > > > -		rq =3D entity->rq;
> > > > > > > -		sched =3D rq->sched;
> > > > > > > -
> > > > > > > -		spin_lock(&rq->lock);
> > > > > > > -		drm_sched_rq_add_entity(rq, entity);
> > > > > > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> > > > > > > -			submit_ts =3D entity->rr_ts;
> > > > > > > -		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> > > > > > > -
> > > > > > > -		spin_unlock(&rq->lock);
> > > > > > > -		spin_unlock(&entity->lock);
> > > > > > > -
> > > > > > > -		drm_sched_wakeup(sched);
> > > > > > > +		sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> > > > > > > +		if (sched)
> > > > > > > +			drm_sched_wakeup(sched);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	}
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_push_j=
ob);
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/dri=
vers/gpu/drm/scheduler/sched_internal.h
> > > > > > > index 7ea5a6736f98..8269c5392a82 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > > > > > @@ -12,13 +12,11 @@ extern int drm_sched_policy;
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0void drm_sched_wakeup(struct drm_gpu_=
scheduler *sched);
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > > > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)=
;
> > > > > > > +struct drm_gpu_scheduler *
> > > > > > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity, kti=
me_t ts);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0void drm_sched_rq_remove_entity(struc=
t drm_sched_rq *rq,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0				struct drm_sched_entity *entity);
> > > > > > > -
> > > > > > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity=
 *entity,
> > > > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq, ktime_=
t ts);
> > > > > > > +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity=
);
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0void drm_sched_entity_select_rq(struc=
t drm_sched_entity *entity);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0struct drm_sched_job *drm_sched_entit=
y_pop_job(struct drm_sched_entity *entity);
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers=
/gpu/drm/scheduler/sched_main.c
> > > > > > > index 8e62541b439a..e5d02c28665c 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -151,9 +151,9 @@ static void drm_sched_rq_remove_fifo_lock=
ed(struct drm_sched_entity *entity,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	}
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > > -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity=
 *entity,
> > > > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > > > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > > > > > +static void drm_sched_rq_update_fifo_locked(struct drm_sched=
_entity *entity,
> > > > > > > +					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > > > > > > +					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0{
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	/*
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * Both locks need to be grabbed, on=
e to protect from entity->rq change
> > > > > > > @@ -191,22 +191,45 @@ static void drm_sched_rq_init(struct dr=
m_sched_rq *rq,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0/**
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * drm_sched_rq_add_entity - add an e=
ntity
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > - * @rq: scheduler run queue
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * @entity: scheduler entity
> > > > > > > + * @ts: submission timestamp
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 * Adds a scheduler entity to the run=
 queue.
> > > > > > > + *
> > > > > > > + * Returns a DRM scheduler pre-selected to handle this entit=
y.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> > > > > > > -			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity)
> > > > > > > +struct drm_gpu_scheduler *
> > > > > > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity, kti=
me_t ts)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0{
> > > > > >=20
> > > > > > I'm not sure if it's a good idea to have the scheduler returned=
 from
> > > > > > that function. That doesn't make a whole lot of sense semantica=
lly.
> > > > > >=20
> > > > > > At the very least the function's docstring, maybe even its name=
, should
> > > > > > be adjusted to detail why this makes sense. The commit message,=
 too.
> > > > > > It's not trivially understood.
> > > > > >=20
> > > > > > I think I get why it's being done, but writing it down black on=
 white
> > > > > > gives us something to grasp.
> > > > > >=20
> > > > > > Sth like "adds an entity to a runqueue, selects to appropriate
> > > > > > scheduler and returns it for the purpose of XYZ"
> > > > >=20
> > > > > Yeah. Remeber your unlocked rq access slide and the discussion ar=
ound it?
> > > >=20
> > > > Sure. Is that related, though? The slide was about many readers bei=
ng
> > > > totally unlocked. The current drm_sched_entity_push_job() locks rea=
ders
> > > > correctly if I'm not mistaken.
> > > >=20
> > > > >=20
> > > > > Currently we have this:
> > > > >=20
> > > > > drm_sched_entity_push_job()
> > > > > {
> > > > > ...
> > > > > 		spin_lock(&entity->lock);
> > > > > ...
> > > > > 		rq =3D entity->rq;
> > > > > 		sched =3D rq->sched;
> > > > > ...
> > > > > 		spin_unlock(&rq->lock);
> > > > > 		spin_unlock(&entity->lock);
> > > > >=20
> > > > > 		drm_sched_wakeup(sched);
> > > > >=20
> > > > > Ie. we know entity->rq and rq->sched are guaranteed to be stable =
and
> > > > > present at this point because job is already in the queue and
> > > > > drm_sched_entity_select_rq() guarantees that.
> > > > >=20
> > > > > In this patch I moved all this block into drm_sched_rq_add_entity=
() but
> > > > > I wanted to leave drm_sched_wakeup() outside. Because I thought i=
t is
> > > > > not the job of the run queue handling, and semantically the logic=
 was
> > > > > "only once added to the entity we know the rq and scheduler for
> > > > > certain". That would open the door for future improvements and la=
te
> > > > > rq/scheduler selection.
> > > > >=20
> > > > > But now I think it is premature and it would be better I simply m=
ove the
> > > > > wakekup inside drm_sched_rq_add_entity() together with all the re=
st.
> > > > >=20
> > > > > Does that sound like a plan for now?
> > > >=20
> > > > Hmmm. What I'm wondering most about if it really is a good idea to =
have
> > > > drm_sched_wakeup() in rq_add_entity().
> > > >=20
> > > > Do you think that makes semantically more sense than just reading:
> > > >=20
> > > > drm_sched_entity_push_job()
> > > > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 foo
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 bar
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 more_foo
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* New job was added. Right time to wake u=
p scheduler. */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wakeup();
> > >=20
> > > Problem here always is you need a sched pointer so question is simply
> > > how and where to get it.
> > >=20
> > > > I think both can make sense, but the above / current version seems =
to
> > > > make more sense to me.
> > >=20
> > > Current as in this patch or current as in the upstream codebase?
> > >=20
> > > In all cases the knowledge it is safe to use sched after unlocking is
> > > implicit.
> > >=20
> > > I see only two options:
> > >=20
> > > current)
> > >=20
> > > drm_sched_entity_push_job()
> > > {
> > > ...
> > > 	spin_unlock(&rq->lock);
> > > 	spin_unlock(&entity->lock);
> > >=20
> > > 	drm_sched_wakeup(sched);
> > >=20
> > > a)
> > >=20
> > > drm_sched_entity_push_job()
> > > {
> > > ...
> > > 	sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> > > 	if (sched)
> > > 		drm_sched_wakeup(sched);
> > >=20
> > > b)
> > >=20
> > > drm_sched_rq_add_entity()
> > > {
> > > ...
> > > 	spin_unlock(&rq->lock);
> > > 	spin_unlock(&entity->lock);
> > >=20
> > > 	drm_sched_wakeup(sched);
> > >=20
> > >=20
> > > drm_sched_entity_push_job()
> > > {
> > > ...
> > > 	drm_sched_rq_add_entity(entity, submit_ts);
> > >=20
> > >=20
> > > b) is the same as today, a) perhaps a bit premature. Which do you pre=
fer?
> >=20
> > Alright, I looked through everything now.
> >=20
> > The thing is just that I believe that it's a semantically confusing and
> > unclean concept of having drm_sched_rq_add_entity() return a scheduler
> > =E2=80=93 except for when the entity is stopped. Then "there is no sche=
duler"
> > actually means "there is a scheduler, but that entity is stopped"
> >=20
> > In an ideal world:
> >=20
> > a) drm_sched_entity_push_job() wakes up the scheduler (as in your code,
> > and as in the current mainline code) and
> >=20
> > b) drm_sched_entity_push_job() is the one who checks whether the entity
> > is stopped. rq_add_entity() should just, well, add an entity to a
> > runqueue.
> >=20
> > Option b) then would need locks again and could race. So that's not so
> > cool.
> >=20
> > Possible solutions I can see is:
> >=20
> > 1. Have drm_sched_rq_add_entity() return an ERR_PTR instead of NULL.
>=20
> Maybe I am misunderstanding the idea, but what would be the benefit of=
=20
> this option?
>=20
> To clarify, I have:
>=20
> drm_sched_rq_add_entity()
> {
> ...
> 	if (entity->stopped) {
> ...
> 		return NULL;
>=20
> drm_sched_entity_push_job()
> {
> ...
> 		sched =3D drm_sched_rq_add_entity(entity);
> 		if (sched)
> 			drm_sched_wakeup(sched);
>=20
> And you propose:
>=20
> drm_sched_rq_add_entity()
> {
> ...
> 	if (entity->stopped) {
> ...
> 		return ERR_PTR(-ESOMETHING);
>=20
> drm_sched_entity_push_job()
> {
> ...
> 		sched =3D drm_sched_rq_add_entity(entity);
> 		if (!IS_ERR(sched))
> 			drm_sched_wakeup(sched);
>=20
>=20
> ?

Let's phrase it differently:

My issue is that

sched =3D func()
if (!sched) {

reads as "there is no scheduler". Whereas it should read as "there was
an error adding the entity".

How about this:

int drm_sched_entity_push_job(struct sched *scheddy)
{
	if (stopped)
		return -ENODEV; /* or other code, IDK */

	*scheddy =3D XYZ;

=E2=80=A6


ret =3D rq_add_entity(rq, entity, &sched)
if (ret =3D=3D 0)
	drm_sched_wakeup(sched);


Opinions? Matthew, Danilo, Christian?

:)

:(


P.

>=20
> > 2. Rename rq_add_entity()
>=20
> You mean to something signify it is also doing the wakeup? Or simply=20
> drm_sched_rq_add_first_entity()?
>=20
> > 3. Potentially leave it as is? I guess that doesn't work for your rq-
> > simplification?
>=20
> Leave drm_sched_wakeup in push job? Yeah that doesn't work for moving
> the rq handling into own helpers.
> =C2=A0 > Option 1 would almost be my preference. What do you think?
>=20
> Lets see if I understand the option 1. I am fine with that one as=20
> described, and also with option 2.
>=20
> Regards,
>=20
> Tvrtko

