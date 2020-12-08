Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E02D2E00
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2596E962;
	Tue,  8 Dec 2020 15:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3676E962
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:17:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B00ADD;
 Tue,  8 Dec 2020 16:17:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607440637;
 bh=W7NX3ZMPw5YGTNSjtYYjuD40hn96OeVoj4VtW+qLtBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qO9y436yzMWcy4ix5CHnvtxITBO8h4MklQPQcX+VcUPEcgCsBBNJk3WxDuth6GprV
 6cp5CWlqnEVGbIHjI3sIHzniIqVg/efliRQgRNrajXVeKwYBScPM19OJnZ3LgEM/92
 v2j3I8BeHfZHDZfcg85vAgy1KQXzteTha6mdhwJw=
Date: Tue, 8 Dec 2020 17:17:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 09/29] drm/omap: dsi: cleanup dispc channel usage
Message-ID: <X8+Y+h+0P582uo3P@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-10-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-10-tomi.valkeinen@ti.com>
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
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:35PM +0200, Tomi Valkeinen wrote:
> The "channel" usage in omap dsi driver is confusing. As the first step,
> change "channel" to "dispc_channel" when dealing with the dispc channel.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index c78ae99c8742..cf0dc4872d14 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3978,10 +3978,10 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
>  
>  static int dsi_display_init_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel = dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  	int r;
>  
> -	dss_select_lcd_clk_source(dsi->dss, channel, dsi->module_id == 0 ?
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, dsi->module_id == 0 ?
>  			DSS_CLK_SRC_PLL1_1 :
>  			DSS_CLK_SRC_PLL2_1);
>  
> @@ -4017,19 +4017,19 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
>  err:
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  	return r;
>  }
>  
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel = dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  
>  	if (dsi->mode == OMAP_DSS_DSI_CMD_MODE)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
>  
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  }
>  
>  static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
> @@ -4846,12 +4846,12 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  }
>  
>  /*
> - * Return a hardcoded channel for the DSI output. This should work for
> + * Return a hardcoded dispc channel for the DSI output. This should work for
>   * current use cases, but this can be later expanded to either resolve
>   * the channel in some more dynamic manner, or get the channel as a user
>   * parameter.
>   */
> -static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
> +static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
>  {
>  	switch (dsi->data->model) {
>  	case DSI_MODEL_OMAP3:
> @@ -5403,7 +5403,7 @@ static int dsi_init_output(struct dsi_data *dsi)
>  
>  	out->type = OMAP_DISPLAY_TYPE_DSI;
>  	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
> -	out->dispc_channel = dsi_get_channel(dsi);
> +	out->dispc_channel = dsi_get_dispc_channel(dsi);
>  	out->dsi_ops = &dsi_ops;
>  	out->of_port = 0;
>  	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
