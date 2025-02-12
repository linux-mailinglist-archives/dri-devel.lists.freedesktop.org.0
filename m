Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DCA322C6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 10:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB08E10E830;
	Wed, 12 Feb 2025 09:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TI16+gVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3DC10E830;
 Wed, 12 Feb 2025 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqN6cdz9aKPtBxyayVQgjhlGZzNZZSdj9WQJfpMiF8o=; b=TI16+gVw3ZCBMNp9R+/OimKjMy
 AvoY+L1vIWpFZH+WTxUF9pQ6tJO2JGZCA6iL3LjStADyQHB+rpabs0ZaXBZsbPWpah3esnQ1p0eTl
 x1iisx+50LpGvnfkwq9cezkwQFC1TJKyyxTn/+SnZr8nJSGM8JW65ThQXD3EZu5vfdTzVez3A0j/4
 PI9k2TYh6FQgtS0oCcTnotExpHlUAoK0oH9aKzVd4x9GvVEAyzBJ7vIs2Ty6V0npCmTOXYmAWSoKT
 5PmZGag6fL348L5PI08CGhxw0pTghXddtgTdgOve4G+eMKpxZkbqWlzHt0aVrjSbLwKhkkosniQtc
 qkZGdzuQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ti9NQ-008AyG-Ca; Wed, 12 Feb 2025 10:49:58 +0100
Message-ID: <d42dfbfd-0941-49c2-b691-f860aef1abae@igalia.com>
Date: Wed, 12 Feb 2025 09:49:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/sched: Move drm_sched_entity_is_ready to internal
 header
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-5-tvrtko.ursulin@igalia.com>
 <4b234b06b2d32377fef4777c250b873e759a3c5c.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4b234b06b2d32377fef4777c250b873e759a3c5c.camel@mailbox.org>
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


On 12/02/2025 09:02, Philipp Stanner wrote:
> btw. I still believe that it would be helpful (and congruent with the
> established norm) to have the version in all patch titles. I do use
> threaded view, but inboxes are huge, and everything that helps you
> orient yourself is welcome
> 
> On Fri, 2025-02-07 at 14:51 +0000, Tvrtko Ursulin wrote:
>> Helper is for scheduler internal use so lets hide it from DRM drivers
>> completely.
>>
>> At the same time we change the method of checking whethere there is
>> anything in the queue from peeking to looking at the node count.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c   | 12 ------------
>>   drivers/gpu/drm/scheduler/sched_internal.h | 13 +++++++++++++
>>   include/drm/gpu_scheduler.h                |  1 -
>>   3 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index a171f05ad761..87f88259ddf6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -151,18 +151,6 @@ static bool drm_sched_entity_is_idle(struct
>> drm_sched_entity *entity)
>>   	return false;
>>   }
>>   
>> -/* Return true if entity could provide a job. */
>> -bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
>> -{
>> -	if (spsc_queue_peek(&entity->job_queue) == NULL)
>> -		return false;
>> -
>> -	if (READ_ONCE(entity->dependency))
>> -		return false;
>> -
>> -	return true;
>> -}
>> -
>>   /**
>>    * drm_sched_entity_error - return error of last scheduled job
>>    * @entity: scheduler entity to check
>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
>> b/drivers/gpu/drm/scheduler/sched_internal.h
>> index 25ac62ac2bf3..9ff5cddb5708 100644
>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>> @@ -43,4 +43,17 @@ drm_sched_entity_queue_peek(struct
>> drm_sched_entity *entity)
>>   	return container_of(node, struct drm_sched_job, queue_node);
>>   }
>>   
>> +/* Return true if entity could provide a job. */
>> +static inline bool
>> +drm_sched_entity_is_ready(struct drm_sched_entity *entity)
>> +{
>> +	if (!spsc_queue_count(&entity->job_queue))
>> +		return false;
>> +
>> +	if (READ_ONCE(entity->dependency))
>> +		return false;
>> +
>> +	return true;
>> +}
> 
> Is there any particular reason why you want the code in an header
> instead of a new .c file?

IMO it is too trivial to warrant emitting a function.

> We might want to consider this, since I'd expect that the number of
> internal helpers increases over the years.

I actually hope the scheduler code gets smaller and simpler in the 
future. In any case the things hidden in sched_internal.h will be easy 
to refactor since it will be impossible for drivers to grow a dependency 
on them.

Regards,

Tvrtko

>> +
>>   #endif
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 5188c7f3bd3b..962825613596 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -606,7 +606,6 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>   				   enum drm_sched_priority
>> priority);
>> -bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>>   
>>   struct drm_sched_fence *drm_sched_fence_alloc(
> 

