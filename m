Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDA41F119
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BDC6EE24;
	Fri,  1 Oct 2021 15:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F4D6EE17
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:20:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g41so39857436lfv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a42zKH2Tz1xdsd82BNyM3/JzMce4gdtbfSOE4DnvM4I=;
 b=gDvlAQfOEYKry6coVGHJcy7BwGm89sWKXZ10vwTmBlanwHmjpzrbSWRyesPq7+unE+
 4e62mIX3xbLm+SvW2iXv8SXV9qXyfmFo0LBN11KC0bApcC3faYsj02W9yAxZKKZ7122Z
 ixBcnqsN3KNraq8bpfs18/Gie9xSbXbxyZ+pU+64XGRdqntqmWnlVDrjMxl9FunijN0K
 K6OWwFzP6ie948y/GBQo9DfbqrLCZOtlrGTNoV6MVMj8Bqbyws0WhmAvBaL5PkyYIrXP
 zNxQyxJbuZ3MIFTTZA7TqXnTGyRXVt2VdO0GqvmRMc1/WTfdonQ2wjrRskWiAz+9L2MU
 vpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a42zKH2Tz1xdsd82BNyM3/JzMce4gdtbfSOE4DnvM4I=;
 b=0xPkddAg9Vd0JXzD/cJ19jgHKxwLzxaRy/1EMqtTPkHjsTPQOiAM3AtqBZcI8i6Slq
 /ZXqvsf1fMjdUkc2QmyEQU9Vj8ERRXg6KxMT95kY5/WC1Gq8CK8qVULDIUZW0zmIv+hy
 as+mVigP0PcfL8mf7FCIuebYLYj8kcqayHR+rbvlJradcKsYvPFqAtVsJdzAmujuDXjV
 4f/FMpct1sPJiWLfLRYwD2Ba/Tx4PlUZXmgtO3pA9kSdrsEf32zf5mAN7JzylOrJlcZX
 jFugKhx8wGYgg3I2F9v/TwU2Entab73F4zw4k5oU+Tlw8GXFsRcDSev2rCFIgo9nubdc
 fpYQ==
X-Gm-Message-State: AOAM532qdEc/gLbIz+ts/rBFUI5uN0NAK6CSqqB3Zym/e3I3/JAVjwJn
 5M/brjDthCzkpN+4ZDytj18tlA==
X-Google-Smtp-Source: ABdhPJz5R8MadhnX8c6ibjK+02JQ4SKsSiXQURM7ZiOQIwjYP/d6zBf1bDX35CC2Hl/Bk+LtwFrhtA==
X-Received: by 2002:a05:651c:1790:: with SMTP id
 bn16mr12325475ljb.457.1633101652679; 
 Fri, 01 Oct 2021 08:20:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j16sm212083lfk.257.2021.10.01.08.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 08:20:52 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: Fix some reference counted resource leaks
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, abhinavk@codeaurora.org,
 hali@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <f15bc57648a00e7c99f943903468a04639d50596.1628241097.git.christophe.jaillet@wanadoo.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <9ea0857b-fca5-3011-6ebb-3ff6173ac037@linaro.org>
Date: Fri, 1 Oct 2021 18:20:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f15bc57648a00e7c99f943903468a04639d50596.1628241097.git.christophe.jaillet@wanadoo.fr>
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

On 06/08/2021 12:15, Christophe JAILLET wrote:
> 'of_find_device_by_node()' takes a reference that must be released when
> not needed anymore.
> This is expected to be done in 'dsi_destroy()'.
> 
> However, there are 2 issues in 'dsi_get_phy()'.
> 
> First, if 'of_find_device_by_node()' succeeds but 'platform_get_drvdata()'
> returns NULL, 'msm_dsi->phy_dev' will still be NULL, and the reference
> won't be released in 'dsi_destroy()'.
> 
> Secondly, as 'of_find_device_by_node()' already takes a reference, there is
> no need for an additional 'get_device()'.
> 
> Move the assignment to 'msm_dsi->phy_dev' a few lines above and remove the
> unneeded 'get_device()' to solve both issues.
> 
> Fixes: ec31abf6684e ("drm/msm/dsi: Separate PHY to another platform device")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Review carefully, management of reference counted resources is sometimes
> tricky.
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 75afc12a7b25..29d11f1cb79b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -26,8 +26,10 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   	}
>   
>   	phy_pdev = of_find_device_by_node(phy_node);
> -	if (phy_pdev)
> +	if (phy_pdev) {
>   		msm_dsi->phy = platform_get_drvdata(phy_pdev);
> +		msm_dsi->phy_dev = &phy_pdev->dev;
> +	}
>   
>   	of_node_put(phy_node);
>   
> @@ -36,8 +38,6 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>   		return -EPROBE_DEFER;
>   	}
>   
> -	msm_dsi->phy_dev = get_device(&phy_pdev->dev);
> -
>   	return 0;
>   }
>   
> 


-- 
With best wishes
Dmitry
