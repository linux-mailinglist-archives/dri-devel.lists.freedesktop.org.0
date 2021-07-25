Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21D3D4F44
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F16E223;
	Sun, 25 Jul 2021 17:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001D96E223
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:48:42 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9608ecbc-ed70-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 17:48:57 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8B892194B1A;
 Sun, 25 Jul 2021 19:48:59 +0200 (CEST)
Date: Sun, 25 Jul 2021 19:48:38 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 16/17] drm: bridge: samsung-dsim: Fix PLL_P offset
Message-ID: <YP2j9k5SrZ2/o2/5@ravnborg.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-17-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-17-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,
On Sun, Jul 04, 2021 at 02:32:29PM +0530, Jagan Teki wrote:
> PMS_P offset value in existing driver is not compatible
> with i.MX8MM.
> 
> However the i.MX8M Mini Application Reference manual shows
> the PMS_P offset is the same in the driver, but the i.MX8MM
> downstream driver uses a different one.
> 
> So, handle the PMS_P offset via driver_data and use the
> offset value for i.MX8MM from the downstream driver.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

$subject and code speaks of PLL but the changelog says PMS.
I think the changelog needs a small update here.

	Sam

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 54767cbf231c..0ed218f5eefc 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -184,7 +184,7 @@
>  /* DSIM_PLLCTRL */
>  #define DSIM_FREQ_BAND(x)		((x) << 24)
>  #define DSIM_PLL_EN			(1 << 23)
> -#define DSIM_PLL_P(x)			((x) << 13)
> +#define DSIM_PLL_P(x, offset)		((x) << (offset))
>  #define DSIM_PLL_M(x)			((x) << 4)
>  #define DSIM_PLL_S(x)			((x) << 1)
>  
> @@ -259,6 +259,7 @@ struct samsung_dsim_driver_data {
>  	unsigned int max_freq;
>  	unsigned int wait_for_reset;
>  	unsigned int num_bits_resol;
> +	unsigned int pll_p_offset;
>  	const unsigned int *reg_values;
>  	bool exynos_specific;
>  };
> @@ -487,6 +488,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>  	.max_freq = 1000,
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
> +	.pll_p_offset = 13,
>  	.reg_values = reg_values,
>  	.exynos_specific = true,
>  };
> @@ -500,6 +502,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
>  	.max_freq = 1000,
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
> +	.pll_p_offset = 13,
>  	.reg_values = reg_values,
>  	.exynos_specific = true,
>  };
> @@ -511,6 +514,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
>  	.max_freq = 1000,
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
> +	.pll_p_offset = 13,
>  	.reg_values = reg_values,
>  	.exynos_specific = true,
>  };
> @@ -523,6 +527,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
>  	.max_freq = 1500,
>  	.wait_for_reset = 0,
>  	.num_bits_resol = 12,
> +	.pll_p_offset = 13,
>  	.reg_values = exynos5433_reg_values,
>  	.exynos_specific = true,
>  };
> @@ -535,6 +540,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
>  	.max_freq = 1500,
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 12,
> +	.pll_p_offset = 13,
>  	.reg_values = exynos5422_reg_values,
>  	.exynos_specific = true,
>  };
> @@ -547,6 +553,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
>  	.max_freq = 2100,
>  	.wait_for_reset = 0,
>  	.num_bits_resol = 12,
> +	.pll_p_offset = 14,
>  	.reg_values = imx8mm_dsim_reg_values,
>  };
>  
> @@ -662,7 +669,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>  	writel(driver_data->reg_values[PLL_TIMER],
>  			dsi->reg_base + driver_data->plltmr_reg);
>  
> -	reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
> +	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
> +	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
>  
>  	if (driver_data->has_freqband) {
>  		static const unsigned long freq_bands[] = {
> -- 
> 2.25.1
