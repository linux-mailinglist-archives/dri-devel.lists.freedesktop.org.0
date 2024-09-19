Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148A97CB96
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 17:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8561210E040;
	Thu, 19 Sep 2024 15:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="u9qx8ymc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4D10E040
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LjaYF2Z7w5SmD4vG50lRcgoF9Gjve69ED8MY5XqnnmA=; b=u9qx8ymcS9UCr0AQBPfuSNE+g0
 ITiUNc9P4vJpYL9d6SHPt9tm4fL6piac8lVSWFrkRuDPlWgiCLACnDcSsIb+UlgHG+BEV2IIAXfJC
 JHuCNNRNDgqPszBAxH2VFW7LpA0s4AfSyqCGEqbmHnXrOx3UZoTCkiI9spGvj4Gs3RX2mr9LGy6G9
 zBadwW8MiYVMBJJrk4dzriLsCR59Xuegiq3OVbEJxaw6kRAvXX6QPPa1hPeb0kETITwYVGuonRtwP
 ikwG2blpwLdBwyolWOkR73evTtQ/Za6W/ChGzYX86Rcgtm2JunOuM/G3QJxfzh2b9DnA3sO7ehX0F
 NrO27rJA==;
Received: from ip092042140082.rev.nessus.at ([92.42.140.82] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1srJ1w-0003ot-1F; Thu, 19 Sep 2024 17:25:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, jic23@kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH -next v2 3/3] drm/rockchip: Simplified with dev_err_probe()
Date: Thu, 19 Sep 2024 17:25:06 +0200
Message-ID: <2013930.8hb0ThOEGa@phil>
In-Reply-To: <20240827030357.1006220-4-ruanjinjie@huawei.com>
References: <20240827030357.1006220-1-ruanjinjie@huawei.com>
 <20240827030357.1006220-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Dienstag, 27. August 2024, 05:03:57 CEST schrieb Jinjie Ruan:
> Use dev_err_probe to replace deprecated() DRM_DEV_ERROR(), which
> can simplfy code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 30 +++++++++---------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 700ac730887d..92679e54c71d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c

> @@ -467,24 +465,22 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>  
>  	lvds->pins->p = devm_pinctrl_get(lvds->dev);
>  	if (IS_ERR(lvds->pins->p)) {
> -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> +		dev_err(lvds->dev, "no pinctrl handle\n");

you're mixing things here.

The commit message talks about dev_err_probe but you're doing
here and below a DRM_DEV_ERROR to dev_err conversion, which also
partially happens in patch 2 of this series.

Please structure things in a way that the patch content matches
the patch description :-)


Thanks a lot
Heiko

>  		devm_kfree(lvds->dev, lvds->pins);
>  		lvds->pins = NULL;
>  	} else {
>  		lvds->pins->default_state =
>  			pinctrl_lookup_state(lvds->pins->p, "lcdc");
>  		if (IS_ERR(lvds->pins->default_state)) {
> -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> +			dev_err(lvds->dev, "no default pinctrl state\n");
>  			devm_kfree(lvds->dev, lvds->pins);
>  			lvds->pins = NULL;
>  		}
>  	}
>  
>  	ret = clk_prepare(lvds->pclk);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(lvds->dev, ret, "failed to prepare pclk_lvds\n");
>  
>  	return 0;
>  }
> @@ -700,22 +696,18 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
>  
>  	lvds->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						    "rockchip,grf");
> -	if (IS_ERR(lvds->grf)) {
> -		DRM_DEV_ERROR(dev, "missing rockchip,grf property\n");
> -		return PTR_ERR(lvds->grf);
> -	}
> +	if (IS_ERR(lvds->grf))
> +		return dev_err_probe(dev, PTR_ERR(lvds->grf), "missing rockchip,grf property\n");
>  
>  	ret = lvds->soc_data->probe(pdev, lvds);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "Platform initialization failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Platform initialization failed\n");
>  
>  	dev_set_drvdata(dev, lvds);
>  
>  	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dev, "failed to add component\n");
> +		dev_err(dev, "failed to add component\n");
>  		clk_unprepare(lvds->pclk);
>  	}
>  
> 




