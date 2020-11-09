Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073322AB2A0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57589598;
	Mon,  9 Nov 2020 08:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644B89598
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:43:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18BA22FE;
 Mon,  9 Nov 2020 09:43:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911396;
 bh=KwRODhIebC+oWDoE1zteNZmvETpiVVaiebNWpV3Dydo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FstiZFcPdO1sAdGO0DNLYnfkP7UHxlhYATejgxiSly7Gu+//hON7vuiYlnxvX05bl
 4fCPI4zPe/1jz6nAplkxVJM5deixPzDWlZ/6pZ0ZB3s/H6ugCs7DuW7o6Ym43UEvlJ
 JWKK/ZIHPfv7IAOUi946tVg6hwzYgLE+CQZ8ZozU=
Date: Mon, 9 Nov 2020 10:43:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 16/56] drm/omap: panel-dsi-cm: drop hardcoded VC
Message-ID: <20201109084312.GM6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-17-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-17-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:53PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use dsi->channel everywhere, which originates from DT.

I'm not sure DT is the right place to provide this information, but
that's an issue broader than this patch series.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index b1ca9b34ce17..25183744a61d 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -27,9 +27,6 @@
>  
>  #include "../dss/omapdss.h"
>  
> -/* DSI Virtual channel. Hardcoded for now. */
> -#define TCH 0
> -
>  #define DCS_READ_NUM_ERRORS	0x05
>  #define DCS_BRIGHTNESS		0x51
>  #define DCS_CTRL_DISPLAY	0x53
> @@ -73,7 +70,6 @@ struct panel_drv_data {
>  	bool te_enabled;
>  
>  	atomic_t do_update;
> -	int channel;
>  
>  	struct delayed_work te_timeout_work;
>  
> @@ -274,7 +270,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
>  		return 0;
>  
>  	src->ops->enable(src);
> -	src->ops->dsi.enable_hs(src, ddata->channel, true);
> +	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
>  
>  	r = _dsicm_enable_te(ddata, true);
>  	if (r) {
> @@ -591,7 +587,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  
>  	dsicm_hw_reset(ddata);
>  
> -	src->ops->dsi.enable_hs(src, ddata->channel, false);
> +	src->ops->dsi.enable_hs(src, ddata->dsi->channel, false);
>  
>  	r = dsicm_sleep_out(ddata);
>  	if (r)
> @@ -622,7 +618,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	r = src->ops->dsi.enable_video_output(src, ddata->channel);
> +	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
>  	if (r)
>  		goto err;
>  
> @@ -634,7 +630,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  		ddata->intro_printed = true;
>  	}
>  
> -	src->ops->dsi.enable_hs(src, ddata->channel, true);
> +	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
>  
>  	return 0;
>  err:
> @@ -658,7 +654,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>  	struct omap_dss_device *src = ddata->src;
>  	int r;
>  
> -	src->ops->dsi.disable_video_output(src, ddata->channel);
> +	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
>  
>  	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
>  	if (!r)
> @@ -777,7 +773,7 @@ static irqreturn_t dsicm_te_isr(int irq, void *data)
>  	if (old) {
>  		cancel_delayed_work(&ddata->te_timeout_work);
>  
> -		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
> +		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
>  				ddata);
>  		if (r)
>  			goto err;
> @@ -834,7 +830,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>  				msecs_to_jiffies(250));
>  		atomic_set(&ddata->do_update, 1);
>  	} else {
> -		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
> +		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
>  				ddata);
>  		if (r)
>  			goto err;
> @@ -1110,8 +1106,6 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>  	struct display_timing timing;
>  	int err;
>  
> -	ddata->channel = TCH;
> -
>  	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ddata->reset_gpio)) {
>  		err = PTR_ERR(ddata->reset_gpio);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
