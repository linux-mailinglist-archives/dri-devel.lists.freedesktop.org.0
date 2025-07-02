Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C7AF12B5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1310E6D0;
	Wed,  2 Jul 2025 10:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OsNT/XBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9E510E6D0;
 Wed,  2 Jul 2025 10:56:13 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bXGzF6Z2Jz9tWy;
 Wed,  2 Jul 2025 12:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751453770; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gz27GezlXTQrMHknTZCeUyKPAgt7TIG1apN6pbXeoEg=;
 b=OsNT/XBHhbijr30fIjuYUL8+evGiEi5+pQoimRPC7ALZF3+BSa5EXP3VOnrTscreAraEGZ
 jLiUJp/sHXf2MIoVpTGnle7sLGP/11Ig3qlbTCjUyehgxpiPf0ekRaNVC+R/TlV5CDkGpu
 u/fpHsxT216iDobSqcvAz2Zp2j2zvWdJHh0FI346o4V/KQ4x2g5g6+nKR6DpQ3XGtT5UX+
 QfrRN2W37ZwUMznzLyVsjG2b2PuSoOrSDz60hmO/ET5oN8T+i8AtXSlYNMxTlGc7PyDqUt
 kn+OOf2SVW0lq0QTY3wRa23pux+BRe6/aeACXCf7vyagdB0oet954QwL/2xhVw==
Message-ID: <6762d33b4fe8e7b264a7403f228e6ec6723ae623.camel@mailbox.org>
Subject: Re: [PATCH 2/6] drm/sched/tests: Port to cancel_job()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Date: Wed, 02 Jul 2025 12:56:03 +0200
In-Reply-To: <f9b55d5b-0018-4850-a9b7-2f267467e957@igalia.com>
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-5-phasta@kernel.org>
 <f9b55d5b-0018-4850-a9b7-2f267467e957@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 3wp6oc1wto6y4c8s6acowbuo57rutw3p
X-MBO-RS-ID: 30b1c1d7b94b1f12f12
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

On Wed, 2025-07-02 at 11:36 +0100, Tvrtko Ursulin wrote:
>=20
> On 01/07/2025 14:21, Philipp Stanner wrote:
> > The GPU Scheduler now supports a new callback, cancel_job(), which
> > lets
> > the scheduler cancel all jobs which might not yet be freed when
> > drm_sched_fini() runs. Using this callback allows for significantly
> > simplifying the mock scheduler teardown code.
> >=20
> > Implement the cancel_job() callback and adjust the code where
> > necessary.
>=20
> Cross referencing against my version I think you missed this hunk:
>=20
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
>=20
> =C2=A0=C2=A0	spinlock_t		lock;
> =C2=A0=C2=A0	struct list_head	job_list;
> -	struct list_head	done_list;
>=20
> =C2=A0=C2=A0	struct {
> =C2=A0=C2=A0		u64		context;
>=20

Right, overlooked that one.

>=20
> I also had this:
>=20
> @@ -97,7 +96,8 @@ struct drm_mock_sched_job {
> =C2=A0=C2=A0	struct completion	done;
>=20
> =C2=A0 #define DRM_MOCK_SCHED_JOB_DONE		0x1
> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> +#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4
>=20
> And was setting it in the callback. And since we should add a test to
> explicitly cover the new callback, and just the callback, that could=20
> make it very easy to do it.

What do you imagine that to look like? The scheduler only invokes the
callback on tear down.

We also don't have tests that only test free_job() and the like, do
we?=C2=A0

You cannot test a callback for the scheduler, because the callback is
implemented in the driver.

Callbacks are tested by using the scheduler. In this case, it's tested
the intended way by the unit tests invoking drm_sched_free().


P.


>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 .../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 66 +++++++-=
------
> > -----
> > =C2=A0 1 file changed, 23 insertions(+), 43 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > index 49d067fecd67..2d3169d95200 100644
> > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > @@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct
> > drm_mock_sched_job *job)
> > =C2=A0=C2=A0	lockdep_assert_held(&sched->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> > -	list_move_tail(&job->link, &sched->done_list);
> > +	list_del(&job->link);
> > =C2=A0=C2=A0	dma_fence_signal_locked(&job->hw_fence);
> > =C2=A0=C2=A0	complete(&job->done);
> > =C2=A0 }
> > @@ -236,26 +236,39 @@ mock_sched_timedout_job(struct drm_sched_job
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
> > +static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
> > +{
> > +	struct drm_mock_scheduler *sched =3D
> > drm_sched_to_mock_sched(sched_job->sched);
> > +	struct drm_mock_sched_job *job =3D
> > drm_sched_job_to_mock_job(sched_job);
> > +	unsigned long flags;
> > +
> > +	hrtimer_cancel(&job->timer);
> > +
> > +	spin_lock_irqsave(&sched->lock, flags);
> > +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> > +		list_del(&job->link);
> > +		dma_fence_set_error(&job->hw_fence, -ECANCELED);
> > +		dma_fence_signal_locked(&job->hw_fence);
> > +	}
> > +	spin_unlock_irqrestore(&sched->lock, flags);
> > +
> > +	/* The GPU Scheduler will call
> > drm_sched_backend_ops.free_job(), still.
> > +	 * Mock job itself is freed by the kunit framework. */
>=20
> /*
> =C2=A0 * Multiline comment style to stay consistent, at least in this
> file.
> =C2=A0 */
>=20
> The rest looks good, but I need to revisit the timeout/free handling=20
> since it has been a while and you changed it recently.
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
> > +	.cancel_job =3D mock_sched_cancel_job,
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -289,7 +302,6 @@ struct drm_mock_scheduler
> > *drm_mock_sched_new(struct kunit *test, long timeout)
> > =C2=A0=C2=A0	sched->hw_timeline.context =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0	atomic_set(&sched->hw_timeline.next_seqno, 0);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&sched->job_list);
> > -	INIT_LIST_HEAD(&sched->done_list);
> > =C2=A0=C2=A0	spin_lock_init(&sched->lock);
> > =C2=A0=20
> > =C2=A0=C2=A0	return sched;
> > @@ -304,38 +316,6 @@ struct drm_mock_scheduler
> > *drm_mock_sched_new(struct kunit *test, long timeout)
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
> > =C2=A0 {
> > -	struct drm_mock_sched_job *job, *next;
> > -	unsigned long flags;
> > -	LIST_HEAD(list);
> > -
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
> > -		hrtimer_cancel(&job->timer);
> > -
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
>=20

