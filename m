Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE32AB2A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA0C8924F;
	Mon,  9 Nov 2020 08:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FE88924F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:44:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C92482FE;
 Mon,  9 Nov 2020 09:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911467;
 bh=uil22SZmzLA9OiW5GKh7qc4WY2JG3YWY5xYTjmchaiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fI18fIhWap6DfiPeFKFnX8BXjk9WukyWLqPFmgaTbFtsAGD2MDDJA32X3LwkZOOTF
 bf7Awh6KeK0zdWniFBAFDs6DFwZZVbjsIXexAbplhG8ekXiNImIuuYKMgxB9OG0otf
 0g6dBxbSS0cxVASnxm4mwEVcV4f8Dczbt1FmORPM=
Date: Mon, 9 Nov 2020 10:44:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 17/56] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3
 defines
Message-ID: <20201109084423.GN6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-18-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-18-tomi.valkeinen@ti.com>
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

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:02:54PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Drop local definition of common MIPI DCS 1.3 defines.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 25183744a61d..a7236d9c3046 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -28,8 +28,6 @@
>  #include "../dss/omapdss.h"
>  
>  #define DCS_READ_NUM_ERRORS	0x05
> -#define DCS_BRIGHTNESS		0x51
> -#define DCS_CTRL_DISPLAY	0x53
>  #define DCS_GET_ID1		0xda
>  #define DCS_GET_ID2		0xdb
>  #define DCS_GET_ID3		0xdc
> @@ -333,8 +331,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>  		src->ops->dsi.bus_lock(src);
>  
>  		r = dsicm_wake_up(ddata);
> -		if (!r)
> -			r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, level);
> +		if (!r) {
> +			r = dsicm_dcs_write_1(ddata,
> +				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
> +		}

Weird indentation, and no need for curly brackets, but no big deal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  		src->ops->dsi.bus_unlock(src);
>  	}
> @@ -597,11 +597,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>  	if (r)
>  		goto err;
>  
> -	r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, 0xff);
> +	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
>  	if (r)
>  		goto err;
>  
> -	r = dsicm_dcs_write_1(ddata, DCS_CTRL_DISPLAY,
> +	r = dsicm_dcs_write_1(ddata, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>  			(1<<2) | (1<<5));	/* BL | BCTRL */
>  	if (r)
>  		goto err;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
