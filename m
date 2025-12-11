Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE92CB645A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2273F10E765;
	Thu, 11 Dec 2025 15:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="uaWbb9Ha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1241910E765
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:05:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b79d6a70fc8so31729266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765465500; x=1766070300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f7ZKPN5ggOioeVdhwwEtPBeX8k1sUkg1pPS7bSbhXIU=;
 b=uaWbb9HaA5in5nImwJ4ZfaCX9IpwivwiIAIs4RnJJ09gPecBLji1ADZEIYCDL9b+A3
 OR2ewK6PmV5fX5lVuqq1jCujR28Hlouc3jV+TUh504xPBEzg+iSGwWGaTnnIq4vK4FoX
 nV4GfpEi6GTLuTtgERwzvzsM7kfOB49yGaFsukvRumSVgTZB8N47e0f2Bdafi2v5+wkb
 2EeVLYoYu+qV4OmFPxSDHzCtrMl50peX46uDd0erZ/lHaNNd7Am4aOkGyYiFy5iSXYpl
 3G5eG36hNRgZRBvTaH1U4tHxYmmCHupVqNyWJMu3aZN8qyQ/ztP4QdPTH0IP+QlQx1mm
 8Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765465500; x=1766070300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7ZKPN5ggOioeVdhwwEtPBeX8k1sUkg1pPS7bSbhXIU=;
 b=INg8K3s4gycB9LF+abz7+Lw1PS1ymc+tuam5TWOUbjq0SEmZal6Q3SNXajuTQOx19b
 SbMaYYryZxRE7uP2NwwaKQPT9LvQxX1pTO2ft3CwYs3o4iW682nk0tvXBuraSdD1y01f
 2ftyqqEAvOblBLOg0NgvPuf/ptMJVD8mKU0oLHE3i/xvp/aAXESXgW32y7miHC51LDW1
 WSJvjUzmagle6SbBHN2z9ZdVHYogVEBD4ApsEVD62hxXb8h5+kDglbLSSv37RDC5C/Wc
 ytFyqknbSyYxZlCo0lb/lMu5wVk4vQ4lJfWz/LDBIEkoNQmdpv+dJOKtf7zd0bwHi+Ox
 1Yfg==
X-Gm-Message-State: AOJu0YwrSu6y9dTW9OCGGQIda0lmJvZxUXr16spzhkgfkcxr6yZUoU8a
 tYBAu1bRP7ie9pTGJJ814BzrTe9+V4CsvWSfIIKiiddqHwJQM/3wr/ShwQkk0U24b4g=
X-Gm-Gg: ASbGncvWZfu63iMuXabh8M4zOFfo2QDrCc0NpQwBfAyIsGyZm4Yj8fONCgp/3i4m1xb
 cKzZDVNp4yRvhSFW7b0DIYTT8Th0016hFyoa8zT9s2sGW9ZMkMUkesaqQC/p6y/yhWi4bh9zvPF
 bh/x4WR7F9qJitWnja+DYKCmIlJHHwfBatcifR4DCShwgbzDGE0eOk5UK5fcXvHSRZPZ28Vdwjn
 yctxIPEZgE2YfW/sCcNxueGp9vcZBXBT2U0Dy4qX/na5zpb/Jb9u0NmDNyFXIKy5nLd+7Tse1n7
 D0MR2gOzkFMpAonVcOTe634003bclyQ0nuGCiemRpYGSwiSJMbZC+XMQZUwhkmm5al/algXsVrE
 im1sr8yER59NWP14aJXE+RvRfZsg+g6QyuaC9xEzTl3a8MO8Y0Oiwy8tyQ1kUt9L/5cIfD9ADga
 LZUpnyfQQVcCzbqFWer/sN7PssYuG4
X-Google-Smtp-Source: AGHT+IHdAcKjejHbGiQblMCP+4cYgux/E5ULcPpI/CacgLIrL7tj8R3GvcAtnUfXFrqQzxvAE3s0xw==
X-Received: by 2002:a17:906:c105:b0:b79:e4db:2e9 with SMTP id
 a640c23a62f3a-b7ce84c0ab1mr745954866b.60.1765465500174; 
 Thu, 11 Dec 2025 07:05:00 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa57192bsm292450366b.53.2025.12.11.07.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:04:59 -0800 (PST)
Message-ID: <875587a6-a7d6-4d99-bfd7-49b6570941aa@ursulin.net>
Date: Thu, 11 Dec 2025 16:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] dma-buf/selftests: test RCU ops and inline lock
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-6-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251211122407.1709-6-christian.koenig@amd.com>
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


On 11/12/2025 13:16, Christian König wrote:
> Drop the mock_fence and the kmem_cache, instead use the inline lock and
> test if the ops are properly dropped after signaling.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/st-dma-fence.c | 44 ++++++++--------------------------
>   1 file changed, 10 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 5d0d9abc6e21..65221270fd06 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -14,43 +14,26 @@
>   
>   #include "selftest.h"
>   
> -static struct kmem_cache *slab_fences;
> -
> -static struct mock_fence {
> -	struct dma_fence base;
> -	struct spinlock lock;
> -} *to_mock_fence(struct dma_fence *f) {
> -	return container_of(f, struct mock_fence, base);
> -}
> -
>   static const char *mock_name(struct dma_fence *f)
>   {
>   	return "mock";
>   }
>   
> -static void mock_fence_release(struct dma_fence *f)
> -{
> -	kmem_cache_free(slab_fences, to_mock_fence(f));
> -}
> -
>   static const struct dma_fence_ops mock_ops = {
>   	.get_driver_name = mock_name,
>   	.get_timeline_name = mock_name,
> -	.release = mock_fence_release,
>   };
>   
>   static struct dma_fence *mock_fence(void)
>   {
> -	struct mock_fence *f;
> +	struct dma_fence *f;
>   
> -	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
> +	f = kmalloc(sizeof(*f), GFP_KERNEL);
>   	if (!f)
>   		return NULL;
>   
> -	spin_lock_init(&f->lock);
> -	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> -
> -	return &f->base;
> +	dma_fence_init(f, &mock_ops, NULL, 0, 0);
> +	return f;
>   }
>   
>   static int sanitycheck(void *arg)
> @@ -90,6 +73,11 @@ static int test_signaling(void *arg)
>   		goto err_free;
>   	}
>   
> +	if (rcu_dereference_protected(f->ops, true)) {
> +		pr_err("Fence ops not cleared on signal\n");
> +		goto err_free;
> +	}

Bump to after the signaled check just below? Otherwise the signaled 
state hasn't been ascertained yet.
> +
>   	if (!dma_fence_is_signaled(f)) {
>   		pr_err("Fence not reporting signaled\n");
>   		goto err_free;
> @@ -540,19 +528,7 @@ int dma_fence(void)
>   		SUBTEST(test_stub),
>   		SUBTEST(race_signal_callback),
>   	};
> -	int ret;
>   
>   	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
> -
> -	slab_fences = KMEM_CACHE(mock_fence,
> -				 SLAB_TYPESAFE_BY_RCU |

Hm.. race_signal_callback looks like it could be depending on 
SLAB_TYPESAFE_BY_RCU. To you not?

Regards,

Tvrtko

> -				 SLAB_HWCACHE_ALIGN);
> -	if (!slab_fences)
> -		return -ENOMEM;
> -
> -	ret = subtests(tests, NULL);
> -
> -	kmem_cache_destroy(slab_fences);
> -
> -	return ret;
> +	return subtests(tests, NULL);
>   }

