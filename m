Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCh9MVGYjWkt5AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:07:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C612BBB1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349A210E12E;
	Thu, 12 Feb 2026 09:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="n/8Mv9Tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A13810E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:07:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4362507f0feso4026986f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770887243; x=1771492043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1zmW+nWtny8rTi79B6oc/MgMQTw0kDITFIhDKjYNi8=;
 b=n/8Mv9TcpD20jrLtythVjTwtGnBT7Yv1FHZb6iS4B8O/ebu8mCrtw6TpcHUGdfoucl
 81ycnduZ3gmJqWNVzTxwEGEuYru0nCXB7KfE9upBD3jRqOQnLZsxOcxWhzqEyfVuM/92
 IuBm1trm7oyWJjumIHf+sM5mN5RCJsat+IT8jpFcGMsfptPs1+3T5GejflAXC2nmBxSE
 wTv58dyMh1z7XMMq5FsaKGh/FdVbk7860faAP/VBKK2p3/PDPj8h1DZ56ayq+t5Rec+R
 fT/5tOG56DfvrI+koFdUieeqp+En1dDzZO2DW3L65q22KKQJ+15u/78bpEabNUjg8cf5
 eXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770887243; x=1771492043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1zmW+nWtny8rTi79B6oc/MgMQTw0kDITFIhDKjYNi8=;
 b=rtyVgBq9/at2CV1t1JSmm/Lpz4wqsySfvyb/EuUA1PI6dzzQxeAOlajKFLG7iI7gpI
 m9nSp0vyz6PPPilIqLhicFts8w7Q6az6iVHLthspOWNEx74+TGYVizl3LaoyOkQ/yI0j
 BWXHMXqWAwnXb+LIqhDS2qgvU/E/zebI1EGFpES0zVP9AyYIFE00skqc0WGlGWtXZz5s
 sDNlhDR3WWKxdWG+3qY+jZWVkO+lRvxMh6SKtT97eJ/bu58Jkmhn4lkMkPg3UafiZf3F
 jP+y6wQIJ8Js/mGFtLrtGlNdHY7foJ7ZX9P4MwsYbkupgRh34/3y7G4tKbu8iLeFN+5C
 /i1w==
X-Gm-Message-State: AOJu0Yw7ULsZakdvzB7+Y3/kAs4rIHavBn1vDUPmP1l/3b9y0Et2NndF
 LA8dnuDusB2RslCxHUhcP8Zog4YvI07wwuIkZOB/KsAwuTQlMQNjtDy5BaTK8xbePOkLH3T7VJ5
 FWDE9i2s=
X-Gm-Gg: AZuq6aLErKWWDUF47f8qgc4c+Ohi/ouoqBv9XaBnhYGX0hOVtFZkBIbcFBnoXg+KeT0
 4BTBZL7oE3iNoOuDn9LYmLtwfaGe5WE5lnTOB+nIE9xwJrGoZjvuGsEAl7B3A1bnkDjyg/VTqhg
 JCj34efm2zMZxikFptXwOCEdRSFNT+cprtPydyok7KYCw/rOPRMuF6uMf11DvjdpZGdPLZj1oOz
 8Z0f2n6icFRjRJfp6OWBlfhnKCMkzNe1KtvUEqNrtWjIwgJMc/NQezGsd39oHi251H4lTRX96OQ
 1XkOlmizDAoKar45BvGW2tG7mNEyRq7hh+KZ9YchwSNMei+Dyv4tiM4TGmzPeaZkw4+snMdOtHU
 yZwtMewiVariuf14vEAevUFrPVSMCa3kgeyYClomanx4Qo4SPU+rBVt1auGYunBtySNn59aKQPM
 K1ajlc/UJ4bMssGpncoiXKnExtoQjWikjsSXW+M/wR/Zfi
X-Received: by 2002:a05:6000:2401:b0:431:752:671e with SMTP id
 ffacd0b85a97d-4378aa10f71mr3028698f8f.15.1770887242277; 
 Thu, 12 Feb 2026 01:07:22 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d50f24sm10377889f8f.14.2026.02.12.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:07:21 -0800 (PST)
Message-ID: <7d78cf28-f8da-4e72-b1b8-318c4fb3ef91@ursulin.net>
Date: Thu, 12 Feb 2026 09:07:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dma-buf: abstract fence locking v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260210102232.1642-4-christian.koenig@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 042C612BBB1
X-Rspamd-Action: no action


On 10/02/2026 10:01, Christian König wrote:
> Add dma_fence_lock_irqsafe() and dma_fence_unlock_irqrestore() wrappers
> and mechanically apply them everywhere.
> 
> Just a pre-requisite cleanup for a follow up patch.
> 
> v2: add some missing i915 bits, add abstraction for lockdep assertion as
>      well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> (v1)

LGTM, can upgrade the r-b:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> ---
>   drivers/dma-buf/dma-fence.c                 | 48 ++++++++++-----------
>   drivers/dma-buf/st-dma-fence.c              |  6 ++-
>   drivers/dma-buf/sw_sync.c                   | 14 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  2 +-
>   drivers/gpu/drm/i915/i915_active.c          | 19 ++++----
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c     |  6 +--
>   drivers/gpu/drm/xe/xe_sched_job.c           |  4 +-
>   include/linux/dma-fence.h                   | 38 ++++++++++++++++
>   11 files changed, 95 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ba02321bef0b..56aa59867eaa 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -365,7 +365,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>   	struct dma_fence_cb *cur, *tmp;
>   	struct list_head cb_list;
>   
> -	lockdep_assert_held(fence->lock);
> +	dma_fence_assert_held(fence);
>   
>   	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>   				      &fence->flags)))
> @@ -412,9 +412,9 @@ void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>   	if (WARN_ON(!fence))
>   		return;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	dma_fence_signal_timestamp_locked(fence, timestamp);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   }
>   EXPORT_SYMBOL(dma_fence_signal_timestamp);
>   
> @@ -473,9 +473,9 @@ bool dma_fence_check_and_signal(struct dma_fence *fence)
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
> @@ -501,9 +501,9 @@ void dma_fence_signal(struct dma_fence *fence)
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
> @@ -603,10 +603,10 @@ void dma_fence_release(struct kref *kref)
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
> @@ -636,7 +636,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>   	const struct dma_fence_ops *ops;
>   	bool was_set;
>   
> -	lockdep_assert_held(fence->lock);
> +	dma_fence_assert_held(fence);
>   
>   	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>   				   &fence->flags);
> @@ -672,9 +672,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
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
> @@ -714,8 +714,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   		return -ENOENT;
>   	}
>   
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (__dma_fence_enable_signaling(fence)) {
>   		cb->func = func;
>   		list_add_tail(&cb->node, &fence->cb_list);
> @@ -723,8 +722,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   		INIT_LIST_HEAD(&cb->node);
>   		ret = -ENOENT;
>   	}
> -
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return ret;
>   }
> @@ -747,9 +745,9 @@ int dma_fence_get_status(struct dma_fence *fence)
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
> @@ -779,13 +777,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
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
> @@ -824,7 +820,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   	unsigned long flags;
>   	signed long ret = timeout ? timeout : 1;
>   
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   
>   	if (dma_fence_test_signaled_flag(fence))
>   		goto out;
> @@ -848,11 +844,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
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
> @@ -862,7 +858,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   	__set_current_state(TASK_RUNNING);
>   
>   out:
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   	return ret;
>   }
>   EXPORT_SYMBOL(dma_fence_default_wait);
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 73ed6fd48a13..5d0d9abc6e21 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -410,8 +410,10 @@ struct race_thread {
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
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index b82357c65723..1404e1fe62a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -479,10 +479,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
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
> index 6a2ea200d90c..4761e7486811 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2802,8 +2802,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
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
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index bf6117d5fc57..78ea2d9ccedf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -148,7 +148,7 @@ __dma_fence_signal__notify(struct dma_fence *fence,
>   {
>   	struct dma_fence_cb *cur, *tmp;
>   
> -	lockdep_assert_held(fence->lock);
> +	dma_fence_assert_held(fence);
>   
>   	list_for_each_entry_safe(cur, tmp, list, node) {
>   		INIT_LIST_HEAD(&cur->node);
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 6b0c1162505a..9d41e052ab65 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -1045,9 +1045,10 @@ __i915_active_fence_set(struct i915_active_fence *active,
>   	 * nesting rules for the fence->lock; the inner lock is always the
>   	 * older lock.
>   	 */
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock_irqsave(fence, flags);
>   	if (prev)
> -		spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
> +		spin_lock_nested(dma_fence_spinlock(prev),
> +				 SINGLE_DEPTH_NESTING);
>   
>   	/*
>   	 * A does the cmpxchg first, and so it sees C or NULL, as before, or
> @@ -1061,17 +1062,18 @@ __i915_active_fence_set(struct i915_active_fence *active,
>   	 */
>   	while (cmpxchg(__active_fence_slot(active), prev, fence) != prev) {
>   		if (prev) {
> -			spin_unlock(prev->lock);
> +			spin_unlock(dma_fence_spinlock(prev));
>   			dma_fence_put(prev);
>   		}
> -		spin_unlock_irqrestore(fence->lock, flags);
> +		dma_fence_unlock_irqrestore(fence, flags);
>   
>   		prev = i915_active_fence_get(active);
>   		GEM_BUG_ON(prev == fence);
>   
> -		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_lock_irqsave(fence, flags);
>   		if (prev)
> -			spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
> +			spin_lock_nested(dma_fence_spinlock(prev),
> +					 SINGLE_DEPTH_NESTING);
>   	}
>   
>   	/*
> @@ -1088,10 +1090,11 @@ __i915_active_fence_set(struct i915_active_fence *active,
>   	 */
>   	if (prev) {
>   		__list_del_entry(&active->cb.node);
> -		spin_unlock(prev->lock); /* serialise with prev->cb_list */
> +		/* serialise with prev->cb_list */
> +		spin_unlock(dma_fence_spinlock(prev));
>   	}
>   	list_add_tail(&active->cb.node, &fence->cb_list);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock_irqrestore(fence, flags);
>   
>   	return prev;
>   }
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
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 9391d6f0dc01..724d77694246 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	struct dma_fence *parent;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&fence->lock, flags);
> +	dma_fence_lock_irqsave(f, flags);
>   
>   	/* If we already have an earlier deadline, keep it: */
>   	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>   	    ktime_before(fence->deadline, deadline)) {
> -		spin_unlock_irqrestore(&fence->lock, flags);
> +		dma_fence_unlock_irqrestore(f, flags);
>   		return;
>   	}
>   
>   	fence->deadline = deadline;
>   	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>   
> -	spin_unlock_irqrestore(&fence->lock, flags);
> +	dma_fence_unlock_irqrestore(f, flags);
>   
>   	/*
>   	 * smp_load_aquire() to ensure that if we are racing another
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 3927666fe556..ae5b38b2a884 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -190,11 +190,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
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
> index e1afbb5909f9..88c842fc35d5 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -377,6 +377,44 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>   	} while (1);
>   }
>   
> +/**
> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
> + * @fence: the fence to get the lock from
> + *
> + * Return the pointer to the extern lock.
> + */
> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> +{
> +	return fence->lock;
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
> +	spin_lock_irqsave(fence->lock, flags)
> +
> +/**
> + * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
> + * @fence: the fence to unlock
> + * @flags the CPU flags to restore
> + *
> + * Unlock the fence, allowing it to change it's state to signaled again.
> + */
> +#define dma_fence_unlock_irqrestore(fence, flags)	\
> +	spin_unlock_irqrestore(fence->lock, flags)
> +
> +/**
> + * dma_fence_assert_held - lockdep assertion that fence is locked
> + * @fence: the fence which should be locked
> + */
> +#define dma_fence_assert_held(fence)	\
> +	lockdep_assert_held(dma_fence_spinlock(fence));
> +
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);
>   void dma_fence_end_signalling(bool cookie);

