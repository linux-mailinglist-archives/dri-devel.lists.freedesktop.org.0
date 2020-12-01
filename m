Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18E2C93DA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCAE89DF7;
	Tue,  1 Dec 2020 00:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268ED89DF7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:22:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B457745D;
 Tue,  1 Dec 2020 01:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782171;
 bh=Kneg9nNkvX3Ek8BPh/XyI0mn11bKL4QfpqWbZj8Y2us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1TvD1HabTRAZCk1E94vRyRg1rx0UG+q5RpuEJ5Bo391yxUd8SOFyEex+7R/9F9hh
 G4NZNXUJGb8/TAuG8JqbXIwTjD5J9zoosQx5fbpz0GBcwpXOtKHNBLF9xKTXhGb8ox
 Yy1Wiy3uFNuVrF/rsADY3cHHmoHDlcSvgEUdAGiA=
Date: Tue, 1 Dec 2020 02:22:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 68/80] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <20201201002243.GM25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-69-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-69-tomi.valkeinen@ti.com>
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

On Tue, Nov 24, 2020 at 02:45:26PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 1e7f73340736..c17ed728c695 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -194,7 +194,7 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata)
>  static int dsicm_bl_update_status(struct backlight_device *dev)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
> -	int r = 0;
> +	int r;
>  	int level;
>  
>  	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> @@ -207,11 +207,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>  
>  	mutex_lock(&ddata->lock);
>  
> -	if (ddata->enabled) {
> -		if (!r)
> -			r = dsicm_dcs_write_1(
> -				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> -	}
> +	if (ddata->enabled)
> +		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				      level);

If !ddata->enabled, won't r be uninitialized ?

>  
>  	mutex_unlock(&ddata->lock);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
