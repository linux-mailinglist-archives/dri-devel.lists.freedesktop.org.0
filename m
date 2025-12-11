Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF0CB6349
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB26610E2E6;
	Thu, 11 Dec 2025 14:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="x7zubvbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8851A10E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:35:54 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so36957166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765463753; x=1766068553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0XKCY/rLVcpC5V9eKPjnmcR+ZUh57/cG/ZoliCkg1s=;
 b=x7zubvbopltor27WWWQXIQH98VPc7785AoGHlbwnWZDaCtidtjuA4p13iKjc9wq1Xz
 A/errVY22aLtRCLb2zn0n8yXbYNYEQkpIFAVhE+gNL3LYxbTUpNVqQLTPtF9GWulFGcJ
 PQVYpZVr4STO2ozRj1Xh5wx6oYnTILDLcfHmfLy015olXvxIjC8eX6z+KiV7xSEPikmS
 mi84H1pb52EaTG+hK08nH2WUV8/gP3vZaXKbL1yEDIeBgdrW8bz/sT91apnSeJcjrguv
 mXa1HHp6fZw+oKAuhGNfNnJJkag/8/Pn8Iv4rD7kUA7eeA/oru8ZsMWW9AXHQljYMfWc
 el7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765463753; x=1766068553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0XKCY/rLVcpC5V9eKPjnmcR+ZUh57/cG/ZoliCkg1s=;
 b=sJzONLMh1Yklxzz2SMpAzIK4pTBjJulQRm3Imo1+DXY8C53Skd77JdwTG4pr2hnlGd
 af/iACHbSVELa/b6TN6qdQvJzbPU68+/lrJ6rO57gVpHg5MvOsefeIS3qZycOCc7axvQ
 RJkEoRvdAXwuvJ7p/RNNDloTTfbM2FYNz6IlbD4xlv1fj55yuNyHX7YC2lL7AznoKhYv
 qDb8TPoGtleOMY3UPauhNruGOkVRDdtgsXPMv6ieY6w97+AmTLmcGmowBO86i4j5IxCC
 5aSG7V5rPMkY4pY05xrfgGXIylxUU01qcG5iuawFiG5hVHEJru4FV6JTjF05KXzQsXn+
 WZ5g==
X-Gm-Message-State: AOJu0YyvpsSz/HbLjXzlFUOwPpVWImlz+cwuAQcfQOzJbew8LZyktHnM
 g+HHSYspB3CzW/T9XMD5J8gYeJ2HgrpMUaGwjEtsPSYSrWQE76J3oC9tTbrF4zhA8a0=
X-Gm-Gg: AY/fxX6GzBFMmXAjUeBpjp/NaPJkyHv/v+7FcMG8oxarbSoZzjsro3VxTAgm9eRQZIR
 orlWDNFXc3GKj2xkuWg7VWFBEiCx5ILC8Mrum+egw6SlTiIkg8Ft2/N31HAKTOxTuA/wp9aMuFo
 FXheLm8Y7R08v2pE3yBlpOBjnyFLUVwjbEL2Kxj12oK7rMpU5V5vEE8wLfIKBmZ+oQL3XxzAmKO
 yLqx7A5sW+DX6AvSwvqXDOjFjdfL+NlH+ra+fpyKVtOB8FbrKLkAmnlxCZFQ45aURFQfetWDE15
 QOMsjT7xargpNaR9iU1YZEcXplv3i3p7J4+vkiBCQXPJ6gyOGdZJuiEMBsyYjwSmxIZQ4YfwULG
 jV/GomzCSebfHtm/8vsGXKcxeq8dEkwf0zMolRd1NxHSDDmSoeDNpcjJlPvEbhbES60ejKLo6Qc
 gq0YeJGTksE0lwi5GuTE6LOtStCaxt
X-Google-Smtp-Source: AGHT+IGlr/JDSgbPBpYGksV23t7EQpwERrrKuIeWfqYzr9xeWickJMVCm2h4chXDtPY3XF22XcrTTg==
X-Received: by 2002:a17:907:72cb:b0:b7a:6a52:aac9 with SMTP id
 a640c23a62f3a-b7d021ce450mr271665866b.12.1765463752500; 
 Thu, 11 Dec 2025 06:35:52 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6498210fceasm2579163a12.24.2025.12.11.06.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 06:35:52 -0800 (PST)
Message-ID: <cdfd4681-8680-4c6f-832e-3b7d8f9a775c@ursulin.net>
Date: Thu, 11 Dec 2025 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] dma-buf: inline spinlock for fence protection v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-4-christian.koenig@amd.com>
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


Hi,

On 11/12/2025 13:16, Christian König wrote:
> Implement per-fence spinlocks, allowing implementations to not give an
> external spinlock to protect the fence internal statei. Instead a spinlock
> embedded into the fence structure itself is used in this case.
>
> Shared spinlocks have the problem that implementations need to guarantee
> that the lock live at least as long all fences referencing them.
>
> Using a per-fence spinlock allows completely decoupling spinlock producer
> and consumer life times, simplifying the handling in most use cases.
>
> v2: improve naming, coverage and function documentation
> v3: fix one additional locking in the selftests
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I don't think I gave r-b on this one. Not just yet at least. Maybe you 
have missed the comments I had in the previous two rounds? I will repeat 
them below.


> ---
>   drivers/dma-buf/dma-fence.c              | 69 +++++++++++++-----------
>   drivers/dma-buf/st-dma-fence.c           |  6 ++-
>   drivers/dma-buf/sw_sync.c                | 14 ++---
>   drivers/dma-buf/sync_debug.h             |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   | 12 ++---
>   drivers/gpu/drm/drm_crtc.c               |  2 +-
>   drivers/gpu/drm/drm_writeback.c          |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c    |  5 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c  |  3 +-
>   drivers/gpu/drm/qxl/qxl_release.c        |  3 +-
>   drivers/gpu/drm/scheduler/sched_fence.c  |  4 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c    |  3 +-
>   drivers/gpu/drm/xe/xe_hw_fence.c         |  3 +-
>   drivers/gpu/drm/xe/xe_sched_job.c        |  4 +-
>   include/linux/dma-fence.h                | 42 ++++++++++++++-
>   17 files changed, 117 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 481f1cd9aae2..b3c1fb990621 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
>   }
>   #endif
>   
> -
>   /**
>    * dma_fence_signal_timestamp_locked - signal completion of a fence
>    * @fence: the fence to signal
> @@ -365,7 +364,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   	struct dma_fence_cb *cur, *tmp;
>   	struct list_head cb_list;
>   
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));
>   
>   	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>   				      &fence->flags)))
> @@ -412,9 +411,9 @@ void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>   	if (WARN_ON(!fence))
>   		return;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);

For the locking wrappers I think it would be better to introduce them in 
a purely mechanical patch preceding this one. That is, just add the 
wrappers and nothing else.

>   	dma_fence_signal_timestamp_locked(fence, timestamp);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   }
>   EXPORT_SYMBOL(dma_fence_signal_timestamp);
>   
> @@ -473,9 +472,9 @@ bool dma_fence_check_and_signal(struct dma_fence *fence)
>   	unsigned long flags;
>   	bool ret;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	ret = dma_fence_check_and_signal_locked(fence);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return ret;
>   }
> @@ -501,9 +500,9 @@ void dma_fence_signal(struct dma_fence *fence)
>   
>   	tmp = dma_fence_begin_signalling();
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	dma_fence_signal_timestamp_locked(fence, ktime_get());
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	dma_fence_end_signalling(tmp);
>   }
> @@ -603,10 +602,10 @@ void dma_fence_release(struct kref *kref)
>   		 * don't leave chains dangling. We set the error flag first
>   		 * so that the callbacks know this signal is due to an error.
>   		 */
> -		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_lock_irqsave(fence, flags);
>   		fence->error = -EDEADLK;
>   		dma_fence_signal_locked(fence);
> -		spin_unlock_irqrestore(fence->lock, flags);
> +		dma_fence_unlock_irqrestore(fence, flags);
>   	}
>   
>   	ops = rcu_dereference(fence->ops);
> @@ -636,7 +635,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));
>   
>   	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>   				   &fence->flags);
> @@ -672,9 +671,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>   {
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	__dma_fence_enable_signaling(fence);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   }
>   EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>   
> @@ -714,8 +713,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   		return -ENOENT;
>   	}
>   
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (__dma_fence_enable_signaling(fence)) {
>   		cb->func = func;
>   		list_add_tail(&cb->node, &fence->cb_list);
> @@ -723,8 +721,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   		INIT_LIST_HEAD(&cb->node);
>   		ret = -ENOENT;
>   	}
> -
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return ret;
>   }
> @@ -747,9 +744,9 @@ int dma_fence_get_status(struct dma_fence *fence)
>   	unsigned long flags;
>   	int status;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	status = dma_fence_get_status_locked(fence);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return status;
>   }
> @@ -779,13 +776,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	unsigned long flags;
>   	bool ret;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock_irqsave(fence, flags);
>   	ret = !list_empty(&cb->node);
>   	if (ret)
>   		list_del_init(&cb->node);
> -
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return ret;
>   }
> @@ -824,7 +819,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   	unsigned long flags;
>   	signed long ret = timeout ? timeout : 1;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   
>   	if (dma_fence_test_signaled_flag(fence))
>   		goto out;
> @@ -848,11 +843,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   			__set_current_state(TASK_INTERRUPTIBLE);
>   		else
>   			__set_current_state(TASK_UNINTERRUPTIBLE);
> -		spin_unlock_irqrestore(fence->lock, flags);
> +		dma_fence_unlock_irqrestore(fence, flags);
>   
>   		ret = schedule_timeout(ret);
>   
> -		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_lock_irqsave(fence, flags);
>   		if (ret > 0 && intr && signal_pending(current))
>   			ret = -ERESTARTSYS;
>   	}
> @@ -862,7 +857,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   	__set_current_state(TASK_RUNNING);
>   
>   out:
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   	return ret;
>   }
>   EXPORT_SYMBOL(dma_fence_default_wait);
> @@ -1071,7 +1066,6 @@ static void
>   __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>   {
> -	BUG_ON(!lock);
>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>   
>   	kref_init(&fence->refcount);
> @@ -1082,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	 */
>   	RCU_INIT_POINTER(fence->ops, ops);
>   	INIT_LIST_HEAD(&fence->cb_list);
> -	fence->lock = lock;
>   	fence->context = context;
>   	fence->seqno = seqno;
>   	fence->flags = flags;
> +	if (lock) {
> +		fence->extern_lock = lock;
> +	} else {
> +		spin_lock_init(&fence->inline_lock);
> +		fence->flags |= BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT);
> +	}
>   	fence->error = 0;
>   
>   	trace_dma_fence_init(fence);
> @@ -1095,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>    * dma_fence_init - Initialize a custom fence.
>    * @fence: the fence to initialize
>    * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
>    * @context: the execution context this fence is run on
>    * @seqno: a linear increasing sequence number for this context
>    *
> @@ -1105,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>    *
>    * context and seqno are used for easy comparison between fences, allowing
>    * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only allowed
> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.
>    */
>   void
>   dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -1118,7 +1121,7 @@ EXPORT_SYMBOL(dma_fence_init);
>    * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>    * @fence: the fence to initialize
>    * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
>    * @context: the execution context this fence is run on
>    * @seqno: a linear increasing sequence number for this context
>    *
> @@ -1128,6 +1131,10 @@ EXPORT_SYMBOL(dma_fence_init);
>    *
>    * Context and seqno are used for easy comparison between fences, allowing
>    * to check which fence is later by simply using dma_fence_later().
> + *
> + * It is strongly discouraged to provide an external lock. This is only allowed
> + * for legacy use cases when multiple fences need to be prevented from
> + * signaling out of order.
>    */
>   void
>   dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 4dbe39c58bfb..5cb8f90a7448 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -451,8 +451,10 @@ struct race_thread {
>   
>   static void __wait_for_callbacks(struct dma_fence *f)
>   {
> -	spin_lock_irq(f->lock);
> -	spin_unlock_irq(f->lock);
> +	unsigned long flags;
> +
> +	dma_fence_lock_irqsave(f, flags);
> +	dma_fence_unlock_irqrestore(f, flags);
>   }
>   
>   static int thread_signal_callback(void *arg)
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 6f09d13be6b6..4c81a37dd682 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -156,12 +156,12 @@ static void timeline_fence_release(struct dma_fence *fence)
>   	struct sync_timeline *parent = dma_fence_parent(fence);
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!list_empty(&pt->link)) {
>   		list_del(&pt->link);
>   		rb_erase(&pt->node, &parent->pt_tree);
>   	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	sync_timeline_put(parent);
>   	dma_fence_free(fence);
> @@ -179,7 +179,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
>   	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>   		if (ktime_before(deadline, pt->deadline))
>   			pt->deadline = deadline;
> @@ -187,7 +187,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
>   		pt->deadline = deadline;
>   		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
>   	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   }
>   
>   static const struct dma_fence_ops timeline_fence_ops = {
> @@ -431,13 +431,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>   		goto put_fence;
>   	}
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>   		ret = -ENOENT;
>   		goto unlock;
>   	}
>   	data.deadline_ns = ktime_to_ns(pt->deadline);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	dma_fence_put(fence);
>   
> @@ -450,7 +450,7 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>   	return 0;
>   
>   unlock:
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   put_fence:
>   	dma_fence_put(fence);
>   
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 02af347293d0..c49324505b20 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -47,7 +47,7 @@ struct sync_timeline {
>   
>   static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>   {
> -	return container_of(fence->lock, struct sync_timeline, lock);
> +	return container_of(fence->extern_lock, struct sync_timeline, lock);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index c596b6df2e2d..60922463b415 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -474,10 +474,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
>   	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
>   		return false;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_is_signaled_locked(fence))
>   		dma_fence_set_error(fence, -ENODATA);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	while (!dma_fence_is_signaled(fence) &&
>   	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a67285118c37..9ea196e88588 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2782,8 +2782,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	dma_fence_put(vm->last_unlocked);
>   	dma_fence_wait(vm->last_tlb_flush, false);
>   	/* Make sure that all fence callbacks have completed */
> -	spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
> -	spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);
> +	dma_fence_lock_irqsave(vm->last_tlb_flush, flags);
> +	dma_fence_unlock_irqrestore(vm->last_tlb_flush, flags);
>   	dma_fence_put(vm->last_tlb_flush);
>   
>   	list_for_each_entry_safe(mapping, tmp, &vm->freed, list) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 15d757c016cb..eae105a6cf37 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -627,20 +627,20 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>    */
>   static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
>   {
> +	struct dma_fence *fence;
>   	unsigned long flags;
> -	spinlock_t *lock;
>   
>   	/*
>   	 * Workaround to stop racing between the fence signaling and handling
> -	 * the cb. The lock is static after initially setting it up, just make
> -	 * sure that the dma_fence structure isn't freed up.
> +	 * the cb.
>   	 */
>   	rcu_read_lock();
> -	lock = vm->last_tlb_flush->lock;
> +	fence = dma_fence_get_rcu(vm->last_tlb_flush);

Why does this belong here? If taking a reference fixes some race it 
needs to be a separate patch. If it doesn't then this patch shouldn't be 
adding it.

>   	rcu_read_unlock();
>   
> -	spin_lock_irqsave(lock, flags);
> -	spin_unlock_irqrestore(lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
> +	dma_fence_put(fence);
>   
>   	return atomic64_read(&vm->tlb_seq);
>   }
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index a7797d260f1e..17472915842f 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -159,7 +159,7 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
>   static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
>   {
>   	BUG_ON(fence->ops != &drm_crtc_fence_ops);
> -	return container_of(fence->lock, struct drm_crtc, fence_lock);
> +	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
>   }
>   
>   static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 95b8a2e4bda6..624a4e8b6c99 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -81,7 +81,7 @@
>    *	From userspace, this property will always read as zero.
>    */
>   
> -#define fence_to_wb_connector(x) container_of(x->lock, \
> +#define fence_to_wb_connector(x) container_of(x->extern_lock, \
>   					      struct drm_writeback_connector, \
>   					      fence_lock)
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 1527b801f013..ec4dfa3ea725 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -156,12 +156,13 @@ nouveau_name(struct drm_device *dev)
>   static inline bool
>   nouveau_cli_work_ready(struct dma_fence *fence)
>   {
> +	unsigned long flags;
>   	bool ret = true;
>   
> -	spin_lock_irq(fence->lock);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_is_signaled_locked(fence))
>   		ret = false;
> -	spin_unlock_irq(fence->lock);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	if (ret == true)
>   		dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 4a193b7d6d9e..c282c94138b2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -41,7 +41,8 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy;
>   static inline struct nouveau_fence_chan *
>   nouveau_fctx(struct nouveau_fence *fence)
>   {
> -	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
> +	return container_of(fence->base.extern_lock, struct nouveau_fence_chan,
> +			    lock);
>   }
>   
>   static bool
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 7b3c9a6016db..de05e392df88 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -62,7 +62,8 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
>   	struct qxl_device *qdev;
>   	unsigned long cur, end = jiffies + timeout;
>   
> -	qdev = container_of(fence->lock, struct qxl_device, release_lock);
> +	qdev = container_of(fence->extern_lock, struct qxl_device,
> +			    release_lock);
>   
>   	if (!wait_event_timeout(qdev->release_event,
>   				(dma_fence_is_signaled(fence) ||
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 9391d6f0dc01..08ccbde8b2f5 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -156,7 +156,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	struct dma_fence *parent;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&fence->lock, flags);
> +	dma_fence_lock_irqsave(f, flags);
>   
>   	/* If we already have an earlier deadline, keep it: */
>   	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> @@ -168,7 +168,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	fence->deadline = deadline;
>   	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>   
> -	spin_unlock_irqrestore(&fence->lock, flags);
> +	dma_fence_unlock_irqrestore(f, flags);
>   
>   	/*
>   	 * smp_load_aquire() to ensure that if we are racing another
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index 00be92da5509..621aa0aa8406 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -47,7 +47,8 @@ struct vmw_event_fence_action {
>   static struct vmw_fence_manager *
>   fman_from_fence(struct vmw_fence_obj *fence)
>   {
> -	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
> +	return container_of(fence->base.extern_lock, struct vmw_fence_manager,
> +			    lock);
>   }
>   
>   static void vmw_fence_obj_destroy(struct dma_fence *f)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index f6057456e460..3d89c660ea73 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -142,7 +142,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
>   
>   static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
>   {
> -	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
> +	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
> +			    lock);
>   }
>   
>   static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index cb674a322113..9a43ed689e65 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -189,11 +189,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>   	unsigned long irq_flags;
>   	bool signaled;
>   
> -	spin_lock_irqsave(fence->lock, irq_flags);
> +	dma_fence_lock_irqsave(fence, irq_flags);
>   	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>   	if (!signaled)
>   		dma_fence_set_error(fence, error);
> -	spin_unlock_irqrestore(fence->lock, irq_flags);
> +	dma_fence_unlock_irqrestore(fence, irq_flags);
>   
>   	return signaled;
>   }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e6d753107143..eb8851ea5fa1 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -34,7 +34,8 @@ struct seq_file;
>    * @ops: dma_fence_ops associated with this fence
>    * @rcu: used for releasing fence with kfree_rcu
>    * @cb_list: list of all callbacks to call
> - * @lock: spin_lock_irqsave used for locking
> + * @extern_lock: external spin_lock_irqsave used for locking
> + * @inline_lock: alternative internal spin_lock_irqsave used for locking
>    * @context: execution context this fence belongs to, returned by
>    *           dma_fence_context_alloc()
>    * @seqno: the sequence number of this fence inside the execution context,
> @@ -48,6 +49,7 @@ struct seq_file;
>    * atomic ops (bit_*), so taking the spinlock will not be needed most
>    * of the time.
>    *
> + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
>    * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
>    * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
>    * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
> @@ -65,7 +67,10 @@ struct seq_file;
>    * been completed, or never called at all.
>    */
>   struct dma_fence {
> -	spinlock_t *lock;
> +	union {
> +		spinlock_t *extern_lock;
> +		spinlock_t inline_lock;
> +	};
>   	const struct dma_fence_ops __rcu *ops;
>   	/*
>   	 * We clear the callback list on kref_put so that by the time we
> @@ -98,6 +103,7 @@ struct dma_fence {
>   };
>   
>   enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
>   	DMA_FENCE_FLAG_SEQNO64_BIT,
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -362,6 +368,38 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>   	} while (1);
>   }
>   
> +/**
> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
> + * @fence: the fence to get the lock from
> + *
> + * Return either the pointer to the embedded or the external spin lock.
> + */
> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> +		&fence->inline_lock : fence->extern_lock;

Is sprinkling of conditionals better than growing the struct? Probably 
yes, since branch misses are cheaper than cache misses. Unless the code 
grows significantly on some hot path and we get instruction cache misses 
instead. Who knows. But let say in the commit message we considered it 
and decided on this solution due xyz.

On a quick grep there is one arch where this grows the struct past a 
cache line anyway, but as it is PA-RISC I guess no one cares. Lets 
mention that in the commit message as well.

Regards,

Tvrtko
> +}
> +
> +/**
> + * dma_fence_lock_irqsave - irqsave lock the fence
> + * @fence: the fence to lock
> + * @flags: where to store the CPU flags.
> + *
> + * Lock the fence, preventing it from changing to the signaled state.
> + */
> +#define dma_fence_lock_irqsave(fence, flags)	\
> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
> +
> +/**
> + * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> + * @fence: the fence to unlock
> + * @flags the CPU flags to restore
> + *
> + * Unlock the fence, allowing it to change it's state to signaled again.
> + */
> +#define dma_fence_unlock_irqrestore(fence, flags)	\
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
> +
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);
>   void dma_fence_end_signalling(bool cookie);

