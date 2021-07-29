Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C7B3DA77E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28A26EDC3;
	Thu, 29 Jul 2021 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D49F6EDCF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:24:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 038a931a-f081-11eb-9082-0050568c148b;
 Thu, 29 Jul 2021 15:24:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7746D194C0B;
 Thu, 29 Jul 2021 17:24:19 +0200 (CEST)
Date: Thu, 29 Jul 2021 17:23:55 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v4] drm/panel: Add support for E Ink VB3300-KCA
Message-ID: <YQLIC0MJvRHr83vY@ravnborg.org>
References: <20210729103358.209-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729103358.209-1-alistair@alistair23.me>
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
Cc: devicetree@vger.kernel.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, linux@rempel-privat.de,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 max.Merchel@tq-group.com, alistair23@gmail.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

On Thu, Jul 29, 2021 at 08:33:58PM +1000, Alistair Francis wrote:
> Add support for the 10.3" E Ink panel described at:
> https://www.eink.com/product.html?type=productdetail&id=7
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>  - Fixup alphebetical sorting
> 
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index b3797ba2698b..799e20222551 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -128,6 +128,8 @@ properties:
>          # Emerging Display Technology Corp. WVGA TFT Display with capacitive touch
>        - edt,etm0700g0dh6
>        - edt,etm0700g0edh6
> +        # E Ink VB3300-KCA
> +      - eink,vb3300-kca
>          # Evervision Electronics Co. Ltd. VGG804821 5.0" WVGA TFT LCD Panel
>        - evervision,vgg804821
>          # Foxlink Group 5" WVGA TFT LCD panel
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 71da86e7b3a2..31745c45dd92 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -339,6 +339,8 @@ patternProperties:
>      description: eGalax_eMPIA Technology Inc
>    "^einfochips,.*":
>      description: Einfochips
> +  "^eink,.*":
> +    description: E Ink Corporation
>    "^elan,.*":
>      description: Elan Microelectronic Corp.
>    "^element14,.*":
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 21939d4352cf..8d6317b85465 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2046,6 +2046,32 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>  
> +static const struct display_timing eink_vb3300_kca_timing = {
> +	.pixelclock = { 40000000, 40000000, 40000000 },
> +	.hactive = { 334, 334, 334 },
> +	.hfront_porch = { 1, 1, 1 },
> +	.hback_porch = { 1, 1, 1 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 1405, 1405, 1405 },
> +	.vfront_porch = { 1, 1, 1 },
> +	.vback_porch = { 1, 1, 1 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc eink_vb3300_kca = {
> +	.timings = &eink_vb3300_kca_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 157,
> +		.height = 209,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +};
We need the connector_type here.

With this added:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I will apply if you update the patch with this.
I cannot do it as I do not know what connector_type to use.

	Sam
> +
>  static const struct display_timing evervision_vgg804821_timing = {
>  	.pixelclock = { 27600000, 33300000, 50000000 },
>  	.hactive = { 800, 800, 800 },
> @@ -4350,6 +4376,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "edt,etm0700g0edh6",
>  		.data = &edt_etm0700g0bdh6,
> +	}, {
> +		.compatible = "eink,vb3300-kca",
> +		.data = &eink_vb3300_kca,
>  	}, {
>  		.compatible = "evervision,vgg804821",
>  		.data = &evervision_vgg804821,
> -- 
> 2.31.1
