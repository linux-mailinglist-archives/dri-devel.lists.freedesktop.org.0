Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DgKKqHahWnfHQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:12:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA7FD7BB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9B610E13F;
	Fri,  6 Feb 2026 12:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="txDnVji0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A77610E13F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 12:12:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso3213635e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 04:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770379932; x=1770984732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTnNWMKuRG+jSdrzPn8mAyMAVE6ntJcgf6I9XpbwmCg=;
 b=txDnVji0CALiC9LXTgM7iBMUn9l5N32QuTkawqEXvDy9JXti1zml0TpNT7L6DfnOFD
 Ve6sJkATFbScAoDDgRFljQ3pYElAQTVX735h0ucm7UztV6CJTTWBNQtG7D/OF9nXrh80
 hU6LHCpeodPMnPZ7/MxNdY7JL60XLDdSr3YBKfWgTbCzWaFdFQSUjDTtOqWeX9E3dw4m
 EUQ1apBJLeWHQ/DjEgY4BjcczOdmh6MGp2s18hcylWStXfeicoYqzTmaNtQ4wSeBmT4s
 aQd10+SXcETaS4xZC5zb1IR+cZ+Hj660bKVdu64237uaNb0CIRIjJaqpg5bM6t9ZHuSS
 fx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770379932; x=1770984732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTnNWMKuRG+jSdrzPn8mAyMAVE6ntJcgf6I9XpbwmCg=;
 b=xRpfw8npsmjZCp5K9j123AFyjeKepUwaYSShc/lCkP4JCoWRNlaYPX1tKytoAdfawb
 5E/mRa53e1CeeYgFpYRwJ1G4tNQHHycQ2Fs6mp5LN757n9Jx0CVkHy+Cqt80R5Whs2SN
 6FGQjxFSUQ1JXbIAm8Ntt9AieYK24SiTR0SxpIqTbvvAf76ULh2xhdKQlkWEp7ZLn5Tx
 w7xg8pfWb2U2AwXi/fTBdn13WN7ga4O+jJ7icQGGKDnryWiWBKBARPr4jKpZf7dXSu6i
 SYpHD6xCHIopf0FgcX8imGCB58luGq3iyRG2dWMO+7FeVDuFsCZ3xfxFA33CuCQSOSOG
 uqiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt5jrJeYMWdw0HLA4HFH+x9e+gdZgXcCOYvxhyGBoajLKTbctIGMwUzLncvlSpGaBH9HgYabX+nkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFaHD47ut8/rmURzeEHP6iPLbVKZqJk23OKXnR+cyOjFRkmUlu
 MdaQkeWSYHvx7xFk9G02Dw48GFQqiyqULFxO1O3uzFwIIHP6ZLYrNZ2gP0adY1RDei8=
X-Gm-Gg: AZuq6aKi6G0sRaNbs/Q6kFHB80r9CJMutre6Y/h5GZk0czNDN6PBIbCO3J2Ou/l73JA
 9AngkBsN0x5S6ILsfP40UB1Y+aKdvwhyt1aXDyuYB2/YFOfNdveP90qFO1pwAiy/aBIjr0vz+wC
 m2d8Zxal1koBQhFxf5HHTL5ruq7ZeRyAMZlz7D1mgMnotJrRBPT0SHTX3ygOc6pPk/iN4VZsAvQ
 QZIjhbFeH9AJoptfpwSP9jGApAUmuld4VUPIa+pKmkq9lUOcRCmhhHahz+q5XdMgnfcu7QW+F1g
 bI+AIzmot++D+v4NQSi3+PcwadxCWNvKUTXZrRwTm/FOTKXP5kgJg6Tff58261170Q7rcSyhSj+
 DgLxKC21yd4H8iKz7rK2OP5RHNzbvw22dC6YeO6BxGaGcJ4uIILq2N/z2Hpg3wf3N8GlQmKDkDZ
 M319RI1zGluY0WWJ6rqlQsM+zNrlQHWT3bpyIEx9WAljk=
X-Received: by 2002:a05:600c:c165:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-48320213840mr35367385e9.18.1770379931591; 
 Fri, 06 Feb 2026 04:12:11 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d835f0sm122385125e9.14.2026.02.06.04.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 04:12:11 -0800 (PST)
Message-ID: <d5982a20-b43a-4548-b65a-2ffc5ae8bcc4@ursulin.net>
Date: Fri, 6 Feb 2026 12:12:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
To: Marco Pagani <marco.pagani@linux.dev>
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
 <dde160ab-57bd-4727-be7f-d035cd9e7f19@linux.dev>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <dde160ab-57bd-4727-be7f-d035cd9e7f19@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marco.pagani@linux.dev,m:airlied@gmail.com,m:ckoenig.leichtzumerken@gmail.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:marpagan@redhat.com,m:matthew.brost@intel.com,m:mripard@kernel.org,m:phasta@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[ursulin.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,redhat.com,intel.com,ffwll.ch,suse.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3FA7FD7BB
X-Rspamd-Action: no action


On 06/02/2026 10:36, Marco Pagani wrote:
> 
> 
> On 05/02/2026 10:53, Tvrtko Ursulin wrote:
>>
>> On 04/02/2026 16:33, Marco Pagani wrote:
>>
>> 8><
>>
>>>>>>> +	{
>>>>>>> +		.description = "Concurrently submit multiple jobs in a single entity",
>>>>>>> +		.job_base_us = 1000,
>>>>>>> +		.num_jobs = 10,
>>>>>>> +		.num_subs = 64,
>>>>>>> +	},
>>>>>>> +};
>>>>>>> +
>>>>>>> +static void
>>>>>>> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
>>>>>>> +{
>>>>>>> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
>>>>>>> +}
>>>>>>> +
>>>>>>> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
>>>>>>> +
>>>>>>> +struct submitter_data {
>>>>>>> +	struct work_struct work;
>>>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>>>> +	struct drm_mock_sched_entity *entity;
>>>>>>> +	struct drm_mock_sched_job **jobs;
>>>>>>> +	struct kunit *test;
>>>>>>> +	unsigned int id;
>>>>>>> +	bool timedout;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static void drm_sched_submitter_worker(struct work_struct *work)
>>>>>>> +{
>>>>>>> +	const struct drm_sched_concurrent_params *params;
>>>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>>>> +	struct submitter_data *sub_data;
>>>>>>> +	unsigned int i, duration_us;
>>>>>>> +	unsigned long timeout_jiffies;
>>>>>>> +	bool done;
>>>>>>> +
>>>>>>> +	sub_data = container_of(work, struct submitter_data, work);
>>>>>>> +	ctx = sub_data->ctx;
>>>>>>> +	params = sub_data->test->param_value;
>>>>>>> +
>>>>>>> +	wait_for_completion(&ctx->wait_go);
>>>>>>> +
>>>>>>> +	for (i = 0; i < params->num_jobs; i++) {
>>>>>>> +		duration_us = params->job_base_us + (sub_data->id * 10);
>>>>>>
>>>>>> Why is job duration dependent by the submitter id?
>>>>>
>>>>> Just a simple way to have a deterministic distribution of durations.
>>>>> I can change it if it doesn't fit.
>>>>>
>>>>>> Would it be feasiable to not use auto-completing jobs and instead
>>>>>> advance the timeline manually? Given how the premise of the test seems
>>>>>> to be about concurrent submission it sounds plausible that what happens
>>>>>> after submission maybe isn't very relevant.
>>>>>
>>>>> Good idea! I'll run some experiments and see if it works.
>>>>
>>>> Cool, I will await your findings in v2. :)
>>>
>>>
>>> After fiddling a bit with the code, I came to the conclusion that
>>> changing the design to use manual timeline advancement is doable, but
>>> not beneficial, since it would require serializing job submission into
>>> "batches" using a two-step process, i.e., (i) workers submit jobs, and
>>> (ii) the main thread waits for all submissions, advances the timeline,
>>> and then releases the workers for the next iteration.
>>
>> What do you mean by next iteration?
>>
>> In the patch you have each worker submit all jobs in one go.
> 
> I mean, if I change the code to use manual timeline advancement, then I
> must introduce some synchronization logic that makes the main thread
> advance the timeline only after the workers have submitted their jobs.

Oh that, I was thinking advancing after flushing the workqueue would be 
enough for this use case. Since that one does not care about when 
completions happens they can just be cleaned up at the exit.

> Since workers submit multiple jobs, I was thinking it would be better to
> have the workers submit jobs in batches instead of all in one go.

No strong opinion from me, as long as it is clear what is being tested.

>>> This approach would partially defeat the purpose of a concurrency test
>>> as it would not allow job submission (KUnit process context) to overlap
>>> with job completion (hrtimer callback interrupt context) that models
>>> asynchronous hardware in the mock scheduler, limiting contention on the
>>> DRM scheduler internal locking. Moreover, while manual advancement might
>>> appear to make the test deterministic, it does not since the order in
>>> which the workers are scheduled will still be non-deterministic.
>>
>> Ah, so it depends what is the test actually wanting to test. In my view
>> exercising parallel submit is one thing, while interleaving submission
>> with completion is something else.
>>
>> In the test as written I think there is very little of the latter. Each
>> worker submits all their jobs in one tight loop. Jobs you set to be 1ms
>> so first job completion is 1ms away from when workers are released. A
>> lot of the jobs can be submitted in 1ms and it would be interesting to
>> see exactly how much, from how many workers.
>>
>> If desire is to interleave completion and submission I think that should
>> be made more explicit (less depending on how fast is the underlying
>> machine). For example adding delays into the submit loop to actually
>> guarantee that.
> 
> Fair point.
> 
>> But I would also recommend parallel submit and parallel submit vs
>> completions are tested in separate test cases. It should be easy to do
>> with some flags and almost no new code. I was suggesting flags for some
>> other thing in the initial review as well. Right, for auto-complete. So
>> flag could be something like:
>>
>> +static const struct drm_sched_concurrent_params
>> drm_sched_concurrent_cases[] = {
>> +	{
>> +		.description = "Concurrently submit a single job in a single entity",
>> +		.job_base_us = 1000,
>> +		.num_jobs = 1,
>> +		.num_subs = 32,
>> 		.flags = INTERLEAVE_SUBMIT_AND_COMPLETE,
>> +	},
>>
>> In the submit loop:
>>
>> +	for (i = 0; i < params->num_jobs; i++) {
>> +		duration_us = params->job_base_us + (sub_data->id * 10);
>> 		if (flags & INTERLEAVE_SUBMIT_AND_COMPLETE) {
>> 			drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
>> 			// Add a delay based on time elapse and job duration to guarantee job
>> completions start arriving
>> 		}
>> +		drm_mock_sched_job_submit(sub_data->jobs[i]);
>> +	}
>>
>>
>> And of course handle the job waiting stage appropriately depending on
>> auto-complete or not.
>>
>> Anyway, testing as little as possible at a time is a best practice I
>> recommend, but if you insist, there is also nothing fundamentally wrong
>> with the test as you have it so I won't block it.
> 
> Agreed. Unit tests should test one functionality at a time and be clear
> about which one. I'll follow your suggestions and have two separate test
> cases: a basic one for concurrent submissions with manual timeline
> advancement (no batches, workers submit all jobs at once) and then a
> second one with automatic timeline advancement for testing interleaving
> submissions with completions.
> 
> At this point though, I think it would be better to move the tests to a
> separate source file, as the partial similarity of the first concurrent
> test case with drm_sched_basic_submit could create some confusion.

Works for me, thank you!

Regards,

Tvrtko

