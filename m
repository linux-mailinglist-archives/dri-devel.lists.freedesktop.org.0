Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255EC2591D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8119C10EB59;
	Fri, 31 Oct 2025 14:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fUO+OGfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508D110EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:29:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47710acf715so11989725e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761920944; x=1762525744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiZuOlp2DkLx8+DqNw8VcKQm2qRLceo6cVQKAj+Nrcc=;
 b=fUO+OGfAwqsw5bhj8J40gWzDZs0SKMNSDl+3zk/Xa1MaaaYzMFM+dwwBw9n7pF6bQN
 DvS5TRc6kQVngdO0u3GxnTa+JM3CNVoMYIXzdJkB5DgmPZwn2JAlBBF4NM6F6eCMOHTF
 kezvd2BrL3ADWHK+2QgLl4DONaYbny8A4dnIqYYqy90U/1LUirYy9ETvGiyWvt5AYoFh
 Un3u+oKOw04xnl7pcd3JjUiCXT3BQcHxwC8KFel5+39LamMMuXhDHzMzEP2hg/mYj9cA
 34+2q/g/6aQOMQSiwT49OWkUxvFkC3wEt0TDBM1O8Lo+M2FAF0QoxDJh6PDMYgFvJhSy
 jOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920944; x=1762525744;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iiZuOlp2DkLx8+DqNw8VcKQm2qRLceo6cVQKAj+Nrcc=;
 b=qK/ByaywW4afW1DTo8ZrwdcvjglfBwEMSt2ziKkVCyxp2UrEnh0sOQqRkfbIxLGuEx
 p3AZLHpYkXoUEp+3o+SLe1PhOxe5w5uMrC9Y7t5oSeRYwNwd+yrSUTsWLEFwKKHYc/dQ
 FJH7Nk3QZCldWl66dqJxHxOxZWa+AtwX4tjZ0+DG5jpden+yDx+hcE893lv+eGglhSXc
 Af7abFUSdt6fEDhmYiN+0zoYKe8HSoB9sYB98j/u+JSMtg60jhWMS3Cl28XHeBC2C6he
 IQjxH7EBq/hMO5mg3quVk2T62ZsQJR4KdG5HHR6ztOXFM6ZtqxtnNt2H8FSQ4h1FAvfM
 MnzA==
X-Gm-Message-State: AOJu0YwRdCP+Q68fEljCOd9rik3BzAdIeEmtIABwa5vMQ3EoAf1Ujfef
 m4sA23CGWCB2OvucFE08koRlc31/LhWB0E8T6vNTfVZRITXKKsXxtlTJGUx9xEKikAg=
X-Gm-Gg: ASbGncvb+FJptSmZ+TEexPRhQNIfP402EjLMT7tC5s/d5F7nFWJXD5Ox/YfyiT+wBkG
 +RjWVoRX9JNGVb45tRVbRBr0m/oVWdMg7n4zm08sjIBhlvo1FRco6mQfp97+iSfuxxAhA4hD4pK
 oUnpH/58oLwrNRLLcH2o4iIwGYfMLiEiebikzlb9tGyLntad0rTqaYWAJfHOuHmlla172yV2Cqt
 KmHALhMkaE4+1osEKzOUP4fx2x4QyGaT7WzofiRTytmXwKSEsZGkA/H+iBBCZc0KneBtwht9Elz
 RMIyP61UknhJo5qadiTA3zUAUWgGrDsstu5OLRrOgXkdVwJX4xQD2tvVfIvA49zqWX9xnASI2PM
 tSByp+oFRE5l6sJNQagfl65kfAIMVNdQNznQBDsXteeHkll0N5XXcm7y/5hAlrzu5zOhwGoufTq
 0eeTNmDqkgeHJ2D8H1NPsaSydAKm8=
X-Google-Smtp-Source: AGHT+IG8lAZTfk3N5bmQ6FezxiDn+RxuV0GgBI0N3k9gghkjb7BNowoTkzCd4uZBOtjRF3tTFt1ZWA==
X-Received: by 2002:a5d:5d02:0:b0:3ee:d165:2edd with SMTP id
 ffacd0b85a97d-429bd686fe2mr2825016f8f.28.1761920943501; 
 Fri, 31 Oct 2025 07:29:03 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c10ff4f6sm4774330f8f.4.2025.10.31.07.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:29:02 -0700 (PDT)
Message-ID: <0bdc899f-8c03-40fa-92ad-1b907a015c77@ursulin.net>
Date: Fri, 31 Oct 2025 14:29:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] dma-buf: protected fence ops by RCU v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-4-christian.koenig@amd.com>
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
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
> 
> v2: make one the now duplicated lockdep warnings a comment instead.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>   include/linux/dma-fence.h   | 18 ++++++++--
>   2 files changed, 62 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index b229d96f551c..ed82e8361096 100644
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

Probably a good idea to put this explanation about issue independent 
fences to struct dma_fence_ops kerneldoc. At the moment only .wait is 
documented as deprecated, so both it and .release can be expanded with 
this additional angle.

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

Have you tried the series with PREEMPT_RT enabled? I am worried about 
spin locks in any fence ops callbacks which now run with preemption 
disabled.

Regards,

Tvrtko

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
> @@ -1024,7 +1042,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
> @@ -1104,11 +1127,12 @@ EXPORT_SYMBOL(dma_fence_init64);
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
> @@ -1136,11 +1160,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
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
> index 64639e104110..38421a0c7c5b 100644
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
> @@ -418,13 +418,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
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
> @@ -448,13 +454,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
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
>   		dma_fence_signal(fence);
>   		return true;
>   	}
> +	rcu_read_unlock();
>   
>   	return false;
>   }

