Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983F4FAF85
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 20:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFDA10F361;
	Sun, 10 Apr 2022 18:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59AC10F361
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 18:06:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5219482;
 Sun, 10 Apr 2022 20:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649614014;
 bh=hkAl9FJL0m0CC6Dn+TSgiJdKgnk3FN4CM8GEUFG/SNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RfKLl31cZXoa/3qnyLYeIirbPUb6OaWSRMaUoBEtjgonBupqzpNM/PSuodsFc2hrO
 Zkuf1JLuG9afoiKb6XSvsDp564G0HT58CAy1u8RYj7eqCxNokhgZIN9P0Q8GIhUV6d
 ki1JhMWuBJnwNY1PbC6k0ZD3JtU/ftJRvZlU5rLQ=
Date: Sun, 10 Apr 2022 21:06:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 11/11] drm: bridge: samsung-dsim: Add i.MX8MM support
Message-ID: <YlMcu2e2FdLRk5iP@pendragon.ideasonboard.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-12-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220408162108.184583-12-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Fri, Apr 08, 2022 at 09:51:08PM +0530, Jagan Teki wrote:
> Samsung MIPI DSIM master can also be found in i.MX8MM SoC.
> 
> Add compatible and associated driver_data for it.
> 
> v1:
> * none
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 34 +++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 71bbaf19f530..d91510a51981 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -360,6 +360,24 @@ static const unsigned int exynos5433_reg_values[] = {
>  	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
>  };
>  
> +static const unsigned int imx8mm_dsim_reg_values[] = {
> +	[RESET_TYPE] = DSIM_SWRST,
> +	[PLL_TIMER] = 500,
> +	[STOP_STATE_CNT] = 0xf,
> +	[PHYCTRL_ULPS_EXIT] = 0,
> +	[PHYCTRL_VREG_LP] = 0,
> +	[PHYCTRL_SLEW_UP] = 0,
> +	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
> +	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
> +	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
> +	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x26),
> +	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
> +	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
> +	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x08),
> +	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
> +	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
> +};

Most of these values don't seem to be specific to a particular SoC
integration, but should be tuned for the board and the connected DSI
sink. That's out of scope for this patch of course.

> +
>  static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>  	.reg_ofs = exynos_reg_ofs,
>  	.plltmr_reg = 0x50,
> @@ -426,6 +444,18 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
>  	.platform_init = true,
>  };
>  
> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
> +	.reg_ofs = exynos5433_reg_ofs,
> +	.plltmr_reg = 0xa0,
> +	.has_clklane_stop = 1,
> +	.num_clks = 2,
> +	.max_freq = 2100,
> +	.wait_for_reset = 0,
> +	.num_bits_resol = 12,
> +	.pll_p_offset = 14,
> +	.reg_values = imx8mm_dsim_reg_values,
> +};

I haven't verified the values, the rest looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  static const struct of_device_id samsung_dsim_of_match[] = {
>  	{
>  		.compatible = "samsung,exynos3250-mipi-dsi",
> @@ -447,6 +477,10 @@ static const struct of_device_id samsung_dsim_of_match[] = {
>  		.compatible = "samsung,exynos5433-mipi-dsi",
>  		.data = &exynos5433_dsi_driver_data
>  	},
> +	{
> +		.compatible = "fsl,imx8mm-mipi-dsim",
> +		.data = &imx8mm_dsi_driver_data
> +	},
>  	{ /* sentinel. */ }
>  };
>  

-- 
Regards,

Laurent Pinchart
