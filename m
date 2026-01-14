Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BDD1D73A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B914710E30A;
	Wed, 14 Jan 2026 09:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="M27DPUWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7AC10E30A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:17:52 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so2498255e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768382271; x=1768987071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rMAnByezWDkpMSkcKbyxpoyvgAKGKIhXomc21Hml3qs=;
 b=M27DPUWAk7DXNjATSW+TBBRGaFpz8zsBMRyCICqjDnN3c+a7vp4qrJbM3puRg3YXLk
 O4NxG0/3AzbixjXz2ngw18dDeJxHRQopcga0UNWCBMt/5QW9Y/tBDNjxTYsp8pWjEiCB
 1/mNyi8vtAjrfa/uTQIAZ/F1+GxUfY0K1aAutPEhTGV+cZvp1mhl6f55ad/5HtdR7ifY
 fbi56+zkVhdPjIOGV8vSRkQY3Ns4FLDB/mWR5P9S1broBtaGeadrCI9RJZJ4Pjra3TeI
 hXaf5TVoAjhIb8hM2tYbDrLM1824seenAGjFevTaY3gUuYJACNbJl5RBK/qsnjOOe4K4
 +jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768382271; x=1768987071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rMAnByezWDkpMSkcKbyxpoyvgAKGKIhXomc21Hml3qs=;
 b=bJxE3T6CKKGPbbuLpULIk9e98Z8HBe1Yj59ibAU9iNc9isXvp5lTtwgzkuqLMR0vte
 7m6E31/GBc0CVF2bHqbzwLxbDllXVHMkeDbNiD77x+yOjpLZFewJhMcVyB6aPgv7yWaq
 YNyMgWOTsriGS90+F7/sOVRNo8RLEqVm2RrBHHsTNraZfF/UTbQP7DXCnndXlJysQsu7
 qfNMivpCWoLPfGDBjQ2hrsbu/8iQpH+DReKWBPP/2QL1crG/IA2WqLOpnPzC9tmMMfGL
 4SaVjDROFTMFsXhg7JY2A1xGoo6GTIToXepccARFrvPaibaQM+CbmKaN3RWrtRD7pLAD
 JuxQ==
X-Gm-Message-State: AOJu0YwTx2AGrAW+SIfa5XktIpLBWCYFAfcIJ2vwhpynL9tk9km30rDl
 fRbCWKzO5Y1Gdd5gNLDWg2brFXY5P9Tn/Ahhn1Jprcl8E138XoKO+mz6aFPU/nmI7OA=
X-Gm-Gg: AY/fxX4P/Ckv/Jr3+jIN5MGHJTAzhP5FtcoPDDqUXHxP8A9Q/8rtYkI2i3pEdYUeTu8
 c5795arqDT4UcI6v7Fm9rwk3yte8yZrvy4lsmNfwpLVWx7NI6PQQACFTVNPOwntn/LlNNezuzQj
 bsz1jMXl24A+3tsNuYrQtHHcMULCvRMc/l6AOORIB7FyBtTkM8r8KVy/cyWPm8Lqh6OloKm4kz6
 IPYPRElozu0AA5ucR1xUxTQNPrtfu2+P+kiZaREqtsdg73TPIP5fLCW3B9ZyDXrfJq7GugmON9f
 SK3LMLYuoxHEsOCIKdR96+ruyRTUyC3r7moaPBUsiMg1wPyPw4HdQUYYWXWBx/yYcNxfBj1ZT1G
 6+y4qlAYIkAOF58EpCIT4pBRzO0Cpc2RvRXGo9I2dGy9cKF71W7mfqoTS4g02DM66L3znxYajZE
 D4R5UQUXlxVqNAVqkA3fUEP9rP1Hd1xTUs
X-Received: by 2002:a05:600c:a44:b0:47b:deb9:163d with SMTP id
 5b1f17b1804b1-47ee377d1damr19134915e9.7.1768382270963; 
 Wed, 14 Jan 2026 01:17:50 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dade5sm49151231f8f.9.2026.01.14.01.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:17:50 -0800 (PST)
Message-ID: <b70366d6-18b2-49a2-b7ee-75fb37e30970@ursulin.net>
Date: Wed, 14 Jan 2026 09:17:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-6-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260113152125.47380-6-christian.koenig@amd.com>
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


On 13/01/2026 15:16, Christian König wrote:
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
> v4: separate out some changes to make the patch smaller,
>      fix one amdgpu crash found by CI systems
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c             | 25 +++++++++++++++++-------
>   drivers/dma-buf/sync_debug.h            |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
>   drivers/gpu/drm/drm_crtc.c              |  2 +-
>   drivers/gpu/drm/drm_writeback.c         |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
>   drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
>   drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
>   include/linux/dma-fence.h               | 26 +++++++++++++++++++++----
>   10 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index be072b7ba10b..b3c1fb990621 100644
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

Only now I see this helper should also be separated out into the 
previous patch. Sorry if previously I was talking aobut lock/unlock 
helpers, but that wasn't specifically excluding this one. All mechanical 
stuff is best to be separate.

Regards,

Tvrtko

P.S. You have probably noticed the kbuild report about i915 as well.

>   
>   	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>   				      &fence->flags)))
> @@ -636,7 +635,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));
>   
>   	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>   				   &fence->flags);
> @@ -1067,7 +1066,6 @@ static void
>   __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>   {
> -	BUG_ON(!lock);
>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>   
>   	kref_init(&fence->refcount);
> @@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
> @@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>    * dma_fence_init - Initialize a custom fence.
>    * @fence: the fence to initialize
>    * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
>    * @context: the execution context this fence is run on
>    * @seqno: a linear increasing sequence number for this context
>    *
> @@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
> @@ -1114,7 +1121,7 @@ EXPORT_SYMBOL(dma_fence_init);
>    * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>    * @fence: the fence to initialize
>    * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> + * @lock: optional irqsafe spinlock to use for locking this fence
>    * @context: the execution context this fence is run on
>    * @seqno: a linear increasing sequence number for this context
>    *
> @@ -1124,6 +1131,10 @@ EXPORT_SYMBOL(dma_fence_init);
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
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 15d757c016cb..c74fa1821721 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -636,7 +636,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
>   	 * sure that the dma_fence structure isn't freed up.
>   	 */
>   	rcu_read_lock();
> -	lock = vm->last_tlb_flush->lock;
> +	lock = dma_fence_spinlock(vm->last_tlb_flush);
>   	rcu_read_unlock();
>   
>   	spin_lock_irqsave(lock, flags);
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
> index b38ae0b25f3c..e2b95a97e90a 100644
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
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index a208e8841315..5f437af07b2e 100644
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
> @@ -378,6 +384,18 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
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
> +}
> +
>   /**
>    * dma_fence_lock_irqsave - irqsave lock the fence
>    * @fence: the fence to lock
> @@ -386,7 +404,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>    * Lock the fence, preventing it from changing to the signaled state.
>    */
>   #define dma_fence_lock_irqsave(fence, flags)	\
> -	spin_lock_irqsave(fence->lock, flags)
> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
>   
>   /**
>    * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> @@ -396,7 +414,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>    * Unlock the fence, allowing it to change it's state to signaled again.
>    */
>   #define dma_fence_unlock_irqrestore(fence, flags)	\
> -	spin_unlock_irqrestore(fence->lock, flags)
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
>   
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);

