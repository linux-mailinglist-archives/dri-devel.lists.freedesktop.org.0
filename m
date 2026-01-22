Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMcRFhfzcWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:51:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EAC64CEF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95010E04C;
	Thu, 22 Jan 2026 09:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="L3cPBlYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C25E10E04C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:51:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so5182615e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1769075475; x=1769680275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZktZU9GDJz3tAA1cpXRcZs0J2FPAoBoss01pBfSkK3o=;
 b=L3cPBlYiEvZplNe3Vxhw6njFoZw0FFb3cAIfQDdnmxTahVF5dfdnfoO7CoOfG9pKUB
 /aOTDlbSUxK6se57ZUxmVqKIOlZLCU2WFe7Nwd0DkiaysrYIER30P6flvEjpzKhPkrG8
 CADwq6bU7fwe0AHeI3CGnK+ne3cLQ+rsCUcfA+jZjkCR8gvHF8hZvXQQFvP1TNZuNee4
 Vv/LSAo8XkmXo5xc1/6CIDG3ZSZTyRu9A9xY2DeUAcjbN7LofZsi1AtMX+CNBY6MrUjN
 Vh2wGs4ebibzsP5doiEki8SMy/ucKeqi/LMS/iEOZa5iTDGkvNOh+Xzs1TxF/mIgNVAR
 o1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769075475; x=1769680275;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZktZU9GDJz3tAA1cpXRcZs0J2FPAoBoss01pBfSkK3o=;
 b=VjZDQGRrq8KhNBKp7T/j2jCAii8/PfeXi11khNk7VMb0hNO9B8Mu/EESOEG0yN+LEw
 QgwNLCWxyMR1XkMnwzPnQrxV4G8rSJUZsy/s4HUwgaeLNcMceh872k8UP1B2WqpMggcw
 pRllKh+7ckKrh0dGFHfSkF/N/4UfB9oOnhITy2IpybI/MwpVLjnymE8lpKUPm6USzBqX
 bMETH9MacdbFlWRq1t+1Qm+mfXCws3Gt+80rGbVm70PsUcfYZb6+J/yQjedW6zXeq4To
 YhQJKQSpzmqMBUOn+M9RdSv65YAqYEcJjqaIFm5lupocSQVqSP+Axna+pbyaG9hBIrLf
 WYDA==
X-Gm-Message-State: AOJu0YxerfbXYGQ//+x3t7kL9CsxEUUN3GwCOkgf9XPB1slsY2tzw6MH
 vmts58Ikh/V/X70d274C7m3QGbMue5RQ2GIPJZS44NZiAmsBGIri9aRF0Q2R3nrucJuXmdXwLRS
 VC5XLaaQ=
X-Gm-Gg: AZuq6aJCmmKU3Z/1xVDzUvBYx3XUNkAkGYKcXASBKzwJ/ejY/FE8ux/vU8K72JEB0vB
 CB9PYaauWlLWc+AAJuZxz/XCn84k3Mb8+JJnLyhsHMX+WsjwpQkQTO8iVNbGJwqMRo8WufH5Omo
 9DegmiFLlhc3IwKdZcuEgDFbG+qSqknCf4UOjvfeUQmzZhaJ9smXpxdhtLYPQUfK8yd98KgbCMW
 2z0TO9YVAsQSG9/hQRx4kpnIw79pv1NjosGxn8TmJTDN8z4TtoaC2NDtbYta66R0FjohB7wrE9o
 LsmSQtUb99KmqcinLI/V9LY1JnjMWvHtlWW4GEV/vGVJi9UbnAWviAXBWMaMZVQFuZQcAK6ZzHc
 ko+brojba3ZrJHmkniQWePi8Os9zFXf911Bg0wK9CQfmHrePo9mmdfly8lJlDARTwvsM1Yb+ELn
 B35bb8rIM0AdRuFA1tgi2s8tK1lP3NeFH3
X-Received: by 2002:a05:600c:1388:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-480409ca767mr113388155e9.3.1769075474517; 
 Thu, 22 Jan 2026 01:51:14 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804703b90bsm64922395e9.6.2026.01.22.01.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:51:14 -0800 (PST)
Message-ID: <79cf2013-da6b-4653-aaa8-3e29a7d1ee3a@ursulin.net>
Date: Thu, 22 Jan 2026 09:51:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
To: Marco Pagani <marpagan@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260120205236.322086-1-marpagan@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260120205236.322086-1-marpagan@redhat.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marpagan@redhat.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[redhat.com,intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: B2EAC64CEF
X-Rspamd-Action: no action


On 20/01/2026 20:52, Marco Pagani wrote:
> Add a new test suite to simulate concurrent job submissions from userspace.
> The suite includes a basic test case where each worker submits a single
> job, and a more advanced case involving the submission of multiple jobs.

New test coverage is welcome!

But as Philipp has said some more context would be beneficial. Like are 
you trying to hit a bug, or extend later with something which will hit a 
bug and then you will propose improvements? Or simply improving the 
coverage?

If it is about some race I would maybe consider putting this into a new 
tests_races.c. I actually have this file locally and some unfinished 
test cases already, although it is unclear when I will be happy with 
them to post. But if the test is simply about adding coverage it is fine 
to live in tests_basic.c.

> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 82a41a456b0a..7c25bcbbe7c9 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -2,6 +2,7 @@
>   /* Copyright (c) 2025 Valve Corporation */
>   
>   #include <linux/delay.h>
> +#include <linux/completion.h>
>   
>   #include "sched_tests.h"
>   
> @@ -235,6 +236,179 @@ static void drm_sched_basic_cancel(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
>   }
>   
> +struct sched_concurrent_test_context {
> +	struct drm_mock_scheduler *sched;
> +	struct workqueue_struct *sub_wq;
> +	struct completion wait_go;
> +};
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(destroy_workqueue_wrap, destroy_workqueue,
> +			    struct workqueue_struct *);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fini,
> +			    struct drm_mock_scheduler *);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sched_entity_free,
> +			    struct drm_mock_sched_entity *);
> +
> +static int drm_sched_concurrent_init(struct kunit *test)
> +{
> +	struct sched_concurrent_test_context *ctx;
> +	int ret;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
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
> +	ret = kunit_add_action_or_reset(test, destroy_workqueue_wrap, ctx->sub_wq);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	test->priv = ctx;
> +
> +	return 0;
> +}
> +
> +struct drm_sched_concurrent_params {
> +	const char *description;
> +	unsigned int job_base_us;
> +	unsigned int num_jobs;
> +	unsigned int num_subs;
> +};
> +
> +static const struct drm_sched_concurrent_params drm_sched_concurrent_cases[] = {
> +	{
> +		.description = "Concurrently submit a single job in a single entity",
> +		.job_base_us = 1000,
> +		.num_jobs = 1,
> +		.num_subs = 32,
> +	},

Why is submission from a single thread interesting if it is already covered?

> +	{
> +		.description = "Concurrently submit multiple jobs in a single entity",
> +		.job_base_us = 1000,
> +		.num_jobs = 10,
> +		.num_subs = 64,
> +	},
> +};
> +
> +static void
> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
> +
> +struct submitter_data {
> +	struct work_struct work;
> +	struct sched_concurrent_test_context *ctx;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job **jobs;
> +	struct kunit *test;
> +	unsigned int id;
> +	bool timedout;
> +};
> +
> +static void drm_sched_submitter_worker(struct work_struct *work)
> +{
> +	const struct drm_sched_concurrent_params *params;
> +	struct sched_concurrent_test_context *ctx;
> +	struct submitter_data *sub_data;
> +	unsigned int i, duration_us;
> +	unsigned long timeout_jiffies;
> +	bool done;
> +
> +	sub_data = container_of(work, struct submitter_data, work);
> +	ctx = sub_data->ctx;
> +	params = sub_data->test->param_value;
> +
> +	wait_for_completion(&ctx->wait_go);
> +
> +	for (i = 0; i < params->num_jobs; i++) {
> +		duration_us = params->job_base_us + (sub_data->id * 10);

Why is job duration dependent by the submitter id?

Would it be feasiable to not use auto-completing jobs and instead 
advance the timeline manually? Given how the premise of the test seems 
to be about concurrent submission it sounds plausible that what happens 
after submission maybe isn't very relevant.

> +		drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
> +		drm_mock_sched_job_submit(sub_data->jobs[i]);

On a related note, one interesting thing to add coverage for later is 
multi-threaded submit of multiple jobs against a single entity. But it 
is not an immediate need. Just mentioning it as something interesting.

It would mean open coding drm_mock_sched_job_submit() as 
drm_sched_job_arm() and drm_sched_entity_push_job() and sticking some 
delay in between so two threads have the chance to interleave. Mock 
scheduler does not handle it today, neither does the scheduler itself 
who punts responsibility to callers. So adding a test and making the 
mock scheduler handle that properly would serve as an example on how 
scheduler must be used. Or what can go bad if it isn't.

> +	}
> +
> +	timeout_jiffies = usecs_to_jiffies(params->job_base_us * params->num_subs *
> +					   params->num_jobs * 10);

The timeout calculation could use a comment. You are using num_subs * 10 
to match the duratiot_us above being id * 10? With logic of calculating 
a pessimistic timeout?

Have you tried it with qemu to check if it is pessimistic enough?

> +	for (i = 0; i < params->num_jobs; i++) {
> +		done = drm_mock_sched_job_wait_finished(sub_data->jobs[i],
> +							timeout_jiffies);
> +		if (!done)
> +			sub_data->timedout = true;
> +	}

Technically you only need to wait on the last job but it is passable 
like this too.

Also, is it important for the worker to wait for completion or the main 
thread could simply wait for everything? Maybe that would simplify things.

Manual timeline advance and this combined would mean the workers only 
submit jobs, while the main thread simply does 
drm_mock_sched_advance(sched, num_subs * num_jobs) and waits for last 
job from each submitter to finish.

Again, auto-completion and timeout reporting is something I do not 
immediate see is relevant for multi-threaded submission testing.

Maybe if you want to test the mock scheduler itself it could be, but 
then I would add it as separate entry in drm_sched_concurrent_cases[]. 
Like maybe have a flag/boolean "auto-complete jobs". So one without and 
one with that set.

Other than that it looks tidy and was easy to follow. Only thing which 
slightly got me was the term "subs" since I don't intuitively associate 
it with a submitter but, well, a sub entity of some kind. Might be worth 
renaming that to submitter(s), or even dropping the prefix in some cases 
might be feasible (like sub(s)_data).

Regards,

Tvrtko

> +}
> +
> +static void drm_sched_concurrent_submit_test(struct kunit *test)
> +{
> +	struct sched_concurrent_test_context *ctx = test->priv;
> +	const struct drm_sched_concurrent_params *params = test->param_value;
> +	struct submitter_data *subs_data;
> +	unsigned int i, j;
> +	int ret;
> +
> +	subs_data = kunit_kcalloc(test, params->num_subs, sizeof(*subs_data),
> +				  GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, subs_data);
> +
> +	/*
> +	 * Pre-allocate entities and jobs in the main thread to avoid KUnit
> +	 * assertions in submitters threads
> +	 */
> +	for (i = 0; i < params->num_subs; i++) {
> +		subs_data[i].id = i;
> +		subs_data[i].ctx = ctx;
> +		subs_data[i].test = test;
> +		subs_data[i].timedout = false;
> +		subs_data[i].entity = drm_mock_sched_entity_new(test,
> +								DRM_SCHED_PRIORITY_NORMAL,
> +								ctx->sched);
> +
> +		ret = kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wrap,
> +						subs_data[i].entity);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		subs_data[i].jobs = kunit_kcalloc(test, params->num_jobs,
> +						  sizeof(*subs_data[i].jobs), GFP_KERNEL);
> +		KUNIT_ASSERT_NOT_NULL(test, subs_data[i].jobs);
> +
> +		for (j = 0; j < params->num_jobs; j++)
> +			subs_data[i].jobs[j] = drm_mock_sched_job_new(test,
> +								      subs_data[i].entity);
> +
> +		INIT_WORK(&subs_data[i].work, drm_sched_submitter_worker);
> +		queue_work(ctx->sub_wq, &subs_data[i].work);
> +	}
> +
> +	complete_all(&ctx->wait_go);
> +	flush_workqueue(ctx->sub_wq);
> +
> +	for (i = 0; i < params->num_subs; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, subs_data[i].timedout,
> +				       "Job submitter worker %u timedout", i);
> +}
> +
> +static struct kunit_case drm_sched_concurrent_tests[] = {
> +	KUNIT_CASE_PARAM(drm_sched_concurrent_submit_test, drm_sched_concurrent_gen_params),
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
> @@ -556,6 +730,7 @@ static struct kunit_suite drm_sched_credits = {
>   };
>   
>   kunit_test_suites(&drm_sched_basic,
> +		  &drm_sched_concurrent,
>   		  &drm_sched_timeout,
>   		  &drm_sched_cancel,
>   		  &drm_sched_priority,

