Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09359427B1A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 17:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6443F6E131;
	Sat,  9 Oct 2021 15:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8EC6E131
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 15:06:46 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7c4bbbbf-2912-11ec-9c3f-0050568c148b;
 Sat, 09 Oct 2021 15:06:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5ED9C194BA9;
 Sat,  9 Oct 2021 17:06:31 +0200 (CEST)
Date: Sat, 9 Oct 2021 17:06:41 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v5
Message-ID: <YWGwARbTCgyHfjXB@ravnborg.org>
References: <20211002203017.509940-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002203017.509940-1-pavlica.nikola@gmail.com>
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

On Sat, Oct 02, 2021 at 10:30:17PM +0200, Nikola Pavlica wrote:
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
> Version 5, referred to FEX file instead of manual debugging for
> information.
> 
> NOTE: Seperate dt-binding patch has been sent to THAT mailing list. So
> that's why they're NOT included here. Advise freely if that's not how
> you're supposed to do it.
The preference is to keep all related patches in one series.
In this case we cannot apply the panel patches before the dt-bindings
patches for example.
It is mood in this case as I already applied the bindings patches.

> 
> Thanks,
> Nikola

There is one detail to fix, see below.

> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b6c4e6c3..680fd3f72 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4363,6 +4363,32 @@ static const struct panel_desc urt_umsh_8596md_parallel = {
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
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,

The LVDS connector with a bpc og 6 only accpets the following
bus_format: MEDIA_BUS_FMT_RGB666_1X7X3_SPWG

See panel-simple.c panel_simple_probe() around line 612.


So either the bus_format is wrong, or the connector_type is wrong.
Please fix and resend.

	Sam
