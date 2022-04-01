Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF914EF5D5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922310E3ED;
	Fri,  1 Apr 2022 15:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5998010F4EC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:50:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B50F2F7;
 Fri,  1 Apr 2022 17:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648828235;
 bh=M4cFbv7xe7dLQelSjyjXmkJFwvvYiB1hzcQTlFtETVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFxS06PK45Dv34jSZTXp7RTNOBEKikNSKQ9RFdBMtdgOjPnKYM8ZHYO9dcxbWqgBD
 Hg+Vi4mwnus9LwdP2236/1/68u73jLll5cFfur44qfZ6GolkflZz3PvLABjFhv8inN
 4CTy7bh1x17mVPcyEmRrUN1lPNk0T5cYNEzMXtQU=
Date: Fri, 1 Apr 2022 18:50:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/panel: lvds: Use bus_flags from DT panel-timing
 property
Message-ID: <YkcfSUrhhC6APmdq@pendragon.ideasonboard.com>
References: <20220331192347.103299-1-marex@denx.de>
 <20220331192347.103299-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331192347.103299-2-marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Thu, Mar 31, 2022 at 09:23:47PM +0200, Marek Vasut wrote:
> This driver currently rewrites bus_flags based solely on the value of
> DT property 'data-mirror' and ignores bus_flags which might have been
> set in DT panel-timing node. Specificaly, the 'de-active' DT property
> sets DRM_BUS_FLAG_DE_ bus_flags.
> 
> Since of_get_drm_panel_display_mode() conveniently parses the bus_flags
> out of DT panel-timing property, just ORR them with bus_flags inferred
> from 'data-mirror' DT property and use the result as panel bus_flags.
> 
> This fixes handling of panels with 'panel-timing { de-active = <1>; };'.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 65c6a6e9e223..f11252fb00fe 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -33,7 +33,6 @@ struct panel_lvds {
>  	struct drm_display_mode dmode;
>  	u32 bus_flags;
>  	unsigned int bus_format;
> -	bool data_mirror;
>  
>  	struct regulator *supply;
>  
> @@ -99,9 +98,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>  	connector->display_info.height_mm = lvds->dmode.height_mm;
>  	drm_display_info_set_bus_formats(&connector->display_info,
>  					 &lvds->bus_format, 1);
> -	connector->display_info.bus_flags = lvds->data_mirror
> -					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
> -					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> +	connector->display_info.bus_flags = lvds->bus_flags;
>  	drm_connector_set_panel_orientation(connector, lvds->orientation);
>  
>  	return 1;
> @@ -142,7 +139,9 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>  
>  	lvds->bus_format = ret;
>  
> -	lvds->data_mirror = of_property_read_bool(np, "data-mirror");
> +	lvds->bus_flags |= of_property_read_bool(np, "data-mirror") ?
> +			   DRM_BUS_FLAG_DATA_LSB_TO_MSB :
> +			   DRM_BUS_FLAG_DATA_MSB_TO_LSB;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
