Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F14AF147
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3A10E38D;
	Wed,  9 Feb 2022 12:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8F10E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:18:29 +0000 (UTC)
Date: Wed, 09 Feb 2022 12:18:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 6/9] dw-hdmi/ingenic-dw-hdmi: repair interworking with
 hdmi-connector
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <E6E17R.ND5XW1IG4SYA@crapouillou.net>
In-Reply-To: <866f84621974992f4831bd471ae5a53414de9255.1643819482.git.hns@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
 <866f84621974992f4831bd471ae5a53414de9255.1643819482.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mer., f=E9vr. 2 2022 at 17:31:20 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus=20
> fmts callbacks")
>=20
> introduced a new mechanism to negotiate bus formats between hdmi=20
> connector
> and the synopsys hdmi driver inside the jz4780.
>=20
> By this, the dw-hdmi is no longer the only bridge and sets up a list
> of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().
>=20
> This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780=20
> but only
> produces a black screen.
>=20
> This fix is based on the observation that max_bpc =3D 0 when running=20
> this
> function while info->bpc =3D 8. Since the formats checks before this=20
> always test
> for max_bpc >=3D info->pbc indirectly my assumption is that we must=20
> check it
> here as well.

This fix looks really strange to me, so I'll let the DRM experts=20
comment.

It would still be better to move the patch before the introduction of=20
dw-ingenic-hdmi.c, so that once this one is introduced, everything=20
works. This also enables bisectability.

Cheers,
-Paul


>=20
> Adding the proposed patch makes the CI20/jz4780 panel work again in
> MEDIA_BUS_FMT_RGB888_1X24 mode.
>=20
> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus=20
> fmts callbacks")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c=20
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 52e7cd2e020d3..34703a15ee4ff 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2620,10 +2620,10 @@ static u32=20
> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>  	}
>=20
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
> +	if (max_bpc >=3D info->bpc && info->color_formats &=20
> DRM_COLOR_FORMAT_YCRCB422)
>  		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>=20
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
> +	if (max_bpc >=3D info->bpc && info->color_formats &=20
> DRM_COLOR_FORMAT_YCRCB444)
>  		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>=20
>  	/* Default 8bit RGB fallback */
> --
> 2.33.0
>=20


