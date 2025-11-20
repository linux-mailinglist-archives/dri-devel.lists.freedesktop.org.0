Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC44C74803
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971AF10E2A1;
	Thu, 20 Nov 2025 14:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="CcN0T9bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5C910E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:17:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso6564605e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763648244; x=1764253044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CXBH8LKXAoztnmU0gR6y1RS7gCB6+Ux7CKJn5h1WDCY=;
 b=CcN0T9bSdJu15hluKUbX3GFuvdVcLZYzsWz995msWlyhsTFeQQ9uH4hKRThEI7nh2Y
 oLcykbYuaqP1paJfDcHnCm1HoEpC6JvwCf5UPsyeDhu79HYXN9P8mh2gZCbbAlv49ROJ
 pMUIRb8rRgJ6snLEGEhVkDZDgPiPKj4WxgzcKyYlhy6oX2AsKS2Zd0TlW5KmxNVBkzhj
 baId+dVGBG6zKRF5xWZ8wfUUYTcnBAE9mC8JPRRXYtgdFAYbM0lJ5SMuLXmdsL2NDLwV
 2vzd/NkK5hYSviiWI+LzRFyWuU6eyHqC+SEhQMU+ebROlCk1/MFZ2kqJIwOG7drHBhhu
 yu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763648244; x=1764253044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXBH8LKXAoztnmU0gR6y1RS7gCB6+Ux7CKJn5h1WDCY=;
 b=VsFci5nfjWbSKJzhUWk7k1kpBosPtgHHeflV4ZXbfYIVcVqeix+78Goc8f/kM9Omuc
 xigzjz1iKh4aPH76ttJXUI5uo/mwxXFGkJUG8+qm+PtQN0iKT5QfNQ3Gg22eKDrIXc8B
 PO3tFYHuzf59/e/zcFn4agMu+oKL3Gv+tkh4k+FCB4VxQzs8c1uM8IJyo0nYgf7s4bDH
 XjtI4GfQW7WG63uAMsTMUXxxgUhcj0JD6ALktkMbbtJVy8JlMC5DTmHOWcBuiGpp4IPB
 BaRc5xuQtrPypXBvwYiUQ1xnaJaH1VLdupnn/I5/YbSx09hI3/ApcEppqyLWm0+xJpwG
 KV9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgbXmzMdxdZNEPA67w/TD4+frekHVstuv1YK70FlAqym5IFok5yVjB0qpCyQlEqBbxHd+Tiptp1wI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoHdWJk8IMXVjsGMgV9RXuFYycB/NykNzrgEKc3svZC7tMc487
 xUnrH4vhgEW8zPmuI8m+8/oXNwnWPlO6LXqqqD4//WRoqAiQtksodK1VMLt9h9UTC9w=
X-Gm-Gg: ASbGncs30tNtpALO38FEp/HJt8DwJvxyEQOKN/tfOJROas9VLRaBul68scj8Iq9pvpE
 LQaq8PLC0RAtS72TQt3jSkk2WKAocqtXidrBe1THmIwUTsXAkb7NnhvwLEj0cDL7dISuspoqtVB
 B4UOz8ivnggttXZ1xZRPfOgAC4jmINcT92mEQyQL5FhoOm4KUSOJSxZ1VNwtAwxkf2p9IaOXgev
 6W4WrczzrBW7ybGEvJo8PgzaBm5RzOOq6sg4s4qzEs4AgD64CV8/NnARWv8I9ZSSLiLx2veXVko
 BKrzJUhruSongK3YHj/mDhETbCpbJgeqz5bfz/Cl5Gdkg2Lzj7NAdMzky5H4xas/cJERr4LiU/r
 6WK69z43rD/NzTS9LnRaDhKn5DCPXylbMlCfGBA+vhJUccTQoKtyW9DdiwbnKFe87y7yDbZPGHf
 K0kVYEPNgAVfHazBZwZ2MixzEWC/98JVtq
X-Google-Smtp-Source: AGHT+IHjZqvTkkmRZ8Ij302pTC794n7WQdn7xGg0iWq0ORbFykU/+7LM6vc6fC7DhyZogpe/qnQw/Q==
X-Received: by 2002:a05:600c:3553:b0:477:55ce:f3c3 with SMTP id
 5b1f17b1804b1-477babc1f61mr20645215e9.5.1763648244298; 
 Thu, 20 Nov 2025 06:17:24 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b82d8251sm49652785e9.6.2025.11.20.06.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 06:17:23 -0800 (PST)
Message-ID: <805c7537-7d75-4eb0-84ae-bad7064ff166@ursulin.net>
Date: Thu, 20 Nov 2025 14:17:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] drm/sched: use inline locks for the drm-sched-fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-9-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251113145332.16805-9-christian.koenig@amd.com>
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


On 13/11/2025 14:51, Christian König wrote:
> Using the inline lock is now the recommended way for dma_fence implementations.
> 
> So use this approach for the scheduler fences as well just in case if
> anybody uses this as blueprint for its own implementation.
> 
> Also saves about 4 bytes for the external spinlock.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>   include/drm/gpu_scheduler.h             | 4 ----
>   2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 08ccbde8b2f5..47471b9e43f9 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>   	/* If we already have an earlier deadline, keep it: */
>   	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>   	    ktime_before(fence->deadline, deadline)) {
> -		spin_unlock_irqrestore(&fence->lock, flags);
> +		dma_fence_unlock_irqrestore(f, flags);
>   		return;
>   	}
>   
> @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>   
>   	fence->owner = owner;
>   	fence->drm_client_id = drm_client_id;
> -	spin_lock_init(&fence->lock);
>   
>   	return fence;
>   }
> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	fence->sched = entity->rq->sched;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> -		       &fence->lock, entity->fence_context, seq);
> +		       NULL, entity->fence_context, seq);
>   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> -		       &fence->lock, entity->fence_context + 1, seq);
> +		       NULL, entity->fence_context + 1, seq);
>   }
>   
>   module_init(drm_sched_fence_slab_init);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..b77f24a783e3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>            * belongs to.
>            */
>   	struct drm_gpu_scheduler	*sched;
> -        /**
> -         * @lock: the lock used by the scheduled and the finished fences.
> -         */
> -	spinlock_t			lock;
>           /**
>            * @owner: job owner for debugging
>            */

Looks good to me and the kernel test robot warnings Philipp mentions 
AFAICT are from a different patch relating to trivial selftest changes.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

