Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81260AB8C20
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97C810E902;
	Thu, 15 May 2025 16:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="IdC08KrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DB910E902
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:17:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso7972825e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747325849; x=1747930649;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i+Sz/wPLjTyMxHsvfmdAFUak8pThYrdMgG0BLTFvjMo=;
 b=IdC08KrNpeqMizf2RRaJQHh/zQwMCx3lwdcLKxWCi56I/ub75n+/z+c8pYcQpYkIX1
 O9Vi0UX1j6A/0x76oa7ta/FULdOh+ZT2UUIV8EKAJ2Weo+RvYnfCZ6qyqZXhaKBcmecT
 7CTFkwLnyTrqL/tPfq9F8pRL97PENxQpwtRrSUPN2Vr3+Misqgvf1x4GSaduL56+PCvK
 kH9ygOqdz3btiapEipTRnBbnHQVaFXWx6JnVown5YZqz4xK6zneLjfQJ5LWORIbub7G3
 6L6FL4z3dj7bdiKSShAGrGcd5Rjv610zOMcRg50NZvd4EIM/tGM53Vk6JRSjZ9asj8cp
 pSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325849; x=1747930649;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i+Sz/wPLjTyMxHsvfmdAFUak8pThYrdMgG0BLTFvjMo=;
 b=Mvwl+IS/Z+cA6p9jh23/OnD6zd8rrpvWoYc+MK9XfgDAh/p0yotQF4+X4TAaH5JGSA
 /dYAdN7OuxTnpW/GuO4H6dlO0Sqmq9t08VYYQQZH7vhiGdtrmQfr/Woz4yIk8jcdDNJH
 xUhFoVuP9MX2wQkNf1rmsNWqBzCUl91nhCeryKcP3GYH/o5q2zEbAsTAtBKsfeA5K1Id
 IkrLCO7QnZ2MMZyLrsfokcbPbAKz9mYv/766Umnc0leo6On2BC7RMSzEwnu2DKyTEo0L
 DmdGz4TGLNw+qibab1cBcsOf6519vT0HL3mxxQjv7nkFfCSkODLLMnaXyWKUu3IUESdK
 vY0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeL9vLT5QlivdgIoQU7OSjp8Fmfw6OuSTbCTdhqZ//1+gN8Y76XgixvVZiXRBgfpGPSu1X7LA7k2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycCn7bqc5mchguRh84b8/39EbYP92VJELwVyAOSg54opmBURXE
 xRJz/CPSrz99wfsV6zwaLKtcb86dh5qMG07vhvw3Qgx8Nl0melUq+6Ri9MhYVsXTM04=
X-Gm-Gg: ASbGncvKTRjC6C1IQUnjXqqWtAfBy4Wqz9qiEjeoAMuDueLEGmEo32OZOmKs0Fts/3q
 9ZV6FGS2wxWvpju2syeZlwbnPfqB1LBzEOzADXgnklilD976n4MiCBhPluLFqQx4sq26zs7WWVZ
 78ygecVIuuFTg7KM2YfU5tgw/jd1edlxSKM7n6UFs8ag08N5ySs23jt/5pM0sVvef59pVFEOpgd
 +9J2rkwkhI3vVJZ0NqKdv+AdiDP2aQK6zVUZdPdYGIyA69Y9dsw3scyTZYAZw84POCK73jcQUkv
 O0g4nwX2jttspED6+CPXK1iipYQ5owhpXQaw0YND/rR3Ftgm3rStyTy/ykgXL4nSag==
X-Google-Smtp-Source: AGHT+IFHUu/X4DlP68bFGVXWbvzDTMg+zLRptiiOX/lnXBeH+8YqwAsWA8jCo13PhMvHpzvtSWNisA==
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id
 5b1f17b1804b1-442fd627416mr1635965e9.14.1747325848599; 
 Thu, 15 May 2025 09:17:28 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39ef832sm73288165e9.40.2025.05.15.09.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:17:28 -0700 (PDT)
Message-ID: <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
Date: Thu, 15 May 2025 17:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250515150038.4615-2-christian.koenig@amd.com>
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


On 15/05/2025 16:00, Christian König wrote:
> Sometimes drivers need to be able to submit multiple jobs which depend on
> each other to different schedulers at the same time, but using
> drm_sched_job_add_dependency() can't fail any more after the first job is
> initialized.
> 
> This function preallocate memory for dependency slots so that no ENOMEM
> can come later while adding dependencies.
> 
> v2: rework implementation an documentation
> v3: rework from scratch, use separate function to add preallocated deps
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 45 ++++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h            |  4 +++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..b95e7089aa70 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> +/**
> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding dependencies
> + * @job: scheduler job where dependencies will be added
> + * @id: id for the allocated slot
> +  *
> + * Sometimes drivers need to be able to submit multiple jobs which depend on
> + * each other to different schedulers at the same time, but using
> + * drm_sched_job_add_dependency() can't fail any more after the first job is
> + * initialized.
> + *
> + * This function preallocate memory for a dependency slot so that no ENOMEM can
> + * come later while adding dependencies. The index of the preallocated slot is
> + * returned in @id.
> + *
> + * Return:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
> +					   u32 *id)
> +{
> +	return xa_alloc(&job->dependencies, id, NULL, xa_limit_32b, GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
> +
> +/**
> + * drm_sched_job_add_prealloc_dep - add dependency to preallocated slot
> + * @job: scheduler job where dependencies will be added
> + * @id: the preallocated slot index
> + * @fence: the dependency to add
> + *
> + * Consumes @fence and adds it to the preallocated slot dependency.
> + */
> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
> +				    struct dma_fence *fence)
> +{
> +	fence = xa_store(&job->dependencies, id, fence, GFP_ATOMIC);

Add assert that the passed id exists (was preallocated) and is NULL?

Also, if someone preallocates and does not consume the slot will that 
confuse the iteration in drm_sched_job_dependency()?

Regards,

Tvrtko

> +	/*
> +	 * Be defensive just in case driver messed it up and used preallocated
> +	 * slot twice.
> +	 */
> +	if (WARN_ON(fence))
> +		dma_fence_put(fence);
> +}
> +EXPORT_SYMBOL(drm_sched_job_add_prealloc_dep);
> +
>   /**
>    * drm_sched_job_add_dependency - adds the fence as a job dependency
>    * @job: scheduler job to add the dependencies to
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d860db087ea5..0286e0934317 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -632,6 +632,10 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		       u32 credits, void *owner);
>   void drm_sched_job_arm(struct drm_sched_job *job);
>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
> +					   u32 *id);
> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
> +				    struct dma_fence *fence);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence);
>   int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

