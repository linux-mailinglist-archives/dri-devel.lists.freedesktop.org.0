Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0808C25035
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AA010EB49;
	Fri, 31 Oct 2025 12:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="a5QIq9Xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222F10EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:31:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1452994f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761913894; x=1762518694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=08fssheEH26ewL9xgSjQ1sFTztWWkCBjLlcECWJQBfM=;
 b=a5QIq9XnXryE3F8+mAQmY5hglsPZgomyx0jr1TKH8LMXJr0mlipfVPcVGyG+TyieRs
 StIOBUzRZvvdLlNx8ThVQGXiSC5z30HTGfQ28T0hzHe5infQ7y3mgXVN+M8XzlpXrSh3
 p2yyx+bUJp4yNOzBUhQkxLNH+jrGaslW9saXYgXBO4tq/8C23nf1+mYKmuMjg2FwKUvm
 U6BXS9i98H147IDkb0zEBgnIKLHJG05ym9V/kNmkVv3Xkwf1+qyWxS6BZ7ngJUm+9dLG
 n94MrfJs97Xg/e+EK93T2Dt07wZPP+XCzrnwSQR2EMg8F+kiQr809QN90JboauNpzYHK
 V01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761913894; x=1762518694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=08fssheEH26ewL9xgSjQ1sFTztWWkCBjLlcECWJQBfM=;
 b=hgPG79yhm2OK9jSiLCCJHrOQG1TczYfatapm51TsROlcGW8Na5RYdm9CIevlDtIxCR
 kZ0+XV4f6x8QYyb5uDCk53af+En7n4M1IXolymNnPSYpOrUf7XUo4PuEXXvD24ksCaBq
 j55wxP6W7eywHLNwopIRv3uy9LF1YDseNLA/vnbOmE2M/p8jgiM1PcSuajPIHNe9MwGK
 mBMCUq25ik2pL5lREdsu9CC9YoEW/celfkKTo4qXhrpweldZo3l3h4uPa+ie9QlqGir4
 GtlGdKPlppomQcR4UKXOZxyp1eJ6V1WxPojs8svy/WmOmMQI2EEFYpE8SMHD24OXMJ9/
 LrEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmW2WZbmTk7SWj0d8Gfb+1yOuQjMxzFyWOknGEKKFNzKhO57hhyaw6usOVEjHHTtyAO9ps0fFQUs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0JAxu7hLr5RCL4xePuDGqnejcv5fkklvVj+IEzZU+wH7czbEE
 eomAm6dFseGzj7cjxgnaCdBhf84H6mwZi6ikkv9QivEBjPZ07yZo5TDQxZwO4PWRRwc=
X-Gm-Gg: ASbGnct/JhpbBNXfF1HJdNZT0hlWO1oiSwQTRwfUHAhaKmMHugk25ufRCpAAuC0nQ5O
 XfLwuZE0YIZPZqhBd72yTCZlwRg76k1h1cPYcn3XGFnjZtS5t2iiyF8aj7DVqm2nxXr/keWKqDA
 M7ymLShPKTVMyTNXSKKPkCoGBjb7+M5guywjpcYONen3WqJn7w02PGtoUwrTweh8GWO/pAmX68n
 wXgJSaG6HTBiuSaSkM8BG/58lJfGwLW3jwJvyuOgUWE0gjGRJyJHa7Ii8U8gZf7HlNygYZnzrLn
 9XdIkBDNrG3zGiLJuSxhArkFlx6lOZIYGYE/hGfyrPcfiLkl7jTkYjqQlSoXJCBnpbaRAWc5Kcz
 bmv4Cf3aTbH6q/2j6TC8+A4YPpvuGqxvkpiw1/Gcp7uGI/lIb+NQY0U8DhL0iTV9qdYFf3TROjP
 FZkl8I74Vsa2ubBE0je+gTrGxlgZA=
X-Google-Smtp-Source: AGHT+IFN1SIbYGYuHJIssflh634/zxs/aR+a86BEewospW9lCTe+InyrPCsK+oVBo1QTVBWURISFmw==
X-Received: by 2002:a05:6000:2288:b0:427:5cf:a284 with SMTP id
 ffacd0b85a97d-429bd6c2d51mr2705783f8f.60.1761913894379; 
 Fri, 31 Oct 2025 05:31:34 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1406a45sm3333829f8f.47.2025.10.31.05.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 05:31:33 -0700 (PDT)
Message-ID: <08bc7f37-d2d7-4ad0-9575-f8a2c36b1c3f@ursulin.net>
Date: Fri, 31 Oct 2025 12:31:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
 <411190d4-92d7-4e95-acac-b39afa438c0f@ursulin.net>
 <50f3743f-8b83-42de-87c8-1c7d52df3ab0@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <50f3743f-8b83-42de-87c8-1c7d52df3ab0@amd.com>
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


On 31/10/2025 12:25, Christian König wrote:
> 
> 
> On 10/31/25 12:50, Tvrtko Ursulin wrote:
>>
>> On 31/10/2025 09:07, Pierre-Eric Pelloux-Prayer wrote:
>>> The Mesa issue referenced below pointed out a possible deadlock:
>>>
>>> [ 1231.611031]  Possible interrupt unsafe locking scenario:
>>>
>>> [ 1231.611033]        CPU0                    CPU1
>>> [ 1231.611034]        ----                    ----
>>> [ 1231.611035]   lock(&xa->xa_lock#17);
>>> [ 1231.611038]                                local_irq_disable();
>>> [ 1231.611039]                                lock(&fence->lock);
>>> [ 1231.611041]                                lock(&xa->xa_lock#17);
>>> [ 1231.611044]   <Interrupt>
>>> [ 1231.611045]     lock(&fence->lock);
>>> [ 1231.611047]
>>>                   *** DEADLOCK ***
>>>
>>> In this example, CPU0 would be any function accessing job->dependencies
>>> through the xa_* functions that doesn't disable interrupts (eg:
>>> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>>>
>>> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
>>> callback so in an interrupt context. It will deadlock when trying to
>>> grab the xa_lock which is already held by CPU0.
>>>
>>> Replacing all xa_* usage by their xa_*_irq counterparts would fix
>>> this issue, but Christian pointed out another issue: dma_fence_signal
>>> takes fence.lock and so does dma_fence_add_callback.
>>>
>>>     dma_fence_signal() // locks f1.lock
>>>     -> drm_sched_entity_kill_jobs_cb()
>>>     -> foreach dependencies
>>>        -> dma_fence_add_callback() // locks f2.lock
>>>
>>> This will deadlock if f1 and f2 share the same spinlock.
>>
>> Is it possible to hit this case?
>>
>> Same lock means same execution timeline
> 
> Nope, exactly that is incorrect. It's completely up to the implementation what they use this lock for.

Yes, sorry, I got confused for a moment. The lock can be per hw 
scheduler while execution timeline is per entity.

Regards,

Tvrtko

> 
>> , which should mean dependency should have been squashed in drm_sched_job_add_dependency(), no?
> 
> This makes it less likely, but not impossible to trigger.
> 
> Regards,
> Christian.
> 
>>
>> Or would sharing the lock but not sharing the entity->fence_context be considered legal? It would be surprising at least.
>>
>> Also, would anyone have time to add a kunit test? ;)
>>
>> Regards,
>>
>> Tvrtko
>>
>>> To fix both issues, the code iterating on dependencies and re-arming them
>>> is moved out to drm_sched_entity_kill_jobs_work.
>>>
>>> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>>    1 file changed, 19 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index c8e949f4a568..fe174a4857be 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_entity_error);
>>>    +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> +                      struct dma_fence_cb *cb);
>>> +
>>>    static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>    {
>>>        struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>> -
>>> -    drm_sched_fence_scheduled(job->s_fence, NULL);
>>> -    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>> -    WARN_ON(job->s_fence->parent);
>>> -    job->sched->ops->free_job(job);
>>> -}
>>> -
>>> -/* Signal the scheduler finished fence when the entity in question is killed. */
>>> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> -                      struct dma_fence_cb *cb)
>>> -{
>>> -    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> -                         finish_cb);
>>> +    struct dma_fence *f;
>>>        unsigned long index;
>>>    -    dma_fence_put(f);
>>> -
>>>        /* Wait for all dependencies to avoid data corruptions */
>>>        xa_for_each(&job->dependencies, index, f) {
>>>            struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
>>> @@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>>            dma_fence_put(f);
>>>        }
>>>    +    drm_sched_fence_scheduled(job->s_fence, NULL);
>>> +    drm_sched_fence_finished(job->s_fence, -ESRCH);
>>> +    WARN_ON(job->s_fence->parent);
>>> +    job->sched->ops->free_job(job);
>>> +}
>>> +
>>> +/* Signal the scheduler finished fence when the entity in question is killed. */
>>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> +                      struct dma_fence_cb *cb)
>>> +{
>>> +    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> +                         finish_cb);
>>> +
>>> +    dma_fence_put(f);
>>> +
>>>        INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>>>        schedule_work(&job->work);
>>>    }
>>
> 

