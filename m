Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D297E7536
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 00:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112FA10E055;
	Thu,  9 Nov 2023 23:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703410E240
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 23:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699573277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MxZ6Gpu2ZY5XFOSSiOWfx9OFXAfnsmsKNXVSdbFKd0=;
 b=TJx6AZSw8YaNZmmqnkxCZBWLzbaJahgRgsbEZYIEP0ehEsqtZjCEam2IM7nzgK9jml0/g5
 JQ6gD0OhreTyHuWLWF6pGqiygJ2bMmgWG+OtFmD68/bL2057WHmfnKmcWxc/gi28/FcGIw
 rBt/SKS0mVRyqbIxGwxCPyJeqoAHwvY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-TNhOWMXGNEiW9IUVAfC0Sw-1; Thu, 09 Nov 2023 18:41:16 -0500
X-MC-Unique: TNhOWMXGNEiW9IUVAfC0Sw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4094d1e52daso9547255e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 15:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699573275; x=1700178075;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MxZ6Gpu2ZY5XFOSSiOWfx9OFXAfnsmsKNXVSdbFKd0=;
 b=rIsRQsOkiRwQigNA2syn1W2d0TMK7v+ECAXP4W7DZMmU6hxYeeGexS4LG+JTG04k16
 8trkyjRl61p9P57wFa2v7kQd0jv7bzCBIIE6SoFdPbtatSVRPvrpKs7RHIcoTMUUP1un
 yhzHdAxlA4BL9mFqWaT5gk3M5J/Q+k8s+WgdaBQ3tuEr2NLXpr2GP2L2X+IB2qB0mC60
 IIdVFIQBe/H7NdQbZEnTsnbUN2oaYEPk/TwXgIP0Go6oOf6P2Pa9lfH6ZXaUuRqUhe6V
 GfAdrLkuo10V+AOPk5gSwR2GGDPutm/j8ugOZPl8JNi3TcAUziCjG/Wiuh7gknstLzBN
 mC9A==
X-Gm-Message-State: AOJu0YyTevSgNcLZN8gWvSosUBM2CexnJjU9qOAGPcxaxCe8PBUN1Z4F
 Pf+t0zfxHd1z4tVka60+KJ/n7cp1qy8J4uh+VUjL72xuEyLT+zhoV/ygEsUwtHZOncrdI8v0o1/
 5AU8i+Ia9w/BFAyQmeCF24UmrZXZe
X-Received: by 2002:a5d:64ec:0:b0:32f:84e3:9db5 with SMTP id
 g12-20020a5d64ec000000b0032f84e39db5mr6052201wri.6.1699573275328; 
 Thu, 09 Nov 2023 15:41:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1jrVclaU74pvpJD+oXfvsU+vhlKEGiKABKSgAAT/2qhvOJOCgR8JGifg74w8Ru1lPwDXnqw==
X-Received: by 2002:a5d:64ec:0:b0:32f:84e3:9db5 with SMTP id
 g12-20020a5d64ec000000b0032f84e39db5mr6052177wri.6.1699573274994; 
 Thu, 09 Nov 2023 15:41:14 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4845000000b0032d81837433sm705592wrs.30.2023.11.09.15.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 15:41:14 -0800 (PST)
Message-ID: <6170dbc1-e8ab-41e9-916b-ccdc2be7ac6b@redhat.com>
Date: Fri, 10 Nov 2023 00:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
From: Danilo Krummrich <dakr@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, tvrtko.ursulin@linux.intel.com
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231107041020.10035-2-ltuikov89@gmail.com>
 <70fb8d33-6b39-433f-8fa3-76883001ed68@redhat.com>
 <603b1390-3593-4056-a29b-261b7f635ff6@gmail.com>
 <da463288-5c22-4786-bc75-ec21ae9cf96c@redhat.com>
Organization: RedHat
In-Reply-To: <da463288-5c22-4786-bc75-ec21ae9cf96c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, lina@asahilina.net, mcanal@igalia.com,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 20:24, Danilo Krummrich wrote:
> On 11/9/23 07:52, Luben Tuikov wrote:
>> Hi,
>>
>> On 2023-11-07 19:41, Danilo Krummrich wrote:
>>> On 11/7/23 05:10, Luben Tuikov wrote:
>>>> Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
>>>> rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
>>>> it do just that, schedule the work item for execution.
>>>>
>>>> The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
>>>> to determine if the scheduler has an entity ready in one of its run-queues,
>>>> and in the case of the Round-Robin (RR) scheduling, the function
>>>> drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
>>>> which is ready, sets up the run-queue and completion and returns that
>>>> entity. The FIFO scheduling algorithm is unaffected.
>>>>
>>>> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
>>>> in the case of RR scheduling, that would result in drm_sched_select_entity()
>>>> having been called twice, which may result in skipping a ready entity if more
>>>> than one entity is ready. This commit fixes this by eliminating the call to
>>>> drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
>>>> in drm_sched_run_job_work().
>>>>
>>>> v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
>>>>       Add fixes-tag. (Tvrtko)
>>>>
>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>>> Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
>>>>    1 file changed, 3 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 27843e37d9b769..cd0dc3f81d05f0 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>    }
>>>>    /**
>>>> - * __drm_sched_run_job_queue - enqueue run-job work
>>>> + * drm_sched_run_job_queue - enqueue run-job work
>>>>     * @sched: scheduler instance
>>>>     */
>>>> -static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>    {
>>>>        if (!READ_ONCE(sched->pause_submit))
>>>>            queue_work(sched->submit_wq, &sched->work_run_job);
>>>> @@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>>    void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>>>>    {
>>>>        if (drm_sched_can_queue(sched))
>>>> -        __drm_sched_run_job_queue(sched);
>>>> +        drm_sched_run_job_queue(sched);
>>>>    }
>>>>    /**
>>>> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>> -/**
>>>> - * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
>>>> - * @sched: scheduler instance
>>>> - */
>>>> -static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>> -{
>>>> -    if (drm_sched_select_entity(sched))
>>>
>>> Hm, now that I rebase my patch to implement dynamic job-flow control I recognize that
>>> we probably need the peek semantics here. If we do not select an entity here, we also
>>> do not check whether the corresponding job fits on the ring.
>>>
>>> Alternatively, we simply can't do this check in drm_sched_wakeup(). The consequence would
>>> be that we don't detect that we need to wait for credits to free up before the run work is
>>> already executing and the run work selects an entity.
>>
>> So I rebased v5 on top of the latest drm-misc-next, and looked around and found out that
>> drm_sched_wakeup() is missing drm_sched_entity_is_ready(). It should look like the following,
> 
> Yeah, but that's just the consequence of re-basing it onto Tvrtko's patch.
> 
> My point is that by removing drm_sched_select_entity() from drm_sched_run_job_queue() we do not
> only loose the check whether the selected entity is ready, but also whether we have enough
> credits to actually run a new job. This can lead to queuing up work that does nothing but calling
> drm_sched_select_entity() and return.

Ok, I see it now.  We don't need to peek, we know the entity at drm_sched_wakeup().

However, the missing drm_sched_entity_is_ready() check should have been added already when
drm_sched_select_entity() was removed. Gonna send a fix for that as well.

- Danilo

> 
> By peeking the entity we could know this *before* scheduling work and hence avoid some CPU scheduler
> overhead.
> 
> However, since this patch already landed and we can fail the same way if the selected entity isn't
> ready I don't consider this to be a blocker for the credit patch, hence I will send out a v6.
> 
>>
>> void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>>               struct drm_sched_entity *entity)
>> {
>>     if (drm_sched_entity_is_ready(entity))
>>         if (drm_sched_can_queue(sched, entity))
>>             drm_sched_run_job_queue(sched);
>> }
>>
>> See the attached patch. (Currently running with base-commit and the attached patch.)

