Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B4B99B98
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 14:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4961F10E234;
	Wed, 24 Sep 2025 12:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="kfW68ZO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238DE10E234;
 Wed, 24 Sep 2025 12:01:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWwRm04QQz9sqW;
 Wed, 24 Sep 2025 14:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758715284; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlQM2vMZ9SMXH8A6Doy0TV1s4gLwxdLm+z2eVlHtECA=;
 b=kfW68ZO23+iK3cy8i7JKt8AB/mwsiTEbT64U5oicDdoBzDSw0ss5A8wyb5HxpncQ+lzi90
 DvFsWvZNSnWI89b9LcJUO0/P2NCCE16lZcGTO9vkro6rvOYl5SoxCU+aWXr5SXm8dRAVMP
 ytq8pto8daxHx40F/0B4NfX3CW0MoOqCmVlE6WqRGcB1+5eQygIO+x5gaWsIYD9Ig1gpie
 vagGudH69nIQ+fOez15P0LpnuL4B6Jy+MgRCwMpZOHJzvbnHnWZREtWaliMVSlZQNmF976
 MBx2JJB+uQVA0XrBrtC710n8jVf/m0ug6ntawwiOG3IQEULcERw8dHwl9fyfNw==
Message-ID: <f6ae3d77c6fd3ca91d22de9102d2babe9e80cbfa.camel@mailbox.org>
Subject: Re: [RFC v8 12/12] drm/sched: Embed run queue singleton into the
 scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Wed, 24 Sep 2025 14:01:19 +0200
In-Reply-To: <20250903101820.63032-13-tvrtko.ursulin@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-13-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: uhz87gyc3g3wn6bz83dsactjfhm6pt16
X-MBO-RS-ID: a350f59e8fab871f564
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
> Now that the run queue to scheduler relationship is always 1:1 we can
> embed it (the run queue) directly in the scheduler struct and save on
> some allocation error handling code and such.

Looks reasonable to me.

What I suggest is to do things like general improvements by renaming
variables (see my comments in the previous patch) in a separate
cleanup-patch following this one.

Few comments below

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
++++++------------
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0 |=C2=A0 6 ++--
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 31 ++++----------------
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 18 ++++++------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +--
> =C2=A012 files changed, 58 insertions(+), 76 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 2ac9729e4c86..467e09e5567b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1131,7 +1131,8 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_p=
arser *p)
> =C2=A0	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
> =C2=A0		for (i =3D 0; i < p->gang_size; ++i) {
> =C2=A0			struct drm_sched_entity *entity =3D p->entities[i];
> -			struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> +			struct drm_gpu_scheduler *sched =3D
> +				container_of(entity->rq, typeof(*sched), rq);
> =C2=A0			struct amdgpu_ring *ring =3D to_amdgpu_ring(sched);
> =C2=A0
> =C2=A0			if (amdgpu_vmid_uses_reserved(vm, ring->vm_hub))
> @@ -1262,7 +1263,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pa=
rser *p)
> =C2=A0			return r;
> =C2=A0	}

Now that I think of it, are you compiling this for all DRM drivers? Who
knows who might do similar things as amdgpu.

> =C2=A0
> -	sched =3D p->gang_leader->base.entity->rq->sched;
> +	sched =3D container_of(p->gang_leader->base.entity->rq, typeof(*sched),
> +			=C2=A0=C2=A0=C2=A0=C2=A0 rq);
> =C2=A0	while ((fence =3D amdgpu_sync_get_fence(&p->sync))) {
> =C2=A0		struct drm_sched_fence *s_fence =3D to_drm_sched_fence(fence);
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index bc07fd57310c..cdfaf3eb736d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -341,7 +341,9 @@ static struct dma_fence *
> =C2=A0amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *s_entity)
> =C2=A0{
> -	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_entity->rq->sched);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(s_entity->rq, typeof(*sched), rq);
> +	struct amdgpu_ring *ring =3D to_amdgpu_ring(sched);
> =C2=A0	struct amdgpu_job *job =3D to_amdgpu_job(sched_job);
> =C2=A0	struct dma_fence *fence;
> =C2=A0	int r;
> @@ -434,7 +436,7 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *e=
ntity)
> =C2=A0
> =C2=A0void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sc=
hed)
> =C2=A0{
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0	struct drm_sched_entity *s_entity;
> =C2=A0	struct drm_sched_job *s_job;
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.h
> index 4a6487eb6cb5..9530b5da3adc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -102,7 +102,10 @@ struct amdgpu_job {
> =C2=A0
> =C2=A0static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job=
 *job)
> =C2=A0{
> -	return to_amdgpu_ring(job->base.entity->rq->sched);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(job->base.entity->rq, typeof(*sched), rq);
> +
> +	return to_amdgpu_ring(sched);
> =C2=A0}
> =C2=A0
> =C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *=
vm,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_trace.h
> index d13e64a69e25..85724ec6aaf8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -145,6 +145,7 @@ TRACE_EVENT(amdgpu_cs,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_ib *ib),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(p, job, ib),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct drm_gpu_scheduler *, sched)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct amdgpu_bo_list *, bo_lis=
t)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, ring)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, dw)
> @@ -152,11 +153,14 @@ TRACE_EVENT(amdgpu_cs,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> +			=C2=A0=C2=A0 __entry->sched =3D container_of(job->base.entity->rq,
> +							 typeof(*__entry->sched),
> +							 rq);
> =C2=A0			=C2=A0=C2=A0 __entry->bo_list =3D p->bo_list;
> -			=C2=A0=C2=A0 __entry->ring =3D to_amdgpu_ring(job->base.entity->rq->s=
ched)->idx;
> +			=C2=A0=C2=A0 __entry->ring =3D to_amdgpu_ring(__entry->sched)->idx;
> =C2=A0			=C2=A0=C2=A0 __entry->dw =3D ib->length_dw;
> =C2=A0			=C2=A0=C2=A0 __entry->fences =3D amdgpu_fence_count_emitted(
> -				to_amdgpu_ring(job->base.entity->rq->sched));
> +				to_amdgpu_ring(__entry->sched));
> =C2=A0			=C2=A0=C2=A0 ),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_printk("bo_list=3D%p, ring=3D%u, dw=3D%u, fe=
nces=3D%u",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->bo_list, __entry->ring, _=
_entry->dw,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vm_sdma.c
> index 36805dcfa159..4ccd2e769799 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -106,13 +106,13 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_=
update_params *p,
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
> -	ring =3D container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
> -			=C2=A0=C2=A0=C2=A0 sched);
> -
> =C2=A0	WARN_ON(ib->length_dw =3D=3D 0);
> =C2=A0	amdgpu_ring_pad_ib(ring, ib);
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_xcp.c
> index 1083db8cea2e..be17635ac039 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -465,15 +465,15 @@ int amdgpu_xcp_open_device(struct amdgpu_device *ad=
ev,
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
> =C2=A0		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 6dd30b85925b..ba290143c95d 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -114,19 +114,12 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> =C2=A0	 * is initialized itself.
> =C2=A0	 */
> =C2=A0	entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
> +	if (num_sched_list) {
> +		entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
> +		entity->rq =3D &sched_list[0]->rq;
> +	}
> =C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> =C2=A0	RB_CLEAR_NODE(&entity->rb_tree_node);
> -
> -	if (num_sched_list && !sched_list[0]->rq) {
> -		/* Since every entry covered by num_sched_list
> -		 * should be non-NULL and therefore we warn drivers
> -		 * not to do this and to fix their DRM calling order.
> -		 */
> -		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> -	} else if (num_sched_list) {
> -		entity->rq =3D sched_list[0]->rq;
> -	}
> -
> =C2=A0	init_completion(&entity->entity_idle);
> =C2=A0
> =C2=A0	/* We start in an idle state. */
> @@ -312,7 +305,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *=
entity, long timeout)
> =C2=A0	if (!entity->rq)
> =C2=A0		return 0;
> =C2=A0
> -	sched =3D entity->rq->sched;
> +	sched =3D container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	/*
> =C2=A0	 * The client will not queue more jobs during this fini - consume
> =C2=A0	 * existing queued ones, or discard them on SIGKILL.
> @@ -393,10 +386,12 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D
> =C2=A0		container_of(cb, struct drm_sched_entity, cb);
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0
> =C2=A0	entity->dependency =3D NULL;
> =C2=A0	dma_fence_put(f);
> -	drm_sched_wakeup(entity->rq->sched);
> +	drm_sched_wakeup(sched);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -423,7 +418,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0static bool drm_sched_entity_add_dependency_cb(struct drm_sched_ent=
ity *entity,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job *sch=
ed_job)
> =C2=A0{
> -	struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	struct dma_fence *fence =3D entity->dependency;
> =C2=A0	struct drm_sched_fence *s_fence;
> =C2=A0
> @@ -557,7 +553,7 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
> =C2=A0
> =C2=A0	spin_lock(&entity->lock);
> =C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity->num_sche=
d_list);
> -	rq =3D sched ? sched->rq : NULL;
> +	rq =3D sched ? &sched->rq : NULL;
> =C2=A0	if (rq !=3D entity->rq) {
> =C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0		entity->rq =3D rq;
> @@ -580,6 +576,8 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D sched_job->entity;
> +	struct drm_gpu_scheduler *sched =3D
> +		container_of(entity->rq, typeof(*sched), rq);
> =C2=A0	bool first;
> =C2=A0
> =C2=A0	trace_drm_sched_job_queue(sched_job, entity);
> @@ -591,7 +589,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *=
sched_job)
> =C2=A0		xa_for_each(&sched_job->dependencies, index, entry)
> =C2=A0			trace_drm_sched_job_add_dep(sched_job, entry);
> =C2=A0	}
> -	atomic_inc(entity->rq->sched->score);
> +	atomic_inc(sched->score);
> =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> =C2=A0
> =C2=A0	/*
> @@ -602,8 +600,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *=
sched_job)
> =C2=A0
> =C2=A0	/* first job wakes up scheduler */
> =C2=A0	if (first) {
> -		struct drm_gpu_scheduler *sched;
> -
> =C2=A0		sched =3D drm_sched_rq_add_entity(entity);
> =C2=A0		if (sched)
> =C2=A0			drm_sched_wakeup(sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/sc=
heduler/sched_fence.c
> index 9391d6f0dc01..da4f53a9ca35 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -227,7 +227,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fen=
ce,
> =C2=A0{
> =C2=A0	unsigned seq;
> =C2=A0
> -	fence->sched =3D entity->rq->sched;
> +	fence->sched =3D container_of(entity->rq, typeof(*fence->sched), rq);
> =C2=A0	seq =3D atomic_inc_return(&entity->fence_seq);
> =C2=A0	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->lock, entity->fence_=
context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index 6e5ed721bb5b..409c9ab7ce8f 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -26,11 +26,9 @@ bool drm_sched_can_queue(struct drm_gpu_scheduler *sch=
ed,
> =C2=A0			 struct drm_sched_entity *entity);
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
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index a9079bdb27d3..fe773154cdd4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -645,7 +645,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> =C2=A0
> =C2=A0	BUG_ON(!entity);
> =C2=A0	drm_sched_entity_select_rq(entity);
> -	sched =3D entity->rq->sched;
> +	sched =3D container_of(entity->rq, typeof(*sched), rq);
> =C2=A0
> =C2=A0	job->sched =3D sched;
> =C2=A0	job->s_priority =3D entity->priority;
> @@ -986,7 +986,7 @@ static void drm_sched_run_job_work(struct work_struct=
 *w)
> =C2=A0	int r;
> =C2=A0
> =C2=A0	/* Find entity with a ready job */
> -	entity =3D drm_sched_rq_select_entity(sched, sched->rq);
> +	entity =3D drm_sched_rq_select_entity(sched);
> =C2=A0	if (IS_ERR_OR_NULL(entity))
> =C2=A0		return;	/* No more work */
> =C2=A0
> @@ -1067,15 +1067,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched=
, const struct drm_sched_init_
> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0
> -	if (sched->rq) {
> -		/* Not an error, but warn anyway so drivers can
> -		 * fine-tune their DRM calling order, and return all
> -		 * is good.
> -		 */
> -		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__)=
;
> -		return 0;
> -	}
> -
> =C2=A0	if (args->submit_wq) {
> =C2=A0		sched->submit_wq =3D args->submit_wq;
> =C2=A0		sched->own_submit_wq =3D false;
> @@ -1087,11 +1078,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched=
, const struct drm_sched_init_
> =C2=A0		sched->own_submit_wq =3D true;
> =C2=A0	}
> =C2=A0
> -	sched->rq =3D kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
> -	if (!sched->rq)
> -		goto Out_check_own;
> -
> -	drm_sched_rq_init(sched, sched->rq);
> +	drm_sched_rq_init(sched);
> =C2=A0
> =C2=A0	init_waitqueue_head(&sched->job_scheduled);
> =C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1106,12 +1093,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched=
, const struct drm_sched_init_
> =C2=A0
> =C2=A0	sched->ready =3D true;
> =C2=A0	return 0;
> -
> -Out_check_own:
> -	if (sched->own_submit_wq)
> -		destroy_workqueue(sched->submit_wq);
> -	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n=
", __func__);
> -	return -ENOMEM;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_init);
> =C2=A0
> @@ -1143,7 +1124,7 @@ static void drm_sched_cancel_remaining_jobs(struct =
drm_gpu_scheduler *sched)
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0	struct drm_sched_entity *s_entity;
> =C2=A0
> =C2=A0	drm_sched_wqueue_stop(sched);
> @@ -1185,8 +1166,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched=
)
> =C2=A0	if (sched->own_submit_wq)
> =C2=A0		destroy_workqueue(sched->submit_wq);
> =C2=A0	sched->ready =3D false;
> -	kfree(sched->rq);
> -	sched->rq =3D NULL;
> =C2=A0
> =C2=A0	if (!list_empty(&sched->pending_list))
> =C2=A0		dev_warn(sched->dev, "Tearing down scheduler while jobs are pendi=
ng!\n");
> @@ -1206,7 +1185,7 @@ void drm_sched_increase_karma(struct drm_sched_job =
*bad)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched =3D bad->sched;
> =C2=A0	struct drm_sched_entity *entity, *tmp;
> -	struct drm_sched_rq *rq =3D sched->rq;
> +	struct drm_sched_rq *rq =3D &sched->rq;
> =C2=A0
> =C2=A0	/* don't change @bad's karma if it's from KERNEL RQ,
> =C2=A0	 * because sometimes GPU hang would cause kernel jobs (like VM upd=
ating jobs)
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index a9bc105221bf..6088434a4ea4 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -72,17 +72,16 @@ static void drm_sched_rq_update_tree_locked(struct dr=
m_sched_entity *entity,
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
> =C2=A0	rq->head_prio =3D -1;
> =C2=A0}
> =C2=A0
> @@ -229,8 +228,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *enti=
ty)
> =C2=A0	}
> =C2=A0
> =C2=A0	rq =3D entity->rq;
> +	sched =3D container_of(rq, typeof(*sched), rq);
> =C2=A0	spin_lock(&rq->lock);
> -	sched =3D rq->sched;
> =C2=A0
> =C2=A0	if (list_empty(&entity->list)) {
> =C2=A0		atomic_inc(sched->score);
> @@ -258,6 +257,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *enti=
ty)
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> =C2=A0				struct drm_sched_entity *entity)
> =C2=A0{
> +	struct drm_gpu_scheduler *sched =3D container_of(rq, typeof(*sched), rq=
);
> +
> =C2=A0	lockdep_assert_held(&entity->lock);
> =C2=A0
> =C2=A0	if (list_empty(&entity->list))
> @@ -265,7 +266,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *=
rq,
> =C2=A0
> =C2=A0	spin_lock(&rq->lock);
> =C2=A0
> -	atomic_dec(rq->sched->score);
> +	atomic_dec(sched->score);
> =C2=A0	list_del_init(&entity->list);
> =C2=A0
> =C2=A0	drm_sched_rq_remove_tree_locked(entity, rq);
> @@ -313,7 +314,6 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity =
*entity)
> =C2=A0 * drm_sched_rq_select_entity - Select an entity which provides a j=
ob to run
> =C2=A0 *
> =C2=A0 * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> =C2=A0 *
> =C2=A0 * Find oldest waiting ready entity.
> =C2=A0 *
> @@ -322,9 +322,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity =
*entity)
> =C2=A0 * its job; return NULL, if no ready entity was found.
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
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index c9b75a05d05c..7fbcd121a6d3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -256,8 +256,6 @@ struct drm_sched_entity {
> =C2=A0 * the next entity to emit commands from.
> =C2=A0 */
> =C2=A0struct drm_sched_rq {
> -	struct drm_gpu_scheduler	*sched;
> -

Docu needs to be updated


--

So much from my side for now. I guess we'll be discussing a bit on the
other threads and on XDC. But overall, this is a very nice series that
improves things greatly, and from my POV we can transition to a v1;
maybe after brainstorming with the other guys next week a bit.


Regards,
P.

> =C2=A0	spinlock_t			lock;
> =C2=A0	/* Following members are protected by the @lock: */
> =C2=A0	struct list_head		entities;
> @@ -581,7 +579,7 @@ struct drm_gpu_scheduler {
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

