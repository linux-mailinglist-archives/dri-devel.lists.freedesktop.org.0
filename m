Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D968AF9345
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B284610E025;
	Fri,  4 Jul 2025 12:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rLENB0TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6382410EA2D;
 Fri,  4 Jul 2025 12:56:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bYYYT0N6Wz9tRx;
 Fri,  4 Jul 2025 14:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751633805; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75Z15CnWZd3L9kj4/Zv3wqcuf+PCK2TBIk6DBeDw8Hg=;
 b=rLENB0TEg5PnDVTxm7BopruKOXJJ7mjj3AnihaKF9hlXosl6SrxwjTX+21fardfBa12L3T
 zpoSDgj9hbCi9D7pW6KlIiMcpvdIIaeimUk9YHv6/T3jroidaUk7xW1SqOMkjNLw8kiHk/
 CI8l43OO+lA+//KbXBCfQ4TO0UQ3bFyavbfUzydsk2I5+t8IYBQx0oz4f1cUX8EbT554da
 at74aOl1wSSC0PBbNdTIUsZo2OsCvyc6J5ZYOzACQE8FuypM7Tr3L1ihphC80XvNBD4OgL
 a3zktOSWEus8BSRCw4EJKx8FiptzAIW1FhSv3bSijH/BZxVE1A4Xs4eM/R0vzg==
Message-ID: <70a5fcd839c0582ed2216c8a61e128834bf81315.camel@mailbox.org>
Subject: Re: [PATCH v5 04/16] drm/sched: Avoid double re-lock on the job
 free path
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 04 Jul 2025 14:56:41 +0200
In-Reply-To: <3ab04122-72dc-41f4-95af-6c4bf851c6d0@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-5-tvrtko.ursulin@igalia.com>
 <3ab04122-72dc-41f4-95af-6c4bf851c6d0@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 490ddd0416b2a277c83
X-MBO-RS-META: 4rxan76ewaocugnyi99sjspb9a1wuh1q
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

On Fri, 2025-07-04 at 09:29 -0300, Ma=C3=ADra Canal wrote:
> Hi Tvrtko,
>=20
> On 23/06/25 09:27, Tvrtko Ursulin wrote:
> > Currently the job free work item will lock sched->job_list_lock
> > first time
> > to see if there are any jobs, free a single job, and then lock
> > again to
> > decide whether to re-queue itself if there are more finished jobs.
> >=20
> > Since drm_sched_get_finished_job() already looks at the second job
> > in the
> > queue we can simply add the signaled check and have it return the
> > presence
> > of more jobs to free to the caller. That way the work item does not
> > have
> > to lock the list again and repeat the signaled check.
> >=20
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 39 +++++++++++---------=
-
> > -----
> > =C2=A0 1 file changed, 16 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 1f077782ec12..c6c26aec07b6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0		queue_work(sched->submit_wq, &sched-
> > >work_free_job);
> > =C2=A0 }
> > =C2=A0=20
> > -/**
> > - * drm_sched_run_free_queue - enqueue free-job work if ready
> > - * @sched: scheduler instance
> > - */
> > -static void drm_sched_run_free_queue(struct drm_gpu_scheduler
> > *sched)
> > -{
> > -	struct drm_sched_job *job;
> > -
> > -	spin_lock(&sched->job_list_lock);
> > -	job =3D list_first_entry_or_null(&sched->pending_list,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job,
> > list);
> > -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > -		__drm_sched_run_free_queue(sched);
> > -	spin_unlock(&sched->job_list_lock);
> > -}
> > -
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_job_done - complete a job
> > =C2=A0=C2=A0 * @s_job: pointer to the job which is done
> > @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0 * drm_sched_get_finished_job - fetch the next finished job=
 to be
> > destroyed
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > + * @have_more: are there more finished jobs on the list
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Returns the next finished job from the pending list (if =
there
> > is one)
> > =C2=A0=C2=A0 * ready for it to be destroyed.
> > =C2=A0=C2=A0 */
> > =C2=A0 static struct drm_sched_job *
> > -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
> > *have_more)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_sched_job *job, *next;
> > =C2=A0=20
> > @@ -1115,22 +1100,27 @@ drm_sched_get_finished_job(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=20
> > =C2=A0=C2=A0	job =3D list_first_entry_or_null(&sched->pending_list,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_j=
ob,
> > list);
> > -
> > =C2=A0=C2=A0	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > {
> > =C2=A0=C2=A0		/* remove job from pending_list */
> > =C2=A0=C2=A0		list_del_init(&job->list);
> > =C2=A0=20
> > =C2=A0=C2=A0		/* cancel this job's TO timer */
> > =C2=A0=C2=A0		cancel_delayed_work(&sched->work_tdr);
> > -		/* make the scheduled timestamp more accurate */
> > +
> > +		*have_more =3D false;
> > =C2=A0=C2=A0		next =3D list_first_entry_or_null(&sched-
> > >pending_list,
> > =C2=A0=C2=A0						typeof(*next),
> > list);
> > -
> > =C2=A0=C2=A0		if (next) {
> > +			/* make the scheduled timestamp more
> > accurate */
> > =C2=A0=C2=A0			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> > >scheduled.flags))
> > =C2=A0=C2=A0				next->s_fence->scheduled.timestamp
> > =3D
> > =C2=A0=C2=A0					dma_fence_timestamp(&job-
> > >s_fence->finished);
> > +
> > +			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> > >finished.flags))
>=20
> Shouldn't we use dma_fence_is_signaled() to keep the same check that
> we
> have in drm_sched_run_free_queue()?

There is a paused-ongoing discussion about this function:

https://lore.kernel.org/all/20250522112540.161411-2-phasta@kernel.org/


dma_fence_is_signaled() can have side effects by actually signaling,
instead of just checking.

Not sure if Tvrtko wanted to bypass that behavior here, though.

P.

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> > +				*have_more =3D true;
> > +
> > =C2=A0=C2=A0			/* start TO timer for next job */
> > =C2=A0=C2=A0			drm_sched_start_timeout(sched);
> > =C2=A0=C2=A0		}
>=20
>=20

