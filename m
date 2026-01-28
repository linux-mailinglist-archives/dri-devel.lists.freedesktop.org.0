Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDaiHfL2eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:45:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B22A0C11
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A855110E6C4;
	Wed, 28 Jan 2026 11:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rb0VuctP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 352 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jan 2026 11:45:47 UTC
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DC410E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:45:47 +0000 (UTC)
Message-ID: <90cdb121-7ff2-43a5-9327-2898b5e65609@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1769600393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUj+LxOscCxO1tjkKWfveVt0YFR86/lmCAD7hl+ohbA=;
 b=rb0VuctPr/HYJbS7r/J714GyU/qHK0KfeQt8cHG9WYGJMwjbmR1ND6BH33cPeq0L0k1cJ4
 +XG3WMjpy55+Boty8BlssUJUZFDPBMjLGiLeBM0fpHGGDnjSuI7K0ZqNLDyrrnbdUJrP+W
 T1RkuhzwBa9olV+hQM1OUBxh/jdB/sE=
Date: Wed, 28 Jan 2026 12:39:13 +0100
MIME-Version: 1.0
To: tursulin@ursulin.net
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, marpagan@redhat.com,
 matthew.brost@intel.com, mripard@kernel.org, phasta@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <79cf2013-da6b-4653-aaa8-3e29a7d1ee3a@ursulin.net>
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Marco Pagani <marco.pagani@linux.dev>
In-Reply-To: <79cf2013-da6b-4653-aaa8-3e29a7d1ee3a@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:airlied@gmail.com,m:ckoenig.leichtzumerken@gmail.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:marpagan@redhat.com,m:matthew.brost@intel.com,m:mripard@kernel.org,m:phasta@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,redhat.com,intel.com,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: A3B22A0C11
X-Rspamd-Action: no action


On 22/01/2026 10:51, Tvrtko Ursulin wrote:
> 
> On 20/01/2026 20:52, Marco Pagani wrote:
>> Add a new test suite to simulate concurrent job submissions from userspace.
>> The suite includes a basic test case where each worker submits a single
>> job, and a more advanced case involving the submission of multiple jobs.
> 
> New test coverage is welcome!

Hi Tvrtko, Philip, and thank you.

> But as Philipp has said some more context would be beneficial. Like are 
> you trying to hit a bug, or extend later with something which will hit a 
> bug and then you will propose improvements? Or simply improving the 
> coverage?

Sure, I'll extend the commit message to be more descriptive in the next
version.
 
> If it is about some race I would maybe consider putting this into a new 
> tests_races.c. I actually have this file locally and some unfinished 
> test cases already, although it is unclear when I will be happy with 
> them to post. But if the test is simply about adding coverage it is fine 
> to live in tests_basic.c.

The general idea is to extend the suite with some initial tests that stress
concurrency to spot race conditions. Having these initial tests grouped together
with future ones in a new tests_races.c file makes perfect sense to me.

>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 175 ++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> index 82a41a456b0a..7c25bcbbe7c9 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> @@ -2,6 +2,7 @@
>>   /* Copyright (c) 2025 Valve Corporation */
>>   
>>   #include <linux/delay.h>
>> +#include <linux/completion.h>
>>   
>>   #include "sched_tests.h"
>>   
>> @@ -235,6 +236,179 @@ static void drm_sched_basic_cancel(struct kunit *test)
>>   	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
>>   }
>>   
>> +struct sched_concurrent_test_context {
>> +	struct drm_mock_scheduler *sched;
>> +	struct workqueue_struct *sub_wq;
>> +	struct completion wait_go;
>> +};
>> +
>> +KUNIT_DEFINE_ACTION_WRAPPER(destroy_workqueue_wrap, destroy_workqueue,
>> +			    struct workqueue_struct *);
>> +
>> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fini,
>> +			    struct drm_mock_scheduler *);
>> +
>> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sched_entity_free,
>> +			    struct drm_mock_sched_entity *);
>> +
>> +static int drm_sched_concurrent_init(struct kunit *test)
>> +{
>> +	struct sched_concurrent_test_context *ctx;
>> +	int ret;
>> +
>> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
>> +
>> +	init_completion(&ctx->wait_go);
>> +
>> +	ctx->sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
>> +
>> +	ret = kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx->sched);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	/* Use an unbounded workqueue to maximize job submission concurrency */
>> +	ctx->sub_wq = alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND,
>> +				      WQ_UNBOUND_MAX_ACTIVE);
>> +	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
>> +
>> +	ret = kunit_add_action_or_reset(test, destroy_workqueue_wrap, ctx->sub_wq);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	test->priv = ctx;
>> +
>> +	return 0;
>> +}
>> +
>> +struct drm_sched_concurrent_params {
>> +	const char *description;
>> +	unsigned int job_base_us;
>> +	unsigned int num_jobs;
>> +	unsigned int num_subs;
>> +};
>> +
>> +static const struct drm_sched_concurrent_params drm_sched_concurrent_cases[] = {
>> +	{
>> +		.description = "Concurrently submit a single job in a single entity",
>> +		.job_base_us = 1000,
>> +		.num_jobs = 1,
>> +		.num_subs = 32,
>> +	},
> 
> Why is submission from a single thread interesting if it is already covered?

These two initial parameter sets cover only concurrent submission:
multiple submitters, single job / multiple submitters, multiple jobs.

>> +	{
>> +		.description = "Concurrently submit multiple jobs in a single entity",
>> +		.job_base_us = 1000,
>> +		.num_jobs = 10,
>> +		.num_subs = 64,
>> +	},
>> +};
>> +
>> +static void
>> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
>> +{
>> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
>> +
>> +struct submitter_data {
>> +	struct work_struct work;
>> +	struct sched_concurrent_test_context *ctx;
>> +	struct drm_mock_sched_entity *entity;
>> +	struct drm_mock_sched_job **jobs;
>> +	struct kunit *test;
>> +	unsigned int id;
>> +	bool timedout;
>> +};
>> +
>> +static void drm_sched_submitter_worker(struct work_struct *work)
>> +{
>> +	const struct drm_sched_concurrent_params *params;
>> +	struct sched_concurrent_test_context *ctx;
>> +	struct submitter_data *sub_data;
>> +	unsigned int i, duration_us;
>> +	unsigned long timeout_jiffies;
>> +	bool done;
>> +
>> +	sub_data = container_of(work, struct submitter_data, work);
>> +	ctx = sub_data->ctx;
>> +	params = sub_data->test->param_value;
>> +
>> +	wait_for_completion(&ctx->wait_go);
>> +
>> +	for (i = 0; i < params->num_jobs; i++) {
>> +		duration_us = params->job_base_us + (sub_data->id * 10);
> 
> Why is job duration dependent by the submitter id?

Just a simple way to have a deterministic distribution of durations.
I can change it if it doesn't fit.

> Would it be feasiable to not use auto-completing jobs and instead 
> advance the timeline manually? Given how the premise of the test seems 
> to be about concurrent submission it sounds plausible that what happens 
> after submission maybe isn't very relevant.

Good idea! I'll run some experiments and see if it works.

>> +		drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
>> +		drm_mock_sched_job_submit(sub_data->jobs[i]);
> 
> On a related note, one interesting thing to add coverage for later is 
> multi-threaded submit of multiple jobs against a single entity. But it 
> is not an immediate need. Just mentioning it as something interesting.

Currently, the test configures each submitter to submit multiple jobs
against its own dedicated entity. I considered adding a test case for
submitting multiple jobs against multiple entities, but I decided to
leave it for the future.

> It would mean open coding drm_mock_sched_job_submit() as 
> drm_sched_job_arm() and drm_sched_entity_push_job() and sticking some 
> delay in between so two threads have the chance to interleave. Mock 
> scheduler does not handle it today, neither does the scheduler itself 
> who punts responsibility to callers. So adding a test and making the 
> mock scheduler handle that properly would serve as an example on how 
> scheduler must be used. Or what can go bad if it isn't.

Do you mean having multiple (k)threads submitting against the same entity?
Would that be used to model a multithread application that uses multiple queues?

>> +	}
>> +
>> +	timeout_jiffies = usecs_to_jiffies(params->job_base_us * params->num_subs *
>> +					   params->num_jobs * 10);
> 
> The timeout calculation could use a comment. You are using num_subs * 10 
> to match the duratiot_us above being id * 10? With logic of calculating 
> a pessimistic timeout?
> 
> Have you tried it with qemu to check if it is pessimistic enough?

I'll double check on that.
 
>> +	for (i = 0; i < params->num_jobs; i++) {
>> +		done = drm_mock_sched_job_wait_finished(sub_data->jobs[i],
>> +							timeout_jiffies);
>> +		if (!done)
>> +			sub_data->timedout = true;
>> +	}
> 
> Technically you only need to wait on the last job but it is passable 
> like this too.
> 
> Also, is it important for the worker to wait for completion or the main 
> thread could simply wait for everything? Maybe that would simplify things.

I would say they serve different purposes. The completion is used to pause
all worker threads until they are all created to ensure they start submitting
jobs together to maximize concurrency.
 
> Manual timeline advance and this combined would mean the workers only 
> submit jobs, while the main thread simply does 
> drm_mock_sched_advance(sched, num_subs * num_jobs) and waits for last 
> job from each submitter to finish.
> 
> Again, auto-completion and timeout reporting is something I do not 
> immediate see is relevant for multi-threaded submission testing.
>
> Maybe if you want to test the mock scheduler itself it could be, but 
> then I would add it as separate entry in drm_sched_concurrent_cases[]. 
> Like maybe have a flag/boolean "auto-complete jobs". So one without and 
> one with that set.

I think it's a good idea and I'll experiment to see if it works.
 
> Other than that it looks tidy and was easy to follow. Only thing which 
> slightly got me was the term "subs" since I don't intuitively associate 
> it with a submitter but, well, a sub entity of some kind. Might be worth 
> renaming that to submitter(s), or even dropping the prefix in some cases 
> might be feasible (like sub(s)_data).

Agreed. I'll rename "subs" for better clarity.

> Regards,
> 
> Tvrtko
> 

Cheers,
Marco
