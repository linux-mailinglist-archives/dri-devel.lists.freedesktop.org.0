Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61348A4C29F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0C910E42F;
	Mon,  3 Mar 2025 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jZMzuiKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF1210E42F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:59:02 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z60m22stVz9sTk;
 Mon,  3 Mar 2025 14:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741010338; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMdxrfTJ0zfSY4MwlghqUoVMFMfVT3EwPKIqvmpQm6k=;
 b=jZMzuiKbV9VQCR9SJMYTsHmkwSpmbcV3oydeb2poL1E2CW7btzPbbmJvI6lG4De7VQCYhG
 8ez9byQweOU/x245DDc9O8EgwREs/VjwozXmr4OyUfIIdxi0j344itkRwylAu71c8be45F
 WMVfi8owTYVygmm1DfueX4gCTo/9DSjNUSMG3kCAIvbPc5+l/vkdtfqo8m0AeCnZ6FgcU9
 ek3+2d/KNRaonmKPFoSVc5W/n4MF0VT/Y/4GkNqaRqe0KZiUktA/ORm0+nn4EP6NSYFTSW
 r14dvZ3vRHuDyhOQ62FnKjLzqgJKy5lcAby9xJYnuwC1agMlfX40tIBZq7MAcA==
Message-ID: <3163eb252a5fd3ceeec42fb3b369e18dd94a8419.camel@mailbox.org>
Subject: Re: [PATCH v2 0/5] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 03 Mar 2025 14:58:56 +0100
In-Reply-To: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: whzo643e65t5dzh8jugxa17jds1y7ne4
X-MBO-RS-ID: aaf375bbf90114c2dbd
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

On Fri, 2025-02-21 at 12:09 +0000, Tvrtko Ursulin wrote:
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
> This series is an attempt to dislodge this status quo by adding some
> unit tests
> using the kunit framework.
>=20
> General approach is that there is a mock "hardware" backend which can
> be
> controlled from tests, which in turn allows exercising various
> scheduler code
> paths.
>=20
> Only some simple basic tests get added in the series and hopefully it
> is easy to
> understand what tests are doing.
>=20
> An obligatory "screenshot" for reference:
>=20
> [14:29:37] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tests (3 =
subtests)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:38] [PASSED] drm_sched_basic_submit
> [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sch=
ed_basic_test=C2=A0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:38] [PASSED] A queue of jobs in a single entity
> [14:29:38] [PASSED] A chain of dependent jobs across multiple
> entities
> [14:29:38] [PASSED] Multiple independent job queues
> [14:29:38] [PASSED] Multiple inter-dependent job queues
> [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:38] [PASSED] drm_sched_basic_entity_cleanup
> [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:38] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_timeout_tests (1 subt=
est)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:40] [PASSED] drm_sched_basic_timeout
> [14:29:40] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_timeou=
t_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:40] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (2 subtes=
ts)
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:42] [PASSED] drm_sched_priorities
> [14:29:42] [PASSED] drm_sched_change_priority
> [14:29:42] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_priority_=
tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:42] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests (1 subte=
st)
> =3D=3D=3D=3D=3D=3D
> [14:29:43] [PASSED] drm_sched_test_modify_sched
> [14:29:43] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_modify_sched_te=
sts
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:43]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:29:43] Testing complete. Ran 10 tests: passed: 10
> [14:29:43] Elapsed time: 13.330s total, 0.001s configuring, 4.005s
> building, 9.276s running
>=20
> v2:
> =C2=A0* Parameterize a bunch of similar tests.
> =C2=A0* Improve test commentary.
> =C2=A0* Rename TDR test to timeout. (Christian)
> =C2=A0* Improve quality and consistency of naming. (Philipp)
>=20
> RFC v2 -> series v1:
> =C2=A0* Rebased for drm_sched_init changes.
> =C2=A0* Fixed modular build.
> =C2=A0* Added some comments.
> =C2=A0* Filename renames. (Philipp)
>=20
> v2:
> =C2=A0* Dealt with a bunch of checkpatch warnings.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
>=20
> Tvrtko Ursulin (5):
> =C2=A0 drm: Move some options to separate new Kconfig

Scheduler people aren't on CC in that patch. Would be nice to be on CC,
too, for completeness in the mailbox and since I think that the
scheduler maintainers would take the entire series, unless Dave and
Sima guard the kconfig in some way

Has there been any feedback by the two yet IRW the config changes?

Thanks
P.

> =C2=A0 drm/scheduler: Add scheduler unit testing infrastructure and some
> =C2=A0=C2=A0=C2=A0 basic tests
> =C2=A0 drm/scheduler: Add a simple timeout test
> =C2=A0 drm/scheduler: Add basic priority tests
> =C2=A0 drm/scheduler: Add a basic test for modifying entities scheduler
> list
>=20
> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 109 +----
> =C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 115 +++++
> =C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 324 ++++++++++=
+++
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h | 222 +++++++++
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 425
> ++++++++++++++++++
> =C2=A08 files changed, 1111 insertions(+), 104 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
>=20

