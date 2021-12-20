Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B747A54D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 08:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335E10E62B;
	Mon, 20 Dec 2021 07:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D392F89FC5;
 Mon, 20 Dec 2021 07:16:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y196so6218260wmc.3;
 Sun, 19 Dec 2021 23:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l6LcvaP0PR+fXGrveI3RiYXkEcKScJHuoQ+78o25YFQ=;
 b=RYAAXuaRd7wx5dFsvwObe87eC67MbLPH3BzSyOpRHEeslMPASgIxeQ0dIN8p4FiQ/t
 1dg8nCTGjbwkpuuiqcKIdG0LLDEXysb0gpY+JmuhuF9vs6MuxKGubnU5Pz3/ZTbqu604
 Rjqf+bvunO/oYSefNuLAn5pYntsvLaMt3eY7THEaVzeQOugGGfYxDXPSZqFAVcBXVFXJ
 hcO2H5qWRwep5kFNzKG8YEI3gAWsqyAf4+YiCBr2DSjfEjtyJhMIBczT/BPHRIEETG4r
 un4e/DFZ3qeQ8lSW+u50WHdidB95G0KtcQe8KxueWe9p8WZ9wkgXEgZBlGpzwlDwoYFR
 7iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l6LcvaP0PR+fXGrveI3RiYXkEcKScJHuoQ+78o25YFQ=;
 b=8Ka18Q9EUZdvz8Mk376AFJx+d0WnFHCYBFaOf7fhJF3ABT4/I0otyHAZHJNz+fZX5f
 yLSi/AYhQythsTdKj0xcQXHJeW9qXKyH6Ydug7GpH4RVX7nkzPzxls/WNoLZtxjJtqUz
 /hdHUr1IngFDZqfJPnFZPQwc2ta1PmIIT7wexYZEtWwmajr87XDrrYZhWyA6eFLKqOvM
 USGDkh+YMQJK4ICMDj2zWhD8sWEGDlIZDZOi66TnGlps5K1cEiKr0hENiPcO9bFJN7vA
 QMQN+QOoG7CAfGrFGHoR0swmTIneuv34k2o9YgYYWPaYuA621IwATEl51+JXjllPISWo
 Zjtw==
X-Gm-Message-State: AOAM5324vIvzzND6438x9LCpDStQFqGrtkh4wPiGU3DRu0W/5/KSWNTd
 x04TrM37B/umG+kg5EhKtDO/1djP6p0=
X-Google-Smtp-Source: ABdhPJyrkKAga95992c1cYfQCxq68osMa3V6QC4/G3uMUJgfTZ58NEUw3WfcLSQwUbWfe9WiU8KNGw==
X-Received: by 2002:a7b:c008:: with SMTP id c8mr20307219wmb.55.1639984591354; 
 Sun, 19 Dec 2021 23:16:31 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id n8sm15108366wri.47.2021.12.19.23.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:16:30 -0800 (PST)
Subject: Re: [RFC 2/6] drm/amdgpu: Move scheduler init to after XGMI is ready
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d7872062-e99a-03be-c52e-d27a7022de09@gmail.com>
Date: Mon, 20 Dec 2021 08:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217222745.881637-3-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
> Before we initialize schedulers we must know which reset
> domain are we in - for single device there iis a single
> domain per device and so single wq per device. For XGMI
> the reset domain spans the entire XGMI hive and so the
> reset wq is per hive.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>   3 files changed, 51 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5f13195d23d1..b595e6d699b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>   	return r;
>   }
>   
> +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> +{
> +	long timeout;
> +	int r, i;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		/* No need to setup the GPU scheduler for rings that don't need it */
> +		if (!ring || ring->no_scheduler)
> +			continue;
> +
> +		switch (ring->funcs->type) {
> +		case AMDGPU_RING_TYPE_GFX:
> +			timeout = adev->gfx_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_COMPUTE:
> +			timeout = adev->compute_timeout;
> +			break;
> +		case AMDGPU_RING_TYPE_SDMA:
> +			timeout = adev->sdma_timeout;
> +			break;
> +		default:
> +			timeout = adev->video_timeout;
> +			break;
> +		}
> +


> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +				   ring->num_hw_submission, amdgpu_job_hang_limit,
> +				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +		if (r) {
> +			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> +				  ring->name);
> +			return r;
> +		}

Maybe better put that into amdgpu_ring.c. But not really a hard 
requirement, more a gut feeling.

> +	}
> +
> +	return 0;
> +}
> +
> +
>   /**
>    * amdgpu_device_ip_init - run init for hardware IPs
>    *
> @@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   		}
>   	}
>   
> +	r = amdgpu_device_init_schedulers(adev);
> +	if (r)
> +		goto init_failed;
> +
>   	/* Don't init kfd if whole hive need to be reset during init */
>   	if (!adev->gmc.xgmi.pending_reset)
>   		amdgpu_amdkfd_device_init(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..5527c68c51de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   				  atomic_t *sched_score)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	long timeout;
> -	int r;
>   
>   	if (!adev)
>   		return -EINVAL;
> @@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   	spin_lock_init(&ring->fence_drv.lock);
>   	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>   					 GFP_KERNEL);
> -	if (!ring->fence_drv.fences)
> -		return -ENOMEM;
>   
> -	/* No need to setup the GPU scheduler for rings that don't need it */
> -	if (ring->no_scheduler)
> -		return 0;
> +	ring->num_hw_submission = num_hw_submission;
> +	ring->sched_score = sched_score;

Probably better to set that in the caller and drop the parameters from 
the amdgpu_fence_driver_init_ring() function completely.

Christian.

>   
> -	switch (ring->funcs->type) {
> -	case AMDGPU_RING_TYPE_GFX:
> -		timeout = adev->gfx_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_COMPUTE:
> -		timeout = adev->compute_timeout;
> -		break;
> -	case AMDGPU_RING_TYPE_SDMA:
> -		timeout = adev->sdma_timeout;
> -		break;
> -	default:
> -		timeout = adev->video_timeout;
> -		break;
> -	}
> -
> -	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> -			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, NULL, sched_score, ring->name);
> -	if (r) {
> -		DRM_ERROR("Failed to create scheduler on ring %s.\n",
> -			  ring->name);
> -		return r;
> -	}
> +	if (!ring->fence_drv.fences)
> +		return -ENOMEM;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4d380e79752c..a4b8279e3011 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -253,6 +253,8 @@ struct amdgpu_ring {
>   	bool			has_compute_vm_bug;
>   	bool			no_scheduler;
>   	int			hw_prio;
> +	unsigned 		num_hw_submission;
> +	atomic_t		*sched_score;
>   };
>   
>   #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))

