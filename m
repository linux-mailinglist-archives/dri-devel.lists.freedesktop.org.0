Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC020CD21
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744CA8982E;
	Mon, 29 Jun 2020 08:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46E8982E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:04:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 06C0320023;
 Mon, 29 Jun 2020 10:04:09 +0200 (CEST)
Date: Mon, 29 Jun 2020 10:04:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maksim Melnikov <approximatenumber@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-simple: add support for NEC
 NL10276BC13-01C panel
Message-ID: <20200629080408.GE227119@ravnborg.org>
References: <cover.1589226066.git.approximatenumber@gmail.com>
 <842736c513b948ee00fdcbe30df3a5a6d0eed9f0.1589226066.git.approximatenumber@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <842736c513b948ee00fdcbe30df3a5a6d0eed9f0.1589226066.git.approximatenumber@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=YbiriMRPJW8YwXwP4UUA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 11:29:24PM +0300, Maksim Melnikov wrote:
> The NL10276BC13-01C is a 6.5" 1024x768 XGA TFT LCD panel with LVDS interface. It is used for industrial purposes in devices such as HMI.
> 
> Signed-off-by: Maksim Melnikov <approximatenumber@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eae..7ded13157 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2372,6 +2372,31 @@ static const struct panel_desc nec_nl4827hc19_05b = {
>  	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>  
> +static const struct display_timing nec_nl10276bc13_01c_timing = {
> +	.pixelclock = { 62600000, 68200000, 78100000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 15, 64, 159 },
> +	.hback_porch = { 5, 5, 5 },
> +	.hsync_len = { 1, 1, 256 },
> +	.vactive = { 768, 768, 768 },
> +	.vfront_porch = { 3, 40, 99 },
> +	.vback_porch = { 2, 2, 2 },
> +	.vsync_len = { 1, 1, 128 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc nec_nl10276bc13_01c = {
> +	.timings = &nec_nl10276bc13_01c_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 132,
> +		.height = 99,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
Sorry for getting back so late.

Please include .bus_flags too.
We want the description to be complete.

	Sam
> +};
> +
>  static const struct drm_display_mode netron_dy_e231732_mode = {
>  	.clock = 66000,
>  	.hdisplay = 1024,
> @@ -3634,6 +3659,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "nec,nl4827hc19-05b",
>  		.data = &nec_nl4827hc19_05b,
> +	}, {
> +		.compatible = "nec,nl10276bc13_01c",
> +		.data = &nec_nl10276bc13_01c,
>  	}, {
>  		.compatible = "netron-dy,e231732",
>  		.data = &netron_dy_e231732,
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
