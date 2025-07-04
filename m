Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C65AF94D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7F310E00A;
	Fri,  4 Jul 2025 14:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vad2821O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E2410E00A;
 Fri,  4 Jul 2025 14:00:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bYZyR3Kqjz9tJv;
 Fri,  4 Jul 2025 15:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751637599; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaTbJOHKKjrhQN9x3hJlgL1oT92jBFCmmRhdGbWsgNM=;
 b=vad2821O6xFGFw+jmgGwZRLFZuU/KDAt6pfqLZDmz8a3SEmZC2mDdXt5E2hGVlcnTtxQCQ
 HPYS1J/1QlH88df+QPOP/m/9Golk+aaoJnlTdtryYKqCKzk7zLOePOqFGj2LV6clsposQU
 ornf/1MBNw0ivRynHZ6kax53ltd5996p8OgsGKj+R/JYaKBTbfpju2gwc2hJNyza+q/3xB
 JuI6XUryhQx96tId0hTeF1Jdo4bxBaNK4E6/cin/k4SzZVUZoFVSY1u31S1bnC4V1dCkSD
 fX8a/5PZgkGAk0y67Dyq3E+Lx/K6V1VMtdSS83RxIRwUBXmw2OQkNpSfbiFUtQ==
Message-ID: <a20cfbddc2632c5731d7c59f1766a79baa1f2821.camel@mailbox.org>
Subject: Re: [PATCH v5 04/16] drm/sched: Avoid double re-lock on the job
 free path
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>
Date: Fri, 04 Jul 2025 15:59:56 +0200
In-Reply-To: <1a1ef81e-2df4-4d9b-af06-25dfb9bc4192@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-5-tvrtko.ursulin@igalia.com>
 <3ab04122-72dc-41f4-95af-6c4bf851c6d0@igalia.com>
 <70a5fcd839c0582ed2216c8a61e128834bf81315.camel@mailbox.org>
 <1a1ef81e-2df4-4d9b-af06-25dfb9bc4192@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0cf13761a98a16d155d
X-MBO-RS-META: uyqrt6s3c1e65jtp9ioqdwp6echcui4t
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

On Fri, 2025-07-04 at 14:30 +0100, Tvrtko Ursulin wrote:
>=20
> On 04/07/2025 13:56, Philipp Stanner wrote:
> > On Fri, 2025-07-04 at 09:29 -0300, Ma=C3=ADra Canal wrote:
> > > Hi Tvrtko,
> > >=20
> > > On 23/06/25 09:27, Tvrtko Ursulin wrote:
> > > > Currently the job free work item will lock sched->job_list_lock
> > > > first time
> > > > to see if there are any jobs, free a single job, and then lock
> > > > again to
> > > > decide whether to re-queue itself if there are more finished
> > > > jobs.
> > > >=20
> > > > Since drm_sched_get_finished_job() already looks at the second
> > > > job
> > > > in the
> > > > queue we can simply add the signaled check and have it return
> > > > the
> > > > presence
> > > > of more jobs to free to the caller. That way the work item does
> > > > not
> > > > have
> > > > to lock the list again and repeat the signaled check.
> > > >=20
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 39 ++++++++++=
+-----
> > > > -----
> > > > -----
> > > > =C2=A0=C2=A0 1 file changed, 16 insertions(+), 23 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 1f077782ec12..c6c26aec07b6 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -366,22 +366,6 @@ static void
> > > > __drm_sched_run_free_queue(struct
> > > > drm_gpu_scheduler *sched)
> > > > =C2=A0=C2=A0=C2=A0		queue_work(sched->submit_wq, &sched-
> > > > > work_free_job);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > -/**
> > > > - * drm_sched_run_free_queue - enqueue free-job work if ready
> > > > - * @sched: scheduler instance
> > > > - */
> > > > -static void drm_sched_run_free_queue(struct drm_gpu_scheduler
> > > > *sched)
> > > > -{
> > > > -	struct drm_sched_job *job;
> > > > -
> > > > -	spin_lock(&sched->job_list_lock);
> > > > -	job =3D list_first_entry_or_null(&sched->pending_list,
> > > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job,
> > > > list);
> > > > -	if (job && dma_fence_is_signaled(&job->s_fence-
> > > > >finished))
> > > > -		__drm_sched_run_free_queue(sched);
> > > > -	spin_unlock(&sched->job_list_lock);
> > > > -}
> > > > -
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * drm_sched_job_done - complete a job
> > > > =C2=A0=C2=A0=C2=A0 * @s_job: pointer to the job which is done
> > > > @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct
> > > > drm_gpu_scheduler *sched)
> > > > =C2=A0=C2=A0=C2=A0 * drm_sched_get_finished_job - fetch the next fi=
nished job
> > > > to be
> > > > destroyed
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 * @sched: scheduler instance
> > > > + * @have_more: are there more finished jobs on the list
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > =C2=A0=C2=A0=C2=A0 * Returns the next finished job from the pending=
 list (if
> > > > there
> > > > is one)
> > > > =C2=A0=C2=A0=C2=A0 * ready for it to be destroyed.
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0 static struct drm_sched_job *
> > > > -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > > > +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched,
> > > > bool
> > > > *have_more)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0	struct drm_sched_job *job, *next;
> > > > =C2=A0=C2=A0=20
> > > > @@ -1115,22 +1100,27 @@ drm_sched_get_finished_job(struct
> > > > drm_gpu_scheduler *sched)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	job =3D list_first_entry_or_null(&sched->pending=
_list,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct d=
rm_sched_job,
> > > > list);
> > > > -
> > > > =C2=A0=C2=A0=C2=A0	if (job && dma_fence_is_signaled(&job->s_fence-
> > > > >finished))
> > > > {
> > > > =C2=A0=C2=A0=C2=A0		/* remove job from pending_list */
> > > > =C2=A0=C2=A0=C2=A0		list_del_init(&job->list);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0		/* cancel this job's TO timer */
> > > > =C2=A0=C2=A0=C2=A0		cancel_delayed_work(&sched->work_tdr);
> > > > -		/* make the scheduled timestamp more accurate
> > > > */
> > > > +
> > > > +		*have_more =3D false;
> > > > =C2=A0=C2=A0=C2=A0		next =3D list_first_entry_or_null(&sched-
> > > > > pending_list,
> > > > =C2=A0=C2=A0=C2=A0						typeof(*next),
> > > > list);
> > > > -
> > > > =C2=A0=C2=A0=C2=A0		if (next) {
> > > > +			/* make the scheduled timestamp more
> > > > accurate */
> > > > =C2=A0=C2=A0=C2=A0			if
> > > > (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > > > =C2=A0=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> > > > > scheduled.flags))
> > > > =C2=A0=C2=A0=C2=A0				next->s_fence-
> > > > >scheduled.timestamp
> > > > =3D
> > > > =C2=A0=C2=A0=C2=A0					dma_fence_timestamp(&j
> > > > ob-
> > > > > s_fence->finished);
> > > > +
> > > > +			if
> > > > (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> > > > > finished.flags))
> > >=20
> > > Shouldn't we use dma_fence_is_signaled() to keep the same check
> > > that
> > > we
> > > have in drm_sched_run_free_queue()?
> >=20
> > There is a paused-ongoing discussion about this function:
> >=20
> > https://lore.kernel.org/all/20250522112540.161411-2-phasta@kernel.org/
> >=20
> >=20
> > dma_fence_is_signaled() can have side effects by actually
> > signaling,
> > instead of just checking.
> >=20
> > Not sure if Tvrtko wanted to bypass that behavior here, though.
>=20
> No, no ulterior motives here. :)
>=20
> It is ages I wrote this, but now I revisited it, and AFAICT I don't
> see=20
> that it matters in this case.
>=20
> It is a scheduler fence which does not implement fence->ops-
> >signaled()=20
> so opportunistic signaling does not come into the picture.
>=20
> I am happy to change it to dma_fence_is_signaled() if that is the=20
> preference.

Its our (scheduler's) fence, so we can be sure dma_fence_is_signaled()
is OK.

I'd still prefer if we could get Christian to accept a function with a
superior name, though..

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > > +				*have_more =3D true;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0			/* start TO timer for next job */
> > > > =C2=A0=C2=A0=C2=A0			drm_sched_start_timeout(sched);
> > > > =C2=A0=C2=A0=C2=A0		}
> > >=20
> > >=20
> >=20
>=20

