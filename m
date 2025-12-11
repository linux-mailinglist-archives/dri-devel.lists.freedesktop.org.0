Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF5CB6635
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D6710E718;
	Thu, 11 Dec 2025 15:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="yParY135";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F2710E718
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:53:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6498850d3f6so357974a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765468410; x=1766073210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//kf8epaTiQVajSqLUSI6FTZoYhi+XOxmn4MslT1I1s=;
 b=yParY135f3v2hjqyYVdd4xg8/pEsOWXPff6yjlCmjWSF6m0IhBqwm+fIXPXtTM4092
 nujANVbpZ+vnl5mHppEejyupMr+j7RCBwYiM0WUreGafWUWkjGFEgNJE+Wadi/Jvyr7x
 S10KUAl5pmgVVBRp8mvZz6IEH1voMlVS/FRhffI8+v7CDBZ02dbP0r2ubTygQj7Gp7A/
 BOWlNaR48PoOJ8XOFtn+A0yhOZjOg7HhxtthnDjpA9iQym7iBw6wCaYpOx4VQkJJX6zY
 IKXkrxP7RrcwwE26z8gg5m05V3Dv4leFLu/IByEbhEoGgNhLXLLF0doiPjDrkDIxd4by
 qnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765468410; x=1766073210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//kf8epaTiQVajSqLUSI6FTZoYhi+XOxmn4MslT1I1s=;
 b=kdF+dLDyloDLXWehJl9EiGfuHEf067z0NTnzgf+EyE5BX1LUlI7fyNXxBoM4ZKhITZ
 xvF3L+CKHqfS8/yjobJA3UTHpnqsUm4BxdtdsWaHsgi80I61t5eT184ur2rrgt4gisc2
 8hbq3gWvmm57gKiWxPE8Mpis5t8SfJIaHBoAHflQBhOOwFwUwOinJr6kK7ldo8001C1C
 trDb4PzESAb63y1eDIhunC781BUbAe6FTzBwEXg9NH6XKIpy88lyMrHtY/nXpHIs+iH+
 Z+nKfRQkF+InQTeHSzT6NOVS9omrWWZqeEDwqWDmEUN2o2q6Lt1pPoFGJTZqAyvhr2pX
 NaXw==
X-Gm-Message-State: AOJu0YyjTCKj6DFxBJ31avZMwHG9UzAU7Xws2INL78F1vF/CFy+CK9Jx
 5lAL/hDmH6USBmFNFhMCd8SWHg9AUTT4mtvKsn6eKgoXPShIKyhgB1RiGGM1TX0d4D0=
X-Gm-Gg: AY/fxX7lqcaJRihPyqeXjwxqvKdw6HlXH6W8qs4Bn9Qxl5OTYg5ODeu3MVX6bGucakU
 O6lJkTQ5EScpplYYulfc028kuZNKrM+Pl2X/i+HD10MCEhI41fDn/kk2UUwhX05qkQ37D5SqdQY
 jZ4Xvb8xHYP0OE/QpCFcDmvv1cwKfhzp++EJ8JA6RIJq0SADmTOfJKMktPPxwtFeT8eOkV/HoZO
 4JznwOBd8riQyrb2SpoDPSsZDDG7dqOFC5Nlohk5uxc+ap2wke8bftxh7to1Z1kEQWwFfUb9K9p
 xFPvrjH4qQO7ens0iVR9vNg/ZXYrZqoAX2kwYGaUen/ZVzQ/A+1MrJkwJBV5trdVwSBSc1+viIx
 2bqKNRlOKIxoIO2UmpU5H/Am9U6awVAlh5RPlezAIt2XOV+cjAtKQz6DUeYFRLLwwclffqtU9sY
 zd9e79ieVXhS0qoYIsw4FDVJACJSIl
X-Google-Smtp-Source: AGHT+IH7Zd5E84BS+SQiw7Gqd8PtDloJOM0ZHPRsWbUyKSkrntowtEEA4JshbEvBCrsPplDcIOlK+Q==
X-Received: by 2002:a17:907:96a6:b0:b7a:1bdd:3313 with SMTP id
 a640c23a62f3a-b7ce85a250amr677917766b.64.1765468410463; 
 Thu, 11 Dec 2025 07:53:30 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa29f51esm304755266b.14.2025.12.11.07.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:53:30 -0800 (PST)
Message-ID: <e426d618-3d6e-4d93-b6fd-4c5e1b11d9f2@ursulin.net>
Date: Thu, 11 Dec 2025 16:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] drm/amdgpu: independence for the amdgpu_fence! v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-12-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-12-christian.koenig@amd.com>
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
> This allows amdgpu_fences to outlive the amdgpu module.
>
> v2: use dma_fence_get_rcu_safe to be NULL safe here.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 63 +++++++----------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 -
>   2 files changed, 20 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index c7843e336310..c636347801c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -112,8 +112,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
>   	af->ring = ring;
>   
>   	seq = ++ring->fence_drv.sync_seq;
> -	dma_fence_init(fence, &amdgpu_fence_ops,
> -		       &ring->fence_drv.lock,
> +	dma_fence_init(fence, &amdgpu_fence_ops, NULL,
>   		       adev->fence_context + ring->idx, seq);
>   
>   	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> @@ -467,7 +466,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring)
>   	timer_setup(&ring->fence_drv.fallback_timer, amdgpu_fence_fallback, 0);
>   
>   	ring->fence_drv.num_fences_mask = ring->num_hw_submission * 2 - 1;
> -	spin_lock_init(&ring->fence_drv.lock);
>   	ring->fence_drv.fences = kcalloc(ring->num_hw_submission * 2, sizeof(void *),
>   					 GFP_KERNEL);
>   
> @@ -654,16 +652,20 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
>   	struct amdgpu_fence_driver *drv = &ring->fence_drv;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&drv->lock, flags);
> +	rcu_read_lock();
>   	for (unsigned int i = 0; i <= drv->num_fences_mask; ++i) {
>   		struct dma_fence *fence;
>   
> -		fence = rcu_dereference_protected(drv->fences[i],
> -						  lockdep_is_held(&drv->lock));
> -		if (fence && !dma_fence_is_signaled_locked(fence))
> +		fence = dma_fence_get_rcu(drv->fences[i]);

dma_fence_get_rcu is not safe against passing a NULL fence in, while the 
existing code makes it look like drv->fence[] slot can contain NULL at 
this point?

amdgpu_fence_process() is the place which can NULL the slots? Irq 
context? Why is that safe with no reference held from clearing the slot 
to operating on the fence?

> +		if (!fence)
> +			continue;
> +
> +		dma_fence_lock_irqsave(fence, flags);
> +		if (!dma_fence_is_signaled_locked(fence))
>   			dma_fence_set_error(fence, error);
> +		dma_fence_unlock_irqrestore(fence, flags);
>   	}
> -	spin_unlock_irqrestore(&drv->lock, flags);
> +	rcu_read_unlock();
>   }
>   
>   /**
> @@ -714,16 +716,19 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>   	seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
>   
>   	/* mark all fences from the guilty context with an error */
> -	spin_lock_irqsave(&ring->fence_drv.lock, flags);
> +	rcu_read_lock();
>   	do {
>   		last_seq++;
>   		last_seq &= ring->fence_drv.num_fences_mask;
>   
>   		ptr = &ring->fence_drv.fences[last_seq];
> -		rcu_read_lock();
> -		unprocessed = rcu_dereference(*ptr);
> +		unprocessed = dma_fence_get_rcu_safe(ptr);

Similar concern like the above.

Regards,

Tvrtko
> +
> +		if (!unprocessed)
> +			continue;
>   
> -		if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
> +		dma_fence_lock_irqsave(unprocessed, flags);
> +		if (dma_fence_is_signaled_locked(unprocessed)) {
>   			fence = container_of(unprocessed, struct amdgpu_fence, base);
>   
>   			if (fence == af)
> @@ -731,9 +736,10 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>   			else if (fence->context == af->context)
>   				dma_fence_set_error(&fence->base, -ECANCELED);
>   		}
> -		rcu_read_unlock();
> +		dma_fence_unlock_irqrestore(unprocessed, flags);
> +		dma_fence_put(unprocessed);
>   	} while (last_seq != seq);
> -	spin_unlock_irqrestore(&ring->fence_drv.lock, flags);
> +	rcu_read_unlock();
>   	/* signal the guilty fence */
>   	amdgpu_fence_write(ring, (u32)af->base.seqno);
>   	amdgpu_fence_process(ring);
> @@ -823,39 +829,10 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>   	return true;
>   }
>   
> -/**
> - * amdgpu_fence_free - free up the fence memory
> - *
> - * @rcu: RCU callback head
> - *
> - * Free up the fence memory after the RCU grace period.
> - */
> -static void amdgpu_fence_free(struct rcu_head *rcu)
> -{
> -	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> -
> -	/* free fence_slab if it's separated fence*/
> -	kfree(to_amdgpu_fence(f));
> -}
> -
> -/**
> - * amdgpu_fence_release - callback that fence can be freed
> - *
> - * @f: fence
> - *
> - * This function is called when the reference count becomes zero.
> - * It just RCU schedules freeing up the fence.
> - */
> -static void amdgpu_fence_release(struct dma_fence *f)
> -{
> -	call_rcu(&f->rcu, amdgpu_fence_free);
> -}
> -
>   static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.get_driver_name = amdgpu_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_fence_get_timeline_name,
>   	.enable_signaling = amdgpu_fence_enable_signaling,
> -	.release = amdgpu_fence_release,
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 7a27c6c4bb44..9cbf63454004 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -125,7 +125,6 @@ struct amdgpu_fence_driver {
>   	unsigned			irq_type;
>   	struct timer_list		fallback_timer;
>   	unsigned			num_fences_mask;
> -	spinlock_t			lock;
>   	struct dma_fence		**fences;
>   };
>   

