Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B34CA37F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01F610E904;
	Wed,  2 Mar 2022 11:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAE110E904
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:22:12 +0000 (UTC)
Date: Wed, 02 Mar 2022 10:40:07 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
 add .enable and .disable
To: Christophe Branchereau <cbranchereau@gmail.com>
Message-Id: <VM548R.0I9BAN681OS83@crapouillou.net>
In-Reply-To: <20220301153122.20660-4-cbranchereau@gmail.com>
References: <20220301153122.20660-1-cbranchereau@gmail.com>
 <20220301153122.20660-4-cbranchereau@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

Le mar., mars 1 2022 at 16:31:22 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> Following the introduction of bridge_atomic_enable in the ingenic
> drm driver, the crtc is enabled between .prepare and .enable, if
> it exists.
>=20
> Add it so the backlight is only enabled after the crtc is, to avoid
> graphical issues.
>=20
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 23 ++++++++++++--
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31=20
> ++++++++++++++++---
>  2 files changed, 48 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c=20
> b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> index f043b484055b..b5736344e3ec 100644
> --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel=20
> *panel)
>  		goto err_disable_regulator;
>  	}
>=20
> -	msleep(120);
> -
>  	return 0;
>=20
>  err_disable_regulator:
> @@ -202,6 +200,25 @@ static int y030xx067a_unprepare(struct drm_panel=20
> *panel)
>  	return 0;
>  }
>=20
> +static int y030xx067a_enable(struct drm_panel *panel)
> +{
> +	if (panel->backlight) {
> +		/* Wait for the picture to be ready before enabling backlight */
> +		msleep(120);
> +	}
> +
> +	return 0;
> +}
> +
> +static int y030xx067a_disable(struct drm_panel *panel)
> +{
> +	struct y030xx067a *priv =3D to_y030xx067a(panel);
> +
> +	regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);

Shouldn't that be balanced by a regmap_set_bits() in the .enable()=20
function?

Cheers,
-Paul

> +
> +	return 0;
> +}
> +
>  static int y030xx067a_get_modes(struct drm_panel *panel,
>  				struct drm_connector *connector)
>  {
> @@ -239,6 +256,8 @@ static int y030xx067a_get_modes(struct drm_panel=20
> *panel,
>  static const struct drm_panel_funcs y030xx067a_funcs =3D {
>  	.prepare	=3D y030xx067a_prepare,
>  	.unprepare	=3D y030xx067a_unprepare,
> +	.enable		=3D y030xx067a_enable,
> +	.disable	=3D y030xx067a_disable,
>  	.get_modes	=3D y030xx067a_get_modes,
>  };
>=20
> diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c=20
> b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> index c558de3f99be..6de7370185cd 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> @@ -80,8 +80,6 @@ static const struct reg_sequence=20
> ej030na_init_sequence[] =3D {
>  	{ 0x47, 0x08 },
>  	{ 0x48, 0x0f },
>  	{ 0x49, 0x0f },
> -
> -	{ 0x2b, 0x01 },
>  };
>=20
>  static int ej030na_prepare(struct drm_panel *panel)
> @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel=20
> *panel)
>  		goto err_disable_regulator;
>  	}
>=20
> -	msleep(120);
> -
>  	return 0;
>=20
>  err_disable_regulator:
> @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel=20
> *panel)
>  	return 0;
>  }
>=20
> +static int ej030na_enable(struct drm_panel *panel)
> +{
> +	struct ej030na *priv =3D to_ej030na(panel);
> +
> +	/* standby off */
> +	regmap_write(priv->map, 0x2b, 0x01);
> +
> +	if (panel->backlight) {
> +		/* Wait for the picture to be ready before enabling backlight */
> +		msleep(120);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ej030na_disable(struct drm_panel *panel)
> +{
> +	struct ej030na *priv =3D to_ej030na(panel);
> +
> +	/* standby on */
> +	regmap_write(priv->map, 0x2b, 0x00);
> +
> +	return 0;
> +}
> +
>  static int ej030na_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel=20
> *panel,
>  static const struct drm_panel_funcs ej030na_funcs =3D {
>  	.prepare	=3D ej030na_prepare,
>  	.unprepare	=3D ej030na_unprepare,
> +	.enable		=3D ej030na_enable,
> +	.disable	=3D ej030na_disable,
>  	.get_modes	=3D ej030na_get_modes,
>  };
>=20
> --
> 2.34.1
>=20


