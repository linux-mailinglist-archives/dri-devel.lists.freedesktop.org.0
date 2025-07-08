Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E9AFCA56
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEA310E610;
	Tue,  8 Jul 2025 12:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r58m/B75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4AA10E05B;
 Tue,  8 Jul 2025 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b7vy8YsO7GjpxqRkHw7xNUgM9rTyG3gT3o+7zfEyN8Q=; b=r58m/B75JmtGzp1ZrjerxVkFi4
 xnTtMneFRx8RUJLo5OEtiGShdmIm7Nyn+o3Y6O0xCXd8W9R9kDJecLUV626dNY9QSAoPJjnFR9K04
 yVdXarbO6ZQG1HOSrGCCweTDxLOrBOdlRperxuydodG+NzOw4DwmOYi+cZ9+9C1xHdnu/Wz1aqU9F
 ouKbRGkXkgZ6JzEpYp/KCl/gaQZy/i0OUrh7CjtamgxRuDO2ld9SwGcvfqXM+bFSy7OyoWycXclKg
 zRy6vxr6kR9kBiy6t2tdozE4iCgzCecEA86Itcst3Del6rxa6AG6C+0HZnuJSBZiFlm/4BKVfv0U3
 uwdJFXng==;
Received: from [84.65.48.237] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZ7MA-00E08S-3i; Tue, 08 Jul 2025 14:23:30 +0200
Message-ID: <1061411c-bfdf-4b50-b976-b761498acd62@igalia.com>
Date: Tue, 8 Jul 2025 13:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] drm/sched: Consolidate
 drm_sched_rq_select_entity_rr
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
 <20250708095147.73366-6-tvrtko.ursulin@igalia.com>
 <dcfae9b0caa19e46c36ec7e30c741867d145a828.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <dcfae9b0caa19e46c36ec7e30c741867d145a828.camel@mailbox.org>
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


On 08/07/2025 12:31, Philipp Stanner wrote:
> On Tue, 2025-07-08 at 10:51 +0100, Tvrtko Ursulin wrote:
>> Extract out two copies of the identical code to function epilogue to
>> make
>> it smaller and more readable.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
> 
> Can also be branched out.

Done as well.

Regards,

Tvrtko


> P.
> 
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++-------------
>> --
>>   1 file changed, 20 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 2335df4de2b8..9212ebae7476 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct
>> drm_gpu_scheduler *sched,
>>   	entity = rq->current_entity;
>>   	if (entity) {
>>   		list_for_each_entry_continue(entity, &rq->entities,
>> list) {
>> -			if (drm_sched_entity_is_ready(entity)) {
>> -				/* If we can't queue yet, preserve
>> the current
>> -				 * entity in terms of fairness.
>> -				 */
>> -				if (!drm_sched_can_queue(sched,
>> entity)) {
>> -					spin_unlock(&rq->lock);
>> -					return ERR_PTR(-ENOSPC);
>> -				}
>> -
>> -				rq->current_entity = entity;
>> -				reinit_completion(&entity-
>>> entity_idle);
>> -				spin_unlock(&rq->lock);
>> -				return entity;
>> -			}
>> +			if (drm_sched_entity_is_ready(entity))
>> +				goto found;
>>   		}
>>   	}
>>   
>>   	list_for_each_entry(entity, &rq->entities, list) {
>> -		if (drm_sched_entity_is_ready(entity)) {
>> -			/* If we can't queue yet, preserve the
>> current entity in
>> -			 * terms of fairness.
>> -			 */
>> -			if (!drm_sched_can_queue(sched, entity)) {
>> -				spin_unlock(&rq->lock);
>> -				return ERR_PTR(-ENOSPC);
>> -			}
>> -
>> -			rq->current_entity = entity;
>> -			reinit_completion(&entity->entity_idle);
>> -			spin_unlock(&rq->lock);
>> -			return entity;
>> -		}
>> +		if (drm_sched_entity_is_ready(entity))
>> +			goto found;
>>   
>>   		if (entity == rq->current_entity)
>>   			break;
>> @@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct
>> drm_gpu_scheduler *sched,
>>   	spin_unlock(&rq->lock);
>>   
>>   	return NULL;
>> +
>> +found:
>> +	if (!drm_sched_can_queue(sched, entity)) {
>> +		/*
>> +		 * If scheduler cannot take more jobs signal the
>> caller to not
>> +		 * consider lower priority queues.
>> +		 */
>> +		entity = ERR_PTR(-ENOSPC);
>> +	} else {
>> +		rq->current_entity = entity;
>> +		reinit_completion(&entity->entity_idle);
>> +	}
>> +
>> +	spin_unlock(&rq->lock);
>> +
>> +	return entity;
>>   }
>>   
>>   /**
> 

