Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4A2C8181
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47A6E43B;
	Mon, 30 Nov 2020 09:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65F6E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:57:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B225E97E;
 Mon, 30 Nov 2020 10:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606730225;
 bh=OuFnqrr8/Bz21a1IoHXe8CHHCWsUgMvqd0OvQUYbP4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kzR2qsA9UlSleK+Cb3JZVvQGHExQYdEjWp0OcFAxlPqrEeSMKjA0juU86W37GcXn0
 BCwwA4vxaIGwMUFYyAQCa2PGauVhsiiMfr0hoSwNjHtMW6Ns+wGdux9i9lwJKBa2YV
 dIDIWRT2jLPVPab+rtyk7bh4iE21Oq4wgydJe4dk=
Date: Mon, 30 Nov 2020 11:56:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 60/80] drm/panel: panel-dsi-cm: set column & page at
 setup
Message-ID: <20201130095657.GL4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-61-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-61-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:18PM +0200, Tomi Valkeinen wrote:
> Set the column & page address once during setup, instead of relying the
> DSI host driver to set those.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

With Sam's comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 59e8e6b18e97..1e7f73340736 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -171,6 +171,26 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
>  	return 0;
>  }
>  
> +static int dsicm_set_update_window(struct panel_drv_data *ddata)
> +{
> +	struct mipi_dsi_device *dsi = ddata->dsi;
> +	int r;
> +	u16 x1 = 0;
> +	u16 x2 = ddata->mode.hdisplay - 1;
> +	u16 y1 = 0;
> +	u16 y2 = ddata->mode.vdisplay - 1;
> +
> +	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
> +	if (r < 0)
> +		return r;
> +
> +	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
> +	if (r < 0)
> +		return r;
> +
> +	return 0;
> +}
> +
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
> @@ -308,6 +328,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> +	r = dsicm_set_update_window(ddata);
> +	if (r)
> +		goto err;
> +
>  	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
>  	if (r)
>  		goto err;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
