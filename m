Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4EA4C5E1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AA410E487;
	Mon,  3 Mar 2025 15:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oXSg/QMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22B10E487
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99M2Quwqcm0bJBIZg91ZOGlKaeUVFd6AOEwI8ejLF9E=; b=oXSg/QMXKcDPqCsGr381N5XKUG
 ly/Dw5GgF9JF2YMXsvYAuHDqeE4QRN4vJUMa6Gs8G2v7CKriq5gXf/4BZFVB4uq2I65LEJQNxpyLY
 Gsr0Lw1mcNrIihJSjzcuXhTC2moCDPg6pCWlUxUi6Fcw1fE147YMwGXxkZVpRhMGp7Oj3UCV0FCTm
 1zH9lynKfsT2Qp8En+Rm39jn3zmdQby8y0koiMl8m63FfqTRARJupUENo2ZB/cE+X2LMXRs3Mh4HB
 B/MHjyV8FLqi7TMIxiU9T3fJpJOL7GvRX9B4ba3RXEMGkyU++LP+rZTwAJSmz4iCSqern4ktBl7WC
 GfJnxC6A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tp8B4-003KMt-9o; Mon, 03 Mar 2025 16:58:04 +0100
Message-ID: <784019b1-d05d-4cda-8840-68a139fe26f4@igalia.com>
Date: Mon, 3 Mar 2025 15:58:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/scheduler: Add a simple timeout test
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <20250221120917.80617-4-tvrtko.ursulin@igalia.com>
 <469468f3869263703ea8791830b58f6447efae27.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <469468f3869263703ea8791830b58f6447efae27.camel@mailbox.org>
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


On 03/03/2025 13:48, Philipp Stanner wrote:
> On Fri, 2025-02-21 at 12:09 +0000, Tvrtko Ursulin wrote:
>> Add a very simple timeout test which submits a single job and
>> verifies
>> that the timeout handling will run if the backend failed to complete
>> the
>> job in time.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 13 +++-
>>   drivers/gpu/drm/scheduler/tests/sched_tests.h |  6 +-
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 64
>> ++++++++++++++++++-
>>   3 files changed, 77 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> index d73a9f0337da..427ce29354d0 100644
>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> @@ -193,7 +193,11 @@ static struct dma_fence
>> *mock_sched_run_job(struct drm_sched_job *sched_job)
>>   static enum drm_gpu_sched_stat
>>   mock_sched_timedout_job(struct drm_sched_job *sched_job)
>>   {
>> -	return DRM_GPU_SCHED_STAT_ENODEV;
>> +	struct drm_mock_sched_job *job =
>> drm_sched_job_to_mock_job(sched_job);
>> +
>> +	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
>> +
>> +	return DRM_GPU_SCHED_STAT_NOMINAL;
>>   }
>>   
>>   static void mock_sched_free_job(struct drm_sched_job *sched_job)
>> @@ -211,17 +215,20 @@ static const struct drm_sched_backend_ops
>> drm_mock_scheduler_ops = {
>>    * drm_mock_new_scheduler - Create a new mock scheduler
>>    *
>>    * @test: KUnit test owning the job
>> + * @timeout: Job timeout to set
>>    *
>>    * Returns: New mock scheduler with allocation managed by the test
>>    */
>> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
> 
> -> …_scheduler_new()
> 
> As said in the previous thread, I think that if you want to introduce
> the new prefix drm_mock_, then it should always be followed by the DRM
> subcomponent, so that it can be congruent across DRM.

To be concluded in that sub-thread.

>> *test)
>> +struct drm_mock_scheduler *
>> +drm_mock_new_scheduler(struct kunit *test,
>> +		       long timeout)
> 
> fits on one line

Oops, done.

>>   {
>>   	struct drm_sched_init_args args = {
>>   		.ops		= &drm_mock_scheduler_ops,
>>   		.num_rqs	= DRM_SCHED_PRIORITY_COUNT,
>>   		.credit_limit	= U32_MAX,
>>   		.hang_limit	= UINT_MAX,
>> -		.timeout	= MAX_SCHEDULE_TIMEOUT,
>> +		.timeout	= timeout,
>>   		.name		= "drm-mock-scheduler",
>>   	};
>>   	struct drm_mock_scheduler *sched;
>> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> index 0614bc901dd1..258fec748ca7 100644
>> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> @@ -88,6 +88,9 @@ struct drm_mock_sched_entity {
>>   struct drm_mock_sched_job {
>>   	struct drm_sched_job	base;
>>   
>> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT 0x1
> 
> Why's that defined here within the struct's body? Better move it above

Makes it clear to which field flags apply. I can move if you insist but 
then I would rename it to something like DRM_MOCK_SCHED_FLAGS_JOB_TIMEDOUT.

Regards,

Tvrtko

> 
>> +	unsigned long		flags;
>> +
>>   	struct list_head	link;
>>   	struct hrtimer		timer;
>>   
>> @@ -118,7 +121,8 @@ drm_sched_job_to_mock_job(struct drm_sched_job
>> *sched_job)
>>   	return container_of(sched_job, struct drm_mock_sched_job,
>> base);
>>   };
>>   
>> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
>> *test);
>> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
>> *test,
>> +						  long timeout);
>>   void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
>>   unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
>> *sched,
>>   				    unsigned int num);
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> index c12368a22a39..023143b80d78 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> @@ -11,7 +11,7 @@
>>   
>>   static int drm_sched_basic_init(struct kunit *test)
>>   {
>> -	test->priv = drm_mock_new_scheduler(test);
>> +	test->priv = drm_mock_new_scheduler(test,
>> MAX_SCHEDULE_TIMEOUT);
>>   
>>   	return 0;
>>   }
>> @@ -23,6 +23,13 @@ static void drm_sched_basic_exit(struct kunit
>> *test)
>>   	drm_mock_scheduler_fini(sched);
>>   }
>>   
>> +static int drm_sched_timeout_init(struct kunit *test)
>> +{
>> +	test->priv = drm_mock_new_scheduler(test, HZ);
>> +
>> +	return 0;
>> +}
>> +
>>   static void drm_sched_basic_submit(struct kunit *test)
>>   {
>>   	struct drm_mock_scheduler *sched = test->priv;
>> @@ -194,4 +201,57 @@ static struct kunit_suite drm_sched_basic = {
>>   	.test_cases = drm_sched_basic_tests,
>>   };
>>   
>> -kunit_test_suite(drm_sched_basic);
>> +static void drm_sched_basic_timeout(struct kunit *test)
>> +{
>> +	struct drm_mock_scheduler *sched = test->priv;
>> +	struct drm_mock_sched_entity *entity;
>> +	struct drm_mock_sched_job *job;
>> +	bool done;
>> +
>> +	/*
>> +	 * Submit a single job against a scheduler with the timeout
>> configured
>> +	 * and verify that the timeout handling will run if the
>> backend fails
>> +	 * to complete it in time.
>> +	 */
>> +
>> +	entity = drm_mock_new_sched_entity(test,
>> +					
>> DRM_SCHED_PRIORITY_NORMAL,
>> +					   sched);
>> +	job = drm_mock_new_sched_job(test, entity);
>> +
>> +	drm_mock_sched_job_submit(job);
>> +
>> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, true);
>> +
>> +	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
>> +	KUNIT_ASSERT_EQ(test, done, false);
>> +
>> +	KUNIT_ASSERT_EQ(test,
>> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>> +			0);
>> +
>> +	done = drm_mock_sched_job_wait_finished(job, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, false);
>> +
>> +	KUNIT_ASSERT_EQ(test,
>> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
>> +
>> +	drm_mock_sched_entity_free(entity);
>> +}
>> +
>> +static struct kunit_case drm_sched_timeout_tests[] = {
>> +	KUNIT_CASE(drm_sched_basic_timeout),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite drm_sched_timeout = {
>> +	.name = "drm_sched_basic_timeout_tests",
>> +	.init = drm_sched_timeout_init,
>> +	.exit = drm_sched_basic_exit,
>> +	.test_cases = drm_sched_timeout_tests,
>> +};
>> +
>> +kunit_test_suites(&drm_sched_basic,
>> +		  &drm_sched_timeout);
> 

