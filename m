Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91B3F0AF6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3936E8B3;
	Wed, 18 Aug 2021 18:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4D76E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 18:21:33 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1636feac-0051-11ec-b37b-0050568c148b;
 Wed, 18 Aug 2021 18:21:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B5A77194B06;
 Wed, 18 Aug 2021 20:21:40 +0200 (CEST)
Date: Wed, 18 Aug 2021 20:21:28 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panel-simple: Add Vivax TPC-9150 panel v4
Message-ID: <YR1PqL9rnAjGT3rf@ravnborg.org>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818144648.72665-1-pavlica.nikola@gmail.com>
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

On Wed, Aug 18, 2021 at 04:46:46PM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
> 
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
> 
> Version 2, as Thierry kindly suggested that I fix the order in which the
> panel was ordered compared to others.
> 
> Version 3, filling in the required info suggested by Sam. Plus some
> factual issues that I've corrected myself (tested working)
> 
> Version 4, rearranged the display parameters and fix invalid bit format
> issue. (Thanks Sam)
> 
> Thanks,
> Nikola
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..9e06c375f8a0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3989,6 +3989,32 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
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
> +
> +static const struct panel_desc vivax_tpc9150_panel = {
> +	.modes = &vivax_tpc9150_panel_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 200,
> +		.height = 115,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

The bus_format is not right. If you look at your logging this panel
will result in a warning.

Look at the following code:
       case DRM_MODE_CONNECTOR_LVDS:
                WARN_ON(desc->bus_flags &
                        ~(DRM_BUS_FLAG_DE_LOW |
                          DRM_BUS_FLAG_DE_HIGH |
                          DRM_BUS_FLAG_DATA_MSB_TO_LSB |
                          DRM_BUS_FLAG_DATA_LSB_TO_MSB));
                WARN_ON(desc->bus_format != MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
                        desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_SPWG &&
                        desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA);
                WARN_ON(desc->bus_format == MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
                        desc->bpc != 6);
                WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
                         desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
                        desc->bpc != 8);
                break;

Here you see that for an LVDS connector we expect at least one bus_flag
- this is OK.
You can also see that for bus_format only a selected few are valid.
You need to investigate and pick the right one here.

One way to find out is to check the driver default as this is likely
selected when you specify an invalid bus_format like in the patch.

If you look for example in Documentation/devicetree/bindings/display/panel/lvds.yaml
then you can see a graphical representation of the formats. This should
help you pick the right one.

	Sam
