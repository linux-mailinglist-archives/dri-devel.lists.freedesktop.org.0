Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D25AEDC39
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4011310E42C;
	Mon, 30 Jun 2025 12:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TO6TC3pL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CF610E434;
 Mon, 30 Jun 2025 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CK6H37qy+MtP48/QHQbXPjvWYoze/2sbuXupit5KHZ0=; b=TO6TC3pLdVCABrphOZcEr4ToYO
 pzRtnEJpjoPY20NYh3Rxaj3jxDom9eNZs+OXWUy5dpi3CoDMtoDpdeB4H/Fl3tQ+Qx7lzIC9cNopF
 LskK2PSoF1igaQYK36ou7z3bZy1qVd07zADy0rEmS8r1p9e6U3uGjDOfp3opRsN49RX6bgibeiLRG
 bk+AxtJqkLOhmvTTw156Fkb1GTfgGBZlrx3exJ51vth0gPyONxlilgLxL0bWAEnAwol0G6pxahfp2
 bNSKCH32doLI0IcmFOPtb9meoLFnMMDWewvnDp8RgsOMHnlfUv/PgzgvGkPOe9pguoxAE9khNEeTf
 kMaB8FKw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWDGX-00ASms-37; Mon, 30 Jun 2025 14:05:41 +0200
Message-ID: <27c7fef3-ce37-48b9-bf63-3b3417618835@igalia.com>
Date: Mon, 30 Jun 2025 09:05:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/sched: Make timeout KUnit tests faster
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-3-8be5cca2725d@igalia.com>
 <2670247a8982f794a508f4cf3ae43ad7ac66862a.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <2670247a8982f794a508f4cf3ae43ad7ac66862a.camel@mailbox.org>
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

Hi Philipp,

On 30/06/25 08:53, Philipp Stanner wrote:
> On Wed, 2025-06-18 at 11:47 -0300, Maíra Canal wrote:
>> As more KUnit tests are introduced to evaluate the basic capabilities
>> of
>> the `timedout_job()` hook, the test suite will continue to increase
>> in
>> duration. To reduce the overall running time of the test suite,
>> decrease
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
> 
> I guess those times were measured with the entire series?

No, they were measured without the new test that I introduced in the
next patch.

> 
> It's not clear to me whether this patch is independent from the series.
> I suppose it is. We should aim towards having series's narrowly focused
> topic-wise, but I get why you included it here.

 From my perspective, this patch is a preparation to the next one. As
I'll introduce another timeout-related test in the next patch, I was
trying to ensure that we will keep the time-budget reasonable.

> 
> That said, is there a specific reason for you aiming at ~10s (9.263)?
> That's only a bit faster than the 15.637.
> 

Actually, the only thing that this patch affects is the runtime. So, it
went from 5.229s to 4.037s (-22.8%). However, as we add more and more
timeout tests, the absolute difference would get more significant.

> Couldn't it make sense, as you're at it already, to speed this up to
> just a few seconds, like 3-5? Then it should really be quiet IRW that
> topic for a while.

I believe that further decreasing the timeout could lead to racy
scenarios and flaky tests.

Best Regards,
- Maíra

> 
> 
> P.
> 
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> index
>> 7230057e0594c6246f02608f07fcb1f8d738ac75..41c648782f4548e202bd8711b45
>> d28eead9bd0b2 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include "sched_tests.h"
>>   
>> +#define MOCK_TIMEOUT (HZ / 5)
>> +
>>   /*
>>    * DRM scheduler basic tests should check the basic functional
>> correctness of
>>    * the scheduler, including some very light smoke testing. More
>> targeted tests,
>> @@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit
>> *test)
>>   
>>   static int drm_sched_timeout_init(struct kunit *test)
>>   {
>> -	test->priv = drm_mock_sched_new(test, HZ);
>> +	test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
>>   
>>   	return 0;
>>   }
>> @@ -227,14 +229,14 @@ static void drm_sched_basic_timeout(struct
>> kunit *test)
>>   	done = drm_mock_sched_job_wait_scheduled(job, HZ);
>>   	KUNIT_ASSERT_TRUE(test, done);
>>   
>> -	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
>> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT /
>> 2);
>>   	KUNIT_ASSERT_FALSE(test, done);
>>   
>>   	KUNIT_ASSERT_EQ(test,
>>   			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>>   			0);
>>   
>> -	done = drm_mock_sched_job_wait_finished(job, HZ);
>> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
>>   	KUNIT_ASSERT_FALSE(test, done);
>>   
>>   	KUNIT_ASSERT_EQ(test,
>>
> 

