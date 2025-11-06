Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392AAC3B5C2
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2426110E8D0;
	Thu,  6 Nov 2025 13:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="U0wb6EbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E69010E8D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:45:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4710022571cso9624985e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 05:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762436713; x=1763041513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zd4PW3sXmEdbWHOmsnkpXm0o3Nt7CO0r5PvUcfh+07A=;
 b=U0wb6EbVDHQ8zilntvm7Up3UrwUVErV5zcWLHZk6V6HOwPJ3SzBy8HYc9fhktKhpsd
 2TqaS9OI4IgN/gvTmAq4FJFKhyLayhzpzwWNcDVQ70tz04KMztEHIazFUAkBZP01htqh
 fzSV5pu9NA8AqsEQJMUs4yHLYHO6oTzV5mCbN0tx+AF0CLSzNyBy3K4psSoPc7UQXULu
 yjsqQN9WqmgkVwaXklybI31pNEOsNZPc+xKIvHpukanxEENlzR8yoBBhpP0FxJz3i+8i
 Y4Su8y3WzmbM9xf0DvQqwF5RW7lVJZKlZAO/so+YAIxiHQ9LDtXTX8lun4CclI4UuEa6
 eg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762436713; x=1763041513;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zd4PW3sXmEdbWHOmsnkpXm0o3Nt7CO0r5PvUcfh+07A=;
 b=J8y7NXrLQloVzZ5BK8XoeRcir0u0YQCpF0/21vPZx/ZO71zbH2GbRCGGc0KDPu1JFO
 qlAMbaKjgcCr6zoqryDtvcgtP1Qmoa4Xfh56qIgcQs+yLu4CHQF8flFzqAsgUYXqfeqB
 29o3DgAOYoeqMRhalOSQOY6OKGZxmdeTnwL2YZJhZ3RqSfGyAnukTWHwfzqStOFz+1CH
 utdfAEPe+5LmjD1PQFdQ91dwdn/4cm7jQJ+Bt3ExkGb7VMVQ0ZapZhFzblyA36RNK/3i
 PRYcyAuCrt3eZ7ILqFw0tfnkuz+w4yVchF5S+tDujpKFYr8GcdUYownrf7bVNT2BU5FO
 Ag9A==
X-Gm-Message-State: AOJu0YwDuIHI+GmZBhiRNkIFZkAh6agEvDahAmKIchOOGL1i5R8R98d9
 uJA8tVagfA1JfM5l0u0VVNZqEyTS9ew6ugrUKhITTIKXcu0HAcZ5Nld/a4QYJvXP74U=
X-Gm-Gg: ASbGnculBgCp12eEgpLx2MK2sBsx9wV5P6s1ow018ZEknPD2h07CntGIad4ecE/YWZ6
 sKDI9OWz5NfJiPAjxxDDw1f2uzls6v87MW/eWdqZhG+9pwBsBGNuPCw7sBxtHQ7P+tq/67Aqiu1
 1UqJGaHlimvnr4qUQ51lacjar4yM+5aQ73HrXJMQTEZGZcfIWjYItlon6lR8aUDapGHPBrfAyyF
 jOzmiYLD4To/5RM6qtD2DFvjcgXnKzURXVm2Ek28rREIHRlDQZQlOmecM7jxLwn6qPNRIr96hD2
 Ti90MjIUuzzfbHfy7uXf4cjCZXH65JSzzzXegrDSTKbCRK8+UWfhjdDPhi/fzIr17TFF3vbtQGX
 ubUadQV5VAJtrgka5W1jsTCRSADbeZaclutH4yeF1nGPpNgj2WgGqPAxQujZRsjS3KWPfX5JQzM
 j0lf2Vd8v4MNNsvA6bcAzm85PCnJQ=
X-Google-Smtp-Source: AGHT+IELu2dIYWmTZrepW0xk0B/taELqbeMocm/0Iz7VdeAFvY/QqDYiHuSMbguwe/zRVyrvNR2BNA==
X-Received: by 2002:a05:600c:1e21:b0:471:11a3:a6a9 with SMTP id
 5b1f17b1804b1-4775ce8dc79mr63346545e9.37.1762436712661; 
 Thu, 06 Nov 2025 05:45:12 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477640fba3esm17433165e9.6.2025.11.06.05.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:45:12 -0800 (PST)
Message-ID: <4ae8136e-8c12-40cd-b254-bc8ec55871e0@ursulin.net>
Date: Thu, 6 Nov 2025 13:45:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-10-christian.koenig@amd.com>
 <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
 <1ddca1b3-e0d2-41bd-8708-10dd12f7e656@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <1ddca1b3-e0d2-41bd-8708-10dd12f7e656@amd.com>
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


On 06/11/2025 13:23, Christian König wrote:
> On 11/4/25 16:12, Tvrtko Ursulin wrote:
>>
>> On 31/10/2025 13:16, Christian König wrote:
>>> Just as proof of concept and minor cleanup.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
>>>    include/drm/gpu_scheduler.h             |  4 ----
>>>    2 files changed, 5 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 9391d6f0dc01..7a94e03341cb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>        struct dma_fence *parent;
>>>        unsigned long flags;
>>>    -    spin_lock_irqsave(&fence->lock, flags);
>>> +    dma_fence_lock(f, flags);
>>
>> Moving to dma_fence_lock should either be a separate patch or squashed into the one which converts many other drivers. Even a separate patch before that previous patch would be better.
> 
> As far as I can see that won't work or would be at least rather tricky.
> 
> Previously from spin_lock_irqsave() locked drm_sched_fence->lock, but now it is locking dma_fence->lock.
> 
> That only works because we switched to using the internal lock.

What I meant here is to add a patch before the current 5/20.

Because in 5/20 one we have a lot of:

-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);

If before it you insert a patch like "dma-fence: Add lock/unlock helper" 
as standalone, then 5/20 simply touches the internal of the helper and 
becomes smaller.

That new patch would also include the drm/sched part where it would be a 
straight replacement. At that point dma_fence->lock == 
dma_sched_fence->lock.

Then at the point of this patch you remove dma_sched_fence->lock member 
but dma_fence_lock_* already does the right thing before it, no?

Sorry if I got confused somehow, I am jumping between topics.

Regards,

Tvrtko
>> Naming wise, I however still think dma_fence_lock_irqsave would probably be better to stick with the same pattern everyone is so used too.
> 
> Oh, that is a good idea. Going to apply this to the patch set.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>          /* If we already have an earlier deadline, keep it: */
>>>        if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>            ktime_before(fence->deadline, deadline)) {
>>> -        spin_unlock_irqrestore(&fence->lock, flags);
>>> +        dma_fence_unlock(f, flags);
>>>            return;
>>>        }
>>>          fence->deadline = deadline;
>>>        set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>>    -    spin_unlock_irqrestore(&fence->lock, flags);
>>> +    dma_fence_unlock(f, flags);
>>>          /*
>>>         * smp_load_aquire() to ensure that if we are racing another
>>> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>          fence->owner = owner;
>>>        fence->drm_client_id = drm_client_id;
>>> -    spin_lock_init(&fence->lock);
>>>          return fence;
>>>    }
>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>        fence->sched = entity->rq->sched;
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>> -               &fence->lock, entity->fence_context, seq);
>>> +               NULL, entity->fence_context, seq);
>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>> -               &fence->lock, entity->fence_context + 1, seq);
>>> +               NULL, entity->fence_context + 1, seq);
>>>    }
>>>      module_init(drm_sched_fence_slab_init);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index fb88301b3c45..b77f24a783e3 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>>             * belongs to.
>>>             */
>>>        struct drm_gpu_scheduler    *sched;
>>> -        /**
>>> -         * @lock: the lock used by the scheduled and the finished fences.
>>> -         */
>>> -    spinlock_t            lock;
>>>            /**
>>>             * @owner: job owner for debugging
>>>             */
>>
> 

