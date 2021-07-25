Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351D3D4FD8
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 22:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C186E4AF;
	Sun, 25 Jul 2021 20:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B73A6E4AF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 20:23:19 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2f47e092-ed86-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 20:23:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 01BCF194B04;
 Sun, 25 Jul 2021 22:23:36 +0200 (CEST)
Date: Sun, 25 Jul 2021 22:23:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-simple: add Gopher 2b LCD panel
Message-ID: <YP3IM4PbN68qd4ec@ravnborg.org>
References: <20210724103358.1632020-1-akawolf0@gmail.com>
 <20210724103358.1632020-4-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724103358.1632020-4-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 01:33:58PM +0300, Artjom Vejsel wrote:
> The Gopher 2b LCD panel is used in Gopher 2b handhelds.
> It's simple panel with NewVision NV3047 driver, but SPI lines are not connected.
> It has no specific name, since it's unique to that handhelds.
> lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b286bd4444f..9676e25accb3 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4306,6 +4306,46 @@ static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct drm_display_mode qishenglong_gopher2b_lcd_panel_modes[] = {
> +	{ /* 60 Hz */
> +		.clock = 10800,
> +		.hdisplay = 480,
> +		.hsync_start = 480 + 77,
> +		.hsync_end = 480 + 77 + 41,
> +		.htotal = 480 + 77 + 41 + 2,
> +		.vdisplay = 272,
> +		.vsync_start = 272 + 16,
> +		.vsync_end = 272 + 16 + 10,
> +		.vtotal = 272 + 16 + 10 + 2,
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +	{ /* 50 Hz */
> +		.clock = 10800,
> +		.hdisplay = 480,
> +		.hsync_start = 480 + 17,
> +		.hsync_end = 480 + 17 + 41,
> +		.htotal = 480 + 17 + 41 + 2,
> +		.vdisplay = 272,
> +		.vsync_start = 272 + 116,
> +		.vsync_end = 272 + 116 + 10,
> +		.vtotal = 272 + 116 + 10 + 2,
> +		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +	},
> +};
> +
> +static const struct panel_desc qishenglong_gopher2b_lcd_panel = {
> +	.modes = qishenglong_gopher2b_lcd_panel_modes,
> +	.num_modes = ARRAY_SIZE(qishenglong_gopher2b_lcd_panel_modes),
> +	.bpc = 8,
> +	.size = {
> +		.width = 95,
> +		.height = 54,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode arm_rtsm_mode[] = {
>  	{
>  		.clock = 65000,
> @@ -4753,6 +4793,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "yes-optoelectronics,ytc700tlag-05-201c",
>  		.data = &yes_optoelectronics_ytc700tlag_05_201c,
> +	}, {
> +		.compatible = "qishenglong,gopher2b-lcd-panel",
> +		.data = &qishenglong_gopher2b_lcd_panel,
>  	}, {

This list shall also be sorted alphabetically, after the compatible.
Same goes for the definition of the variable &qishenglong_gopher2b_lcd_panel
that shall be listed in the same order as here.

Sorry for the nit-picking - but if we do not ask to have it fixed then
we quickly have a mess.

	Sam
