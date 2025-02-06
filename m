Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608BA2A3F3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 10:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DA310E1EF;
	Thu,  6 Feb 2025 09:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="SCzeB43C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D29810E1EF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 09:13:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YpWbY60X8z9tL7;
 Thu,  6 Feb 2025 10:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1738833177; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iz7wM7dQzWFzzWJwm8k2G/ckVEiWvdStblOwnQTXL9M=;
 b=SCzeB43CQEwr8nbD+E8ksjfgb45krhLyK69lhL+iRQuST//ZH4PzjulQ6Arnrc6LLpmMm8
 u5jtk9QyW3WjstewBqaTNxht87PIsV+oMDE+5i4TyNo/uqe2+uwhnaP05S7Y0ldaOix0pJ
 fyIF1xFP+uf/JJuApu7TJxBByDBxDDnqyBAzwKRBOiWP3kIG/HN2KlfHMedBif7OwZ5t8l
 3HnNfta8FlJqe1DJWr5oHxLFnTJvPLJaFxjCxYGLfZHVM/LEsBhhYFryp2sohwn2bGpSY2
 QQoh/O2qLuTLd+gOowcG4jquYDbfrMdiNH5xz5ZDtZVIgDFQ9m7i6yR9UeH1yw==
Message-ID: <b0ac436fd214d6741490b17c4613765a8da5028f.camel@mailbox.org>
Subject: Re: [RFC 0/5] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Thu, 06 Feb 2025 10:12:54 +0100
In-Reply-To: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
References: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 586240edfabf1a4d266
X-MBO-RS-META: jd4bc9pge9mtjj5wkxp81tfexze6gncw
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

On Mon, 2025-02-03 at 15:30 +0000, Tvrtko Ursulin wrote:
> There has repeatedly been quite a bit of apprehension when any change
> to the DRM
> scheduler is proposed, with two main reasons being code base is
> considered
> fragile, not well understood and not very well documented, and
> secondly the lack
> of systematic testing outside the vendor specific tests suites and/or
> test
> farms.
>=20
> This RFC is an attempt to dislodge this status quo by adding some
> unit tests
> using the kunit framework.
>=20
> General approach is that there is a mock "hardware" backend which can
> be
> controlled from tests, which in turn allows exercising various
> scheduler code
> paths.
>=20
> I am sending this early as an RFC so we can get alignment on the
> general idea
> and high level approach. Once past that point we can polish and then
> hopefully
> people can go crazy and start adding more advanced tests, testing
> corner cases
> and what not.
>=20
> Only some simple basic tests get added in the series and hopefully it
> is easy to
> understand what tests are doing.
>=20
> My usage of the kunit framework may not be perfect though, since this
> series is
> my first attempt to use it.
>=20
> An obligatory "screenshot" for reference:
>=20
> [15:16:33] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tests (6 =
subtests)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:33] [PASSED] drm_sched_basic_submit
> [15:16:33] [PASSED] drm_sched_basic_queue
> [15:16:34] [PASSED] drm_sched_basic_chain
> [15:16:34] [PASSED] drm_sched_basic_entities
> [15:16:34] [PASSED] drm_sched_basic_entities_chain
> [15:16:34] [PASSED] drm_sched_basic_entity_cleanup
> [15:16:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tdr_tests (1 su=
btest)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:36] [PASSED] drm_sched_basic_tdr
> [15:16:36] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_=
tdr_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:36] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (2 subtes=
ts)
> =3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:37] [PASSED] drm_sched_priorities
> [15:16:37] [PASSED] drm_sched_change_priority
> [15:16:37] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_priority_=
tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:37] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests (1 subte=
st)
> =3D=3D=3D=3D=3D=3D
> [15:16:39] [PASSED] drm_sched_test_modify_sched
> [15:16:39] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_modify_sched_te=
sts
> =3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:39]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:16:39] Testing complete. Ran 10 tests: passed: 10
> [15:16:39] Elapsed time: 13.442s total, 0.001s configuring, 4.117s
> building, 9.248s running

Thanks for working on this =E2=80=93 as Christian said, this is really need=
ed.
I took a first look and don't see any big obstacles right now. I'll
apply some comments at the places so you have some early feedback
already


Thx,
P.



>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
>=20
> Tvrtko Ursulin (5):
> =C2=A0 drm: Move some options to separate new Kconfig.debug
> =C2=A0 drm/scheduler: Add scheduler unit testing infrastructure and some
> =C2=A0=C2=A0=C2=A0 basic tests
> =C2=A0 drm/scheduler: Add a simple TDR test
> =C2=A0 drm/scheduler: Add basic priority tests
> =C2=A0 drm/scheduler: Add a basic test for modifying entities scheduler
> list
>=20
> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 98 +---
> =C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 104 ++++
> =C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +
> =C2=A0.../gpu/drm/scheduler/tests/drm_mock_entity.c |=C2=A0 29 ++
> =C2=A0.../gpu/drm/scheduler/tests/drm_mock_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0.../drm/scheduler/tests/drm_mock_scheduler.c=C2=A0 | 260 ++++++++++
> =C2=A0.../gpu/drm/scheduler/tests/drm_sched_tests.h | 128 +++++
> =C2=A0.../scheduler/tests/drm_sched_tests_basic.c=C2=A0=C2=A0 | 464
> ++++++++++++++++++
> =C2=A010 files changed, 1010 insertions(+), 93 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_entity.=
c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_job.c
> =C2=A0create mode 100644
> drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_sched_tests.=
h
> =C2=A0create mode 100644
> drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>=20

