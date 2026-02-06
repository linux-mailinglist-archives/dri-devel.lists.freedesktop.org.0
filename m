Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCWvNkbEhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:36:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EAFCB45
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABA510E6DC;
	Fri,  6 Feb 2026 10:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rbo5y87v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E9610E6DC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 10:36:50 +0000 (UTC)
Message-ID: <dde160ab-57bd-4727-be7f-d035cd9e7f19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1770374208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJRg6jkYseTlq8LkgR1U1HOl8jEdRnpvJKa+yUEU3RM=;
 b=rbo5y87v9CB8C7p/2nVX+a3MSlNz4ddTYKAxM32gqZeUV5wuKF36tlwIntld4RM+d7mlYb
 /W69IW+m+zGc0v4WsACZIXc6jxwXIZJgYjU5gJI1DoYTixq1tPRZPpt6NYgoQkenfmkd5E
 iRNqpWdJn2tQRJhF4y1d9uaONO9GN8o=
Date: Fri, 6 Feb 2026 11:36:45 +0100
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, marpagan@redhat.com,
 matthew.brost@intel.com, mripard@kernel.org, phasta@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <79cf2013-da6b-4653-aaa8-3e29a7d1ee3a@ursulin.net>
 <90cdb121-7ff2-43a5-9327-2898b5e65609@linux.dev>
 <36b2f7b1-f38e-41b6-b7e5-107a80c028d0@ursulin.net>
 <dcdd45d4-a5fe-41af-a86c-cf4cede6e5d6@linux.dev>
 <07c8c588-c2d6-463d-aabc-d472b8f38be8@ursulin.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Marco Pagani <marco.pagani@linux.dev>
In-Reply-To: <07c8c588-c2d6-463d-aabc-d472b8f38be8@ursulin.net>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,redhat.com,intel.com,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:airlied@gmail.com,m:ckoenig.leichtzumerken@gmail.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:marpagan@redhat.com,m:matthew.brost@intel.com,m:mripard@kernel.org,m:phasta@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.pagani@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 417EAFCB45
X-Rspamd-Action: no action



On 05/02/2026 10:53, Tvrtko Ursulin wrote:
> 
> On 04/02/2026 16:33, Marco Pagani wrote:
> 
> 8><
> 
>>>>>> +	{
>>>>>> +		.description = "Concurrently submit multiple jobs in a single entity",
>>>>>> +		.job_base_us = 1000,
>>>>>> +		.num_jobs = 10,
>>>>>> +		.num_subs = 64,
>>>>>> +	},
>>>>>> +};
>>>>>> +
>>>>>> +static void
>>>>>> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
>>>>>> +{
>>>>>> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
>>>>>> +}
>>>>>> +
>>>>>> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
>>>>>> +
>>>>>> +struct submitter_data {
>>>>>> +	struct work_struct work;
>>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>>> +	struct drm_mock_sched_entity *entity;
>>>>>> +	struct drm_mock_sched_job **jobs;
>>>>>> +	struct kunit *test;
>>>>>> +	unsigned int id;
>>>>>> +	bool timedout;
>>>>>> +};
>>>>>> +
>>>>>> +static void drm_sched_submitter_worker(struct work_struct *work)
>>>>>> +{
>>>>>> +	const struct drm_sched_concurrent_params *params;
>>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>>> +	struct submitter_data *sub_data;
>>>>>> +	unsigned int i, duration_us;
>>>>>> +	unsigned long timeout_jiffies;
>>>>>> +	bool done;
>>>>>> +
>>>>>> +	sub_data = container_of(work, struct submitter_data, work);
>>>>>> +	ctx = sub_data->ctx;
>>>>>> +	params = sub_data->test->param_value;
>>>>>> +
>>>>>> +	wait_for_completion(&ctx->wait_go);
>>>>>> +
>>>>>> +	for (i = 0; i < params->num_jobs; i++) {
>>>>>> +		duration_us = params->job_base_us + (sub_data->id * 10);
>>>>>
>>>>> Why is job duration dependent by the submitter id?
>>>>
>>>> Just a simple way to have a deterministic distribution of durations.
>>>> I can change it if it doesn't fit.
>>>>
>>>>> Would it be feasiable to not use auto-completing jobs and instead
>>>>> advance the timeline manually? Given how the premise of the test seems
>>>>> to be about concurrent submission it sounds plausible that what happens
>>>>> after submission maybe isn't very relevant.
>>>>
>>>> Good idea! I'll run some experiments and see if it works.
>>>
>>> Cool, I will await your findings in v2. :)
>>
>>
>> After fiddling a bit with the code, I came to the conclusion that
>> changing the design to use manual timeline advancement is doable, but
>> not beneficial, since it would require serializing job submission into
>> "batches" using a two-step process, i.e., (i) workers submit jobs, and
>> (ii) the main thread waits for all submissions, advances the timeline,
>> and then releases the workers for the next iteration.
> 
> What do you mean by next iteration?
> 
> In the patch you have each worker submit all jobs in one go.

I mean, if I change the code to use manual timeline advancement, then I
must introduce some synchronization logic that makes the main thread
advance the timeline only after the workers have submitted their jobs.
Since workers submit multiple jobs, I was thinking it would be better to
have the workers submit jobs in batches instead of all in one go.

>> This approach would partially defeat the purpose of a concurrency test
>> as it would not allow job submission (KUnit process context) to overlap
>> with job completion (hrtimer callback interrupt context) that models
>> asynchronous hardware in the mock scheduler, limiting contention on the
>> DRM scheduler internal locking. Moreover, while manual advancement might
>> appear to make the test deterministic, it does not since the order in
>> which the workers are scheduled will still be non-deterministic.
> 
> Ah, so it depends what is the test actually wanting to test. In my view 
> exercising parallel submit is one thing, while interleaving submission 
> with completion is something else.
> 
> In the test as written I think there is very little of the latter. Each 
> worker submits all their jobs in one tight loop. Jobs you set to be 1ms 
> so first job completion is 1ms away from when workers are released. A 
> lot of the jobs can be submitted in 1ms and it would be interesting to 
> see exactly how much, from how many workers.
> 
> If desire is to interleave completion and submission I think that should 
> be made more explicit (less depending on how fast is the underlying 
> machine). For example adding delays into the submit loop to actually 
> guarantee that.

Fair point.

> But I would also recommend parallel submit and parallel submit vs 
> completions are tested in separate test cases. It should be easy to do 
> with some flags and almost no new code. I was suggesting flags for some 
> other thing in the initial review as well. Right, for auto-complete. So 
> flag could be something like:
> 
> +static const struct drm_sched_concurrent_params 
> drm_sched_concurrent_cases[] = {
> +	{
> +		.description = "Concurrently submit a single job in a single entity",
> +		.job_base_us = 1000,
> +		.num_jobs = 1,
> +		.num_subs = 32,
> 		.flags = INTERLEAVE_SUBMIT_AND_COMPLETE,
> +	},
> 
> In the submit loop:
> 
> +	for (i = 0; i < params->num_jobs; i++) {
> +		duration_us = params->job_base_us + (sub_data->id * 10);
> 		if (flags & INTERLEAVE_SUBMIT_AND_COMPLETE) {
> 			drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
> 			// Add a delay based on time elapse and job duration to guarantee job 
> completions start arriving
> 		}
> +		drm_mock_sched_job_submit(sub_data->jobs[i]);
> +	}
> 
> 
> And of course handle the job waiting stage appropriately depending on 
> auto-complete or not.
> 
> Anyway, testing as little as possible at a time is a best practice I 
> recommend, but if you insist, there is also nothing fundamentally wrong 
> with the test as you have it so I won't block it.

Agreed. Unit tests should test one functionality at a time and be clear
about which one. I'll follow your suggestions and have two separate test
cases: a basic one for concurrent submissions with manual timeline
advancement (no batches, workers submit all jobs at once) and then a
second one with automatic timeline advancement for testing interleaving
submissions with completions.

At this point though, I think it would be better to move the tests to a
separate source file, as the partial similarity of the first concurrent
test case with drm_sched_basic_submit could create some confusion.

Thanks,
Marco
