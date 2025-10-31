Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6FC24D8A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601610E2D4;
	Fri, 31 Oct 2025 11:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="MPT/xd99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B09B10E2D4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:50:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4270a3464bcso1547545f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761911418; x=1762516218;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TMW4q1yc/hq1gjF5rKdDD6wjxSe1WwAdRUZxNTv4M7U=;
 b=MPT/xd99GWnGBRnw08+wDSMkE4MuxJ/kGWwpxvaxHjvdsiYakvVzHYGHPsXhsHD3fl
 x2c1Dk0bccndKYT5UvAhZmmdcBJpoI+bcsLRmeU+vnJnFNDvV5vlbKWkDJc+rU1aigco
 ujYy2bf9CEUoATuCyfh7OWvxLhyRsH8LJtEbwJ0V40jW3bITklNufLZUgC2odvx/CVnI
 Qid9kbgWfBMVicaCeV6/CpQs7nnLHK8hFEFFnNxHCu7ZEZloGxxMNZquj8ZMEkfJAa2X
 q7BGcyLeOsAHyCRb9wVFTxveXCf7SoWhkALxXguc5rWBuvwKL345mgoU+9VLOydjTp79
 8XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761911418; x=1762516218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TMW4q1yc/hq1gjF5rKdDD6wjxSe1WwAdRUZxNTv4M7U=;
 b=Gj9BdDV6RnOE0uKy1BYiK9wuNclnZO7VH9K5HvTAQiIgZlByeUTEPugTVsVi2LMYpY
 KlAUAs/y9vt0oH/H0czdtCIfJqqTuMcO7vD6VwKOM4XghsTHEM0qcDXmgS2NdcfOzRIN
 vNtVoTikLYIScfobqrke0A0fohSWzS00zY3b2L4kFzxzS1rtmDqxLhaQt3nhvxzsFl8H
 o13rLa1HvJdQNp2vDkdJbCtMuLRCKEfiA8nIAjfHNcLZ8tvGhMBpHufVmB3Q45RNbjaZ
 25q72b2vObgvdHTAo+mdklWBMel367R4i0sKhEV4j218uqI6DE5V8gmxNyob16413KEI
 wS7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTpcy2/yIS3E3+PuAyVTMPuSEW8eNli6XjK+CeC9kBs73gPqybLWfnBh1RnEIf+NI2P59vT+55o4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCfBkQYxpl6x/85NaOhUDTWs+APYtPJXaZWkTNbRTnOLZHtOYD
 LOjnHlIbeHI+Pj/KmBoO9xDnnV4/u4op502jmIoa+M1DxRX/hAJj4Zbdh+4rgSCKegA=
X-Gm-Gg: ASbGncuhEz6EUxnpr//dnTDE2Lyc69Kg6otZaeLJb6Xcgrbwa0K0YarIlUMpILhtEx6
 sey6g5nIVXHKEvalUX9Zr7Fmng4+wG/FovGA0n+Ben31f+D1ebLqmjqHtD8gjGeKrWDdY0VKW0l
 RCtg60gS23OgL69wJcs+i+U5zNlFHMrQAAkiv1msmYKTRK8ktXSubOYLNuPXkF1lYfBboEG+224
 9lJ2/dpS/GC+QN4PMNB89b3l0snhAbh6WCwuW7DPvgwmC3IblHh0/FQoWAxRVtzHGB22H1C2e0W
 xB/BFxZhcYF2B/HMl34vGpICoDEKY8SKfbqLwleD6pEjxp+zSUisJcrSOEpiRCweCMuuJGBmtu7
 Atd0t6UOaSVjiuQ4SWn63C+UM4FPMeWrDAeNUC9zBCHp8LdG16KGhy560Z5yTkQbqGw5WJ4K7H+
 VqlJ16rEsyANVa2Q6l
X-Google-Smtp-Source: AGHT+IG7ZgRAfklgWSpAYSPzxFgTxUag6V3Fc8ctTVAuDt+DMbJ27kEs61rDXYyhICbDmi4MeLbsVQ==
X-Received: by 2002:a05:6000:1889:b0:3dc:1473:18bc with SMTP id
 ffacd0b85a97d-429bd5f72ccmr2613024f8f.0.1761911416851; 
 Fri, 31 Oct 2025 04:50:16 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a979b8sm91657215e9.10.2025.10.31.04.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 04:50:16 -0700 (PDT)
Message-ID: <411190d4-92d7-4e95-acac-b39afa438c0f@ursulin.net>
Date: Fri, 31 Oct 2025 11:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
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


On 31/10/2025 09:07, Pierre-Eric Pelloux-Prayer wrote:
> The Mesa issue referenced below pointed out a possible deadlock:
> 
> [ 1231.611031]  Possible interrupt unsafe locking scenario:
> 
> [ 1231.611033]        CPU0                    CPU1
> [ 1231.611034]        ----                    ----
> [ 1231.611035]   lock(&xa->xa_lock#17);
> [ 1231.611038]                                local_irq_disable();
> [ 1231.611039]                                lock(&fence->lock);
> [ 1231.611041]                                lock(&xa->xa_lock#17);
> [ 1231.611044]   <Interrupt>
> [ 1231.611045]     lock(&fence->lock);
> [ 1231.611047]
>                  *** DEADLOCK ***
> 
> In this example, CPU0 would be any function accessing job->dependencies
> through the xa_* functions that doesn't disable interrupts (eg:
> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
> 
> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
> callback so in an interrupt context. It will deadlock when trying to
> grab the xa_lock which is already held by CPU0.
> 
> Replacing all xa_* usage by their xa_*_irq counterparts would fix
> this issue, but Christian pointed out another issue: dma_fence_signal
> takes fence.lock and so does dma_fence_add_callback.
> 
>    dma_fence_signal() // locks f1.lock
>    -> drm_sched_entity_kill_jobs_cb()
>    -> foreach dependencies
>       -> dma_fence_add_callback() // locks f2.lock
> 
> This will deadlock if f1 and f2 share the same spinlock.

Is it possible to hit this case?

Same lock means same execution timeline, which should mean dependency 
should have been squashed in drm_sched_job_add_dependency(), no?

Or would sharing the lock but not sharing the entity->fence_context be 
considered legal? It would be surprising at least.

Also, would anyone have time to add a kunit test? ;)

Regards,

Tvrtko

> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
> 
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index c8e949f4a568..fe174a4857be 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>   }
>   EXPORT_SYMBOL(drm_sched_entity_error);
>   
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					  struct dma_fence_cb *cb);
> +
>   static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>   {
>   	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
> -
> -	drm_sched_fence_scheduled(job->s_fence, NULL);
> -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> -	WARN_ON(job->s_fence->parent);
> -	job->sched->ops->free_job(job);
> -}
> -
> -/* Signal the scheduler finished fence when the entity in question is killed. */
> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> -					  struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> -						 finish_cb);
> +	struct dma_fence *f;
>   	unsigned long index;
>   
> -	dma_fence_put(f);
> -
>   	/* Wait for all dependencies to avoid data corruptions */
>   	xa_for_each(&job->dependencies, index, f) {
>   		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
> @@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   		dma_fence_put(f);
>   	}
>   
> +	drm_sched_fence_scheduled(job->s_fence, NULL);
> +	drm_sched_fence_finished(job->s_fence, -ESRCH);
> +	WARN_ON(job->s_fence->parent);
> +	job->sched->ops->free_job(job);
> +}
> +
> +/* Signal the scheduler finished fence when the entity in question is killed. */
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					  struct dma_fence_cb *cb)
> +{
> +	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> +						 finish_cb);
> +
> +	dma_fence_put(f);
> +
>   	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>   	schedule_work(&job->work);
>   }

