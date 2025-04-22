Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6584A96D4E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAA010E5B4;
	Tue, 22 Apr 2025 13:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qYnrR6L4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1610E5B4;
 Tue, 22 Apr 2025 13:46:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zhk6V0g4dz9slY;
 Tue, 22 Apr 2025 15:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745329586; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4UNsOaOx56cRcgj+HnW0PnHBzc2Fijk7TfEsF4nX2A=;
 b=qYnrR6L44OXGqvGRGYAoFmZyiltnTXOjXAfwE3MP2Suqkco5KJtUV0HS3c0mRYg5QCy3c7
 kDqLTx5qZnLXx+h1PCpRmRkkm4O5gMwIkjlJnkli1tRUqy7zGmlepPxffJBw+81rJqRfjf
 7hNngGEHokvrSeksYNMoX0HEjqM9MCmt30sX2oj368wmfQ4eyAb6eWFVh9VCrlCyMnTN9c
 s+UETjdHirJu9gKjQMdUYwj4mdkGM727o+FKUd8Vv2kv/rJu0YK9fGR8LUuYReWKjgCbOz
 SN6REaOd9kkaJnYakziWjzDZm1yC7HbxkOYAY/xyk5rBRt2BuUNvtcGqR9fyoA==
Message-ID: <e8459da01e0c76242544b88768fd3a58e75073d5.camel@mailbox.org>
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 15:46:21 +0200
In-Reply-To: <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
References: <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a0e588faec0dee86da0
X-MBO-RS-META: qbfize4p6ohzmmp9m5gy8daaugrp4pek
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

On Tue, 2025-04-22 at 14:39 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/04/2025 13:32, Danilo Krummrich wrote:
> > On Tue, Apr 22, 2025 at 01:07:47PM +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 22/04/2025 12:13, Danilo Krummrich wrote:
> > > > On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
> > > > > Question I raised is if there are other drivers which manage
> > > > > to clean up
> > > > > everything correctly (like the mock scheduler does), but
> > > > > trigger that
> > > > > warning. Maybe there are not and maybe mock scheduler is the
> > > > > only false
> > > > > positive.
> > > >=20
> > > > So far the scheduler simply does not give any guideline on how
> > > > to address the
> > > > problem, hence every driver simply does something (or nothing,
> > > > effectively
> > > > ignoring the problem). This is what we want to fix.
> > > >=20
> > > > The mock scheduler keeps it's own list of pending jobs and on
> > > > tear down stops
> > > > the scheduler's workqueues, traverses it's own list and
> > > > eventually frees the
> > > > pending jobs without updating the scheduler's internal pending
> > > > list.
> > > >=20
> > > > So yes, it does avoid memory leaks, but it also leaves the
> > > > schedulers internal
> > > > structures with an invalid state, i.e. the pending list of the
> > > > scheduler has
> > > > pointers to already freed memory.
> > > >=20
> > > > What if the drm_sched_fini() starts touching the pending list?
> > > > Then you'd end up
> > > > with UAF bugs with this implementation. We cannot invalidate
> > > > the schedulers
> > > > internal structures and yet call scheduler functions - e.g.
> > > > drm_sched_fini() -
> > > > subsequently.
> > > >=20
> > > > Hence, the current implementation of the mock scheduler is
> > > > fundamentally flawed.
> > > > And so would be *every* driver that still has entries within
> > > > the scheduler's
> > > > pending list.
> > > >=20
> > > > This is not a false positive, it already caught a real bug --
> > > > in the mock
> > > > scheduler.
> > >=20
> > > To avoid furher splitting hairs on whether real bugs need to be
> > > able to
> > > manifest or not, lets move past this with a conclusion that there
> > > are two
> > > potential things to do here:
> >=20
> > This is not about splitting hairs, it is about understanding that
> > abusing
> > knowledge about internals of a component to clean things up is
> > *never* valid.
> >=20
> > > First one is to either send separately or include in this series
> > > something
> > > like:
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > index f999c8859cf7..7c4df0e890ac 100644
> > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > @@ -300,6 +300,8 @@ void drm_mock_sched_fini(struct
> > > drm_mock_scheduler
> > > *sched)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mock_sched_job_complete(job);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqresto=
re(&sched->lock, flags);
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Free complet=
ed jobs and jobs not yet processed by the
> > > DRM
> > > scheduler
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * free worker.
> > > @@ -311,8 +313,6 @@ void drm_mock_sched_fini(struct
> > > drm_mock_scheduler
> > > *sched)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry_=
safe(job, next, &list, link)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 mock_sched_free_job(&job->base);
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> > > =C2=A0 }
> > >=20
> > > =C2=A0 /**
> > >=20
> > > That should satisfy the requirement to "clear" memory about to be
> > > freed and
> > > be 100% compliant with drm_sched_fini() kerneldoc (guideline b).
> > >=20
> > > But the new warning from 3/5 here will still be there AFAICT and
> > > would you
> > > then agree it is a false positive?
> >=20
> > No, I do not agree.
> >=20
> > Even if a driver does what you describe it is not the correct thing
> > to do and
> > having a warning call it out makes sense.
> >=20
> > This way of cleaning things up entirely relies on knowing specific
> > scheduler
> > internals, which if changed, may fall apart.
> >=20
> > > Secondly, the series should modify all drivers (including the
> > > unit tests)
> > > which are known to trigger this false positive.
> >=20
> > Again, there are no false positives. It is the scheduler that needs
> > to call
> > free_job() and other potential cleanups. You can't just stop the
> > scheduler,
> > leave it in an intermediate state and try to clean it up by hand
> > relying on
> > knowledge about internals.
>=20
> Sorry I don't see the argument for the claim it is relying on the=20
> internals with the re-positioned drm_sched_fini call. In that case it
> is=20
> fully compliant with:
>=20
> /**
> =C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> =C2=A0 *
> =C2=A0 * Tears down and cleans up the scheduler.
> =C2=A0 *
> =C2=A0 * This stops submission of new jobs to the hardware through
> =C2=A0 * drm_sched_backend_ops.run_job(). Consequently,=20
> drm_sched_backend_ops.free_job()
> =C2=A0 * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> =C2=A0 * There is no solution for this currently. Thus, it is up to the=
=20
> driver to make
> =C2=A0 * sure that:
> =C2=A0 *
> =C2=A0 *=C2=A0 a) drm_sched_fini() is only called after for all submitted=
 jobs
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has bee=
n called or that
> =C2=A0 *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has=
 not
> been=20
> called
> =C2=A0 *
> =C2=A0 * FIXME: Take care of the above problem and prevent this function
> from=20
> leaking
> =C2=A0 * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
>=20
> ^^^ recommended solution b).
>=20
> > Consequently, when the pending list isn't empty when
> > drm_sched_fini() is called,
> > it *always* is a bug.
>=20
> I am simply arguing that a quick audit of the drivers should be done
> to=20
> see that the dev_err is not added for drivers which clean up in=20
> compliance with drm_sched_fini() kerneldoc.
>=20
> Starting to log errors from those would be adding work for many
> people=20
> in the bug handling chain. Sure you can say lets add the dev_err and=20
> then we don't have to look into the code base, just wait for bug
> reports=20
> to come our way. That works too (on some level) but lets please state
> the intent clearly and explicitly.

Well, yes, that exactly is my intention.

All driver's must currently ensure in some custom way that a) all
fences get signaled and b) that the scheduler had time to call
free_job() for all jobs in pending_list.

If there is anyone in-tree currently who has len(pending_list) > 0
after drm_sched_fini() ran that are clearly memory leaks that need to
be fixed.

And, thus, firing the warning for all those drivers is appropriate.

I think it's unlikely to happen though. The hardware schedulers rarely
call drm_sched_fini(), and the firmware schedulers would have memory
leaks so large that they are likely to have been discovered by now.

P.

>=20
> Regards,
>=20
> Tvrtko
>=20

