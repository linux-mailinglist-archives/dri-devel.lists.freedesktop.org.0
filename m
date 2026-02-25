Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPCYAPS6nmnwWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:03:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1819495D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8B10E726;
	Wed, 25 Feb 2026 09:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="aODOxJK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C844210E726
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:03:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso54732525e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772010221; x=1772615021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ZB8jV8qLmGH2ZIztptAMb8XrOcRD/IVTNsWeRT0Pf0=;
 b=aODOxJK5rhTJ0w5Cn8sDPAzZzTHyCMmA9MBAaw3/2wQWtnQT6DZVwJ2VthOlPhNgEm
 4ngmpLEIRnRNlRPui2Y3nS/IkQQfh3PWs0iKYeQP+EHFSO4u2E/8+3KJ3bybPl3kElfA
 lS6iiW5Zlp2eklJHBjA9G7JjmLHMJ6nIn7Pc3w0dHPjt+gimF6xwDubK08SKzQBsol7J
 EuDLUoi1vuUv4FovZ6JTyjXBiw10eUkLm5eFGGagQUtvnUgTQJKKAkrvG9tVd9LTmtYY
 MGVizYpWcXRqbbmB3nUWeBWC8K0DqPcmqbSfD8WJgzqOi3oQ/uA4G7BMK3MiqA+2eHYU
 iDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772010221; x=1772615021;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ZB8jV8qLmGH2ZIztptAMb8XrOcRD/IVTNsWeRT0Pf0=;
 b=wdTe0AlFoT62ncaTSNWJOyaSdGBiAr6UmLIK7fFv2u8f1UlUb36J+tFizftRa4UOkg
 rXwKuzDg5Nhj/XfSIyHsrcERVeH7J0BCS82CjsHaNVG+TNa0X61QAm7tKxNaVZWqxMzm
 At6SucbSx3cm96zxCGLX4p0uCoqiKOjNat4yqbdwEcfT4h40iu6v9wjSWShCx/M8XdnV
 Fms6ZjdH/duIJ+JvBSnTWpRTRdUc49dM9/Bf2xDJTDCQ7ESB210G2R6ruSM9Q3T+44sr
 6eGmIiE2+vBR3Cupj9q5pBxTacSur3LcfWMfnG17jALpg/8g5euyiSNtIbaSA7EwAXtg
 WwVg==
X-Gm-Message-State: AOJu0YxeNBQMi/V8jypd2LFW1EDENzNlONSNanQ8W6vt2BHfYP+hN2kH
 Ar8sQPhm9yIvOq8zo4ldu6Nj2P9gCgZ1fDZrjZ48Va+6JmgurGRGHUYgFDzu9gqHIrvgjHAsvT1
 MtulVGk0=
X-Gm-Gg: ATEYQzxZknx0oA/kvxoYhgSsLKt/m8SD6Urn0luMTnku2eLT13BnzjLu08S9Jmf3eEa
 AUPpjT4fXLYUBY50YsI70Gs7PKoFTETZdA0B+1dLOro+ZenYyuFthMzhF9URcaFYhPD2LVdrepn
 nKEuXUPF59INle+3I1Uf9jV1jB3Pa/b02nHWkoYcUnXmG9tF0fsVYcuPetbwQhbSyXJ20zK9lEx
 inrEZPRH3i2yUle7NOYI5rurO4eZrWYuc6rfWA6mt4FfvAFsJyf8Oz06P/6YVfVTKNul+yw/lr9
 7P7ELGyRJino1cy6DBunxDIizBVOoe4XS9ygV+tnu0Tqd0VEEv24cI+i2cTaT2C3eVLgSTAjsMo
 yPjM6UDpHnr9pSKXJL+mVCbwRQnb/b9fvrAUVr7dCAZXo4ahgWLna7mw63LofPXesp2D5aYmXRZ
 AlfNZADkt8F8I/3NNKYAqsm6cf1uH4dM3IVUabXXd2501N
X-Received: by 2002:a05:600c:6298:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-483a95eb81fmr233148635e9.6.1772010220728; 
 Wed, 25 Feb 2026 01:03:40 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd70b3f3sm60958015e9.6.2026.02.25.01.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 01:03:39 -0800 (PST)
Message-ID: <62024790-d792-4789-9452-f5b294969a9a@ursulin.net>
Date: Wed, 25 Feb 2026 09:03:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Add new KUnit test suite for concurrent job
 submission
To: phasta@kernel.org, Marco Pagani <marco.pagani@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260219140711.3296237-1-marco.pagani@linux.dev>
 <e215efdd-c547-4ce4-affe-7198ed37c2a6@ursulin.net>
 <f5c76fe9d70f106f58b9f06f644534c2cead96fd.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <f5c76fe9d70f106f58b9f06f644534c2cead96fd.camel@mailbox.org>
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
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:marco.pagani@linux.dev,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25D1819495D
X-Rspamd-Action: no action


On 25/02/2026 07:47, Philipp Stanner wrote:
> On Mon, 2026-02-23 at 16:25 +0000, Tvrtko Ursulin wrote:
>>
>> On 19/02/2026 14:07, Marco Pagani wrote:
>>> Add a new test suite to simulate concurrent job submissions to the DRM
>>> scheduler. The suite includes two initial test cases: (i) a primary test
>>> case for parallel job submission and (ii) a secondary test case for
>>> interleaved job submission and completion. In the first test case, worker
>>> threads concurrently submit jobs to the scheduler and then the timeline is
>>> manually advanced. In the second test case, worker threads periodically
>>> submit a sequence of jobs to the mock scheduler. Periods are chosen as
>>> harmonic, starting from a base period, to allow interleaving between
>>> submission and completion. To avoid impractically large execution times,
>>> periods are cycled. The timeline is advanced automatically when the jobs
>>> completes. This models how job submission from userspace (in process
>>> context) may interleave with job completion (hrtimer callback interrupt
>>> context, in the test case) by a physical device.
> 
> I still maintain the opinion expressed the last time: that the commit
> message should make explicit why the patch / test is added. Which this
> doesn't do. It just says: "We add X", but not "Currently, the problem
> is that YZ, thus we need X".
> (also breaking longer commit messages into paragraphs is nice)
> 
> Also see my comments about interleaved submits below.

I'll address the ones addressed to me.

8><

>>> +struct drm_sched_parallel_params {
>>> +	const char *description;
>>> +	unsigned int num_jobs;
>>> +	unsigned int num_workers;
>>> +};
>>> +
>>> +static const struct drm_sched_parallel_params drm_sched_parallel_cases[] = {
>>> +	{
>>> +		.description = "Workers submitting multiple jobs against a single entity",
>>
>> Each worker has own entity so the description is a bit confusing.
> 
> Do you have a suggestion for a better one?

Along the lines of:

"Multiple workers submitting multiple jobs from their entity"

8><

>>> +	}
>>> +
>>> +	for (i = 0; i < params->num_workers; i++) {
>>> +		INIT_WORK(&workers[i].work, drm_sched_parallel_worker);
>>> +		queue_work(ctx->sub_wq, &workers[i].work);
>>> +	}
>>> +
>>> +	complete_all(&ctx->wait_go);
>>> +	flush_workqueue(ctx->sub_wq);
>>> +
>>> +	for (i = 0; i < params->num_workers; i++) {
>>> +		for (j = 0; j < params->num_jobs; j++) {
>>> +			done = drm_mock_sched_job_wait_scheduled(workers[i].jobs[j],
>>> +								 HZ);
> 
> same
> 
>>> +			KUNIT_ASSERT_TRUE(test, done);
>>> +
>>> +			done = drm_mock_sched_job_is_finished(workers[i].jobs[j]);
>>> +			KUNIT_ASSERT_FALSE(test, done);
>>
>> This second assert does not seem to be bringing much value, but instead
>> makes the reader ask themselves why it is there. Remove it?
>>
>> Hmm in fact this whole loop could be removed. All that it is needed
>> below is to wait for the last job to be completed.
> 
> I suppose it's being tested whether all jobs are finished. That sounds
> clean and not harmful to me.

No, it is assert false. It is testing the jobs have been scheduled but 
not completed before the timeline is manually advanced. Both those 
behaviours are already covered by the existing basic test cases.

In my view the general best practice is to focus on the thing being 
tested, which in this case is the submission side of things. The rest 
can just distract the reader. And in this case that is parallel 
submission, which is all done and dusted by the time flush_workqueue 
above finishes. Everything after that point is just test cleanup.

So I see it as this:

/* Release parallel submit workers */

complete_all(&ctx->wait_go);

/* Wait for all of them to submit all their jobs */

flush_workqueue(ctx->sub_wq);

/* Testing done, cleanup all jobs before exiting */

completed_jobs = drm_mock_sched_advance(ctx->sched,
					params->num_workers * params->num_jobs);
KUNIT_ASSERT_EQ(test, completed_jobs, params->num_workers * 
params->num_jobs);

for (i = 0; i < params->num_workers; i++) {
	done = 
drm_mock_sched_job_wait_finished(workers[i].jobs[params->num_jobs - 1], HZ);
	KUNIT_ASSERT_TRUE(test, done);
}

Regards,

Tvrtko

