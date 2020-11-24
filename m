Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB22C2EAE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 18:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358C76E4DD;
	Tue, 24 Nov 2020 17:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DB66E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:35:41 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1D80B806DE;
 Tue, 24 Nov 2020 18:35:39 +0100 (CET)
Date: Tue, 24 Nov 2020 18:35:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 69/80] drm/panel: panel-dsi-cm: add panel database to
 driver
Message-ID: <20201124173537.GD56262@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-70-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-70-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=UdsSpmRKNpDMUvYxm34A:9 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 02:45:27PM +0200, Tomi Valkeinen wrote:
> Add a panel database to the driver instead of reading propertes from DT
> data. This is similar to panel-simple, and I believe it's more future
> safe way to handle the panels.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Looks good, and you remembered to drop the unsed includes - nice.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 107 +++++++++++++++++----------
>  1 file changed, 69 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index c17ed728c695..ec87b785871f 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -22,10 +22,7 @@
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
>  
> -#include <video/display_timing.h>
>  #include <video/mipi_display.h>
> -#include <video/of_display_timing.h>
> -#include <video/videomode.h>
>  
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
> @@ -33,6 +30,18 @@
>  
>  #define DCS_REGULATOR_SUPPLY_NUM 2
>  
> +static const struct of_device_id dsicm_of_match[];
> +
> +struct dsic_panel_data {
> +	u32 xres;
> +	u32 yres;
> +	u32 refresh;
> +	u32 width_mm;
> +	u32 height_mm;
> +	u32 max_hs_rate;
> +	u32 max_lp_rate;
> +};
> +
>  struct panel_drv_data {
>  	struct mipi_dsi_device *dsi;
>  	struct drm_panel panel;
> @@ -48,16 +57,14 @@ struct panel_drv_data {
>  					 */
>  	unsigned long	hw_guard_wait;	/* max guard time in jiffies */
>  
> -	/* panel HW configuration from DT or platform data */
> +	const struct dsic_panel_data *panel_data;
> +
>  	struct gpio_desc *reset_gpio;
>  
>  	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
>  
>  	bool use_dsi_backlight;
>  
> -	int width_mm;
> -	int height_mm;
> -
>  	/* runtime variables */
>  	bool enabled;
>  
> @@ -455,11 +462,8 @@ static int dsicm_get_modes(struct drm_panel *panel,
>  		return -ENOMEM;
>  	}
>  
> -	drm_mode_set_name(mode);
> -	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -
> -	connector->display_info.width_mm = ddata->width_mm;
> -	connector->display_info.height_mm = ddata->height_mm;
> +	connector->display_info.width_mm = ddata->panel_data->width_mm;
> +	connector->display_info.height_mm = ddata->panel_data->height_mm;
>  
>  	drm_mode_probed_add(connector, mode);
>  
> @@ -476,15 +480,10 @@ static const struct drm_panel_funcs dsicm_panel_funcs = {
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  {
> -	struct device_node *node = dsi->dev.of_node;
>  	struct backlight_device *backlight;
>  	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
> -	struct display_timing timing;
> -	struct videomode vm = {
> -		.hactive = 864,
> -		.vactive = 480,
> -	};
>  	int err;
> +	struct drm_display_mode *mode = &ddata->mode;
>  
>  	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
> @@ -493,23 +492,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  		return err;
>  	}
>  
> -	err = of_get_display_timing(node, "panel-timing", &timing);
> -	if (!err) {
> -		videomode_from_timing(&timing, &vm);
> -	} else {
> -		dev_warn(&dsi->dev,
> -			 "failed to get video timing, using defaults\n");
> -	}
> -
> -	if (!vm.pixelclock)
> -		vm.pixelclock = vm.hactive * vm.vactive * 60;
> -	drm_display_mode_from_videomode(&vm, &ddata->mode);
> -
> -	ddata->width_mm = 0;
> -	of_property_read_u32(node, "width-mm", &ddata->width_mm);
> -
> -	ddata->height_mm = 0;
> -	of_property_read_u32(node, "height-mm", &ddata->height_mm);
> +	mode->hdisplay = mode->hsync_start = mode->hsync_end = mode->htotal =
> +		ddata->panel_data->xres;
> +	mode->vdisplay = mode->vsync_start = mode->vsync_end = mode->vtotal =
> +		ddata->panel_data->yres;
> +	mode->clock = ddata->panel_data->xres * ddata->panel_data->yres *
> +		ddata->panel_data->refresh / 1000;
> +	mode->width_mm = ddata->panel_data->width_mm;
> +	mode->height_mm = ddata->panel_data->height_mm;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
>  
>  	ddata->supplies[0].supply = "vpnl";
>  	ddata->supplies[1].supply = "vddi";
> @@ -536,6 +528,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	struct panel_drv_data *ddata;
>  	struct backlight_device *bldev = NULL;
>  	struct device *dev = &dsi->dev;
> +	const struct of_device_id *id;
>  	int r;
>  
>  	dev_dbg(dev, "probe\n");
> @@ -547,6 +540,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	mipi_dsi_set_drvdata(dsi, ddata);
>  	ddata->dsi = dsi;
>  
> +	id = of_match_node(dsicm_of_match, dev->of_node);
> +	if (!id)
> +		return -ENODEV;
> +
> +	ddata->panel_data = id->data;
> +
>  	r = dsicm_probe_of(dsi);
>  	if (r)
>  		return r;
> @@ -583,8 +582,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
>  			  MIPI_DSI_MODE_EOT_PACKET;
> -	dsi->hs_rate = 300000000;
> -	dsi->lp_rate = 10000000;
> +	dsi->hs_rate = ddata->panel_data->max_hs_rate;
> +	dsi->lp_rate = ddata->panel_data->max_lp_rate;
>  
>  	drm_panel_add(&ddata->panel);
>  
> @@ -622,8 +621,40 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
>  	return 0;
>  }
>  
> +static const struct dsic_panel_data taal_data = {
> +	.xres = 864,
> +	.yres = 480,
> +	.refresh = 60,
> +	.width_mm = 0,
> +	.height_mm = 0,
> +	.max_hs_rate = 300000000,
> +	.max_lp_rate = 10000000,
> +};
> +
> +static const struct dsic_panel_data himalaya_data = {
> +	.xres = 480,
> +	.yres = 864,
> +	.refresh = 60,
> +	.width_mm = 49,
> +	.height_mm = 88,
> +	.max_hs_rate = 300000000,
> +	.max_lp_rate = 10000000,
> +};
> +
> +static const struct dsic_panel_data droid4_data = {
> +	.xres = 540,
> +	.yres = 960,
> +	.refresh = 60,
> +	.width_mm = 50,
> +	.height_mm = 89,
> +	.max_hs_rate = 300000000,
> +	.max_lp_rate = 10000000,
> +};
> +
>  static const struct of_device_id dsicm_of_match[] = {
> -	{ .compatible = "panel-dsi-cm", },
> +	{ .compatible = "tpo,taal", .data = &taal_data },
> +	{ .compatible = "nokia,himalaya", &himalaya_data },
> +	{ .compatible = "motorola,droid4-panel", &droid4_data },
>  	{},
>  };
>  
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
