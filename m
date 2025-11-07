Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1E7C3FA7D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A6E10EA87;
	Fri,  7 Nov 2025 11:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="yCl9Z74S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786510EA8F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:09:43 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47755de027eso4269645e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762513782; x=1763118582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hucu1UhZREYkJANtmE9hQ/FaRpYzftzgN7wW8361yT4=;
 b=yCl9Z74SLpnfmEdf4/FP0Sv8PjzGXrf1qflp/I/N8V5AG5OMexupTcs6UUc79m4D7y
 P6NvfFwcH8auC7aRAlvCqrmmDwvn3hSZnbu3ZrxPWFYYIESB6t/nXbU1Cw0vWZ1Qfai3
 VfJphaBK3flqUPar9oN8r5Y3lywZ+wsHc23F9a5etfrxmnGyKpKftukVd4QWduB2h+fZ
 BQtlLhnaUWEQLqxAfFg/XV8cfpwEwCmZqrINJcfB5R1DIWE/LBiD7Vwjl097qgmeb5UH
 4T0fQRfODYeBRQiuGoFl9JXV3VkIG3Sa20F0PR0Nf+sIkFPvih5DN1aL+/pbeUdbGpS/
 Xl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762513782; x=1763118582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hucu1UhZREYkJANtmE9hQ/FaRpYzftzgN7wW8361yT4=;
 b=dkEzYYFiDEGr6jJ6IZsMtYJvCSFHhTP3Ve+C6ezE2BTSLrv5mBEOmGPAELfD7sDJVy
 8jlr77MvOIAKpzIJ11BFJ7iopFPI29/BUa+cyDhHoOPpiJzk+/zYn+NRqdYH+V7vm+08
 PgRU1JRwfWTEMc6urJemn5K5ed7rIMEMRZt1JdcjVQ808vPl6XPd06+Q5gc2TZW4c7cr
 uJtovKv77o7tQcAQX/5o6b5xaflcpdq93HstNW9Oum3iNA7ursWuz6Omh/X873LRPqTa
 KVJ/iJu8Ys5L++JC84HRV+kFhHNePJK34MVva0xnvzMRu2cZxsVPzmEMxAT0NoZaxlB6
 8ARg==
X-Gm-Message-State: AOJu0YwIAi/WILHV8RA2Xf+ct8dTpRmhgVCs0df+NdG3GiGtSNuNw2XD
 DUNslE8FW4YxQd69w/ApoxlvDLIm/OBr7HAQwb9F3FvEiPqKhVer2bU3yuejtOA0kjmJHBkkePK
 YMhKN
X-Gm-Gg: ASbGncsCe39MkAObcVSWx+jtM+iZRJKOJgGrQ1LEde92WNydMy5x1NekQ8AZfkFcdLw
 Gv1hAjLa1iZZg1cVFXuULlOeVhd8UcNy3YIOxU1LCdCcWB+bUnaifiuoNVqxk/1pTonGBkxnQ2E
 Jmq7DlP5GTxrltp6fo4RsYCmAzq7ffApBFKh2pUCHJ1iH0D9deuuHhtCH9T25oPXgLGCPYsjGhh
 XclOu+RfLXUxc7inwPOJ86isSN46/eAbYyjsIVMl2MTd2s/cvx79ilP/ht7Adp0gGW3R0Qooqi9
 axFXZijzN49IjbehrP77pJtmiZTPhsUGut1j6qvXGR9I0xpGeUv1miqxYYDBnSUFKYwm2iPdJLb
 i1ZVwvrh7wOyEBAstTGUGf6JKuWf2SWIe9Ns7sfIPddYpBNOdGDLbWlr/i5rjfpLRcWZYf+pa0W
 81DOwBm8UToR5OR8vzsTu9QLUGhTE=
X-Google-Smtp-Source: AGHT+IGghjP1J1/jVtKwY64jaxXE+ADd+Tl/GDBehY3RxN3iNDvUoBZ7EnOvmfsJo/j+jZT6GNPRCA==
X-Received: by 2002:a05:600c:4f8e:b0:477:1af2:f40a with SMTP id
 5b1f17b1804b1-4776bc9bd43mr19306985e9.17.1762513781985; 
 Fri, 07 Nov 2025 03:09:41 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce20ff3sm155700715e9.10.2025.11.07.03.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 03:09:41 -0800 (PST)
Message-ID: <54466a0e-1019-4fd1-b8a8-1b9448698b67@ursulin.net>
Date: Fri, 7 Nov 2025 11:09:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] dma-buf: protected fence ops by RCU v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-4-christian.koenig@amd.com>
 <0bdc899f-8c03-40fa-92ad-1b907a015c77@ursulin.net>
 <59fb14d3-63b6-4943-be80-dfad7f59028c@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <59fb14d3-63b6-4943-be80-dfad7f59028c@amd.com>
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


On 06/11/2025 13:14, Christian König wrote:
> On 10/31/25 15:29, Tvrtko Ursulin wrote:
>> On 31/10/2025 13:16, Christian König wrote:
>>> At first glance it is counter intuitive to protect a constant function
>>> pointer table by RCU, but this allows modules providing the function
>>> table to unload by waiting for an RCU grace period.
>>>
>>> v2: make one the now duplicated lockdep warnings a comment instead.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>>>    include/linux/dma-fence.h   | 18 ++++++++--
>>>    2 files changed, 62 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index b229d96f551c..ed82e8361096 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>>>    signed long
>>>    dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>>        signed long ret;
>>>          if (WARN_ON(timeout < 0))
>>> @@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>>          dma_fence_enable_sw_signaling(fence);
>>>    -    if (trace_dma_fence_wait_start_enabled()) {
>>> -        rcu_read_lock();
>>> -        trace_dma_fence_wait_start(fence);
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    trace_dma_fence_wait_start(fence);
>>> +    if (ops->wait) {
>>> +        /*
>>> +         * Implementing the wait ops is deprecated and not supported for
>>> +         * issuer independent fences, so it is ok to use the ops outside
>>> +         * the RCU protected section.
>>> +         */
>>
>> Probably a good idea to put this explanation about issue independent fences to struct dma_fence_ops kerneldoc. At the moment only .wait is documented as deprecated, so both it and .release can be expanded with this additional angle.
> 
> Done, but I'm not sure if my documentation is sufficient. You should probably take a look at the next version.

Will do.

>>> +        rcu_read_unlock();
>>> +        ret = ops->wait(fence, intr, timeout);
>>> +    } else {
>>>            rcu_read_unlock();
>>> -    }
>>> -    if (fence->ops->wait)
>>> -        ret = fence->ops->wait(fence, intr, timeout);
>>> -    else
>>>            ret = dma_fence_default_wait(fence, intr, timeout);
>>> +    }
>>>        if (trace_dma_fence_wait_end_enabled()) {
>>>            rcu_read_lock();
>>>            trace_dma_fence_wait_end(fence);
>>> @@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
>>>    {
>>>        struct dma_fence *fence =
>>>            container_of(kref, struct dma_fence, refcount);
>>> +    const struct dma_fence_ops *ops;
>>>          rcu_read_lock();
>>>        trace_dma_fence_destroy(fence);
>>> @@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
>>>            spin_unlock_irqrestore(fence->lock, flags);
>>>        }
>>>    -    rcu_read_unlock();
>>> -
>>> -    if (fence->ops->release)
>>> -        fence->ops->release(fence);
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->release)
>>> +        ops->release(fence);
>>>        else
>>>            dma_fence_free(fence);
>>> +    rcu_read_unlock();
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_release);
>>>    @@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
>>>      static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>>        bool was_set;
>>>          lockdep_assert_held(fence->lock);
>>> @@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return false;
>>>    -    if (!was_set && fence->ops->enable_signaling) {
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (!was_set && ops->enable_signaling) {
>>>            trace_dma_fence_enable_signal(fence);
>>>    -        if (!fence->ops->enable_signaling(fence)) {
>>> +        if (!ops->enable_signaling(fence)) {
>>
>> Have you tried the series with PREEMPT_RT enabled?
> 
> No, that is not something we usually test with.
> 
>> I am worried about spin locks in any fence ops callbacks which now run with preemption disabled.
> 
> Hui? Why would spin_locks be problematic here?

They become sleeping locks and IIRC there's a might_sleep equivalent in 
there somewhere which fires when inside the preempt_disable section.

Regards,

Tvrtko

>>> +            rcu_read_unlock();
>>>                dma_fence_signal_locked(fence);
>>>                return false;
>>>            }
>>>        }
>>> +    rcu_read_unlock();
>>>          return true;
>>>    }
>>> @@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>     */
>>>    void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>    {
>>> -    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
>>> -        fence->ops->set_deadline(fence, deadline);
>>> +    const struct dma_fence_ops *ops;
>>> +
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->set_deadline && !dma_fence_is_signaled(fence))
>>> +        ops->set_deadline(fence, deadline);
>>> +    rcu_read_unlock();
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_set_deadline);
>>>    @@ -1024,7 +1042,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>        BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>>          kref_init(&fence->refcount);
>>> -    fence->ops = ops;
>>> +    /*
>>> +     * At first glance it is counter intuitive to protect a constant
>>> +     * function pointer table by RCU, but this allows modules providing the
>>> +     * function table to unload by waiting for an RCU grace period.
>>> +     */
>>> +    RCU_INIT_POINTER(fence->ops, ops);
>>>        INIT_LIST_HEAD(&fence->cb_list);
>>>        fence->lock = lock;
>>>        fence->context = context;
>>> @@ -1104,11 +1127,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>>>     */
>>>    const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>>    {
>>> -    RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>> -             "RCU protection is required for safe access to returned string");
>>> +    const struct dma_fence_ops *ops;
>>>    +    /* RCU protection is required for safe access to returned string */
>>> +    ops = rcu_dereference(fence->ops);
>>>        if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> -        return fence->ops->get_driver_name(fence);
>>> +        return ops->get_driver_name(fence);
>>>        else
>>>            return "detached-driver";
>>>    }
>>> @@ -1136,11 +1160,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>>>     */
>>>    const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>>    {
>>> -    RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>>> -             "RCU protection is required for safe access to returned string");
>>> +    const struct dma_fence_ops *ops;
>>>    +    /* RCU protection is required for safe access to returned string */
>>> +    ops = rcu_dereference(fence->ops);
>>>        if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>> -        return fence->ops->get_timeline_name(fence);
>>> +        return ops->get_timeline_name(fence);
>>>        else
>>>            return "signaled-timeline";
>>>    }
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 64639e104110..38421a0c7c5b 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -66,7 +66,7 @@ struct seq_file;
>>>     */
>>>    struct dma_fence {
>>>        spinlock_t *lock;
>>> -    const struct dma_fence_ops *ops;
>>> +    const struct dma_fence_ops __rcu *ops;
>>>        /*
>>>         * We clear the callback list on kref_put so that by the time we
>>>         * release the fence it is unused. No one should be adding to the
>>> @@ -418,13 +418,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>>>    static inline bool
>>>    dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>> +
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return true;
>>>    -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->signaled && ops->signaled(fence)) {
>>> +        rcu_read_unlock();
>>>            dma_fence_signal_locked(fence);
>>>            return true;
>>>        }
>>> +    rcu_read_unlock();
>>>          return false;
>>>    }
>>> @@ -448,13 +454,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>    static inline bool
>>>    dma_fence_is_signaled(struct dma_fence *fence)
>>>    {
>>> +    const struct dma_fence_ops *ops;
>>> +
>>>        if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>            return true;
>>>    -    if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>> +    rcu_read_lock();
>>> +    ops = rcu_dereference(fence->ops);
>>> +    if (ops->signaled && ops->signaled(fence)) {
>>> +        rcu_read_unlock();
>>>            dma_fence_signal(fence);
>>>            return true;
>>>        }
>>> +    rcu_read_unlock();
>>>          return false;
>>>    }
>>
> 

