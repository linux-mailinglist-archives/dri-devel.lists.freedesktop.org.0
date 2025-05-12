Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353AAB380D
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC1010E409;
	Mon, 12 May 2025 13:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Xru7Ls3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04F10E405;
 Mon, 12 May 2025 13:05:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zx0FX6k8pz9tkg;
 Mon, 12 May 2025 15:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747055105; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+h0c8ZAnvf7P6ue/S1wOcLTZru6nHcQphmQz5K8ypM=;
 b=Xru7Ls3SBTFwashiq4GPPA+Me8p+J42t7frYRKy0iwzioIjeLpz+WrWho5iInKc1OK6Ei3
 C9Umd8kTlz10ah/S3Q/gKM0LDhg3anztlijoHCWIJM7u43WmHqoSM+O+bA5s+dyKi34GQM
 EWYYJDKfFEpCdSbLN5frJIJJT9wetM4bdPuCmCWoef0ApCWufua0l2469JAWAnx6mVQcWJ
 O2Ax8cdFyKYb9+b82kotW62S+lv8rB2txxFXrxAWKsBfZF00E5z0atueULvhJ4PqlYCalk
 TSTVBpFM/QDnS0NTYrqMBnBYOeu5goRlnSuFbP6aXMW+q7H/jot3x+00bVuljg==
Message-ID: <6e65fa822fbbab3fa2381e8b6b5b2dbeffd4cbc5.camel@mailbox.org>
Subject: Re: [RFC v4 16/16] drm/sched: Embed run queue singleton into the
 scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 12 May 2025 15:05:02 +0200
In-Reply-To: <20250425102034.85133-17-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-17-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 61e4c63ba0306cd0077
X-MBO-RS-META: prgb9xutwzdyduuegj7hsrihys4zjedd
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

On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
> Now that the run queue to scheduler relationship is always 1:1 we can
> embed it (the run queue) directly in the scheduler struct and save on
> some allocation error handling code and such.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 ++--
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++--
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 +++-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0 |=C2=A0 8 +++=
+--
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |=C2=A0 8 +++---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 +++---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0 | 32 +++=
++++++----------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0 |=C2=A0 6 ++--
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 31 ++++---------------
> -
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 18 ++++++------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +---
> =C2=A012 files changed, 58 insertions(+), 77 deletions(-)

That's looking great :)

Looking forward to us moving there

P.

>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 82df06a72ee0..e18e180bf32c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1108,7 +1108,8 @@ static int amdgpu_cs_vm_handling(struct
> amdgpu_cs_parser *p)
> =C2=A0	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush)
> {
> =C2=A0		for (i =3D 0; i < p->gang_size; ++i) {
> =C2=A0			struct drm_sched_entity *entity =3D p-
> >entities[i];
> -			struct drm_gpu_scheduler *sched =3D entity-
> >rq->sched;
> +			struct drm_gpu_scheduler *sched =3D
> +				container_of(entity->rq,
> typeof(*sched), rq);
> =C2=A0			struct amdgpu_ring *ring =3D
> to_amdgpu_ring(sched);
> =C2=A0
> =C2=A0			if (amdgpu_vmid_uses_reserved(vm, ring-
> >vm_hub))
> @@ -1236,7 +1237,8 @@ static int amdgpu_cs_sync_rings(struct
> amdgpu_cs_parser *p)
> =C2=A0			return r;
> =C2=A0	}
> =C2=A0
> -	sched =3D p->gang_leader->base.entity->rq->sched;
> +	sched =3D container_of(p->gang_leader->base.entity->rq,
> typeof(*sched),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 rq);
> =C2=A0	while ((fence =3D amdgpu_sync_get_fence(&p->sync))) {
> =C2=A0		struct drm_sched_fence *s_fence =3D
> to_drm_sched_fence(fence);
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 9440af58073b..e3d4f7503738 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -359,7 +359,9 @@ static struct dma_fence *
> =C2=A0amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *s_entity)
> =C2=A0{
> -	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_entity->rq-
> >sched);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(s_entity->rq, typeof(*sched), rq);
> +	struct amdgpu_ring *ring =3D to_amdgpu_ring(sched);
> =C2=A0	struct amdgpu_job *job =3D to_amdgpu_job(sched_job);
> =C2=A0	struct dma_fence *fence;
> =C2=A0	int r;
> @@ -459,7 +461,7 @@ drm_sched_entity_queue_pop(struct
> drm_sched_entity *entity)
> =C2=A0
> =C2=A0void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler
> *sched)
> =C2=A0{
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0	struct drm_sched_entity *s_entity;
> =C2=A0	struct drm_sched_job *s_job;
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index ce6b9ba967ff..d6872baeba1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -85,7 +85,10 @@ struct amdgpu_job {
> =C2=A0
> =C2=A0static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job
> *job)
> =C2=A0{
> -	return to_amdgpu_ring(job->base.entity->rq->sched);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(job->base.entity->rq, typeof(*sched),
> rq);
> +
> +	return to_amdgpu_ring(sched);
> =C2=A0}
> =C2=A0
> =C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
> *vm,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 11dd2e0f7979..197d20a37afb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -145,6 +145,7 @@ TRACE_EVENT(amdgpu_cs,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_ib *ib),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(p, job, ib),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct drm_gpu_scheduler *,
> sched)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct amdgpu_bo_list *,
> bo_list)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, ring)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, dw)
> @@ -152,11 +153,14 @@ TRACE_EVENT(amdgpu_cs,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> +			=C2=A0=C2=A0 __entry->sched =3D container_of(job-
> >base.entity->rq,
> +						=09
> typeof(*__entry->sched),
> +							 rq);
> =C2=A0			=C2=A0=C2=A0 __entry->bo_list =3D p->bo_list;
> -			=C2=A0=C2=A0 __entry->ring =3D to_amdgpu_ring(job-
> >base.entity->rq->sched)->idx;
> +			=C2=A0=C2=A0 __entry->ring =3D to_amdgpu_ring(__entry-
> >sched)->idx;
> =C2=A0			=C2=A0=C2=A0 __entry->dw =3D ib->length_dw;
> =C2=A0			=C2=A0=C2=A0 __entry->fences =3D
> amdgpu_fence_count_emitted(
> -				to_amdgpu_ring(job->base.entity->rq-
> >sched));
> +				to_amdgpu_ring(__entry->sched));
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_printk("bo_list=3D%p, ring=3D%u, dw=3D%u, fe=
nces=3D%u",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo_list, __entry->ring, _=
_entry->dw,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 46d9fb433ab2..42f2bfb30af1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -105,13 +105,13 @@ static int amdgpu_vm_sdma_prepare(struct
> amdgpu_vm_update_params *p,
> =C2=A0static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
> =C2=A0				 struct dma_fence **fence)
> =C2=A0{
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(p->vm->delayed.rq, typeof(*sched), rq);
> +	struct amdgpu_ring *ring =3D
> +		container_of(sched, struct amdgpu_ring, sched);
> =C2=A0	struct amdgpu_ib *ib =3D p->job->ibs;
> -	struct amdgpu_ring *ring;
> =C2=A0	struct dma_fence *f;
> =C2=A0
> -	ring =3D container_of(p->vm->delayed.rq->sched, struct
> amdgpu_ring,
> -			=C2=A0=C2=A0=C2=A0 sched);
> -
> =C2=A0	WARN_ON(ib->length_dw =3D=3D 0);
> =C2=A0	amdgpu_ring_pad_ib(ring, ib);
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> index 23b6f7a4aa4a..ab132dae8183 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -420,15 +420,15 @@ int amdgpu_xcp_open_device(struct amdgpu_device
> *adev,
> =C2=A0void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
> =C2=A0				=C2=A0 struct amdgpu_ctx_entity *entity)
> =C2=A0{
> -	struct drm_gpu_scheduler *sched;
> -	struct amdgpu_ring *ring;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->entity.rq, typeof(*sched), rq);
> =C2=A0
> =C2=A0	if (!adev->xcp_mgr)
> =C2=A0		return;
> =C2=A0
> -	sched =3D entity->entity.rq->sched;
> =C2=A0	if (drm_sched_wqueue_ready(sched)) {
> -		ring =3D to_amdgpu_ring(entity->entity.rq->sched);
> +		struct amdgpu_ring *ring =3D to_amdgpu_ring(sched);
> +
> =C2=A0		atomic_dec(&adev->xcp_mgr->xcp[ring-
> >xcp_id].ref_cnt);
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index d149df2a2050..bc890f735552 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -104,19 +104,12 @@ int drm_sched_entity_init(struct
> drm_sched_entity *entity,
> =C2=A0	 * is initialized itself.
> =C2=A0	 */
> =C2=A0	entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
> +	if (num_sched_list) {
> +		entity->sched_list =3D num_sched_list > 1 ? sched_list
> : NULL;
> +		entity->rq =3D &sched_list[0]->rq;
> +	}
> =C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> =C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> -
> -	if (num_sched_list && !sched_list[0]->rq) {
> -		/* Since every entry covered by num_sched_list
> -		 * should be non-NULL and therefore we warn drivers
> -		 * not to do this and to fix their DRM calling
> order.
> -		 */
> -		pr_warn("%s: called with uninitialized scheduler\n",
> __func__);
> -	} else if (num_sched_list) {
> -		entity->rq =3D sched_list[0]->rq;
> -	}
> -
> =C2=A0	init_completion(&entity->entity_idle);
> =C2=A0
> =C2=A0	/* We start in an idle state. */
> @@ -303,7 +296,7 @@ long drm_sched_entity_flush(struct
> drm_sched_entity *entity, long timeout)
> =C2=A0	if (!entity->rq)
> =C2=A0		return 0;
> =C2=A0
> -	sched =3D entity->rq->sched;
> +	sched =3D container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	/**
> =C2=A0	 * The client will not queue more IBs during this fini,
> consume existing
> =C2=A0	 * queued IBs or discard them on SIGKILL
> @@ -395,9 +388,11 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D
> =C2=A0		container_of(cb, struct drm_sched_entity, cb);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0
> =C2=A0	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup(entity->rq->sched);
> +	drm_sched_wakeup(sched);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -423,7 +418,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0 */
> =C2=A0static bool drm_sched_entity_add_dependency_cb(struct
> drm_sched_entity *entity)
> =C2=A0{
> -	struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	struct dma_fence *fence =3D entity->dependency;
> =C2=A0	struct drm_sched_fence *s_fence;
> =C2=A0
> @@ -562,7 +558,7 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0
> =C2=A0	spin_lock(&entity->lock);
> =C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity-
> >num_sched_list);
> -	rq =3D sched ? sched->rq : NULL;
> +	rq =3D sched ? &sched->rq : NULL;
> =C2=A0	if (rq !=3D entity->rq) {
> =C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0		entity->rq =3D rq;
> @@ -585,10 +581,12 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D sched_job->entity;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	bool first;
> =C2=A0
> =C2=A0	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
> +	atomic_inc(sched->score);
> =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> =C2=A0
> =C2=A0	/*
> @@ -599,8 +597,6 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0	/* first job wakes up scheduler */
> =C2=A0	if (first) {
> -		struct drm_gpu_scheduler *sched;
> -
> =C2=A0		sched =3D drm_sched_rq_add_entity(entity);
> =C2=A0		if (sched)
> =C2=A0			drm_sched_wakeup(sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..bb48e690862d 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence
> *fence,
> =C2=A0{
> =C2=A0	unsigned seq;
> =C2=A0
> -	fence->sched =3D entity->rq->sched;
> +	fence->sched =3D container_of(entity->rq, typeof(*fence-
> >sched), rq);
> =C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> =C2=A0	dma_fence_init(&fence->scheduled,
> &drm_sched_fence_ops_scheduled,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_=
context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
> b/drivers/gpu/drm/scheduler/sched_internal.h
> index c1f523bc9379..df8684689962 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -17,11 +17,9 @@ struct drm_sched_entity_stats {
> =C2=A0
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> =C2=A0
> -void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq);
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched);
> =C2=A0struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0 struct drm_sched_rq *rq);
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched);
> =C2=A0struct drm_gpu_scheduler *
> =C2=A0drm_sched_rq_add_entity(struct drm_sched_entity *entity);
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 44222cfe4dc0..d2a2202dac3a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -572,7 +572,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> =C2=A0
> =C2=A0	BUG_ON(!entity);
> =C2=A0	drm_sched_entity_select_rq(entity);
> -	sched =3D entity->rq->sched;
> +	sched =3D container_of(entity->rq, typeof(*sched), rq);
> =C2=A0
> =C2=A0	job->sched =3D sched;
> =C2=A0	job->s_priority =3D entity->priority;
> @@ -914,7 +914,7 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0
> =C2=A0	while (!READ_ONCE(sched->pause_submit)) {
> =C2=A0		/* Find entity with a ready job */
> -		entity =3D drm_sched_rq_select_entity(sched, sched-
> >rq);
> +		entity =3D drm_sched_rq_select_entity(sched);
> =C2=A0		if (!entity)
> =C2=A0			break;	/* No more work */
> =C2=A0
> @@ -1006,15 +1006,6 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0
> -	if (sched->rq) {
> -		/* Not an error, but warn anyway so drivers can
> -		 * fine-tune their DRM calling order, and return all
> -		 * is good.
> -		 */
> -		dev_warn(sched->dev, "%s: scheduler already
> initialized!\n", __func__);
> -		return 0;
> -	}
> -
> =C2=A0	if (args->submit_wq) {
> =C2=A0		sched->submit_wq =3D args->submit_wq;
> =C2=A0		sched->own_submit_wq =3D false;
> @@ -1026,11 +1017,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0		sched->own_submit_wq =3D true;
> =C2=A0	}
> =C2=A0
> -	sched->rq =3D kmalloc(sizeof(*sched->rq), GFP_KERNEL |
> __GFP_ZERO);
> -	if (!sched->rq)
> -		goto Out_check_own;
> -
> -	drm_sched_rq_init(sched, sched->rq);
> +	drm_sched_rq_init(sched);
> =C2=A0
> =C2=A0	init_waitqueue_head(&sched->job_scheduled);
> =C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1045,12 +1032,6 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0
> =C2=A0	sched->ready =3D true;
> =C2=A0	return 0;
> -
> -Out_check_own:
> -	if (sched->own_submit_wq)
> -		destroy_workqueue(sched->submit_wq);
> -	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out
> of memory\n", __func__);
> -	return -ENOMEM;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_init);
> =C2=A0
> @@ -1078,7 +1059,7 @@ EXPORT_SYMBOL(drm_sched_init);
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0	struct drm_sched_entity *s_entity;
> =C2=A0
> =C2=A0	drm_sched_wqueue_stop(sched);
> @@ -1102,8 +1083,6 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0	if (sched->own_submit_wq)
> =C2=A0		destroy_workqueue(sched->submit_wq);
> =C2=A0	sched->ready =3D false;
> -	kfree(sched->rq);
> -	sched->rq =3D NULL;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_fini);
> =C2=A0
> @@ -1120,7 +1099,7 @@ void drm_sched_increase_karma(struct
> drm_sched_job *bad)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched =3D bad->sched;
> =C2=A0	struct drm_sched_entity *entity, *tmp;
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0
> =C2=A0	/* don't change @bad's karma if it's from KERNEL RQ,
> =C2=A0	 * because sometimes GPU hang would cause kernel jobs (like
> VM updating jobs)
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
> b/drivers/gpu/drm/scheduler/sched_rq.c
> index b18265c7f073..f2f10f7d6ddf 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -52,17 +52,16 @@ static void
> drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
> =C2=A0 * drm_sched_rq_init - initialize a given run queue struct
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance to associate with this run queue
> - * @rq: scheduler run queue
> =C2=A0 *
> =C2=A0 * Initializes a scheduler runqueue.
> =C2=A0 */
> -void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched)
> =C2=A0{
> +	struct drm_sched_rq *rq =3D &sched->rq;
> +
> =C2=A0	spin_lock_init(&rq->lock);
> =C2=A0	INIT_LIST_HEAD(&rq->entities);
> =C2=A0	rq->rb_tree_root =3D RB_ROOT_CACHED;
> -	rq->sched =3D sched;
> =C2=A0}
> =C2=A0
> =C2=A0static ktime_t
> @@ -109,8 +108,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity
> *entity)
> =C2=A0	}
> =C2=A0
> =C2=A0	rq =3D entity->rq;
> +	sched =3D container_of(rq, typeof(*sched), rq);
> =C2=A0	spin_lock(&rq->lock);
> -	sched =3D rq->sched;
> =C2=A0
> =C2=A0	if (list_empty(&entity->list)) {
> =C2=A0		atomic_inc(sched->score);
> @@ -138,6 +137,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity
> *entity)
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0				struct drm_sched_entity *entity)
> =C2=A0{
> +	struct drm_gpu_scheduler *sched =3D container_of(rq,
> typeof(*sched), rq);
> +
> =C2=A0	lockdep_assert_held(&entity->lock);
> =C2=A0
> =C2=A0	if (list_empty(&entity->list))
> @@ -145,7 +146,7 @@ void drm_sched_rq_remove_entity(struct
> drm_sched_rq *rq,
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> =C2=A0
> -	atomic_dec(rq->sched->score);
> +	atomic_dec(sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> =C2=A0	drm_sched_rq_remove_tree_locked(entity, rq);
> @@ -186,16 +187,15 @@ void drm_sched_rq_pop_entity(struct
> drm_sched_entity *entity)
> =C2=A0 * drm_sched_rq_select_entity - Select an entity which provides a
> job to run
> =C2=A0 *
> =C2=A0 * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> =C2=A0 *
> =C2=A0 * Find oldest waiting ready entity.
> =C2=A0 *
> =C2=A0 * Return an entity if one is found or NULL if no ready entity was
> found.
> =C2=A0 */
> =C2=A0struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched)
> =C2=A0{
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0	struct rb_node *rb;
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index e9ff24c076aa..fd488ccece9a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -242,7 +242,6 @@ struct drm_sched_entity {
> =C2=A0/**
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> - * @sched: the scheduler to which this rq belongs to.
> =C2=A0 * @lock: protects @entities, @rb_tree_root and @rr_deadline.
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priority queue of entities for
> FIFO scheduling
> @@ -252,8 +251,6 @@ struct drm_sched_entity {
> =C2=A0 * the next entity to emit commands from.
> =C2=A0 */
> =C2=A0struct drm_sched_rq {
> -	struct drm_gpu_scheduler	*sched;
> -
> =C2=A0	spinlock_t			lock;
> =C2=A0	/* Following members are protected by the @lock: */
> =C2=A0	ktime_t				rr_deadline;
> @@ -548,7 +545,7 @@ struct drm_gpu_scheduler {
> =C2=A0	atomic_t			credit_count;
> =C2=A0	long				timeout;
> =C2=A0	const char			*name;
> -	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *rq;
> +	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rq;
> =C2=A0	wait_queue_head_t		job_scheduled;
> =C2=A0	atomic64_t			job_id_count;
> =C2=A0	struct workqueue_struct		*submit_wq;

