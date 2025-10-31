Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7CC256D4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD2510EBC2;
	Fri, 31 Oct 2025 14:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ttVLCXdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A0510EBC0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:05:33 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-429b895458cso1391541f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761919532; x=1762524332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26q/n1I6RBOpvKVgbrEI7Ev5SGuxVTHG/ajFD1B6wJ0=;
 b=ttVLCXdMOudbi1V147OsLBcLLSorjuYQUMTuTLASC/03OlOfQ0E9hxnCZZHgDBnJ1g
 4x2zze+6LTC//VAJ4I3x375ad0hZcUStD9nJ5bK0PvVAMkQqXcYOebDuSyXoIWw51Ra1
 o4V5G6E2GrX0EDiCA2/CYwZs7KRtiZhOgosdKlpoJcHsBRXCy8zBfQTnZ7lsxpO1kChs
 /yHYwtLwcHNZM7/9n61Tcysf5Y7b/j5+TU0ezgRa0ksBJOfCsHhz+rxY+rr7qXbitzzm
 croBesC/coAwwIvOi5s9QBeSakiV4pGds4syhBEnoZO6MiQ+1DPiPQlnfxaOjy9HwswH
 5yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761919532; x=1762524332;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26q/n1I6RBOpvKVgbrEI7Ev5SGuxVTHG/ajFD1B6wJ0=;
 b=adfkWrEaADW0Pf1+dKdb/H85Rcez1sCQTwYhD1lwH73/pBKA210hsJx8gJI0ewiEFw
 I41VoyKQh/CoB2R/faxjGVQxOtNvEvMGRgiuP7vgKRMd40uL+K8jBRToqu7F9yLcbjdR
 67H6JCvAsOn275vV+g7Raw0ZhCiMKshW15hiCilaT/rid2buBud6snS9Z3usFwfjWT5W
 1ewlPcv18LMjPl2H4DxdoqPSlYObwrOQca11do6psaC2KrzdAvO8w6RxuyofMdj6aL4E
 KC7sA6K1MYq6nNJK1y6vXzY9lBRtNuwXWUYPmnVU2D1BFrhWfMv41A6hGIbmXJD5+MWt
 erHQ==
X-Gm-Message-State: AOJu0Yzqq9dqqAmR4/YD1Kvl09USJwmcp7qj8vxt1IOVk2rryHqHY4Rp
 PItciuMulYpJh4+QZ47CFuqRGPKfv0vV9CVxG4rvbC89g+ql7IAbuFrnKalbF8IamFw=
X-Gm-Gg: ASbGnctyXcsEhcE1EjILThGluDS1Mm4y8yEYOvY2c61WKVGM4y49Q62eleheSO+yBOI
 fuquR8oibxNrXWxv6aJSfwtnpNyAXayfDNLSAwulCPX54GNpA8iosghmRuJbn+X7bRbEhzrk4lh
 xxIctBhkQWR0u0lSxvrxsYeW25S14dC2H3sylUs1FCdSoWk2QQbVbloDb99I3JbJl6LfHwzA5e9
 v7EiHmf3/FOOlgndb6zxyDqFJbycRMDP5lT0Yey8pZYDqtIqK9ilnvwEijbYP8xz++Y8GyE8Wcy
 8i5skc3dQgNKSEZgtQdNLA0i4a8PNDZsL1LobtQ8sCjlM8uNNfZrWa0xHc3quyx92tz5HknZFqr
 hYJ7ovh0IrFNBOyZ46Be29bGdsj0O0u5QYputuyfQstCvek4xtDeXJF9WCanVy+bZP/SRYziEzu
 lpFiqhWGjFfV0fjolA
X-Google-Smtp-Source: AGHT+IHRXGxdN00gjHYB/wISljDMfev6Cerd7KMtURx15FbCZW3YAN2LNQu20a90KoH33jsYry/2VQ==
X-Received: by 2002:a05:6000:2905:b0:427:9d7:8720 with SMTP id
 ffacd0b85a97d-429bd68312amr3011484f8f.24.1761919531578; 
 Fri, 31 Oct 2025 07:05:31 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f62d0sm3802771f8f.44.2025.10.31.07.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:05:31 -0700 (PDT)
Message-ID: <3975467c-3293-4e65-a729-703c7f819bad@ursulin.net>
Date: Fri, 31 Oct 2025 14:05:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] dma-buf: rework stub fence initialisation v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-3-christian.koenig@amd.com>
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
> Instead of doing this on the first call of the function just initialize
> the stub fence during kernel load.
> 
> This has the clear advantage of lower overhead and also doesn't rely on
> the ops to not be NULL any more.
> 
> v2: use correct signal function
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> ---
>   drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index cfa6ddcc1278..b229d96f551c 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   	.get_timeline_name = dma_fence_stub_get_name,
>   };
>   
> +static int __init dma_fence_init_stub(void)
> +{
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> +		       &dma_fence_stub_lock, 0, 0);
> +
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +		&dma_fence_stub.flags);
> +
> +	dma_fence_signal(&dma_fence_stub);
> +	return 0;
> +}
> +subsys_initcall(dma_fence_init_stub);
> +
>   /**
>    * dma_fence_get_stub - return a signaled fence
>    *
> - * Return a stub fence which is already signaled. The fence's
> - * timestamp corresponds to the first time after boot this
> - * function is called.
> + * Return a stub fence which is already signaled. The fence's timestamp
> + * corresponds to the initialisation time of the linux kernel.
>    */
>   struct dma_fence *dma_fence_get_stub(void)
>   {
> -	spin_lock(&dma_fence_stub_lock);
> -	if (!dma_fence_stub.ops) {
> -		dma_fence_init(&dma_fence_stub,
> -			       &dma_fence_stub_ops,
> -			       &dma_fence_stub_lock,
> -			       0, 0);
> -
> -		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -			&dma_fence_stub.flags);
> -
> -		dma_fence_signal_locked(&dma_fence_stub);
> -	}
> -	spin_unlock(&dma_fence_stub_lock);
> -
>   	return dma_fence_get(&dma_fence_stub);
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);

