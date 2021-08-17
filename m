Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F473EF105
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB01E6E213;
	Tue, 17 Aug 2021 17:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688B46E213
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:42:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 65e973ba-ff82-11eb-aa7e-0050568cd888;
 Tue, 17 Aug 2021 17:41:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id EF143194B04;
 Tue, 17 Aug 2021 19:42:08 +0200 (CEST)
Date: Tue, 17 Aug 2021 19:41:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v3
Message-ID: <YRv05QbPz4lBQG8E@ravnborg.org>
References: <20210817163605.1077257-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817163605.1077257-1-pavlica.nikola@gmail.com>
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

thanks for the quick re-spin. There is still a few things that needs to
be addressed though. Sorry for not catching these the first time.

On Tue, Aug 17, 2021 at 06:36:05PM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
HEX dump?

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
> Thanks,
> Nikola
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4e2dad314c79..f6b3e58c162b 100644
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
Most panels put .bpc right above .size, so they follow the order in the
struct. This is bikeshedding but my OCD triggered here.

> +	.size = {
> +		.width = 200,
> +		.height = 115,
> +	},
> +	.bpc = 6,
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X24,
This does not build - I have no MEDIA_BUS_FMT_RGB666_1X24 in my kernel
(drm-misc-next).

With an LVDS connector and bpc equals 6 my bet is on: MEDIA_BUS_FMT_RGB666_1X7X3_SPWG
This is from looking at similar panels.


> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
> +
>  static const struct drm_display_mode vl050_8048nt_c01_mode = {
>  	.clock = 33333,
>  	.hdisplay = 800,
> @@ -4490,6 +4516,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "urt,umsh-8596md-20t",
>  		.data = &urt_umsh_8596md_parallel,
> +	}, {
> +		.compatible = "vivax,tpc9150-panel",
vivax is an unknown vendor, needs to be added to
Documentation/devicetree/bindings/vendor-prefixes.yaml in a separate
patch.

tpc9150-panel should be added to
Documentation/devicetree/bindings/display/panel/panel-simple.yaml
or at least I assume this is the file to add it to.
Again as a separate patch.

For the two binding related patches see
Documentation/devicetree/bindings/submitting-patches.rst

Sorry for making this difficult, but we need it done right.

	Sam
