Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30CC3C2104
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5571C6E9E9;
	Fri,  9 Jul 2021 08:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBBB6E9E9;
 Fri,  9 Jul 2021 08:48:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i8so11060118wrp.12;
 Fri, 09 Jul 2021 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IZL0RVebz80UhYvt3lSs/13NdKZ7rvbA0Dgs8MSvPlE=;
 b=RT+nT75XXn1A6UM9rOVB6Kz2RVgz3n5U0CvgOh0rOu+q6OA0i00dY6wIZBxyRgqsCc
 B5qFXe+9g5Xa8l8Pf1uDWOd/Zpm2m2UpVtYU3k+zeb+rLwH7yvuPWWpHYnqlmKC7NyEO
 5nicIm7miH2DS4TY4k0B6y5aHI/G06AxjUQAsHN64noXhXhGKBK6l4SU/Yvkoq2AywNq
 f0IJ+/F4NCJlyDifd2ZJtb9Zt/owkE4DIneghpIzq6qs6MiXgiUlxjvdjCO8AyjIvEN/
 7aFMK0pgLmDceWNgQCI2AkEUuPBX0gf51Tf+Eq7a8XrTEevBP3zgZ3PWZ8e59p+Lbxon
 7O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IZL0RVebz80UhYvt3lSs/13NdKZ7rvbA0Dgs8MSvPlE=;
 b=A7UWGKo+kLtJmQzhD88E2xwz3cU/D8xX2Ow/dB7jUy33Jx+mrZ4wB/mHwqDNV2tzCT
 ewrNLvkf2IByexEGQJvoeH1RoWiBV9s1f1slgE+ktKHwHdw/sOZ2rmpEeVdFgRLfxlfi
 gGOgDkQFayzX7rKx8/ex4B1uGijCsFoBBMmg1Fcyd/qS2zacKdDxVCGazt4xsdcwRxl2
 ju3l37DHZ0kkoZ2KaJIgkgFfP/+yrriStWxtqn4DG2//pKC+K5r2qQSg1Mz+nMgnBbya
 WBeGElrE7q7RCk4cBsuVU+/ZxNMiZwHobbWdyjlzsm+G+3nn5+Q5avOYMduiIdm129S6
 j3Gw==
X-Gm-Message-State: AOAM530N18OhHBOXH3wTARmrqwRtSHkJzJAC20bcSg6BnYIsMHiq/4Cv
 wu4Pci/bINwOC1LLtxy9vn80NT/68AA=
X-Google-Smtp-Source: ABdhPJw4mHIMxmdUHqgbxfgmtWlqsE/jVJZcU3x3yckdnN/So3mD/rTfyth1ESMDLG3RizM9EnUchQ==
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr39867826wrs.45.1625820515276; 
 Fri, 09 Jul 2021 01:48:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3da0:55de:64af:96f9?
 ([2a02:908:1252:fb60:3da0:55de:64af:96f9])
 by smtp.gmail.com with ESMTPSA id s7sm4623429wrp.97.2021.07.09.01.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 01:48:34 -0700 (PDT)
Subject: Re: [PATCH v3 16/20] drm/msm: always wait for the exclusive fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2582129c-b0c3-831c-a3b4-caa51be95095@gmail.com>
Date: Fri, 9 Jul 2021 10:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>
> Drivers also need to to sync to the exclusive fence when
> a shared one is present.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> [danvet: Not that hard to compile-test on arm ...]
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Wondering a bit why you have that in this patch set now.

But any objections that we push this now?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 141178754231..d9c4f1deeafb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>   	struct dma_fence *fence;
>   	int i, ret;
>   
> -	fobj = dma_resv_shared_list(obj->resv);
> -	if (!fobj || (fobj->shared_count == 0)) {
> -		fence = dma_resv_excl_fence(obj->resv);
> -		/* don't need to wait on our own fences, since ring is fifo */
> -		if (fence && (fence->context != fctx->context)) {
> -			ret = dma_fence_wait(fence, true);
> -			if (ret)
> -				return ret;
> -		}
> +	fence = dma_resv_excl_fence(obj->resv);
> +	/* don't need to wait on our own fences, since ring is fifo */
> +	if (fence && (fence->context != fctx->context)) {
> +		ret = dma_fence_wait(fence, true);
> +		if (ret)
> +			return ret;
>   	}
>   
> +	fobj = dma_resv_shared_list(obj->resv);
>   	if (!exclusive || !fobj)
>   		return 0;
>   

