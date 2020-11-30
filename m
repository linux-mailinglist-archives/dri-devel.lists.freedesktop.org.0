Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2012C8164
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5556E43C;
	Mon, 30 Nov 2020 09:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8EE6E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:51:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A745597E;
 Mon, 30 Nov 2020 10:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729906;
 bh=AKEHU3dP0wNBPbEjiXFcjEZ7/oG4coxrRJ4tWBtzFm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0N9NIMXjpk4eJlAQ8ZH68eIBPvlAp6oJPki1XiVdVkTTvyyetBlTZovWz+AjKv6E
 Le3rvZx16wgp57Q3PIP+4krmE/MDT5dvV2BNpAU5FnIDwUdqze6k7o5w88VWZAly5k
 V1x36A7USlvXfAJ1IpNd4tdRSLJo1sNCnBcvMHvU=
Date: Mon, 30 Nov 2020 11:51:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 56/80] drm/panel: panel-dsi-cm: cleanup tear enable
Message-ID: <20201130095138.GH4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-57-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-57-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:14PM +0200, Tomi Valkeinen wrote:
> Simplify the code by moving code from _dsicm_enable_te() into
> dsicm_power_on().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index cb0d27a38555..59e8e6b18e97 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -69,8 +69,6 @@ static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
>  	return container_of(panel, struct panel_drv_data, panel);
>  }
>  
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
> -
>  static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
>  {
>  	struct backlight_device *backlight;
> @@ -314,10 +312,13 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	r = _dsicm_enable_te(ddata, true);
> +	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>  	if (r)
>  		goto err;
>  
> +	/* possible panel bug */
> +	msleep(100);
> +
>  	ddata->enabled = true;
>  
>  	if (!ddata->intro_printed) {
> @@ -418,22 +419,6 @@ static int dsicm_disable(struct drm_panel *panel)
>  	return r;
>  }
>  
> -static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
> -{
> -	struct mipi_dsi_device *dsi = ddata->dsi;
> -	int r;
> -
> -	if (enable)
> -		r = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	else
> -		r = mipi_dsi_dcs_set_tear_off(dsi);
> -
> -	/* possible panel bug */
> -	msleep(100);
> -
> -	return r;
> -}
> -
>  static int dsicm_get_modes(struct drm_panel *panel,
>  			   struct drm_connector *connector)
>  {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
