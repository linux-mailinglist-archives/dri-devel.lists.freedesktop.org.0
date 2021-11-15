Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4845119E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E9B6E079;
	Mon, 15 Nov 2021 19:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7828D6E079
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 19:09:23 +0000 (UTC)
Date: Mon, 15 Nov 2021 19:09:07 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 1/8] drm/ingenic: prepare ingenic drm for later
 addition of JZ4780
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <7VNM2R.1CHJIFHQDLSS@crapouillou.net>
In-Reply-To: <122791473d61add6992310cec267ffde2607a2df.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
 <122791473d61add6992310cec267ffde2607a2df.1636573413.git.hns@goldelico.com>
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

I will look at the patches in depth in the coming days.


Le mer., nov. 10 2021 at 20:43:26 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> This changes the way the regmap is allocated to prepare for the
> later addition of the JZ4780 which has more registers and bits
> than the others.
>=20
> Therefore we make the regmap as big as the reg property in
> the device tree tells.
>=20
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 462bc0f35f1bf..4abfe5b094174 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -173,7 +173,6 @@ static const struct regmap_config=20
> ingenic_drm_regmap_config =3D {
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
>=20
> -	.max_register =3D JZ_REG_LCD_SIZE1,
>  	.writeable_reg =3D ingenic_drm_writeable_reg,
>  };
>=20
> @@ -1011,6 +1010,8 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	struct ingenic_drm_bridge *ib;
>  	struct drm_device *drm;
>  	void __iomem *base;
> +	struct resource *res;
> +	struct regmap_config regmap_config;
>  	long parent_rate;
>  	unsigned int i, clone_mask =3D 0;
>  	int ret, irq;
> @@ -1056,14 +1057,16 @@ static int ingenic_drm_bind(struct device=20
> *dev, bool has_components)
>  	drm->mode_config.funcs =3D &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private =3D &ingenic_drm_mode_config_helpers;
>=20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "Failed to get memory resource\n");
>  		return PTR_ERR(base);
>  	}
>=20
> +	regmap_config =3D ingenic_drm_regmap_config;
> +	regmap_config.max_register =3D res->end - res->start - 4;

Just a quick feedback here: I just tested and it's actually just=20
(res->end - res->start), otherwise the last register of the memory area=20
set in DT is inaccessible.

Cheers,
-Paul

>  	priv->map =3D devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> --
> 2.33.0
>=20


