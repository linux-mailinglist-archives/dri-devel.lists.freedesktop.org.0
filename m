Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F061A3A56C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 19:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD6710E0DD;
	Tue, 18 Feb 2025 18:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XJJXxF0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DBB10E06F;
 Tue, 18 Feb 2025 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g+1NgTbwn2htB4xn3prNdmhnAxKUnWU+b53bAFxjIjw=; b=XJJXxF0ThQEFXVO9K0hXTXWz44
 80bQr7/TgyrC19v8tTsmbfCZ132Zg3bbeJidrcPnZFAB5B9FaiNpZkwQkWAyqkJIdjuvgW1GhwVpn
 urBIz0zLz9sBW2RsB1KHOft2VixEW7hd4TNgFC3vc8NtCs4bbKak3siy6D24vTpJogxssFxwUe/n6
 YhtffuT8fXIbCU9ptAs/NlB342KHA4UDHyAztlxxQ5/knywkyBdCXFDUWNu8zkyv8tZA2G67y4ZyU
 A01/aeWwFONjjPl4mLQnYLqieQzD93s3oZ+GdVQBYAPElO7TmAvBHnBOV9pLMRBr0DdCA2iBdRQ8Q
 q2o3TT4Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tkSIM-00BQu4-TF; Tue, 18 Feb 2025 19:26:16 +0100
Message-ID: <0ecf7583-8e7a-45c7-bc4e-5935681effc3@igalia.com>
Date: Tue, 18 Feb 2025 18:26:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/sched: Add internal job peek/pop API
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
 <20250214101944.19390-2-tvrtko.ursulin@igalia.com>
 <7244eaa81cfeb6ce959c591c11a97f52f25b5a5d.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7244eaa81cfeb6ce959c591c11a97f52f25b5a5d.camel@mailbox.org>
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


On 18/02/2025 12:26, Philipp Stanner wrote:
> Thx for the updated version. Overlooked it, I was out on Friday. See
> below
> 
> On Fri, 2025-02-14 at 10:19 +0000, Tvrtko Ursulin wrote:
>> Idea is to add helpers for peeking and popping jobs from entities
>> with
>> the goal of decoupling the hidden assumption in the code that
>> queue_node
>> is the first element in struct drm_sched_job.
>>
>> That assumption usually comes in the form of:
>>
>>    while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
>>> job_queue))))
>>
>> Which breaks if the queue_node is re-positioned due to_drm_sched_job
>> being implemented with a container_of.
>>
>> This also allows us to remove duplicate definitions of
>> to_drm_sched_job.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c   | 11 +++---
>>   drivers/gpu/drm/scheduler/sched_internal.h | 46
>> ++++++++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c     |  7 ++--
>>   3 files changed, 54 insertions(+), 10 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 69bcf0e99d57..a171f05ad761 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -28,11 +28,10 @@
>>   #include <drm/drm_print.h>
>>   #include <drm/gpu_scheduler.h>
>>   
>> +#include "sched_internal.h"
>> +
>>   #include "gpu_scheduler_trace.h"
>>   
>> -#define to_drm_sched_job(sched_job)		\
>> -		container_of((sched_job), struct drm_sched_job,
>> queue_node)
>> -
>>   /**
>>    * drm_sched_entity_init - Init a context entity used by scheduler
>> when
>>    * submit to HW ring.
>> @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
>> drm_sched_entity *entity)
>>   	/* The entity is guaranteed to not be used by the scheduler
>> */
>>   	prev = rcu_dereference_check(entity->last_scheduled, true);
>>   	dma_fence_get(prev);
>> -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
>>> job_queue)))) {
>> +	while ((job = drm_sched_entity_queue_pop(entity))) {
>>   		struct drm_sched_fence *s_fence = job->s_fence;
>>   
>>   		dma_fence_get(&s_fence->finished);
>> @@ -477,7 +476,7 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   {
>>   	struct drm_sched_job *sched_job;
>>   
>> -	sched_job = to_drm_sched_job(spsc_queue_peek(&entity-
>>> job_queue));
>> +	sched_job = drm_sched_entity_queue_peek(entity);
>>   	if (!sched_job)
>>   		return NULL;
>>   
>> @@ -513,7 +512,7 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>>   		struct drm_sched_job *next;
>>   
>> -		next = to_drm_sched_job(spsc_queue_peek(&entity-
>>> job_queue));
>> +		next = drm_sched_entity_queue_peek(entity);
>>   		if (next) {
>>   			struct drm_sched_rq *rq;
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
>> b/drivers/gpu/drm/scheduler/sched_internal.h
>> new file mode 100644
>> index 000000000000..815d384845a3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>> @@ -0,0 +1,46 @@
>> +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
>> +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> 
> DRM maintainer tools complain about a potentially missing license
> identifier:
> 
> -:80: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
> #80: FILE: drivers/gpu/drm/scheduler/sched_internal.h:1:
> 
> The other scheduler files don't have one, either. Still, it might be
> good to add one for new files. So, shall we make it GPL?

Ha, good question. And it is actually good I forgot to do this for this 
series (I was doing for unit tests last week, I mean adding SPDX lines) 
because, as sched_internal.h will take parts of gpu_scheduler.h which is 
not explicitly GPL, nor the other scheduler source files, apart from 
MODULE_LICENSE which is "GPL and additional rights", question indeed is 
what copyright blurb to put there. IANAL so not sure. Surely there is 
some established practice for cases like this one just I don't know what 
it is.

Regards,

Tvrtko

> Rest of the series looks good.
> 
> P.
> 
>> +
>> +/**
>> + * drm_sched_entity_queue_pop - Low level helper for popping queued
>> jobs
>> + *
>> + * @entity: scheduler entity
>> + *
>> + * Low level helper for popping queued jobs.
>> + *
>> + * Returns: The job dequeued or NULL.
>> + */
>> +static inline struct drm_sched_job *
>> +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
>> +{
>> +	struct spsc_node *node;
>> +
>> +	node = spsc_queue_pop(&entity->job_queue);
>> +	if (!node)
>> +		return NULL;
>> +
>> +	return container_of(node, struct drm_sched_job, queue_node);
>> +}
>> +
>> +/**
>> + * drm_sched_entity_queue_peek - Low level helper for peeking at the
>> job queue
>> + *
>> + * @entity: scheduler entity
>> + *
>> + * Low level helper for peeking at the job queue
>> + *
>> + * Returns: The job at the head of the queue or NULL.
>> + */
>> +static inline struct drm_sched_job *
>> +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
>> +{
>> +	struct spsc_node *node;
>> +
>> +	node = spsc_queue_peek(&entity->job_queue);
>> +	if (!node)
>> +		return NULL;
>> +
>> +	return container_of(node, struct drm_sched_job, queue_node);
>> +}
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 8c36a59afb72..c634993f1346 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -78,6 +78,8 @@
>>   #include <drm/gpu_scheduler.h>
>>   #include <drm/spsc_queue.h>
>>   
>> +#include "sched_internal.h"
>> +
>>   #define CREATE_TRACE_POINTS
>>   #include "gpu_scheduler_trace.h"
>>   
>> @@ -87,9 +89,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>>   };
>>   #endif
>>   
>> -#define to_drm_sched_job(sched_job)		\
>> -		container_of((sched_job), struct drm_sched_job,
>> queue_node)
>> -
>>   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>   
>>   /**
>> @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
>> drm_gpu_scheduler *sched,
>>   {
>>   	struct drm_sched_job *s_job;
>>   
>> -	s_job = to_drm_sched_job(spsc_queue_peek(&entity-
>>> job_queue));
>> +	s_job = drm_sched_entity_queue_peek(entity);
>>   	if (!s_job)
>>   		return false;
>>   
> 

