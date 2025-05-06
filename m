Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B1AAC7AD
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100AA10E6A6;
	Tue,  6 May 2025 14:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ymkwu2JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A885110E6A4;
 Tue,  6 May 2025 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o20N3MxrSOV7spfYb/r4DQ5/n1bgOpTcrwhNxeoTnXs=; b=Ymkwu2JG0S2GSw4YuSX2ASBfsI
 io1hQd0v95Irl3cdENAMHb9bjlw6lZ5hC8vi/mXm8rYHHzP/EvHnZYnuouopezx/iMEJIInZqz/is
 5Srj5Vd/98NvSHcw7+WXQ0BDnGm0/3yPUw1b83HWdAjI3SFi5nCMFd8HjFSOSh+kGCnZzvcdwMT/H
 PnglxZ5UxD/sG+JjVsuW+iQQX2o6sHNRxQrSPSCVKncIkpnJsafsuYmgwIPton6ckKjwuoFmKGgb4
 6MmkbshIYFMkhRjFYWPDrI825xdoS9WFazMVbiC2OAW/qJ2p3Ti3bcRwd+Xgur+ljwr118CGRprjw
 VjxJ1aig==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCJ4F-004Ecw-B8; Tue, 06 May 2025 16:18:18 +0200
Message-ID: <41d87d5e-62a4-4b2a-a626-a90caed50877@igalia.com>
Date: Tue, 6 May 2025 15:18:17 +0100
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
 <7d1e7571-8fde-40e2-8ce9-a956389ea2c0@igalia.com>
 <dcfb1d4a-9a07-4d72-a93d-e12720b99172@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <dcfb1d4a-9a07-4d72-a93d-e12720b99172@igalia.com>
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


On 06/05/2025 14:38, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 06/05/25 10:28, Tvrtko Ursulin wrote:
>>
>> On 06/05/2025 13:46, Maíra Canal wrote:
>>> Hi Tvrtko,
>>>
>>> Thanks for your review!
>>>
>>> On 06/05/25 08:49, Tvrtko Ursulin wrote:
>>>>
>>>> On 03/05/2025 21:59, Maíra Canal wrote:
>>>>> Currently, if we add the assertions presented in this commit to the 
>>>>> mock
>>>>> scheduler, we will see the following output:
>>>>>
>>>>> [15:47:08] ============== [PASSED] drm_sched_basic_tests 
>>>>> ==============
>>>>> [15:47:08] ======== drm_sched_basic_timeout_tests (1 subtest) 
>>>>> =========
>>>>> [15:47:08] # drm_sched_basic_timeout: ASSERTION FAILED at drivers/ 
>>>>> gpu/ drm/scheduler/tests/tests_basic.c:246
>>>>> [15:47:08] Expected list_empty(&sched->job_list) to be true, but is 
>>>>> false
>>>>> [15:47:08] [FAILED] drm_sched_basic_timeout
>>>>> [15:47:08] # module: drm_sched_tests
>>>>>
>>>>> This occurs because `mock_sched_timedout_job()` doesn't properly 
>>>>> handle
>>>>> the hang. From the DRM sched documentation, `drm_sched_stop()` and
>>>>> `drm_sched_start()` are typically used for reset recovery. If these
>>>>> functions are not used, the offending job won't be freed and should be
>>>>> freed by the caller.
>>>>>
>>>>> Currently, the mock scheduler doesn't use the functions provided by 
>>>>> the
>>>>> API, nor does it handle the freeing of the job. As a result, the 
>>>>> job isn't
>>>>> removed from the job list.
>>>>
>>>> For the record the job does gets freed via the kunit managed 
>>>> allocation.
>>>
>>> Sorry, I didn't express myself correctly. Indeed, it is. I meant that
>>> the DRM scheduler didn't free the job.
>>>
>>>>
>>>> It was a design choice for this test to be a *strict* unit test 
>>>> which tests only a _single_ thing. And that is that the 
>>>> timedout_job() hook gets called. As such the hook was implemented to 
>>>> satisfy that single requirement only.
>>>>
>>>
>>> What do you think about checking that `sched->job_list` won't be empty?
>>>
>>> I wanted to add such assertion to make sure that the behavior of the
>>> timeout won't change in future (e.g. a patch makes a change that calls
>>> `free_job()` for the guilty job at timeout). Does it make sense to you?
>>
>> Where would that assert be?
>>
> 
> I believe it would be in the same place as this patch assertions, but
> instead of `KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));`, it
> would be `KUNIT_ASSERT_FALSE(test, list_empty(&sched->job_list));`.
> 
> But I don't feel strongly about it. I can drop the patch if you believe
> it's a better option.

I don't mind this patch, I was just explaining how the current test was 
deliberately testing a single thing. But we can change it to test more, 
that's fine.

In this case it would go from testing that the timeout callback fires to 
testing the callback fires and something else happens.

Key is to define the "something else" part so it is not timing sensitive.

The drm_sched_stop+delay+drm_sched_start approach would perhaps work if 
you would signal the job with an errno set before drm_sched_stop?

Then it would hit the "free_guilty" path in drm_sched_stop and wouldn't 
be timing sensitive. As long as there aren't any locking considerations 
I am missing. That could then safely have the two list_empty asserts.

Regards,

Tvrtko

