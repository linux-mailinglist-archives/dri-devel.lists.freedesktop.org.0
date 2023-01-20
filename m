Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FD767507F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE2410E0E4;
	Fri, 20 Jan 2023 09:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446710E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:16:55 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pInVs-00022D-Ic; Fri, 20 Jan 2023 10:16:44 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pInVp-0004z4-60; Fri, 20 Jan 2023 10:16:41 +0100
Date: Fri, 20 Jan 2023 10:16:41 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Alibek Omarov <a1ba.omarov@gmail.com>
Subject: Re: [PATCH 1/3] drm/rockchip: lvds: add rk3568 support
Message-ID: <20230120091641.GL24755@pengutronix.de>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
 <20230119184807.171132-2-a1ba.omarov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119184807.171132-2-a1ba.omarov@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, dri-devel@lists.freedesktop.org,
 macromorgan@hotmail.com, Sandy Huang <hjc@rock-chips.com>,
 alexander.sverdlin@siemens.com, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 09:48:03PM +0300, Alibek Omarov wrote:
> One of the ports of RK3568 can be configured as LVDS, re-using the DSI DPHY
> 
> Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 144 +++++++++++++++++++++--
>  drivers/gpu/drm/rockchip/rockchip_lvds.h |  10 ++
>  2 files changed, 147 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 68f6ebb33460..83c60240af85 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -433,6 +433,90 @@ static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
>  	drm_panel_unprepare(lvds->panel);
>  }
>  
> +static int rk3568_lvds_poweron(struct rockchip_lvds *lvds)
> +{
> +	int ret;
> +
> +	ret = clk_enable(lvds->pclk);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to enable lvds pclk %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pm_runtime_get_sync(lvds->dev);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
> +		clk_disable(lvds->pclk);
> +		return ret;
> +	}
> +
> +	/* Enable LVDS mode */
> +	return regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
> +				  RK3568_LVDS0_MODE_EN(1),
> +				  RK3568_LVDS0_MODE_EN(1));

Isn't this the same as:

	regmap_write(lvds->grf, RK3568_GRF_VO_CON2, RK3568_LVDS0_MODE_EN(1));

Unless I am missing something I find a plain regmap_write() easier to
read.

> +}
> +
> +static void rk3568_lvds_poweroff(struct rockchip_lvds *lvds)
> +{
> +	regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
> +			   RK3568_LVDS0_MODE_EN(1) | RK3568_LVDS0_P2S_EN(1),
> +			   RK3568_LVDS0_MODE_EN(0) | RK3568_LVDS0_P2S_EN(0));

Same here:

	regmap_write(lvds->grf, RK3568_GRF_VO_CON2,
		     RK3568_LVDS0_MODE_EN(0) | RK3568_LVDS0_P2S_EN(0));

What about the RK3568_LVDS0_P2S_EN bit? This is set in probe() and
cleared here. For symmetry reasons shouldn't it be set in
rk3568_lvds_poweron() instead?

> +
> +	pm_runtime_put(lvds->dev);
> +	clk_disable(lvds->pclk);
> +}
> +
> +static int rk3568_lvds_grf_config(struct drm_encoder *encoder,
> +				struct drm_display_mode *mode)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +
> +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> +			      lvds->output);
> +		return -EINVAL;
> +	}
> +
> +	/* Set format */
> +	return regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON0,
> +				  RK3568_LVDS0_SELECT(3),
> +				  RK3568_LVDS0_SELECT(lvds->format));

It seems lvds->format does not match what the register expects. We
have:

#define LVDS_VESA_24                            0
#define LVDS_JEIDA_24                           1
#define LVDS_VESA_18                            2
#define LVDS_JEIDA_18                           3

According to the reference manual the register expects:

lvdsformat_lvds0_select
 2'b00: VESA 24bit
 2'b01: JEIDA 24bit
 2'b10: JEIDA 18bit
 2'b11: VESA 18bit

I only have the RK3568 manual but no PX30 or RK3288 manual, so I can't say if
they changed the register mapping between the SoCs or if it's wrong on
the other SoCs as well.

BTW you correctly set the mask to RK3568_LVDS0_SELECT(3), but for the
PX30 it looks wrong:

	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
				  PX30_LVDS_FORMAT(lvds->format),
				  PX30_LVDS_FORMAT(lvds->format));

I really think regmap_write() would be better to use here to avoid such
things.

> +
> +static void rk3568_lvds_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;

'mode' is unused.

> +	int ret;
> +
> +	drm_panel_prepare(lvds->panel);
> +
> +	ret = rk3568_lvds_poweron(lvds);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
> +		drm_panel_unprepare(lvds->panel);
> +		return;
> +	}
> +
> +	ret = rk3568_lvds_grf_config(encoder, mode);
> +	if (ret) {
> +		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
> +		drm_panel_unprepare(lvds->panel);
> +		return;
> +	}
> +
> +	drm_panel_enable(lvds->panel);
> +}
> +
> +static void rk3568_lvds_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +
> +	drm_panel_disable(lvds->panel);
> +	rk3568_lvds_poweroff(lvds);
> +	drm_panel_unprepare(lvds->panel);
> +}
> +
>  static const
>  struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
>  	.enable = rk3288_lvds_encoder_enable,
> @@ -447,6 +531,13 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
>  	.atomic_check = rockchip_lvds_encoder_atomic_check,
>  };
>  
> +static const
> +struct drm_encoder_helper_funcs rk3568_lvds_encoder_helper_funcs = {
> +	.enable = rk3568_lvds_encoder_enable,
> +	.disable = rk3568_lvds_encoder_disable,
> +	.atomic_check = rockchip_lvds_encoder_atomic_check,
> +};
> +
>  static int rk3288_lvds_probe(struct platform_device *pdev,
>  			     struct rockchip_lvds *lvds)
>  {
> @@ -491,6 +582,26 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int rockchip_lvds_phy_probe(struct platform_device *pdev,
> +				   struct rockchip_lvds *lvds)
> +{
> +	int ret;
> +
> +	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
> +	if (IS_ERR(lvds->dphy))
> +		return PTR_ERR(lvds->dphy);
> +
> +	ret = phy_init(lvds->dphy);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
> +	if (ret)
> +		return ret;
> +
> +	return phy_power_on(lvds->dphy);
> +}

You factor out the steps done for px30 to a separate function in order
to reuse it on rk3568. You could make a separate patch from this to
make it easier to understand and to verify that there is no functional
change involved for the px30.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
