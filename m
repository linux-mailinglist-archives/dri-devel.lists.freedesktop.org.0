Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC74BCC6E9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2710EBA4;
	Fri, 10 Oct 2025 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NvagZQ0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354210EBA4;
 Fri, 10 Oct 2025 09:48:23 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cjhkr47Brz9tPV;
 Fri, 10 Oct 2025 11:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760089700; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOEQ9laQBhR5Fb5lmsZxPH0vjybXgRB6Y9xjLaTRbTs=;
 b=NvagZQ0g08YiFVO/t5wIppkHSpVXzhx/jBp256Rw/GDvA2aGurXQo5p+s8j63BwF5M1MLB
 b5Xty8yC0Rde67p2/9ZbnL+YSndMdv9QYkHLLTg8BttvGBrcYVQ4nYKQjHnr0+P48EZD73
 yTHmv48Zo53fCqItbDOcVzooz3VJdyygIj54KQaF1nxLtSiVGNdQdSj0ui7r7KkkRdXC2H
 tsCiT77Dn5Hlj44C2nC57HJzGkMIwwrGn9F7y+wJQrpSWja/jUUPlM8UWwli21sLqdoVYC
 VUAD734mtE5VK897cRod6joQe+M+95J/ooijhp2s/uL6EaD3ZicumK+Lj3QhIQ==
Message-ID: <ffe8556a939fac3edaf9c7007c3c4b5cf1c7c74d.camel@mailbox.org>
Subject: Re: [PATCH 03/28] drm/sched: Add some more scheduling quality unit
 tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Fri, 10 Oct 2025 11:48:17 +0200
In-Reply-To: <20251008085359.52404-4-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d415aefd540970ce296
X-MBO-RS-META: 1y9besrxwpdbe3g5c195mdu53y13wyax
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

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> This time round we explore the rate of submitted job queue processing
> with multiple identical parallel clients.
>=20
> Example test output:
>=20
> 3 clients:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cycle:=C2=A0=C2=
=A0=C2=A0=C2=A0 min=C2=A0 avg max : ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0 0ms=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 0=
 :=C2=A0=C2=A0 0=C2=A0=C2=A0 0=C2=A0=C2=A0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 102ms=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 2 :=C2=A0=
=C2=A0 2=C2=A0=C2=A0 2=C2=A0=C2=A0 2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 208ms=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 5=C2=A0=C2=A0=C2=A0 6=C2=A0=C2=A0=C2=A0 6 :=C2=A0=
=C2=A0 6=C2=A0=C2=A0 5=C2=A0=C2=A0 5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 310ms=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 8=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0=C2=A0 9 :=C2=A0=
=C2=A0 9=C2=A0=C2=A0 9=C2=A0=C2=A0 8
> ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 2616ms=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 82=C2=A0=C2=A0 83=C2=A0=C2=A0 83 :=C2=A0 83=C2=A0 83=C2=A0 82
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0 2717ms=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 83=C2=A0=C2=A0 83=C2=A0=C2=A0 83 :=C2=A0 83=C2=A0 83=C2=A0 83
> =C2=A0=C2=A0=C2=A0 avg_max_min_delta(x100)=3D60
>=20
> Every 100ms for the duration of the test test logs how many jobs each
> client had completed, prefixed by minimum, average and maximum numbers.
> When finished overall average delta between max and min is output as a
> rough indicator to scheduling fairness.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0.../gpu/drm/scheduler/tests/tests_scheduler.c | 186 +++++++++++++++=
++-
> =C2=A01 file changed, 185 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/=
gpu/drm/scheduler/tests/tests_scheduler.c
> index c66c151a66d2..77b02c5e8d52 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -195,6 +195,7 @@ struct drm_sched_client_params {
> =C2=A0
> =C2=A0struct drm_sched_test_params {
> =C2=A0	const char *description;
> +	unsigned int num_clients;
> =C2=A0	struct drm_sched_client_params client[2];
> =C2=A0};
> =C2=A0
> @@ -689,6 +690,189 @@ static struct kunit_suite drm_sched_scheduler_two_c=
lients2 =3D {
> =C2=A0	.test_cases =3D drm_sched_scheduler_two_clients_tests,
> =C2=A0};
> =C2=A0
> +
> +static const struct drm_sched_test_params drm_sched_many_cases[] =3D {
> +	{
> +		.description =3D "2 clients",
> +		.num_clients =3D 2,
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 4,
> +			.job_us =3D 1000,
> +			.wait_us =3D 0,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "3 clients",
> +		.num_clients =3D 3,
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 4,
> +			.job_us =3D 1000,
> +			.wait_us =3D 0,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "7 clients",
> +		.num_clients =3D 7,
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 4,
> +			.job_us =3D 1000,
> +			.wait_us =3D 0,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "13 clients",
> +		.num_clients =3D 13,
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 4,
> +			.job_us =3D 1000,
> +			.wait_us =3D 0,
> +			.sync =3D true,
> +		},
> +	},
> +	{
> +		.description =3D "31 clients",
> +		.num_clients =3D 31,
> +		.client[0] =3D {
> +			.priority =3D DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt =3D 2,
> +			.job_us =3D 1000,
> +			.wait_us =3D 0,
> +			.sync =3D true,
> +		},
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(drm_sched_scheduler_many_clients,
> +		=C2=A0 drm_sched_many_cases,
> +		=C2=A0 drm_sched_desc);
> +
> +static void drm_sched_scheduler_many_clients_test(struct kunit *test)
> +{
> +	const struct drm_sched_test_params *params =3D test->param_value;
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	const unsigned int clients =3D params->num_clients;
> +	unsigned int i, j, delta_total =3D 0, loops =3D 0;
> +	struct test_client *client;
> +	unsigned int *prev_cycle;
> +	ktime_t start;
> +	char *buf;
> +
> +	/*
> +	 * Many clients with deep-ish async queues.
> +	 */
> +
> +	buf =3D kunit_kmalloc(test, PAGE_SIZE, GFP_KERNEL);
> +	client =3D kunit_kcalloc(test, clients, sizeof(*client), GFP_KERNEL);
> +	prev_cycle =3D kunit_kcalloc(test, clients, sizeof(*prev_cycle),
> +				=C2=A0=C2=A0 GFP_KERNEL);

No error handling necessary??

> +
> +	for (i =3D 0; i < clients; i++)
> +		client[i].entity =3D
> +			drm_mock_sched_entity_new(test,
> +						=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
> +						=C2=A0 sched);
> +
> +	for (i =3D 0; i < clients; i++) {
> +		client[i].test =3D test;
> +		client[i].id =3D i;
> +		client[i].params =3D params->client[0];
> +		client[i].duration =3D ms_to_ktime(1000 / clients);
> +		client[i].cycle_time.min_us =3D ~0U;
> +		client[i].latency_time.min_us =3D ~0U;
> +		client[i].worker =3D
> +			kthread_create_worker(0, "%s-%u", __func__, i);
> +		if (IS_ERR(client[i].worker)) {
> +			for (j =3D 0; j < i; j++)
> +				kthread_destroy_worker(client[j].worker);
> +			KUNIT_FAIL(test, "Failed to create worker!\n");
> +		}
> +
> +		kthread_init_work(&client[i].work, drm_sched_client_work);
> +	}
> +
> +	for (i =3D 0; i < clients; i++)
> +		kthread_queue_work(client[i].worker, &client[i].work);
> +
> +	start =3D ktime_get();
> +	pr_info("%u clients:\n\tt\t\tcycle:\t=C2=A0 min=C2=A0=C2=A0=C2=A0 avg=
=C2=A0=C2=A0=C2=A0 max : ...\n", clients);
> +	for (;;) {
> +		unsigned int min =3D ~0;

Why is min initialized to UINT_MAX?

> +		unsigned int max =3D 0;
> +		unsigned int total =3D 0;
> +		bool done =3D true;
> +		char pbuf[16];
> +
> +		memset(buf, 0, PAGE_SIZE);
> +		for (i =3D 0; i < clients; i++) {
> +			unsigned int cycle, cycles;
> +
> +			cycle =3D READ_ONCE(client[i].cycle);
> +			cycles =3D READ_ONCE(client[i].cycles);

I think I had asked why READ_ONCE is necessary. It's not super obvious.


P.

> +
> +			snprintf(pbuf, sizeof(pbuf), " %3d", cycle);
> +			strncat(buf, pbuf, PAGE_SIZE);
> +
> +			total +=3D cycle;
> +			if (cycle < min)
> +				min =3D cycle;
> +			if (cycle > max)
> +				max =3D cycle;
> +
> +			if (!min || (cycle + 1) < cycles)
> +				done =3D false;
> +		}
> +
> +		loops++;
> +		delta_total +=3D max - min;
> +
> +		pr_info("\t+%6lldms\t\t=C2=A0 %3u=C2=A0 %3u=C2=A0 %3u :%s\n",
> +			ktime_to_ms(ktime_sub(ktime_get(), start)),
> +			min, DIV_ROUND_UP(total, clients), max, buf);
> +
> +		if (done)
> +			break;
> +
> +		msleep(100);
> +	}
> +
> +	pr_info("=C2=A0=C2=A0=C2=A0 avg_max_min_delta(x100)=3D%u\n",
> +		loops ? DIV_ROUND_UP(delta_total * 100, loops) : 0);
> +
> +	for (i =3D 0; i < clients; i++) {
> +		kthread_flush_work(&client[i].work);
> +		kthread_destroy_worker(client[i].worker);
> +	}
> +
> +	for (i =3D 0; i < clients; i++)
> +		drm_mock_sched_entity_free(client[i].entity);
> +}
> +
> +static const struct kunit_attributes drm_sched_scheduler_many_clients_at=
tr =3D {
> +	.speed =3D KUNIT_SPEED_SLOW,
> +};
> +
> +static struct kunit_case drm_sched_scheduler_many_clients_tests[] =3D {
> +	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_many_clients_test,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_many_clients_gen_p=
arams,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_many_clients_attr)=
,
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_many_clients =3D {
> +	.name =3D "drm_sched_scheduler_many_clients_tests",
> +	.init =3D drm_sched_scheduler_init2,
> +	.exit =3D drm_sched_scheduler_exit,
> +	.test_cases =3D drm_sched_scheduler_many_clients_tests,
> +};
> +
> =C2=A0kunit_test_suites(&drm_sched_scheduler_overhead,
> =C2=A0		=C2=A0 &drm_sched_scheduler_two_clients1,
> -		=C2=A0 &drm_sched_scheduler_two_clients2);
> +		=C2=A0 &drm_sched_scheduler_two_clients2,
> +		=C2=A0 &drm_sched_scheduler_many_clients);

