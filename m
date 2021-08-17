Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC93EEF56
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CBF6E1E6;
	Tue, 17 Aug 2021 15:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729566E1E6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 15:45:21 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1a1bb594-ff72-11eb-b37b-0050568c148b;
 Tue, 17 Aug 2021 15:45:09 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2547A194B56;
 Tue, 17 Aug 2021 17:45:28 +0200 (CEST)
Date: Tue, 17 Aug 2021 17:45:16 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel
Message-ID: <YRvZjDfSxMC5q8ac@ravnborg.org>
References: <20210817083201.675133-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817083201.675133-1-pavlica.nikola@gmail.com>
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

Hi Nikola,

see a few comments in the following.

On Tue, Aug 17, 2021 at 10:32:01AM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
> 
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..97fc3c5740bb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4090,6 +4090,29 @@ static const struct panel_desc arm_rtsm = {
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  };
>  
> +static const struct drm_display_mode vivax_tpc9150_panel_mode = {
> +	.clock = 60000,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 160,
> +	.hsync_end = 1024 + 160 + 100,
> +	.htotal = 1024 + 160 + 100 + 60,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 12,
> +	.vsync_end = 600 + 12 + 10,
> +	.vtotal = 600 + 12 + 10 + 13,
> +};
.flags?

> +
> +static const struct panel_desc vivax_tpc9150_panel = {
> +	.modes = &vivax_tpc9150_panel_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 223,
> +		.height = 125,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +};

Specifying .connector_type is mandatory today.
Please specify .bpc too.

Consider if .bus_flags cover it all, they can be a little tricky to add
them all. And many many displays have failed to do so.

I hope to see a new version soon with these comments and also the
comments from Thierry fixed.

	Sam

> +
>  static const struct of_device_id platform_of_match[] = {
>  	{
>  		.compatible = "ampire,am-1280800n3tzqw-t00h",
> @@ -4103,6 +4126,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "arm,rtsm-display",
>  		.data = &arm_rtsm,
> +	}, {
> +		.compatible = "vivax,tpc9150-panel",
> +		.data = &vivax_tpc9150_panel,
>  	}, {
>  		.compatible = "armadeus,st0700-adapt",
>  		.data = &armadeus_st0700_adapt,
> -- 
> 2.32.0
