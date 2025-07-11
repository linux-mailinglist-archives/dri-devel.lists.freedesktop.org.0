Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91443B01CC9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29E810EA48;
	Fri, 11 Jul 2025 13:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OYSdm36w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448CE10EA48;
 Fri, 11 Jul 2025 13:04:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bdsNv251Fz9tJf;
 Fri, 11 Jul 2025 15:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752239055; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1khLG0p7if9vLy4hlYNfztqgtdRedWzjKpVV6sUA3hI=;
 b=OYSdm36w/ncP9pJfgHH+Kulmwluu+QKwiM4D5dHSLekSPEK6yx+Ax/ggZYQncFlU5P89qg
 ckbHf4bCkMOeXEzDGlOIgcLWHVMcqdeklnKaQTBxczdKfQ1XppgQXxOkmspYYUowOfR90l
 NgpNfHx4RW7N7w7F0njnZc/OiMNOi1BVTjN4hTnbLkW/vWxT151UKPXoZ624na1ZqsxPJ2
 VfagMXD7XqK3F4UjjpgQhTQoJKELboaFZdsOR2JOiB//9BmXeshqcWQaqqtHOMwKgWqFUI
 whcSTWV3R8uxGEKzj4yyOiPHOKswKHc24IurZWy5MzSP74l0NNEdIkEIfxSE2g==
Message-ID: <b06d4a88f0e4ba943972b1bc99ef8d6ef79a4ddb.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 11 Jul 2025 15:04:10 +0200
In-Reply-To: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
References: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 6adc1c01d9fffb0b9dd
X-MBO-RS-META: jjtz9ios7qwabfj5utio3s9mms95rmhu
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

Late to the party; had overlooked that the discussion with Matt is
resolved. Some comments below

On Tue, 2025-07-08 at 13:20 +0100, Tvrtko Ursulin wrote:
> Currently the job free work item will lock sched->job_list_lock first tim=
e
> to see if there are any jobs, free a single job, and then lock again to
> decide whether to re-queue itself if there are more finished jobs.
>=20
> Since drm_sched_get_finished_job() already looks at the second job in the
> queue we can simply add the signaled check and have it return the presenc=
e
> of more jobs to free to the caller. That way the work item does not

optional nit:
s/to free/to be freed

Reads a bit more cleanly.

> have
> to lock the list again and repeat the signaled check.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++-------------=
---
> =C2=A01 file changed, 14 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1f077782ec12..1bce0b66f89c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct drm_gp=
u_scheduler *sched)
> =C2=A0		queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> =C2=A0
> -/**
> - * drm_sched_run_free_queue - enqueue free-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)

The function name is now free. See my comment at the bottom.

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
> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler =
*sched)
> =C2=A0 * drm_sched_get_finished_job - fetch the next finished job to be d=
estroyed
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> + * @have_more: are there more finished jobs on the list

I'd like a very brief sentence below here like:

"Informs the caller through @have_more whether there are more finished
jobs besides the returned one."

Reason being that it's relatively rare in the kernel that status is not
transmitted through a return value, so we want that to be very obvious.

> =C2=A0 *
> =C2=A0 * Returns the next finished job from the pending list (if there is=
 one)
> =C2=A0 * ready for it to be destroyed.
> =C2=A0 */
> =C2=A0static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_m=
ore)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job, *next;
> =C2=A0
> @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct drm_gpu_schedul=
er *sched)
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

Don't we want that bool initialized to false at the very beginning of
the function? That way it can never be forgotten if the code gets
reworked.

> =C2=A0		next =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0						typeof(*next), list);
> -
> =C2=A0		if (next) {
> +			/* make the scheduled timestamp more accurate */
> =C2=A0			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence->scheduled.flags))
> =C2=A0				next->s_fence->scheduled.timestamp =3D
> =C2=A0					dma_fence_timestamp(&job->s_fence->finished);
> +
> +			*have_more =3D dma_fence_is_signaled(&next->s_fence->finished);
> +
> =C2=A0			/* start TO timer for next job */
> =C2=A0			drm_sched_start_timeout(sched);
> =C2=A0		}
> @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_s=
truct *w)
> =C2=A0	struct drm_gpu_scheduler *sched =3D
> =C2=A0		container_of(w, struct drm_gpu_scheduler, work_free_job);
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

Now that drm_sched_run_free_queue() is dead, it's an excellent
opportunity to give its name to __drm_sched_run_free_queue() \o/

Cleaner namespace, and reads better with the below
drm_sched_run_job_queue().


Besides, cool patch!

P.

> +	}
> =C2=A0
> -	drm_sched_run_free_queue(sched);
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0

