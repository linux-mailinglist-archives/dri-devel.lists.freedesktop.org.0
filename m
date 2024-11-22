Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731D9D620C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539110EC00;
	Fri, 22 Nov 2024 16:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Z0lXzGdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FAA10EC00
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:20:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso18851295e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1732292449; x=1732897249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ELGCwQdqpo0f6gctSGc5Xu5MtnMn3sFyIRwEW9MjyUA=;
 b=Z0lXzGddwL74wuGLp8QF6fF2Q9Lt6hwndlyxhZ826uG9B+c6fg6UQo4njgrDVR/Eyc
 c5f4uXMi7yqryDkRgp5ENgWLk9vlt3eMnyaVY7l+P9t/3rtCAQMXoGTYtaJxiCHl2LkG
 Ww7ar2NCZ/5uyyaD8vygoSE0IrpYEOMSmflUH0tDS2iKEz5u9Vb6zYNgpTE8Q0T6exB6
 hCTWOwgDSPiWf3wV8JJPZyDRM6rJMw+WsKijJKiyk08wc5Xom+Nb5lJv7C1PbyBDSf4t
 T2HFel3vs2mFv8MBMbUizIeKPWk4bDaWEXNcKAOOFaNbukxVbiiGlK/F+/6iC42imnst
 s1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732292449; x=1732897249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ELGCwQdqpo0f6gctSGc5Xu5MtnMn3sFyIRwEW9MjyUA=;
 b=CZ9htnOPF6YCg06pl8n8UYymx/APwYDe4AkQBo+MZBOAAikq+6wAW2ydoXer6BbaBQ
 XQcUW+/CQ6CrsffDr9lz9u5JJ7KqrKb4hGZXBP/XNy75+ICBGsIXYcSauxUnHCKMf72o
 wpP6JhablSeKCsqkS1AcZrgNU5E7vB/REnts0Jgb2yjZWCw22NIdbzy2soKwmmFX9DOr
 uKsSCMC8V+VdlSPt4Xnu3sVp5Mf13Oq2kLfXf0E2WkZ4ZMLFApaFW77h6nrXjtqJJ3a3
 wUT8ktCuMPVzxovUjw9WW2Uq6q2z0vI3XHuod3nNtiMNNuWnvPvx3HBumJnGjMz7Owcs
 Vq6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvWJvxLuCglCf+XhDrkUx7gV5lUtJtzsIWvzlpPMUuOsNPnhpLgA40BZNV0bgHmupBKDEvx//IsuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhaf/xRpMKT5FAqSrBL/V3u9sZgB7nQiaPeKYmnuMllUfGI9rN
 gVQiDC2Rl1s6sC78ii5ewA4vDSvpPFmHgAGq5tj1qqaNdWWsMtxZeTRsT7+oTnI=
X-Gm-Gg: ASbGncu8ygvTLI0hHXuUalyPCRTL9ujvnrFRnj5bsTXR/QHMW+kW6wygwtyh9sbXOrp
 pew6qUDX0XCNO8uEKOMY8cpmKC/TNJsVbjSKV92qc6O9whdQf8u1C6BFDBJcUIkjsI1mlTLyTbQ
 hCLdnGb9thBN6Zp+7nzEbgvua8pWBcFKCWItSOBKb67Cq6U7b83y1bn5/5yrEo8zsbT1buvH1L5
 5R9PFd/CMkhpv4gTaKdwh8xTw5rL0iCLZjIte6W0zHFc5muhQ6ABxxnOqrOH1uwuw==
X-Google-Smtp-Source: AGHT+IH34wGFMa9dudI3BXqogajIEg8q6PcI2UV7P/O1WJSKESHI59RlhiEgN7ApqSbwiZeY/eqTwg==
X-Received: by 2002:a05:600c:4fc1:b0:42c:a6da:a149 with SMTP id
 5b1f17b1804b1-433ce4c21e9mr26826555e9.25.1732292449507; 
 Fri, 22 Nov 2024 08:20:49 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2760asm2790646f8f.52.2024.11.22.08.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 08:20:49 -0800 (PST)
Message-ID: <9b65ab8b-22d9-44e5-9426-d0d6d1e14db0@ursulin.net>
Date: Fri, 22 Nov 2024 16:20:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix dma_fence_array_signaled v4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20241122153037.44079-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241122153037.44079-1-christian.koenig@amd.com>
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


On 22/11/2024 15:30, Christian König wrote:
> The function silently assumed that signaling was already enabled for the
> dma_fence_array. This meant that without enabling signaling first we would
> never see forward progress.
> 
> Fix that by falling back to testing each individual fence when signaling
> isn't enabled yet.
> 
> v2: add the comment suggested by Boris why this is done this way
> v3: fix the underflow pointed out by Tvrtko
> v4: atomic_read_acquire() as suggested by Tvrtko
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..6657d4b30af9 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -103,10 +103,36 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>   static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>   	struct dma_fence_array *array = to_dma_fence_array(fence);
> +	int num_pending;
> +	unsigned int i;
>   
> -	if (atomic_read(&array->num_pending) > 0)
> +	/*
> +	 * We need to read num_pending before checking the enable_signal bit
> +	 * to avoid racing with the enable_signaling() implementation, which
> +	 * might decrement the counter, and cause a partial check.
> +	 * atomic_read_acquire() pairs with atomic_dec_and_test() in
> +	 * dma_fence_array_enable_signaling()
> +	 *
> +	 * The !--num_pending check is here to account for the any_signaled case
> +	 * if we race with enable_signaling(), that means the !num_pending check
> +	 * in the is_signalling_enabled branch might be outdated (num_pending
> +	 * might have been decremented), but that's fine. The user will get the
> +	 * right value when testing again later.
> +	 */
> +	num_pending = atomic_read_acquire(&array->num_pending);
> +	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
> +		if (num_pending <= 0)
> +			goto signal;
>   		return false;
> +	}
> +
> +	for (i = 0; i < array->num_fences; ++i) {
> +		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
> +			goto signal;
> +	}
> +	return false;
>   
> +signal:
>   	dma_fence_array_clear_pending_error(array);
>   	return true;
>   }

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
