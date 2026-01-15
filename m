Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAFD22FD8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA210E11F;
	Thu, 15 Jan 2026 08:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="G7XmnIeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5BF10E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:03:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so966005e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768464180; x=1769068980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xcbLu2kQiM96qvHxOV6cgsDqK/+n86xJwLTUNrTYpaE=;
 b=G7XmnIeYwvSSy5874kcfctUmRLorwtyrCbxZSuv1mNxYUgxRPhprjpWG80ChvQe0i9
 YKpCPrpgSKEOLe7BPeG0vucVMBOwLmZGTX63qt9ws0McDk3OMwr/BO+GfAVaKZO51q9O
 5GmWYuvEVRGsNXcIIqIaLTiGoNC3rIf2NVJF28cEG5QaaxTeYpHIcCIbzmYVEZvxo6AA
 v+TezUISg27eBM/i5C3DrxvxR/Ic+ulfwCcmWRvZB4r59Tfx69MXa2DtB5C1ueMwGAR9
 GuDaW3z9Uha/qzIVq3/VPEhaQYhcib7lmlvY19T3MQhES197cIZ3KuQUsB/C/A7XbsNI
 JCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768464180; x=1769068980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xcbLu2kQiM96qvHxOV6cgsDqK/+n86xJwLTUNrTYpaE=;
 b=auzxkYApGqV6J+32vfPh9Gel81abzvqJZPqnhPBLKa1e/oOHS18ox34YPAh7qnJwk0
 dy0/Kj4YVAkinkLOp7CzEASCxuI8cSRiTqqMAbqQJDjHBuy5IAG/vAV2OfrYQT2Dyhqj
 EjdudKp4O5CkHzVDgIVL9WYxSBLbtDKVoWdVcz/hLFnKYUhswW93hvxQQ5E4KrXF4wyZ
 oF68cVhhVhEKNWapvb0Vcq6NXifOxXscfObPbjsxC3U6889JsDJn3nnmpp55Av8/GQun
 sNwa1D6Dniy/9dJTkt2KJVaU+3eCbzHYn9TjJO3szv/EmZNnArPHnZs1mncPgBjPrESD
 0gVA==
X-Gm-Message-State: AOJu0Yw2L/Em0cpkH7TomESic4wDS2Us9A8kXL/8Uq/x2ebaaVEJX6JL
 bq+Q5q1Kbvmp0hRUwrLX/o1EOD2s675IDAkTlR8B2uNzVSq2c7LGzKSRiNF7LWszLEg=
X-Gm-Gg: AY/fxX51uYCSPo8t48jMZhekF+JXUg/vbRGJ0U8erE6j/MC9ToFQV8sBQ+l3C8/VT+M
 GrS0MphUo67fPzmbDGr/ZEpZ5gBnuolAzMrNorROeHPQYzkVtmpUXOZlIGtT30IeyrBF9avjs1B
 kNSLzNwG9EjshPwGgjKkAKiliA74O9sc6ufwipn7F10dkD1JUkE9pC0HFcP1gnG6gJvv/XhdF8d
 K/yU0EfwlfV+ubONeq/TRQCNhTax6SEg09fRgzMGfHsFpfRaVt9XwxJojlBOi4hXrXlZeUI0nIt
 01SvMAP/8aw6qzRB0OeTkmPzwX16OYYketZW3PM/Fae/Lu8HXWbcHuBorwUs15U6sFR3k75ViTa
 MKXpdW8zwx8Ay09FFIkVDBGodoO5csVABoY9eEPusXJs6MjASNRsal5GpSzq0soUQvvYN5T50d6
 j0PjRJxu4+f35aMkW84U9BlNBeL1GCfvu3
X-Received: by 2002:a05:600c:4e0f:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-47ee32fc6f7mr64282815e9.13.1768464179538; 
 Thu, 15 Jan 2026 00:02:59 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428cebdcsm32679625e9.12.2026.01.15.00.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:02:59 -0800 (PST)
Message-ID: <42d9230d-d39b-4ffd-aa73-112a984bd50b@ursulin.net>
Date: Thu, 15 Jan 2026 08:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] dma-buf/selftests: test RCU ops and inline lock v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-7-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260113152125.47380-7-christian.koenig@amd.com>
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
> Drop the mock_fence and the kmem_cache, instead use the inline lock and
> test if the ops are properly dropped after signaling.
> 
> v2: move the RCU check to the end of the test
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/st-dma-fence.c | 44 ++++++++--------------------------
>   1 file changed, 10 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 5d0d9abc6e21..0d9d524d79b6 100644
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
> @@ -100,6 +83,11 @@ static int test_signaling(void *arg)
>   		goto err_free;
>   	}
>   
> +	if (rcu_dereference_protected(f->ops, true)) {
> +		pr_err("Fence ops not cleared on signal\n");
> +		goto err_free;
> +	}
> +
>   	err = 0;
>   err_free:
>   	dma_fence_put(f);
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

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

