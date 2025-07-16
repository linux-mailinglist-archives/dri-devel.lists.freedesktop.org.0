Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C2B077C2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2664A10E72C;
	Wed, 16 Jul 2025 14:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nIYemb2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94910E72C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 14:14:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bhyk50Jk6z9tWF;
 Wed, 16 Jul 2025 16:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752675293; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBB0CMINcQalmoqkVBlYcnj1JlIT+GNmrrrCU59u7P8=;
 b=nIYemb2y1fz8Q4FnbGhHbX3P4gtEdFpPDKv3J2ChegQj+DbyEPImOpBJczOZ3Vy1cEvQj0
 /eNtfJiuMfA+aX7SkhW4BWQ6CLfSuwTmMP1v06WjvMfiuGdnHyPRFxZMrnU86fEY09A6FF
 +dyyCkCZXog7lp9gBghWg+fGEjP9tCgXOKrXz8OEsXE8H10Tn5II3iCa0+CCPYilxXVsLw
 H3DVCHn1iLgy4VzZeN7QLGE0+v/QR132Z8VmrZyvGpkDO17vRUx/W1/QzYeNILdSA2ijo6
 +favNkRehZWR3PqnMwPsthgOWsxW0qHtO1on2fC1L45xgFZZR0e4xJDoyBPMzg==
Message-ID: <f369f149b4624cb98f4bf4fb67db8e833870fadf.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>
Date: Wed, 16 Jul 2025 16:14:50 +0200
In-Reply-To: <d01b77a1-710b-4996-80cb-c33e688a779c@igalia.com>
References: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
 <629ab61a-ee69-43cd-a05e-b8d262cc0a51@igalia.com>
 <68b7afc6-11fc-4a80-abb7-b9b03bc5f4fe@igalia.com>
 <d01b77a1-710b-4996-80cb-c33e688a779c@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 5781b3xzhymruu81okus1aq4tszmqkrx
X-MBO-RS-ID: 933709a6c3003b9aa61
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

On Wed, 2025-07-16 at 11:05 -0300, Ma=C3=ADra Canal wrote:
> Hi Tvrtko,
>=20
> On 16/07/25 10:41, Tvrtko Ursulin wrote:
> >=20
> > On 16/07/2025 13:47, Ma=C3=ADra Canal wrote:
> > > Hi Tvrtko,
> > >=20
> > > On 16/07/25 05:48, Tvrtko Ursulin wrote:
> > > > The "skip reset" test waits for the timeout handler to run for
> > > > the
> > > > duration of 2 * MOCK_TIMEOUT, and because the mock scheduler
> > > > opted to
> > >=20
> > > Would it make any sense to wait for 1.5 * MOCK_TIMEOUT? This way
> > > we
> > > would guarantee that only one timeout happened. I'm fine with the
> > > current solution as well.
> >=20
> > 1.5 * MOCK_TIMEOUT would work as well. I considered it, and even
> > though=20
> > I thought it would be safe, I concluded that it is better to have
> > fewer=20
> > dependencies on timings given these are two threads in this story.
>=20
> Why not both? Just to make sure we won't run the timedout function
> twice, but still fixing the timing dependency by using
> DRM_MOCK_SCHED_JOB_RESET_SKIPPED.

I agree with Tvrtko that his approach with the new status is more
robust.

That said, I don't have a strong opinion about reducing the timeout
limit. But my feeling is that it running into the timeout (potentially)
twice is actually a good thing, because it could potentially catch more
issues if there are races etc. in the future.


P.

>=20
> >=20
> > Making the DRM_MOCK_SCHED_JOB_DONT_RESET persist allows for not
> > having=20
> > to think about timings. So slight preference to that. At least
> > until=20
> > some more advanced tests are attempted to be added.
> >=20
> > > > remove the "skip reset" flag once it fires, this gives
> > > > opportunity=20
> > > > for the
> > > > timeout handler to run twice. Second time the job will be
> > > > removed=20
> > > > from the
> > > > mock scheduler job list and the drm_mock_sched_advance() call
> > > > in the=20
> > > > test
> > > > will fail.
> > > >=20
> > > > Fix it by making the "don't reset" flag persist for the
> > > > lifetime of the
> > > > job and add a new flag to verify that the code path had
> > > > executed as
> > > > expected.
> > > >=20
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Fixes: 1472e7549f84 ("drm/sched: Add new test for=20
> > > > DRM_GPU_SCHED_STAT_NO_HANG")
> > > =C2=A0> Cc: Ma=C3=ADra Canal <mcanal@igalia.com>> Cc: Philipp Stanner=
=20
> > > <phasta@kernel.org>
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
> > > > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=
=A0 | 7 ++++---
> > > > =C2=A0 drivers/gpu/drm/scheduler/tests/tests_basic.c=C2=A0=C2=A0=C2=
=A0 | 4 ++--
> > > > =C2=A0 3 files changed, 7 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > b/=20
> > > > drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > index 65acffc3fea8..8e9ae7d980eb 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > @@ -219,7 +219,7 @@ mock_sched_timedout_job(struct
> > > > drm_sched_job=20
> > > > *sched_job)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (job->flags & DRM_MOCK_SCHED_JOB_=
DONT_RESET) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->flags &=3D ~DRM_MO=
CK_SCHED_JOB_DONT_RESET;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->flags |=3D DRM_MOC=
K_SCHED_JOB_RESET_SKIPPED;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return DRM_G=
PU_SCHED_STAT_NO_HANG;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > > b/drivers/=20
> > > > gpu/drm/scheduler/tests/sched_tests.h
> > > > index 63d4f2ac7074..5b262126b776 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > > +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > > @@ -95,9 +95,10 @@ struct drm_mock_sched_job {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct completion=C2=A0=C2=A0=C2=A0 =
done;
> > > > -#define DRM_MOCK_SCHED_JOB_DONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x1
> > > > -#define DRM_MOCK_SCHED_JOB_TIMEDOUT=C2=A0=C2=A0=C2=A0 0x2
> > > > -#define DRM_MOCK_SCHED_JOB_DONT_RESET=C2=A0=C2=A0=C2=A0 0x4
> > > > +#define DRM_MOCK_SCHED_JOB_DONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1
> > > > +#define DRM_MOCK_SCHED_JOB_TIMEDOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x2
> > > > +#define DRM_MOCK_SCHED_JOB_DONT_RESET=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x4
> > > > +#define DRM_MOCK_SCHED_JOB_RESET_SKIPPED=C2=A0=C2=A0=C2=A0 0x8
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flags;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head=C2=A0=C2=A0=C2=A0 l=
ink;
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > b/drivers/=20
> > > > gpu/drm/scheduler/tests/tests_basic.c
> > > > index 55eb142bd7c5..82a41a456b0a 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > > @@ -317,8 +317,8 @@ static void drm_sched_skip_reset(struct
> > > > kunit *test)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KUNIT_ASSERT_FALSE(test, done);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KUNIT_ASSERT_EQ(test,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 job->flags & DRM_MOCK_SCHED_JOB_RESET_SKIPPED,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 DRM_MOCK_SCHED_JOB_RESET_SKIPPED);
> > >=20
> > > Maybe we could assert that job->flags &
> > > DRM_MOCK_SCHED_JOB_TIMEDOUT =3D=3D 0
> >=20
> > Could but I am not sure it is needed.
>=20
> Np.
>=20
> >=20
> > > Anyway, thanks for the fix!
> > >=20
> > > Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >=20
> > Thank you!
> >=20
> > Btw the failure for the record:
> >=20
> > [09:07:20] # drm_sched_skip_reset: ASSERTION FAILED at
> > drivers/gpu/drm/=20
> > scheduler/tests/tests_basic.c:324
> > [09:07:20] Expected i =3D=3D 1, but
> > [09:07:20]=C2=A0=C2=A0=C2=A0=C2=A0 i =3D=3D 0 (0x0)
> > [09:07:20] [FAILED] drm_sched_skip_reset
> > [09:07:20]=C2=A0=C2=A0=C2=A0=C2=A0 # module: drm_sched_tests
> > [09:07:20] # drm_sched_basic_timeout_tests: pass:1 fail:1 skip:0
> > total:2
> > [09:07:20] # Totals: pass:1 fail:1 skip:0 total:2
>=20
> Unfortunately, I didn't get this error during my test run. On the
> other
> hand, I only ran it once before pushing the series, so that's on me.
> Thanks for catching it!
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D drm_mock_sched_advance(sched, =
1);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KUNIT_ASSERT_EQ(test, i, 1);
> > >=20
> >=20
>=20

