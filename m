Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LJKFc6lb2kfEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:57:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7346DF9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38010E5C1;
	Tue, 20 Jan 2026 11:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Ni4RQm1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1CD10E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 11:41:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so41241925e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 03:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768909283; x=1769514083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHmQMu2lMo0e6hxzAnLbUNTrC5kEPMmn6CnF/+RV+eI=;
 b=Ni4RQm1uJuhB1iKCYAhSupxjmePGVqS3a0gGrCHEqe1eHMQ2XQlZ6WeGBLbuevS6Eq
 VhJHniUQZEYYCfoY7Y76jrjer+ZBJJk9TozBVzDHTpDYDB1iOgsf86K6c/guGiavGxWw
 aDBM+4aAw0zGazt3+dIFFOh8uUXgUPfloKr8X11AN0sOfvMWYmauYumbx0b26nWLo4+Z
 8sPjSGmWfYZIzj7dZTdPVvmKEQ1y9IdJhjzmjlb4EMYGayDPGcL0V3dY7vBvia/m8Bok
 K925j4GCpXycZ1n28gBg2NWuEpcX/A1CPyiutwh0VJzHtsq0KEq+Dv1ijGc+WLd9Kb1E
 op5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768909283; x=1769514083;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHmQMu2lMo0e6hxzAnLbUNTrC5kEPMmn6CnF/+RV+eI=;
 b=wZkQI3D4eZJiO/h57rWpX+gzm+KArX34Z0SjuFDy1gmtI1hb9XnTyM3cjib+pUg29O
 I53EvPmCBPidI1wDU1VfAHJ62Xmc+e8W2m5fWQokNDvq85rGnKRBu+IXYXj7GpsSZ+mm
 pUuNjZpZyLjeUBbfLUB6GyY3kLChd7e1D5fczfk8msxzEOfijIyS1GTSsz71Eh0VQkZr
 yhM/SpqmT/b7tdYPxUJTeJlNImrthXWKIIPR/CCE2aCPNUJVKKAQdMsWKRKVr/hKd1+N
 vq14tvWwLErxWZFxHjJsUejAhjZJUCX/fArtdW2wGds7luV/FcNitjmZd5aQmofDaqHG
 Iang==
X-Gm-Message-State: AOJu0YyG6OWlxe38vcYK/BCWtaZYDuEDbqKWGct+h8g8AoP7BTaihJoe
 En6JPzxFc9bsdJtyqcfg4b9PNNgz7H3lBWcrHWvw9bDrqtV9MkhB7XtBDd81cTsmfis=
X-Gm-Gg: AY/fxX4Gs0onvK+uFL8SWgIiIxHCzbkx2SEbYOoUDYa/A+uxBrHj9UW4QNHf2gbPw8z
 A+IP/dC0gvn63gQbW3V7ojqIl0VAtLlGxM6PGKEBRdH3swgoRLQCnhgXOoQ3FoLAwRKLjrWXSiM
 TI9T2+VFHQsXqmqBt+G9gsfWDnIfm6Jwy9tXrsqRy1SZ/Vn58y3Ce5Is0/6krBsxi2zossxR46C
 8zRRJICna0V7fCMYQJ8wjpQpV1Y6S+czY/yEEB4qkRyhwj9ULJyYr8jIGXKOVwXEucz65dIDBna
 ZemE7TJNbzwS7RHuPmzS0Z6fSIJ2JqXs/s2k/3WWyGp1KWEestUlbnYolTfi9/CD2C8vFSw3B/6
 3e5H1ZwPxGIuoB7sHv0+w+iV5EKhU5cwSFM8nm23qSBkCPIdK2qWF4pwRuIhQdWYOOf5K2iZtwu
 Z4IPQppCHWPI6WFnGrJeqUOJVeAcmwbXAW
X-Received: by 2002:a05:600c:c174:b0:477:7f4a:44b0 with SMTP id
 5b1f17b1804b1-48041635211mr119095e9.33.1768909283187; 
 Tue, 20 Jan 2026 03:41:23 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9b4b0dsm101601545e9.1.2026.01.20.03.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 03:41:22 -0800 (PST)
Message-ID: <5de308d9-9ed9-4ae7-8b0e-1ec53282c5e9@ursulin.net>
Date: Tue, 20 Jan 2026 11:41:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dma-buf: inline spinlock for fence protection v4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260120105655.7134-1-christian.koenig@amd.com>
 <20260120105655.7134-6-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260120105655.7134-6-christian.koenig@amd.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,intel.com,linaro.org];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Queue-Id: 8DF7346DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 20/01/2026 10:54, Christian König wrote:
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

i915 needed changes too, based on the kbuild report.

Have you seen my note about the RCU sparse warning as well?

>   include/linux/dma-fence.h               | 26 +++++++++++++++++++++----
>   10 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 6db0e4089be7..36ff0e5098ee 100644
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
>   	fence->flags = flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
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
> index 06b0b2aa7953..37d4ae0faf0d 100644
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
> index 367a598833b7..b42253955a7c 100644
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
> @@ -49,6 +50,7 @@ struct seq_file;
>    * of the time.
>    *
>    * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
> + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
>    * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
>    * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
>    * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
> @@ -66,7 +68,10 @@ struct seq_file;
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
> @@ -100,6 +105,7 @@ struct dma_fence {
>   
>   enum dma_fence_flag_bits {
>   	DMA_FENCE_FLAG_INITIALIZED_BIT,
> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
>   	DMA_FENCE_FLAG_SEQNO64_BIT,
>   	DMA_FENCE_FLAG_SIGNALED_BIT,
>   	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -377,6 +383,18 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
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

You did not want to move this helper into "dma-buf: abstract fence 
locking" ? I think that would have been better to keep everything 
mechanical in one patch, and then this patch which changes behaviour 
does not touch any drivers but only dma-fence core.

Also, what about adding something like dma_fence_container_of() in that 
patch as well?

Regards,

Tvrtko

> +
>   /**
>    * dma_fence_lock_irqsave - irqsave lock the fence
>    * @fence: the fence to lock
> @@ -385,7 +403,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>    * Lock the fence, preventing it from changing to the signaled state.
>    */
>   #define dma_fence_lock_irqsave(fence, flags)	\
> -	spin_lock_irqsave(fence->lock, flags)
> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
>   
>   /**
>    * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> @@ -395,7 +413,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>    * Unlock the fence, allowing it to change it's state to signaled again.
>    */
>   #define dma_fence_unlock_irqrestore(fence, flags)	\
> -	spin_unlock_irqrestore(fence->lock, flags)
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
>   
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);

