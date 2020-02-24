Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334C16B5E9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 00:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC876E9BC;
	Mon, 24 Feb 2020 23:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091766E9BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:43:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A97DE89;
 Tue, 25 Feb 2020 00:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582587790;
 bh=80gMHTLwFKBxDpHK29md8YKw+Hgbxum55GlsHvnjbdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fazrMM8OSWF50yIkGzTrcJXseI4/EsJUjLAjdPOAzcIoPAY3X9l3gddXFj/5pzI2b
 khZk/DG3VEze5CqEh5Ryiiu5x68hQQatLiaG7Qis1H4BSyk8b5LMbHibgVzpoEQtgR
 lZHFBztbkJnHLIdL97jkfA1hkyUM0DjnDnCR6UsE=
Date: Tue, 25 Feb 2020 01:42:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
Message-ID: <20200224234249.GI16163@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-5-sebastian.reichel@collabora.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:34AM +0100, Sebastian Reichel wrote:
> The panel-dsi-cm's ddata->pin_config is always NULL, so this
> callback is never called. Instead the DSI encoder gets the pin
> configuration directly from DT.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
>  drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
>  3 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 3484b5d4a91c..e7fe5d702337 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -68,8 +68,6 @@ struct panel_drv_data {
>  	int width_mm;
>  	int height_mm;
>  
> -	struct omap_dsi_pin_config pin_config;
> -
>  	/* runtime variables */
>  	bool enabled;
>  
> @@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  		}
>  	}
>  
> -	if (ddata->pin_config.num_pins > 0) {
> -		r = src->ops->dsi.configure_pins(src, &ddata->pin_config);
> -		if (r) {
> -			dev_err(&ddata->pdev->dev,
> -				"failed to configure DSI pins\n");
> -			goto err_vddi;
> -		}
> -	}
> -
>  	r = src->ops->dsi.set_config(src, &dsi_config);
>  	if (r) {
>  		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 79ddfbfd1b58..8c39823a8295 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops = {
>  
>  		.enable_hs = dsi_vc_enable_hs,
>  
> -		.configure_pins = dsi_configure_pins,
>  		.set_config = dsi_set_config,
>  
>  		.enable_video_output = dsi_enable_video_output,
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index cbbe10b2b60d..b0424daaceed 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -292,8 +292,6 @@ struct omapdss_dsi_ops {

I think you can drop the definition of the omap_dsi_pin_config structure
earlier in this file too, as well as the OMAP_DSS_MAX_DSI_PINS macro.
With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* bus configuration */
>  	int (*set_config)(struct omap_dss_device *dssdev,
>  			const struct omap_dss_dsi_config *cfg);
> -	int (*configure_pins)(struct omap_dss_device *dssdev,
> -			const struct omap_dsi_pin_config *pin_cfg);
>  
>  	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
>  			bool enable);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
