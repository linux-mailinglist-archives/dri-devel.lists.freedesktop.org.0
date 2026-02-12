Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJzJOfadjWmD5QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:31:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CD12BE1A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD5B10E708;
	Thu, 12 Feb 2026 09:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="mz9Xf/wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D094910E708
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:31:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so2143862f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770888690; x=1771493490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+h2ppSdNyLaJK9OBV16J7qsFGIf3feFvw9XiLauzh8=;
 b=mz9Xf/wghBn2eTO3WDM6U187ilqHc+XY/2YkGrLWcMyzig60x8NRg6a85Ygj7ixl5v
 3wzaqvvqvZKY5JNEJgCIZqNV+ZrPgoPBQcAdqjOGgSmHsBmvGE6IcRTVwdvCQqeY2PLz
 7i7Q4+mPDeLpLmgmHPVZpWPQYCzprUbo/fTxttZjvsnTQKXKtNJQIuDJKtLb5sPBrw6K
 HMo1tWY5RPNJAZLvZsMpy/+W15gz6DV4JR0ec2dFhvMBbHhftKgC2z4LZ0k6LMwoaOLu
 5I7x2pt+COpCdxsbsX2tROYTCvrDUlxWqffULeRnT5du3aJj+VRCYG+MVrai2zC8NcuE
 PFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770888690; x=1771493490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+h2ppSdNyLaJK9OBV16J7qsFGIf3feFvw9XiLauzh8=;
 b=P/gpecrfB2QraMDFrg61Qt4pqGMzz4JtX+8qQve933heC/XWlfaeCvnwEU0dWIA/Xd
 VX0KRmCqMDxIuGIBhtRYzjy19HHHqGRwzsNsBP7pxePKVe79J6LL98kS5R99Tum6net3
 x+g5AkFPk+OdCylYGff+Fu3ch39+w9TpagCqkNzi2E/AGei+miI220P3/dtltrPmYCh0
 g+OnZfPXUXAN9/hOENSpFOqkszKkrrREN4FmLAsA1vKi+CdlKU76Eiz3KZ1bV/80iJWC
 YwHEfFM+r6Gsc+WqVWysRfp1BlN2xIxkfYbY7fIgdcfkDyUn6fzdGu7fJVLuVmkKryyU
 p6+g==
X-Gm-Message-State: AOJu0YxEfWqzOrlzPNciUPwQ3RiIKoHvBx3s6j+uGChoJBjZt/5wu40s
 ctH1p1E/7n2CkOKR8So5XKxaS/qyM32ECWFZbhTe8kQEy9Qazmr/f+krrfaaFMDuGJs=
X-Gm-Gg: AZuq6aJ6jaYZT16kHyMJovEWJJLt6H2WL/U/7+66HTBOXjFrju/4zQB/qPhYnBaNKOn
 4QigQNQxeYXDgAf9PJpICM3fNA2Fslgvdh3U+8XQ4kYc7xXnxVtZ2cP3cG4OhYUjjtw9G78yzXI
 FVeW5sksB7DTnDdMbvtG00Ev7mx+Q3xGwUEUQOfE9/JR4NEDBlMNRnsw31bNGQID3d943l6oySS
 uPxG/UtE448DWYiA18427dIwJvmgjbM1PipnOCMpkRm4/8MjBsBc+zsmOPHdXqtRGz7p5mWF8Ve
 hCfz7AdwETttMkHtBgyKpa1HwYRs+ovCHKKBzHzrhhWVmSHVBM9vA355BaFxuTaK6NKtZcsRgoQ
 HlqR7H/p5oJ2sj9+MlD3+C/JWZNMPCSijzU0GkzCX4Ch1t7ybky7wDpmMJOLvhMheiMcLuDktqs
 5vZngTp+L/gkDxXpBHyJcD7WIgTXxl6tEki26V7R7Mfa/r
X-Received: by 2002:a05:6000:61e:b0:42f:b9c6:c894 with SMTP id
 ffacd0b85a97d-4378f16e494mr2696731f8f.52.1770888690240; 
 Thu, 12 Feb 2026 01:31:30 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4378e122df9sm3820329f8f.15.2026.02.12.01.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:31:29 -0800 (PST)
Message-ID: <a6e8fd22-ec2d-4994-a54d-bae07dd99a49@ursulin.net>
Date: Thu, 12 Feb 2026 09:31:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dma-buf: protected fence ops by RCU v5
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260210102232.1642-2-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org,intel.com,linaro.org];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,ursulin.net:mid,ursulin.net:dkim,amd.com:email]
X-Rspamd-Queue-Id: 580CD12BE1A
X-Rspamd-Action: no action


On 10/02/2026 10:01, Christian König wrote:
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
> 
> v2: make one the now duplicated lockdep warnings a comment instead.
> v3: Add more documentation to ->wait and ->release callback.
> v4: fix typo in documentation
> v5: rebased on drm-tip
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
>   include/linux/dma-fence.h   | 29 ++++++++++++++--
>   2 files changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e05beae6e407..de9bf18be3d4 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
>   signed long
>   dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   {
> +	const struct dma_fence_ops *ops;
>   	signed long ret;
>   
>   	if (WARN_ON(timeout < 0))
> @@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
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
> @@ -562,6 +569,7 @@ void dma_fence_release(struct kref *kref)
>   {
>   	struct dma_fence *fence =
>   		container_of(kref, struct dma_fence, refcount);
> +	const struct dma_fence_ops *ops;
>   
>   	rcu_read_lock();
>   	trace_dma_fence_destroy(fence);
> @@ -593,12 +601,12 @@ void dma_fence_release(struct kref *kref)
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
> @@ -617,6 +625,7 @@ EXPORT_SYMBOL(dma_fence_free);
>   
>   static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
>   	lockdep_assert_held(fence->lock);
> @@ -627,14 +636,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	if (dma_fence_test_signaled_flag(fence))
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
> @@ -1007,8 +1020,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
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
> @@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
> @@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
>    */
>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
>   
> +	/* RCU protection is required for safe access to returned string */
> +	ops = rcu_dereference(fence->ops);
>   	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
>   	else
>   		return (const char __rcu *)"detached-driver";
>   }
> @@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>    */
>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   {
> -	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> -			 "RCU protection is required for safe access to returned string");
> +	const struct dma_fence_ops *ops;
>   
> +	/* RCU protection is required for safe access to returned string */
> +	ops = rcu_dereference(fence->ops);
>   	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)ops->get_driver_name(fence);
>   	else
>   		return (const char __rcu *)"signaled-timeline";
>   }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9c4d25289239..6bf4feb0e01f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -67,7 +67,7 @@ struct seq_file;
>    */
>   struct dma_fence {
>   	spinlock_t *lock;
> -	const struct dma_fence_ops *ops;
> +	const struct dma_fence_ops __rcu *ops;
>   	/*
>   	 * We clear the callback list on kref_put so that by the time we
>   	 * release the fence it is unused. No one should be adding to the
> @@ -220,6 +220,10 @@ struct dma_fence_ops {
>   	 * timed out. Can also return other error values on custom implementations,
>   	 * which should be treated as if the fence is signaled. For example a hardware
>   	 * lockup could be reported like that.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
>   	 */
>   	signed long (*wait)(struct dma_fence *fence,
>   			    bool intr, signed long timeout);
> @@ -231,6 +235,13 @@ struct dma_fence_ops {
>   	 * Can be called from irq context.  This callback is optional. If it is
>   	 * NULL, then dma_fence_free() is instead called as the default
>   	 * implementation.
> +	 *
> +	 * Implementing this callback prevents the fence from detaching after
> +	 * signaling and so it is mandatory for the module providing the
> +	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
> +	 *
> +	 * If the callback is implemented the memory backing the dma_fence
> +	 * object must be freed RCU safe.
>   	 */
>   	void (*release)(struct dma_fence *fence);
>   
> @@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (dma_fence_test_signaled_flag(fence))
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
> @@ -484,13 +501,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	if (dma_fence_test_signaled_flag(fence))
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

Pending parallel discussion on the comment tweaks, the logic and 
implementation look good to me:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

