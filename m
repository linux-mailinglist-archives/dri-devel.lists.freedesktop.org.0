Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8753A341A4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF1E10EAC8;
	Thu, 13 Feb 2025 14:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XohLTWcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C407A10EACC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6xPOOUyVmm54TJYeHXAm5V4RofmfK9rpTTcJYrxHyFY=; b=XohLTWcGmp5ze7gOX9VnkMngQo
 0kAu1H38vv5sFOp4I0y5rXmTztpxqyhFdJPMPimLb+x4DL4VBE2VIXnxPXJRYq1+x5sCGwP8a7xJ/
 6MXXmuxDYAJqQeRNFYb8FDBpU3Dz5wm0VeI7xjgHkB0IQa/ACDm1M4dXAa2eVt+MBsR5R+wg5CpSp
 E5hJBCUPVEhm80C+XnwEFu9L6QBgSO/i77maemEIMBowsaKjqKAphtTk6X5tgyG/wzzBOnANu1NPF
 kkQUlUoiZpxYqf3S4BcwzTb3lvM4bZZ2F7dV9Akh++2A0T6LLYn6DibYQj7J7E3XdZTQT3jr5tQJ4
 WfpLnInA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tia2j-00AEQ4-MU; Thu, 13 Feb 2025 15:18:23 +0100
Message-ID: <31e8882b-8782-46d3-8f76-3bf807a9be4e@igalia.com>
Date: Thu, 13 Feb 2025 14:18:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/scheduler: Add scheduler unit testing
 infrastructure and some basic tests
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250207143337.60154-1-tvrtko.ursulin@igalia.com>
 <20250207143337.60154-3-tvrtko.ursulin@igalia.com>
 <08870ee9960cc90106859104b8053c0c3f1d0fbe.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <08870ee9960cc90106859104b8053c0c3f1d0fbe.camel@mailbox.org>
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


On 13/02/2025 13:05, Philipp Stanner wrote:
> I'm in principle OK with this series. We'll have to discuss a few more
> things, but from my POV you could send the next revision as a v1.
> 
> Some more input below..
> 
> On Fri, 2025-02-07 at 14:33 +0000, Tvrtko Ursulin wrote:
>> Implement a mock scheduler backend and add some basic test to
>> exercise the
>> core scheduler code paths.
>>
>> Mock backend (kind of like a very simple mock GPU) can either process
>> jobs
>> by tests manually advancing the "timeline" job at a time, or
>> alternatively
>> jobs can be configured with a time duration in which case they get
>> completed asynchronously from the unit test code.
>>
>> Core scheduler classes are subclassed to support this mock
>> implementation.
>>
>> The tests added are just a few simple submission patterns.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Suggested-by: Philipp Stanner <phasta@kernel.org>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/Kconfig.debug                 |  12 +
>>   drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
>>   drivers/gpu/drm/scheduler/Makefile            |   1 +
>>   drivers/gpu/drm/scheduler/tests/Makefile      |   4 +
>>   .../gpu/drm/scheduler/tests/drm_mock_entity.c |  29 ++
>>   .../gpu/drm/scheduler/tests/drm_mock_job.c    |   3 +
>>   .../drm/scheduler/tests/drm_mock_scheduler.c  | 255
>> ++++++++++++++++++
>>   .../gpu/drm/scheduler/tests/drm_sched_tests.h | 128 +++++++++
>>   .../scheduler/tests/drm_sched_tests_basic.c   | 188 +++++++++++++
>>   9 files changed, 632 insertions(+)
>>   create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_job.c
>>   create mode 100644
>> drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
>>   create mode 100644
>> drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> 
> I'm still not that convinced about the naming convention of those
> files. They reside in drm/scheduler, but are called
> drm_mock_{something}.c, almost reading as if they are about DRM in
> general.
> 
> I think we should keep it consistent with the files in drm/scheduler/
> and just call those drm/scheduler/tests/sched_mock_job.c etc.

Dropping the redundant prefixes makes sense. How about then a step 
further and make it drm/scheduler/tests/mock_job.c?

>> diff --git a/drivers/gpu/drm/Kconfig.debug
>> b/drivers/gpu/drm/Kconfig.debug
>> index a35d74171b7b..89f777f21e95 100644
>> --- a/drivers/gpu/drm/Kconfig.debug
>> +++ b/drivers/gpu/drm/Kconfig.debug
>> @@ -88,5 +88,17 @@ config DRM_TTM_KUNIT_TEST
>>   
>>   	  If in doubt, say "N".
>>   
>> +config DRM_SCHED_KUNIT_TEST
>> +	tristate "KUnit tests for the DRM scheduler" if
>> !KUNIT_ALL_TESTS
>> +	select DRM_SCHED
>> +	depends on DRM && KUNIT
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +	  Choose this option to build unit tests for the DRM
>> scheduler.
>> +
>> +	  Recommended for driver developers only.
>> +
>> +	  If in doubt, say "N".
>> +
>>   config DRM_EXPORT_FOR_TESTS
>>   	bool
>> diff --git a/drivers/gpu/drm/scheduler/.kunitconfig
>> b/drivers/gpu/drm/scheduler/.kunitconfig
>> new file mode 100644
>> index 000000000000..cece53609fcf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/.kunitconfig
>> @@ -0,0 +1,12 @@
>> +CONFIG_KUNIT=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_SCHED_KUNIT_TEST=y
>> +CONFIG_EXPERT=y
>> +CONFIG_DEBUG_SPINLOCK=y
>> +CONFIG_DEBUG_MUTEXES=y
>> +CONFIG_DEBUG_ATOMIC_SLEEP=y
>> +CONFIG_LOCK_DEBUGGING_SUPPORT=y
>> +CONFIG_PROVE_LOCKING=y
>> +CONFIG_LOCKDEP=y
>> +CONFIG_DEBUG_LOCKDEP=y
>> +CONFIG_DEBUG_LIST=y
>> diff --git a/drivers/gpu/drm/scheduler/Makefile
>> b/drivers/gpu/drm/scheduler/Makefile
>> index 53863621829f..46dfdca0758a 100644
>> --- a/drivers/gpu/drm/scheduler/Makefile
>> +++ b/drivers/gpu/drm/scheduler/Makefile
>> @@ -23,3 +23,4 @@
>>   gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
>>   
>>   obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
>> +obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += tests/
>> diff --git a/drivers/gpu/drm/scheduler/tests/Makefile
>> b/drivers/gpu/drm/scheduler/tests/Makefile
>> new file mode 100644
>> index 000000000000..d69eab6a2e9b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/Makefile
>> @@ -0,0 +1,4 @@
>> +
>> +obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) += \
>> +        drm_mock_scheduler.o \
>> +        drm_sched_tests_basic.o
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
>> b/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
>> new file mode 100644
>> index 000000000000..c9205f9ff524
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
>> @@ -0,0 +1,29 @@
>> +
>> +#include "drm_sched_tests.h"
>> +
>> +struct drm_mock_sched_entity *
>> +drm_mock_sched_entity_new(struct kunit *test,
>> +			  enum drm_sched_priority priority,
>> +			  struct drm_mock_scheduler *sched)
>> +{
>> +	struct drm_sched_mock_entity *entity;
>> +	int ret;
>> +
>> +	entity = kunit_kmalloc(test, sizeof(*entity), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, entity);
>> +
>> +	ret = drm_sched_entity_init(&entity->base,
>> +				    priority,
>> +				    &sched->base, 1,
>> +				    NULL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	entity->test = test;
>> +
>> +	return entity;
>> +}
>> +
>> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
>> *entity)
>> +{
>> +	drm_sched_entity_fini(&entity->base);
>> +}
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
>> b/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
>> new file mode 100644
>> index 000000000000..d94568cf3da9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
>> @@ -0,0 +1,3 @@
>> +
>> +#include "drm_sched_tests.h"
>> +
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
>> b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
>> new file mode 100644
>> index 000000000000..f65f7c0cfaf7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
>> @@ -0,0 +1,255 @@
>> +
>> +#include "drm_sched_tests.h"
>> +
>> +struct drm_mock_sched_entity *
>> +drm_mock_new_sched_entity(struct kunit *test,
>> +			  enum drm_sched_priority priority,
>> +			  struct drm_mock_scheduler *sched)
>> +{
>> +	struct drm_mock_sched_entity *entity;
>> +	struct drm_gpu_scheduler *drm_sched;
>> +	int ret;
>> +
>> +	entity = kunit_kzalloc(test, sizeof(*entity), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, entity);
>> +
>> +	drm_sched = &sched->base;
>> +	ret = drm_sched_entity_init(&entity->base,
>> +				    priority,
>> +				    &drm_sched, 1,
>> +				    NULL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	entity->test = test;
>> +
>> +	return entity;
>> +}
>> +
>> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
>> *entity)
>> +{
>> +	drm_sched_entity_destroy(&entity->base);
>> +}
>> +
>> +static enum hrtimer_restart
>> +drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
>> +{
>> +	struct drm_mock_sched_job *upto =
>> +		container_of(hrtimer, typeof(*upto), timer);
>> +	struct drm_mock_scheduler *sched =
>> +		drm_sched_to_mock_sched(upto->base.sched);
>> +	struct drm_mock_sched_job *job, *next;
>> +	ktime_t now = ktime_get();
>> +	unsigned long flags;
>> +	LIST_HEAD(signal);
>> +
>> +	spin_lock_irqsave(&sched->lock, flags);
>> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
>> {
>> +		if (!job->duration_us)
>> +			break;
>> +
>> +		if (ktime_before(now, job->finish_at))
>> +			break;
>> +
>> +		list_move_tail(&job->link, &signal);
>> +		sched->hw_timeline.cur_seqno = job->hw_fence.seqno;
>> +	}
>> +	spin_unlock_irqrestore(&sched->lock, flags);
>> +
>> +	list_for_each_entry(job, &signal, link) {
>> +		dma_fence_signal(&job->hw_fence);
>> +		dma_fence_put(&job->hw_fence);
>> +	}
>> +
>> +	return HRTIMER_NORESTART;
>> +}
>> +
>> +struct drm_mock_sched_job *
>> +drm_mock_new_sched_job(struct kunit *test,
>> +		       struct drm_mock_sched_entity *entity)
>> +{
>> +	struct drm_mock_sched_job *job;
>> +	int ret;
>> +
>> +	job = kunit_kzalloc(test, sizeof(*job), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, job);
>> +
>> +	ret = drm_sched_job_init(&job->base,
>> +				 &entity->base,
>> +				 1,
>> +				 NULL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	job->test = test;
>> +
>> +	spin_lock_init(&job->lock);
>> +	INIT_LIST_HEAD(&job->link);
>> +	hrtimer_init(&job->timer, CLOCK_MONOTONIC,
>> HRTIMER_MODE_ABS);
>> +	job->timer.function = drm_mock_sched_job_signal_timer;
>> +
>> +	return job;
>> +}
>> +
>> +static const char *drm_mock_sched_hw_fence_driver_name(struct
>> dma_fence *fence)
>> +{
>> +	return "drm_mock_sched";
>> +}
>> +
>> +static const char *
>> +drm_mock_sched_hw_fence_timeline_name(struct dma_fence *fence)
>> +{
>> +	struct drm_mock_sched_job *job =
>> +		container_of(fence, typeof(*job), hw_fence);
>> +
>> +	return (const char *)job->base.sched->name;
>> +}
>> +static void drm_mock_sched_hw_fence_release(struct dma_fence *fence)
> 
> Regarding the function naming convention here everywhere,
> "drm_mock_sched_{something}" I guess that's alright as far as I'm
> concerned.
> 
> But just for some context, have you looked how other unit tests in
> drivers/drm/ do their naming convention? Grep doesn't reveal any
> drm_mock_* lines.
> 
> If there is a convention, would be great if drm/sched/ can be
> congruent.

There is mention of mock object in kerneldoc for functions prefixed with 
drm_kunit_helper. For me drm_mock_$something is better than drm_kunit 
helper_$something so I would rather keep my scheme.

I don't think we should have illusions this early that the "mock" 
infrastructure can/will be shared. And as the ones I am adding live 
locally in drm/scheduler/ I think it is fine as it is.

Regards,

Tvrtko

>> +{
>> +	struct drm_mock_sched_job *job =
>> +		container_of(fence, typeof(*job), hw_fence);
>> +
>> +	hrtimer_cancel(&job->timer);
>> +
>> +	/* Freed by the kunit framework */
>> +}
>> +
>> +static const struct dma_fence_ops drm_mock_sched_hw_fence_ops = {
>> +	.get_driver_name = drm_mock_sched_hw_fence_driver_name,
>> +	.get_timeline_name = drm_mock_sched_hw_fence_timeline_name,
>> +	.release = drm_mock_sched_hw_fence_release,
>> +};
>> +
>> +static struct dma_fence *mock_sched_run_job(struct drm_sched_job
>> *sched_job)
>> +{
>> +	struct drm_mock_scheduler *sched =
>> +		drm_sched_to_mock_sched(sched_job->sched);
>> +	struct drm_mock_sched_job *job =
>> drm_sched_job_to_mock_job(sched_job);
>> +
>> +	dma_fence_init(&job->hw_fence,
>> +		       &drm_mock_sched_hw_fence_ops,
>> +		       &job->lock,
>> +		       sched->hw_timeline.context,
>> +		       atomic_inc_return(&sched-
>>> hw_timeline.next_seqno));
>> +
>> +	dma_fence_get(&job->hw_fence); /* Reference for the job_list
>> */
>> +
>> +	spin_lock_irq(&sched->lock);
>> +	if (job->duration_us) {
>> +		ktime_t prev_finish_at = 0;
>> +
>> +		if (!list_empty(&sched->job_list)) {
>> +			struct drm_mock_sched_job *prev =
>> +				list_last_entry(&sched->job_list,
>> typeof(*prev),
>> +						link);
>> +
>> +			prev_finish_at = prev->finish_at;
>> +		}
>> +
>> +		if (!prev_finish_at)
>> +			prev_finish_at = ktime_get();
>> +
>> +		job->finish_at = ktime_add_us(prev_finish_at, job-
>>> duration_us);
>> +	}
>> +	list_add_tail(&job->link, &sched->job_list);
>> +	if (job->finish_at)
>> +		hrtimer_start(&job->timer, job->finish_at,
>> HRTIMER_MODE_ABS);
>> +	spin_unlock_irq(&sched->lock);
>> +
>> +	return &job->hw_fence;
>> +}
>> +
>> +static enum drm_gpu_sched_stat
>> +mock_sched_timedout_job(struct drm_sched_job *sched_job)
>> +{
>> +	return DRM_GPU_SCHED_STAT_ENODEV;
>> +}
>> +
>> +static void mock_sched_free_job(struct drm_sched_job *sched_job)
>> +{
>> +	drm_sched_job_cleanup(sched_job);
>> +}
>> +
>> +static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>> +	.run_job = mock_sched_run_job,
>> +	.timedout_job = mock_sched_timedout_job,
>> +	.free_job = mock_sched_free_job
>> +};
>> +
>> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
>> *test)
>> +{
>> +	struct drm_mock_scheduler *sched;
>> +	int ret;
>> +
>> +	sched = kunit_kzalloc(test, sizeof(*sched), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, sched);
>> +
>> +	ret = drm_sched_init(&sched->base,
>> +			     &drm_mock_scheduler_ops,
>> +			     NULL, /* wq */
>> +			     DRM_SCHED_PRIORITY_COUNT,
>> +			     U32_MAX, /* max credits */
>> +			     UINT_MAX, /* hang limit */
>> +			     MAX_SCHEDULE_TIMEOUT, /* timeout */
>> +			     NULL, /* timeout wq */
>> +			     NULL, /* score */
>> +			     "drm-mock-scheduler",
>> +			     NULL /* dev */);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	sched->test = test;
>> +	sched->hw_timeline.context = dma_fence_context_alloc(1);
>> +	atomic_set(&sched->hw_timeline.next_seqno, 0);
>> +	INIT_LIST_HEAD(&sched->job_list);
>> +	spin_lock_init(&sched->lock);
>> +
>> +	return sched;
>> +}
>> +
>> +void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched)
>> +{
>> +	struct drm_mock_sched_job *job, *next;
>> +	unsigned long flags;
>> +	LIST_HEAD(signal);
>> +
>> +	spin_lock_irqsave(&sched->lock, flags);
>> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
>> +		list_move_tail(&job->link, &signal);
>> +	spin_unlock_irqrestore(&sched->lock, flags);
>> +
>> +	list_for_each_entry(job, &signal, link) {
>> +		hrtimer_cancel(&job->timer);
>> +		dma_fence_put(&job->hw_fence);
>> +	}
>> +
>> +	drm_sched_fini(&sched->base);
>> +}
>> +
>> +unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
>> *sched,
>> +				    unsigned int num)
>> +{
>> +	struct drm_mock_sched_job *job, *next;
>> +	unsigned int found = 0;
>> +	unsigned long flags;
>> +	LIST_HEAD(signal);
>> +
>> +	spin_lock_irqsave(&sched->lock, flags);
>> +	if (WARN_ON_ONCE(sched->hw_timeline.cur_seqno + num <
>> +			 sched->hw_timeline.cur_seqno))
>> +		goto unlock;
>> +	sched->hw_timeline.cur_seqno += num;
>> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
>> {
>> +		if (sched->hw_timeline.cur_seqno < job-
>>> hw_fence.seqno)
>> +			break;
>> +
>> +		list_move_tail(&job->link, &signal);
>> +		found++;
>> +	}
>> +unlock:
>> +	spin_unlock_irqrestore(&sched->lock, flags);
>> +
>> +	list_for_each_entry(job, &signal, link) {
>> +		dma_fence_signal(&job->hw_fence);
>> +		dma_fence_put(&job->hw_fence);
>> +	}
>> +
>> +	return found;
>> +}
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
>> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
>> new file mode 100644
>> index 000000000000..e22f7ead6d4e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
>> @@ -0,0 +1,128 @@
>> +#ifndef _DRM_SCHED_TESTS_H_
>> +#define _DRM_SCHED_TESTS_H_
>> +
>> +#include <kunit/test.h>
>> +#include <linux/atomic.h>
>> +#include <linux/dma-fence.h>
>> +#include <linux/hrtimer.h>
>> +#include <linux/ktime.h>
>> +#include <linux/list.h>
>> +#include <linux/atomic.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/gpu_scheduler.h>
>> +
>> +struct drm_mock_scheduler {
>> +	struct drm_gpu_scheduler base;
>> +
>> +	struct kunit		*test;
>> +
>> +	spinlock_t		lock;
>> +	struct list_head	job_list; /* Protected by the lock
>> */
>> +
>> +	struct {
>> +		u64		context;
>> +		atomic_t	next_seqno;
>> +		unsigned int	cur_seqno; /* Protected by the lock
>> */
>> +	} hw_timeline;
>> +};
>> +
>> +struct drm_mock_sched_entity {
>> +	struct drm_sched_entity base;
>> +
>> +	struct kunit		*test;
>> +};
>> +
>> +struct drm_mock_sched_job {
>> +	struct drm_sched_job	base;
>> +
>> +	struct list_head	link;
>> +	struct hrtimer		timer;
>> +
>> +	unsigned int		duration_us;
>> +	ktime_t			finish_at;
>> +
>> +	spinlock_t		lock;
>> +	struct dma_fence	hw_fence;
>> +
>> +	struct kunit		*test;
>> +};
>> +
>> +static inline struct drm_mock_scheduler *
>> +drm_sched_to_mock_sched(struct drm_gpu_scheduler *sched)
>> +{
>> +	return container_of(sched, struct drm_mock_scheduler, base);
>> +};
>> +
>> +static inline struct drm_mock_sched_entity *
>> +drm_sched_entity_to_mock_entity(struct drm_sched_entity
>> *sched_entity)
>> +{
>> +	return container_of(sched_entity, struct
>> drm_mock_sched_entity, base);
>> +};
>> +
>> +static inline struct drm_mock_sched_job *
>> +drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
>> +{
>> +	return container_of(sched_job, struct drm_mock_sched_job,
>> base);
>> +};
>> +
>> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
>> *test);
>> +void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
>> +unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
>> *sched,
>> +				    unsigned int num);
>> +
>> +struct drm_mock_sched_entity *
>> +drm_mock_new_sched_entity(struct kunit *test,
>> +			  enum drm_sched_priority priority,
>> +			  struct drm_mock_scheduler *sched);
>> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
>> *entity);
>> +
>> +struct drm_mock_sched_job *
>> +drm_mock_new_sched_job(struct kunit *test,
>> +		       struct drm_mock_sched_entity *entity);
>> +
>> +static inline void drm_mock_sched_job_submit(struct
>> drm_mock_sched_job *job)
>> +{
>> +	drm_sched_job_arm(&job->base);
>> +	drm_sched_entity_push_job(&job->base);
>> +}
>> +
>> +static inline void
>> +drm_mock_sched_job_set_duration_us(struct drm_mock_sched_job *job,
>> +				   unsigned int duration_us)
>> +{
>> +	job->duration_us = duration_us;
>> +}
>> +
>> +static inline bool
>> +drm_mock_sched_job_is_finished(struct drm_mock_sched_job *job)
>> +{
>> +	return dma_fence_is_signaled(&job->base.s_fence->finished);
>> +}
>> +
>> +static inline bool
>> +drm_mock_sched_job_wait_finished(struct drm_mock_sched_job *job,
>> long timeout)
>> +{
>> +	long ret;
>> +
>> +	ret = dma_fence_wait_timeout(&job->base.s_fence->finished,
>> +				      false,
>> +				      timeout);
>> +
>> +	return ret != 0;
>> +}
>> +
>> +static inline long
>> +drm_mock_sched_job_wait_scheduled(struct drm_mock_sched_job *job,
>> long timeout)
>> +{
>> +	long ret;
>> +
>> +	ret = dma_fence_wait_timeout(&job->base.s_fence->scheduled,
>> +				      false,
>> +				      timeout);
>> +
>> +	return ret != 0;
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> new file mode 100644
>> index 000000000000..030d7e6ea484
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
>> @@ -0,0 +1,188 @@
>> +
>> +#include "drm_sched_tests.h"
>> +
>> +static int drm_sched_basic_init(struct kunit *test)
>> +{
>> +	test->priv = drm_mock_new_scheduler(test);
>> +
>> +	return 0;
>> +}
>> +
>> +static void drm_sched_basic_exit(struct kunit *test)
>> +{
>> +	struct drm_mock_scheduler *sched = test->priv;
>> +
>> +	drm_mock_scheduler_fini(sched);
>> +}
>> +
>> +static void drm_sched_basic_submit(struct kunit *test)
>> +{
>> +	struct drm_mock_scheduler *sched = test->priv;
>> +	struct drm_mock_sched_entity *entity;
>> +	struct drm_mock_sched_job *job;
>> +	unsigned int i;
>> +	bool done;
>> +
>> +	/*
>> +	 * Submit one job to the scheduler and verify that it gets
>> scheduled
>> +	 * and completed only when the mock hw backend processes it.
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
>> +	i = drm_mock_sched_advance(sched, 1);
>> +	KUNIT_ASSERT_EQ(test, i, 1);
>> +
>> +	done = drm_mock_sched_job_wait_finished(job, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, true);
>> +
>> +	drm_mock_sched_entity_free(entity);
>> +}
>> +
>> +struct drm_sched_basic_params {
>> +	const char *description;
>> +	unsigned int queue_depth;
>> +	unsigned int num_entities;
>> +	unsigned int job_us;
>> +	bool dep_chain;
>> +};
>> +
>> +static const struct drm_sched_basic_params drm_sched_basic_cases[] =
>> {
>> +	{
>> +		.description = "A queue of jobs in a single entity",
>> +		.queue_depth = 100,
>> +		.job_us = 1000,
>> +		.num_entities = 1,
>> +	},
>> +	{
>> +		.description = "A chain of dependent jobs across
>> multiple entities",
>> +		.queue_depth = 100,
>> +		.job_us = 1000,
>> +		.num_entities = 1,
>> +		.dep_chain = true,
>> +	},
>> +	{
>> +		.description = "Multiple independent job queues",
>> +		.queue_depth = 100,
>> +		.job_us = 1000,
>> +		.num_entities = 4,
>> +	},
>> +	{
>> +		.description = "Multiple inter-dependent job
>> queues",
>> +		.queue_depth = 100,
>> +		.job_us = 1000,
>> +		.num_entities = 4,
>> +		.dep_chain = true,
>> +	},
>> +};
>> +
>> +static void
>> +drm_sched_basic_desc(const struct drm_sched_basic_params *params,
>> char *desc)
>> +{
>> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(drm_sched_basic, drm_sched_basic_cases,
>> drm_sched_basic_desc);
>> +
>> +static void drm_sched_basic_test(struct kunit *test)
>> +{
>> +	const struct drm_sched_basic_params *params = test-
>>> param_value;
>> +	struct drm_mock_scheduler *sched = test->priv;
>> +	struct drm_mock_sched_job *job, *prev = NULL;
>> +	struct drm_mock_sched_entity **entity;
>> +	unsigned int i, cur_ent = 0;
>> +	bool done;
>> +
>> +	entity = kunit_kcalloc(test, params->num_entities,
>> sizeof(*entity),
>> +			       GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, entity);
>> +
>> +	for (i = 0; i < params->num_entities; i++)
>> +		entity[i] = drm_mock_new_sched_entity(test,
>> +						
>> DRM_SCHED_PRIORITY_NORMAL,
>> +						      sched);
>> +
>> +	for (i = 0; i < params->queue_depth; i++) {
>> +		job = drm_mock_new_sched_job(test,
>> entity[cur_ent++]);
>> +		cur_ent %= params->num_entities;
>> +		drm_mock_sched_job_set_duration_us(job, params-
>>> job_us);
>> +		if (params->dep_chain && prev)
>> +			drm_sched_job_add_dependency(&job->base,
>> +						
>> dma_fence_get(&prev->base.s_fence->finished));
>> +		drm_mock_sched_job_submit(job);
>> +		prev = job;
>> +	}
>> +
>> +	done = drm_mock_sched_job_wait_finished(job, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, true);
>> +
>> +	for (i = 0; i < params->num_entities; i++)
>> +		drm_mock_sched_entity_free(entity[i]);
>> +}
>> +
>> +static void drm_sched_basic_entity_cleanup(struct kunit *test)
>> +{
>> +	struct drm_mock_sched_job *job, *mid, *prev = NULL;
>> +	struct drm_mock_scheduler *sched = test->priv;
>> +	struct drm_mock_sched_entity *entity[4];
>> +	const unsigned int qd = 100;
>> +	unsigned int i, cur_ent = 0;
>> +	bool done;
>> +
>> +	/*
>> +	 * Submit a queue of jobs across different entities with an
>> explicit
>> +	 * chain of dependencies between them and trigger entity
>> cleanup while
>> +	 * the queue is still being processed.
>> +	 */
>> +
>> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
>> +		entity[i] = drm_mock_new_sched_entity(test,
>> +						
>> DRM_SCHED_PRIORITY_NORMAL,
>> +						      sched);
>> +
>> +	for (i = 0; i < qd; i++) {
>> +		job = drm_mock_new_sched_job(test,
>> entity[cur_ent++]);
>> +		cur_ent %= ARRAY_SIZE(entity);
>> +		drm_mock_sched_job_set_duration_us(job, 1000);
>> +		if (prev)
>> +			drm_sched_job_add_dependency(&job->base,
>> +						
>> dma_fence_get(&prev->base.s_fence->finished));
>> +		drm_mock_sched_job_submit(job);
>> +		if (i == qd / 2)
>> +			mid = job;
>> +		prev = job;
>> +	}
>> +
>> +	done = drm_mock_sched_job_wait_finished(mid, HZ);
>> +	KUNIT_ASSERT_EQ(test, done, true);
>> +
>> +	/* Exit with half of the queue still pending to be executed.
>> */
>> +	for (i = 0; i < ARRAY_SIZE(entity); i++)
>> +		drm_mock_sched_entity_free(entity[i]);}
>> +
>> +static struct kunit_case drm_sched_basic_tests[] = {
>> +	KUNIT_CASE(drm_sched_basic_submit),
>> +	KUNIT_CASE_PARAM(drm_sched_basic_test,
>> drm_sched_basic_gen_params),
>> +	KUNIT_CASE(drm_sched_basic_entity_cleanup),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite drm_sched_basic = {
>> +	.name = "drm_sched_basic_tests",
>> +	.init = drm_sched_basic_init,
>> +	.exit = drm_sched_basic_exit,
>> +	.test_cases = drm_sched_basic_tests,
>> +};
>> +
>> +kunit_test_suite(drm_sched_basic);
> 

