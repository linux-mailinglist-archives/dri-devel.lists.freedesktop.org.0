Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C012EAAC4BE
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3E110E685;
	Tue,  6 May 2025 12:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qn2iYc4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635E10E685;
 Tue,  6 May 2025 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lLG6FersFwGc2hcaIdlo99ghjl2mSWJDhlLVYjU7Bc=; b=qn2iYc4oFljZpCD3AxQUINBtsj
 Yfv4kzrio2DzuAtDY5j03j1NClmiQQkii5JU7ormHd5oUfBCnrH4oldB4kQB+dPItrHIdlu2e7fuz
 eSoekcs88oWPQ0UD0lQZCiWnuTXF9dtQmw6XJ82uXBKTG1WE7/7Kvm3yQoZ3exPV8rMR30iHt0SJ1
 V1ozt62ZeQrsr1uGDN1o0318a0hzQx4dYqMGIuKkGX3ik6Jpi5DjxRNPPfhHVGfPfcH5Yi/tDt8Lf
 4m4KjleuLzhPPW1Z2FkqFPmFC/kh2ea7UahG26HW0Gvj895CR1/m2uq/r5ID1iqob5Cv/cECy7bgs
 u0C7vHow==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCHnA-004CmH-Tt; Tue, 06 May 2025 14:56:34 +0200
Message-ID: <d5277560-0aeb-4562-bfd7-4cfa16cf52ec@igalia.com>
Date: Tue, 6 May 2025 09:56:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/sched: Reduce scheduler's timeout for timeout
 tests
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-3-ed0d6701a3fe@igalia.com>
 <7cc3cc3d-7f67-4c69-bccb-32133e1d7cba@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <7cc3cc3d-7f67-4c69-bccb-32133e1d7cba@igalia.com>
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

Hi Tvrtko,

Thanks for your review!

On 06/05/25 09:03, Tvrtko Ursulin wrote:
> 
> On 03/05/2025 21:59, Maíra Canal wrote:
>> As more KUnit tests are introduced to evaluate the basic capabilities of
>> the `timedout_job()` hook, the test suite will continue to increase in
>> duration. To reduce the overall running time of the test suite, decrease
>> the scheduler's timeout for the timeout tests.
>>
>> Before this commit:
>>
>> [15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s 
>> building, 5.229s running
>>
>> After this commit:
>>
>> [15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s 
>> building, 4.037s running
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/ 
>> gpu/drm/scheduler/tests/tests_basic.c
>> index 
>> 8f960f0fd31d0af7873f410ceba2d636f58a5474..00c691cb3c306f609684f554f17fcb54ba74cb95 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> @@ -5,6 +5,8 @@
>>   #include "sched_tests.h"
>> +#define MOCK_TIMEOUT (HZ / 5)
>> +
>>   /*
>>    * DRM scheduler basic tests should check the basic functional 
>> correctness of
>>    * the scheduler, including some very light smoke testing. More 
>> targeted tests,
>> @@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit *test)
>>   static int drm_sched_timeout_init(struct kunit *test)
>>   {
>> -    test->priv = drm_mock_sched_new(test, HZ);
>> +    test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
>>       return 0;
>>   }
>> @@ -224,17 +226,17 @@ static void drm_sched_basic_timeout(struct kunit 
>> *test)
>>       drm_mock_sched_job_submit(job);
>> -    done = drm_mock_sched_job_wait_scheduled(job, HZ);
>> +    done = drm_mock_sched_job_wait_scheduled(job, MOCK_TIMEOUT);
> 
> This wait is accounting for the fact sched->wq needs to run and call - 
>  >run_job() before job will become scheduled. It is not related to 
> timeout handling. I was going for a safe value and I think decreasing it 
> will not speed up the test but may cause sporadic failures.

I'll address it in v2.

> 
>>       KUNIT_ASSERT_TRUE(test, done);
>> -    done = drm_mock_sched_job_wait_finished(job, HZ / 2);
>> +    done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT / 2);
>>       KUNIT_ASSERT_FALSE(test, done);
>>       KUNIT_ASSERT_EQ(test,
>>               job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>>               0);
>> -    done = drm_mock_sched_job_wait_finished(job, HZ);
>> +    done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
>>       KUNIT_ASSERT_FALSE(test, done);
> 
> Above two are related to timeout handling and should be safe to change.
> 
> With HZ / 5 first assert could have a false negative if timeout work 
> would run, but later than 100ms (HZ / 5 / 2). And the second a false 
> negative if it fails to run in 300ms (HZ / 5 / 2 + HZ / 5). Neither 
> failure sounds likely in the kunit environment so, again, I think those 
> two are okay to speed up.

What do you think about using a slightly bigger timeout? Maybe HZ / 4 or
HZ / 2.

Best Regards,
- Maíra

> 
> Regards,
> 
> Tvrtko
> 
>>       KUNIT_ASSERT_EQ(test,
>>
> 

