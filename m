Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B27A33FFB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4C010E027;
	Thu, 13 Feb 2025 13:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="kjLBkOy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCB810EA92
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:12:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Ytwb30G6Pz9tcN;
 Thu, 13 Feb 2025 14:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739452367; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XT0n87374l13x39N+939smZHXeqmff21otJuuw4uCR8=;
 b=kjLBkOy+q5b6cO0dEpEda4TR5Ycy2UOzoJMqVSYT2oZPPTRx7Oh91JFEzCLDuzRH8pukJi
 XP6eJ/u3mtXm7KEvnNcIHRwZd2Gog3U1KovyKoK/CIkcX/s7IKg+HVP8TViG63aCF8mYkJ
 nzVGFINFTpZ3gZtDgiKc+wiS7J1ddOe00vHKWsLf1ZHUUUUOHpqMxwGMxDH+lWDQ7ytM2P
 YA4WPICAx1wln6/buxNaguO0b2ZJCZNtpftKdb2eKXKcmCFQsIfSP65ZvJp6s4ZcGBMxN3
 SQpkutzIYOw9k8UHD4Sn2cHjKsqZfJkLXH+JXbaInWzoJzRxdm66QzykAoHSiQ==
Message-ID: <1abfcdf350e15d622603ed06937e16c36e5050e9.camel@mailbox.org>
Subject: Re: [RFC 5/5] drm/scheduler: Add a basic test for modifying
 entities scheduler list
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Thu, 13 Feb 2025 14:12:44 +0100
In-Reply-To: <20250207143337.60154-6-tvrtko.ursulin@igalia.com>
References: <20250207143337.60154-1-tvrtko.ursulin@igalia.com>
 <20250207143337.60154-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: xu4dspaizojgydc68yi4iuaxxntr1opb
X-MBO-RS-ID: b2e7742de3544740e68
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

On Fri, 2025-02-07 at 14:33 +0000, Tvrtko Ursulin wrote:
> Add a basic test for exercising modifying the entities scheduler list
> at
> runtime.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0.../scheduler/tests/drm_sched_tests_basic.c=C2=A0=C2=A0 | 73
> ++++++++++++++++++-
> =C2=A01 file changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> index 9b6bb8b6b98e..af91e4ebd397 100644
> --- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> @@ -340,6 +340,77 @@ static struct kunit_suite drm_sched_priority =3D {
> =C2=A0	.test_cases =3D drm_sched_priority_tests,
> =C2=A0};
> =C2=A0
> +static void drm_sched_test_modify_sched(struct kunit *test)

I'm still confused about the naming convention tbh.

Some things are called drm_mock_*, and this is called drm_sched_test_*

What's the naming system / background?

P.

> +{
> +	unsigned int i, cur_ent =3D 0, cur_sched =3D 0;
> +	struct drm_mock_sched_entity *entity[13];
> +	struct drm_mock_scheduler *sched[3];
> +	struct drm_mock_sched_job *job;
> +	const unsigned int qd =3D 1000;
> +	bool done;
> +
> +	/*
> +	 * Submit a bunch of jobs against entities configured with
> different
> +	 * schedulers and while waiting for them to complete,
> periodically keep
> +	 * changing schedulers associated with each entity.
> +	 *
> +	 * We set up the queue-depth (qd) and job duration so the
> sched modify
> +	 * loop has some time to interact with submissions to the
> backend and
> +	 * job completions as they progress.
> +	 *
> +	 * For the number of schedulers and entities we use primes
> in order to
> +	 * perturb the entity->sched assignments with less of a
> regular pattern.
> +	 */
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sched); i++)
> +		sched[i] =3D drm_mock_new_scheduler(test,
> MAX_SCHEDULE_TIMEOUT);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		entity[i] =3D drm_mock_new_sched_entity(test,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched[i %
> ARRAY_SIZE(sched)]);
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
> +		struct drm_gpu_scheduler *modify;
> +
> +		usleep_range(200, 500);
> +		cur_ent++;
> +		cur_ent %=3D ARRAY_SIZE(entity);
> +		cur_sched++;
> +		cur_sched %=3D ARRAY_SIZE(sched);
> +		modify =3D &sched[cur_sched]->base;
> +		drm_sched_entity_modify_sched(&entity[cur_ent]-
> >base, &modify,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1);
> +	} while (!drm_mock_sched_job_is_finished(job));
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sched); i++)
> +		drm_mock_scheduler_fini(sched[i]);
> +}
> +
> +static struct kunit_case drm_sched_modify_sched_tests[] =3D {
> +	KUNIT_CASE(drm_sched_test_modify_sched),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_modify_sched =3D {
> +	.name =3D "drm_sched_basic_modify_sched_tests",
> +	.test_cases =3D drm_sched_modify_sched_tests,
> +};
> +
> =C2=A0kunit_test_suites(&drm_sched_basic,
> =C2=A0		=C2=A0 &drm_sched_timeout,
> -		=C2=A0 &drm_sched_priority);
> +		=C2=A0 &drm_sched_priority,
> +		=C2=A0 &drm_sched_modify_sched);

