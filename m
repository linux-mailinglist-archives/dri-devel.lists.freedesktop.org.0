Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756AAAEDC99
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856AC10E435;
	Mon, 30 Jun 2025 12:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="p9ZN1D+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A301C10E21C;
 Mon, 30 Jun 2025 12:20:29 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bW4xQ3h6Yz9sTl;
 Mon, 30 Jun 2025 14:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751286026; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcR6a6gmJMVHxZCU8tCDMrbwDvzZ7ntDN0DvtbsWLGs=;
 b=p9ZN1D+dEoW8qNkG1tiXpX3ATi6xuY2sUtZwxkgfecgX9yuSIFKI9ZXHRIwNNdGOMRzIxh
 yqMWK+klhMm3daYHGIZvVocoAt3YmToGGIePTnmTnEcJb0Jz16t2o9Of1fdZ8W8qJR2utV
 pRlsDEQKkc6J2MC9LDkviTVBIo5kKqA5j1KyXx1KD1NbHu1QydXA3k753RR4Hs7RG+bQzN
 mwi+2ZqndPUMuSZCA5nzP44va2Yru3li2stmZTCdL3mY8ujmO3/a8n+fXElbuz2FbsJUMH
 Tj7rFszIgD3Q5dZ6kDRdGWW2ti+GAJTht4BLK+FnJrYNc4L63bpHLUiaB3J+jQ==
Message-ID: <8e727f9644df9ba7d8c5f3966e146e5eb0684121.camel@mailbox.org>
Subject: Re: [PATCH v3 3/8] drm/sched: Make timeout KUnit tests faster
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,  Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,  Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 14:20:17 +0200
In-Reply-To: <27c7fef3-ce37-48b9-bf63-3b3417618835@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-3-8be5cca2725d@igalia.com>
 <2670247a8982f794a508f4cf3ae43ad7ac66862a.camel@mailbox.org>
 <27c7fef3-ce37-48b9-bf63-3b3417618835@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: gdut6dx4ojhbpn8doxbsahxicxxeai7p
X-MBO-RS-ID: 04e0d98ecfa993e56b7
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

On Mon, 2025-06-30 at 09:05 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 30/06/25 08:53, Philipp Stanner wrote:
> > On Wed, 2025-06-18 at 11:47 -0300, Ma=C3=ADra Canal wrote:
> > > As more KUnit tests are introduced to evaluate the basic
> > > capabilities
> > > of
> > > the `timedout_job()` hook, the test suite will continue to
> > > increase
> > > in
> > > duration. To reduce the overall running time of the test suite,
> > > decrease
> > > the scheduler's timeout for the timeout tests.
> > >=20
> > > Before this commit:
> > >=20
> > > [15:42:26] Elapsed time: 15.637s total, 0.002s configuring,
> > > 10.387s
> > > building, 5.229s running
> > >=20
> > > After this commit:
> > >=20
> > > [15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s
> > > building, 4.037s running
> >=20
> > I guess those times were measured with the entire series?
>=20
> No, they were measured without the new test that I introduced in the
> next patch.
>=20
> >=20
> > It's not clear to me whether this patch is independent from the
> > series.
> > I suppose it is. We should aim towards having series's narrowly
> > focused
> > topic-wise, but I get why you included it here.
>=20
> =C2=A0From my perspective, this patch is a preparation to the next one. A=
s
> I'll introduce another timeout-related test in the next patch, I was
> trying to ensure that we will keep the time-budget reasonable.
>=20
> >=20
> > That said, is there a specific reason for you aiming at ~10s
> > (9.263)?
> > That's only a bit faster than the 15.637.
> >=20
>=20
> Actually, the only thing that this patch affects is the runtime. So,
> it
> went from 5.229s to 4.037s (-22.8%). However, as we add more and more
> timeout tests, the absolute difference would get more significant.

I understand that. My point is that the decrease of total run time that
you state in your commit message doesn't sound that significant to me.
~10s is still pretty long.

>=20
> > Couldn't it make sense, as you're at it already, to speed this up
> > to
> > just a few seconds, like 3-5? Then it should really be quiet IRW
> > that
> > topic for a while.
>=20
> I believe that further decreasing the timeout could lead to racy
> scenarios and flaky tests.

That doesn't make sense to me. What could race with what? I guess you
mean the completion's timeout racing with the signaling timer.

Anyways, I'm personally not suffering from the tests being too slow. So
just take this as ideas. I'm fine with it being merged as it is now.


P.

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> >=20
> > P.
> >=20
> > >=20
> > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++--=
-
> > > =C2=A0=C2=A01 file changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > index
> > > 7230057e0594c6246f02608f07fcb1f8d738ac75..41c648782f4548e202bd871
> > > 1b45
> > > d28eead9bd0b2 100644
> > > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > @@ -5,6 +5,8 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include "sched_tests.h"
> > > =C2=A0=20
> > > +#define MOCK_TIMEOUT (HZ / 5)
> > > +
> > > =C2=A0=C2=A0/*
> > > =C2=A0=C2=A0 * DRM scheduler basic tests should check the basic funct=
ional
> > > correctness of
> > > =C2=A0=C2=A0 * the scheduler, including some very light smoke testing=
. More
> > > targeted tests,
> > > @@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit
> > > *test)
> > > =C2=A0=20
> > > =C2=A0=C2=A0static int drm_sched_timeout_init(struct kunit *test)
> > > =C2=A0=C2=A0{
> > > -	test->priv =3D drm_mock_sched_new(test, HZ);
> > > +	test->priv =3D drm_mock_sched_new(test, MOCK_TIMEOUT);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0=C2=A0}
> > > @@ -227,14 +229,14 @@ static void drm_sched_basic_timeout(struct
> > > kunit *test)
> > > =C2=A0=C2=A0	done =3D drm_mock_sched_job_wait_scheduled(job, HZ);
> > > =C2=A0=C2=A0	KUNIT_ASSERT_TRUE(test, done);
> > > =C2=A0=20
> > > -	done =3D drm_mock_sched_job_wait_finished(job, HZ / 2);
> > > +	done =3D drm_mock_sched_job_wait_finished(job,
> > > MOCK_TIMEOUT /
> > > 2);
> > > =C2=A0=C2=A0	KUNIT_ASSERT_FALSE(test, done);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	KUNIT_ASSERT_EQ(test,
> > > =C2=A0=C2=A0			job->flags &
> > > DRM_MOCK_SCHED_JOB_TIMEDOUT,
> > > =C2=A0=C2=A0			0);
> > > =C2=A0=20
> > > -	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> > > +	done =3D drm_mock_sched_job_wait_finished(job,
> > > MOCK_TIMEOUT);
> > > =C2=A0=C2=A0	KUNIT_ASSERT_FALSE(test, done);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	KUNIT_ASSERT_EQ(test,
> > >=20
> >=20
>=20

