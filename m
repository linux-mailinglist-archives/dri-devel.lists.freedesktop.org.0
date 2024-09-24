Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19F98456B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98610E899;
	Tue, 24 Sep 2024 12:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3wj/AUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7A10E899;
 Tue, 24 Sep 2024 12:02:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42e5e1e6d37so54277295e9.3; 
 Tue, 24 Sep 2024 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727179374; x=1727784174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9tz/ENMphkPNUdL0iMpj9h5cj35+bQ5oXn4TtUlPa5c=;
 b=c3wj/AUQ9Wiakh0unSDNS89/b8fIgmrfBlvN4+ftOcJ69iZpSEiItUomJ+u5/9t7RX
 b3BKHnl5nlGZGzelIl0NuJnWqszkBQYRf7/BVMErUi3RZpxRDgpeZoInPFk5f9WV2tIE
 mu+Fh6CfPQhfCNYEaqQrp7UWix2NCRlxcTSs1y05VXefmnjPmPEp4W8HslZe1oIxd3ot
 /SMVFU7TfoV6QkDbJB6BYs9aeb5+wnijKDPHx4xQrOHwXWjyS0eWBKWQ913YWEy3mqsd
 BzoCa559OEtO3vy01aY7/Q6bTVuM9XQLhyQxq3BWs991NotURr2Od4U81XIEiIpm7K1X
 7peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727179374; x=1727784174;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9tz/ENMphkPNUdL0iMpj9h5cj35+bQ5oXn4TtUlPa5c=;
 b=DSWmStPQ9jjJeBEFmw0kG61W7HMr9/3ne1MhPKvRvIYQA2xfrFxbw1S3q6iipvX1I8
 kOn7hOpKvNSGWi3JWY/3Z7dOBsBFJpVCxy6j71h2RXzVwSuYZp5BOohT+uZhTiFIInTZ
 vUDyGDaQdAvpx0JbvfjzjwK50dnLZoUK9rmHQQPGu3gXWn7dTIllLK+rgw6B6K6nNWsx
 FVduz0fYLla9zvzL6NTq2U8N1PXBmx92u2gsREN/0eY9izMcbv48BZkVe8cL9HoJ4wy9
 gjbrSi9Fy61sPMJGRJlUDx7PuF1wZnRzEVvmWhYTrjf/wTREJt+U8PenWjx5EJaRDuUd
 /f4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGptVeh82I3f+4Da4jbYZA12qj3hKf1zHF2a5nJJVviYwwMrjkJEFLzCu23jSkFQMK4ZRyma1/@lists.freedesktop.org,
 AJvYcCVYTjPPE6dOOeozGROWuDZnuesJ3XwUTp2V2t50GTvTAOOUoOXgwp7Z31+iZHvyefR0WUUf9+D2GQmm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP3dIjMZd1lDx0WJqKIA+Ulc/6gbt6UGkMhL9S4mFnLucgns2g
 UL2gCMbOGOeUoqoNuxoQUmJ05RaHyljoXNryub5t2abHj5Qr13oT
X-Google-Smtp-Source: AGHT+IEU0X+v3end7Dbn9ot6FH5hDjOG5AkwcYSbd+dGNIO9pGaPsg0OgJcY6MBO9PDdb8/cA0c5+A==
X-Received: by 2002:a05:600c:15ca:b0:42e:93af:61c5 with SMTP id
 5b1f17b1804b1-42e93af61d2mr3561105e9.14.1727179373768; 
 Tue, 24 Sep 2024 05:02:53 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e902c66dcsm19957165e9.43.2024.09.24.05.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 05:02:53 -0700 (PDT)
Message-ID: <657ad50f-5458-4477-a348-5869c0282e35@gmail.com>
Date: Tue, 24 Sep 2024 14:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
 <478b066b-af6c-43a2-9e0e-a19344893bc0@gmail.com>
 <dfec609d-bbf8-4b6e-ad26-84e869694acc@igalia.com>
 <2ad66742-f572-4edc-957c-fcbd8c5a5917@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2ad66742-f572-4edc-957c-fcbd8c5a5917@igalia.com>
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

Am 24.09.24 um 11:58 schrieb Tvrtko Ursulin:
>
> On 24/09/2024 10:45, Tvrtko Ursulin wrote:
>>
>> On 24/09/2024 09:20, Christian König wrote:
>>> Am 16.09.24 um 19:30 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Having removed one re-lock cycle on the entity->lock in a patch titled
>>>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>>>> larger refactoring we can do the same optimisation on the rq->lock.
>>>> (Currently both drm_sched_rq_add_entity() and
>>>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>>>
>>>> To achieve this we make drm_sched_rq_update_fifo_locked() and
>>>> drm_sched_rq_add_entity() expect the rq->lock to be held.
>>>>
>>>> We also align drm_sched_rq_update_fifo_locked(),
>>>> drm_sched_rq_add_entity() and
>>>> drm_sched_rq_remove_fifo_locked() function signatures, by adding rq 
>>>> as a
>>>> parameter to the latter.
>>>>
>>>> v2:
>>>>   * Fix after rebase of the series.
>>>>   * Avoid naming incosistency between drm_sched_rq_add/remove. 
>>>> (Christian)
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Thanks!
>>
>> Are you okay to pull into drm-misc-next or we should do some more 
>> testing on this?
>>
>> And/or should I resend the series once more in it's entirety so this 
>> v2 is not a reply-to to the original?
>
> I have to respin for the drm_sched_wakeup fix that landed.

When I should push the series to drm-misc-next then please send it to me 
once more.

On the other hand we should now have to maintainers for that.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 29 
>>>> ++++++++++++------------
>>>>   include/drm/gpu_scheduler.h              |  3 ++-
>>>>   3 files changed, 26 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index d982cebc6bee..8ace1f1ea66b 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -515,9 +515,14 @@ struct drm_sched_job 
>>>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>           next = 
>>>> to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>>           if (next) {
>>>> +            struct drm_sched_rq *rq;
>>>> +
>>>>               spin_lock(&entity->lock);
>>>> -            drm_sched_rq_update_fifo_locked(entity,
>>>> +            rq = entity->rq;
>>>> +            spin_lock(&rq->lock);
>>>> +            drm_sched_rq_update_fifo_locked(entity, rq,
>>>>                               next->submit_ts);
>>>> +            spin_unlock(&rq->lock);
>>>>               spin_unlock(&entity->lock);
>>>>           }
>>>>       }
>>>> @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct 
>>>> drm_sched_job *sched_job)
>>>>           sched = rq->sched;
>>>>           atomic_inc(sched->score);
>>>> +
>>>> +        spin_lock(&rq->lock);
>>>>           drm_sched_rq_add_entity(rq, entity);
>>>>           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> -            drm_sched_rq_update_fifo_locked(entity, submit_ts);
>>>> +            drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>>> +        spin_unlock(&rq->lock);
>>>>           spin_unlock(&entity->lock);
>>>>           drm_sched_wakeup(sched, entity);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 18a952f73ecb..5c83fb92bb89 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -153,17 +153,18 @@ static __always_inline bool 
>>>> drm_sched_entity_compare_before(struct rb_node *a,
>>>>       return ktime_before(ent_a->oldest_job_waiting, 
>>>> ent_b->oldest_job_waiting);
>>>>   }
>>>> -static inline void drm_sched_rq_remove_fifo_locked(struct 
>>>> drm_sched_entity *entity)
>>>> +static void drm_sched_rq_remove_fifo_locked(struct 
>>>> drm_sched_entity *entity,
>>>> +                        struct drm_sched_rq *rq)
>>>>   {
>>>> -    struct drm_sched_rq *rq = entity->rq;
>>>> -
>>>>       if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>>           rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>>>           RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>       }
>>>>   }
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity 
>>>> *entity, ktime_t ts)
>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> +                     struct drm_sched_rq *rq,
>>>> +                     ktime_t ts)
>>>>   {
>>>>       /*
>>>>        * Both locks need to be grabbed, one to protect from 
>>>> entity->rq change
>>>> @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct 
>>>> drm_sched_entity *entity, ktime_t ts
>>>>        * other to update the rb tree structure.
>>>>        */
>>>>       lockdep_assert_held(&entity->lock);
>>>> +    lockdep_assert_held(&rq->lock);
>>>> -    spin_lock(&entity->rq->lock);
>>>> -
>>>> -    drm_sched_rq_remove_fifo_locked(entity);
>>>> +    drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>       entity->oldest_job_waiting = ts;
>>>> -    rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
>>>> +    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>>                 drm_sched_entity_compare_before);
>>>> -
>>>> -    spin_unlock(&entity->rq->lock);
>>>>   }
>>>>   /**
>>>> @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct 
>>>> drm_gpu_scheduler *sched,
>>>>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>>                    struct drm_sched_entity *entity)
>>>>   {
>>>> +    lockdep_assert_held(&entity->lock);
>>>> +    lockdep_assert_held(&rq->lock);
>>>> +
>>>>       if (!list_empty(&entity->list))
>>>>           return;
>>>> -    spin_lock(&rq->lock);
>>>> -
>>>>       atomic_inc(rq->sched->score);
>>>>       list_add_tail(&entity->list, &rq->entities);
>>>> -
>>>> -    spin_unlock(&rq->lock);
>>>>   }
>>>>   /**
>>>> @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct 
>>>> drm_sched_rq *rq,
>>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>                   struct drm_sched_entity *entity)
>>>>   {
>>>> +    lockdep_assert_held(&entity->lock);
>>>> +
>>>>       if (list_empty(&entity->list))
>>>>           return;
>>>> @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct 
>>>> drm_sched_rq *rq,
>>>>           rq->current_entity = NULL;
>>>>       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> -        drm_sched_rq_remove_fifo_locked(entity);
>>>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>       spin_unlock(&rq->lock);
>>>>   }
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index 80198e6cf537..b21806d5a8eb 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct 
>>>> drm_sched_rq *rq,
>>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>                   struct drm_sched_entity *entity);
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity 
>>>> *entity, ktime_t ts);
>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> +                     struct drm_sched_rq *rq, ktime_t ts);
>>>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>                 enum drm_sched_priority priority,
>>>

