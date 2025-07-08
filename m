Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E8AFC97F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 13:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4D10E187;
	Tue,  8 Jul 2025 11:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iMNNQ0rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772F10E187;
 Tue,  8 Jul 2025 11:22:55 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bbzHJ3QQzz9sp9;
 Tue,  8 Jul 2025 13:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751973772; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LQerpdtP437WPR/q8QEMCi586qPbB+XoWSFFaJk/00=;
 b=iMNNQ0rNfxDgmbaVbR+sEeblL2JviizOhC0eFicb4q9/DGrHlP/hyIfuPUwgEWx9n7rK/l
 ACbxl3XiGQEAJQTlNFrTvLq6SNjtTaa+V8sk4bFKMUAKa63nMCnCaIlw64PxPAMJu1EPkw
 q1uhpeFcFntVOxDTB3nybT9DKSRI0+ydiOb+V1PxO3xxCG7JMW8851+SE1lwG6RfgsOFud
 x6uSATQwC5A6WcramhBjZJbGNgp/zdK4kETm91hqQlq4i/rbYMLKqc+Q0bViNSRlN/YuMa
 sCSItKrFleDjkMAvL+jElcZuO2w759rld+cWwTgWMF3bWORHiF2hRDbXUVcQww==
Message-ID: <1ac53305b99569707a828e8d972f23c40722dd56.camel@mailbox.org>
Subject: Re: [PATCH v6 03/15] drm/sched: Avoid double re-lock on the job
 free path
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Tue, 08 Jul 2025 13:22:48 +0200
In-Reply-To: <20250708095147.73366-4-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 4p3e7impgocm3nonzb1o6m4dqiyk44eq
X-MBO-RS-ID: 8e46c775d25981b9c44
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
> Currently the job free work item will lock sched->job_list_lock first
> time
> to see if there are any jobs, free a single job, and then lock again
> to
> decide whether to re-queue itself if there are more finished jobs.
>=20
> Since drm_sched_get_finished_job() already looks at the second job in
> the
> queue we can simply add the signaled check and have it return the
> presence
> of more jobs to free to the caller. That way the work item does not
> have
> to lock the list again and repeat the signaled check.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

This one can be sent separately, like the one for drm_sched_init()
recently, can't it?

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++-------------=
-
> --
> =C2=A01 file changed, 14 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 1f077782ec12..1bce0b66f89c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct
> drm_gpu_scheduler *sched)
> =C2=A0		queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> =C2=A0
> -/**
> - * drm_sched_run_free_queue - enqueue free-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler
> *sched)
> -{
> -	struct drm_sched_job *job;
> -
> -	spin_lock(&sched->job_list_lock);
> -	job =3D list_first_entry_or_null(&sched->pending_list,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job, list);
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> -		__drm_sched_run_free_queue(sched);
> -	spin_unlock(&sched->job_list_lock);
> -}
> -
> =C2=A0/**
> =C2=A0 * drm_sched_job_done - complete a job
> =C2=A0 * @s_job: pointer to the job which is done
> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct
> drm_gpu_scheduler *sched)
> =C2=A0 * drm_sched_get_finished_job - fetch the next finished job to be
> destroyed
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> + * @have_more: are there more finished jobs on the list
> =C2=A0 *
> =C2=A0 * Returns the next finished job from the pending list (if there is
> one)
> =C2=A0 * ready for it to be destroyed.
> =C2=A0 */
> =C2=A0static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
> *have_more)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job, *next;
> =C2=A0
> @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct
> drm_gpu_scheduler *sched)
> =C2=A0
> =C2=A0	job =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job, list=
);
> -
> =C2=A0	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> =C2=A0		/* remove job from pending_list */
> =C2=A0		list_del_init(&job->list);
> =C2=A0
> =C2=A0		/* cancel this job's TO timer */
> =C2=A0		cancel_delayed_work(&sched->work_tdr);
> -		/* make the scheduled timestamp more accurate */
> +
> +		*have_more =3D false;
> =C2=A0		next =3D list_first_entry_or_null(&sched-
> >pending_list,
> =C2=A0						typeof(*next),
> list);
> -
> =C2=A0		if (next) {
> +			/* make the scheduled timestamp more
> accurate */
> =C2=A0			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> >scheduled.flags))
> =C2=A0				next->s_fence->scheduled.timestamp =3D
> =C2=A0					dma_fence_timestamp(&job-
> >s_fence->finished);
> +
> +			*have_more =3D dma_fence_is_signaled(&next-
> >s_fence->finished);
> +
> =C2=A0			/* start TO timer for next job */
> =C2=A0			drm_sched_start_timeout(sched);
> =C2=A0		}
> @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct
> work_struct *w)
> =C2=A0	struct drm_gpu_scheduler *sched =3D
> =C2=A0		container_of(w, struct drm_gpu_scheduler,
> work_free_job);
> =C2=A0	struct drm_sched_job *job;
> +	bool have_more;
> =C2=A0
> -	job =3D drm_sched_get_finished_job(sched);
> -	if (job)
> +	job =3D drm_sched_get_finished_job(sched, &have_more);
> +	if (job) {
> =C2=A0		sched->ops->free_job(job);
> +		if (have_more)
> +			__drm_sched_run_free_queue(sched);
> +	}
> =C2=A0
> -	drm_sched_run_free_queue(sched);
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0

