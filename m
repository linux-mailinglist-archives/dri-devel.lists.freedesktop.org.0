Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA12AB37B6
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA7410E181;
	Mon, 12 May 2025 12:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q47bmBE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C9110E181;
 Mon, 12 May 2025 12:50:06 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zwzw705Bdz9sss;
 Mon, 12 May 2025 14:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747054199; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RucK/CUg7Z+XGAmZS46R/ajUuyzusOAdYiFs/Ok7uCk=;
 b=q47bmBE76SXgdFHB5F2/VBCE6kWNYRDxIRLen84vGzAiwZ2OJHh8zujTFpmsvRcz7xUXhZ
 5PHQqHaeL5ykn5tqxpF8u5CSbE8s6u5EfSkBJa7XycDe4TsXH5qB4D5OnXZHSvZN08fyLq
 KcYetILN+GafwNm6SIpmLO+/MjXycwTydFUH5/mu9dUAHx8u4IhJixlJC9cFM8aAFT/7/n
 16Bnr99P45+olTKRWSqC8UPRqDwpC7/CPU3nAuP+K7yqKHmQDPxi/JJcZGupt0HaW1CesM
 yvOfXQV5QMBaBIE+B0Xhew8umNbxXhL4r4okgXqIFQ9oKg4oq383ig4qzPLNBw==
Message-ID: <657c053d7cd443ff310dfff19d03ab11e0f17289.camel@mailbox.org>
Subject: Re: [RFC v4 04/16] drm/sched: Avoid double re-lock on the job free
 path
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 12 May 2025 14:49:55 +0200
In-Reply-To: <20250425102034.85133-5-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a51891704627a892095
X-MBO-RS-META: 7tnqyyomak5yfkowpqcj38ha19666u8n
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

Are you convinced that this is worth it?

I'm torn. It's rare that one returns a status through a boolean by
reference.


Independently from that, this is a candidate which certainly can be
branched out from this series, to make the series completely about the
new scheduling policy, not general other improvements.


P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++------------=
-
> --
> =C2=A01 file changed, 16 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 86e40157b09b..a45b02fd2af3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -365,22 +365,6 @@ static void __drm_sched_run_free_queue(struct
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
> @@ -1097,12 +1081,13 @@ drm_sched_select_entity(struct
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
> @@ -1110,22 +1095,27 @@ drm_sched_get_finished_job(struct
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
> +			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> >finished.flags))
> +				*have_more =3D true;
> +
> =C2=A0			/* start TO timer for next job */
> =C2=A0			drm_sched_start_timeout(sched);
> =C2=A0		}
> @@ -1184,12 +1174,15 @@ static void drm_sched_free_job_work(struct
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

