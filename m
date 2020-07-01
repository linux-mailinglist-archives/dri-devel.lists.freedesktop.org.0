Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C42B21100D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708FF6E94D;
	Wed,  1 Jul 2020 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE746E94D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 811FCFB03;
 Wed,  1 Jul 2020 18:02:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4FYZ4R6qEuf; Wed,  1 Jul 2020 18:02:47 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2F5EF40972; Wed,  1 Jul 2020 18:02:47 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:02:47 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 08/13] drm/panel: st7703: Move generic part of init
 sequence to enable callback
Message-ID: <20200701160247.GG174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-9-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-9-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Jul 01, 2020 at 12:31:21PM +0200, Ondrej Jirman wrote:
> Calling sleep out and display on is a controller specific part
> of the initialization process. Move it out of the panel specific
> initialization function to the enable callback.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 33 ++++++++++---------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index d03aab10cfef..cdbf7dfb4dd4 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -84,8 +84,6 @@ static inline struct st7703 *panel_to_st7703(struct drm=
_panel *panel)
>  static int jh057n_init_sequence(struct st7703 *ctx)
>  {
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> -	struct device *dev =3D ctx->dev;
> -	int ret;
>  =

>  	/*
>  	 * Init sequence was supplied by the panel vendor. Most of the commands
> @@ -136,20 +134,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>  			      0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
>  			      0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
>  			      0x11, 0x18);
> -	msleep(20);
> -
> -	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	/* Panel is operational 120 msec after reset */
> -	msleep(60);
> -	ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret)
> -		return ret;
>  =

> -	DRM_DEV_DEBUG_DRIVER(dev, "Panel init sequence done\n");
>  	return 0;
>  }
>  =

> @@ -181,6 +166,7 @@ struct st7703_panel_desc jh057n00900_panel_desc =3D {
>  static int st7703_enable(struct drm_panel *panel)
>  {
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
>  	int ret;
>  =

>  	ret =3D ctx->desc->init_sequence(ctx);
> @@ -190,6 +176,23 @@ static int st7703_enable(struct drm_panel *panel)
>  		return ret;
>  	}
>  =

> +	msleep(20);
> +
> +	ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Panel is operational 120 msec after reset */
> +	msleep(60);
> +
> +	ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret)
> +		return ret;
> +
> +	DRM_DEV_DEBUG_DRIVER(ctx->dev, "Panel init sequence done\n");
> +
>  	return 0;
>  }
>  =

> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
