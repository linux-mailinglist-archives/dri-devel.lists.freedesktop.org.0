Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E033CC31C28
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72AA10E61E;
	Tue,  4 Nov 2025 15:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Ox6ZsjGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630E010E289
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:12:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-429b7ba208eso3516191f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762269145; x=1762873945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1y1DlJN32QyRCZxDJhVz/vrDRHMDcrcecgIsCcUK5JU=;
 b=Ox6ZsjGjLdPWAs3UI+0dQNIzvSWMonJfPHda8RKLMLEiAgu2jHpe6FvHAouQmUZdDZ
 qX7i+xgux1a38uWw9ryYMa8Du5OEcHZLtQondrCocEgO9N6HqG612P+LAWNu6SgHbX5F
 Ch9zllT28yx9FrR0xtJURH68P76JHc5SdS8Xw55vmuyXxpozbbJcwZmOUoc4egH+Oz64
 yB+qAKzLQl3kN5GxLxSpWlxRX0A4DWByAyy8e7UFJKSqgmUnsCKLmBXFk3Bwu5dfvYEW
 SCCrMKsY+l9sz3ToxQq+2Ypsyn2v6xsKdolYq7P+AuhUzNc82DxxgSzttYG4lfBWuyPX
 8QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762269145; x=1762873945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1y1DlJN32QyRCZxDJhVz/vrDRHMDcrcecgIsCcUK5JU=;
 b=jybjHFvFBJmKZuEh7AdstgOouXDxD127YrTvTDuq73tS1pp2J7jB/abDYnPr+i8tTS
 HAGu9DIvoMzPM0yNDJROND5Od8rYkyP9vMPlTT6E9NqD6/gfF8QC/EMTyqTb6NAy/zk9
 HHab07PMVSxcuLuAeGxbVAsEO0Pyo72uzfafts6ZiUJJ7mzDIWJJHntRnx4+XYkUUGCc
 pZdtWZujDb2icZJIlWD3Dcf1oUWBYFtCdj21Cr3DPsSq6txDOK8P4R9y8mCI29K6k858
 YI8iFZfKpYMff82hklfoeqoBS0CYPJhKGzEudLeMO0Q2rtuBdUeZNpKfa06nuSChwmGF
 Xs4A==
X-Gm-Message-State: AOJu0YxJAQyYdrrBPGW4n+kekkan/tQhGNltVZeH0cWVwf1tIkVFOGM2
 lP8f4CF6jABAcVR3iXfO5xnJhaQPT+HebLxF/Ru7ZhetgWmCUiwq9wVQTs2GWQ3++NM=
X-Gm-Gg: ASbGncvD0T0ULNyW0EQMVK/+rzjdtIhSIy7PLVfHgGbTY6ng0g6/jLoGO2WKT70ay+r
 QQO93KmKQRejBOvD7OkmGmDVAaUaZoepZQU4KH3HoMrk+Pm8APtdCaX/D5LJYgyBB88V8l5bc1u
 VyLLiug6vEPxP41EtihwP3SsmSP9WG5g1iGWYZfrGUhUDeKdUm0uWuCRwOYgLoFgMYiTLpvJSMG
 y20ihGZhe8vXm0b/XEGfQioS7WL9XItUCIhZuVJ5II8KfjCP561n99N5J6eKv7lTCOGcw0qpAUW
 xe5A4750naiSl+xcUiQrzhAwhXa+bYA2PTXsYmxYkMi4Z/RKq398qsYOKHq4zycHIg7eimqR5Z2
 cwKDKhPK0lbzvdBphwilzeAZ2A5goUysdQmOCmKfdFmF69/n5MVPmxP/ZpVPzFrYrXIfPTguQLL
 pOvxtj4zljwd1MFFta
X-Google-Smtp-Source: AGHT+IEfkRRO2mzy1MOr8yNCisyPvQvEsHzrH2mDOC/E3aPmvEEHPvhEVZtir6HyJWhyzUuWjTFUsg==
X-Received: by 2002:a05:6000:714:b0:429:c711:22c5 with SMTP id
 ffacd0b85a97d-429c7112421mr10843806f8f.42.1762269144854; 
 Tue, 04 Nov 2025 07:12:24 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc19227csm5377045f8f.11.2025.11.04.07.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:12:24 -0800 (PST)
Message-ID: <21cbf337-45be-4418-b9dc-d3e2034b4962@ursulin.net>
Date: Tue, 4 Nov 2025 15:12:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/20] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-10-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-10-christian.koenig@amd.com>
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


On 31/10/2025 13:16, Christian König wrote:
> Just as proof of concept and minor cleanup.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
>   include/drm/gpu_scheduler.h             |  4 ----
>   2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 9391d6f0dc01..7a94e03341cb 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	struct dma_fence *parent;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&fence->lock, flags);
> +	dma_fence_lock(f, flags);

Moving to dma_fence_lock should either be a separate patch or squashed 
into the one which converts many other drivers. Even a separate patch 
before that previous patch would be better.

Naming wise, I however still think dma_fence_lock_irqsave would probably 
be better to stick with the same pattern everyone is so used too.

Regards,

Tvrtko

>   
>   	/* If we already have an earlier deadline, keep it: */
>   	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>   	    ktime_before(fence->deadline, deadline)) {
> -		spin_unlock_irqrestore(&fence->lock, flags);
> +		dma_fence_unlock(f, flags);
>   		return;
>   	}
>   
>   	fence->deadline = deadline;
>   	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>   
> -	spin_unlock_irqrestore(&fence->lock, flags);
> +	dma_fence_unlock(f, flags);
>   
>   	/*
>   	 * smp_load_aquire() to ensure that if we are racing another
> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>   
>   	fence->owner = owner;
>   	fence->drm_client_id = drm_client_id;
> -	spin_lock_init(&fence->lock);
>   
>   	return fence;
>   }
> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	fence->sched = entity->rq->sched;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> -		       &fence->lock, entity->fence_context, seq);
> +		       NULL, entity->fence_context, seq);
>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> -		       &fence->lock, entity->fence_context + 1, seq);
> +		       NULL, entity->fence_context + 1, seq);
>   }
>   
>   module_init(drm_sched_fence_slab_init);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..b77f24a783e3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>            * belongs to.
>            */
>   	struct drm_gpu_scheduler	*sched;
> -        /**
> -         * @lock: the lock used by the scheduled and the finished fences.
> -         */
> -	spinlock_t			lock;
>           /**
>            * @owner: job owner for debugging
>            */

