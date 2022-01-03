Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A8E4830B7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE0D89217;
	Mon,  3 Jan 2022 11:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B8389217
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:47:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6726CC;
 Mon,  3 Jan 2022 12:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641210441;
 bh=Sr6MlETNYkvXJGdz+BabhyYimFrjx2aeij6t4aOUG0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W9FoSVX0kKAoWz2ZcT53lz6chBSh8xFV/STc+LRo+goRe2SCLbR8KmoQNP2Y5aaqd
 ihBaNSoChTP444zMpmoibbCds93AppPv7TTUfwklDebLHzLVF5iXeclom9NJ5vTC+g
 2J4inEixhjjin6gYcklkoXQm9I+T5AYSvwoNyfz0=
Date: Mon, 3 Jan 2022 13:47:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] drm/i2c/tda998x: Implement atomic_get_input_bus_fmts
Message-ID: <YdLiRXwpE57ryV4d@pendragon.ideasonboard.com>
References: <20211231013930.139754-1-festevam@gmail.com>
 <20211231013930.139754-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211231013930.139754-2-festevam@gmail.com>
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
Cc: marex@denx.de, tomm.merciai@gmail.com, linux@armlinux.org.uk,
 dri-devel@lists.freedesktop.org, pbrobinson@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

Thank you for the patch.

On Thu, Dec 30, 2021 at 10:39:30PM -0300, Fabio Estevam wrote:
> Implement the .atomic_get_input_bus_fmts callback to let the bridge
> indicate the pixel format it requires on the parallel bus to the LCDIF.
> 
> Based on Marek's commit db8b7ca5b232 ("drm/bridge: ti-sn65dsi83: Replace
> connector format patching with atomic_get_input_bus_fmts").
> 
> Tested on a imx6sx-udoo-neo board.
> 
> Suggested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index adaa985af87e..d987481e97c1 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -1678,6 +1678,31 @@ static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
>  	mutex_unlock(&priv->audio_mutex);
>  }
>  
> +#define MAX_INPUT_SEL_FORMATS  1
> +
> +static u32 *
> +tda998x_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state,
> +				   u32 output_fmt,
> +				   unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
>  static const struct drm_bridge_funcs tda998x_bridge_funcs = {
>  	.attach = tda998x_bridge_attach,
>  	.detach = tda998x_bridge_detach,
> @@ -1685,6 +1710,10 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
>  	.atomic_disable = tda998x_bridge_atomic_disable,
>  	.mode_set = tda998x_bridge_mode_set,
>  	.atomic_enable = tda998x_bridge_atomic_enable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,

I think this should go to 1/2.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	.atomic_get_input_bus_fmts = tda998x_atomic_get_input_bus_fmts,
>  };
>  
>  /* I2C driver functions */

-- 
Regards,

Laurent Pinchart
