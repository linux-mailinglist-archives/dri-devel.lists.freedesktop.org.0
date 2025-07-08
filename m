Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151AAFC397
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A68A10E5A0;
	Tue,  8 Jul 2025 07:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="EBzpoXTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1210E5A0;
 Tue,  8 Jul 2025 07:08:14 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bbsdR1HpZz9t92;
 Tue,  8 Jul 2025 09:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751958491; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70N3YW8fP6eZo3Bo1iIQ335rKk457XoThpnAuKfCZyM=;
 b=EBzpoXTyB00zunsDSJ7ENQ7R/1aak1W/fuRytdr1cpziyeXVha9cAuwsu3Jd8zcPPs8fGA
 k4k3+v7olW2NpJOnaUK/kNAzMUraeWGg1ueJ6P72aWA3iXvlFJnxIV2ioDax3DO/0ld4V4
 UIvGEPGx1Bq3Iq8LErZAYra+2elOuYkK3qoxhuVbaRZPBT/Q4wQhbsCExfeU4ozZKs95Y7
 G0wjIReKBbIba7luvzuNrntXWItJrbb/+5U+vkOcQ0UCAac/r1D8UZkKb3SG9fLdlHgb8C
 7hzrhonILwEBUtRCdg7ER0kH8BcPfmEa/Qaj4ZDVlw1WwklwMF4zwD1c/y8fPg==
Message-ID: <ee9bfb85789496da980263289eadc2e0caa9043a.camel@mailbox.org>
Subject: Re: [PATCH v4 4/8] drm/sched: Add new test for
 DRM_GPU_SCHED_STAT_NO_HANG
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 09:08:05 +0200
In-Reply-To: <20250707-sched-skip-reset-v4-4-036c0f0f584f@igalia.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
 <20250707-sched-skip-reset-v4-4-036c0f0f584f@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 3g8n8nk1or37d4gnr89wpp1k1nktddzw
X-MBO-RS-ID: 42386457d86dcab1491
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

On Mon, 2025-07-07 at 11:46 -0300, Ma=C3=ADra Canal wrote:
> Add a test to submit a single job against a scheduler with the
> timeout
> configured and verify that if the job is still running, the timeout
> handler will skip the reset and allow the job to complete.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>


> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c |=C2=A0 5 +++
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c=C2=A0=C2=A0=C2=A0 | 4=
7
> ++++++++++++++++++++++++
> =C2=A03 files changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index
> 998162202972eb5919dfff4c8784ecc22c00ec9d..b3b33f85b7ae30c8e6bba97866a
> 74978b0a96fa7 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -231,6 +231,11 @@ mock_sched_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0	drm_sched_job_cleanup(sched_job);
> =C2=A0	/* Mock job itself is freed by the kunit framework. */
> =C2=A0
> +	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
> +		job->flags &=3D ~DRM_MOCK_SCHED_JOB_DONT_RESET;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}
> +
> =C2=A0	return DRM_GPU_SCHED_STAT_RESET;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index
> fbba38137f0c324cf2472fe5b3a8a78ec016e829..4adf961e1930203fe94241a8a0a
> e5f7817874a39 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -98,6 +98,7 @@ struct drm_mock_sched_job {
> =C2=A0
> =C2=A0#define DRM_MOCK_SCHED_JOB_DONE		0x1
> =C2=A0#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> +#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
> =C2=A0	unsigned long		flags;
> =C2=A0
> =C2=A0	struct list_head	link;
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index
> 41c648782f4548e202bd8711b45d28eead9bd0b2..91c0449590ed24c3da18ab7d930
> cca47d7c317c7 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -246,8 +246,55 @@ static void drm_sched_basic_timeout(struct kunit
> *test)
> =C2=A0	drm_mock_sched_entity_free(entity);
> =C2=A0}
> =C2=A0
> +static void drm_sched_skip_reset(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job *job;
> +	unsigned int i;
> +	bool done;
> +
> +	/*
> +	 * Submit a single job against a scheduler with the timeout
> configured
> +	 * and verify that if the job is still running, the timeout
> handler
> +	 * will skip the reset and allow the job to complete.
> +	 */
> +
> +	entity =3D drm_mock_sched_entity_new(test,
> +					=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +					=C2=A0=C2=A0 sched);
> +	job =3D drm_mock_sched_job_new(test, entity);
> +
> +	job->flags =3D DRM_MOCK_SCHED_JOB_DONT_RESET;
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done =3D drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, 2 *
> MOCK_TIMEOUT);
> +	KUNIT_ASSERT_FALSE(test, done);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
> +			0);
> +
> +	i =3D drm_mock_sched_advance(sched, 1);
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> =C2=A0static struct kunit_case drm_sched_timeout_tests[] =3D {
> =C2=A0	KUNIT_CASE(drm_sched_basic_timeout),
> +	KUNIT_CASE(drm_sched_skip_reset),
> =C2=A0	{}
> =C2=A0};
> =C2=A0
>=20

