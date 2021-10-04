Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9C421AB2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53A6EAB8;
	Mon,  4 Oct 2021 23:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC7F6E991
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:32:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y23so39069535lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 16:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bRhtxMYNMMjc9yrBuvHKCrG43c9/TrL576pC79Lp13I=;
 b=T+J+9aMQB2c8kMQ038lJ7lSxDX7Y9PFtHfxEl9IavvNrhWjgeE5e0mjRJz/XLRcu8c
 CPdf1ojrTl5YfjtTqTPWctgpZnLGhgStRTbZjP+ZV89Yohzu2AfX4lxrWLipVgILEfmU
 WyHNcGYu1RDSGJicYqsR+1KAVEIlJqYBQJaQI95Ic0ZWtz8mc1Ha8SXlioutst/iqeWF
 NvDCidcpkWcjQqNgGjHWXZCcGVf6fvrHGV7nHsh0I6m98ZXUeb5XiePlwtYV8MEBWmau
 jaNqYsdohaYkUs70lJTx5Mdhs/S8qvrJzpcOhtqGFQbqyGi6l/HYy1D+MRJSgi/B0Q6I
 7UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bRhtxMYNMMjc9yrBuvHKCrG43c9/TrL576pC79Lp13I=;
 b=Pxyt7rK9TLpAm8JCIQ/ekz8zJFgGbpqi07N6d17vXS3EqB3oZt0reBD1VUGMznQCZz
 7pA5jpVanLJwldz1bTXBtJR5JS2NiblGo802dIN79tEnkmPTK/Br4K3p1tjwNg2ffa89
 0QB4aZh+9okR7ulMeDgToU8+2/rwE39tAfeEtJXVgXjPxsPXUqsCwQoTFcb9eQZcap3H
 OawGMocnM1GH9ORksUWFobR5UeeFf7efGfXi/oxeXkjXa9mVq0CagHvGBNQs+2YBX+tB
 71ci10WJF+HDwi5tXR9W59K82wJZ3QXZvzFxwHCNcrn1zhM3sk3D1gxRRnrb/ohsf8BC
 VCcA==
X-Gm-Message-State: AOAM532nVWc3n/m1ZhLlBY6PBTlhzH53Wmt8D1IJVtgtFdnzKUHFJeF4
 5GJxJZQPtRvI1e7vqbgHS34NfA==
X-Google-Smtp-Source: ABdhPJx5D/0n9bCdRZ6aBhCGktRui4qXKFbgegybOF3Sj14vtcmlOuuhd7iE1kVwVh/00ITVLlYoDg==
X-Received: by 2002:a05:6512:3181:: with SMTP id
 i1mr3328077lfe.29.1633390374526; 
 Mon, 04 Oct 2021 16:32:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o23sm1727765lfc.172.2021.10.04.16.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 16:32:54 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
References: <20211004134530.GB11689@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1f99aa52-c781-05ee-6310-0cb0f9ec4782@linaro.org>
Date: Tue, 5 Oct 2021 02:32:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004134530.GB11689@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 04/10/2021 16:45, Dan Carpenter wrote:
> There are two problems here:
> 1) The "seqptr" is used uninitalized when we free it at the end.

This looks like a nice catch, potentially causing troubles.

> 2) The a6xx_gmu_get_mmio() function returns error pointers.  It never
>     returns true.
> 
> Fixes: 64245fc55172 ("drm/msm/a6xx: use AOP-initialized PDC for a650")
> Fixes: f8fc924e088e ("drm/msm/a6xx: Fix PDC register overlap")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index a7c58018959f..3bd6e579ea89 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -512,11 +512,11 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>   	struct platform_device *pdev = to_platform_device(gmu->dev);
>   	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
> -	void __iomem *seqptr;
> +	void __iomem *seqptr = NULL;
>   	uint32_t pdc_address_offset;
>   	bool pdc_in_aop = false;
>   
> -	if (!pdcptr)
> +	if (IS_ERR(pdcptr))
>   		goto err;
>   
>   	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> @@ -528,7 +528,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   
>   	if (!pdc_in_aop) {
>   		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> -		if (!seqptr)
> +		if (IS_ERR(seqptr))
>   			goto err;
>   	}
>   
> 


-- 
With best wishes
Dmitry
