Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJKbOnB/nGm6IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:25:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45994179B09
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4410E3FE;
	Mon, 23 Feb 2026 16:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="WcTNXqJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5E010E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:25:14 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b883c8dfb00so784884566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1771863913; x=1772468713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I8kBweU36+seP7dCWKh+6EzGkDFwJFjaMvCc9AajSdQ=;
 b=WcTNXqJ53WiphhMgzyzRJ/yXx8v3PhoPXoOkdrfiXGxdqFmSB4YK2L++w9bUcXOwoj
 M0VhWRMuQGufvxRe5AS1S5ipVqdcGWyGDNCEeCmDubOoL3WQx2o6AiMUkrM0rT5dyysy
 1VvoNeCbYrW2TRhn4G/26uKAQAOlJycAOkGC4Th35YhqADnsXTTvOiiZuBVEe4Fk+Pb0
 d3OVhkJnxrgeJhNt4QAxwK5dtf7t0yUB1hGG6AUpK2Sh4QPP24h7ZeBr0I5yKHoGdR9E
 btf2gYrKydOfiRdxHUdzykCf8EREG/1oFHYAeRj4Z8vfDE85HseMKOiAjrIufOjuBYBJ
 5PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771863913; x=1772468713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8kBweU36+seP7dCWKh+6EzGkDFwJFjaMvCc9AajSdQ=;
 b=FjaKyRcSKUUhjCi2DRJqI6P52eUbs4onk/YJDQyl1KedqSs/H/OOccueFTwJviQLmU
 6AYNl0gtJDDEdeqAi5bjXNfL0VUhru5/HqMnVOGyzfu4DWGO3xvFcrXlA/0vf8PornT3
 prRv/26zhNiTRaVwktumh4coNRiQU8F3PbiwVkQBRq6GjK3ZaqHalHxQTa75C1YRNluh
 aPstHIPo6T29QfgStWfIw8Cqzrl+iSF3P2y9ezkD8n13+YAg0PTKGiAaiqxmRjiDgcH1
 0XmQexABiuCUZBXiuvSMO2Bj0A5i3AQY0M+w5sa/ie+1a6L8+tmjmWBodyvKXKcPBUwW
 3jKQ==
X-Gm-Message-State: AOJu0YyhBU5X5tHtHdx8HNew5/wQ7dvKHzeiiZK3i9V/zb/q4CStgneP
 7CGWFpJ//UHj66Dgr82Cgrg96dpzKhFM9MFtE7IYkvJUPyEYpjrL2scd34upf01UpJo=
X-Gm-Gg: ATEYQzyyLt1dJ5yfz6WpfdZTQvqDKABxpWwUD846pdOoP5kUjSFDZQp4JW+r9Wnn68/
 VsdkaZHhlFaSKKZu3eQty+CgxbpoXL9V2yoq9mWcluKGtL5ZhDMVXWDRO/1Y5O77FUmE7sPy+Nv
 jrmxFiMy078RShQ26zuQ+7lyunSDXmbR2DTWPYx8Z+jUv0l4yVR3lPnN2XCmDZD9HPp/HKBQTb9
 cnPrWJrKj4tKwj/nuSHoSZZKxCCpwnF2Go7fdHwTKfbBvwD3CTTQTlD/HWTCwYCgFTK5SkA2vxw
 tgctFajzLpMeIbntcI67wtpEc0V7N6WOIUll6WJDvwJVqWMK97J6ftQ8crRL3C7qwOQ+fCHjngn
 vTjmsKmUMRlNR6Q3S71wnN22wpOv6CXr9jizB2uSk9PN0AMFNykaBSd5pxPxI5/SiJNN9y91X1L
 khs5+khjtv2anQSGo0V7rT3pRFsB8KupM/igqoGIf9a86O
X-Received: by 2002:a17:906:f289:b0:b87:d186:19e3 with SMTP id
 a640c23a62f3a-b9081b98d64mr451613266b.43.1771863912231; 
 Mon, 23 Feb 2026 08:25:12 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c824ccsm340396166b.18.2026.02.23.08.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:25:11 -0800 (PST)
Message-ID: <e215efdd-c547-4ce4-affe-7198ed37c2a6@ursulin.net>
Date: Mon, 23 Feb 2026 16:25:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Add new KUnit test suite for concurrent job
 submission
To: Marco Pagani <marco.pagani@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260219140711.3296237-1-marco.pagani@linux.dev>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260219140711.3296237-1-marco.pagani@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marco.pagani@linux.dev,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[linux.dev,intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 45994179B09
X-Rspamd-Action: no action


On 19/02/2026 14:07, Marco Pagani wrote:
> Add a new test suite to simulate concurrent job submissions to the DRM
> scheduler. The suite includes two initial test cases: (i) a primary test
> case for parallel job submission and (ii) a secondary test case for
> interleaved job submission and completion. In the first test case, worker
> threads concurrently submit jobs to the scheduler and then the timeline is
> manually advanced. In the second test case, worker threads periodically
> submit a sequence of jobs to the mock scheduler. Periods are chosen as
> harmonic, starting from a base period, to allow interleaving between
> submission and completion. To avoid impractically large execution times,
> periods are cycled. The timeline is advanced automatically when the jobs
> completes. This models how job submission from userspace (in process
> context) may interleave with job completion (hrtimer callback interrupt
> context, in the test case) by a physical device.
> 
> Signed-off-by: Marco Pagani <marco.pagani@linux.dev>
> ---
> Changes in v1:
> - Split the original suite into two test cases (Tvrtko Ursulin).
> - General test refactoring and variable renaming for clarity.
> - Changed parameters to have a fairer workload distribution.
> - Improved cleanup logic.
> - Added kunit_info() prints for tracing workers.
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 338 ++++++++++++++++++
>   1 file changed, 338 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 82a41a456b0a..391edcbaf43a 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -2,6 +2,8 @@
>   /* Copyright (c) 2025 Valve Corporation */
>   
>   #include <linux/delay.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
>   
>   #include "sched_tests.h"
>   
> @@ -235,6 +237,341 @@ static void drm_sched_basic_cancel(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
>   }
>   
> +struct sched_concurrent_context {
> +	struct drm_mock_scheduler *sched;
> +	struct workqueue_struct *sub_wq;
> +	struct kunit *test;
> +	struct completion wait_go;
> +};
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fini,
> +			    struct drm_mock_scheduler *);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sched_entity_free,
> +			    struct drm_mock_sched_entity *);
> +
> +static void complete_destroy_workqueue(void *context)
> +{
> +	struct sched_concurrent_context *ctx = (struct sched_concurrent_context *)context;
> +
> +	complete_all(&ctx->wait_go);
> +
> +	destroy_workqueue(ctx->sub_wq);
> +}
> +
> +static int drm_sched_concurrent_init(struct kunit *test)
> +{
> +	struct sched_concurrent_context *ctx;
> +	int ret;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	init_completion(&ctx->wait_go);
> +
> +	ctx->sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +
> +	ret = kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx->sched);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/* Use an unbounded workqueue to maximize job submission concurrency */
> +	ctx->sub_wq = alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND,
> +				      WQ_UNBOUND_MAX_ACTIVE);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
> +
> +	ret = kunit_add_action_or_reset(test, complete_destroy_workqueue, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ctx->test = test;
> +	test->priv = ctx;
> +
> +	return 0;
> +}
> +
> +struct drm_sched_parallel_params {
> +	const char *description;
> +	unsigned int num_jobs;
> +	unsigned int num_workers;
> +};
> +
> +static const struct drm_sched_parallel_params drm_sched_parallel_cases[] = {
> +	{
> +		.description = "Workers submitting multiple jobs against a single entity",

Each worker has own entity so the description is a bit confusing.

> +		.num_jobs = 4,
> +		.num_workers = 16,
> +	},
> +};
> +
> +static void
> +drm_sched_parallel_desc(const struct drm_sched_parallel_params *params, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_parallel, drm_sched_parallel_cases, drm_sched_parallel_desc);
> +
> +struct parallel_worker {
> +	struct work_struct work;
> +	struct sched_concurrent_context *ctx;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job **jobs;
> +	unsigned int id;
> +};
> +
> +static void drm_sched_parallel_worker(struct work_struct *work)
> +{
> +	const struct drm_sched_parallel_params *params;
> +	struct sched_concurrent_context *test_ctx;
> +	struct parallel_worker *worker;
> +	unsigned int i;
> +
> +	worker = container_of(work, struct parallel_worker, work);
> +	test_ctx = worker->ctx;
> +	params = test_ctx->test->param_value;
> +
> +	wait_for_completion(&test_ctx->wait_go);
> +
> +	kunit_info(test_ctx->test, "Parallel worker %u started\n", worker->id);
> +
> +	for (i = 0; i < params->num_jobs; i++)
> +		drm_mock_sched_job_submit(worker->jobs[i]);
> +}
> +
> +/*
> + * Spawns workers that submit a sequence of jobs to the mock scheduler.
> + * Once all jobs are submitted, the timeline is manually advanced.
> + */
> +static void drm_sched_parallel_submit_test(struct kunit *test)
> +{
> +	struct sched_concurrent_context *ctx = test->priv;
> +	const struct drm_sched_parallel_params *params = test->param_value;
> +	struct parallel_worker *workers;
> +	unsigned int i, j, completed_jobs;
> +	bool done;
> +	int ret;
> +
> +	workers = kunit_kcalloc(test, params->num_workers, sizeof(*workers),
> +				GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, workers);
> +
> +	/*
> +	 * Init workers only after all jobs and entities have been successfully
> +	 * allocated. In this way, the cleanup logic for when an assertion fail
> +	 * can be simplified.
> +	 */
> +	for (i = 0; i < params->num_workers; i++) {
> +		workers[i].id = i;
> +		workers[i].ctx = ctx;
> +		workers[i].entity = drm_mock_sched_entity_new(test,
> +							      DRM_SCHED_PRIORITY_NORMAL,
> +							      ctx->sched);
> +
> +		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
> +						workers[i].entity);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		workers[i].jobs = kunit_kcalloc(test, params->num_jobs,
> +						sizeof(*workers[i].jobs), GFP_KERNEL);
> +		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
> +
> +		for (j = 0; j < params->num_jobs; j++)
> +			workers[i].jobs[j] = drm_mock_sched_job_new(test,
> +								    workers[i].entity);
> +	}
> +
> +	for (i = 0; i < params->num_workers; i++) {
> +		INIT_WORK(&workers[i].work, drm_sched_parallel_worker);
> +		queue_work(ctx->sub_wq, &workers[i].work);
> +	}
> +
> +	complete_all(&ctx->wait_go);
> +	flush_workqueue(ctx->sub_wq);
> +
> +	for (i = 0; i < params->num_workers; i++) {
> +		for (j = 0; j < params->num_jobs; j++) {
> +			done = drm_mock_sched_job_wait_scheduled(workers[i].jobs[j],
> +								 HZ);
> +			KUNIT_ASSERT_TRUE(test, done);
> +
> +			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> +			KUNIT_ASSERT_FALSE(test, done);

This second assert does not seem to be bringing much value, but instead 
makes the reader ask themselves why it is there. Remove it?

Hmm in fact this whole loop could be removed. All that it is needed 
below is to wait for the last job to be completed.

> +		}
> +	}
> +
> +	completed_jobs = drm_mock_sched_advance(ctx->sched,
> +						params->num_workers * params->num_jobs);
> +	KUNIT_ASSERT_EQ(test, completed_jobs, params->num_workers * params->num_jobs);
> +
> +	for (i = 0; i < params->num_workers; i++) {
> +		for (j = 0; j < params->num_jobs; j++) {
> +			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> +			KUNIT_ASSERT_TRUE(test, done);
> +		}
> +	}

So here, after advancing you just need to wait on the last job to complete.

Not a deal breaker to have it verbose but usually the less is better and 
easier to spot the key thing being tested and what are the functional steps.

> +}
> +
> +struct drm_sched_interleaved_params {
> +	const char *description;
> +	unsigned int job_base_period_us;
> +	unsigned int periods_cycle;
> +	unsigned int num_jobs;
> +	unsigned int num_workers;
> +};
> +
> +static const struct drm_sched_interleaved_params drm_sched_interleaved_cases[] = {
> +	{
> +		.description = "Workers submitting single jobs against a single entity",

As with the parallel description.

> +		.job_base_period_us = 100,
> +		.periods_cycle = 10,
> +		.num_jobs = 1,
> +		.num_workers = 32,
> +	},
> +	{
> +		.description = "Workers submitting multiple jobs against a single entity",
> +		.job_base_period_us = 100,
> +		.periods_cycle = 10,
> +		.num_jobs = 4,
> +		.num_workers = 16,
> +	},
> +};
> +
> +static void
> +drm_sched_interleaved_desc(const struct drm_sched_interleaved_params *params, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_interleaved, drm_sched_interleaved_cases,
> +		  drm_sched_interleaved_desc);
> +
> +struct interleaved_worker {
> +	struct work_struct work;
> +	struct sched_concurrent_context *ctx;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job **jobs;
> +	unsigned int id;
> +	unsigned int period_us;
> +	unsigned int timeout_us;
> +};
> +
> +static void drm_sched_interleaved_worker(struct work_struct *work)
> +{
> +	const struct drm_sched_interleaved_params *params;
> +	struct sched_concurrent_context *test_ctx;
> +	struct interleaved_worker *worker;
> +	unsigned int i;
> +	bool done;
> +
> +	worker = container_of(work, struct interleaved_worker, work);
> +	test_ctx = worker->ctx;
> +	params = test_ctx->test->param_value;
> +
> +	wait_for_completion(&test_ctx->wait_go);
> +
> +	kunit_info(test_ctx->test, "Interleaved worker %u with period %u us started\n",
> +		   worker->id, worker->period_us);
> +
> +	/* Release jobs as a periodic sequence */
> +	for (i = 0; i < params->num_jobs; i++) {
> +		drm_mock_sched_job_set_duration_us(worker->jobs[i], worker->period_us);
> +		drm_mock_sched_job_submit(worker->jobs[i]);
> +
> +		done = drm_mock_sched_job_wait_finished(worker->jobs[i],
> +							usecs_to_jiffies(worker->timeout_us));
> +		if (!done)
> +			kunit_info(test_ctx->test, "Job %u of worker %u timedout\n",
> +				   i, worker->id);
> +	}
> +}
> +
> +/*
> + * Spawns workers that submit a periodic sequence of jobs to the mock scheduler.
> + * Uses harmonic periods to allow interleaving and cycles through them to prevent
> + * excessively large execution times. Since the scheduler serializes jobs from all
> + * workers, the timeout is set to the hyperperiod with a 2x safety factor. Entities
> + * and jobs are pre-allocated in the main thread to avoid using KUnit assertions in
> + * the workers.
> + */
> +static void drm_sched_interleaved_submit_test(struct kunit *test)
> +{
> +	struct sched_concurrent_context *ctx = test->priv;
> +	const struct drm_sched_interleaved_params *params = test->param_value;
> +	struct interleaved_worker *workers;
> +	unsigned int period_max_us, timeout_us;
> +	unsigned int i, j;
> +	bool done;
> +	int ret;
> +
> +	workers = kunit_kcalloc(test, params->num_workers, sizeof(*workers),
> +				GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, workers);
> +
> +	period_max_us = params->job_base_period_us * (1 << params->periods_cycle);
> +	timeout_us = params->num_workers * period_max_us * 2;
> +
> +	/*
> +	 * Init workers only after all jobs and entities have been successfully
> +	 * allocated. In this way, the cleanup logic for when an assertion fail
> +	 * can be simplified.
> +	 */
> +	for (i = 0; i < params->num_workers; i++) {
> +		workers[i].id = i;
> +		workers[i].ctx = ctx;
> +		workers[i].timeout_us = timeout_us;
> +
> +		if (i % params->periods_cycle == 0)
> +			workers[i].period_us = params->job_base_period_us;
> +		else
> +			workers[i].period_us = workers[i - 1].period_us * 2;

Are the two if statements effectively equivalent to:

  period_us = params->job_base_period_us << (i % params->periods_cycle);

?

Also, do you have an idea how to locally calculate a suitable 
periods_cycle instead of having to come up with a number in the 
drm_sched_interleaved_params array. Just strikes me as hard to know what 
to put in there if someone would want to add a test.

> +
> +		workers[i].entity = drm_mock_sched_entity_new(test,
> +							      DRM_SCHED_PRIORITY_NORMAL,
> +							      ctx->sched);
> +
> +		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
> +						workers[i].entity);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		workers[i].jobs = kunit_kcalloc(test, params->num_jobs,
> +						sizeof(*workers[i].jobs), GFP_KERNEL);
> +		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
> +
> +		for (j = 0; j < params->num_jobs; j++) {
> +			workers[i].jobs[j] = drm_mock_sched_job_new(test,
> +								    workers[i].entity);
> +			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> +			KUNIT_ASSERT_FALSE(test, done);

Same as above, this is asserted by a basic test case so I'd just remove it.

> +		}
> +	}
> +
> +	for (i = 0; i < params->num_workers; i++) {
> +		INIT_WORK(&workers[i].work, drm_sched_interleaved_worker);
> +		queue_work(ctx->sub_wq, &workers[i].work);
> +	}
> +
> +	complete_all(&ctx->wait_go);
> +	flush_workqueue(ctx->sub_wq);
> +
> +	for (i = 0; i < params->num_workers; i++) {
> +		for (j = 0; j < params->num_jobs; j++) {
> +			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> +			KUNIT_ASSERT_TRUE(test, done);
> +		}
> +	}

Here as well you could wait just for the last job per worker.

On the overal submission pattern - Don't you end up with a very uneven 
activity between the workers? Because the job duration is doubling and 
workers are single-shot, once the low index workers are done they are 
done, and all that remains are the higher ones, and so the wave of fewer 
and fewer active workers continues. Low index worker do not end up 
racing with the job completions of the high index workers but only 
between themselves, and even that with the cycle=10 workers=16 case is 
even more limited.

Alternative approach could be to set a per test time budget and just 
keep the workers submitting until over. It would be simpler to 
understand and there would be more submit/complete overlap.

Regards,

Tvrtko

> +}
> +
> +static struct kunit_case drm_sched_concurrent_tests[] = {
> +	KUNIT_CASE_PARAM(drm_sched_parallel_submit_test, drm_sched_parallel_gen_params),
> +	KUNIT_CASE_PARAM(drm_sched_interleaved_submit_test, drm_sched_interleaved_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_concurrent = {
> +	.name = "drm_sched_concurrent_tests",
> +	.init = drm_sched_concurrent_init,
> +	.test_cases = drm_sched_concurrent_tests,
> +};
> +
>   static struct kunit_case drm_sched_cancel_tests[] = {
>   	KUNIT_CASE(drm_sched_basic_cancel),
>   	{}
> @@ -556,6 +893,7 @@ static struct kunit_suite drm_sched_credits = {
>   };
>   
>   kunit_test_suites(&drm_sched_basic,
> +		  &drm_sched_concurrent,
>   		  &drm_sched_timeout,
>   		  &drm_sched_cancel,
>   		  &drm_sched_priority,

