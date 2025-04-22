Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468FA96E29
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD6B10E5C0;
	Tue, 22 Apr 2025 14:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yATb8UOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20EE10E5C0;
 Tue, 22 Apr 2025 14:16:58 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zhknd6yrtz9thF;
 Tue, 22 Apr 2025 16:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745331414; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7LtyxZabqxldyU5RLs4vfwzAyWuZQ0DIMUXm0snWbA=;
 b=yATb8UOfgTRN2yvF8+olL/fpXoht6MNPP+JVvDFSFyv6AC1gfHs7lG3LZOjc972u0TF0+5
 qGrgHPOcRfKyC7//weDnc6aDHrZZpwwd/m1b+DuPd+R5aO3Y9WwTSSDiQiXefdjxTBn7lt
 /RPmgshQj8sLWLrVz2euXOeAJ2BE1yNhSsBe/R1EziZ7w/34tASu+lF9r9BZiSrw36LDF9
 nw8MOj1tAPxz8wxpfxm6u1be+lVNmfU6GvuW/LLtjboLfMJiFDilrfpLhvuZ5EbN5OX8ub
 UTAw+GruRlvPNkpz4l3pPPpT2yAm02iJUUE9j0GzLt2a6XCCNz5T3ojHKkPPMA==
Message-ID: <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 16:16:48 +0200
In-Reply-To: <aAeiwZ2j2PhEwhVh@cassiopeiae>
References: <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f6d09d6099a7957f0c4
X-MBO-RS-META: 8wq86bq79z1ouchutggxfm4d3o8toyh3
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

On Tue, 2025-04-22 at 16:08 +0200, Danilo Krummrich wrote:
> On Tue, Apr 22, 2025 at 02:39:21PM +0100, Tvrtko Ursulin wrote:
> >=20
> > On 22/04/2025 13:32, Danilo Krummrich wrote:
> > > On Tue, Apr 22, 2025 at 01:07:47PM +0100, Tvrtko Ursulin wrote:
> > > >=20
> > > > On 22/04/2025 12:13, Danilo Krummrich wrote:
> > > > > On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin
> > > > > wrote:
> > > > > > Question I raised is if there are other drivers which
> > > > > > manage to clean up
> > > > > > everything correctly (like the mock scheduler does), but
> > > > > > trigger that
> > > > > > warning. Maybe there are not and maybe mock scheduler is
> > > > > > the only false
> > > > > > positive.
> > > > >=20
> > > > > So far the scheduler simply does not give any guideline on
> > > > > how to address the
> > > > > problem, hence every driver simply does something (or
> > > > > nothing, effectively
> > > > > ignoring the problem). This is what we want to fix.
> > > > >=20
> > > > > The mock scheduler keeps it's own list of pending jobs and on
> > > > > tear down stops
> > > > > the scheduler's workqueues, traverses it's own list and
> > > > > eventually frees the
> > > > > pending jobs without updating the scheduler's internal
> > > > > pending list.
> > > > >=20
> > > > > So yes, it does avoid memory leaks, but it also leaves the
> > > > > schedulers internal
> > > > > structures with an invalid state, i.e. the pending list of
> > > > > the scheduler has
> > > > > pointers to already freed memory.
> > > > >=20
> > > > > What if the drm_sched_fini() starts touching the pending
> > > > > list? Then you'd end up
> > > > > with UAF bugs with this implementation. We cannot invalidate
> > > > > the schedulers
> > > > > internal structures and yet call scheduler functions - e.g.
> > > > > drm_sched_fini() -
> > > > > subsequently.
> > > > >=20
> > > > > Hence, the current implementation of the mock scheduler is
> > > > > fundamentally flawed.
> > > > > And so would be *every* driver that still has entries within
> > > > > the scheduler's
> > > > > pending list.
> > > > >=20
> > > > > This is not a false positive, it already caught a real bug --
> > > > > in the mock
> > > > > scheduler.
> > > >=20
> > > > To avoid furher splitting hairs on whether real bugs need to be
> > > > able to
> > > > manifest or not, lets move past this with a conclusion that
> > > > there are two
> > > > potential things to do here:
> > >=20
> > > This is not about splitting hairs, it is about understanding that
> > > abusing
> > > knowledge about internals of a component to clean things up is
> > > *never* valid.
> > >=20
> > > > First one is to either send separately or include in this
> > > > series something
> > > > like:
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > index f999c8859cf7..7c4df0e890ac 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > @@ -300,6 +300,8 @@ void drm_mock_sched_fini(struct
> > > > drm_mock_scheduler
> > > > *sched)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mock_sched_job_complete(job);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqres=
tore(&sched->lock, flags);
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Free compl=
eted jobs and jobs not yet processed by
> > > > the DRM
> > > > scheduler
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * free worke=
r.
> > > > @@ -311,8 +313,6 @@ void drm_mock_sched_fini(struct
> > > > drm_mock_scheduler
> > > > *sched)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entr=
y_safe(job, next, &list, link)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mock_sched_free_job(&job->base);
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> > > > =C2=A0 }
> > > >=20
> > > > =C2=A0 /**
> > > >=20
> > > > That should satisfy the requirement to "clear" memory about to
> > > > be freed and
> > > > be 100% compliant with drm_sched_fini() kerneldoc (guideline
> > > > b).
> > > >=20
> > > > But the new warning from 3/5 here will still be there AFAICT
> > > > and would you
> > > > then agree it is a false positive?
> > >=20
> > > No, I do not agree.
> > >=20
> > > Even if a driver does what you describe it is not the correct
> > > thing to do and
> > > having a warning call it out makes sense.
> > >=20
> > > This way of cleaning things up entirely relies on knowing
> > > specific scheduler
> > > internals, which if changed, may fall apart.
> > >=20
> > > > Secondly, the series should modify all drivers (including the
> > > > unit tests)
> > > > which are known to trigger this false positive.
> > >=20
> > > Again, there are no false positives. It is the scheduler that
> > > needs to call
> > > free_job() and other potential cleanups. You can't just stop the
> > > scheduler,
> > > leave it in an intermediate state and try to clean it up by hand
> > > relying on
> > > knowledge about internals.
> >=20
> > Sorry I don't see the argument for the claim it is relying on the
> > internals
> > with the re-positioned drm_sched_fini call. In that case it is
> > fully
> > compliant with:
> >=20
> > /**
> > =C2=A0* drm_sched_fini - Destroy a gpu scheduler
> > =C2=A0*
> > =C2=A0* @sched: scheduler instance
> > =C2=A0*
> > =C2=A0* Tears down and cleans up the scheduler.
> > =C2=A0*
> > =C2=A0* This stops submission of new jobs to the hardware through
> > =C2=A0* drm_sched_backend_ops.run_job(). Consequently,
> > drm_sched_backend_ops.free_job()
> > =C2=A0* will not be called for all jobs still in
> > drm_gpu_scheduler.pending_list.
> > =C2=A0* There is no solution for this currently. Thus, it is up to the
> > driver to
> > make
> > =C2=A0* sure that:
> > =C2=A0*
> > =C2=A0*=C2=A0 a) drm_sched_fini() is only called after for all submitte=
d jobs
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has be=
en called or that
> > =C2=A0*=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() ha=
s not
> > been
> > called
> > =C2=A0*
> > =C2=A0* FIXME: Take care of the above problem and prevent this function
> > from
> > leaking
> > =C2=A0* the jobs in drm_gpu_scheduler.pending_list under any
> > circumstances.
> >=20
> > ^^^ recommended solution b).
>=20
> This has been introduced recently with commit baf4afc58314
> ("drm/sched: Improve
> teardown documentation") and I do not agree with this. The scheduler
> should
> *not* make any promises about implementation details to enable
> drivers to abuse
> their knowledge about component internals.
>=20
> This makes the problem *worse* as it encourages drivers to rely on
> implementation details, making maintainability of the scheduler even
> worse.
>=20
> For instance, what if I change the scheduler implementation, such
> that for every
> entry in the pending_list the scheduler allocates another internal
> object for
> ${something}? Then drivers would already fall apart leaking those
> internal
> objects.
>=20
> Now, obviously that's pretty unlikely, but I assume you get the idea.
>=20
> The b) paragraph in drm_sched_fini() should be removed for the given
> reasons.
>=20
> AFAICS, since the introduction of this commit, driver implementations
> haven't
> changed in this regard, hence we should be good.
>=20
> So, for me this doesn't change the fact that every driver
> implementation that
> just stops the scheduler at an arbitrary point of time and tries to
> clean things
> up manually relying on knowledge about component internals is broken.

To elaborate on that, this documentation has been written so that we at
least have *some* documentation about the problem, instead of just
letting new drivers run into the knife.

The commit explicitly introduced the FIXME, marking those two hacky
workarounds as undesirable.

But back then we couldn't fix the problem quickly, so it was either
document the issue at least a bit, or leave it completely undocumented.

P.

>=20
> However, this doesn't mean we can't do a brief audit.
>=20
> - Danilo

