Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353324EF5D4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2810E3D3;
	Fri,  1 Apr 2022 15:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12A010E3D3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:48:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CF672F7;
 Fri,  1 Apr 2022 17:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648828117;
 bh=gDmbK3UGcsfZqStx2dq0iu9VSshZKfonWLlEL0MhQe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMOCYhQBLxnH7ozIcbNevFJ8n3d+BVpgXEx1Btl6o7x7iLpr2fJwOWNnwf1vADXfs
 L5GO8c0HZOBhTjL86Ddevgj0kackIisFtQdjWdW+TqFMkIfAlM+7xSWUiYNtEAadG8
 F4izN1OLV/ARhtRG89nPLh5YoSX0XokpEzbPklTU=
Date: Fri, 1 Apr 2022 18:48:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] drm/panel: lvds: Simplify mode parsing
Message-ID: <Ykce0oywZTR5NnsF@pendragon.ideasonboard.com>
References: <20220331192347.103299-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331192347.103299-1-marex@denx.de>
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

On Thu, Mar 31, 2022 at 09:23:46PM +0200, Marek Vasut wrote:
> The mode parsing is currently implemented in three steps:
> of_get_display_timing() - DT panel-timing to struct display_timing
> videomode_from_timing() - struct display_timing to struct videomode
> drm_display_mode_from_videomode() - struct videomode to struct drm_display_mode
> 
> Replace all that with simple of_get_drm_panel_display_mode() call,
> which already populates struct drm_display_mode and then duplicate
> that mode in panel_lvds_get_modes() each time, since the mode does
> not change.
> 
> Nice bonus is the bus_flags parsed by of_get_drm_panel_display_mode()
> out of panel-timing DT node, which is used in subsequent patch to fix
> handling of 'de-active' DT property.
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
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 27a1c9923b09..65c6a6e9e223 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -30,7 +30,8 @@ struct panel_lvds {
>  	const char *label;
>  	unsigned int width;
>  	unsigned int height;
> -	struct videomode video_mode;
> +	struct drm_display_mode dmode;

"dmode" sounds a bit weird, I would have gone for just "mode", or
"display_mode", but I don't mind much.

> +	u32 bus_flags;
>  	unsigned int bus_format;
>  	bool data_mirror;
>  
> @@ -87,16 +88,15 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>  	struct panel_lvds *lvds = to_panel_lvds(panel);
>  	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_create(connector->dev);
> +	mode = drm_mode_duplicate(connector->dev, &lvds->dmode);
>  	if (!mode)
>  		return 0;
>  
> -	drm_display_mode_from_videomode(&lvds->video_mode, mode);
>  	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>  	drm_mode_probed_add(connector, mode);
>  
> -	connector->display_info.width_mm = lvds->width;
> -	connector->display_info.height_mm = lvds->height;
> +	connector->display_info.width_mm = lvds->dmode.width_mm;
> +	connector->display_info.height_mm = lvds->dmode.height_mm;
>  	drm_display_info_set_bus_formats(&connector->display_info,
>  					 &lvds->bus_format, 1);
>  	connector->display_info.bus_flags = lvds->data_mirror
> @@ -116,7 +116,6 @@ static const struct drm_panel_funcs panel_lvds_funcs = {
>  static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>  {
>  	struct device_node *np = lvds->dev->of_node;
> -	struct display_timing timing;
>  	int ret;
>  
>  	ret = of_drm_get_panel_orientation(np, &lvds->orientation);
> @@ -125,28 +124,13 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>  		return ret;
>  	}
>  
> -	ret = of_get_display_timing(np, "panel-timing", &timing);
> +	ret = of_get_drm_panel_display_mode(np, &lvds->dmode, &lvds->bus_flags);
>  	if (ret < 0) {
>  		dev_err(lvds->dev, "%pOF: problems parsing panel-timing (%d)\n",
>  			np, ret);
>  		return ret;
>  	}
>  
> -	videomode_from_timing(&timing, &lvds->video_mode);
> -
> -	ret = of_property_read_u32(np, "width-mm", &lvds->width);
> -	if (ret < 0) {
> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> -			np, "width-mm");
> -		return -ENODEV;
> -	}
> -	ret = of_property_read_u32(np, "height-mm", &lvds->height);
> -	if (ret < 0) {
> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> -			np, "height-mm");
> -		return -ENODEV;
> -	}

of_get_drm_panel_display_mode() doesn't consider missing width-mm or
height-mm properties as an error. Should we check here that ->width_mm
and ->height_mm are not 0 ?

> -
>  	of_property_read_string(np, "label", &lvds->label);
>  
>  	ret = drm_of_lvds_get_data_mapping(np);

-- 
Regards,

Laurent Pinchart
