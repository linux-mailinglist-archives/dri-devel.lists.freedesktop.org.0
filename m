Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE86AAC5FD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7170E10E6A3;
	Tue,  6 May 2025 13:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aq3Ew49+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE83E10E697;
 Tue,  6 May 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EHfN8LDY7qRx9g7dClg5bRxtan3Hx0I+tPKumPWwfpk=; b=aq3Ew49+b06WAHLdqPLJfwIl8C
 +5KfVKEugvdhgVwW69ipifMqJOMvH9jWVyGksiQFEKWXuLNKACUVcFdJvhSSRCVdfgYHrrOnoTW2J
 Osc843iGAv3mI2SiuOXY47NOwYlowZyU44f3GoHq+OqUmmLytunzSzmF7OViP4/wKWbpixC7BCLuX
 oJLVGv3vNxN6oHLWWR/dG7yWlhVbv9hz9G9ZsrNAO4FLytC0LLXDh5+Rw9fDYzsENgi2nXcZ8ZFwr
 WMLUv0bJ7bWp4gSbmoyBOmbAA1cT34LANCv7dOebIFN9HBaZzyM/CcXIzDgDCovzC9mp5NuHRqYzn
 s9k4jq+w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCIHp-004DZK-5m; Tue, 06 May 2025 15:28:15 +0200
Message-ID: <7d1e7571-8fde-40e2-8ce9-a956389ea2c0@igalia.com>
Date: Tue, 6 May 2025 14:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/sched: Always free the job after the timeout
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
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
 <20250503-sched-skip-reset-v1-2-ed0d6701a3fe@igalia.com>
 <3fe178ec-9c16-4abc-b302-64f0077d8af4@igalia.com>
 <af650a53-0625-41f3-876c-006a807ad801@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <af650a53-0625-41f3-876c-006a807ad801@igalia.com>
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


On 06/05/2025 13:46, Maíra Canal wrote:
> Hi Tvrtko,
> 
> Thanks for your review!
> 
> On 06/05/25 08:49, Tvrtko Ursulin wrote:
>>
>> On 03/05/2025 21:59, Maíra Canal wrote:
>>> Currently, if we add the assertions presented in this commit to the mock
>>> scheduler, we will see the following output:
>>>
>>> [15:47:08] ============== [PASSED] drm_sched_basic_tests ==============
>>> [15:47:08] ======== drm_sched_basic_timeout_tests (1 subtest) =========
>>> [15:47:08] # drm_sched_basic_timeout: ASSERTION FAILED at drivers/ 
>>> gpu/ drm/scheduler/tests/tests_basic.c:246
>>> [15:47:08] Expected list_empty(&sched->job_list) to be true, but is 
>>> false
>>> [15:47:08] [FAILED] drm_sched_basic_timeout
>>> [15:47:08] # module: drm_sched_tests
>>>
>>> This occurs because `mock_sched_timedout_job()` doesn't properly handle
>>> the hang. From the DRM sched documentation, `drm_sched_stop()` and
>>> `drm_sched_start()` are typically used for reset recovery. If these
>>> functions are not used, the offending job won't be freed and should be
>>> freed by the caller.
>>>
>>> Currently, the mock scheduler doesn't use the functions provided by the
>>> API, nor does it handle the freeing of the job. As a result, the job 
>>> isn't
>>> removed from the job list.
>>
>> For the record the job does gets freed via the kunit managed allocation.
> 
> Sorry, I didn't express myself correctly. Indeed, it is. I meant that
> the DRM scheduler didn't free the job.
> 
>>
>> It was a design choice for this test to be a *strict* unit test which 
>> tests only a _single_ thing. And that is that the timedout_job() hook 
>> gets called. As such the hook was implemented to satisfy that single 
>> requirement only.
>>
> 
> What do you think about checking that `sched->job_list` won't be empty?
> 
> I wanted to add such assertion to make sure that the behavior of the
> timeout won't change in future (e.g. a patch makes a change that calls
> `free_job()` for the guilty job at timeout). Does it make sense to you?

Where would that assert be?

>> But I also do not oppose making it test multiple things in one test 
>> per se.
>>
>>> This commit mocks a GPU reset by stopping the scheduler affected by the
>>> reset, waiting a couple of microseconds to mimic a hardware reset, and
>>> then restart the affected scheduler.
>>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 10 ++++++++++
>>>   drivers/gpu/drm/scheduler/tests/tests_basic.c    |  3 +++
>>>   2 files changed, 13 insertions(+)
>>>
> 
> [...]
> 
>>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/ 
>>> gpu/drm/scheduler/tests/tests_basic.c
>>> index 
>>> 7230057e0594c6246f02608f07fcb1f8d738ac75..8f960f0fd31d0af7873f410ceba2d636f58a5474 100644
>>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>>> @@ -241,6 +241,9 @@ static void drm_sched_basic_timeout(struct kunit 
>>> *test)
>>>               job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>>>               DRM_MOCK_SCHED_JOB_TIMEDOUT);
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
>>
>> Hmm I think this assert could be racy because it appears to rely on 
>> the free worker to run and cleanup the "finished" job in the window 
>> between drm_mock_sched_job_wait_finished() (or drm_sched_start(), 
>> depends how you look at it) and here. Am I missing something?
> 
>  From what I understand, the job is freed by the timeout worker [1] after
> `drm_sched_stop()` marked the job as guilty.
> 
> Therefore, if the timeout was called (and we asserted that through
> `job->flags`), we can be sure that the job was freed.
> 
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/ 
> drivers/gpu/drm/scheduler/sched_main.c#L568

Hm I thought it would end up on the dma_fence_remove_callback() == true 
branch in drm_sched_stop().

I gave it a quick spin locally and that indeed appears to be the case. 
So AFAICT it does rely on the free worker to have had executed before 
the assert.

Regards,

Tvrtko

> 
> Best Regards,
> - Maíra
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&sched->done_list));
>>  > +>       drm_mock_sched_entity_free(entity);
>>>   }
>>>
>>
> 

