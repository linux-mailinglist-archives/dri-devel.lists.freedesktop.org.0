Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36FEA4C25C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E4310E2D7;
	Mon,  3 Mar 2025 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UYLzW0V8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CE010E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:49:05 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z60XY0lD4z9swL;
 Mon,  3 Mar 2025 14:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741009741; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecS1hy0iYkf8+ncN4zxhJ92Uod7/hIg9ZXNFQLGwTvU=;
 b=UYLzW0V8ycLoh5qJ7iG7Wc+3XM9abicnx4xcey30c2fm/M0gMaqasqGp5tLVbEocjeETyX
 nZjUip9umyc1Se504HyJHl4JxHiLHo8XqaWXWpC5GlWROFz+1OrYcHpqHVHbpCGOngN7yN
 8KsXrP2pmrB/jg53xbKvhBHiqi0Fnvw6XypJRMr7ip0DkvqgfDdjMVpJajRyJTUsdoUQRY
 6c+ksyyB87o8bDg+eyzFzfGBd9cCUP/ngTNm39Kb6NjvVscrc3BXXLSoJFfxFt2l7MQySg
 zpKmYSQD37fE+qMxqs2oF0IWJTZnuff/g09ok9eSfKweSURkE+1bBJSWxWlqkw==
Message-ID: <469468f3869263703ea8791830b58f6447efae27.camel@mailbox.org>
Subject: Re: [PATCH v2 3/5] drm/scheduler: Add a simple timeout test
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Mon, 03 Mar 2025 14:48:56 +0100
In-Reply-To: <20250221120917.80617-4-tvrtko.ursulin@igalia.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <20250221120917.80617-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 5eiyh3ya1ort8oxchjp94pcpwozigz1r
X-MBO-RS-ID: 4700a9e694fd3441e31
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
> Add a very simple timeout test which submits a single job and
> verifies
> that the timeout handling will run if the backend failed to complete
> the
> job in time.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 13 +++-
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 64
> ++++++++++++++++++-
> =C2=A03 files changed, 77 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index d73a9f0337da..427ce29354d0 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -193,7 +193,11 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0mock_sched_timedout_job(struct drm_sched_job *sched_job)
> =C2=A0{
> -	return DRM_GPU_SCHED_STAT_ENODEV;
> +	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> +
> +	job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> =C2=A0
> =C2=A0static void mock_sched_free_job(struct drm_sched_job *sched_job)
> @@ -211,17 +215,20 @@ static const struct drm_sched_backend_ops
> drm_mock_scheduler_ops =3D {
> =C2=A0 * drm_mock_new_scheduler - Create a new mock scheduler
> =C2=A0 *
> =C2=A0 * @test: KUnit test owning the job
> + * @timeout: Job timeout to set
> =C2=A0 *
> =C2=A0 * Returns: New mock scheduler with allocation managed by the test
> =C2=A0 */
> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit

-> =E2=80=A6_scheduler_new()

As said in the previous thread, I think that if you want to introduce
the new prefix drm_mock_, then it should always be followed by the DRM
subcomponent, so that it can be congruent across DRM.


> *test)
> +struct drm_mock_scheduler *
> +drm_mock_new_scheduler(struct kunit *test,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long timeout)

fits on one line

> =C2=A0{
> =C2=A0	struct drm_sched_init_args args =3D {
> =C2=A0		.ops		=3D &drm_mock_scheduler_ops,
> =C2=A0		.num_rqs	=3D DRM_SCHED_PRIORITY_COUNT,
> =C2=A0		.credit_limit	=3D U32_MAX,
> =C2=A0		.hang_limit	=3D UINT_MAX,
> -		.timeout	=3D MAX_SCHEDULE_TIMEOUT,
> +		.timeout	=3D timeout,
> =C2=A0		.name		=3D "drm-mock-scheduler",
> =C2=A0	};
> =C2=A0	struct drm_mock_scheduler *sched;
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 0614bc901dd1..258fec748ca7 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -88,6 +88,9 @@ struct drm_mock_sched_entity {
> =C2=A0struct drm_mock_sched_job {
> =C2=A0	struct drm_sched_job	base;
> =C2=A0
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT 0x1

Why's that defined here within the struct's body? Better move it above


P.


> +	unsigned long		flags;
> +
> =C2=A0	struct list_head	link;
> =C2=A0	struct hrtimer		timer;
> =C2=A0
> @@ -118,7 +121,8 @@ drm_sched_job_to_mock_job(struct drm_sched_job
> *sched_job)
> =C2=A0	return container_of(sched_job, struct drm_mock_sched_job,
> base);
> =C2=A0};
> =C2=A0
> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
> *test);
> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
> *test,
> +						=C2=A0 long timeout);
> =C2=A0void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
> =C2=A0unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
> *sched,
> =C2=A0				=C2=A0=C2=A0=C2=A0 unsigned int num);
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index c12368a22a39..023143b80d78 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -11,7 +11,7 @@
> =C2=A0
> =C2=A0static int drm_sched_basic_init(struct kunit *test)
> =C2=A0{
> -	test->priv =3D drm_mock_new_scheduler(test);
> +	test->priv =3D drm_mock_new_scheduler(test,
> MAX_SCHEDULE_TIMEOUT);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -23,6 +23,13 @@ static void drm_sched_basic_exit(struct kunit
> *test)
> =C2=A0	drm_mock_scheduler_fini(sched);
> =C2=A0}
> =C2=A0
> +static int drm_sched_timeout_init(struct kunit *test)
> +{
> +	test->priv =3D drm_mock_new_scheduler(test, HZ);
> +
> +	return 0;
> +}
> +
> =C2=A0static void drm_sched_basic_submit(struct kunit *test)
> =C2=A0{
> =C2=A0	struct drm_mock_scheduler *sched =3D test->priv;
> @@ -194,4 +201,57 @@ static struct kunit_suite drm_sched_basic =3D {
> =C2=A0	.test_cases =3D drm_sched_basic_tests,
> =C2=A0};
> =C2=A0
> -kunit_test_suite(drm_sched_basic);
> +static void drm_sched_basic_timeout(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job *job;
> +	bool done;
> +
> +	/*
> +	 * Submit a single job against a scheduler with the timeout
> configured
> +	 * and verify that the timeout handling will run if the
> backend fails
> +	 * to complete it in time.
> +	 */
> +
> +	entity =3D drm_mock_new_sched_entity(test,
> +					=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +					=C2=A0=C2=A0 sched);
> +	job =3D drm_mock_new_sched_job(test, entity);
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done =3D drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ / 2);
> +	KUNIT_ASSERT_EQ(test, done, false);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			0);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, false);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> +static struct kunit_case drm_sched_timeout_tests[] =3D {
> +	KUNIT_CASE(drm_sched_basic_timeout),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_timeout =3D {
> +	.name =3D "drm_sched_basic_timeout_tests",
> +	.init =3D drm_sched_timeout_init,
> +	.exit =3D drm_sched_basic_exit,
> +	.test_cases =3D drm_sched_timeout_tests,
> +};
> +
> +kunit_test_suites(&drm_sched_basic,
> +		=C2=A0 &drm_sched_timeout);

