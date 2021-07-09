Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576973C28D6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD636E930;
	Fri,  9 Jul 2021 18:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6896E930
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:08:39 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id abf9c6af-e0e0-11eb-9082-0050568c148b;
 Fri, 09 Jul 2021 18:08:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id ABA78194B04;
 Fri,  9 Jul 2021 20:08:46 +0200 (CEST)
Date: Fri, 9 Jul 2021 20:08:35 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yunus Bas <y.bas@phytec.de>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add support for EDT
 ETMV570G2DHU panel
Message-ID: <YOiQo3B9JtE0kuO7@ravnborg.org>
References: <20210706075908.907659-1-y.bas@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706075908.907659-1-y.bas@phytec.de>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunus,

On Tue, Jul 06, 2021 at 09:59:07AM +0200, Yunus Bas wrote:
> From: Stefan Riedmueller <s.riedmueller@phytec.de>
> 
> This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
> to DRM simple panel driver.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Yunus Bas <y.bas@phytec.de>
> ---
> Changes in v3:
> - No changes in general, added additional maintainers and also sending
> to general kernel mailing list
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 21939d4352cf..07433bff6c2b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2008,6 +2008,32 @@ static const struct panel_desc edt_et057090dhu = {
>  	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  
> +static const struct drm_display_mode edt_etmv570g2dhu_mode = {
> +	.clock = 25175,
> +	.hdisplay = 640,
> +	.hsync_start = 640,
> +	.hsync_end = 640 + 16,
> +	.htotal = 640 + 16 + 30 + 114,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 10,
> +	.vsync_end = 480 + 10 + 3,
> +	.vtotal = 480 + 10 + 3 + 35,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc edt_etmv570g2dhu = {
> +	.modes = &edt_etmv570g2dhu_mode,
> +	.num_modes = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 115,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
>  	.clock = 33260,
>  	.hdisplay = 800,
> @@ -4338,6 +4364,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,et057090dhu",
>  		.data = &edt_et057090dhu,
> +	}, {
> +		.compatible = "edt,etmv570g2dhu",
> +		.data = &edt_etmv570g2dhu,
>  	}, {
>  		.compatible = "edt,et070080dh6",
>  		.data = &edt_etm0700g0dh6,

This list must be alphabetically sorted after compatible.

"edt,etmv570g2dhu" comes after "edt,et070080dh6"

The same order must be used where edt_etmv570g2dhu is defined.
Sorry for this nit, but if we fails to follw it we will soon have chaos.

The rest looks good, everything needed is defined.

	Sam
