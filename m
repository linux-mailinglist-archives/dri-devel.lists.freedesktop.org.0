Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306EA3D4F11
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5C6E11F;
	Sun, 25 Jul 2021 17:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC546E11F
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:25:47 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 6205f2c7-ed6d-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 17:26:01 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0A249194B37;
 Sun, 25 Jul 2021 19:26:04 +0200 (CEST)
Date: Sun, 25 Jul 2021 19:25:43 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
Message-ID: <YP2el40V3K4R7ner@ravnborg.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-7-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-7-jagan@amarulasolutions.com>
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

On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
> Exynos DSI driver is actually a Samsung MIPI DSIM bridge
> IP which is also used in i.MX8MM platforms.
> 
> Right now the existing driver has some exynos drm specific
> code bases like te_irq, crtc and component_ops.
> 
> In order to switch this driver into a common bridge driver
> We can see 2 options to handle the exynos specific code.
> 
> A. Drop the component_ops, and rework other specifics.
>    This may lead to more foundation work as it requires
>    more changes in exynos drm drivers stack.
> 
> B. Handle the exynos specifics via driver data, and make
>    the common bridge work in different platforms and plan
>    for option A in future.
> 
> So, this patch is trying to add option B) changes to handle
> exynos specifics via driver_data.

We really should find someone that has the time, energy, knowledge and
hardware that can include device_link support once anf for all for
bridges.
Then we would avoid hacks like this.

I see no other options at the moment, but look forward for a better
solution.

	Sam


> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 99a1b8c22313..53d878d4d2d7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
>  	unsigned int wait_for_reset;
>  	unsigned int num_bits_resol;
>  	const unsigned int *reg_values;
> +	bool exynos_specific;
>  };
>  
>  struct exynos_dsi {
> @@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
>  	.reg_values = reg_values,
> +	.exynos_specific = true,
>  };
>  
>  static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> @@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
>  	.reg_values = reg_values,
> +	.exynos_specific = true,
>  };
>  
>  static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> @@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 11,
>  	.reg_values = reg_values,
> +	.exynos_specific = true,
>  };
>  
>  static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> @@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
>  	.wait_for_reset = 0,
>  	.num_bits_resol = 12,
>  	.reg_values = exynos5433_reg_values,
> +	.exynos_specific = true,
>  };
>  
>  static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> @@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
>  	.wait_for_reset = 1,
>  	.num_bits_resol = 12,
>  	.reg_values = exynos5422_reg_values,
> +	.exynos_specific = true,
>  };
>  
>  static const struct of_device_id exynos_dsi_of_match[] = {
> @@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  	 * If attached panel device is for command mode one, dsi should register
>  	 * TE interrupt handler.
>  	 */
> -	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> +	if (dsi->driver_data->exynos_specific &&
> +	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>  		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
>  		if (ret)
>  			return ret;
> @@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
> +	if (dsi->driver_data->exynos_specific)
> +		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> +					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
>  
>  	mutex_unlock(&drm->mode_config.mutex);
>  
> @@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>  	if (drm->mode_config.poll_enabled)
>  		drm_kms_helper_hotplug_event(drm);
>  
> -	exynos_dsi_unregister_te_irq(dsi);
> +	if (dsi->driver_data->exynos_specific)
> +		exynos_dsi_unregister_te_irq(dsi);
>  
>  	return 0;
>  }
> @@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (!dsi->driver_data->exynos_specific) {
> +		ret = mipi_dsi_host_register(&dsi->dsi_host);
> +		if (ret) {
> +			dev_err(dev, "failed to register mipi dsi host: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>  	platform_set_drvdata(pdev, dsi);
>  
>  	pm_runtime_enable(dev);
> @@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  
>  	drm_bridge_add(&dsi->bridge);
>  
> -	ret = component_add(dev, &exynos_dsi_component_ops);
> -	if (ret)
> -		goto err_disable_runtime;
> +	if (dsi->driver_data->exynos_specific) {
> +		ret = component_add(dev, &exynos_dsi_component_ops);
> +		if (ret)
> +			goto err_disable_runtime;
> +	}
>  
>  	return 0;
>  
> @@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> -	component_del(&pdev->dev, &exynos_dsi_component_ops);
> +	if (dsi->driver_data->exynos_specific)
> +		component_del(&pdev->dev, &exynos_dsi_component_ops);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
