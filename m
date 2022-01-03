Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBEE4830B9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511E089DB8;
	Mon,  3 Jan 2022 11:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B789DB8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:48:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA21CCC;
 Mon,  3 Jan 2022 12:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641210496;
 bh=TbRPglttLCKM0Up430PcGcij6TJtgvzfspWoM/T9AEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ihGQXJtkxMMAIFYowBVvJ5T9C1wm20ON5czu931w82yxqk5in9n0LtkzpAmlAOBnI
 re/Nz0WmhJhrffOqsBDRJouOT23uPDl/CpKSQ9gg04BGQlAxT/mGMOwGUA/uh/GyiJ
 FsyB5ApMKHXfFTGokz7xaM8S9Wn3Ll0lsdjW/ww0=
Date: Mon, 3 Jan 2022 13:48:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
Message-ID: <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
References: <20211231013930.139754-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211231013930.139754-1-festevam@gmail.com>
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

On Thu, Dec 30, 2021 at 10:39:29PM -0300, Fabio Estevam wrote:
> Use the atomic version of the enable/disable operations to continue the
> transition to the atomic API, started with the introduction of
> .atomic_get_input_bus_fmts(). This will be needed to access the mode
> from the atomic state.
> 
> Based on Laurent's commit a6ea7d268a63("drm: bridge: ti-sn65dsi83:
> Switch to atomic operations").
> 
> Tested on a imx6sx-udoo-neo board.
> 
> Suggested-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

With the comment from 2/2 taken into account,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index b7ec6c374fbd..adaa985af87e 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -1395,7 +1395,8 @@ static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void tda998x_bridge_enable(struct drm_bridge *bridge)
> +static void tda998x_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_bridge_state)
>  {
>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>  
> @@ -1413,7 +1414,8 @@ static void tda998x_bridge_enable(struct drm_bridge *bridge)
>  	}
>  }
>  
> -static void tda998x_bridge_disable(struct drm_bridge *bridge)
> +static void tda998x_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>  
> @@ -1680,9 +1682,9 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
>  	.attach = tda998x_bridge_attach,
>  	.detach = tda998x_bridge_detach,
>  	.mode_valid = tda998x_bridge_mode_valid,
> -	.disable = tda998x_bridge_disable,
> +	.atomic_disable = tda998x_bridge_atomic_disable,
>  	.mode_set = tda998x_bridge_mode_set,
> -	.enable = tda998x_bridge_enable,
> +	.atomic_enable = tda998x_bridge_atomic_enable,
>  };
>  
>  /* I2C driver functions */

-- 
Regards,

Laurent Pinchart
