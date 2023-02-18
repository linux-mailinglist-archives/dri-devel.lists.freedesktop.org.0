Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ECF69BBA9
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 20:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4028610E555;
	Sat, 18 Feb 2023 19:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C83C10E555;
 Sat, 18 Feb 2023 19:54:01 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 189so1390583oih.12;
 Sat, 18 Feb 2023 11:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ueTPxYDgqRo83uBsGrr+YeT00lXKMO5/EIh1HvJpHPw=;
 b=YbEBrbL2gpuStHRcejdQKNRGRdTK0zTZqpGOB/NPhIQcNLinav4Z6ZO7WONBF86lio
 tEeTNtXNFAjST1HxLgNaZPonazzgWcGKcPZ+is1t0LwDhqgbTCHNLhytwcq01gcKv2D4
 ZsPQDkfph3DFa51No4hymFs/iBdleU/BXLFQhZfD0SlDNPCu00j9FJKvxn41FMJ/Yf+R
 OwIKXWtYdL45ueJzM2mm9rDWhcxeI1wRCpsdfvRoo5WGw+l53OCAOJB5TLTTP949YJ7z
 Chgkpzk3SQZoOW4GqOMVQEzYGTHZNIOdfSOa1gf/Y8ygqlTbHZ1cgf/riYVa1KY4dU8N
 OeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ueTPxYDgqRo83uBsGrr+YeT00lXKMO5/EIh1HvJpHPw=;
 b=4aa5054O18rkt3AalM7AJFqtNm8b2Ts/ZPVUtRwA951T4upt0KDi/DO/2/nuuU9jD/
 xlwEhPDL3trOrQfjr8nu58t6eX7cHZ/10FjASsSebdLLNEmFjKt/Y++Y72+TvW7qYZkm
 /KVY+aomVuxS1oTN6hfR5auRoDMXQ+KEh1A2T4lrjrGNA8nMJU03NpjiMif5vy3kNJdr
 qRuElvIRTGkeDLZk4w/PLxmw1kWSAE9CJTWqiSjoptAxsVXkMZGNJw7W4RsUO4zZWLE6
 67rgWuPiaWKgw821/GOvurbHkcX94r9e7pOFMJ1neMl0/et1FKpJ4sgD7WB7JZ0X5oEZ
 l+pQ==
X-Gm-Message-State: AO0yUKUFDpanYxHtW/0JeAcYc3VZiJPDSgsvwcKRPMr5nhwDJrTkXRLe
 SmeV/5X5yM2xGiEUOnx4FLhKHcBPIWoykxtkliuEhTfI
X-Google-Smtp-Source: AK7set9mwNS465hr13q/c/7ETfGoX5RLEulCqwo6etUPW1v3dz41qSYzsbNSKAwO1SCbfufafYmkE2dESLLMMyvGEk4=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr741930oiv.58.1676750040217; Sat, 18 Feb
 2023 11:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
 <20230216105921.624960-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230216105921.624960-6-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 18 Feb 2023 11:54:20 -0800
Message-ID: <CAF6AEGsOTOeMMdmpeObGqoB0t89JaVJz0OPGaw5r0-wqQp3_Bw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 5/9] dma-fence: Track explicit waiters
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 3:00 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Track how many callers are explicity waiting on a fence to signal and
> allow querying that via new dma_fence_wait_count() API.
>
> This provides infrastructure on top of which generic "waitboost" concepts
> can be implemented by individual drivers. Wait-boosting is any reactive
> activity, such as raising the GPU clocks, which happens while there are
> active external waiters.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/dma-buf/dma-fence.c               | 98 +++++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c |  1 -
>  include/linux/dma-fence.h                 | 15 ++++
>  3 files changed, 87 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ea4a1f82c9bf..bdba5a8e21b1 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -344,6 +344,25 @@ void __dma_fence_might_wait(void)
>  }
>  #endif
>
> +static void incr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +       lockdep_assert_held(fence->lock);
> +
> +       __set_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags);
> +       fence->waitcount++;
> +       WARN_ON_ONCE(!fence->waitcount);
> +}
> +
> +static void decr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +       lockdep_assert_held(fence->lock);
> +
> +       if (__test_and_clear_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags)) {
> +               WARN_ON_ONCE(!fence->waitcount);
> +               fence->waitcount--;
> +       }
> +}
> +
>  void __dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp)
>  {
>         lockdep_assert_held(fence->lock);
> @@ -363,6 +382,7 @@ __dma_fence_signal__notify(struct dma_fence *fence,
>         lockdep_assert_held(fence->lock);
>
>         list_for_each_entry_safe(cur, tmp, list, node) {
> +               decr_wait_count(fence, cur);
>                 INIT_LIST_HEAD(&cur->node);
>                 cur->func(fence, cur);
>         }
> @@ -629,11 +649,44 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>         unsigned long flags;
>
>         spin_lock_irqsave(fence->lock, flags);
> +       fence->waitcount++;
> +       WARN_ON_ONCE(!fence->waitcount);
>         __dma_fence_enable_signaling(fence);
>         spin_unlock_irqrestore(fence->lock, flags);
>  }
>  EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>
> +static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
> +                       dma_fence_func_t func, bool wait)
> +{
> +       unsigned long flags;
> +       int ret = 0;
> +
> +       __dma_fence_cb_init(cb, func);
> +
> +       if (WARN_ON(!fence || !func))
> +               return -EINVAL;
> +
> +       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               return -ENOENT;
> +
> +       spin_lock_irqsave(fence->lock, flags);
> +
> +       if (wait)
> +               incr_wait_count(fence, cb);
> +
> +       if (__dma_fence_enable_signaling(fence)) {
> +               list_add_tail(&cb->node, &fence->cb_list);
> +       } else {
> +               decr_wait_count(fence, cb);
> +               ret = -ENOENT;
> +       }
> +
> +       spin_unlock_irqrestore(fence->lock, flags);
> +
> +       return ret;
> +}
> +
>  /**
>   * dma_fence_add_callback - add a callback to be called when the fence
>   * is signaled
> @@ -659,31 +712,18 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>  int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>                            dma_fence_func_t func)
>  {
> -       unsigned long flags;
> -       int ret = 0;
> -
> -       __dma_fence_cb_init(cb, func);
> -
> -       if (WARN_ON(!fence || !func))
> -               return -EINVAL;
> -
> -       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -               return -ENOENT;
> -
> -       spin_lock_irqsave(fence->lock, flags);
> -
> -       if (__dma_fence_enable_signaling(fence)) {
> -               list_add_tail(&cb->node, &fence->cb_list);
> -       } else {
> -               ret = -ENOENT;
> -       }
> -
> -       spin_unlock_irqrestore(fence->lock, flags);
> -
> -       return ret;
> +       return add_callback(fence, cb, func, false);
>  }
>  EXPORT_SYMBOL(dma_fence_add_callback);
>
> +int dma_fence_add_wait_callback(struct dma_fence *fence,
> +                               struct dma_fence_cb *cb,
> +                               dma_fence_func_t func)
> +{
> +       return add_callback(fence, cb, func, true);
> +}
> +EXPORT_SYMBOL(dma_fence_add_wait_callback);
> +
>  /**
>   * dma_fence_get_status - returns the status upon completion
>   * @fence: the dma_fence to query
> @@ -736,8 +776,10 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
>         spin_lock_irqsave(fence->lock, flags);
>
>         ret = !list_empty(&cb->node);
> -       if (ret)
> +       if (ret) {
> +               decr_wait_count(fence, cb);
>                 list_del_init(&cb->node);
> +       }
>
>         spin_unlock_irqrestore(fence->lock, flags);
>
> @@ -795,6 +837,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>
>         __dma_fence_cb_init(&cb.base, dma_fence_default_wait_cb);
>         cb.task = current;
> +       incr_wait_count(fence, &cb.base);
>         list_add(&cb.base.node, &fence->cb_list);
>
>         while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> @@ -811,8 +854,10 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>                         ret = -ERESTARTSYS;
>         }
>
> -       if (!list_empty(&cb.base.node))
> +       if (!list_empty(&cb.base.node)) {
> +               decr_wait_count(fence, &cb.base);
>                 list_del(&cb.base.node);
> +       }
>         __set_current_state(TASK_RUNNING);
>
>  out:
> @@ -890,8 +935,8 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>                 struct dma_fence *fence = fences[i];
>
>                 cb[i].task = current;
> -               if (dma_fence_add_callback(fence, &cb[i].base,
> -                                          dma_fence_default_wait_cb)) {
> +               if (dma_fence_add_wait_callback(fence, &cb[i].base,
> +                                               dma_fence_default_wait_cb)) {
>                         /* This fence is already signaled */
>                         if (idx)
>                                 *idx = i;
> @@ -972,6 +1017,7 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>         fence->context = context;
>         fence->seqno = seqno;
>         fence->flags = 0UL;
> +       fence->waitcount = 0;
>         fence->error = 0;
>
>         trace_dma_fence_init(fence);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index e971b153fda9..2693a0151a6b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -218,7 +218,6 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>                  * until the background request retirement running every
>                  * second or two).
>                  */
> -               BUILD_BUG_ON(sizeof(rq->duration) > sizeof(rq->submitq));
>                 dma_fence_add_callback(&rq->fence, &rq->duration.cb, duration);
>                 rq->duration.emitted = ktime_get();
>         }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 35933e0ae62c..2b696f9de276 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -92,6 +92,7 @@ struct dma_fence {
>         u64 seqno;
>         unsigned long flags;
>         struct kref refcount;
> +       unsigned int waitcount;
>         int error;
>  };
>
> @@ -116,6 +117,11 @@ typedef void (*dma_fence_func_t)(struct dma_fence *fence,
>  struct dma_fence_cb {
>         struct list_head node;
>         dma_fence_func_t func;
> +       unsigned long flags;
> +};
> +
> +enum dma_fence_cb_flag_bits {
> +       DMA_FENCE_CB_FLAG_WAITCOUNT_BIT,
>  };
>
>  /**
> @@ -381,6 +387,9 @@ signed long dma_fence_default_wait(struct dma_fence *fence,
>  int dma_fence_add_callback(struct dma_fence *fence,
>                            struct dma_fence_cb *cb,
>                            dma_fence_func_t func);
> +int dma_fence_add_wait_callback(struct dma_fence *fence,
> +                               struct dma_fence_cb *cb,
> +                               dma_fence_func_t func);
>  bool dma_fence_remove_callback(struct dma_fence *fence,
>                                struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
> @@ -532,6 +541,11 @@ static inline int dma_fence_get_status_locked(struct dma_fence *fence)
>
>  int dma_fence_get_status(struct dma_fence *fence);
>
> +static inline unsigned int dma_fence_wait_count(struct dma_fence *fence)
> +{
> +       return fence->waitcount;
> +}

One thing I noticed while reviving my fence-deadline series is that
this approach is not propagating through array and chain fences

BR,
-R

> +
>  /**
>   * dma_fence_set_error - flag an error condition on the fence
>   * @fence: the dma_fence
> @@ -634,6 +648,7 @@ static inline void __dma_fence_cb_init(struct dma_fence_cb *cb,
>  {
>         INIT_LIST_HEAD(&cb->node);
>         cb->func = func;
> +       cb->flags = 0;
>  }
>
>  #endif /* __LINUX_DMA_FENCE_H */
> --
> 2.34.1
>
