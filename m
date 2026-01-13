Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D5D1A062
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCCD10E502;
	Tue, 13 Jan 2026 15:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="WnnQgoEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704AA10E502
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:52:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so77711755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768319527; x=1768924327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wC7CtzfhblmlTbaq7qeFAgN5dmX5dS1eUplNNVPbFMg=;
 b=WnnQgoEByCvi3FPSsIoddHWNr7b+td5BqsRwgHJwFdbQ0mHUKBjnO3F0mxBmdz+qpR
 X3ptFGgVl1hBAoCzSWfRQqz8jy6F3D3LQSYeUFm+vV0Yu0RwPKs56/wXN+C2yhkqcBkC
 Vi06AmM7g6iVgSSYeUl7282P0hSyZFvU24j9Tk3V5BrG26ZA//EadNYuf1mgGgai71mA
 zYq9oslg7bQk0YknfbwC88PATyuLCsv4CF0lZpN5f9q0wBiL0GxptTY7PX7IiVWLS5kN
 KpL99Jehf127zolsXbdguMMW0fBy1f67GS7MzHVOAE92rQj8v2inveQqN5Hs5lV7riB7
 eeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768319527; x=1768924327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wC7CtzfhblmlTbaq7qeFAgN5dmX5dS1eUplNNVPbFMg=;
 b=s+NF/smIq79VDl2Hp+FNKRlkmAZMPXc3Ws2aErFd2tgas8VnHtKDR37ZUOH2jcrpIy
 WJm6sIP88khXT4Fsyn71y02XpmltnCHdRg+4Ti7Fd62H9pC5P7Xvdbm9L+ZiHMCNp046
 FyeIuwixfqOkUQAZ/0dTgFIG9zWb5DZGoCli9TWlltd8q6cb8N3ZZ7hTxgl0nJnHxE4r
 0U4HZRVoJ7qz6u35MhODINZrskZ9erucZPEPj6xfCipUVkazdt6R73sWUZArjFgodA8B
 CYCyMuGxwNABNk4QkocqbQjHpxfrC31fp+oY1S7wUyjzZMLv/C5WGmJggs7vQzHNa/rU
 2VmQ==
X-Gm-Message-State: AOJu0Yw3OrYGjHXGxOwWX8oUeWJ13Y6STtKEYLRWCmQn/o0KxxKxVsMd
 wFvpT1IeTHJYdK675LNIBlVXyyUjlT1JIt0z3KfEBkLeOJhrSBML29bcUjZc+p1Fdz0GMRzyS1I
 6uMbu
X-Gm-Gg: AY/fxX7eSzoGubSc944h1V/tUuCJ+5sHHri84UTGakM1P0L/paiR8qlimeJF5GEAdvg
 h27ZSuQi9Br8ZfmNP14+fz9saOobvjvkyEFpJ9EYhb+vQYjU3XuPTDv2q9dn0cbkLc3CqE4dMUX
 jZPikM7fTuHNhHPaxium3fQ6Mp9Iq6o31K91jzJ8Oglw5LsU4IiSXQNFEnJhrK2hc8vq0KoZsOn
 V9od9LTtFhhXs9dN0EV8Z5SgTfXcqiYcjbQAgE5tNX33YwTT2N4EL4jHhOeLfJu/w3AIC1Jf3sF
 QhTwiv6ArEPY4PtZUG8NtD25m3oWGmO+IN3jtpll/1FNYrUoxuStS5Tm/HAWi64NmeBWGo7ypK/
 ttu8CdfCwB/xXGW8Z8gjpslENdeRhkb8dWePGPcrluaZ+wizxSdCVDO95hFMI1Z7oi7nqO5UaLa
 MWDPGMMZjCuAgfhv0M2m337LtfSYmecdSh
X-Google-Smtp-Source: AGHT+IFKcn7Mmd5kE+g5xCEcvzJNUTaJumrxedkJLAOVPMJEWa7TizNZXS9bNRV8hA9iInGUnDF1Lw==
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-47d84b32793mr223251575e9.23.1768319526504; 
 Tue, 13 Jan 2026 07:52:06 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff1e9sm46769388f8f.41.2026.01.13.07.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:52:06 -0800 (PST)
Message-ID: <86181fd8-a55a-4e3e-a2e3-b639c6e362ce@ursulin.net>
Date: Tue, 13 Jan 2026 15:52:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] dma-buf: abstract fence locking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-5-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260113152125.47380-5-christian.koenig@amd.com>
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
> Add dma_fence_lock_irqsafe() and dma_fence_unlock_irqrestore() wrappers
> and mechanically apply them everywhere.
> 
> Just a pre-requisite cleanup for a follow up patch.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c              | 44 +++++++++++-------------
>   drivers/dma-buf/st-dma-fence.c           |  6 ++--
>   drivers/dma-buf/sw_sync.c                | 14 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  4 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  4 +--
>   drivers/gpu/drm/nouveau/nouveau_drm.c    |  5 +--
>   drivers/gpu/drm/scheduler/sched_fence.c  |  6 ++--
>   drivers/gpu/drm/xe/xe_sched_job.c        |  4 +--
>   include/linux/dma-fence.h                | 20 +++++++++++
>   9 files changed, 63 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 481f1cd9aae2..be072b7ba10b 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
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
> index c362d4dfb5bb..ea3c187c474d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2784,8 +2784,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
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
> index 9bacf8855380..a208e8841315 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -378,6 +378,26 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>   	} while (1);
>   }
>   
> +/**
> + * dma_fence_lock_irqsave - irqsave lock the fence
> + * @fence: the fence to lock
> + * @flags: where to store the CPU flags.
> + *
> + * Lock the fence, preventing it from changing to the signaled state.
> + */
> +#define dma_fence_lock_irqsave(fence, flags)	\
> +	spin_lock_irqsave(fence->lock, flags)

Not sure if checkpatch will complain about no parentheses around 
arguments, or it is smart enough to know this one is safe. Either way:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

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
>   #ifdef CONFIG_LOCKDEP
>   bool dma_fence_begin_signalling(void);
>   void dma_fence_end_signalling(bool cookie);

