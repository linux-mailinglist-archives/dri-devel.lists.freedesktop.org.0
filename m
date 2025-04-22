Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA67A96901
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5BC10E1C8;
	Tue, 22 Apr 2025 12:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UejwSlAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769F10E1C8;
 Tue, 22 Apr 2025 12:21:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZhhD804jXz9tbP;
 Tue, 22 Apr 2025 14:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745324472; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y40ADTZWH+m2e0+9YfjecdER7/iBcMRIQim/kOJPBow=;
 b=UejwSlAC/9Bqc+gDxOsJfMko09BeRm4iLJb/L9tE/MNFHgX3+Gud6Ef3nZo3ulINY0j7+V
 2u6F72lP5pHuajLyh8Dz4YSdYl4zyBkloBANIMPRxn5qZ5q7nQEMj71ckPtLzKy56hx4Dx
 k0ftBjHM+UfUizaD7cACvSC7HNHRt1n9GEadG0Mjtti3heObhyazVbkYP89nnSaeJAuhOH
 iupsqfGP0lCkg+KvL9/YxJVBMU+ya1L9EEqx/dPyf1ll9ncd6OE7HhL9w4uhwjz5V56tsr
 G44j38F0cNdN4V98aYiNjLxdCafupfZ2U8yI6XZBkIGlAYOSXwIVvuQYfzYl6A==
Message-ID: <9566a923b606e16f7725c79bd8e0a2c7c80daf9e.camel@mailbox.org>
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
Date: Tue, 22 Apr 2025 14:21:07 +0200
In-Reply-To: <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com> <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: af1c449944ba552b068
X-MBO-RS-META: 5pn75nj6rqfo7qbay4uajqygmjoy1ucq
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

On Tue, 2025-04-22 at 13:07 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/04/2025 12:13, Danilo Krummrich wrote:
> > On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
> > > Question I raised is if there are other drivers which manage to
> > > clean up
> > > everything correctly (like the mock scheduler does), but trigger
> > > that
> > > warning. Maybe there are not and maybe mock scheduler is the only
> > > false
> > > positive.
> >=20
> > So far the scheduler simply does not give any guideline on how to
> > address the
> > problem, hence every driver simply does something (or nothing,
> > effectively
> > ignoring the problem). This is what we want to fix.
> >=20
> > The mock scheduler keeps it's own list of pending jobs and on tear
> > down stops
> > the scheduler's workqueues, traverses it's own list and eventually
> > frees the
> > pending jobs without updating the scheduler's internal pending
> > list.
> >=20
> > So yes, it does avoid memory leaks, but it also leaves the
> > schedulers internal
> > structures with an invalid state, i.e. the pending list of the
> > scheduler has
> > pointers to already freed memory.
> >=20
> > What if the drm_sched_fini() starts touching the pending list? Then
> > you'd end up
> > with UAF bugs with this implementation. We cannot invalidate the
> > schedulers
> > internal structures and yet call scheduler functions - e.g.
> > drm_sched_fini() -
> > subsequently.
> >=20
> > Hence, the current implementation of the mock scheduler is
> > fundamentally flawed.
> > And so would be *every* driver that still has entries within the
> > scheduler's
> > pending list.
> >=20
> > This is not a false positive, it already caught a real bug -- in
> > the mock
> > scheduler.
>=20
> To avoid furher splitting hairs on whether real bugs need to be able
> to=20
> manifest or not, lets move past this with a conclusion that there are
> two potential things to do here:
>=20
> First one is to either send separately or include in this series=20
> something like:
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c=20
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..7c4df0e890ac 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -300,6 +300,8 @@ void drm_mock_sched_fini(struct
> drm_mock_scheduler=20
> *sched)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 drm_mock_sched_job_complete(job);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&=
sched->lock, flags);
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Free completed j=
obs and jobs not yet processed by the DRM
> scheduler
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * free worker.
> @@ -311,8 +313,6 @@ void drm_mock_sched_fini(struct
> drm_mock_scheduler=20
> *sched)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe=
(job, next, &list, link)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mock_sched_free_job(&job->base);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fini(&sched->base);
> =C2=A0 }
>=20
> =C2=A0 /**
>=20
> That should satisfy the requirement to "clear" memory about to be
> freed=20
> and be 100% compliant with drm_sched_fini() kerneldoc (guideline b).
>=20
> But the new warning from 3/5 here will still be there AFAICT and
> would=20
> you then agree it is a false positive?
>=20
> Secondly, the series should modify all drivers (including the unit=20
> tests) which are known to trigger this false positive.

There is no false positive. I just stated that in my other answer.

That said, I agree that the unit tests should be a second user of this
code in addition to Nouveau. They then should also provide the
fence_context_kill() callback, though.

And it seems we also agree that the memory leaks must be solved
centrally in drm_sched_fini().


P.

>=20
> Regards,
>=20
> Tvrtko
>=20

