Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41FA3407A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AA910E07C;
	Thu, 13 Feb 2025 13:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B84terP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8ED10E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fL2N85tP78JDzZgsCZWoTPud0wAjilrahySa0+eaYdo=; b=B84terP9/sdvMj8ht16+iSkLYQ
 xGjEA22Lu5nXIwV7d+UT1yYxyJkprIDMvatPeENztaRR1nHQFVKuIyOgTCdeetMduJIBGTjh4NHaP
 auotEFdFl+E1IhdmAuXWccljbvz5jGJqyRFNDpCAdfekRNS1OKfvkQCCfLxedyIv+wF0oKaTmGsiR
 A0ia9RZNlVTKLpffQqDmk8TPGJU9zMPxv3SskJOSYoGlO2A701pPo90c/W7QnW7yGqgDD5EEdyVgv
 R/Y7h63TDn9laKv8pDO0o+fmlEK6Z5xhzi98i04KycJ1nJ4oyBG3Z8PCgVB1qftfjOqhhb3VwTn6p
 Ijl6LzNA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tiZOJ-00ADcc-Ck; Thu, 13 Feb 2025 14:36:37 +0100
Message-ID: <eff7e19e-c507-4fc9-8493-5d057754c8ba@igalia.com>
Date: Thu, 13 Feb 2025 13:36:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] drm/scheduler: Add a basic test for modifying entities
 scheduler list
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250207143337.60154-1-tvrtko.ursulin@igalia.com>
 <20250207143337.60154-6-tvrtko.ursulin@igalia.com>
 <1abfcdf350e15d622603ed06937e16c36e5050e9.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <1abfcdf350e15d622603ed06937e16c36e5050e9.camel@mailbox.org>
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


On 13/02/2025 13:12, Philipp Stanner wrote:
> On Fri, 2025-02-07 at 14:33 +0000, Tvrtko Ursulin wrote:
>> Add a basic test for exercising modifying the entities scheduler list
>> at
>> runtime.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   .../scheduler/tests/drm_sched_tests_basic.c   | 73
>> ++++++++++++++++++-
>>   1 file changed, 72 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> index 9b6bb8b6b98e..af91e4ebd397 100644
>> --- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> @@ -340,6 +340,77 @@ static struct kunit_suite drm_sched_priority = {
>>   	.test_cases = drm_sched_priority_tests,
>>   };
>>   
>> +static void drm_sched_test_modify_sched(struct kunit *test)
> 
> I'm still confused about the naming convention tbh.
> 
> Some things are called drm_mock_*, and this is called drm_sched_test_*

They are two separate things.

We need a scheduler tests cases and a mock GPU so we can test the scheduler.

drm_mock_ implement the mock GPU.

Others are test cases, or kunit test suites, or arrays needed to 
implement the suites.

Regards,

Tvrtko

> What's the naming system / background?
> 
> P.
> 
>> +{
>> +	unsigned int i, cur_ent = 0, cur_sched = 0;
>> +	struct drm_mock_sched_entity *entity[13];
>> +	struct drm_mock_scheduler *sched[3];
>> +	struct drm_mock_sched_job *job;
>> +	const unsigned int qd = 1000;
>> +	bool done;
>> +
>> +	/*
>> +	 * Submit a bunch of jobs against entities configured with
>> different
>> +	 * schedulers and while waiting for them to complete,
>> periodically keep
>> +	 * changing schedulers associated with each entity.
>> +	 *
>> +	 * We set up the queue-depth (qd) and job duration so the
>> sched modify
>> +	 * loop has some time to interact with submissions to the
>> backend and
>> +	 * job completions as they progress.
>> +	 *
>> +	 * For the number of schedulers and entities we use primes
>> in order to
>> +	 * perturb the entity->sched assignments with less of a
>> regular pattern.
>> +	 */
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sched); i++)
>> +		sched[i] = drm_mock_new_scheduler(test,
>> MAX_SCHEDULE_TIMEOUT);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
>> +		entity[i] = drm_mock_new_sched_entity(test,
>> +						
>> DRM_SCHED_PRIORITY_NORMAL,
>> +						      sched[i %
>> ARRAY_SIZE(sched)]);
>> +
>> +	for (i = 0; i < qd; i++) {
>> +		job = drm_mock_new_sched_job(test,
>> entity[cur_ent++]);
>> +		cur_ent %= ARRAY_SIZE(entity);
>> +		drm_mock_sched_job_set_duration_us(job, 1000);
>> +		drm_mock_sched_job_submit(job);
>> +	}
>> +
>> +	do {
>> +		struct drm_gpu_scheduler *modify;
>> +
>> +		usleep_range(200, 500);
>> +		cur_ent++;
>> +		cur_ent %= ARRAY_SIZE(entity);
>> +		cur_sched++;
>> +		cur_sched %= ARRAY_SIZE(sched);
>> +		modify = &sched[cur_sched]->base;
>> +		drm_sched_entity_modify_sched(&entity[cur_ent]-
>>> base, &modify,
>> +					      1);
>> +	} while (!drm_mock_sched_job_is_finished(job));
>> +
>> +	done = drm_mock_sched_job_wait_finished(job, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, true);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
>> +		drm_mock_sched_entity_free(entity[i]);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sched); i++)
>> +		drm_mock_scheduler_fini(sched[i]);
>> +}
>> +
>> +static struct kunit_case drm_sched_modify_sched_tests[] = {
>> +	KUNIT_CASE(drm_sched_test_modify_sched),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite drm_sched_modify_sched = {
>> +	.name = "drm_sched_basic_modify_sched_tests",
>> +	.test_cases = drm_sched_modify_sched_tests,
>> +};
>> +
>>   kunit_test_suites(&drm_sched_basic,
>>   		  &drm_sched_timeout,
>> -		  &drm_sched_priority);
>> +		  &drm_sched_priority,
>> +		  &drm_sched_modify_sched);
> 

