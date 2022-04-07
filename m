Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7D4F7DC6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1734910E6D4;
	Thu,  7 Apr 2022 11:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111810E6D4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 197F9880;
 Thu,  7 Apr 2022 13:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649330215;
 bh=akVwUXZIkthfpmGLtSN0Cre33yHkCsSVdJb0TT3mKfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=utZtV7vP3XWu3KbdEdpEkheyFIb+vi9NGOHd4F51Yoj4MubcuX0vS3dKbReojBwaO
 pz3I2GosmLq/wYbvDfRhmAcyUQfa6sh2G9tHIle2lyKgx+BbAWip7fHhcUDoV5brxa
 ofk/9yVa0Q7Y64aAquIhNTS9rEBHc6G5/NWuqxAo=
Date: Thu, 7 Apr 2022 14:16:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] drm/panel: lvds: Simplify mode parsing
Message-ID: <Yk7II6F7edZ/uEdF@pendragon.ideasonboard.com>
References: <20220401162154.295152-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401162154.295152-1-marex@denx.de>
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

On Fri, Apr 01, 2022 at 06:21:53PM +0200, Marek Vasut wrote:
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
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
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
> V2: - Reinstate mandatory width-mm/height-mm DT property check
>     - Collect TB from Christoph
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 27a1c9923b09..6422868c1089 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -30,7 +30,8 @@ struct panel_lvds {
>  	const char *label;
>  	unsigned int width;
>  	unsigned int height;
> -	struct videomode video_mode;
> +	struct drm_display_mode dmode;
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
> @@ -125,23 +124,20 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
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
> +	if (lvds->dmode.width_mm == 0) {
>  		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
>  			np, "width-mm");
>  		return -ENODEV;
>  	}
> -	ret = of_property_read_u32(np, "height-mm", &lvds->height);
> -	if (ret < 0) {
> +
> +	if (lvds->dmode.height_mm == 0) {
>  		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
>  			np, "height-mm");
>  		return -ENODEV;

-- 
Regards,

Laurent Pinchart
