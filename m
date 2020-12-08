Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E882D2E7C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373B36E962;
	Tue,  8 Dec 2020 15:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E273A6E968
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:42:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65742335;
 Tue,  8 Dec 2020 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607442162;
 bh=bSTYM8+wSO0p71b5KCepk0WRcteaJGfSLe/NDv+Koco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=icFZUYd8CWrgS6TDpOCwaKI3MBBpEjo1q5/Zd4X7INaCbttHd8hb+3e31OdOzxuGE
 CpHFHxVdLYgPjIPw478/37wzOGo2wwFgAzP9ivIFfs8pucbjLIHuJP5cdOYCRW2jtD
 5Prbk7mwtmVEiFxslgA3vfCO9J+Nl75/8MYqZV7s=
Date: Tue, 8 Dec 2020 17:42:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 16/29] drm/panel: panel-dsi-cm: remove extra 'if'
Message-ID: <X8+e755PHCL+HxnN@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-17-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-17-tomi.valkeinen@ti.com>
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

On Tue, Dec 08, 2020 at 02:28:42PM +0200, Tomi Valkeinen wrote:
> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
> the conversion to DRM model. Drop the if.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index 556f9a2c5c0c..fa564aad7f25 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -202,11 +202,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
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
