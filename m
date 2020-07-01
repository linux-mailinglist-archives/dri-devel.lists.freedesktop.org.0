Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D3211003
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ABD6E945;
	Wed,  1 Jul 2020 16:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957E26E945
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3F2D4FB03;
 Wed,  1 Jul 2020 18:02:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alMl0xMdXBGg; Wed,  1 Jul 2020 18:02:01 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 61F8940972; Wed,  1 Jul 2020 18:02:01 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:02:01 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 06/13] drm/panel: st7703: Prepare for supporting
 multiple panels
Message-ID: <20200701160201.GE174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-7-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-7-megous@megous.com>
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
On Wed, Jul 01, 2020 at 12:31:19PM +0200, Ondrej Jirman wrote:
> Parametrize the driver so that it can support more panels based
> on st7703 controller.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =

> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 43 +++++++++++++------
>  1 file changed, 31 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index 511af659f273..08cbc316266c 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -13,6 +13,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  =

>  #include <video/display_timing.h>
> @@ -56,6 +57,15 @@ struct st7703 {
>  	bool prepared;
>  =

>  	struct dentry *debugfs;
> +	const struct st7703_panel_desc *desc;
> +};
> +
> +struct st7703_panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	int (*init_sequence)(struct st7703 *ctx);
>  };
>  =

>  static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
> @@ -148,7 +158,7 @@ static int st7703_enable(struct drm_panel *panel)
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	int ret;
>  =

> -	ret =3D jh057n_init_sequence(ctx);
> +	ret =3D ctx->desc->init_sequence(ctx);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(ctx->dev, "Panel init sequence failed: %d\n",
>  			      ret);
> @@ -216,7 +226,7 @@ static int st7703_prepare(struct drm_panel *panel)
>  	return ret;
>  }
>  =

> -static const struct drm_display_mode default_mode =3D {
> +static const struct drm_display_mode jh057n00900_mode =3D {
>  	.hdisplay    =3D 720,
>  	.hsync_start =3D 720 + 90,
>  	.hsync_end   =3D 720 + 90 + 20,
> @@ -232,17 +242,26 @@ static const struct drm_display_mode default_mode =
=3D {
>  	.height_mm   =3D 130,
>  };
>  =

> +struct st7703_panel_desc jh057n00900_panel_desc =3D {
> +	.mode =3D &jh057n00900_mode,
> +	.lanes =3D 4,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format =3D MIPI_DSI_FMT_RGB888,
> +	.init_sequence =3D jh057n_init_sequence,
> +};
> +
>  static int st7703_get_modes(struct drm_panel *panel,
>  			    struct drm_connector *connector)
>  {
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	struct drm_display_mode *mode;
>  =

> -	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
> +	mode =3D drm_mode_duplicate(connector->dev, ctx->desc->mode);
>  	if (!mode) {
>  		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> -			      default_mode.hdisplay, default_mode.vdisplay,
> -			      default_mode.vrefresh);
> +			      ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
> +			      ctx->desc->mode->vrefresh);
>  		return -ENOMEM;
>  	}
>  =

> @@ -317,11 +336,11 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  =

>  	ctx->dev =3D dev;
> +	ctx->desc =3D of_device_get_match_data(dev);
>  =

> -	dsi->lanes =3D 4;
> -	dsi->format =3D MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
> -		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +	dsi->mode_flags =3D ctx->desc->mode_flags;
> +	dsi->format =3D ctx->desc->format;
> +	dsi->lanes =3D ctx->desc->lanes;
>  =

>  	ctx->vcc =3D devm_regulator_get(dev, "vcc");
>  	if (IS_ERR(ctx->vcc)) {
> @@ -361,8 +380,8 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
>  	}
>  =

>  	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> -		     default_mode.hdisplay, default_mode.vdisplay,
> -		     default_mode.vrefresh,
> +		     ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
> +		     ctx->desc->mode->vrefresh,
>  		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
>  =

>  	st7703_debugfs_init(ctx);
> @@ -405,7 +424,7 @@ static int st7703_remove(struct mipi_dsi_device *dsi)
>  }
>  =

>  static const struct of_device_id st7703_of_match[] =3D {
> -	{ .compatible =3D "rocktech,jh057n00900" },
> +	{ .compatible =3D "rocktech,jh057n00900", .data =3D &jh057n00900_panel_=
desc },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, st7703_of_match);
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
