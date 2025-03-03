Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC11A4C262
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E810E2D5;
	Mon,  3 Mar 2025 13:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZU4Ete9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC710E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:50:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Z60Zc3ZMzz9sdr;
 Mon,  3 Mar 2025 14:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741009848; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HSmekvCkProCnrDcX04UGasBm5PI6HO2nEe/WS0Q5U=;
 b=ZU4Ete9q+Xcq4R7XOlFGcdMy5Fey71Xf8xNBwbinYoEzuVT+TQnf2F40bDkvR0Bk64stT5
 b9EvEcenI4qKMxwbWjQ8yzzuytNbiB/tFQvYwD/hJoODl+n7imgDTYfKmrIA9/2nXHCt22
 acnIpWzqlsXwhfJVptBDhk0LSUugMee7k6iwtzWfHaU/AOOkRvzUOl5OIA2qvorVHQHfbv
 khZCd+NmFps2fGlPYU7NPktmlWrwcFPYRvGgHnFfdESSpC/G2o1Y1yEFVT93jRcRpLXvDU
 PTI72Y/gz7+zbhXnVEwiuhDEvljG5K6nv4zQu6mqCbEn68TtiICdHe2zOwLsVw==
Message-ID: <13d235f3941d4dcda54f1e51585c2e60e7a88295.camel@mailbox.org>
Subject: Re: [PATCH v2 4/5] drm/scheduler: Add basic priority tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 03 Mar 2025 14:50:46 +0100
In-Reply-To: <20250221120917.80617-5-tvrtko.ursulin@igalia.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <20250221120917.80617-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: j35dwbkxexuysjyygnhn6w97roqh9f8r
X-MBO-RS-ID: 17ea4c40e58caaa959e
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
> Add some basic tests for exercising entity priority handling.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 99
> ++++++++++++++++++-
> =C2=A01 file changed, 98 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 023143b80d78..f0e5ae1220c7 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -1,5 +1,7 @@
> =C2=A0// SPDX-License-Identifier: GPL-2.0
> =C2=A0
> +#include <linux/delay.h>
> +
> =C2=A0#include "sched_tests.h"
> =C2=A0
> =C2=A0/*
> @@ -253,5 +255,100 @@ static struct kunit_suite drm_sched_timeout =3D {
> =C2=A0	.test_cases =3D drm_sched_timeout_tests,
> =C2=A0};
> =C2=A0
> +static void drm_sched_priorities(struct kunit *test)
> +{
> +	struct drm_mock_sched_entity
> *entity[DRM_SCHED_PRIORITY_COUNT];
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_job *job;
> +	const unsigned int qd =3D 100;
> +	unsigned int i, cur_ent =3D 0;
> +	enum drm_sched_priority p;
> +	bool done;
> +
> +	/*
> +	 * Submit a bunch of jobs against entities configured with
> different
> +	 * priorities.
> +	 */

Same as in patch 2, better have it above the function, since it
describes the entire function's purpose.

> +
> +	BUILD_BUG_ON(DRM_SCHED_PRIORITY_KERNEL >
> DRM_SCHED_PRIORITY_LOW);
> +	BUILD_BUG_ON(ARRAY_SIZE(entity) !=3D
> DRM_SCHED_PRIORITY_COUNT);
> +
> +	for (p =3D DRM_SCHED_PRIORITY_KERNEL; p <=3D
> DRM_SCHED_PRIORITY_LOW; p++)
> +		entity[p] =3D drm_mock_new_sched_entity(test, p,
> sched);
> +
> +	for (i =3D 0; i < qd; i++) {
> +		job =3D drm_mock_new_sched_job(test,
> entity[cur_ent++]);
> +		cur_ent %=3D ARRAY_SIZE(entity);
> +		drm_mock_sched_job_set_duration_us(job, 1000);
> +		drm_mock_sched_job_submit(job);
> +	}
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +}
> +
> +static void drm_sched_change_priority(struct kunit *test)
> +{
> +	struct drm_mock_sched_entity
> *entity[DRM_SCHED_PRIORITY_COUNT];
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_job *job;
> +	const unsigned int qd =3D 1000;
> +	unsigned int i, cur_ent =3D 0;
> +	enum drm_sched_priority p;
> +	bool done;
> +
> +	/*
> +	 * Submit a bunch of jobs against entities configured with
> different
> +	 * priorities and while waiting for them to complete,
> periodically keep
> +	 * changing their priorities.
> +	 *
> +	 * We set up the queue-depth (qd) and job duration so the
> priority
> +	 * changing loop has some time to interact with submissions
> to the
> +	 * backend and job completions as they progress.
> +	 */

Same


P.

> +
> +	for (p =3D DRM_SCHED_PRIORITY_KERNEL; p <=3D
> DRM_SCHED_PRIORITY_LOW; p++)
> +		entity[p] =3D drm_mock_new_sched_entity(test, p,
> sched);
> +
> +	for (i =3D 0; i < qd; i++) {
> +		job =3D drm_mock_new_sched_job(test,
> entity[cur_ent++]);
> +		cur_ent %=3D ARRAY_SIZE(entity);
> +		drm_mock_sched_job_set_duration_us(job, 1000);
> +		drm_mock_sched_job_submit(job);
> +	}
> +
> +	do {
> +		drm_sched_entity_set_priority(&entity[cur_ent]-
> >base,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (entity[cur_ent]-
> >base.priority + 1) %
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_COUNT);
> +		cur_ent++;
> +		cur_ent %=3D ARRAY_SIZE(entity);
> +		usleep_range(200, 500);
> +	} while (!drm_mock_sched_job_is_finished(job));
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +}
> +
> +static struct kunit_case drm_sched_priority_tests[] =3D {
> +	KUNIT_CASE(drm_sched_priorities),
> +	KUNIT_CASE(drm_sched_change_priority),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_priority =3D {
> +	.name =3D "drm_sched_basic_priority_tests",
> +	.init =3D drm_sched_basic_init,
> +	.exit =3D drm_sched_basic_exit,
> +	.test_cases =3D drm_sched_priority_tests,
> +};
> +
> =C2=A0kunit_test_suites(&drm_sched_basic,
> -		=C2=A0 &drm_sched_timeout);
> +		=C2=A0 &drm_sched_timeout,
> +		=C2=A0 &drm_sched_priority);

