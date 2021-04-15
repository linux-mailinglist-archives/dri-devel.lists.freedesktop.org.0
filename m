Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364C3606D5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 12:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33A6E165;
	Thu, 15 Apr 2021 10:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF36E165
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 10:12:13 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r8so38179468lfp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
 b=L4fOI3m5jedVmkoFqF4OMT0LKDappFVqesZYHY7CyLNRuknzo5hrAxbWLpeGBofHFn
 Kgi0cDatOkL0X14/u+gkYo0Sh4vlxHKlBWQaxNeOJ+GXhl2tfO0H2GiMYt3fa4Kq5CNK
 KtMdewT7N/e18vas4p77Xz9KempXtugzcD2n3d+1GKgWMuikghC5X7qXiO2hndzROTkl
 AbyGXbKsJZfKp3DuECU0TkgNr9AarbWV2v3aY+Gu508bQ8OnJwnBNbY6zNs9V5vUnRKq
 lfBwkYiaA7oTAFACrnnz4TpJpz1Kc2GsRFtI1wFHdA4wVfQYX7USAonbG5wtxlSu96/z
 5Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Itx3xIB4vBXowgO5rVjeZp8XNY2n0XOetykFhl9hWow=;
 b=kM4H6/s+31ehsQnfcIYeGMNJOy1HOqDMGnbRC8fNcx8zcTTL6ArILYsqKVMhYsZT5P
 xRdfpImN6AmOameeirz40/3ZZuJt0jiD+n0JP/hadTTU61eQUwhBhlE9jrRj0N4/+BGg
 /jIDUJqxtUcAyo4P31KmFUnEc/OL+WM4/2NT64QUEuCgg5u6VchRSx2yFKNiiKfRk9QT
 KA7gi7GYYmF0M7+iOLPhovclf7K74neMaBkl3tcKz667durQ1OMkWv/ku+hbbNxUkqdG
 TRl3EgHmENnHu8ZnrXcRUHgPycDIrrR2/rlmHFmWk8gXr0gTQmsYA8RiPvFP0sLuDkRk
 wBpg==
X-Gm-Message-State: AOAM5339DfQuNHVGGw1SmdE2RX/4ugkegsbfIXOuxmOKNJwsxKmSldR2
 dpvxSwnP+ogMD7IedVEWmUtV7A==
X-Google-Smtp-Source: ABdhPJyD6Rs7jiUdmupgDiq3XJMVdCt6DZ+cyVt1/xewJXMALCuiphmTOBBn8HXbou8s2wx72Ft2Cw==
X-Received: by 2002:a05:6512:3ba9:: with SMTP id
 g41mr2115337lfv.38.1618481532082; 
 Thu, 15 Apr 2021 03:12:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c23sm623400lfc.300.2021.04.15.03.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 03:12:11 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Message-ID: <b752d929-7f8c-6396-85a3-6b32c77121ca@linaro.org>
Date: Thu, 15 Apr 2021 13:12:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Content-Language: en-GB
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 12/04/2021 03:01, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I wanted to ping/remind regarding this patch and regarding 
https://lore.kernel.org/linux-arm-msm/20210410011901.1735866-1-dmitry.baryshkov@linaro.org/

It would be great to get those two fixes in linux-next or early during 
5.14 cycle.

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
