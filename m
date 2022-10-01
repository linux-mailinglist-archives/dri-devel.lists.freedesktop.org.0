Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9178C5F1D76
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367010E470;
	Sat,  1 Oct 2022 16:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Sat, 01 Oct 2022 16:09:04 UTC
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B956D10E0D0;
 Sat,  1 Oct 2022 16:09:04 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C85FB1F96A;
 Sat,  1 Oct 2022 18:00:55 +0200 (CEST)
Date: Sat, 1 Oct 2022 18:00:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Message-ID: <20221001160054.gmrlnjvdwyn5ttzw@SoMainline.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-24 15:19:00, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> The QCM2290 SoC a the 14nm (V2.0) single DSI phy. The platform is not
> fully compatible with the standard 14nm PHY, so it requires a separate
> compatible and config entry.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [DB: rebased and updated commit msg]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7fc0975cb869..ee6051367679 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -549,6 +549,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
>  	{ .compatible = "qcom,dsi-phy-14nm",
>  	  .data = &dsi_phy_14nm_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-2290",
> +	  .data = &dsi_phy_14nm_2290_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-660",
>  	  .data = &dsi_phy_14nm_660_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-8953",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 60a99c6525b2..1096afedd616 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -50,6 +50,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;

following alphabetical sorting (same as the other locations in this
series), this should be above 660?

>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 0f8f4ca46429..9f488adea7f5 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1081,3 +1081,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>  	.io_start = { 0x1a94400, 0x1a96400 },
>  	.num_dsi_phy = 2,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_14nm_17mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0x5e94400 },

For sm6125 we also need this exact io_start (and a single PHY), do you
think it makes sense to add a compatible that reuses the same struct (I
can do that in a folloup patch) and/or generalize this struct (name)?

However, our regulator setup appears to be different.  I recall not
finding any `vcca` supply in my downstream sources, and had this in my
notes for a similar dsi_phy_14nm.c patch:

    sm6125 uses an RPM regulator

https://github.com/sonyxperiadev/kernel/blob/f956fbd9a234033bd18234d456a2c32c126b38f3/arch/arm64/boot/dts/qcom/trinket-sde.dtsi#L388

- Marijn

> +	.num_dsi_phy = 1,
> +};
> -- 
> 2.35.1
> 
