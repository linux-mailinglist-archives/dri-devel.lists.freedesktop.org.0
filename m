Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D869CC1C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 14:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39110E10E;
	Mon, 20 Feb 2023 13:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797A10E0A6;
 Mon, 20 Feb 2023 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676899920; x=1708435920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RkIqKa7lGqKZJgA1CJGMrugUNsG2Lk7ayxv30KTlMxc=;
 b=jiVPlR6o+pimbTAu3p7q0zkkVM4rAReVhcrzUup0NAoje5M5y+3zXOqO
 1TBlm1ojyUdV1j1K8MMZI6c0+HneW+HuiR4Vaj1flqLJ9Srbs4DAy1WEo
 PzFubQCPyv2wAP3bXQupgTHD7EHDRO0P09331PIR+BFVeCYJJkir+0hCx
 ksRykEm53qCsRd//siYo1tfpThayKAhlGF7AQzPgmqiW0q3z9g+ID2vlH
 ky/tx86uDSWAQf0DWrtaan4vYyAdS9TKiCIRgx/SuAKRz0vJQMimk4W5O
 jAR6/RcTYbWM/m/BVCrEp6SR+jWozMOmiJ14gqNn35dOKwo9r7z7b3njh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333761658"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="333761658"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 05:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671311071"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="671311071"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 05:31:44 -0800
Message-ID: <5e3bc68c-efb3-c4b1-386c-36694592c52a@linux.intel.com>
Date: Mon, 20 Feb 2023 13:31:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC 5/9] dma-fence: Track explicit waiters
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
 <20230216105921.624960-6-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGsOTOeMMdmpeObGqoB0t89JaVJz0OPGaw5r0-wqQp3_Bw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsOTOeMMdmpeObGqoB0t89JaVJz0OPGaw5r0-wqQp3_Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 18/02/2023 19:54, Rob Clark wrote:
> On Thu, Feb 16, 2023 at 3:00 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Track how many callers are explicity waiting on a fence to signal and
>> allow querying that via new dma_fence_wait_count() API.
>>
>> This provides infrastructure on top of which generic "waitboost" concepts
>> can be implemented by individual drivers. Wait-boosting is any reactive
>> activity, such as raising the GPU clocks, which happens while there are
>> active external waiters.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/dma-buf/dma-fence.c               | 98 +++++++++++++++++------
>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c |  1 -
>>   include/linux/dma-fence.h                 | 15 ++++
>>   3 files changed, 87 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index ea4a1f82c9bf..bdba5a8e21b1 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -344,6 +344,25 @@ void __dma_fence_might_wait(void)
>>   }
>>   #endif
>>
>> +static void incr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
>> +{
>> +       lockdep_assert_held(fence->lock);
>> +
>> +       __set_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags);
>> +       fence->waitcount++;
>> +       WARN_ON_ONCE(!fence->waitcount);
>> +}
>> +
>> +static void decr_wait_count(struct dma_fence *fence, struct dma_fence_cb *cb)
>> +{
>> +       lockdep_assert_held(fence->lock);
>> +
>> +       if (__test_and_clear_bit(DMA_FENCE_CB_FLAG_WAITCOUNT_BIT, &cb->flags)) {
>> +               WARN_ON_ONCE(!fence->waitcount);
>> +               fence->waitcount--;
>> +       }
>> +}
>> +
>>   void __dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp)
>>   {
>>          lockdep_assert_held(fence->lock);
>> @@ -363,6 +382,7 @@ __dma_fence_signal__notify(struct dma_fence *fence,
>>          lockdep_assert_held(fence->lock);
>>
>>          list_for_each_entry_safe(cur, tmp, list, node) {
>> +               decr_wait_count(fence, cur);
>>                  INIT_LIST_HEAD(&cur->node);
>>                  cur->func(fence, cur);
>>          }
>> @@ -629,11 +649,44 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>>          unsigned long flags;
>>
>>          spin_lock_irqsave(fence->lock, flags);
>> +       fence->waitcount++;
>> +       WARN_ON_ONCE(!fence->waitcount);
>>          __dma_fence_enable_signaling(fence);
>>          spin_unlock_irqrestore(fence->lock, flags);
>>   }
>>   EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>
>> +static int add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>> +                       dma_fence_func_t func, bool wait)
>> +{
>> +       unsigned long flags;
>> +       int ret = 0;
>> +
>> +       __dma_fence_cb_init(cb, func);
>> +
>> +       if (WARN_ON(!fence || !func))
>> +               return -EINVAL;
>> +
>> +       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> +               return -ENOENT;
>> +
>> +       spin_lock_irqsave(fence->lock, flags);
>> +
>> +       if (wait)
>> +               incr_wait_count(fence, cb);
>> +
>> +       if (__dma_fence_enable_signaling(fence)) {
>> +               list_add_tail(&cb->node, &fence->cb_list);
>> +       } else {
>> +               decr_wait_count(fence, cb);
>> +               ret = -ENOENT;
>> +       }
>> +
>> +       spin_unlock_irqrestore(fence->lock, flags);
>> +
>> +       return ret;
>> +}
>> +
>>   /**
>>    * dma_fence_add_callback - add a callback to be called when the fence
>>    * is signaled
>> @@ -659,31 +712,18 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>>   int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>>                             dma_fence_func_t func)
>>   {
>> -       unsigned long flags;
>> -       int ret = 0;
>> -
>> -       __dma_fence_cb_init(cb, func);
>> -
>> -       if (WARN_ON(!fence || !func))
>> -               return -EINVAL;
>> -
>> -       if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>> -               return -ENOENT;
>> -
>> -       spin_lock_irqsave(fence->lock, flags);
>> -
>> -       if (__dma_fence_enable_signaling(fence)) {
>> -               list_add_tail(&cb->node, &fence->cb_list);
>> -       } else {
>> -               ret = -ENOENT;
>> -       }
>> -
>> -       spin_unlock_irqrestore(fence->lock, flags);
>> -
>> -       return ret;
>> +       return add_callback(fence, cb, func, false);
>>   }
>>   EXPORT_SYMBOL(dma_fence_add_callback);
>>
>> +int dma_fence_add_wait_callback(struct dma_fence *fence,
>> +                               struct dma_fence_cb *cb,
>> +                               dma_fence_func_t func)
>> +{
>> +       return add_callback(fence, cb, func, true);
>> +}
>> +EXPORT_SYMBOL(dma_fence_add_wait_callback);
>> +
>>   /**
>>    * dma_fence_get_status - returns the status upon completion
>>    * @fence: the dma_fence to query
>> @@ -736,8 +776,10 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
>>          spin_lock_irqsave(fence->lock, flags);
>>
>>          ret = !list_empty(&cb->node);
>> -       if (ret)
>> +       if (ret) {
>> +               decr_wait_count(fence, cb);
>>                  list_del_init(&cb->node);
>> +       }
>>
>>          spin_unlock_irqrestore(fence->lock, flags);
>>
>> @@ -795,6 +837,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>>
>>          __dma_fence_cb_init(&cb.base, dma_fence_default_wait_cb);
>>          cb.task = current;
>> +       incr_wait_count(fence, &cb.base);
>>          list_add(&cb.base.node, &fence->cb_list);
>>
>>          while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
>> @@ -811,8 +854,10 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>>                          ret = -ERESTARTSYS;
>>          }
>>
>> -       if (!list_empty(&cb.base.node))
>> +       if (!list_empty(&cb.base.node)) {
>> +               decr_wait_count(fence, &cb.base);
>>                  list_del(&cb.base.node);
>> +       }
>>          __set_current_state(TASK_RUNNING);
>>
>>   out:
>> @@ -890,8 +935,8 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>>                  struct dma_fence *fence = fences[i];
>>
>>                  cb[i].task = current;
>> -               if (dma_fence_add_callback(fence, &cb[i].base,
>> -                                          dma_fence_default_wait_cb)) {
>> +               if (dma_fence_add_wait_callback(fence, &cb[i].base,
>> +                                               dma_fence_default_wait_cb)) {
>>                          /* This fence is already signaled */
>>                          if (idx)
>>                                  *idx = i;
>> @@ -972,6 +1017,7 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>          fence->context = context;
>>          fence->seqno = seqno;
>>          fence->flags = 0UL;
>> +       fence->waitcount = 0;
>>          fence->error = 0;
>>
>>          trace_dma_fence_init(fence);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index e971b153fda9..2693a0151a6b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -218,7 +218,6 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>>                   * until the background request retirement running every
>>                   * second or two).
>>                   */
>> -               BUILD_BUG_ON(sizeof(rq->duration) > sizeof(rq->submitq));
>>                  dma_fence_add_callback(&rq->fence, &rq->duration.cb, duration);
>>                  rq->duration.emitted = ktime_get();
>>          }
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 35933e0ae62c..2b696f9de276 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -92,6 +92,7 @@ struct dma_fence {
>>          u64 seqno;
>>          unsigned long flags;
>>          struct kref refcount;
>> +       unsigned int waitcount;
>>          int error;
>>   };
>>
>> @@ -116,6 +117,11 @@ typedef void (*dma_fence_func_t)(struct dma_fence *fence,
>>   struct dma_fence_cb {
>>          struct list_head node;
>>          dma_fence_func_t func;
>> +       unsigned long flags;
>> +};
>> +
>> +enum dma_fence_cb_flag_bits {
>> +       DMA_FENCE_CB_FLAG_WAITCOUNT_BIT,
>>   };
>>
>>   /**
>> @@ -381,6 +387,9 @@ signed long dma_fence_default_wait(struct dma_fence *fence,
>>   int dma_fence_add_callback(struct dma_fence *fence,
>>                             struct dma_fence_cb *cb,
>>                             dma_fence_func_t func);
>> +int dma_fence_add_wait_callback(struct dma_fence *fence,
>> +                               struct dma_fence_cb *cb,
>> +                               dma_fence_func_t func);
>>   bool dma_fence_remove_callback(struct dma_fence *fence,
>>                                 struct dma_fence_cb *cb);
>>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>> @@ -532,6 +541,11 @@ static inline int dma_fence_get_status_locked(struct dma_fence *fence)
>>
>>   int dma_fence_get_status(struct dma_fence *fence);
>>
>> +static inline unsigned int dma_fence_wait_count(struct dma_fence *fence)
>> +{
>> +       return fence->waitcount;
>> +}
> 
> One thing I noticed while reviving my fence-deadline series is that
> this approach is not propagating through array and chain fences

True, thanks.

So I'd need a way to "inherit" the waitcount (and so complete the 
semi-OO) in both enable_signaling callbacks. Not sure if it would be a 
problem for the dma_fence_chain_enable_signaling since it currently 
appears to be only enabling signalling on the last of the chain. Maybe 
walking all and enabling sw signalling on all but last (which has the 
callback) might work.

But anyway, I'll hold off re-spinning for this until the fate of the 
series is clear.

Regards,

Tvrtko

> 
> BR,
> -R
> 
>> +
>>   /**
>>    * dma_fence_set_error - flag an error condition on the fence
>>    * @fence: the dma_fence
>> @@ -634,6 +648,7 @@ static inline void __dma_fence_cb_init(struct dma_fence_cb *cb,
>>   {
>>          INIT_LIST_HEAD(&cb->node);
>>          cb->func = func;
>> +       cb->flags = 0;
>>   }
>>
>>   #endif /* __LINUX_DMA_FENCE_H */
>> --
>> 2.34.1
>>
