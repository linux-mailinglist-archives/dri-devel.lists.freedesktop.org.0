Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77376BD8F66
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FC910E20A;
	Tue, 14 Oct 2025 11:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Kuov4B6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22D610E20A;
 Tue, 14 Oct 2025 11:16:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmBVX3xqFz9spB;
 Tue, 14 Oct 2025 13:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760440580; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0FTjRZW2ifkInjEp6B9oFJImK6858BNjGxMkwD8Cvs=;
 b=Kuov4B6trk2GcME670vDOJvdYVmdqy6ro3O58ukOE6oCfR8BwcStUD6zy5eBY9BFUcbTSD
 H6/QYtUP369AG0s/aLxVdZejHdKK3oDLVnfmyYuw0gst8fVI/vOoTxtK2i8D2ddhIKEafT
 +uvnRN5nvXcHRzTdETW72axrkYx8VKNOSmjsefPWTXdB9P2aM+/wQ9fWwz6IszSFOr0zHr
 JUqYpxLkmNPYl4M+ahJmjnBx0LSbRA4lF8nbebywWBKWWO556zMiX2AOygwd8YfJbkDjMm
 YnrsLD1Oo8j2oi+Hv8RfIXO+iv/3MuLSg5iiTKOaAJs1OfWPhgY0Md8nSk4/Ow==
Message-ID: <44dfae80b8e504d6908cae79fab707f02b974834.camel@mailbox.org>
Subject: Re: [PATCH 13/28] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Tue, 14 Oct 2025 13:16:17 +0200
In-Reply-To: <20251008085359.52404-14-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-14-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: j9nx4pny8x7brddpcj7giq9hatairwn9
X-MBO-RS-ID: 00c0c212d31c69fc295
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
> Since the new fair policy is at least as good as FIFO and we can afford t=
o

s/fair/FAIR

> remove round-robin,
>=20

Better state that RR has not been used as the default since forever as
the justification.

>  we can simplify the scheduler code by making the
> scheduler to run queue relationship always 1:1 and remove some code.
>=20
> Also, now that the FIFO policy is gone the tree of entities is not a FIFO
> tree any more so rename it to just the tree.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2=
3 ++-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=A0 29 +--=
-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0 12 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16=
1 ++++++---------------
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 67 +++------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 +----
> =C2=A06 files changed, 82 insertions(+), 246 deletions(-)

Now that's nice!


Just a few more comments below; I have a bit of a tight schedule this
week.

>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index d020a890a0ea..bc07fd57310c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -434,25 +434,22 @@ drm_sched_entity_queue_pop(struct drm_sched_entity =
*entity)
> =C2=A0
> =C2=A0void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sc=
hed)
> =C2=A0{
> +	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_entity *s_entity;
> =C2=A0	struct drm_sched_job *s_job;
> -	struct drm_sched_entity *s_entity =3D NULL;
> -	int i;
> =C2=A0
> =C2=A0	/* Signal all jobs not yet scheduled */
> -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list) {
> -			while ((s_job =3D drm_sched_entity_queue_pop(s_entity))) {
> -				struct drm_sched_fence *s_fence =3D s_job->s_fence;
> +	spin_lock(&rq->lock);
> +	list_for_each_entry(s_entity, &rq->entities, list) {
> +		while ((s_job =3D drm_sched_entity_queue_pop(s_entity))) {
> +			struct drm_sched_fence *s_fence =3D s_job->s_fence;
> =C2=A0
> -				dma_fence_signal(&s_fence->scheduled);
> -				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> -				dma_fence_signal(&s_fence->finished);
> -			}
> +			dma_fence_signal(&s_fence->scheduled);
> +			dma_fence_set_error(&s_fence->finished, -EHWPOISON);

Do we btw. know why the error was even poisoned here?

> +			dma_fence_signal(&s_fence->finished);
> =C2=A0		}
> -		spin_unlock(&rq->lock);
> =C2=A0	}
> +	spin_unlock(&rq->lock);
> =C2=A0
> =C2=A0	/* Signal all jobs already scheduled to HW */
> =C2=A0	list_for_each_entry(s_job, &sched->pending_list, list) {
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 1715e1caec40..2b03ca7c835a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -109,8 +109,6 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> =C2=A0	entity->guilty =3D guilty;
> =C2=A0	entity->num_sched_list =3D num_sched_list;
> =C2=A0	entity->priority =3D priority;
> -	entity->rq_priority =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR ?
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL : priority;
> =C2=A0	/*
> =C2=A0	 * It's perfectly valid to initialize an entity without having a v=
alid
> =C2=A0	 * scheduler attached. It's just not valid to use the scheduler be=
fore it
> @@ -120,30 +118,14 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> =C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> =C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> =C2=A0
> -	if (num_sched_list && !sched_list[0]->sched_rq) {
> +	if (num_sched_list && !sched_list[0]->rq) {
> =C2=A0		/* Since every entry covered by num_sched_list
> =C2=A0		 * should be non-NULL and therefore we warn drivers
> =C2=A0		 * not to do this and to fix their DRM calling order.
> =C2=A0		 */
> =C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> =C2=A0	} else if (num_sched_list) {
> -		enum drm_sched_priority p =3D entity->priority;
> -
> -		/*
> -		 * The "priority" of an entity cannot exceed the number of
> -		 * run-queues of a scheduler. Protect against num_rqs being 0,
> -		 * by converting to signed. Choose the lowest priority
> -		 * available.
> -		 */
> -		if (p >=3D sched_list[0]->num_user_rqs) {
> -			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u nu=
m_user_rqs:%u\n",
> -				p, sched_list[0]->num_user_rqs);
> -			p =3D max_t(s32,
> -				 (s32)sched_list[0]->num_user_rqs - 1,
> -				 (s32)DRM_SCHED_PRIORITY_KERNEL);
> -			entity->priority =3D p;
> -		}
> -		entity->rq =3D sched_list[0]->sched_rq[entity->rq_priority];
> +		entity->rq =3D sched_list[0]->rq;
> =C2=A0	}
> =C2=A0
> =C2=A0	init_completion(&entity->entity_idle);
> @@ -576,7 +558,7 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
> =C2=A0
> =C2=A0	spin_lock(&entity->lock);
> =C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity->num_sche=
d_list);
> -	rq =3D sched ? sched->sched_rq[entity->rq_priority] : NULL;
> +	rq =3D sched ? sched->rq : NULL;
> =C2=A0	if (rq !=3D entity->rq) {
> =C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0		entity->rq =3D rq;
> @@ -600,7 +582,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *=
sched_job)
> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D sched_job->entity;
> =C2=A0	bool first;
> -	ktime_t submit_ts;
> =C2=A0
> =C2=A0	trace_drm_sched_job_queue(sched_job, entity);
> =C2=A0
> @@ -617,16 +598,14 @@ void drm_sched_entity_push_job(struct drm_sched_job=
 *sched_job)
> =C2=A0	/*
> =C2=A0	 * After the sched_job is pushed into the entity queue, it may be
> =C2=A0	 * completed and freed up at any time. We can no longer access it.
> -	 * Make sure to set the submit_ts first, to avoid a race.
> =C2=A0	 */
> -	sched_job->submit_ts =3D submit_ts =3D ktime_get();
> =C2=A0	first =3D spsc_queue_push(&entity->job_queue, &sched_job->queue_no=
de);
> =C2=A0
> =C2=A0	/* first job wakes up scheduler */
> =C2=A0	if (first) {
> =C2=A0		struct drm_gpu_scheduler *sched;
> =C2=A0
> -		sched =3D drm_sched_rq_add_entity(entity, submit_ts);
> +		sched =3D drm_sched_rq_add_entity(entity);
> =C2=A0		if (sched)
> =C2=A0			drm_sched_wakeup(sched);
> =C2=A0	}
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index a120efc5d763..0a5b7bf2cb93 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -32,13 +32,6 @@ struct drm_sched_entity_stats {
> =C2=A0	struct ewma_drm_sched_avgtime=C2=A0=C2=A0 avg_job_us;
> =C2=A0};
> =C2=A0
> -/* Used to choose between FIFO and RR job-scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0 0
> -#define DRM_SCHED_POLICY_FIFO 1
> -#define DRM_SCHED_POLICY_FAIR 2
> -
> =C2=A0bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> =C2=A0			 struct drm_sched_entity *entity);
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> @@ -46,10 +39,9 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)=
;
> =C2=A0void drm_sched_rq_init(struct drm_sched_rq *rq,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sc=
hed);
> =C2=A0struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0 struct drm_sched_rq *rq);
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched);
> =C2=A0struct drm_gpu_scheduler *
> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity);
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0				struct drm_sched_entity *entity);
> =C2=A0void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 858fc28e91e4..518ce87f844a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -84,15 +84,6 @@
> =C2=A0#define CREATE_TRACE_POINTS
> =C2=A0#include "gpu_scheduler_trace.h"
> =C2=A0
> -int drm_sched_policy =3D DRM_SCHED_POLICY_FAIR;
> -
> -/**
> - * DOC: sched_policy (int)
> - * Used to override default entities scheduling policy in a run queue.
> - */
> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entiti=
es on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin, " =
__stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO, " __stringify(DRM_SCHED_POLI=
CY_FAIR) " =3D Fair (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> -
> =C2=A0static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sc=
hed)
> =C2=A0{
> =C2=A0	u32 credits;
> @@ -876,34 +867,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sche=
d)
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Return an entity to process or NULL if none are found.
> - *
> - * Note, that we break out of the for-loop when "entity" is non-null, wh=
ich can
> - * also be an error-pointer--this assures we don't process lower priorit=
y
> - * run-queues. See comments in the respectively called functions.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity =3D NULL;
> -	int i;
> -
> -	/* Start with the highest priority.
> -	 */
> -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		entity =3D drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return IS_ERR(entity) ? NULL : entity;
> -}
> -
> =C2=A0/**
> =C2=A0 * drm_sched_get_finished_job - fetch the next finished job to be d=
estroyed
> =C2=A0 *
> @@ -1029,7 +992,7 @@ static void drm_sched_run_job_work(struct work_struc=
t *w)
> =C2=A0
> =C2=A0	/* Find entity with a ready job */
> =C2=A0	entity =3D drm_sched_select_entity(sched);
> -	if (!entity)
> +	if (IS_ERR_OR_NULL(entity))

What's that about?

> =C2=A0		return;	/* No more work */
> =C2=A0
> =C2=A0	sched_job =3D drm_sched_entity_pop_job(entity);
> @@ -1100,8 +1063,6 @@ static struct workqueue_struct *drm_sched_alloc_wq(=
const char *name)
> =C2=A0 */
> =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched, const struct dr=
m_sched_init_args *args)
> =C2=A0{
> -	int i;
> -
> =C2=A0	sched->ops =3D args->ops;
> =C2=A0	sched->credit_limit =3D args->credit_limit;
> =C2=A0	sched->name =3D args->name;
> @@ -1111,13 +1072,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched=
, const struct drm_sched_init_
> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0
> -	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> -		/* This is a gross violation--tell drivers what the=C2=A0 problem is.
> -		 */
> -		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIO=
RITY_COUNT\n",
> -			__func__);
> -		return -EINVAL;
> -	} else if (sched->sched_rq) {
> +	if (sched->rq) {
> =C2=A0		/* Not an error, but warn anyway so drivers can
> =C2=A0		 * fine-tune their DRM calling order, and return all
> =C2=A0		 * is good.
> @@ -1137,21 +1092,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d, const struct drm_sched_init_
> =C2=A0		sched->own_submit_wq =3D true;
> =C2=A0	}
> =C2=A0
> -	sched->num_user_rqs =3D args->num_rqs;
> -	sched->num_rqs =3D drm_sched_policy !=3D DRM_SCHED_POLICY_FAIR ?
> -			 args->num_rqs : 1;
> -	sched->sched_rq =3D kmalloc_array(sched->num_rqs,
> -					sizeof(*sched->sched_rq),
> -					GFP_KERNEL | __GFP_ZERO);
> -	if (!sched->sched_rq)
> +	sched->rq =3D kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
> +	if (!sched->rq)
> =C2=A0		goto Out_check_own;
> =C2=A0
> -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL=
);
> -		if (!sched->sched_rq[i])
> -			goto Out_unroll;
> -		drm_sched_rq_init(sched->sched_rq[i], sched);
> -	}
> +	drm_sched_rq_init(sched->rq, sched);
> =C2=A0
> =C2=A0	init_waitqueue_head(&sched->job_scheduled);
> =C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1167,12 +1112,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched=
, const struct drm_sched_init_
> =C2=A0
> =C2=A0	sched->ready =3D true;
> =C2=A0	return 0;
> -Out_unroll:
> -	for (--i ; i >=3D DRM_SCHED_PRIORITY_KERNEL; i--)
> -		kfree(sched->sched_rq[i]);
> =C2=A0
> -	kfree(sched->sched_rq);
> -	sched->sched_rq =3D NULL;
> =C2=A0Out_check_own:
> =C2=A0	if (sched->own_submit_wq)
> =C2=A0		destroy_workqueue(sched->submit_wq);
> @@ -1208,41 +1148,35 @@ static void drm_sched_cancel_remaining_jobs(struc=
t drm_gpu_scheduler *sched)
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> +

Surplus empty line.


P.

> +	struct drm_sched_rq *rq =3D sched->rq;
> =C2=A0	struct drm_sched_entity *s_entity;
> -	int i;
> =C2=A0
> =C2=A0	drm_sched_wqueue_stop(sched);
> =C2=A0
> -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> -
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> -			/*
> -			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will be removed from the rq in drm_sched_entity_fini()
> -			 * eventually
> -			 *
> -			 * FIXME:
> -			 * This lacks the proper spin_lock(&s_entity->lock) and
> -			 * is, therefore, a race condition. Most notably, it
> -			 * can race with drm_sched_entity_push_job(). The lock
> -			 * cannot be taken here, however, because this would
> -			 * lead to lock inversion -> deadlock.
> -			 *
> -			 * The best solution probably is to enforce the life
> -			 * time rule of all entities having to be torn down
> -			 * before their scheduler. Then, however, locking could
> -			 * be dropped alltogether from this function.
> -			 *
> -			 * For now, this remains a potential race in all
> -			 * drivers that keep entities alive for longer than
> -			 * the scheduler.
> -			 */
> -			s_entity->stopped =3D true;
> -		spin_unlock(&rq->lock);
> -		kfree(sched->sched_rq[i]);
> -	}
> +	spin_lock(&rq->lock);
> +	list_for_each_entry(s_entity, &rq->entities, list)
> +		/*
> +		 * Prevents re-insertion and marks job_queue as idle,
> +		 * it will be removed from the rq in drm_sched_entity_fini()
> +		 * eventually.
> +		 *
> +		 * FIXME:
> +		 * This lacks the proper spin_lock(&s_entity->lock) and is,
> +		 * therefore, a race condition. Most notably, it can race with
> +		 * drm_sched_entity_push_job(). The lock cannot be taken here,
> +		 * however, because this would lead to lock inversion.
> +		 *
> +		 * The best solution probably is to enforce the life time rule
> +		 * of all entities having to be torn down before their
> +		 * scheduler. Then locking could be dropped altogether from this
> +		 * function.
> +		 *
> +		 * For now, this remains a potential race in all drivers that
> +		 * keep entities alive for longer than the scheduler.
> +		 */
> +		s_entity->stopped =3D true;
> +	spin_unlock(&rq->lock);
> =C2=A0
> =C2=A0	/* Wakeup everyone stuck in drm_sched_entity_flush for this schedu=
ler */
> =C2=A0	wake_up_all(&sched->job_scheduled);
> @@ -1257,8 +1191,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
)
> =C2=A0	if (sched->own_submit_wq)
> =C2=A0		destroy_workqueue(sched->submit_wq);
> =C2=A0	sched->ready =3D false;
> -	kfree(sched->sched_rq);
> -	sched->sched_rq =3D NULL;
> +	kfree(sched->rq);
> +	sched->rq =3D NULL;
> =C2=A0
> =C2=A0	if (!list_empty(&sched->pending_list))
> =C2=A0		dev_warn(sched->dev, "Tearing down scheduler while jobs are pendi=
ng!\n");
> @@ -1276,35 +1210,28 @@ EXPORT_SYMBOL(drm_sched_fini);
> =C2=A0 */
> =C2=A0void drm_sched_increase_karma(struct drm_sched_job *bad)
> =C2=A0{
> -	int i;
> -	struct drm_sched_entity *tmp;
> -	struct drm_sched_entity *entity;
> =C2=A0	struct drm_gpu_scheduler *sched =3D bad->sched;
> +	struct drm_sched_entity *entity, *tmp;
> +	struct drm_sched_rq *rq =3D sched->rq;
> =C2=A0
> =C2=A0	/* don't change @bad's karma if it's from KERNEL RQ,
> =C2=A0	 * because sometimes GPU hang would cause kernel jobs (like VM upd=
ating jobs)
> =C2=A0	 * corrupt but keep in mind that kernel jobs always considered goo=
d.
> =C2=A0	 */
> -	if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> -		atomic_inc(&bad->karma);
> +	if (bad->s_priority =3D=3D DRM_SCHED_PRIORITY_KERNEL)
> +		return;
> =C2=A0
> -		for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -			struct drm_sched_rq *rq =3D sched->sched_rq[i];
> +	atomic_inc(&bad->karma);
> =C2=A0
> -			spin_lock(&rq->lock);
> -			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> -				if (bad->s_fence->scheduled.context =3D=3D
> -				=C2=A0=C2=A0=C2=A0 entity->fence_context) {
> -					if (entity->guilty)
> -						atomic_set(entity->guilty, 1);
> -					break;
> -				}
> -			}
> -			spin_unlock(&rq->lock);
> -			if (&entity->list !=3D &rq->entities)
> -				break;
> +	spin_lock(&rq->lock);
> +	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> +		if (bad->s_fence->scheduled.context =3D=3D entity->fence_context) {
> +			if (entity->guilty)
> +				atomic_set(entity->guilty, 1);
> +			break;
> =C2=A0		}
> =C2=A0	}
> +	spin_unlock(&rq->lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_increase_karma);
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index 02742869e75b..f9c899a9629c 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -34,7 +34,7 @@ static void drm_sched_rq_update_prio(struct drm_sched_r=
q *rq)
> =C2=A0	rq->head_prio =3D prio;
> =C2=A0}
> =C2=A0
> -static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *ent=
ity,
> +static void drm_sched_rq_remove_tree_locked(struct drm_sched_entity *ent=
ity,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> =C2=A0{
> =C2=A0	lockdep_assert_held(&entity->lock);
> @@ -47,7 +47,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_=
sched_entity *entity,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *ent=
ity,
> +static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *ent=
ity,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> =C2=A0					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> =C2=A0{
> @@ -59,7 +59,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_=
sched_entity *entity,
> =C2=A0	lockdep_assert_held(&entity->lock);
> =C2=A0	lockdep_assert_held(&rq->lock);
> =C2=A0
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> +	drm_sched_rq_remove_tree_locked(entity, rq);
> =C2=A0
> =C2=A0	entity->oldest_job_waiting =3D ts;
> =C2=A0
> @@ -211,17 +211,17 @@ static ktime_t drm_sched_entity_get_job_ts(struct d=
rm_sched_entity *entity)
> =C2=A0 * drm_sched_rq_add_entity - add an entity
> =C2=A0 *
> =C2=A0 * @entity: scheduler entity
> - * @ts: submission timestamp
> =C2=A0 *
> =C2=A0 * Adds a scheduler entity to the run queue.
> =C2=A0 *
> =C2=A0 * Returns a DRM scheduler pre-selected to handle this entity.
> =C2=A0 */
> =C2=A0struct drm_gpu_scheduler *
> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> =C2=A0	struct drm_sched_rq *rq;
> +	ktime_t ts;
> =C2=A0
> =C2=A0	/* Add the entity to the run queue */
> =C2=A0	spin_lock(&entity->lock);
> @@ -241,15 +241,9 @@ drm_sched_rq_add_entity(struct drm_sched_entity *ent=
ity, ktime_t ts)
> =C2=A0		list_add_tail(&entity->list, &rq->entities);
> =C2=A0	}
> =C2=A0
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> -		ts =3D drm_sched_rq_get_min_vruntime(rq);
> -		ts =3D drm_sched_entity_restore_vruntime(entity, ts,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->head_prio);
> -	} else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR) {
> -		ts =3D entity->rr_ts;
> -	}
> -
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	ts =3D drm_sched_rq_get_min_vruntime(rq);
> +	ts =3D drm_sched_entity_restore_vruntime(entity, ts, rq->head_prio);
> +	drm_sched_rq_update_tree_locked(entity, rq, ts);
> =C2=A0
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0	spin_unlock(&entity->lock);
> @@ -278,26 +272,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq=
 *rq,
> =C2=A0	atomic_dec(rq->sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> +	drm_sched_rq_remove_tree_locked(entity, rq);
> =C2=A0
> =C2=A0	spin_unlock(&rq->lock);
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
> =C2=A0/**
> =C2=A0 * drm_sched_rq_pop_entity - pops an entity
> =C2=A0 *
> @@ -321,33 +300,23 @@ void drm_sched_rq_pop_entity(struct drm_sched_entit=
y *entity)
> =C2=A0	if (next_job) {
> =C2=A0		ktime_t ts;
> =C2=A0
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR)
> -			ts =3D drm_sched_entity_get_job_ts(entity);
> -		else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -			ts =3D next_job->submit_ts;
> -		else
> -			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> -
> -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +		ts =3D drm_sched_entity_get_job_ts(entity);
> +		drm_sched_rq_update_tree_locked(entity, rq, ts);
> =C2=A0	} else {
> -		drm_sched_rq_remove_fifo_locked(entity, rq);
> +		ktime_t min_vruntime;
> =C2=A0
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> -			ktime_t min_vruntime;
> -
> -			min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> -			drm_sched_entity_save_vruntime(entity, min_vruntime);
> -		}
> +		drm_sched_rq_remove_tree_locked(entity, rq);
> +		min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> +		drm_sched_entity_save_vruntime(entity, min_vruntime);
> =C2=A0	}
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0	spin_unlock(&entity->lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_sched_rq_select_entity - Select an entity which provides a job to=
 run
> + * drm_sched_select_entity - Select an entity which provides a job to ru=
n
> =C2=A0 *
> =C2=A0 * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> =C2=A0 *
> =C2=A0 * Find oldest waiting ready entity.
> =C2=A0 *
> @@ -356,9 +325,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity =
*entity)
> =C2=A0 * its job; return NULL, if no ready entity was found.
> =C2=A0 */
> =C2=A0struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> =C2=A0{
> +	struct drm_sched_rq *rq =3D sched->rq;
> =C2=A0	struct rb_node *rb;
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a7e407e04ce0..d4dc4b8b770a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -99,8 +99,7 @@ struct drm_sched_entity {
> =C2=A0	 * @lock:
> =C2=A0	 *
> =C2=A0	 * Lock protecting the run-queue (@rq) to which this entity belong=
s,
> -	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
> -	 * the @rr_ts field.
> +	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
> =C2=A0	 */
> =C2=A0	spinlock_t			lock;
> =C2=A0
> @@ -153,18 +152,6 @@ struct drm_sched_entity {
> =C2=A0	 */
> =C2=A0	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 priority;
> =C2=A0
> -	/**
> -	 * @rq_priority: Run-queue priority
> -	 */
> -	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 rq_priority;
> -
> -	/**
> -	 * @rr_ts:
> -	 *
> -	 * Fake timestamp of the last popped job from the entity.
> -	 */
> -	ktime_t				rr_ts;
> -
> =C2=A0	/**
> =C2=A0	 * @job_queue: the list of jobs of this entity.
> =C2=A0	 */
> @@ -262,8 +249,7 @@ struct drm_sched_entity {
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
> - * @rr_ts: monotonically incrementing fake timestamp for RR mode
> + * @lock: protects @entities, @rb_tree_root and @head_prio.
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priority queue of entities for=
 FIFO scheduling
> =C2=A0 * @head_prio: priority of the top tree element
> @@ -277,7 +263,6 @@ struct drm_sched_rq {
> =C2=A0
> =C2=A0	spinlock_t			lock;
> =C2=A0	/* Following members are protected by the @lock: */
> -	ktime_t				rr_ts;
> =C2=A0	struct list_head		entities;
> =C2=A0	struct rb_root_cached		rb_tree_root;
> =C2=A0	enum drm_sched_priority		head_prio;
> @@ -363,13 +348,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dm=
a_fence *f);
> =C2=A0 * to schedule the job.
> =C2=A0 */
> =C2=A0struct drm_sched_job {
> -	/**
> -	 * @submit_ts:
> -	 *
> -	 * When the job was pushed into the entity queue.
> -	 */
> -	ktime_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 submit_ts;
> -
> =C2=A0	/**
> =C2=A0	 * @sched:
> =C2=A0	 *
> @@ -573,11 +551,7 @@ struct drm_sched_backend_ops {
> =C2=A0 * @credit_count: the current credit count of this scheduler
> =C2=A0 * @timeout: the time after which a job is removed from the schedul=
er.
> =C2=A0 * @name: name of the ring for which this scheduler is being used.
> - * @num_user_rqs: Number of run-queues. This is at most
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT, as there's usually one run-=
queue per
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 priority, but could be less.
> - * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FAIR p=
olicy.
> - * @sched_rq: An allocated array of run-queues of size @num_rqs;
> + * @rq: Scheduler run queue
> =C2=A0 * @job_scheduled: once drm_sched_entity_flush() is called the sche=
duler
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 waits on this wait queue until all the sc=
heduled jobs are
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 finished.
> @@ -609,9 +583,7 @@ struct drm_gpu_scheduler {
> =C2=A0	atomic_t			credit_count;
> =C2=A0	long				timeout;
> =C2=A0	const char			*name;
> -	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> -	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_user_rqs;
> -	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 **sched_rq;
> +	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *rq;
> =C2=A0	wait_queue_head_t		job_scheduled;
> =C2=A0	atomic64_t			job_id_count;
> =C2=A0	struct workqueue_struct		*submit_wq;

