Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E2AC0F27
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858F810E193;
	Thu, 22 May 2025 14:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IWvWyL2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CDC10E193;
 Thu, 22 May 2025 14:59:43 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b3BK81Wh9z9sm6;
 Thu, 22 May 2025 16:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747925980; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9hIgVgAiYv5vVjOkhA8xQvDe3ANpNjv4wOvq4t4WLpw=;
 b=IWvWyL2eylEhzKYLqRvx37xxF0K39+Y1KjagxvStpljHNSnVQw6Y2oWfQVruXmiEWzIliH
 JT8yK42yp2jwPCe6k0H4BlAWkwdserfNxKdrST09RjotvtB5PhZkWuO1AfqdirdVntY7C4
 ze2aLUcCpyo5xJbdayKHTqq2ZGS9s1rwu9UQZ71D+X6UnlBA5AJCei1Hk5Txrd4he6QpmD
 DZrJu9cuNE4LUL0DG0Ijo0fZG+3iKp2rH/CEwU2M7a1jfpMZHMuK0mhyP0iuWKG3Hyv9gj
 LeLMjVODuVDg2w/tyQbwwbJZ/0O0ZhSn1NY2W8Ac7fy0aVyrkzgJFJrrqW/bdw==
Message-ID: <a637755cb96de8415b51feb1ae61b8c651e94295.camel@mailbox.org>
Subject: Re: [PATCH v3 2/5] drm/sched/tests: Port tests to new cleanup method
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 22 May 2025 16:59:35 +0200
In-Reply-To: <b24d5c5e-8a9e-4dfb-886b-b3ad70e62e76@igalia.com>
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-4-phasta@kernel.org>
 <b24d5c5e-8a9e-4dfb-886b-b3ad70e62e76@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b9071dfc324416f6776
X-MBO-RS-META: jpe4deru47jan9sex4qyichcktzu8sqo
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

On Thu, 2025-05-22 at 15:06 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/05/2025 09:27, Philipp Stanner wrote:
> > The drm_gpu_scheduler now supports a callback to help
> > drm_sched_fini()
> > avoid memory leaks. This callback instructs the driver to signal
> > all
> > pending hardware fences.
> >=20
> > Implement the new callback
> > drm_sched_backend_ops.cancel_pending_fences().
> >=20
> > Have the callback use drm_mock_sched_job_complete() with a new
> > error
> > field for the fence error.
> >=20
> > Keep the job status as DRM_MOCK_SCHED_JOB_DONE for now, since there
> > is
> > no party for which checking for a CANCELED status would be useful
> > currently.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 .../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 67 +++++++-=
------
> > -----
> > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 4 +-
> > =C2=A0 2 files changed, 25 insertions(+), 46 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > index f999c8859cf7..eca47f0395bc 100644
> > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > @@ -55,7 +55,7 @@ void drm_mock_sched_entity_free(struct
> > drm_mock_sched_entity *entity)
> > =C2=A0=C2=A0	drm_sched_entity_destroy(&entity->base);
> > =C2=A0 }
> > =C2=A0=20
> > -static void drm_mock_sched_job_complete(struct drm_mock_sched_job
> > *job)
> > +static void drm_mock_sched_job_complete(struct drm_mock_sched_job
> > *job, int err)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_mock_scheduler *sched =3D
> > =C2=A0=C2=A0		drm_sched_to_mock_sched(job->base.sched);
> > @@ -63,7 +63,9 @@ static void drm_mock_sched_job_complete(struct
> > drm_mock_sched_job *job)
> > =C2=A0=C2=A0	lockdep_assert_held(&sched->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> > -	list_move_tail(&job->link, &sched->done_list);
> > +	list_del(&job->link);
> > +	if (err)
> > +		dma_fence_set_error(&job->hw_fence, err);
> > =C2=A0=C2=A0	dma_fence_signal(&job->hw_fence);
> > =C2=A0=C2=A0	complete(&job->done);
> > =C2=A0 }
> > @@ -89,7 +91,7 @@ drm_mock_sched_job_signal_timer(struct hrtimer
> > *hrtimer)
> > =C2=A0=C2=A0			break;
> > =C2=A0=20
> > =C2=A0=C2=A0		sched->hw_timeline.cur_seqno =3D job-
> > >hw_fence.seqno;
> > -		drm_mock_sched_job_complete(job);
> > +		drm_mock_sched_job_complete(job, 0);
> > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0	spin_unlock_irqrestore(&sched->lock, flags);
> > =C2=A0=20
> > @@ -212,26 +214,33 @@ mock_sched_timedout_job(struct drm_sched_job
> > *sched_job)
> > =C2=A0=20
> > =C2=A0 static void mock_sched_free_job(struct drm_sched_job *sched_job)
> > =C2=A0 {
> > -	struct drm_mock_scheduler *sched =3D
> > -			drm_sched_to_mock_sched(sched_job->sched);
> > =C2=A0=C2=A0	struct drm_mock_sched_job *job =3D
> > drm_sched_job_to_mock_job(sched_job);
> > -	unsigned long flags;
> > =C2=A0=20
> > -	/* Remove from the scheduler done list. */
> > -	spin_lock_irqsave(&sched->lock, flags);
> > -	list_del(&job->link);
> > -	spin_unlock_irqrestore(&sched->lock, flags);
> > =C2=A0=C2=A0	dma_fence_put(&job->hw_fence);
> > -
> > =C2=A0=C2=A0	drm_sched_job_cleanup(sched_job);
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Mock job itself is freed by the kunit framework. */
> > =C2=A0 }
> > =C2=A0=20
> > +static void mock_sched_cancel_pending_fences(struct
> > drm_gpu_scheduler *gsched)
>=20
> "gsched" feels like a first time invention. Maybe drm_sched?

Alright

>=20
> > +{
> > +	struct drm_mock_sched_job *job, *next;
> > +	struct drm_mock_scheduler *sched;
> > +	unsigned long flags;
> > +
> > +	sched =3D container_of(gsched, struct drm_mock_scheduler,
> > base);
> > +
> > +	spin_lock_irqsave(&sched->lock, flags);
> > +	list_for_each_entry_safe(job, next, &sched->job_list,
> > link)
> > +		drm_mock_sched_job_complete(job, -ECANCELED);
> > +	spin_unlock_irqrestore(&sched->lock, flags);
>=20
> Canceling of the timers belongs in this call back I think. Otherwise=20
> jobs are not fully cancelled.

I wouldn't say so =E2=80=93 the timers represent things like the hardware
interrupts. And those must be deactivated by the driver itself.

See, one big reason why I like my approach is that the contract between
driver and scheduler is made very simple:

"Driver, signal all fences that you ever returned through run_job() to
this scheduler!"

That always works, and the driver always has all those fences. It's
based on the most fundamental agreement regarding dma_fences: they must
all be signaled.

>=20
> Hm, I also think, conceptually, the order of first canceling the
> timer=20
> and then signaling the fence should be kept.

That's the case here, no?

It must indeed be kept, otherwise the timers could fire after
everything is torn down -> UAF

>=20
> At the moment it does not matter hugely, since the timer does not
> signal=20
> the jobs directly and will not find unlinked jobs, but if that
> changes=20
> in the future, the reversed order could cause double signaling. So if
> you keep it in the correct logical order that potential gotcha is=20
> avoided. Basically just keep the two pass approach verbatim, as is in
> the current drm_mock_sched_fini.
>=20
> The rest of the conversion is I think good.

:)

>=20
> Only a slight uncertainty after I cross-referenced with my version=20
> (->cancel_job()) around why I needed to add signaling to=20
> mock_sched_timedout_job() and manual job cleanup to the timeout test.
> It=20
> was more than a month ago that I wrote it so can't remember right
> now.=20
> You checked for memory leaks and the usual stuff?

Hm, it seems I indeed ran into that leak that you fixed (in addition to
the other stuff) in your RFC, for the timeout tests.

We should fix that in a separate patch, probably.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > +}
> > +
> > =C2=A0 static const struct drm_sched_backend_ops drm_mock_scheduler_ops
> > =3D {
> > =C2=A0=C2=A0	.run_job =3D mock_sched_run_job,
> > =C2=A0=C2=A0	.timedout_job =3D mock_sched_timedout_job,
> > -	.free_job =3D mock_sched_free_job
> > +	.free_job =3D mock_sched_free_job,
> > +	.cancel_pending_fences =3D mock_sched_cancel_pending_fences,
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -265,7 +274,6 @@ struct drm_mock_scheduler
> > *drm_mock_sched_new(struct kunit *test, long timeout)
> > =C2=A0=C2=A0	sched->hw_timeline.context =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0	atomic_set(&sched->hw_timeline.next_seqno, 0);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&sched->job_list);
> > -	INIT_LIST_HEAD(&sched->done_list);
> > =C2=A0=C2=A0	spin_lock_init(&sched->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	return sched;
> > @@ -280,38 +288,11 @@ struct drm_mock_scheduler
> > *drm_mock_sched_new(struct kunit *test, long timeout)
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
> > =C2=A0 {
> > -	struct drm_mock_sched_job *job, *next;
> > -	unsigned long flags;
> > -	LIST_HEAD(list);
> > +	struct drm_mock_sched_job *job;
> > =C2=A0=20
> > -	drm_sched_wqueue_stop(&sched->base);
> > -
> > -	/* Force complete all unfinished jobs. */
> > -	spin_lock_irqsave(&sched->lock, flags);
> > -	list_for_each_entry_safe(job, next, &sched->job_list,
> > link)
> > -		list_move_tail(&job->link, &list);
> > -	spin_unlock_irqrestore(&sched->lock, flags);
> > -
> > -	list_for_each_entry(job, &list, link)
> > +	list_for_each_entry(job, &sched->job_list, link)
> > =C2=A0=C2=A0		hrtimer_cancel(&job->timer);
> > =C2=A0=20
> > -	spin_lock_irqsave(&sched->lock, flags);
> > -	list_for_each_entry_safe(job, next, &list, link)
> > -		drm_mock_sched_job_complete(job);
> > -	spin_unlock_irqrestore(&sched->lock, flags);
> > -
> > -	/*
> > -	 * Free completed jobs and jobs not yet processed by the
> > DRM scheduler
> > -	 * free worker.
> > -	 */
> > -	spin_lock_irqsave(&sched->lock, flags);
> > -	list_for_each_entry_safe(job, next, &sched->done_list,
> > link)
> > -		list_move_tail(&job->link, &list);
> > -	spin_unlock_irqrestore(&sched->lock, flags);
> > -
> > -	list_for_each_entry_safe(job, next, &list, link)
> > -		mock_sched_free_job(&job->base);
> > -
> > =C2=A0=C2=A0	drm_sched_fini(&sched->base);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -346,7 +327,7 @@ unsigned int drm_mock_sched_advance(struct
> > drm_mock_scheduler *sched,
> > =C2=A0=C2=A0		if (sched->hw_timeline.cur_seqno < job-
> > >hw_fence.seqno)
> > =C2=A0=C2=A0			break;
> > =C2=A0=20
> > -		drm_mock_sched_job_complete(job);
> > +		drm_mock_sched_job_complete(job, 0);
> > =C2=A0=C2=A0		found++;
> > =C2=A0=C2=A0	}
> > =C2=A0 unlock:
> > diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > index 27caf8285fb7..22e530d87791 100644
> > --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > @@ -32,9 +32,8 @@
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @base: DRM scheduler base class
> > =C2=A0=C2=A0 * @test: Backpointer to owning the kunit test case
> > - * @lock: Lock to protect the simulated @hw_timeline, @job_list
> > and @done_list
> > + * @lock: Lock to protect the simulated @hw_timeline and @job_list
> > =C2=A0=C2=A0 * @job_list: List of jobs submitted to the mock GPU
> > - * @done_list: List of jobs completed by the mock GPU
> > =C2=A0=C2=A0 * @hw_timeline: Simulated hardware timeline has a @context=
,
> > @next_seqno and
> > =C2=A0=C2=A0 *		 @cur_seqno for implementing a struct dma_fence
> > signaling the
> > =C2=A0=C2=A0 *		 simulated job completion.
> > @@ -49,7 +48,6 @@ struct drm_mock_scheduler {
> > =C2=A0=20
> > =C2=A0=C2=A0	spinlock_t		lock;
> > =C2=A0=C2=A0	struct list_head	job_list;
> > -	struct list_head	done_list;
> > =C2=A0=20
> > =C2=A0=C2=A0	struct {
> > =C2=A0=C2=A0		u64		context;
>=20

