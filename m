Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1542C81FA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E46E448;
	Mon, 30 Nov 2020 10:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B16E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:18:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CC1B97E;
 Mon, 30 Nov 2020 11:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606731528;
 bh=a0D7kBgw7JeqJVVMxygLX2c0svrKt+fN0h9JY0Cuqpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7lpXwKq18+c8edcsS4QfK8+ndY55Y0bHadANyXV7wzLGacRJ4bhSf+vN3c5UaXJZ
 l5Xlx1XYfXBAQodYDEt/tq/ZaRXA/w6vgR75fnjjVQ5MvCDd5ojjjZ2kWhCzs2vk/W
 TYjzsTikpjD/PtawkpAEeLk6VlFPVc7Z39d69970=
Date: Mon, 30 Nov 2020 12:18:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH RESEND v3 2/2] drm/bridge: display-connector: add DP
 support
Message-ID: <20201130101839.GQ4141@pendragon.ideasonboard.com>
References: <20201124071155.76868-1-tomi.valkeinen@ti.com>
 <20201124071155.76868-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124071155.76868-3-tomi.valkeinen@ti.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 09:11:55AM +0200, Tomi Valkeinen wrote:
> Add DP support to display-connector driver. The driver will support HPD
> via a GPIO and DP PWR.
> 
> DP PWR will be enabled at probe, which is not optimal, but I'm not sure
> what would be a good place to enable and disable DP PWR. Perhaps
> attach/detach, but I don't know if enabling HW is something that attach
> is supposed to do.
> 
> In any case, I don't think there's much difference in power consumption
> between the version in this patch and enabling the regulator later: if
> the driver probes, supposedly it will attach very soon afterwards, and
> we need to enable the DP PWR as soon as possible.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 46 +++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 4d278573cdb9..04362feccd75 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_edid.h>
> @@ -20,6 +21,8 @@ struct display_connector {
>  
>  	struct gpio_desc	*hpd_gpio;
>  	int			hpd_irq;
> +
> +	struct regulator	*dp_pwr;
>  };
>  
>  static inline struct display_connector *
> @@ -172,11 +175,12 @@ static int display_connector_probe(struct platform_device *pdev)
>  	of_property_read_string(pdev->dev.of_node, "label", &label);
>  
>  	/*
> -	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
> +	 * Get the HPD GPIO for DVI, HDMI and DP connectors. If the GPIO can provide
>  	 * edge interrupts, register an interrupt handler.
>  	 */
>  	if (type == DRM_MODE_CONNECTOR_DVII ||
> -	    type == DRM_MODE_CONNECTOR_HDMIA) {
> +	    type == DRM_MODE_CONNECTOR_HDMIA ||
> +	    type == DRM_MODE_CONNECTOR_DisplayPort) {
>  		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
>  							 GPIOD_IN);
>  		if (IS_ERR(conn->hpd_gpio)) {
> @@ -223,6 +227,38 @@ static int display_connector_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Get the DP PWR for DP connector */

s/connector/connector./

> +	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		int r;

The driver uses "ret".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +		conn->dp_pwr = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
> +
> +		if (IS_ERR(conn->dp_pwr)) {
> +			r = PTR_ERR(conn->dp_pwr);
> +
> +			switch (r) {
> +			case -ENODEV:
> +				conn->dp_pwr = NULL;
> +				break;
> +
> +			case -EPROBE_DEFER:
> +				return -EPROBE_DEFER;
> +
> +			default:
> +				dev_err(&pdev->dev, "failed to get DP PWR regulator: %d\n", r);
> +				return r;
> +			}
> +		}
> +
> +		if (conn->dp_pwr) {
> +			r = regulator_enable(conn->dp_pwr);
> +			if (r) {
> +				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", r);
> +				return r;
> +			}
> +		}
> +	}
> +
>  	conn->bridge.funcs = &display_connector_bridge_funcs;
>  	conn->bridge.of_node = pdev->dev.of_node;
>  
> @@ -251,6 +287,9 @@ static int display_connector_remove(struct platform_device *pdev)
>  {
>  	struct display_connector *conn = platform_get_drvdata(pdev);
>  
> +	if (conn->dp_pwr)
> +		regulator_disable(conn->dp_pwr);
> +
>  	drm_bridge_remove(&conn->bridge);
>  
>  	if (!IS_ERR(conn->bridge.ddc))
> @@ -275,6 +314,9 @@ static const struct of_device_id display_connector_match[] = {
>  	}, {
>  		.compatible = "vga-connector",
>  		.data = (void *)DRM_MODE_CONNECTOR_VGA,
> +	}, {
> +		.compatible = "dp-connector",
> +		.data = (void *)DRM_MODE_CONNECTOR_DisplayPort,
>  	},
>  	{},
>  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
