Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BD188DE7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 20:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362296E81C;
	Tue, 17 Mar 2020 19:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043D6E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:23:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998C1F9;
 Tue, 17 Mar 2020 20:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584473025;
 bh=0im86SX1I5lqjQ+Li/yFgTxWIJKa9bcKPIK5SxM07R8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVdK3MFx4bUhjO+7M4I7R1qsctbehUyJge8k9kICwJnvzoUysoccB/UQpzy9a4kjK
 5cpf9ZQUBabhcMKmPoFnt6qa0HoHL/WGL+OItoPfrpryhtfOLKqCHG/WQOkME8+5cc
 mHao00b5l03Ebt5cifWZZR89jP6+i2gFd/IaMv6Q=
Date: Tue, 17 Mar 2020 21:23:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/3] drm/panel-simple: drop use of data-mapping property
Message-ID: <20200317192340.GC2527@pendragon.ideasonboard.com>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314153047.2486-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sat, Mar 14, 2020 at 04:30:46PM +0100, Sam Ravnborg wrote:
> The "data-mapping" property may not be the best way to describe the
> interface between panels and display interfaces.
> Drop use of in the panel-simple driver, so we have time to find
> the right way to describe this interface.

For the same reason as for patch 1/3,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0ce81b1f36af..3ad828eaefe1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -361,7 +361,6 @@ static int panel_dpi_probe(struct device *dev,
>  	struct panel_desc *desc;
>  	unsigned int bus_flags;
>  	struct videomode vm;
> -	const char *mapping;
>  	int ret;
>  
>  	np = dev->of_node;
> @@ -386,16 +385,6 @@ static int panel_dpi_probe(struct device *dev,
>  	of_property_read_u32(np, "width-mm", &desc->size.width);
>  	of_property_read_u32(np, "height-mm", &desc->size.height);
>  
> -	of_property_read_string(np, "data-mapping", &mapping);
> -	if (!strcmp(mapping, "rgb24"))
> -		desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> -	else if (!strcmp(mapping, "rgb565"))
> -		desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> -	else if (!strcmp(mapping, "bgr666"))
> -		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> -	else if (!strcmp(mapping, "lvds666"))
> -		desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> -
>  	/* Extract bus_flags from display_timing */
>  	bus_flags = 0;
>  	vm.flags = timing->flags;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
