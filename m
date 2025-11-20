Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01DC749F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695010E29F;
	Thu, 20 Nov 2025 14:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="JMRLHMwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD39510E29F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:42:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so171052866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763649733; x=1764254533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=khBR6eSNf/QmSuc9SlSCWE0udmdJHBDaQ2oPnmmJpDQ=;
 b=JMRLHMwcfCQxHdj/D1BEPG7re+H8EM5wSK6mWYILa7HrdP0CgUmAdJJKTrO6SJpEv9
 kSlJeFmYAZBkeXHYrC51bpjzO7zD6ozvQv07IYuE4FPFxQq1//T1TouPtloG8tI06GFv
 04n75TC0hLgrifEjKft/NZclv1oEWMZnZKIszxQ1BBiIYiBVUCCn1vvBnjPpFoOo8Wsg
 l/7JH5rJT/jqQy38GvP1oSUpmTGz3rXApWF56JaJvg7KkC/TrG1d8DGvsc3FslSxaDbp
 iF5u/O8TNdxC1QU1xakzWxMxf/xY9us2buWtTmjOkb1Hgkzvv/TKENNqnneJ7fhIQ6ca
 WiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763649733; x=1764254533;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khBR6eSNf/QmSuc9SlSCWE0udmdJHBDaQ2oPnmmJpDQ=;
 b=rtD26sM675Y0492JqmlwO0CHR6GSTUDGh+9UOZ0W0wX0I5LBzoLpYSTjIWhT67bACQ
 mIAUCuESTRIJpaUfIackQ8EX2hb2eDRHHeYKXe6hlW6CG4/RW6G9qjlgbXci82AKZVBL
 UfwiJz9MRuegW3YuH0DF81qJ2uTf/9y7es/dq9yEtDAagHs4stR6ERwOI7Y1G2+bBhM8
 /qiLGexvXrcsE8AcwS4hxVN29TlRAOqD6cYjuMwQQujXk1btc3E2AI2FH/e1Z+ImMg/o
 6eXQNxe8zxyTMF1T4T4giySYxQi/n/a6nTJjvrlkoVZHib13h2COivvUZq5HFOnVSzo3
 P76w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/k44IU9N6vHvFv9FVGIojaVTuevrKOAqgGyEHPtScsf0IcjSh1RLgtWOCj+wF8RKxjzG0scek1hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLqbL0AByaEPrSN0uxdemjSoGJKU+CEY2djri68S6mau1IuksC
 v1rx/Uu0Q+GeKkAQhjCe8FVjqYjKY3jxYfNri40PRZ7fDA2nshfuxdbnQM1U9UGME1Y=
X-Gm-Gg: ASbGncum/6CLcX2NnXr4sd4mwAV5CXh8z/S7O1QKIu2oDe4xqMCCQSHT6QnhyIuBjYs
 bdcehxVnB++acoQBaSxdS8h5DkGGkCvGO58i0SjMpnB8ZDmlHhn1hfVkCLN+Td2LSY14hFssUOf
 XJgyRNLKA0OD9HyZFikPcjRtPiOlMqOZHnx+iuAnVkda1+Ep6sq7UW/dCqa9wqvmtAdXVDQzb/4
 4Kph0UOGJmsCG4Bf4Im8cdSJ2CrWspo+dN6wTUYC5gpY0qGH+SsR/cU585bTjhQnN+0nn5UMRUZ
 Yoqic0QjW+gYPN4pJ2CSfEv13Rhev8Vy1EwHNd7GLBRhvj8sIXJMoOUSrXGo9ouZcxVQbHCgCDj
 rZfzvBUgttaVTQLS2ZhM1NA3cJlcsEaS17oH0JeE4o37BjaV2IVMTebyHNIDs1laFpacrpESocf
 u6dq3sG48m6ufzEb717jwB+xj6VHGX9GTfGUB44IVfDqg=
X-Google-Smtp-Source: AGHT+IGSe52x3WwscN4pPeTMXlXGa4bP0yNsZ98l/WZuYWDCuxOODGDX3LXA9XEr/HIuIeHAYgSlVw==
X-Received: by 2002:a17:907:7293:b0:b73:5acd:465e with SMTP id
 a640c23a62f3a-b7655485cc4mr313158366b.11.1763649732423; 
 Thu, 20 Nov 2025 06:42:12 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ff3987sm222731066b.48.2025.11.20.06.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:42:11 -0800 (PST)
Message-ID: <a58fd870-30ca-44e0-b9f8-df5a34889fce@ursulin.net>
Date: Thu, 20 Nov 2025 14:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/18] drm/amdgpu: independence for the amdgpu_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-11-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251113145332.16805-11-christian.koenig@amd.com>
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


On 13/11/2025 14:51, Christian König wrote:
> This should allow amdgpu_fences to outlive the amdgpu module.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 63 +++++++----------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 -
>   2 files changed, 20 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index c7843e336310..990fcbbe90a0 100644
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
> +		unprocessed = dma_fence_get_rcu(*ptr);

Both here and in amdgpu_fence_driver_set_error, the old/existing code 
makes me think the fetched fence pointer can be NULL (the "if 
(unprocesses && .. below"). If true then it needs to be checked before 
dma_fence_get_rcu and after.

Although I am a bit confused with the RCU usage here in general. For 
example struct amdgpu_fence_driver->fences is not rcu annotated so what 
is actually guarded by RCU? Pointers in the array or fence objects 
pointer to by those pointers?

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

