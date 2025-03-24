Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D7A6D7CE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 10:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B210E269;
	Mon, 24 Mar 2025 09:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KeEpsINY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEFB10E297
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:44:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZLp7B0FMYz9sWY;
 Mon, 24 Mar 2025 10:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1742809494; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru4CCbg6Y/Tj9bqSHbOh2o/ktUyX98m86cqqQVnE6tQ=;
 b=KeEpsINYJbgLfljNeT9ALaByBi0rS8kd5NzF4XBq1ghe8KJi51FToNSJJpfLnFOuPDnuqO
 8h3CiVg965kVOEiOTrbZmAoRL7y5Ry/qXikMksHgl8WzoYcj8FQ6mvxh11pWtm9t/iVGx2
 2b0DkaRHtJPsyJXG1ljsULua8GwhqR3oTQHcRwNMrW6KXnbb6k/a2R+UGFJPvbB9CSEbjV
 oK3FvXAJXEqLGIPxulnRwZ45ochuyczb6CRT0da7KGAGvIOxIGg+U+m4fEKnaIEIuL6xNT
 JgZjb2If1IvGfBE3GSdFfa3RE5WZCGTBU34U1NKsWo6XdL1BbzSS32Joq/R2Fw==
Message-ID: <e27314e492f0e264e19b3cd008b4f941db13d005.camel@mailbox.org>
Subject: Re: [PATCH v10 0/6] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 24 Mar 2025 10:44:52 +0100
In-Reply-To: <20250324092633.49746-1-tvrtko.ursulin@igalia.com>
References: <20250324092633.49746-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e326061d1e8ea1705f0
X-MBO-RS-META: f6cs74kz17acm5j3i844o4ubakpujnp5
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

On Mon, 2025-03-24 at 09:26 +0000, Tvrtko Ursulin wrote:
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
> [14:09:05] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tests (3 =
subtests)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:06] [PASSED] drm_sched_basic_submit
> [14:09:06] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sch=
ed_basic_test=C2=A0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:06] [PASSED] A queue of jobs in a single entity
> [14:09:06] [PASSED] A chain of dependent jobs across multiple
> entities
> [14:09:06] [PASSED] Multiple independent job queues
> [14:09:06] [PASSED] Multiple inter-dependent job queues
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:07] [PASSED] drm_sched_basic_entity_cleanup
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_timeout_tests (1 subt=
est)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:08] [PASSED] drm_sched_basic_timeout
> [14:09:08] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_timeou=
t_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:08] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (2 subtes=
ts)
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:10] [PASSED] drm_sched_priorities
> [14:09:10] [PASSED] drm_sched_change_priority
> [14:09:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_priority_=
tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:10] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests (1 subte=
st)
> =3D=3D=3D=3D=3D=3D
> [14:09:11] [PASSED] drm_sched_test_modify_sched
> [14:09:11] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_modify_sched_te=
sts
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:11] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_credits_tests (1 subt=
est)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12] [PASSED] drm_sched_test_credits
> [14:09:12] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_credit=
s_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12] Testing complete. Ran 11 tests: passed: 11
> [14:09:13] Elapsed time: 13.539s total, 0.001s configuring, 3.004s
> building, 10.462s running
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
> v3:
> =C2=A0* Some mock API renames, kerneldoc grammar fixes and indentation
> fixes.
>=20
> v4:
> =C2=A0* Fix use after free caused by relying on scheduler fence for
> querying status.
> =C2=A0* Kerneldoc fixes.
>=20
> v5:
> =C2=A0* Cleanup in-flight jobs on scheduler shutdown.
> =C2=A0* Change hang_limit to 1.
>=20
> v6:
> =C2=A0* Use KUNIT_ASSERT_TRUE/FALSE.
> =C2=A0* Fixed patch titles.
> =C2=A0* Added credit_limit test.
> =C2=A0* Added CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL.
>=20
> v7:
> =C2=A0* v6 omitted to send the first patch by mistake.
>=20
> v8:
> =C2=A0* Removed CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL for now.
> =C2=A0* Added Christian's acks.
>=20
> v9:
> =C2=A0* Fixed a potential memory leak caused by a race condition on mock
> scheduler
> =C2=A0=C2=A0 shutdown. In order to reliably clean up everything, we have =
keep
> track of
> =C2=A0=C2=A0 jobs even past the signalling stage, all until either DRM sc=
hed
> core managed
> =C2=A0=C2=A0 to run the ->free_job() callback, or until mock scheduler te=
ardown
> from the
> =C2=A0=C2=A0 test.
>=20
> v10:
> =C2=A0* Rebase for a merge conflict in Kconfig.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
>=20
> Tvrtko Ursulin (6):
> =C2=A0 drm: Move some options to separate new Kconfig
> =C2=A0 drm/sched: Add scheduler unit testing infrastructure and some basi=
c
> =C2=A0=C2=A0=C2=A0 tests
> =C2=A0 drm/sched: Add a simple timeout test
> =C2=A0 drm/sched: Add basic priority tests
> =C2=A0 drm/sched: Add a basic test for modifying entities scheduler list
> =C2=A0 drm/sched: Add a basic test for checking credit limit
>=20
> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 110 +---
> =C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 116 +++++
> =C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 359 ++++++++++=
+++
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h | 226 +++++++++
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 476
> ++++++++++++++++++
> =C2=A08 files changed, 1203 insertions(+), 105 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
>=20


Applied to drm-misc-next

Thanks for your endurance!
P.

