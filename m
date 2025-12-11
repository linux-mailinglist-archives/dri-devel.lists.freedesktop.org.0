Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421E8CB66E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CD710E06B;
	Thu, 11 Dec 2025 16:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="pOpD6WT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4E410E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:12:22 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so531594a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 08:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765469541; x=1766074341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LzVRfSKl/WN/EHJoZomti6kxNUqFfcV9bF9+XtrouJs=;
 b=pOpD6WT9FFYg7HZ+f8IXel9WO7OkvgRwvyvtofCk58NOfNgbP+5Ya8tlzNTNBNVJdX
 Ti6KdVLRObcM0TDsCcsicH5QvlEcyTk87s7GfKtTCJwzti5yOkZpeEbj4mwlPxrqnchy
 MMctpcOVqALJYsPJIk7VEACLjl9rTPV9Mmxh6KbdAlcpw8PvWXGnGAT9MLqDDHTK7N4i
 wq648fD0Dsk7kkXLkltS1qqCwCCcvx5IKPfCLy4OzwdEKYWmHXMI41ODT3iyDXfYJpEt
 CjsFzJEbMfmVdSX2A6bLveej7gMxHc9SUZ/oahe10A+oTDxpzgg7DdBE+9vVkE9qZ6Dl
 2rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765469541; x=1766074341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LzVRfSKl/WN/EHJoZomti6kxNUqFfcV9bF9+XtrouJs=;
 b=Xiho6K6Sh3med4cmBGcEsxtoccBZomx/Un2KhIhv0O+cVRn6WxsApNkxTbOub9kQ0m
 Z7XK3hrAe3OviewtxxbS2wbThJ0eu6gfIpuFqwtGIoZAsl0Q8/Qg/l8A0q10TflaphyT
 bHe8fePaT3YDbnuIUCNunDSWGPQmZvS1K0U0IOucHIZeHGRqZgt4wxim4Wac6cKY+zC7
 ykeL7yFaJ96EHEagr+7UvadMX7ef395KUFhtkxtHpJfrW+7CNebSlrtELzes6LQFg4eX
 KonXfVouyUeh5HhFMc80XSOx96C0xb+k9onNSVSTihelsFda/1zFoMvgjfLa669X2FPZ
 r99g==
X-Gm-Message-State: AOJu0YylRKR8zpfNJsdNhtugpVixulhnUckgRLFWlY2gqM8myurvv4BI
 I+iA+6mV+E6fbByKDzbgpRenmHfpSEBqq5H0602S4R7/+njV08D7GBBh5T6DrzaoifKHwPh25Hw
 rvZ5GhV8=
X-Gm-Gg: AY/fxX4czczulrDfLPrB/o1UnD4nM97HzJgd+EpCJWg93t3QRawBeHiDwAJof4BrXDW
 Natd1bp3IN+DAiFeqzBncph353ggPAnR+g1Kv5aJgtMXmH85ruQtKtNjgWNx0lsY6V5+qcny/WN
 y4qw7dcKYHNLAuh8M//kKvok6igMoE2a0QtccH8DGL3pv1RzPRVj22h+R6ldcBwu81Ljzcj6fnF
 6vuAcjFCNvQ2KIP56lyFR1WAgDShfQCNOKnE5iheeHTMrIk/C+FYYKmbpSwo4mq+SlmTbxYyaOX
 wZIxCJZgNbvKF7emVsaq07yZGaWHVopdqFWDF3T/Ayn6y7zZUVfWgm2VbcAO/DE9dbAuyuO2IBd
 IikjL6c26ZacReaxBkapBwoeCgeFL93umIROz9IHnbq/cwduiF2dVcDoTNXpKx9ytEq5mhNjnrX
 VXBaN8MhAQfUqZgakpg7EEiwrDv2bv
X-Google-Smtp-Source: AGHT+IEzn40vyyJWZkN36uGVUKT0iwcAejXCkbp60JNiUcN1OZjPYMx4GihuDMtetBql5Fe+Al12bQ==
X-Received: by 2002:a05:6402:42c8:b0:643:1659:7584 with SMTP id
 4fb4d7f45d1cf-6496d5e577amr6111166a12.33.1765469541392; 
 Thu, 11 Dec 2025 08:12:21 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982131ed7sm2921480a12.32.2025.12.11.08.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 08:12:21 -0800 (PST)
Message-ID: <3276bb85-3bcc-4f55-95b1-4c05fe198d31@ursulin.net>
Date: Thu, 11 Dec 2025 17:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] drm/amdgpu: independence for the amdgpu_userq_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-16-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-16-christian.koenig@amd.com>
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


On 11/12/2025 13:16, Christian König wrote:
> This allows amdgpu_userq_fences to outlive the amdgpu module.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
>   3 files changed, 11 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 2dfbddcef9ab..f206297aae8b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -3155,11 +3155,7 @@ static int __init amdgpu_init(void)
>   
>   	r = amdgpu_sync_init();
>   	if (r)
> -		goto error_sync;
> -
> -	r = amdgpu_userq_fence_slab_init();
> -	if (r)
> -		goto error_fence;
> +		return r;
>   
>   	DRM_INFO("amdgpu kernel modesetting enabled.\n");
>   	amdgpu_register_atpx_handler();
> @@ -3176,12 +3172,6 @@ static int __init amdgpu_init(void)
>   
>   	/* let modprobe override vga console setting */
>   	return pci_register_driver(&amdgpu_kms_pci_driver);
> -
> -error_fence:
> -	amdgpu_sync_fini();
> -
> -error_sync:
> -	return r;
>   }
>   
>   static void __exit amdgpu_exit(void)
> @@ -3191,7 +3181,6 @@ static void __exit amdgpu_exit(void)
>   	amdgpu_unregister_atpx_handler();
>   	amdgpu_acpi_release();
>   	amdgpu_sync_fini();
> -	amdgpu_userq_fence_slab_fini();
>   	mmu_notifier_synchronize();
>   	amdgpu_xcp_drv_release();
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index eba9fb359047..bb19f72770b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -33,26 +33,6 @@
>   #include "amdgpu_userq_fence.h"
>   
>   static const struct dma_fence_ops amdgpu_userq_fence_ops;
> -static struct kmem_cache *amdgpu_userq_fence_slab;
> -
> -int amdgpu_userq_fence_slab_init(void)
> -{
> -	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
> -						    sizeof(struct amdgpu_userq_fence),
> -						    0,
> -						    SLAB_HWCACHE_ALIGN,
> -						    NULL);
> -	if (!amdgpu_userq_fence_slab)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -void amdgpu_userq_fence_slab_fini(void)
> -{
> -	rcu_barrier();

What was this rcu_barrier() for? Cargo culted or more to it?
> -	kmem_cache_destroy(amdgpu_userq_fence_slab);
> -}
>   
>   static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
>   {
> @@ -227,7 +207,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
>   
>   static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
>   {
> -	*userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
> +	*userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
This GFP_ATOMIC is suboptimal for sure being on the ioctl path. It is 
outside of the scope for this patch, but once my userq cleanup patches 
get reviewed next on my list was to try and understand this.
>   	return *userq_fence ? 0 : -ENOMEM;
>   }
>   
> @@ -243,12 +223,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>   	if (!fence_drv)
>   		return -EINVAL;
>   
> -	spin_lock_init(&userq_fence->lock);
>   	INIT_LIST_HEAD(&userq_fence->link);
>   	fence = &userq_fence->base;
>   	userq_fence->fence_drv = fence_drv;
>   
> -	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
> +	dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
>   			 fence_drv->context, seq);
>   
>   	amdgpu_userq_fence_driver_get(fence_drv);
> @@ -318,35 +297,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
>   	rptr = amdgpu_userq_fence_read(fence_drv);
>   	wptr = fence->base.seqno;
>   
> -	if (rptr >= wptr)
> +	if (rptr >= wptr) {
> +		amdgpu_userq_fence_driver_put(fence->fence_drv);

fence_drv is in a local already.

> +		fence->fence_drv = NULL;

amdgpu_userq_fence_get_timeline_name could now oops somehow?

> +
> +		kvfree(fence->fence_drv_array);
> +		fence->fence_drv_array = NULL;

Not sure if this is safe either. amdgpu_userq_fence_driver_process() 
drops its reference before it unlinks the fence from the list. Can 
someone external trigger the fence_is_signaled check, before the 
interrupt processing kicks in, which will clear fence_drv_array, and so 
amdgpu_userq_fence_driver_process() would oops?

Regards,

Tvrtko

>   		return true;
> +	}
>   
>   	return false;
>   }
>   
> -static void amdgpu_userq_fence_free(struct rcu_head *rcu)
> -{
> -	struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
> -	struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
> -	struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
> -
> -	/* Release the fence driver reference */
> -	amdgpu_userq_fence_driver_put(fence_drv);
> -
> -	kvfree(userq_fence->fence_drv_array);
> -	kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
> -}
> -
> -static void amdgpu_userq_fence_release(struct dma_fence *f)
> -{
> -	call_rcu(&f->rcu, amdgpu_userq_fence_free);
> -}
> -
>   static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>   	.get_driver_name = amdgpu_userq_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>   	.signaled = amdgpu_userq_fence_signaled,
> -	.release = amdgpu_userq_fence_release,
>   };
>   
>   /**
> @@ -560,7 +526,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>   	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
>   	if (r) {
>   		mutex_unlock(&userq_mgr->userq_mutex);
> -		kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
> +		kfree(userq_fence);
>   		goto put_gobj_write;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> index d76add2afc77..6f04782f3ea9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> @@ -31,11 +31,6 @@
>   
>   struct amdgpu_userq_fence {
>   	struct dma_fence base;
> -	/*
> -	 * This lock is necessary to synchronize the
> -	 * userqueue dma fence operations.
> -	 */
> -	spinlock_t lock;
>   	struct list_head link;
>   	unsigned long fence_drv_array_count;
>   	struct amdgpu_userq_fence_driver *fence_drv;
> @@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
>   	char timeline_name[TASK_COMM_LEN];
>   };
>   
> -int amdgpu_userq_fence_slab_init(void);
> -void amdgpu_userq_fence_slab_fini(void);
> -
>   void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
>   void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
>   int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,

