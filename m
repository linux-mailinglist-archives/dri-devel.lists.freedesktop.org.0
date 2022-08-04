Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064C5895E3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 04:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2C10E185;
	Thu,  4 Aug 2022 02:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217218B473;
 Thu,  4 Aug 2022 02:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659579204; x=1691115204;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4LB/hGOmYOQt5bVDB3FrVwMkoBf7B/+WD4KUV6twbdI=;
 b=UPBo2hRZe71IWeNXgxtFDPDqqeg18SK50hmYUkI2aS7zfTOqTpKc9K7e
 +tdxiKr5Le+a5vPCVqTg9eFnRn9MPNF2i+RIes56OVkcpJmeVnWq6/1fP
 zm9oJgsXPuLr+8cYLpM8z45TMgQRgt/k3YhyOH9mUxR0H0fvn+5G7thWP w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Aug 2022 19:13:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 19:13:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 19:13:22 -0700
Received: from [10.38.247.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 19:13:18 -0700
Message-ID: <45695061-8a8c-8d49-7728-93aa4323a60b@quicinc.com>
Date: Wed, 3 Aug 2022 19:13:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: Improve dsi_phy_driver_probe() probe
 error handling
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.6.I969118a35934a0e5007fe4f80e3e28e9c0b7602a@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220802153434.v3.6.I969118a35934a0e5007fe4f80e3e28e9c0b7602a@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2022 3:37 PM, Douglas Anderson wrote:
> The dsi_phy_driver_probe() function has a "goto fail" for no
> reason. Change it to just always return directly when it sees an
> error. Make this simpler by leveraging dev_err_probe() which is
> designed to make code like this shorter / simpler.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Yes, apart from Dmitry's suggestion of updating the commit text about 
the return value change, this is:

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes in v3:
> - ("Improve dsi_phy_driver_probe() probe error handling") new for v3.
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 74 ++++++++++-----------------
>   1 file changed, 27 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 0a00f9b73fc5..57cd525de7a1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -621,12 +621,9 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   	phy->pdev = pdev;
>   
>   	phy->id = dsi_phy_get_id(phy);
> -	if (phy->id < 0) {
> -		ret = phy->id;
> -		DRM_DEV_ERROR(dev, "%s: couldn't identify PHY index, %d\n",
> -			__func__, ret);
> -		goto fail;
> -	}
> +	if (phy->id < 0)
> +		return dev_err_probe(dev, phy->id,
> +				     "Couldn't identify PHY index\n");
>   
>   	phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>   				"qcom,dsi-phy-regulator-ldo-mode");
> @@ -634,88 +631,71 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
>   
>   	phy->base = msm_ioremap_size(pdev, "dsi_phy", &phy->base_size);
> -	if (IS_ERR(phy->base)) {
> -		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> +	if (IS_ERR(phy->base))
> +		return dev_err_probe(dev, PTR_ERR(phy->base),
> +				     "Failed to map phy base\n");
>   
>   	phy->pll_base = msm_ioremap_size(pdev, "dsi_pll", &phy->pll_size);
> -	if (IS_ERR(phy->pll_base)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map pll base\n", __func__);
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> +	if (IS_ERR(phy->pll_base))
> +		return dev_err_probe(dev, PTR_ERR(phy->pll_base),
> +				     "Failed to map pll base\n");
>   
>   	if (phy->cfg->has_phy_lane) {
>   		phy->lane_base = msm_ioremap_size(pdev, "dsi_phy_lane", &phy->lane_size);
> -		if (IS_ERR(phy->lane_base)) {
> -			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", __func__);
> -			ret = -ENOMEM;
> -			goto fail;
> -		}
> +		if (IS_ERR(phy->lane_base))
> +			return dev_err_probe(dev, PTR_ERR(phy->lane_base),
> +					     "Failed to map phy lane base\n");
>   	}
>   
>   	if (phy->cfg->has_phy_regulator) {
>   		phy->reg_base = msm_ioremap_size(pdev, "dsi_phy_regulator", &phy->reg_size);
> -		if (IS_ERR(phy->reg_base)) {
> -			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n", __func__);
> -			ret = -ENOMEM;
> -			goto fail;
> -		}
> +		if (IS_ERR(phy->reg_base))
> +			return dev_err_probe(dev, PTR_ERR(phy->reg_base),
> +					     "Failed to map phy regulator base\n");
>   	}
>   
>   	if (phy->cfg->ops.parse_dt_properties) {
>   		ret = phy->cfg->ops.parse_dt_properties(phy);
>   		if (ret)
> -			goto fail;
> +			return ret;
>   	}
>   
>   	ret = devm_regulator_bulk_get_const(dev, phy->cfg->num_regulators,
>   					    phy->cfg->regulator_data,
>   					    &phy->supplies);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	phy->ahb_clk = msm_clk_get(pdev, "iface");
> -	if (IS_ERR(phy->ahb_clk)) {
> -		DRM_DEV_ERROR(dev, "%s: Unable to get ahb clk\n", __func__);
> -		ret = PTR_ERR(phy->ahb_clk);
> -		goto fail;
> -	}
> +	if (IS_ERR(phy->ahb_clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
> +				     "Unable to get ahb clk\n");
>   
>   	/* PLL init will call into clk_register which requires
>   	 * register access, so we need to enable power and ahb clock.
>   	 */
>   	ret = dsi_phy_enable_resource(phy);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	if (phy->cfg->ops.pll_init) {
>   		ret = phy->cfg->ops.pll_init(phy);
> -		if (ret) {
> -			DRM_DEV_INFO(dev,
> -				"%s: pll init failed: %d, need separate pll clk driver\n",
> -				__func__, ret);
> -			goto fail;
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "PLL init failed; need separate clk driver\n");
>   	}
>   
>   	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>   				     phy->provided_clocks);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
> -		goto fail;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register clk provider\n");
>   
>   	dsi_phy_disable_resource(phy);
>   
>   	platform_set_drvdata(pdev, phy);
>   
>   	return 0;
> -
> -fail:
> -	return ret;
>   }
>   
>   static struct platform_driver dsi_phy_platform_driver = {
