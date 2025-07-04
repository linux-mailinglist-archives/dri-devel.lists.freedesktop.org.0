Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C7AAF9473
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A76510EA50;
	Fri,  4 Jul 2025 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="c2iYFCEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11210EA4A;
 Fri,  4 Jul 2025 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4rPrY0FYFXhF0R1V3Cs1U0aoJlW+w07Rwg7eVRpXaFI=; b=c2iYFCEE6ksdokFxZHT8+s8SwQ
 cvEPsTjC/gN17gjDBOoQeZopISur540Klq6Wue18EER/DUEKaCBkxhn+N3RgbWz1ivWcbfpwBitZ+
 qF0XnIvQsHAPzMkP6UQEKhwwlFJN0ZJniG0aHw81VSc0EyQcRsY38NCNlo5fYIF5FkZ0RKfK49xz3
 YjgLO58jbUkBja8vi0ahRxiFKzvVcIhzZIP0R68/FuN84/yuEsHbaJiKaW+xQY+N+KH67WyJnhwTA
 MBcj3SZnaNy3ODzK9g3zIS2ecT+MlPljOXK8IX7bNvz8adiMFXK7KDKZERjfhRtneCkQC6sdU/V2J
 Uz3yBCaQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXghn-00CRrr-7J; Fri, 04 Jul 2025 15:43:55 +0200
Message-ID: <41bc0c4a-52d9-463e-af41-9f284adc1fb2@igalia.com>
Date: Fri, 4 Jul 2025 14:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/16] drm/sched: Consolidate
 drm_sched_rq_select_entity_rr
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-7-tvrtko.ursulin@igalia.com>
 <2dfd7d95-8cad-4e11-a363-706a9293a6ae@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2dfd7d95-8cad-4e11-a363-706a9293a6ae@igalia.com>
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


On 04/07/2025 14:32, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 23/06/25 09:27, Tvrtko Ursulin wrote:
>> Extract out two copies of the identical code to function epilogue to make
>> it smaller and more readable.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 48 +++++++++++---------------
>>   1 file changed, 20 insertions(+), 28 deletions(-)
>>
> 
> I'd consider dropping this patch. The function
> drm_sched_rq_select_entity_rr() will be deleted in the next patch
> anyway. Therefore, we could land 7/16 in drm-misc-next (even before
> landing fair scheduling) and get rid of drm_sched_rq_select_entity_rr().

If "drm/sched: Implement RR via FIFO" gets a green light I could indeed 
drop this one. It was there for the case RR-via-FIFO wouldn't be 
accepted. Wait a bit longer and then decide?

Regards,

Tvrtko

>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/ 
>> scheduler/sched_main.c
>> index 0627a82c02dc..436d58073823 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -263,38 +263,14 @@ drm_sched_rq_select_entity_rr(struct 
>> drm_gpu_scheduler *sched,
>>       entity = rq->current_entity;
>>       if (entity) {
>>           list_for_each_entry_continue(entity, &rq->entities, list) {
>> -            if (drm_sched_entity_is_ready(entity)) {
>> -                /* If we can't queue yet, preserve the current
>> -                 * entity in terms of fairness.
>> -                 */
>> -                if (!drm_sched_can_queue(sched, entity)) {
>> -                    spin_unlock(&rq->lock);
>> -                    return ERR_PTR(-ENOSPC);
>> -                }
>> -
>> -                rq->current_entity = entity;
>> -                reinit_completion(&entity->entity_idle);
>> -                spin_unlock(&rq->lock);
>> -                return entity;
>> -            }
>> +            if (drm_sched_entity_is_ready(entity))
>> +                goto found;
>>           }
>>       }
>>       list_for_each_entry(entity, &rq->entities, list) {
>> -        if (drm_sched_entity_is_ready(entity)) {
>> -            /* If we can't queue yet, preserve the current entity in
>> -             * terms of fairness.
>> -             */
>> -            if (!drm_sched_can_queue(sched, entity)) {
>> -                spin_unlock(&rq->lock);
>> -                return ERR_PTR(-ENOSPC);
>> -            }
>> -
>> -            rq->current_entity = entity;
>> -            reinit_completion(&entity->entity_idle);
>> -            spin_unlock(&rq->lock);
>> -            return entity;
>> -        }
>> +        if (drm_sched_entity_is_ready(entity))
>> +            goto found;
>>           if (entity == rq->current_entity)
>>               break;
>> @@ -303,6 +279,22 @@ drm_sched_rq_select_entity_rr(struct 
>> drm_gpu_scheduler *sched,
>>       spin_unlock(&rq->lock);
>>       return NULL;
>> +
>> +found:
>> +    if (!drm_sched_can_queue(sched, entity)) {
>> +        /*
>> +         * If scheduler cannot take more jobs signal the caller to not
>> +         * consider lower priority queues.
>> +         */
>> +        entity = ERR_PTR(-ENOSPC);
>> +    } else {
>> +        rq->current_entity = entity;
>> +        reinit_completion(&entity->entity_idle);
>> +    }
>> +
>> +    spin_unlock(&rq->lock);
>> +
>> +    return entity;
>>   }
>>   /**
> 

