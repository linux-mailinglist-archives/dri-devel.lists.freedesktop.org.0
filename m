Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD0211007
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD136E94B;
	Wed,  1 Jul 2020 16:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F1C6E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9CCCFFB04;
 Wed,  1 Jul 2020 18:02:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPbvHeupN1Nh; Wed,  1 Jul 2020 18:02:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3891B40972; Wed,  1 Jul 2020 18:02:23 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:02:23 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 07/13] drm/panel: st7703: Move code specific to jh057n
 closer together
Message-ID: <20200701160223.GF174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-8-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-8-megous@megous.com>
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
On Wed, Jul 01, 2020 at 12:31:20PM +0200, Ondrej Jirman wrote:
> It's better than having it spread around the driver.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =

> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 50 +++++++++----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index 08cbc316266c..d03aab10cfef 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -153,6 +153,31 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>  	return 0;
>  }
>  =

> +static const struct drm_display_mode jh057n00900_mode =3D {
> +	.hdisplay    =3D 720,
> +	.hsync_start =3D 720 + 90,
> +	.hsync_end   =3D 720 + 90 + 20,
> +	.htotal	     =3D 720 + 90 + 20 + 20,
> +	.vdisplay    =3D 1440,
> +	.vsync_start =3D 1440 + 20,
> +	.vsync_end   =3D 1440 + 20 + 4,
> +	.vtotal	     =3D 1440 + 20 + 4 + 12,
> +	.vrefresh    =3D 60,
> +	.clock	     =3D 75276,
> +	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm    =3D 65,
> +	.height_mm   =3D 130,
> +};
> +
> +struct st7703_panel_desc jh057n00900_panel_desc =3D {
> +	.mode =3D &jh057n00900_mode,
> +	.lanes =3D 4,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format =3D MIPI_DSI_FMT_RGB888,
> +	.init_sequence =3D jh057n_init_sequence,
> +};
> +
>  static int st7703_enable(struct drm_panel *panel)
>  {
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
> @@ -226,31 +251,6 @@ static int st7703_prepare(struct drm_panel *panel)
>  	return ret;
>  }
>  =

> -static const struct drm_display_mode jh057n00900_mode =3D {
> -	.hdisplay    =3D 720,
> -	.hsync_start =3D 720 + 90,
> -	.hsync_end   =3D 720 + 90 + 20,
> -	.htotal	     =3D 720 + 90 + 20 + 20,
> -	.vdisplay    =3D 1440,
> -	.vsync_start =3D 1440 + 20,
> -	.vsync_end   =3D 1440 + 20 + 4,
> -	.vtotal	     =3D 1440 + 20 + 4 + 12,
> -	.vrefresh    =3D 60,
> -	.clock	     =3D 75276,
> -	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> -	.width_mm    =3D 65,
> -	.height_mm   =3D 130,
> -};
> -
> -struct st7703_panel_desc jh057n00900_panel_desc =3D {
> -	.mode =3D &jh057n00900_mode,
> -	.lanes =3D 4,
> -	.mode_flags =3D MIPI_DSI_MODE_VIDEO |
> -		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> -	.format =3D MIPI_DSI_FMT_RGB888,
> -	.init_sequence =3D jh057n_init_sequence,
> -};
> -
>  static int st7703_get_modes(struct drm_panel *panel,
>  			    struct drm_connector *connector)
>  {
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
