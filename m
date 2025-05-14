Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B8AB6BB2
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 14:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0D710E27E;
	Wed, 14 May 2025 12:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cCdvo0q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94810E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:46:26 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZyCl31ZnGz9snt;
 Wed, 14 May 2025 14:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747226783; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvhuufjJWlflHAYdcYTrZqmE0a4wYRybOZgh/DnhpXw=;
 b=cCdvo0q3szdBfKR57fkxOysKRYgBEiPLHzVYvDYUzeTLlkLlOhHGwDtNParGTsPYmGx8VC
 ArR76tMWw1HhldwOJx6/lxx7CGoBxJLqEkoYEm7BxUFPuAR/Qh2Gf+MOXXbWVlNtVNPzI8
 4yafDxR3St2kFwKxa7Y7jgZmI7qEOqQ6ej6uHu4sT78qiN4SV7nyPBVaizRuO9w+r1dL9k
 fw4MIxnqzRnhTShf5foOcmKByWm5k/rARu6CBAczJVSPsq/jzh9/SuGRswt4BoOMDBNZ1Y
 oKNsm2tURWvkWdQicbSHb1ZTgtrdwQLw3xYVoquZYu6OmJyGzyBAQsj7+nGmdQ==
Message-ID: <48f98c31656ac131f228a4415a561e914d70c9de.camel@mailbox.org>
Subject: Re: [PATCH v9 05/10] drm/sched: trace dependencies for gpu jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 14 May 2025 14:46:18 +0200
In-Reply-To: <20250424083834.15518-6-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 016bf6d42cc38318115
X-MBO-RS-META: peagjocu9j1god3a7y83es46uibc7fob
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

nit: title: s/gpu/GPU

We also mostly start with an upper case letter after the :, but JFYI,
it's not a big deal.


P.

On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
> We can't trace dependencies from drm_sched_job_add_dependency
> because when it's called the job's fence is not available yet.
>=20
> So instead each dependency is traced individually when
> drm_sched_entity_push_job is used.
>=20
> Tracing the dependencies allows tools to analyze the dependencies
> between the jobs (previously it was only possible for fences
> traced by drm_sched_job_wait_dep).
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 23
> +++++++++++++++++++
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 8 +++++++
> =C2=A02 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 6f5bd05131aa..5d9992ad47d3 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -87,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->f=
ence_seqno)
> =C2=A0);
> =C2=A0
> +TRACE_EVENT(drm_sched_job_add_dep,
> +	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence
> *fence),
> +	TP_ARGS(sched_job, fence),
> +	TP_STRUCT__entry(
> +		=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, id)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, ctx)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, seqno)
> +		=C2=A0=C2=A0=C2=A0 ),
> +
> +	TP_fast_assign(
> +		=C2=A0=C2=A0=C2=A0 __entry->fence_context =3D sched_job->s_fence-
> >finished.context;
> +		=C2=A0=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job->s_fence-
> >finished.seqno;
> +		=C2=A0=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> +		=C2=A0=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> +		=C2=A0=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> +		=C2=A0=C2=A0=C2=A0 ),
> +	TP_printk("fence=3D%llu:%llu, id=3D%llu depends on
> fence=3D%llu:%llu",
> +		=C2=A0 __entry->fence_context, __entry->fence_seqno,
> __entry->id,
> +		=C2=A0 __entry->ctx, __entry->seqno)
> +);
> +
> =C2=A0TRACE_EVENT(drm_sched_job_wait_dep,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, struc=
t
> dma_fence *fence),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, fence),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index bd39db7bb240..be579e132711 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -587,6 +587,14 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0	ktime_t submit_ts;
> =C2=A0
> =C2=A0	trace_drm_sched_job(sched_job, entity);
> +
> +	if (trace_drm_sched_job_add_dep_enabled()) {
> +		struct dma_fence *entry;
> +		unsigned long index;
> +
> +		xa_for_each(&sched_job->dependencies, index, entry)
> +			trace_drm_sched_job_add_dep(sched_job,
> entry);
> +	}
> =C2=A0	atomic_inc(entity->rq->sched->score);
> =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> =C2=A0

