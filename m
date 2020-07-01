Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4F211019
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BB66E92F;
	Wed,  1 Jul 2020 16:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFDA6E92F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B872FFB03;
 Wed,  1 Jul 2020 18:04:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCQhS3pQ3pkg; Wed,  1 Jul 2020 18:04:18 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9117340972; Wed,  1 Jul 2020 18:04:18 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:04:18 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 10/13] drm/panel: st7703: Enter sleep after display off
Message-ID: <20200701160418.GI174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-11-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-11-megous@megous.com>
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
On Wed, Jul 01, 2020 at 12:31:23PM +0200, Ondrej Jirman wrote:
> The datasheet suggests to issue sleep in after display off
> as a part of the panel's shutdown sequence.

Out of curiosity: which exact datasheet did you use?

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index 5cd5503f894f..0c4167994d01 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -395,8 +395,19 @@ static int st7703_disable(struct drm_panel *panel)
>  {
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
>  	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +	int ret;
> +
> +	ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to turn off the display: %d\n", ret);
>  =

> -	return mipi_dsi_dcs_set_display_off(dsi);
> +	ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(ctx->dev,
> +			      "Failed to enter sleep mode: %d\n", ret);
> +
> +	return 0;
>  }
>  =

>  static int st7703_unprepare(struct drm_panel *panel)
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
