Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144B1397CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0B6E11E;
	Mon, 13 Jan 2020 17:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0B46E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:33:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EBA112009B;
 Mon, 13 Jan 2020 18:33:21 +0100 (CET)
Date: Mon, 13 Jan 2020 18:33:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/3] drm/panel: simple: Add support for the Frida
 FRD350H54004 panel
Message-ID: <20200113173320.GC20743@ravnborg.org>
References: <20200113161741.32061-1-paul@crapouillou.net>
 <20200113161741.32061-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113161741.32061-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=wIhPoiQn7kzPM9fWes8A:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Mon, Jan 13, 2020 at 01:17:41PM -0300, Paul Cercueil wrote:
> The FRD350H54004 is a simple 3.5" 320x240 24-bit TFT panel, found for
> instance inside the Anbernic RG-350 handheld gaming console.
> 
> v2: Order alphabetically
> v3: Add connector_type, and update timings according to the constraints
>     listed in the datasheet
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Thanks, applied to drm-misc-next.

	Sam
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e14c14ac62b5..d6f77bc494c7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1440,6 +1440,33 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  };
>  
> +static const struct drm_display_mode frida_frd350h54004_mode = {
> +	.clock = 6000,
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 44,
> +	.hsync_end = 320 + 44 + 16,
> +	.htotal = 320 + 44 + 16 + 20,
> +	.vdisplay = 240,
> +	.vsync_start = 240 + 2,
> +	.vsync_end = 240 + 2 + 6,
> +	.vtotal = 240 + 2 + 6 + 2,
> +	.vrefresh = 60,
> +	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +};
> +
> +static const struct panel_desc frida_frd350h54004 = {
> +	.modes = &frida_frd350h54004_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 77,
> +		.height = 64,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode friendlyarm_hd702e_mode = {
>  	.clock		= 67185,
>  	.hdisplay	= 800,
> @@ -3309,6 +3336,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "foxlink,fl500wvr00-a0t",
>  		.data = &foxlink_fl500wvr00_a0t,
> +	}, {
> +		.compatible = "frida,frd350h54004",
> +		.data = &frida_frd350h54004,
>  	}, {
>  		.compatible = "friendlyarm,hd702e",
>  		.data = &friendlyarm_hd702e,
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
