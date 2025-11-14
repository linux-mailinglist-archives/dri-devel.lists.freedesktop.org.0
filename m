Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3195C5CABC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B510EA34;
	Fri, 14 Nov 2025 10:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="a7IXz6eV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6099210EA37
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:50:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso9958565e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 02:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763117434; x=1763722234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DTnv9o+1pVZiWUCe5+esGx/7+2GBOtlkuEGwLGzSeaQ=;
 b=a7IXz6eVfS+uz5VOmd91zHD0H9If7/myb++no/dITywZdt2qhG+Q3b7HkkZ4AyK54u
 716pd/Nr4WT7y10BvCOY40Mgms7HLEflS/hs6xNjdTcIgPkK01W/Ac2JPnw5hTb2lOJf
 v5Z3YSUh5E094GOq/ZQso03OjRPvdlUJf36nLjMpZGQOdaUukzj6IdBWDRgwPiQXrM9k
 qduUEzbFLgW2Z6KGCmEv3aHFJGK/fxlqiw2B/i901xqVjAvk6YSmRG4ubtZvIGLouvWX
 lEF0zecFoO5Ab90ThLbhHjahaH/3BUOUqX/oBN3RzpRW+yzsk4O3VdY/DdSc+t5yBj4Y
 Qgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763117434; x=1763722234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DTnv9o+1pVZiWUCe5+esGx/7+2GBOtlkuEGwLGzSeaQ=;
 b=EptsOMjR2+Ge6Omz9D+1ahh/0GBYEWoXZ8U4/eitS+Qvx/sBfpR/1pFXWHTjtrlsST
 uSB2BzquNAn/mzb2NtkSzoaOrOV4NYJIJTG7Im4ynLj3O0HtrrL7znsJ34r7ppBsibrh
 qRpdWEIk3Kf/XQlhMy0eYYMoIJxzJN8IODfrihH3A9UsLu6Wu9EH4Koe9Iq+MNEyEvXf
 Ya8FXfwIF8iyT0YUgaj0C+JZAgFH6aGUnFQqsNFrqcs2bJSA/5Xt2qnrDWkT59QqBKp9
 ZpF7G8c2vX0yw7wFeSdPwAWA8XZ+3BckPICrCXotS9LsT5hoq2pIcdGx98+vOHC0MpSO
 Jvtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6yn/F3AxdXY1upxZ+hEaHwWVeCElpQ2dZaOjjc3hlJQ7lIk2m1xBHEVrnWktcvfCBeN5WOh40Axw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoy/Edu37EdxFDXk0aOWBOafJw761BpxiWPCACGEc06xorscwT
 ZIPvrV8HZzmNCnp5em+LTQRvwZ1Q1vGWDN6CB50hs5VU8FyXFssRjNVP6PAMczy3pYo=
X-Gm-Gg: ASbGncsanHZGKT+N+0gtHewRHJNzyWXR5WIK8h/ZKsMiIXzn18qMa0QY2q6uhqDWEH4
 6ZoNXzuY2tWQZXxZZlCgfYxyA9ElEfofh49y+ELS5NAL+7UXFv4QvRXZj7JQaCCqyqYl0wjgFmp
 r7dgiO/arVfvq4J8twOERZZT4CZzkFRozl1Cmlr29xixLqOPvG/kfX0lVC5DVDZCij7aoeR35X7
 iUzr3fRSbAb66/z4qNe12J0OLttUiAOQQ5AjlzmYNe+eIhHwX/vBVglaKwy9ouFSQxvxF0KFdek
 yzabh8biCH7TDmPuytaWYc24DlJ2VGqbrkYVhJoFWHJqCw7mlbP8FvF6uIxanmz0jjpnMws9+37
 93tAFGhzAGHceeQWdRWPO54ov4Paw65TPjqQD6UzndvW2HGRFQbBsl1XG/orhJAyKEgr0WvbBHU
 e8FQmVeEOf7DrpIqbizKDR/w==
X-Google-Smtp-Source: AGHT+IG5gPYZ3dY6exeIfSBIGM0oezJpRpLe8wGPs8TcFBCKu6rXaQwygSuTEWL00GgIZx2RJGYq2g==
X-Received: by 2002:a05:600c:45d5:b0:477:7af8:c88b with SMTP id
 5b1f17b1804b1-4778fe57241mr24439905e9.11.1763117433322; 
 Fri, 14 Nov 2025 02:50:33 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bd27e97sm42130015e9.7.2025.11.14.02.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 02:50:32 -0800 (PST)
Message-ID: <ef0f9459-6733-4e0a-9c06-c36c02e5a93c@ursulin.net>
Date: Fri, 14 Nov 2025 10:50:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] dma-buf: protected fence ops by RCU v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251113145332.16805-3-christian.koenig@amd.com>
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
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
> 
> v2: make one the now duplicated lockdep warnings a comment instead.
> v3: Add more documentation to ->wait and ->release callback.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>   include/linux/dma-fence.h   | 29 ++++++++++++++--
>   2 files changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index b4f5c8635276..ec21be9b089a 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>   signed long
>   dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   {
> +	const struct dma_fence_ops *ops;
>   	signed long ret;
>   
>   	if (WARN_ON(timeout < 0))
> @@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   
>   	dma_fence_enable_sw_signaling(fence);
>   
> -	if (trace_dma_fence_wait_start_enabled()) {
> -		rcu_read_lock();
> -		trace_dma_fence_wait_start(fence);
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	trace_dma_fence_wait_start(fence);
> +	if (ops->wait) {
> +		/*
> +		 * Implementing the wait ops is deprecated and not supported for
> +		 * issuer independent fences, so it is ok to use the ops outside
> +		 * the RCU protected section.
> +		 */
> +		rcu_read_unlock();
> +		ret = ops->wait(fence, intr, timeout);
> +	} else {
>   		rcu_read_unlock();
> -	}
> -	if (fence->ops->wait)
> -		ret = fence->ops->wait(fence, intr, timeout);
> -	else
>   		ret = dma_fence_default_wait(fence, intr, timeout);
> +	}
>   	if (trace_dma_fence_wait_end_enabled()) {
>   		rcu_read_lock();
>   		trace_dma_fence_wait_end(fence);
> @@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
>   {
>   	struct dma_fence *fence =
>   		container_of(kref, struct dma_fence, refcount);
> +	const struct dma_fence_ops *ops;
>   
>   	rcu_read_lock();
>   	trace_dma_fence_destroy(fence);
> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>   		spin_unlock_irqrestore(fence->lock, flags);
>   	}
>   
> -	rcu_read_unlock();
> -
> -	if (fence->ops->release)
> -		fence->ops->release(fence);
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->release)
> +		ops->release(fence);
>   	else
>   		dma_fence_free(fence);
> +	rcu_read_unlock();

Risk being a spin lock in the release callback will trigger a warning on 
PREEMPT_RT. But at least the current code base does not have anything 
like that AFAICS so I guess it is okay.

>   }
>   EXPORT_SYMBOL(dma_fence_release);
>   
> @@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
>   
>   static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
>   	lockdep_assert_held(fence->lock);
> @@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return false;
>   
> -	if (!was_set && fence->ops->enable_signaling) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (!was_set && ops->enable_signaling) {
>   		trace_dma_fence_enable_signal(fence);
>   
> -		if (!fence->ops->enable_signaling(fence)) {
> +		if (!ops->enable_signaling(fence)) {
> +			rcu_read_unlock();
>   			dma_fence_signal_locked(fence);
>   			return false;
>   		}
>   	}
> +	rcu_read_unlock();
>   
>   	return true;
>   }
> @@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>    */
>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   {
> -	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> -		fence->ops->set_deadline(fence, deadline);
> +	const struct dma_fence_ops *ops;
> +
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->set_deadline && !dma_fence_is_signaled(fence))
> +		ops->set_deadline(fence, deadline);
> +	rcu_read_unlock();
>   }
>   EXPORT_SYMBOL(dma_fence_set_deadline);
>   
> @@ -1025,7 +1043,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>   
>   	kref_init(&fence->refcount);
> -	fence->ops = ops;
> +	/*
> +	 * At first glance it is counter intuitive to protect a constant
> +	 * function pointer table by RCU, but this allows modules providing the
> +	 * function table to unload by waiting for an RCU grace period.
> +	 */
> +	RCU_INIT_POINTER(fence->ops, ops);
>   	INIT_LIST_HEAD(&fence->cb_list);
>   	fence->lock = lock;
>   	fence->context = context;
> @@ -1105,11 +1128,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>    */
>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
>   
> +	/* RCU protection is required for safe access to returned string */
> +	ops = rcu_dereference(fence->ops);
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return ops->get_driver_name(fence);
>   	else
>   		return "detached-driver";
>   }
> @@ -1137,11 +1161,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>    */
>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
>   
> +	/* RCU protection is required for safe access to returned string */
> +	ops = rcu_dereference(fence->ops);
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_timeline_name(fence);
> +		return ops->get_timeline_name(fence);
>   	else
>   		return "signaled-timeline";
>   }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..77f07735f556 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -66,7 +66,7 @@ struct seq_file;
>    */
>   struct dma_fence {
>   	spinlock_t *lock;
> -	const struct dma_fence_ops *ops;
> +	const struct dma_fence_ops __rcu *ops;
>   	/*
>   	 * We clear the callback list on kref_put so that by the time we
>   	 * release the fence it is unused. No one should be adding to the
> @@ -218,6 +218,10 @@ struct dma_fence_ops {
>   	 * timed out. Can also return other error values on custom implementations,
>   	 * which should be treated as if the fence is signaled. For example a hardware
>   	 * lockup could be reported like that.
> +	 *
> +	 * Implementing this callback prevents the BO from detaching after

s/BO/fence/

> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
>   	 */
>   	signed long (*wait)(struct dma_fence *fence,
>   			    bool intr, signed long timeout);
> @@ -229,6 +233,13 @@ struct dma_fence_ops {
>   	 * Can be called from irq context.  This callback is optional. If it is
>   	 * NULL, then dma_fence_free() is instead called as the default
>   	 * implementation.
> +	 *
> +	 * Implementing this callback prevents the BO from detaching after

Ditto.

> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
> +	 *
> +	 * If the callback is implemented the memory backing the dma_fence
> +	 * object must be freed RCU safe.
>   	 */
>   	void (*release)(struct dma_fence *fence);
>   
> @@ -418,13 +429,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();
>   		dma_fence_signal_locked(fence);
>   		return true;
>   	}
> +	rcu_read_unlock();
>   
>   	return false;
>   }
> @@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   
> -	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> +	rcu_read_lock();
> +	ops = rcu_dereference(fence->ops);
> +	if (ops->signaled && ops->signaled(fence)) {
> +		rcu_read_unlock();

With the unlocked version two threads could race and one could make the 
fence->lock go away just around here, before the dma_fence_signal below 
will take it. It seems it is only safe to rcu_read_unlock before 
signaling if using the embedded fence (later in the series). Can you 
think of a downside to holding the rcu read lock to after signaling? 
that would make it safe I think.

Regards,

Tvrtko

>   		dma_fence_signal(fence);
>   		return true;
>   	}
> +	rcu_read_unlock();
>   
>   	return false;
>   }

