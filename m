Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A908138B56C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 19:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F42989A92;
	Thu, 20 May 2021 17:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652BE89A92
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 17:45:58 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ljmk8-0004wb-D6; Thu, 20 May 2021 19:45:56 +0200
Message-ID: <85ef661036b7717d5edd5597cc72a8dbb1c08dc7.camel@pengutronix.de>
Subject: Re: [PATCH] drm/panel: add rotation support for Elida KD35T133 panels
From: Lucas Stach <l.stach@pengutronix.de>
To: Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 20 May 2021 19:45:54 +0200
In-Reply-To: <SN6PR06MB534253E1CFDEA6917230F57BA57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB534253E1CFDEA6917230F57BA57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 02.04.2021 um 15:48 -0500 schrieb Chris Morgan:
> Update the panel to allow setting the rotation value in device tree.
> Tested on an Odroid Go Advance, where the panel is by default rotated 270
> degrees.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index bc36aa3c1123..d8534406d1ef 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -42,6 +42,7 @@ struct kd35t133 {
>  	struct gpio_desc *reset_gpio;
>  	struct regulator *vdd;
>  	struct regulator *iovcc;
> +	enum drm_panel_orientation orientation;
>  	bool prepared;
>  };
>  
> @@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
>  	connector->display_info.width_mm = mode->width_mm;
>  	connector->display_info.height_mm = mode->height_mm;
>  	drm_mode_probed_add(connector, mode);
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
>  
>  	return 1;
>  }
> @@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
>  
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  
>  	ctx->dev = dev;


