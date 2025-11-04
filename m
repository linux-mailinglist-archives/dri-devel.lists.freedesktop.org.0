Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3615C31B67
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691CC10E5D2;
	Tue,  4 Nov 2025 15:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="efGzd0Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AD10E283
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:05:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso26626565e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762268749; x=1762873549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AlvoX2iNCnI6J0QF0/fbI3mWGM7eomLwPcxMgnHgE+s=;
 b=efGzd0Z/EzAhF1s23ifLv1yvoyTvGdnPfkpjBMAmJ/XXv0mCMkorZKjwApkiM+xuKG
 YvXREJS2Fg92L0yihWGoI4lEj0ht9z9QHVUvqCI5mJw219+V2J5b9JN9Ikf40ZmoBIyh
 r1U6HlwO8kuh+pmWYNKyTtwmE2EP8zbvFmScbE4clNHe3hdzMnSEoLxty8/LKZO5jXXj
 cEEwMYLVQ9zQJrPoDqgskWWuhE+VgUmThkqwHoaZRbUG/6hZn8jTSrS/cZbpDn7XyBoE
 va5VqskEDUgGWLJ+RiKGwz6kPycDTjdx+QPInmSz4qXJbWHgJnyS5j4+vZJ3ZvmUTyWN
 EutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762268749; x=1762873549;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlvoX2iNCnI6J0QF0/fbI3mWGM7eomLwPcxMgnHgE+s=;
 b=e2rW5ePPSuuDPXUUd1gesRdHodNNdkCIUcX1bcPXx73en0ys5WxDCDfOSfzrDP9ihx
 xlL7vB9hEciPNoZWTWCucmcY5Q497N1swgOtluDaTuhmKSC3sEMAIQs5r5JdmLOC82/W
 2miYK1ok8pyicxgsQBeD4V67khE4C1uxtV/8NCtJS+Yb71UC1J/XCm03UMmfExwCKevy
 lvNmr/Z9ueuRqtEK8dx8IP8xtD+5aTp2PbvZVqoFAHJpR8Lkucq6iOSTzNyfAfRajo3v
 nN0Vh+giEOCDDhQHtPDHVeEbLtaQDpg9mWQnL+KfNV0AuxgYw+K1hH6zQtFjKQ3Le/C+
 qrCw==
X-Gm-Message-State: AOJu0Yzcf/TfvjAJoqT9lrv/fG5KbCUiQnzw93jF14OLbYU1y5kH85KD
 qF0h84NN68au6siI3qhbszwo6+XWbUgwr82Y6M/alT4I3Qq5MLJtRLtL3mpODGNLb1w=
X-Gm-Gg: ASbGncvNKs5vQtu7l6EtB11TosHz+EzNXsYK72a/UtergkgZ3AKZXbDfhiWU9Vx6Inh
 29xwMFFErHfbUbJm3XTYiSR7jRyJlVbduBknAFZft8f8sBhNicdYBZCX9/V4JpA93lwc0lfXUWo
 KzlG0lI4lB7JeU+mG5G6Su5aCBqom89bSpe/KoZxdOETOtQa/13h+QoGSIbbGi9BVeUH2wz/8z9
 rH7Xpn0VcbyYRVt+zMYdB0y8RjkgOxFhTjwHtJhOE+gHwtR8vKOIz5xXwMb7lrI0ONIgSry8g/r
 Svxj3yjc5vM20x6JkpJMCeknCKJoh8Tf7a49f5g+GGyYoROrRa2l2cPvw0ZBt4HQQ88e582giid
 JyK5WtD/YTRFIvb6MeJJm1XSu9d+83CEVSB9xCsfqKgwKlum0eYwmOPfLJO8HDfK9BLif7yhvJZ
 BCxGbgRw7QfRca/jiS
X-Google-Smtp-Source: AGHT+IE4uSgi6DaJG7/TnMZJ3RvykIHu+AT5e2DgQc/XYdPH4m3Do18Xs2kqXknHeNPsU8Lv4WNFuQ==
X-Received: by 2002:a05:600c:45d3:b0:471:1716:11c4 with SMTP id
 5b1f17b1804b1-477308c263amr188249945e9.34.1762268749096; 
 Tue, 04 Nov 2025 07:05:49 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383c20sm223253835e9.12.2025.11.04.07.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 07:05:48 -0800 (PST)
Message-ID: <ef721c8f-977d-4c10-90a9-379c3b86a3db@ursulin.net>
Date: Tue, 4 Nov 2025 15:05:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] dma-buf: use inline lock for the stub fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-7-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-7-christian.koenig@amd.com>
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
> Just as proof of concept and minor cleanup.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f9d7439275d1..0dbd2f641f37 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>   EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>   
> -static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
>   
>   /*
> @@ -123,12 +122,8 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   
>   static int __init dma_fence_init_stub(void)
>   {
> -	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> -		       &dma_fence_stub_lock, 0, 0);
> -
> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -		&dma_fence_stub.flags);
> -
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &dma_fence_stub.flags);
>   	dma_fence_signal(&dma_fence_stub);
>   	return 0;
>   }
> @@ -160,16 +155,9 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>   	if (fence == NULL)
>   		return NULL;
>   
> -	dma_fence_init(fence,
> -		       &dma_fence_stub_ops,
> -		       &dma_fence_stub_lock,
> -		       0, 0);
> -
> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -		&fence->flags);
> -
> +	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags);
>   	dma_fence_signal_timestamp(fence, timestamp);
> -
>   	return fence;
>   }
>   EXPORT_SYMBOL(dma_fence_allocate_private_stub);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

