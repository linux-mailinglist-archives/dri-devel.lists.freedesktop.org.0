Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C211CBA3E8D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C05910E1A3;
	Fri, 26 Sep 2025 13:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="BVnK5TjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778A10E1A3;
 Fri, 26 Sep 2025 13:32:19 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cYBMh3vgFz9tJR;
 Fri, 26 Sep 2025 15:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758893536; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCBaNxhSE44Jb1MMsgayEjreTy2/+nYJVnOEqXOsehM=;
 b=BVnK5TjB8F2nIXfoxNOJ4OmdZsWfXU4+JYaTIvKEohEVrW6hc4rtb/PKmBe8TKsqoe24r3
 GgYuwi8B3yvO4WuyG4lAdgw4g+rmD8jZwWPWGIzEJDj2QOWtWrved4KZFjB3Mhj1PMYwlw
 mpw10rMvFCnqZdINm+V3m8h/8UQmqMzPniwc/YLR/2WqzRa8eg+BdEz8JlNR8MUNI1+07O
 OnisweXIBHMBHxRAm8YpBpigGiykZ8PRjwFvKLvStwqk7glGs8YiXHqYNJyvGISbfSXCAM
 fuUJhbPzZavXPxMHSZAaN1OMnSq8X2vUPPox0VvY9/Z161V++j9rPpOWEQaWUw==
Message-ID: <968dcdb5d5e00c83bb6fe2f371ce69ffd1416916.camel@mailbox.org>
Subject: Re: [RFC v8 11/12] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 26 Sep 2025 15:32:12 +0200
In-Reply-To: <c3f1b70a-fc6e-4a71-afb4-bf66d487994d@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-12-tvrtko.ursulin@igalia.com>
 <c6450d203fb015437376844c687ac76e42cba417.camel@mailbox.org>
 <c3f1b70a-fc6e-4a71-afb4-bf66d487994d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: af4fd14ffe0a8839820
X-MBO-RS-META: 8jj9g88c3ymjf7usi7bgkw91o9gcj1cw
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

On Thu, 2025-09-25 at 13:56 +0100, Tvrtko Ursulin wrote:
>=20
> On 24/09/2025 12:50, Philipp Stanner wrote:
> > On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> > > If the new fair policy is at least as good as FIFO and we can afford =
to
> > > remove round-robin, we can simplify the scheduler code by making the
> > > scheduler to run queue relationship always 1:1 and remove some code.
> > >=20
> > > Also, now that the FIFO policy is gone the tree of entities is not a =
FIFO
> > > tree any more so rename it to just the tree.
> >=20
> > I think that this patch should be the one that sets the default
> > scheduling policy to CFS.
> >=20
> > Either that or a separate patch at an appropriate position before #11.
>=20
> Yep, it will be separate.
>=20
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=
 |=C2=A0 23 ++-
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=
=A0 29 +---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0=C2=A0 =
9 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 163 ++++++---------------
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 60 ++------
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 +--=
-
> > > =C2=A0=C2=A06 files changed, 78 insertions(+), 236 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_job.c
> > > index d020a890a0ea..bc07fd57310c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > @@ -434,25 +434,22 @@ drm_sched_entity_queue_pop(struct drm_sched_ent=
ity *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_sch=
eduler *sched)
> > > =C2=A0=C2=A0{
> > > +	struct drm_sched_rq *rq =3D sched->rq;
> > > +	struct drm_sched_entity *s_entity;
> > > =C2=A0=C2=A0	struct drm_sched_job *s_job;
> > > -	struct drm_sched_entity *s_entity =3D NULL;
> > > -	int i;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Signal all jobs not yet scheduled */
> > > -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > -		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > > -		spin_lock(&rq->lock);
> > > -		list_for_each_entry(s_entity, &rq->entities, list) {
> > > -			while ((s_job =3D drm_sched_entity_queue_pop(s_entity))) {
> > > -				struct drm_sched_fence *s_fence =3D s_job->s_fence;
> > > +	spin_lock(&rq->lock);
> > > +	list_for_each_entry(s_entity, &rq->entities, list) {
> > > +		while ((s_job =3D drm_sched_entity_queue_pop(s_entity))) {
> > > +			struct drm_sched_fence *s_fence =3D s_job->s_fence;
> > > =C2=A0=20
> > > -				dma_fence_signal(&s_fence->scheduled);
> > > -				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> > > -				dma_fence_signal(&s_fence->finished);
> > > -			}
> > > +			dma_fence_signal(&s_fence->scheduled);
> > > +			dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> > > +			dma_fence_signal(&s_fence->finished);
> > > =C2=A0=C2=A0		}
> > > -		spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0	}
> > > +	spin_unlock(&rq->lock);
> >=20
> > Yoah, well. Seems there is no easy fix to remove that from amdgpu,
> > since it's used on GPU recovery.
> >=20
> > Fine from my side if it's mentioned and explained in the commit
> > message.
>=20
> Yep. Note there is a "technical debt" TODO marker just above this=20
> function already.
>=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Signal all jobs already scheduled to HW */
> > > =C2=A0=C2=A0	list_for_each_entry(s_job, &sched->pending_list, list) {
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 58f51875547a..6dd30b85925b 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -108,8 +108,6 @@ int drm_sched_entity_init(struct drm_sched_entity=
 *entity,
> > > =C2=A0=C2=A0	entity->guilty =3D guilty;
> > > =C2=A0=C2=A0	entity->num_sched_list =3D num_sched_list;
> > > =C2=A0=C2=A0	entity->priority =3D priority;
> > > -	entity->rq_priority =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FA=
IR ?
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL : priori=
ty;
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * It's perfectly valid to initialize an entity without =
having a valid
> > > =C2=A0=C2=A0	 * scheduler attached. It's just not valid to use the sc=
heduler before it
> > > @@ -119,30 +117,14 @@ int drm_sched_entity_init(struct drm_sched_enti=
ty *entity,
> > > =C2=A0=C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > > =C2=A0=C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> > > =C2=A0=20
> > > -	if (num_sched_list && !sched_list[0]->sched_rq) {
> > > +	if (num_sched_list && !sched_list[0]->rq) {
> > > =C2=A0=C2=A0		/* Since every entry covered by num_sched_list
> > > =C2=A0=C2=A0		 * should be non-NULL and therefore we warn drivers
> > > =C2=A0=C2=A0		 * not to do this and to fix their DRM calling order.
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __=
func__);
> > > =C2=A0=C2=A0	} else if (num_sched_list) {
> > > -		enum drm_sched_priority p =3D entity->priority;
> > > -
> > > -		/*
> > > -		 * The "priority" of an entity cannot exceed the number of
> > > -		 * run-queues of a scheduler. Protect against num_rqs being 0,
> > > -		 * by converting to signed. Choose the lowest priority
> > > -		 * available.
> > > -		 */
> > > -		if (p >=3D sched_list[0]->num_user_rqs) {
> > > -			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%=
u num_user_rqs:%u\n",
> > > -				p, sched_list[0]->num_user_rqs);
> > > -			p =3D max_t(s32,
> > > -				 (s32)sched_list[0]->num_user_rqs - 1,
> > > -				 (s32)DRM_SCHED_PRIORITY_KERNEL);
> > > -			entity->priority =3D p;
> > > -		}
> > > -		entity->rq =3D sched_list[0]->sched_rq[entity->rq_priority];
> > > +		entity->rq =3D sched_list[0]->rq;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	init_completion(&entity->entity_idle);
> > > @@ -575,7 +557,7 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&entity->lock);
> > > =C2=A0=C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity=
->num_sched_list);
> > > -	rq =3D sched ? sched->sched_rq[entity->rq_priority] : NULL;
> > > +	rq =3D sched ? sched->rq : NULL;
> > > =C2=A0=C2=A0	if (rq !=3D entity->rq) {
> > > =C2=A0=C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> > > =C2=A0=C2=A0		entity->rq =3D rq;
> > > @@ -599,7 +581,6 @@ void drm_sched_entity_push_job(struct drm_sched_j=
ob *sched_job)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_sched_entity *entity =3D sched_job->entity;
> > > =C2=A0=C2=A0	bool first;
> > > -	ktime_t submit_ts;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	trace_drm_sched_job_queue(sched_job, entity);
> > > =C2=A0=20
> > > @@ -616,16 +597,14 @@ void drm_sched_entity_push_job(struct drm_sched=
_job *sched_job)
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * After the sched_job is pushed into the entity queue, =
it may be
> > > =C2=A0=C2=A0	 * completed and freed up at any time. We can no longer =
access it.
> > > -	 * Make sure to set the submit_ts first, to avoid a race.
> > > =C2=A0=C2=A0	 */
> > > -	sched_job->submit_ts =3D submit_ts =3D ktime_get();
> >=20
> > Can submit_ts be removed completely?
>=20
> It is. Or you mean is it safe? If there are not more users why not?

Ah right, I overlooked that. Very well.

>=20
> >=20
> > > =C2=A0=C2=A0	first =3D spsc_queue_push(&entity->job_queue, &sched_job=
->queue_node);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* first job wakes up scheduler */
> > > =C2=A0=C2=A0	if (first) {
> > > =C2=A0=C2=A0		struct drm_gpu_scheduler *sched;
> > > =C2=A0=20
> > > -		sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> > > +		sched =3D drm_sched_rq_add_entity(entity);
> > > =C2=A0=C2=A0		if (sched)
> > > =C2=A0=C2=A0			drm_sched_wakeup(sched);
> > > =C2=A0=C2=A0	}
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu=
/drm/scheduler/sched_internal.h
> > > index 125aba70eda6..6e5ed721bb5b 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -22,13 +22,6 @@ struct drm_sched_entity_stats {
> > > =C2=A0=C2=A0	u64		vruntime;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > -/* Used to choose between FIFO and RR job-scheduling */
> > > -extern int drm_sched_policy;
> > > -
> > > -#define DRM_SCHED_POLICY_RR	0
> > > -#define DRM_SCHED_POLICY_FIFO	1
> > > -#define DRM_SCHED_POLICY_FAIR	2
> > > -
> > > =C2=A0=C2=A0bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> > > =C2=A0=C2=A0			 struct drm_sched_entity *entity);
> > > =C2=A0=C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > @@ -39,7 +32,7 @@ struct drm_sched_entity *
> > > =C2=A0=C2=A0drm_sched_rq_select_entity(struct drm_gpu_scheduler *sche=
d,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 struct drm_sched_rq *rq);
> > > =C2=A0=C2=A0struct drm_gpu_scheduler *
> > > -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)=
;
> > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity);
> > > =C2=A0=C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > =C2=A0=C2=A0				struct drm_sched_entity *entity);
> > > =C2=A0=C2=A0void drm_sched_rq_pop_entity(struct drm_sched_entity *ent=
ity);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index e7726095c19a..a9079bdb27d3 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -84,15 +84,6 @@
> > > =C2=A0=C2=A0#define CREATE_TRACE_POINTS
> > > =C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > =C2=A0=20
> > > -int drm_sched_policy =3D DRM_SCHED_POLICY_FAIR;
> > > -
> > > -/**
> > > - * DOC: sched_policy (int)
> > > - * Used to override default entities scheduling policy in a run queu=
e.
> > > - */
> > > -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for en=
tities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin=
, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO, " __stringify(DRM_SCHED_=
POLICY_FAIR) " =3D Fair (default).");
> > > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > > -
> >=20
> > Anyone know what happens if we remove that param and some user still
> > tries to set it?
>=20
> Just an unknown parameter ignored message.
>=20
> > > =C2=A0=C2=A0static u32 drm_sched_available_credits(struct drm_gpu_sch=
eduler *sched)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	u32 credits;
> > > @@ -876,34 +867,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *=
sched)
> > > =C2=A0=C2=A0	drm_sched_run_job_queue(sched);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -/**
> > > - * drm_sched_select_entity - Select next entity to process
> > > - *
> > > - * @sched: scheduler instance
> > > - *
> > > - * Return an entity to process or NULL if none are found.
> > > - *
> > > - * Note, that we break out of the for-loop when "entity" is non-null=
, which can
> > > - * also be an error-pointer--this assures we don't process lower pri=
ority
> > > - * run-queues. See comments in the respectively called functions.
> > > - */
> > > -static struct drm_sched_entity *
> > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > -{
> > > -	struct drm_sched_entity *entity =3D NULL;
> > > -	int i;
> > > -
> > > -	/* Start with the highest priority.
> > > -	 */
> > > -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > -		entity =3D drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
> > > -		if (entity)
> > > -			break;
> > > -	}
> > > -
> > > -	return IS_ERR(entity) ? NULL : entity;
> > > -}
> > > -
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_get_finished_job - fetch the next finished j=
ob to be destroyed
> > > =C2=A0=C2=A0 *
> > > @@ -1023,8 +986,8 @@ static void drm_sched_run_job_work(struct work_s=
truct *w)
> > > =C2=A0=C2=A0	int r;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Find entity with a ready job */
> > > -	entity =3D drm_sched_select_entity(sched);
> > > -	if (!entity)
> > > +	entity =3D drm_sched_rq_select_entity(sched, sched->rq);
> >=20
> > Isn't clear to me why entity-selection should be based on the rq as a
> > parameter, now that the scheduler only has one rq and, thus, only one
> > list of entities anyways.
> >=20
> > Also, you pass both sched and sched->rq, which is redundant.
>=20
> It is gone in the next patch. But it does look like I can move it to=20
> this one just as well. Will do.
>=20
> > I think it would be clearer to continue using the name
> > drm_sched_select_entity().
>=20
> Can do. Just don't complain then what is drm_scehd_select_entity doing=
=20
> in sched_rq.c. :D
>=20
> Yeah I tried to sort and separate things around, and I think I improved=
=20
> things, but things are still not perfect.

Mhm. Perfect is the enemy of "good". Maybe keeping the "rq" name is
even fine then? Choose what feels best to you.

>=20
> >=20
> > > +	if (IS_ERR_OR_NULL(entity))
> > > =C2=A0=C2=A0		return;	/* No more work */
> > > =C2=A0=20
> > > =C2=A0=C2=A0	sched_job =3D drm_sched_entity_pop_job(entity);
> > > @@ -1095,8 +1058,6 @@ static struct workqueue_struct *drm_sched_alloc=
_wq(const char *name)
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched, const=
 struct drm_sched_init_args *args)
> > > =C2=A0=C2=A0{
> > > -	int i;
> > > -
> > > =C2=A0=C2=A0	sched->ops =3D args->ops;
> > > =C2=A0=C2=A0	sched->credit_limit =3D args->credit_limit;
> > > =C2=A0=C2=A0	sched->name =3D args->name;
> > > @@ -1106,13 +1067,7 @@ int drm_sched_init(struct drm_gpu_scheduler *s=
ched, const struct drm_sched_init_
> > > =C2=A0=C2=A0	sched->score =3D args->score ? args->score : &sched->_sc=
ore;
> > > =C2=A0=C2=A0	sched->dev =3D args->dev;
> > > =C2=A0=20
> > > -	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > > -		/* This is a gross violation--tell drivers what the=C2=A0 problem =
is.
> > > -		 */
> > > -		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_=
PRIORITY_COUNT\n",
> > > -			__func__);
> > > -		return -EINVAL;
> > > -	} else if (sched->sched_rq) {
> >=20
> > args->num_rqs is surplus now. What are we going to do with the drivers
> > that set it?
> >=20
> > It should be removed from struct drm_sched_init_args and the using
> > drivers. That way, those drivers will also notice this big change
> > coming up.
>=20
> Good point. I will add patches to the series to remove it from=20
> individual drivers.

Very good, that will be a big improvement.

>=20
> >=20
> > > +	if (sched->rq) {
> > > =C2=A0=C2=A0		/* Not an error, but warn anyway so drivers can
> > > =C2=A0=C2=A0		 * fine-tune their DRM calling order, and return all
> > > =C2=A0=C2=A0		 * is good.
> > > @@ -1132,21 +1087,11 @@ int drm_sched_init(struct drm_gpu_scheduler *=
sched, const struct drm_sched_init_
> > > =C2=A0=C2=A0		sched->own_submit_wq =3D true;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	sched->num_user_rqs =3D args->num_rqs;
> > > -	sched->num_rqs =3D drm_sched_policy !=3D DRM_SCHED_POLICY_FAIR ?
> > > -			 args->num_rqs : 1;
> > > -	sched->sched_rq =3D kmalloc_array(sched->num_rqs,
> > > -					sizeof(*sched->sched_rq),
> > > -					GFP_KERNEL | __GFP_ZERO);
> > > -	if (!sched->sched_rq)
> > > +	sched->rq =3D kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
> > > +	if (!sched->rq)
> > > =C2=A0=C2=A0		goto Out_check_own;
> > > =C2=A0=20
> > > -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > -		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_KE=
RNEL);
> > > -		if (!sched->sched_rq[i])
> > > -			goto Out_unroll;
> > > -		drm_sched_rq_init(sched, sched->sched_rq[i]);
> > > -	}
> > > +	drm_sched_rq_init(sched, sched->rq);
> >=20
> > Same, redundant function parameter.
>=20
> In fact perhaps this should be drm_sched_rq_init(rq, sched)? Because=20
> that is what the functions really does.

Your point is reversing the parameters?

I'm not sure whether we can make the purpose any clearer.

But I do believe that we would break kernel conventions if we pass
something by reference and then pass a member of the referenced thing
by reference, too.

So drm_sched_rq_init(sched) would be canonical.

When the rq is embedded into sched, there's only one anyways. So it can
never be that you have a runqueue which doesn't belong to the passed
scheduler.

>=20
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0	init_waitqueue_head(&sched->job_scheduled);
> > > =C2=A0=C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> > > @@ -1161,12 +1106,7 @@ int drm_sched_init(struct drm_gpu_scheduler *s=
ched, const struct drm_sched_init_
> > > =C2=A0=20
> > > =C2=A0=C2=A0	sched->ready =3D true;
> > > =C2=A0=C2=A0	return 0;
> > > -Out_unroll:
> > > -	for (--i ; i >=3D DRM_SCHED_PRIORITY_KERNEL; i--)
> > > -		kfree(sched->sched_rq[i]);
> > > =C2=A0=20
> > > -	kfree(sched->sched_rq);
> >=20
> > Almost thought we have a memory leak now. But seems fine since we can't
> > fail anymore after the kmalloc() above.
> >=20
> > > -	sched->sched_rq =3D NULL;
> > > =C2=A0=C2=A0Out_check_own:
> > > =C2=A0=C2=A0	if (sched->own_submit_wq)
> > > =C2=A0=C2=A0		destroy_workqueue(sched->submit_wq);
> > > @@ -1202,41 +1142,35 @@ static void drm_sched_cancel_remaining_jobs(s=
truct drm_gpu_scheduler *sched)
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > > =C2=A0=C2=A0{
> > > +
> > > +	struct drm_sched_rq *rq =3D sched->rq;
> > > =C2=A0=C2=A0	struct drm_sched_entity *s_entity;
> > > -	int i;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	drm_sched_wqueue_stop(sched);
> > > =C2=A0=20
> > > -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > -		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > > -
> > > -		spin_lock(&rq->lock);
> > > -		list_for_each_entry(s_entity, &rq->entities, list)
> > > -			/*
> > > -			 * Prevents reinsertion and marks job_queue as idle,
> > > -			 * it will be removed from the rq in drm_sched_entity_fini()
> > > -			 * eventually
> > > -			 *
> > > -			 * FIXME:
> > > -			 * This lacks the proper spin_lock(&s_entity->lock) and
> > > -			 * is, therefore, a race condition. Most notably, it
> > > -			 * can race with drm_sched_entity_push_job(). The lock
> > > -			 * cannot be taken here, however, because this would
> > > -			 * lead to lock inversion -> deadlock.
> > > -			 *
> > > -			 * The best solution probably is to enforce the life
> > > -			 * time rule of all entities having to be torn down
> > > -			 * before their scheduler. Then, however, locking could
> > > -			 * be dropped alltogether from this function.
> > > -			 *
> > > -			 * For now, this remains a potential race in all
> > > -			 * drivers that keep entities alive for longer than
> > > -			 * the scheduler.
> > > -			 */
> > > -			s_entity->stopped =3D true;
> > > -		spin_unlock(&rq->lock);
> > > -		kfree(sched->sched_rq[i]);
> > > -	}
> > > +	spin_lock(&rq->lock);
> > > +	list_for_each_entry(s_entity, &rq->entities, list)
> > > +		/*
> > > +		 * Prevents re-insertion and marks job_queue as idle,
> > > +		 * it will be removed from the rq in drm_sched_entity_fini()
> > > +		 * eventually.
> > > +		 *
> > > +		 * FIXME:
> > > +		 * This lacks the proper spin_lock(&s_entity->lock) and is,
> > > +		 * therefore, a race condition. Most notably, it can race with
> > > +		 * drm_sched_entity_push_job(). The lock cannot be taken here,
> > > +		 * however, because this would lead to lock inversion.
> > > +		 *
> > > +		 * The best solution probably is to enforce the life time rule
> > > +		 * of all entities having to be torn down before their
> > > +		 * scheduler. Then locking could be dropped altogether from this
> > > +		 * function.
> > > +		 *
> > > +		 * For now, this remains a potential race in all drivers that
> > > +		 * keep entities alive for longer than the scheduler.
> > > +		 */
> > > +		s_entity->stopped =3D true;
> > > +	spin_unlock(&rq->lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Wakeup everyone stuck in drm_sched_entity_flush for t=
his scheduler */
> > > =C2=A0=C2=A0	wake_up_all(&sched->job_scheduled);
> > > @@ -1251,8 +1185,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *s=
ched)
> > > =C2=A0=C2=A0	if (sched->own_submit_wq)
> > > =C2=A0=C2=A0		destroy_workqueue(sched->submit_wq);
> > > =C2=A0=C2=A0	sched->ready =3D false;
> > > -	kfree(sched->sched_rq);
> > > -	sched->sched_rq =3D NULL;
> > > +	kfree(sched->rq);
> >=20
> > Renaming sched_rq to rq can be done, but it certainly increases the git
> > diff. Such general naming improvements make patches a bit more
> > difficult to review and I'd prefer to have those in separate patches.
>=20
> I agree in principle just that in this case all the number of touched
> lines would not change much because the member is changed from an array=
=20
> of run queues to a single run queue anyway. It could be this line is the=
=20
> only one which would stay out of the diff.

It's not a deal breaker for me. But if you have wider renaming
ambitions, then preferably in distinct patches :]

>=20
> > > +	sched->rq =3D NULL;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (!list_empty(&sched->pending_list))
> > > =C2=A0=C2=A0		dev_warn(sched->dev, "Tearing down scheduler while jobs=
 are pending!\n");
> > > @@ -1270,35 +1204,28 @@ EXPORT_SYMBOL(drm_sched_fini);
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0void drm_sched_increase_karma(struct drm_sched_job *bad)
> > > =C2=A0=C2=A0{
> > > -	int i;
> > > -	struct drm_sched_entity *tmp;
> > > -	struct drm_sched_entity *entity;
> > > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched =3D bad->sched;
> > > +	struct drm_sched_entity *entity, *tmp;
> > > +	struct drm_sched_rq *rq =3D sched->rq;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* don't change @bad's karma if it's from KERNEL RQ,
> > > =C2=A0=C2=A0	 * because sometimes GPU hang would cause kernel jobs (l=
ike VM updating jobs)
> > > =C2=A0=C2=A0	 * corrupt but keep in mind that kernel jobs always cons=
idered good.
> > > =C2=A0=C2=A0	 */
> > > -	if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> > > -		atomic_inc(&bad->karma);
> > > +	if (bad->s_priority =3D=3D DRM_SCHED_PRIORITY_KERNEL)
> > > +		return;
> > > =C2=A0=20
> > > -		for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > -			struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > > +	atomic_inc(&bad->karma);
> > > =C2=A0=20
> > > -			spin_lock(&rq->lock);
> > > -			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> > > -				if (bad->s_fence->scheduled.context =3D=3D
> > > -				=C2=A0=C2=A0=C2=A0 entity->fence_context) {
> > > -					if (entity->guilty)
> > > -						atomic_set(entity->guilty, 1);
> > > -					break;
> > > -				}
> > > -			}
> > > -			spin_unlock(&rq->lock);
> > > -			if (&entity->list !=3D &rq->entities)
> > > -				break;
> > > +	spin_lock(&rq->lock);
> > > +	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> > > +		if (bad->s_fence->scheduled.context =3D=3D entity->fence_context) =
{
> > > +			if (entity->guilty)
> > > +				atomic_set(entity->guilty, 1);
> > > +			break;
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	}
> > > +	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_increase_karma);
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/s=
cheduler/sched_rq.c
> > > index c5be8a2c893d..a9bc105221bf 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_rq.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> > > @@ -34,7 +34,7 @@ static void drm_sched_rq_update_prio(struct drm_sch=
ed_rq *rq)
> > > =C2=A0=C2=A0	rq->head_prio =3D prio;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity =
*entity,
> > > +static void drm_sched_rq_remove_tree_locked(struct drm_sched_entity =
*entity,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	lockdep_assert_held(&entity->lock);
> > > @@ -47,7 +47,7 @@ static void drm_sched_rq_remove_fifo_locked(struct =
drm_sched_entity *entity,
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity =
*entity,
> > > +static void drm_sched_rq_update_tree_locked(struct drm_sched_entity =
*entity,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> > > =C2=A0=C2=A0{
> > > @@ -59,7 +59,7 @@ static void drm_sched_rq_update_fifo_locked(struct =
drm_sched_entity *entity,
> > > =C2=A0=C2=A0	lockdep_assert_held(&entity->lock);
> > > =C2=A0=C2=A0	lockdep_assert_held(&rq->lock);
> > > =C2=A0=20
> > > -	drm_sched_rq_remove_fifo_locked(entity, rq);
> > > +	drm_sched_rq_remove_tree_locked(entity, rq);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	entity->oldest_job_waiting =3D ts;
> > > =C2=A0=20
> > > @@ -207,17 +207,17 @@ static ktime_t drm_sched_entity_get_job_ts(stru=
ct drm_sched_entity *entity)
> > > =C2=A0=C2=A0 * drm_sched_rq_add_entity - add an entity
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * @entity: scheduler entity
> > > - * @ts: submission timestamp
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Adds a scheduler entity to the run queue.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Returns a DRM scheduler pre-selected to handle this en=
tity.
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0struct drm_gpu_scheduler *
> > > -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> > > +drm_sched_rq_add_entity(struct drm_sched_entity *entity)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched;
> > > =C2=A0=C2=A0	struct drm_sched_rq *rq;
> > > +	ktime_t ts;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* Add the entity to the run queue */
> > > =C2=A0=C2=A0	spin_lock(&entity->lock);
> > > @@ -237,15 +237,9 @@ drm_sched_rq_add_entity(struct drm_sched_entity =
*entity, ktime_t ts)
> > > =C2=A0=C2=A0		list_add_tail(&entity->list, &rq->entities);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> > > -		ts =3D drm_sched_rq_get_min_vruntime(rq);
> > > -		ts =3D drm_sched_entity_restore_vruntime(entity, ts,
> > > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->head_prio);
> > > -	} else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR) {
> > > -		ts =3D entity->rr_ts;
> > > -	}
> > > -
> > > -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +	ts =3D drm_sched_rq_get_min_vruntime(rq);
> > > +	ts =3D drm_sched_entity_restore_vruntime(entity, ts, rq->head_prio)=
;
> > > +	drm_sched_rq_update_tree_locked(entity, rq, ts);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0	spin_unlock(&entity->lock);
> > > @@ -274,26 +268,11 @@ void drm_sched_rq_remove_entity(struct drm_sche=
d_rq *rq,
> > > =C2=A0=C2=A0	atomic_dec(rq->sched->score);
> > > =C2=A0=C2=A0	list_del_init(&entity->list);
> > > =C2=A0=20
> > > -	drm_sched_rq_remove_fifo_locked(entity, rq);
> > > +	drm_sched_rq_remove_tree_locked(entity, rq);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
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
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_rq_pop_entity - pops an entity
> > > =C2=A0=C2=A0 *
> > > @@ -317,23 +296,14 @@ void drm_sched_rq_pop_entity(struct drm_sched_e=
ntity *entity)
> > > =C2=A0=C2=A0	if (next_job) {
> > > =C2=A0=C2=A0		ktime_t ts;
> > > =C2=A0=20
> > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR)
> > > -			ts =3D drm_sched_entity_get_job_ts(entity);
> > > -		else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > -			ts =3D next_job->submit_ts;
> > > -		else
> > > -			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> > > -
> > > -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > +		ts =3D drm_sched_entity_get_job_ts(entity);
> > > +		drm_sched_rq_update_tree_locked(entity, rq, ts);
> > > =C2=A0=C2=A0	} else {
> > > -		drm_sched_rq_remove_fifo_locked(entity, rq);
> > > +		ktime_t min_vruntime;
> > > =C2=A0=20
> > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> > > -			ktime_t min_vruntime;
> > > -
> > > -			min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> > > -			drm_sched_entity_save_vruntime(entity, min_vruntime);
> > > -		}
> > > +		drm_sched_rq_remove_tree_locked(entity, rq);
> > > +		min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> > > +		drm_sched_entity_save_vruntime(entity, min_vruntime);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0	spin_unlock(&entity->lock);
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 327b75a052c7..c9b75a05d05c 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -96,8 +96,7 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0	 * @lock:
> > > =C2=A0=C2=A0	 *
> > > =C2=A0=C2=A0	 * Lock protecting the run-queue (@rq) to which this ent=
ity belongs,
> > > -	 * @priority, the list of schedulers (@sched_list, @num_sched_list)=
 and
> > > -	 * the @rr_ts field.
> > > +	 * @priority and the list of schedulers (@sched_list, @num_sched_li=
st).
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	spinlock_t			lock;
> > > =C2=A0=20
> > > @@ -150,18 +149,6 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 priority;
> > > =C2=A0=20
> > > -	/**
> > > -	 * @rq_priority: Run-queue priority
> > > -	 */
> > > -	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 rq_priority;
> > > -
> > > -	/**
> > > -	 * @rr_ts:
> > > -	 *
> > > -	 * Fake timestamp of the last popped job from the entity.
> > > -	 */
> > > -	ktime_t				rr_ts;
> > > -
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @job_queue: the list of jobs of this entity.
> > > =C2=A0=C2=A0	 */
> > > @@ -259,8 +246,7 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0 * struct drm_sched_rq - queue of entities to be schedule=
d.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * @sched: the scheduler to which this rq belongs to.
> > > - * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
> > > - * @rr_ts: monotonically incrementing fake timestamp for RR mode
> > > + * @lock: protects @entities, @rb_tree_root and @head_prio.
> > > =C2=A0=C2=A0 * @entities: list of the entities to be scheduled.
> > > =C2=A0=C2=A0 * @rb_tree_root: root of time based priority queue of en=
tities for FIFO scheduling
> > > =C2=A0=C2=A0 * @head_prio: priority of the top tree element
> > > @@ -274,7 +260,6 @@ struct drm_sched_rq {
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spinlock_t			lock;
> > > =C2=A0=C2=A0	/* Following members are protected by the @lock: */
> > > -	ktime_t				rr_ts;
> > > =C2=A0=C2=A0	struct list_head		entities;
> > > =C2=A0=C2=A0	struct rb_root_cached		rb_tree_root;
> > > =C2=A0=C2=A0	enum drm_sched_priority		head_prio;
> > > @@ -360,13 +345,6 @@ struct drm_sched_fence *to_drm_sched_fence(struc=
t dma_fence *f);
> > > =C2=A0=C2=A0 * to schedule the job.
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0struct drm_sched_job {
> > > -	/**
> > > -	 * @submit_ts:
> > > -	 *
> > > -	 * When the job was pushed into the entity queue.
> > > -	 */
> > > -	ktime_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 submit_ts;
> > > -
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @sched:
> > > =C2=A0=C2=A0	 *
> > > @@ -603,9 +581,7 @@ struct drm_gpu_scheduler {
> > > =C2=A0=C2=A0	atomic_t			credit_count;
> > > =C2=A0=C2=A0	long				timeout;
> > > =C2=A0=C2=A0	const char			*name;
> > > -	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> > > -	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_user_rqs;
> > > -	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 **sched_rq;
> > > +	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *rq;
> >=20
> > Docu must be updated
>=20
> You insisted the series must be RFC and I tend to not polish RFC's to
> the max. ;p

Ah well, we're doing a Schr=C3=B6dinger's review: this series is both RFC
and v1 simultaneously :D

But srsly, I think why I mentioned the docu so frequently is mostly
because more docu helps me understand the RFC better since I didn't
write the code.

In the line above it's indeed trivial, of course. Don't bother yourself
too much, at least not before we talk about CFS with the others next
week


P.

>=20
> Will fix.
>=20
> Regards,
>=20
> Tvrtko
>=20
>=20
> > > =C2=A0=C2=A0	wait_queue_head_t		job_scheduled;
> > > =C2=A0=C2=A0	atomic64_t			job_id_count;
> > > =C2=A0=C2=A0	struct workqueue_struct		*submit_wq;
> >=20
>=20

