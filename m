Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9209B3DD77
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FE210E3DD;
	Mon,  1 Sep 2025 09:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="XVjtta+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7610E3DA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:02:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so4544375e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756717324; x=1757322124;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q8RPXBLC5ldsUqsxVQXK6DmVHhHHPKbMvb74af34BlQ=;
 b=XVjtta+0LrEF30O7r5FoaQvLIyIAia8z3soYD9XBE2MbInIfcVCOfhom1halrA24Es
 RVffkOmbmmSU9mukHwQc6t14rykIGxIvMv1A+C6F81WMBQnwjgNa9ErEwY+lAwVGyGKu
 WAc5rdX2eszqiJIgPSFEg7rOzgRoKI3v+9XaYQp7tlEdSxR4P9rhSqj5+vZUmvOn5m1H
 xTy02Zz4GYIiw5VsmoJL7o2m/iy8mNxwSCua2l8L1ouf4oSRSIDD0zPK4KYqEaZAHj+m
 mEgon97z/LlZt1lzr3IprVISOkCG2mHtGK0dD2Ine5WAEaQEJF9sN6yaBlKPVyMr9bFt
 asFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717324; x=1757322124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8RPXBLC5ldsUqsxVQXK6DmVHhHHPKbMvb74af34BlQ=;
 b=XrMVXZYKm0/MUkyDUuTIr4yqLsGaiU0wNUm8DmlDUjA5bCfEKkNsMUFrOhPLswBoUT
 HB7zAfVDC8oJN649rOd6Iwd02blN8DPLv76GezZaFcJHj6SSxgVRerkuJj0UAvwZ1QJ0
 tyih9+gS411F+Z13pUJoCa6T6ZEQYp8qtbt6lcbMg1AtUqV7k8QeUKzOKBq9H7YFvGmB
 fH1wvj0Mw3TpgD6W05Tkb02/dECzFjo4Hmoy6jzebiN5/z8j5YSW2PR5lndduFZMqO95
 OJ7dHqMKz4BuSXUrcBycYP98Q2RzUDBQ4uHuJompt+eSjscQGk/ZRXdo2tJHPioEbj68
 KByg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8LMB7yx8odDmhVtqvXBU3SR5t+FO0wrsrq7QEiRTR2HtuucPXHmNFdvuwdnTdHaHAgbVU6Cd5k2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+taa77u4WNj9Nb83UkOICLqLMiArMrkv23eMroHUlTZHijt5B
 tA8twLHk24M22Vt74kSlWyMztFPI75yyctWpmo+QbRow3TyGaTjl5QS5aP7E0m6u4cA=
X-Gm-Gg: ASbGncvVRjI7ck4PXkhZN1q3ERkKF/QhHUXOTy/VOwkYsoX/86rEym4danOB4MePYq1
 7M07LS21/2LOaZxtZMADtdKDliipw544h9CimK7i0ruGAF5bjFQ96NGy2C3/liuehohzeGNnXJ8
 dp/IuyHNiUbrYJJxScShTII1S7pRUdNHQyAzhVYCfUOiZBaFB5x2f6l+ym4TbbntkOhcz3Ax4Tn
 L+m9UMwdFd0BPt1k3/pALUYm8hn7954dmfC+7ZD5jAY2aVRWWc6vM8N+bvwGdhEtAvcRAftQi5v
 9KRjUZgBsbtnEWPeMy+X+lz373mF6uHhP9p7CfFBayyBlZGW73M1iHdh4BGDPtumNiap2yGDNi1
 M/78ft6noy37wjm+nhfROJIfBbdrfDf9L1cdAqgVNDGoLtw==
X-Google-Smtp-Source: AGHT+IFATa0P1gj9ZG+bFpTTF/PDbmIBdrStL6Ztg7iLjcDRq2nyWpFsCTfBKuh9T9aPaqNoKufiSQ==
X-Received: by 2002:a05:600c:1d06:b0:45b:6275:42cc with SMTP id
 5b1f17b1804b1-45b8557a3f7mr54828095e9.28.1756717323313; 
 Mon, 01 Sep 2025 02:02:03 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8efb280csm9195665e9.3.2025.09.01.02.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:02:02 -0700 (PDT)
Message-ID: <a05bb414-4dd1-4cbe-aa1a-beaea2d056aa@ursulin.net>
Date: Mon, 1 Sep 2025 10:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: increment share sched score on entity
 selection
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
> For hw engines that can't load balance jobs, entities are
> "statically" load balanced: on their first submit, they select
> the best scheduler based on its score.
> The score is made up of 2 parts:
> * the job queue depth (how much jobs are executing/waiting)
> * the number of entities assigned
> 
> The second part is only relevant for the static load balance:
> it's a way to consider how many entities are attached to this
> scheduler, knowing that if they ever submit jobs they will go
> to this one.
> 
> For rings that can load balance jobs freely, idle entities
> aren't a concern and shouldn't impact the scheduler's decisions.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 23 ++++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>   2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index f5d5c45ddc0d..4a078d2d98c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -206,9 +206,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   {
>   	struct drm_gpu_scheduler **scheds = NULL, *sched = NULL;
>   	struct amdgpu_device *adev = ctx->mgr->adev;
> +	bool static_load_balancing = false;
>   	struct amdgpu_ctx_entity *entity;
>   	enum drm_sched_priority drm_prio;
>   	unsigned int hw_prio, num_scheds;
> +	struct amdgpu_ring *aring;
>   	int32_t ctx_prio;
>   	int r;
>   
> @@ -236,17 +238,22 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   		r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
>   						&num_scheds, &scheds);
>   		if (r)
> -			goto cleanup_entity;
> +			goto error_free_entity;

Indeed, previously this was calling drm_sched_entity_fini() before 
drm_sched_entity_init() and it only worked because of kzalloc.

>   	}
>   
>   	/* disable load balance if the hw engine retains context among dependent jobs */
> -	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD) {
> +	static_load_balancing = hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> +				hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> +				hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> +				hw_ip == AMDGPU_HW_IP_UVD;
> +
> +	if (static_load_balancing) {
>   		sched = drm_sched_pick_best(scheds, num_scheds);
>   		scheds = &sched;
>   		num_scheds = 1;
> +		aring = container_of(sched, struct amdgpu_ring, sched);
> +		entity->sched_ring_score = aring->sched_score;
> +		atomic_inc(entity->sched_ring_score);

If we were to bike-shed we could find a way to avoid the new local 
variables. Keeping the if as is and assign to entity->sched_ring_score 
directly, and then checking for that on the cleanup path. Still works 
due kzalloc. Or if relying on kzalloc is not desired, at least bool 
static_load_balance could be replaced by re-naming the aring local as 
static_aring and using it like the name suggests.

Could also move the atomic_inc to the success path to avoid having to 
add code to error unwind.

Both cases are I think equally racy in the sense that parallel 
amdgpu_ctx_init_entity invocations can all pick the same sched. But that 
is true today AFAICT because score is not incremented until later in the 
job submit process.

I suppose one way to make the assignment more robust would be to 
"rotate" (or randomize) the sched list atomically before calling 
drm_sched_pick_best. Thoughts?

Regards,

Tvrtko

>   	}
>   
>   	r = drm_sched_entity_init(&entity->entity, drm_prio, scheds, num_scheds,
> @@ -264,6 +271,9 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   	drm_sched_entity_fini(&entity->entity);
>   
>   error_free_entity:
> +	if (static_load_balancing)
> +		atomic_dec(entity->sched_ring_score);
> +
>   	kfree(entity);
>   
>   	return r;
> @@ -514,6 +524,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>   			if (!ctx->entities[i][j])
>   				continue;
>   
> +			if (ctx->entities[i][j]->sched_ring_score)
> +				atomic_dec(ctx->entities[i][j]->sched_ring_score);
> +
>   			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 090dfe86f75b..076a0e165ce0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>   	uint32_t		hw_ip;
>   	uint64_t		sequence;
>   	struct drm_sched_entity	entity;
> +	atomic_t		*sched_ring_score;
>   	struct dma_fence	*fences[];
>   };
>   

