Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBBB427B24
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 17:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B21D89139;
	Sat,  9 Oct 2021 15:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D29489139
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 15:12:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 53dd8ce4-2913-11ec-ac3c-0050568cd888;
 Sat, 09 Oct 2021 15:12:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1A627194BA9;
 Sat,  9 Oct 2021 17:12:34 +0200 (CEST)
Date: Sat, 9 Oct 2021 17:12:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm: panel-simple: Add support for the Innolux
 G070Y2-T02 panel
Message-ID: <YWGxbKm/5r/J1Vi6@ravnborg.org>
References: <20210930100501.15690-1-o.rempel@pengutronix.de>
 <20210930100501.15690-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930100501.15690-2-o.rempel@pengutronix.de>
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

Hi Oleksij, Robin,

On Thu, Sep 30, 2021 at 12:05:00PM +0200, Oleksij Rempel wrote:
> Add compatible and timings for the Innolux G070Y2-T02 panel. It is 7"
> WVGA (800x480) TFT LCD panel with TTL interface and a backlight unit.
> 
> Co-Developed-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b6c4e6c38a1..a03b60f6fa99 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2524,6 +2524,19 @@ static const struct panel_desc innolux_g070y2_l01 = {
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> +static const struct panel_desc innolux_g070y2_t02 = {
> +	.modes = &innolux_at070tn92_mode,

It is suprising to see that the innolux_g070y2_t02 uses the mode
innolux_at070tn92_mode.
Is it on purpose? If yes then I would expect the changelog to say so.

In most (all?) other cases the panel provide their own mode.

	Sam

> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 92,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct display_timing innolux_g101ice_l01_timing = {
>  	.pixelclock = { 60400000, 71100000, 74700000 },
>  	.hactive = { 1280, 1280, 1280 },
> @@ -4663,6 +4676,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "innolux,g070y2-l01",
>  		.data = &innolux_g070y2_l01,
> +	}, {
> +		.compatible = "innolux,g070y2-t02",
> +		.data = &innolux_g070y2_t02,
>  	}, {
>  		.compatible = "innolux,g101ice-l01",
>  		.data = &innolux_g101ice_l01
> -- 
> 2.30.2
