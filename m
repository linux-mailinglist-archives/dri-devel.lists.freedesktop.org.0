Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIqkH4pohGlK2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:53:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488ECF10C8
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1373110E85E;
	Thu,  5 Feb 2026 09:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="bVufo2j7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56110E867
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:53:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4806fbc6bf3so8032825e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770285186; x=1770889986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jt5qFgvsp4y6rljnasFjorD9RMuETz1hh2SdwFEi/FA=;
 b=bVufo2j7n2nsvbF42GJu/VdN18+5W5t6GMfctV3I4FQz/E7w3jQk4I7Wx96S/RabuU
 MihZzBL3m80VZhqgZKfNs2xSDbMe4M0L2UcOIw4WlVXTJ2QdPWvnXIqtW3dCHqwFzMsR
 g7zO1aMTDswJjWaPmFgUCRJYS8oWIhxVA7Gfmql8rxnA6FW/PPTUyQB6MTsH85JQVIGd
 IuKuL2GhBabb8QzlQMqp66E8KMkkID2XVyL8pNPUkJvf8QjKnZtKkzsCpDvRe0ygTuCK
 Rfn6lcKWHunQIrTM7eIJhqCvVD3Ax3FRU5dimcWu1iKtohz94IS+L9zgWQ0O31SDyI0d
 WoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770285186; x=1770889986;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jt5qFgvsp4y6rljnasFjorD9RMuETz1hh2SdwFEi/FA=;
 b=FSr2B2lX4ewFrTkWpL7oSxK9ha4feNijcH7gj/XQu5g9tXu6xtaYNoWjTubt9zbMpa
 a2G2Rfe9Y+PSY85aQ+wKAO8gDEv0jYAdMYP6F/SRb7HHHDq4/ULbyFwKSx04sBTWJuf4
 F1Xp+gVH+ixTRDTkvUFZAWcSOGoxvaSJ+H0NyrQ4AeL56jWeyrCeqpxBMH/a0e0QMmB2
 siubXbXCg5c6qHX5nLZJ+A7sVdQgfnsgXkynNIedXaP4/1YDfrK4yNi8akV74aFUyJYE
 vCWC1aum833ZsQv1rBX1Cp0p7MuH+OWgQna3Vc+CjyMQ0T5sJS8isDGvK3kqRvAnvtSn
 N3sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcK1aUASkr4QkE1giqhry64DK7rwHS6te8Y+AHPLpsrS9ucAsSG3Hel2Mx23XH/xInErRHuQSs2Jk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzztVZj23qWV79cj8SWOGGyUL70gf+bBNMLqTsMSyyI6zAwCt6j
 xZXkNmVu81X7IF/o1GOPKxmLl8xIATJIvrjczKpM9VAg35wmYrXWSOlsI+Q6bFhYTZQ=
X-Gm-Gg: AZuq6aJkqsUTuJSJ9UdYteXEPGJbSIMPBjoAECMO6/HxbhygCzHbMUbmzXclp46HMX7
 woBblJryIsRDsSxPY9VJaXjlr/7sJNeORgomL3XP830qT2EVEUuj//+F44BsCt8Z5lmg6rrmr35
 shSa5qARnUy4IUjT+xmfyAsmvqeLAcnBP1HBVBSzFCc/07AS91TMdkIIh0wwXbaxT959sn5F7su
 WFLEcTaAo75+8ERLXPTMP7gF1dIy/hPZTCX2vLX3JHq4A8lvTJfWvtGXLvzP5mzMvEK8p3tzPY2
 jgVs9uqt4uD4zyLZ/AOscIC2lnXp2AN0GdUMgThO0gkAk7SxA/k0dAACRMJ0HkY/A5oFq3KEeUA
 FN5q7tQbySSTSkwFuBGivxZVRpDMhJB6zZoy1k8zVx1ELTfLhmTv6Cqtl1w+/DpYPc2hHdQSKDK
 iWCjwWIrI0A2s8D/xZuThOLH/ASfnjhwuz
X-Received: by 2002:a05:600c:3e11:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-4830e93ee70mr82093775e9.15.1770285186175; 
 Thu, 05 Feb 2026 01:53:06 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436234781fbsm3315701f8f.15.2026.02.05.01.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:53:05 -0800 (PST)
Message-ID: <07c8c588-c2d6-463d-aabc-d472b8f38be8@ursulin.net>
Date: Thu, 5 Feb 2026 09:53:05 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <dcdd45d4-a5fe-41af-a86c-cf4cede6e5d6@linux.dev>
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
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:marco.pagani@linux.dev,m:airlied@gmail.com,m:ckoenig.leichtzumerken@gmail.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:marpagan@redhat.com,m:matthew.brost@intel.com,m:mripard@kernel.org,m:phasta@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 488ECF10C8
X-Rspamd-Action: no action


On 04/02/2026 16:33, Marco Pagani wrote:

8><

>>>>> +	{
>>>>> +		.description = "Concurrently submit multiple jobs in a single entity",
>>>>> +		.job_base_us = 1000,
>>>>> +		.num_jobs = 10,
>>>>> +		.num_subs = 64,
>>>>> +	},
>>>>> +};
>>>>> +
>>>>> +static void
>>>>> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *params, char *desc)
>>>>> +{
>>>>> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
>>>>> +}
>>>>> +
>>>>> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_sched_concurrent_desc);
>>>>> +
>>>>> +struct submitter_data {
>>>>> +	struct work_struct work;
>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>> +	struct drm_mock_sched_entity *entity;
>>>>> +	struct drm_mock_sched_job **jobs;
>>>>> +	struct kunit *test;
>>>>> +	unsigned int id;
>>>>> +	bool timedout;
>>>>> +};
>>>>> +
>>>>> +static void drm_sched_submitter_worker(struct work_struct *work)
>>>>> +{
>>>>> +	const struct drm_sched_concurrent_params *params;
>>>>> +	struct sched_concurrent_test_context *ctx;
>>>>> +	struct submitter_data *sub_data;
>>>>> +	unsigned int i, duration_us;
>>>>> +	unsigned long timeout_jiffies;
>>>>> +	bool done;
>>>>> +
>>>>> +	sub_data = container_of(work, struct submitter_data, work);
>>>>> +	ctx = sub_data->ctx;
>>>>> +	params = sub_data->test->param_value;
>>>>> +
>>>>> +	wait_for_completion(&ctx->wait_go);
>>>>> +
>>>>> +	for (i = 0; i < params->num_jobs; i++) {
>>>>> +		duration_us = params->job_base_us + (sub_data->id * 10);
>>>>
>>>> Why is job duration dependent by the submitter id?
>>>
>>> Just a simple way to have a deterministic distribution of durations.
>>> I can change it if it doesn't fit.
>>>
>>>> Would it be feasiable to not use auto-completing jobs and instead
>>>> advance the timeline manually? Given how the premise of the test seems
>>>> to be about concurrent submission it sounds plausible that what happens
>>>> after submission maybe isn't very relevant.
>>>
>>> Good idea! I'll run some experiments and see if it works.
>>
>> Cool, I will await your findings in v2. :)
> 
> 
> After fiddling a bit with the code, I came to the conclusion that
> changing the design to use manual timeline advancement is doable, but
> not beneficial, since it would require serializing job submission into
> "batches" using a two-step process, i.e., (i) workers submit jobs, and
> (ii) the main thread waits for all submissions, advances the timeline,
> and then releases the workers for the next iteration.

What do you mean by next iteration?

In the patch you have each worker submit all jobs in one go.

> This approach would partially defeat the purpose of a concurrency test
> as it would not allow job submission (KUnit process context) to overlap
> with job completion (hrtimer callback interrupt context) that models
> asynchronous hardware in the mock scheduler, limiting contention on the
> DRM scheduler internal locking. Moreover, while manual advancement might
> appear to make the test deterministic, it does not since the order in
> which the workers are scheduled will still be non-deterministic.

Ah, so it depends what is the test actually wanting to test. In my view 
exercising parallel submit is one thing, while interleaving submission 
with completion is something else.

In the test as written I think there is very little of the latter. Each 
worker submits all their jobs in one tight loop. Jobs you set to be 1ms 
so first job completion is 1ms away from when workers are released. A 
lot of the jobs can be submitted in 1ms and it would be interesting to 
see exactly how much, from how many workers.

If desire is to interleave completion and submission I think that should 
be made more explicit (less depending on how fast is the underlying 
machine). For example adding delays into the submit loop to actually 
guarantee that.

But I would also recommend parallel submit and parallel submit vs 
completions are tested in separate test cases. It should be easy to do 
with some flags and almost no new code. I was suggesting flags for some 
other thing in the initial review as well. Right, for auto-complete. So 
flag could be something like:

+static const struct drm_sched_concurrent_params 
drm_sched_concurrent_cases[] = {
+	{
+		.description = "Concurrently submit a single job in a single entity",
+		.job_base_us = 1000,
+		.num_jobs = 1,
+		.num_subs = 32,
		.flags = INTERLEAVE_SUBMIT_AND_COMPLETE,
+	},

In the submit loop:

+	for (i = 0; i < params->num_jobs; i++) {
+		duration_us = params->job_base_us + (sub_data->id * 10);
		if (flags & INTERLEAVE_SUBMIT_AND_COMPLETE) {
			drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
			// Add a delay based on time elapse and job duration to guarantee job 
completions start arriving
		}
+		drm_mock_sched_job_submit(sub_data->jobs[i]);
+	}


And of course handle the job waiting stage appropriately depending on 
auto-complete or not.

Anyway, testing as little as possible at a time is a best practice I 
recommend, but if you insist, there is also nothing fundamentally wrong 
with the test as you have it so I won't block it.

Regards,

Tvrtko

