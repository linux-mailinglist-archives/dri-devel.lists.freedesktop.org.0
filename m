Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A60B077B6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F5F10E2AA;
	Wed, 16 Jul 2025 14:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="j2OM+ZNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71210E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jtGnjAaRE5rw7FQzFBXqLybdgh/q5ka86Khq/MDbz14=; b=j2OM+ZNuHBQW3qgT3vI9oga3Uy
 kUzs8kbtgGZPqQpy4J55ndoTCKrXj6a3oYMlHZdqnKFITPLBSQzM8Df6KpozuayUPdYlsml72H/P4
 FSFpgrnW3cQG6dtrsST5xxi9BOxeW+RLN9E3abmrko5q73gX0sBezOOts6TCe6iL2zzyGOYXf0ncG
 +BIb+4rAOrIRvR844uu2AFj+HHyoBhV8VcdJs/w3tLYFLC9VaJ/dJKdRAIaSmBQ1o5t1dSkBfh5Ba
 cBdGIxN7oqifFGaVMUC/5n6X9L9MafTOUZ6R5AJSEbpxXqNYYNFM4oIqEOjh6eNrB//U0RsjRaiiu
 kdAcABWA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uc2tT-00HLQT-GB; Wed, 16 Jul 2025 16:13:59 +0200
Message-ID: <79c5974e-d1f8-4b29-8e54-4008ae54a3df@igalia.com>
Date: Wed, 16 Jul 2025 15:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix a race in DRM_GPU_SCHED_STAT_NO_HANG test
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>
References: <20250716084817.56797-1-tvrtko.ursulin@igalia.com>
 <629ab61a-ee69-43cd-a05e-b8d262cc0a51@igalia.com>
 <68b7afc6-11fc-4a80-abb7-b9b03bc5f4fe@igalia.com>
 <d01b77a1-710b-4996-80cb-c33e688a779c@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d01b77a1-710b-4996-80cb-c33e688a779c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 16/07/2025 15:05, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 16/07/25 10:41, Tvrtko Ursulin wrote:
>>
>> On 16/07/2025 13:47, Maíra Canal wrote:
>>> Hi Tvrtko,
>>>
>>> On 16/07/25 05:48, Tvrtko Ursulin wrote:
>>>> The "skip reset" test waits for the timeout handler to run for the
>>>> duration of 2 * MOCK_TIMEOUT, and because the mock scheduler opted to
>>>
>>> Would it make any sense to wait for 1.5 * MOCK_TIMEOUT? This way we
>>> would guarantee that only one timeout happened. I'm fine with the
>>> current solution as well.
>>
>> 1.5 * MOCK_TIMEOUT would work as well. I considered it, and even 
>> though I thought it would be safe, I concluded that it is better to 
>> have fewer dependencies on timings given these are two threads in this 
>> story.
> 
> Why not both? Just to make sure we won't run the timedout function
> twice, but still fixing the timing dependency by using
> DRM_MOCK_SCHED_JOB_RESET_SKIPPED.

Just because I think probably does not guarantee timedout worker does 
not run twice. It still in _theory_ could if the unit test thread would 
be starved by some other system activity. In practice however it does 
work, because nothing much is running in parallel to the unit test, for 
vast majority of use cases. So I thought someone would be bound to 
complain if I just did the 1.5x approach. If no one objects I can add 
that tweak, no problem.

>> Making the DRM_MOCK_SCHED_JOB_DONT_RESET persist allows for not having 
>> to think about timings. So slight preference to that. At least until 
>> some more advanced tests are attempted to be added.
>>
>>>> remove the "skip reset" flag once it fires, this gives opportunity 
>>>> for the
>>>> timeout handler to run twice. Second time the job will be removed 
>>>> from the
>>>> mock scheduler job list and the drm_mock_sched_advance() call in the 
>>>> test
>>>> will fail.
>>>>
>>>> Fix it by making the "don't reset" flag persist for the lifetime of the
>>>> job and add a new flag to verify that the code path had executed as
>>>> expected.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: 1472e7549f84 ("drm/sched: Add new test for 
>>>> DRM_GPU_SCHED_STAT_NO_HANG")
>>>  > Cc: Maíra Canal <mcanal@igalia.com>> Cc: Philipp Stanner 
>>> <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
>>>>   drivers/gpu/drm/scheduler/tests/sched_tests.h    | 7 ++++---
>>>>   drivers/gpu/drm/scheduler/tests/tests_basic.c    | 4 ++--
>>>>   3 files changed, 7 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/ 
>>>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> index 65acffc3fea8..8e9ae7d980eb 100644
>>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> @@ -219,7 +219,7 @@ mock_sched_timedout_job(struct drm_sched_job 
>>>> *sched_job)
>>>>       unsigned long flags;
>>>>       if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
>>>> -        job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;
>>>> +        job->flags |= DRM_MOCK_SCHED_JOB_RESET_SKIPPED;
>>>>           return DRM_GPU_SCHED_STAT_NO_HANG;
>>>>       }
>>>> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/ 
>>>> drivers/ gpu/drm/scheduler/tests/sched_tests.h
>>>> index 63d4f2ac7074..5b262126b776 100644
>>>> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>> @@ -95,9 +95,10 @@ struct drm_mock_sched_job {
>>>>       struct completion    done;
>>>> -#define DRM_MOCK_SCHED_JOB_DONE        0x1
>>>> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT    0x2
>>>> -#define DRM_MOCK_SCHED_JOB_DONT_RESET    0x4
>>>> +#define DRM_MOCK_SCHED_JOB_DONE            0x1
>>>> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT        0x2
>>>> +#define DRM_MOCK_SCHED_JOB_DONT_RESET        0x4
>>>> +#define DRM_MOCK_SCHED_JOB_RESET_SKIPPED    0x8
>>>>       unsigned long        flags;
>>>>       struct list_head    link;
>>>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/ 
>>>> drivers/ gpu/drm/scheduler/tests/tests_basic.c
>>>> index 55eb142bd7c5..82a41a456b0a 100644
>>>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>>> @@ -317,8 +317,8 @@ static void drm_sched_skip_reset(struct kunit 
>>>> *test)
>>>>       KUNIT_ASSERT_FALSE(test, done);
>>>>       KUNIT_ASSERT_EQ(test,
>>>> -            job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
>>>> -            0);
>>>> +            job->flags & DRM_MOCK_SCHED_JOB_RESET_SKIPPED,
>>>> +            DRM_MOCK_SCHED_JOB_RESET_SKIPPED);
>>>
>>> Maybe we could assert that job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT == 0
>>
>> Could but I am not sure it is needed.
> 
> Np.
> 
>>
>>> Anyway, thanks for the fix!
>>>
>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>
>> Thank you!
>>
>> Btw the failure for the record:
>>
>> [09:07:20] # drm_sched_skip_reset: ASSERTION FAILED at drivers/gpu/ 
>> drm/ scheduler/tests/tests_basic.c:324
>> [09:07:20] Expected i == 1, but
>> [09:07:20]     i == 0 (0x0)
>> [09:07:20] [FAILED] drm_sched_skip_reset
>> [09:07:20]     # module: drm_sched_tests
>> [09:07:20] # drm_sched_basic_timeout_tests: pass:1 fail:1 skip:0 total:2
>> [09:07:20] # Totals: pass:1 fail:1 skip:0 total:2
> 
> Unfortunately, I didn't get this error during my test run. On the other
> hand, I only ran it once before pushing the series, so that's on me.
> Thanks for catching it!

No worries.

Regards,

Tvrtko

>>>>       i = drm_mock_sched_advance(sched, 1);
>>>>       KUNIT_ASSERT_EQ(test, i, 1);
>>>
>>
> 

