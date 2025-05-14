Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FCAB6721
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F0F10E5FA;
	Wed, 14 May 2025 09:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SEu2+Lxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BB110E5FA;
 Wed, 14 May 2025 09:19:36 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zy78N2fdPz9t76;
 Wed, 14 May 2025 11:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747214372; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX/+oVQTquS1mWBfFty+DmXpsce2yUrtxG5oSfbjfco=;
 b=SEu2+LxxTcyE2nVz5ovYvIkYJ3QMqncbbRBSkF2UQlWaVDM1y8ZrpaRwy/ijZ8jQojk9Re
 Ufr7rprT4vKbS8V5nPraSnW96eJxZBGJTz4PUls+qs3tbLML05MIS9NYjyBiWd4nErDNdl
 mK+hbjqKwPBlRCsaa65R3qZ9dAdMzbXUjF/so9FAJT3jKQ6pCaxR/RbCpPBOrjz53gfiCb
 tKI6pJJyg2h2YOcGTtLCjZJQJ/em+Sv/LAF9pKmR2NDRBqxWcnf3M4lLfbMR1HlhxewdYT
 xlqy6uC+4Ig6J4PHQYPS5ion2S5kAQw9SeyDp0zxsxm7vQmukFO0KbsanAkK3Q==
Message-ID: <b98ac3e08922f5d1a6a83d1caa9f8d1d4a7aaac2.camel@mailbox.org>
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 14 May 2025 11:19:25 +0200
In-Reply-To: <1d753b0f-4770-4f90-b2fb-48193262d713@igalia.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-8-phasta@kernel.org>
 <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
 <a1c9c680-2927-428c-95e9-2e79d14cec58@igalia.com>
 <84021a2461db55617018050b7c0e07a15dceb634.camel@mailbox.org>
 <1d753b0f-4770-4f90-b2fb-48193262d713@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 599db39402c1399f9b8
X-MBO-RS-META: dgoc31epst7ynah537peaaxcoarzks9i
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

On Wed, 2025-05-14 at 09:30 +0100, Tvrtko Ursulin wrote:
>=20
> On 12/05/2025 09:00, Philipp Stanner wrote:
> > On Thu, 2025-05-08 at 13:51 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > Hi Philipp,
> > >=20
> > > On 08/05/2025 12:03, Philipp Stanner wrote:
> > > > On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
> > > > > The unit tests so far took care manually of avoiding memory
> > > > > leaks
> > > > > that
> > > > > might have occurred when calling drm_sched_fini().
> > > > >=20
> > > > > The scheduler now takes care by itself of avoiding memory
> > > > > leaks
> > > > > if
> > > > > the
> > > > > driver provides the callback
> > > > > drm_sched_backend_ops.kill_fence_context().
> > > > >=20
> > > > > Implement that callback for the unit tests. Remove the manual
> > > > > cleanup
> > > > > code.
> > > >=20
> > > > @Tvrtko: On a scale from 1-10, how much do you love this patch?
> > > > :)
> > >=20
> > > Specific patch aside, it is the series as a whole I would like to
> > > be
> > > sure there isn't a more elegant way to achieve the same end
> > > result.
> >=20
> > I count this as a 9/10 \o/
>=20
> :) Yes, sorry, it would a bit lower than that, at least until someone
> can point out a fatal flaw in my alternative. :)

There's no fatal flaw in my approach either :)

>=20
> > But jokes aside:
> >=20
> > >=20
> > > Like that sketch of a counter proposal I sent for the reasons
> > > listed
> > > with it. Which were, AFAIR, to avoid needing to add more state
> > > machine,
> >=20
> > Well the state machine added is basically just the waitqueue. The
> > WRITE_ONCE booleans are currently just for correctness and clarity.
> > I've looked at them and want to remove them all in an other patch,
> > because I think they're not needed (workqueue handles that)
> >=20
> > But yes, the added state is > 0
> >=20
> > > to avoid mandating drivers have to keep an internal list,
> >=20
> > That's not mandated by the scheduler, but by logic itself. All
> > drivers
> > need to have a list of on-flight fences. Otherwise the drivers
> > would
> > have no chance of signaling those fences once their GPU tells them
> > to
> > do so.
>=20
> Probably it would be hard to signal without tracking of some sort
> yes,=20
> although it wouldn't have to be indexed by fence context, or looked
> up=20
> by it so maybe still simpler.

Well, the decisive point remains that all drivers must know all on-air
fences, so they all are able to signal those fences.

>=20
> More importantly I think with this comment I was thinking about the
> fact=20
> that with ops->cancel_job() approach I was able to remove the _done_=20
> list tracking from the mock scheduler.

If the done_list is just about avoiding memory leaks, then I should
also be able to remove it completely, shouldn't I? In this patch here I
already remove the leak-related code in drm_mock_sched_fini(), but
hadn't looked too deeply into what else the done_list does. Is it just
about the leaks?

>=20
> > I have now provided two users of the new API, nouveau and the unit
> > tests. Can you think of a party for which the suggested approach
> > wouldn't work?
>=20
> I did not think along those lines yet so don't know. I just thought
> it=20
> was too much code to implement a relatively simple thing and that
> also a=20
> few things in the design bothered me.
>=20
> If you look at the diffstat from my proposal and ignore kerneldoc and
> unit test stats, it literally adds 8 lines to drm_sched_fini() and a=20
> single line to gpu_scheduler.h:
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*cancel_job)(struct drm_sched=
_job *sched_job);
>=20
> And in the former after it stops the workers:
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (sched->ops->cancel_job) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct drm_sched_job *job;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 list_for_each_entry_reverse(job, &sched-
> >pending_list,=20
> list) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->ops->ca=
ncel_job(job);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->ops->fr=
ee_job(job);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> To me this looks quite clean. Unless, I say this again, I am missing=20
> some fatal flaw why it doesn't work.

It does work. I've stated that before. But mine works, too. And mine
doesn't have a hard blocker either, as far as I can see.

So let's focus on the main differences:

Your version adds fewer lines of code, that's correct.

I think cleaning up through just having the driver signal the fences
all at once is better because
   1. The very same code path both for "legacy-fini" and "new-fini" is
      responsible for cleaning up the jobs. Notably, the free_job()
      callback is only invoked by the same parties as before, primarily
      the work items. We don't add a new, only sometimes running, code
      path *that free's jobs*.
   2. The scheduler's already fractured design doesn't fracture
      further: the free_job work item remains responsible for calling
      free_job(). Having just one party being responsible for one thing
      is a desirable design goal.
   3. Considering that many drivers generously (ab)use API internals of
      the scheduler, and considering that there is already ambiguity of
      who's responsible for handling job lifetimes, I believe it is
      safer not to add an additional code path that can free jobs, but
      keep that one path.
   4. It reads more cleanly: "We're not canceling a single job here,
      we're killing all associated jobs now all at once", raising
      awareness for driver programmers that this is a significant
      event: we're tearing down while not all of your jobs have
      finished on your GPU.

>=20
> > Don't get me wrong, your approach does work and it definitely has
> > its
> > charm. However, I think what I propose here is syntactically a bit
> > cleaner because the classical order of a fence first being signaled
> > in
> > the driver and then the associated job being freed as usual by the
> > scheduler is guaranteed. IOW, we primarily rely on the signaling
> > path.
> >=20
> > Either way, neither your nor my approach would have worked out of
> > the
> > box in Nouveau without that driver exploding.
>=20
> What do you mean by this - the latest version of your series does or=20
> does not work for nouveau?

Mine works with Nouveau, but revealed a bug in Nouveau [1]. Yours would
have ran into that bug, too.

My point is just that your job-by-job approach wouldn't have been
superior to my approach in practice, i.e., when implementing it in the
first "beta tester", Nouveau. Would have been the same problem in
different color.

So just because a cancel_job() callback would result in fewer lines of
code wouldn't mean it's superior in practice. I expect the same to be
the case for other drivers, especially those who use scheduler
internals.

So, summarizing:
 * My approach works. Your approach works.
 * It works for all drivers, because they all have a list of fences.
 * It communicates more clearly to the driver what this is all about.
 * It keeps the scheduler's design more consistent regarding
   responsibility / code paths for job life times.

P.

[1] https://lore.kernel.org/dri-devel/20250415121900.55719-2-phasta@kernel.=
org/

>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > > =C2=A0 and to align
> > > better with the existing prototypes in the sched ops table (where
> > > everything operates on jobs).
> >=20
> > That's not a hard criteria IMO. Those are sched_backend_ops, not
> > sched_job_backend_ops, and prepare_job() already takes a parameter
> > other than a job.
> >=20
> >=20
> > Cheers,
> > P.
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=
=A0 | 34
> > > > > ++++++++++++-----
> > > > > --
> > > > > =C2=A0=C2=A0=C2=A01 file changed, 21 insertions(+), 13 deletions(=
-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > > index f999c8859cf7..a72d26ca8262 100644
> > > > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > > @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
> > > > > drm_sched_job *sched_job)
> > > > > =C2=A0=C2=A0=C2=A0 /* Mock job itself is freed by the kunit frame=
work. */
> > > > > =C2=A0=C2=A0=C2=A0}
> > > > > =C2=A0=C2=A0=20
> > > > > +static void mock_sched_fence_context_kill(struct
> > > > > drm_gpu_scheduler
> > > > > *gpu_sched)
> > > > > +{
> > > > > + struct drm_mock_scheduler *sched =3D
> > > > > drm_sched_to_mock_sched(gpu_sched);
> > > > > + struct drm_mock_sched_job *job;
> > > > > + unsigned long flags;
> > > > > +
> > > > > + spin_lock_irqsave(&sched->lock, flags);
> > > > > + list_for_each_entry(job, &sched->job_list, link) {
> > > > > + spin_lock(&job->lock);
> > > > > + if (!dma_fence_is_signaled_locked(&job-
> > > > > > hw_fence)) {
> > > > > + dma_fence_set_error(&job->hw_fence, -
> > > > > ECANCELED);
> > > > > + dma_fence_signal_locked(&job->hw_fence);
> > > > > + }
> > > > > + complete(&job->done);
> > > > > + spin_unlock(&job->lock);
> > > > > + }
> > > > > + spin_unlock_irqrestore(&sched->lock, flags);
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0static const struct drm_sched_backend_ops
> > > > > drm_mock_scheduler_ops =3D {
> > > > > =C2=A0=C2=A0=C2=A0 .run_job =3D mock_sched_run_job,
> > > > > =C2=A0=C2=A0=C2=A0 .timedout_job =3D mock_sched_timedout_job,
> > > > > - .free_job =3D mock_sched_free_job
> > > > > + .free_job =3D mock_sched_free_job,
> > > > > + .kill_fence_context =3D mock_sched_fence_context_kill,
> > > > > =C2=A0=C2=A0=C2=A0};
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0=C2=A0/**
> > > > > @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
> > > > > drm_mock_scheduler *sched)
> > > > > =C2=A0=C2=A0=C2=A0 drm_mock_sched_job_complete(job);
> > > > > =C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&sched->lock, flags);
> > > > > =C2=A0=C2=A0=20
> > > > > - /*
> > > > > - * Free completed jobs and jobs not yet processed by the
> > > > > DRM
> > > > > scheduler
> > > > > - * free worker.
> > > > > - */
> > > > > - spin_lock_irqsave(&sched->lock, flags);
> > > > > - list_for_each_entry_safe(job, next, &sched->done_list,
> > > > > link)
> > > > > - list_move_tail(&job->link, &list);
> > > > > - spin_unlock_irqrestore(&sched->lock, flags);
> > > > > -
> > > > > - list_for_each_entry_safe(job, next, &list, link)
> > > > > - mock_sched_free_job(&job->base);
> > > > > -
> > > > > =C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> > > > > =C2=A0=C2=A0=C2=A0}
> > > > > =C2=A0=C2=A0=20
> > > >=20
> > >=20
> >=20
>=20

