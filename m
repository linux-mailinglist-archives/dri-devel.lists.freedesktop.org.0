Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB8C31F47
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915510E63B;
	Tue,  4 Nov 2025 15:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="pzH+dB8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897DB10E63A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:59:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-429bccca1e8so2746301f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762271954; x=1762876754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4hK+4Wmh8xhFpzkjybSGnwO4p540bpRiyrPyD6NGbvI=;
 b=pzH+dB8d6nmRxPX0WNTMLVg2S0nuPJCVCznETtWoKV1ROV7jIjd7+ClJZ0/mCrUpHs
 2/PYZrk0G+DEFyPv6E/DNuxQXRjwB6Fw2GC+76RwbK0iEsOJUApupnTTwbKVNHO4IrSX
 05sX5bL/kDe+uPhF3mWs5uiDNXmzv5MGucI97F5LH8M/v0Q4ngELqv2GDwb6l2Vc2gQD
 /D2a8Pb7qYaA6vFjX4CWKo3Y9q+Uki2EFzPLtJdC8wZVUkJT1Ca1o0jOmARBnmg/PBsS
 Iu0yYWpbDEKVSsEHjGfEYTdPUv1V8P2kRXXOcLuFwp57k2o2enE/7DnvfdTX3Dnru/U5
 IstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762271954; x=1762876754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4hK+4Wmh8xhFpzkjybSGnwO4p540bpRiyrPyD6NGbvI=;
 b=JTiqh2VuSAKUOc8MVs1VsspHgv0SMeV5qBztZfrsnXaAj6Ohhw68iluB7xhk8tCvnH
 MMFuDWu72k8Xqxun6Jc0lElPa0XGwfcVXzv99t9K/KqHUqvFvKIKn0VHStrgHz6kbBwX
 Z/fcPC/oTz7bUCInAdHOXxf9FzhfGEhBwz0JJDuhWe7Chw6cbygRXwGMF9NlW/LyTbXE
 +on4BcIxxw1U3F7KTIS7KEqpoUp5iNL7tKeu4mu48Vy/QwdX+Dv/uTJriJhrN9+KhKmr
 ocBQhed+E3sTroAuN/i8Rk/bA5S7SUW8gcIBAXnDgWlgl7ms6dL6xV3klbJ5hwXZEgs2
 BYBA==
X-Gm-Message-State: AOJu0YxxiI743LXI95yKj38qSUrBHpei1a8rmqnSHwlZL8PTNgE1N+KU
 Zj9LvISEJ7l4FYlitrrR883g87mfyH/qmooYKeuxuOHrK5k7N2Nkf0OkiKzRY1HgJ68=
X-Gm-Gg: ASbGncu0c3qJjZGKZAYuEPhhGpRmtIo2Rcj7dKUKYN6JvbneGnyabLWq4hV+ijtfLyw
 asqDH5QZKla3CinWvocv7S2+J2e/7UCGNZ54UJNSp25RNJ8QzUFS/FN7fXfgZVsdTf0HM9gVh/T
 dvdlaoaBOSrPzqxaEGRYNtI67CLj4rAOVdlgZWJcRjdb0cqvkFFC0tAqBz4GPC2p4sxPmC0OybK
 zZoAwjiPuiOFtmmoMQGYjHCItMR7but038GGZ7rDkQZ2cP6ICxEeVEYcfuqeyApwwD7J3XQQ/wv
 TZFQxD1gFipNQcBRxJRG3Q3gxfV0EGiff539SvJhn+44MkzY55+Gu6yz2VgVgy50lCTQ8HwcMcI
 E4rBHjCvCEsQns/NM8MItb3ZxIzazagh2FWfk3Nns+b3/XarwsZZBfy/zRXiObk8y8uoJSLlG/2
 DhxCc0LKZVKrnAi68L0qDYt03Zs/k=
X-Google-Smtp-Source: AGHT+IFqcjTkw6hxTNvbjXVe2XuAguLzPaGUrr64PuE9eg3+uY7cEGEFtC8EjeG4DkMi2FBT5++QSQ==
X-Received: by 2002:a5d:5888:0:b0:425:7f10:d477 with SMTP id
 ffacd0b85a97d-429bd672416mr15343929f8f.2.1762271954003; 
 Tue, 04 Nov 2025 07:59:14 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc18f41bsm5133062f8f.9.2025.11.04.07.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:59:13 -0800 (PST)
Message-ID: <cbb38188-3a49-4e4a-8c2f-9942c9151981@ursulin.net>
Date: Tue, 4 Nov 2025 15:59:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] drm/amdgpu: independence for the
 amdgpu_userq__fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-17-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-17-christian.koenig@amd.com>
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
> This should allow amdgpu_userq_fences to outlive the amdgpu module.

Commit message explaining what and how would be nice! ;)

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
>   .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
>   3 files changed, 11 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 61268aa82df4..2ec4ffd7002a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -3147,11 +3147,7 @@ static int __init amdgpu_init(void)
>   
>   	r = amdgpu_sync_init();
>   	if (r)
> -		goto error_sync;
> -
> -	r = amdgpu_userq_fence_slab_init();
> -	if (r)
> -		goto error_fence;
> +		return r;
>   
>   	DRM_INFO("amdgpu kernel modesetting enabled.\n");
>   	amdgpu_register_atpx_handler();
> @@ -3168,12 +3164,6 @@ static int __init amdgpu_init(void)
>   
>   	/* let modprobe override vga console setting */
>   	return pci_register_driver(&amdgpu_kms_pci_driver);
> -
> -error_fence:
> -	amdgpu_sync_fini();
> -
> -error_sync:
> -	return r;
>   }
>   
>   static void __exit amdgpu_exit(void)
> @@ -3183,7 +3173,6 @@ static void __exit amdgpu_exit(void)
>   	amdgpu_unregister_atpx_handler();
>   	amdgpu_acpi_release();
>   	amdgpu_sync_fini();
> -	amdgpu_userq_fence_slab_fini();
>   	mmu_notifier_synchronize();
>   	amdgpu_xcp_drv_release();
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 761bad98da3e..9e0d558c1e4c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -33,26 +33,6 @@
>   #include "amdgpu_userq_fence.h"
>   
>   static const struct dma_fence_ops amdgpu_userq_fence_ops;
> -static struct kmem_cache *amdgpu_userq_fence_slab;
> -
> -int amdgpu_userq_fence_slab_init(void)
> -{
> -	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
> -						    sizeof(struct amdgpu_userq_fence),
> -						    0,
> -						    SLAB_HWCACHE_ALIGN,
> -						    NULL);
> -	if (!amdgpu_userq_fence_slab)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -void amdgpu_userq_fence_slab_fini(void)
> -{
> -	rcu_barrier();
> -	kmem_cache_destroy(amdgpu_userq_fence_slab);
> -}
>   
>   static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
>   {
> @@ -226,7 +206,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
>   
>   static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
>   {
> -	*userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
> +	*userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);

A side question - why atomic when only caller is the ioctl context?

>   	return *userq_fence ? 0 : -ENOMEM;
>   }
>   
> @@ -242,12 +222,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>   	if (!fence_drv)
>   		return -EINVAL;
>   
> -	spin_lock_init(&userq_fence->lock);
>   	INIT_LIST_HEAD(&userq_fence->link);
>   	fence = &userq_fence->base;
>   	userq_fence->fence_drv = fence_drv;
>   
> -	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
> +	dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
>   			 fence_drv->context, seq);
>   
>   	amdgpu_userq_fence_driver_get(fence_drv);
> @@ -317,35 +296,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
>   	rptr = amdgpu_userq_fence_read(fence_drv);
>   	wptr = fence->base.seqno;
>   
> -	if (rptr >= wptr)
> +	if (rptr >= wptr) {
> +		amdgpu_userq_fence_driver_put(fence->fence_drv);
> +		fence->fence_drv = NULL;
> +
> +		kvfree(fence->fence_drv_array);
> +		fence->fence_drv_array = NULL;

Setting pointers to NULL after freeing them makes me shudder. 
->signaled() can also run unlocked, no?

Regards,

Tvrtko

>   		return true;
> +	}
>   
>   	return false;
>   }
>   
> -static void amdgpu_userq_fence_free(struct rcu_head *rcu)
> -{
> -	struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
> -	struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
> -	struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
> -
> -	/* Release the fence driver reference */
> -	amdgpu_userq_fence_driver_put(fence_drv);
> -
> -	kvfree(userq_fence->fence_drv_array);
> -	kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
> -}
> -
> -static void amdgpu_userq_fence_release(struct dma_fence *f)
> -{
> -	call_rcu(&f->rcu, amdgpu_userq_fence_free);
> -}
> -
>   static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>   	.get_driver_name = amdgpu_userq_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>   	.signaled = amdgpu_userq_fence_signaled,
> -	.release = amdgpu_userq_fence_release,
>   };
>   
>   /**
> @@ -558,7 +524,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
>   	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
>   	if (r) {
>   		mutex_unlock(&userq_mgr->userq_mutex);
> -		kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
> +		kfree(userq_fence);
>   		goto put_gobj_write;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> index d76add2afc77..6f04782f3ea9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
> @@ -31,11 +31,6 @@
>   
>   struct amdgpu_userq_fence {
>   	struct dma_fence base;
> -	/*
> -	 * This lock is necessary to synchronize the
> -	 * userqueue dma fence operations.
> -	 */
> -	spinlock_t lock;
>   	struct list_head link;
>   	unsigned long fence_drv_array_count;
>   	struct amdgpu_userq_fence_driver *fence_drv;
> @@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
>   	char timeline_name[TASK_COMM_LEN];
>   };
>   
> -int amdgpu_userq_fence_slab_init(void);
> -void amdgpu_userq_fence_slab_fini(void);
> -
>   void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
>   void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
>   int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,

