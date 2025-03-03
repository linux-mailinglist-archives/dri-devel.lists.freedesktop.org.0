Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C7A4C277
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2A610E3EA;
	Mon,  3 Mar 2025 13:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Fdtta1Eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650AD10E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:55:32 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Z60h13DvCz9sdr;
 Mon,  3 Mar 2025 14:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741010129; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vk+6a1Unq+uyRHG0Cu9QyXQXVAVHXzZRpHx4NWylBU=;
 b=Fdtta1EuUyXOvkoa+oxSUGepcexRhmbO7fs4nv9TIx2SMbJxS1ny6yOsCZznTS4GieuKtZ
 wLL2Xc0u8Yz21Oyx1UdPUoVC2dSCymomQe61IhpqM3jgkRF5B+FZp27Iv/gLfzUokQ/hVg
 e0pe9A8cwFYENnLEbYHAEFbC6KDRQ/IJN16Usz6LgBd0Y3b96VMrWFH+LVmGYD8gq6WzVV
 TDJLmo/LhbVKNSaG8QAc3vpA6rdvRVJuneQB9zk/Pnt0m6UpSBMfQrPQp5s165H21TwLMV
 ARTn/Zjc0cIpjcZJQuMm1gKLBHQGtAqJ8zhCuAzqv5rpjoni6mZK5TY4T9+dBA==
Message-ID: <8b33a97d55942a1ef9a1e400c6b5af89e9219140.camel@mailbox.org>
Subject: Re: [PATCH v2 5/5] drm/scheduler: Add a basic test for modifying
 entities scheduler list
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 03 Mar 2025 14:55:27 +0100
In-Reply-To: <20250221120917.80617-6-tvrtko.ursulin@igalia.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <20250221120917.80617-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 1z4nxarmt9st43n6s3p8py5qz5te7qwp
X-MBO-RS-ID: fe224da5de2d1869da4
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
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 73
> ++++++++++++++++++-
> =C2=A01 file changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index f0e5ae1220c7..2744a8c262c4 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -349,6 +349,77 @@ static struct kunit_suite drm_sched_priority =3D {
> =C2=A0	.test_cases =3D drm_sched_priority_tests,
> =C2=A0};
> =C2=A0
> +static void drm_sched_test_modify_sched(struct kunit *test)
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

Move above.


Besides looks quite nice by now

P.

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

