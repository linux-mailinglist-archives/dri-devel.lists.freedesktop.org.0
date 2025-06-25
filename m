Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBDBAE7962
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A9A10E68E;
	Wed, 25 Jun 2025 08:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CFC10E68E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:03:44 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id AABC71F0004F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:03:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 41F69AC79F8; Wed, 25 Jun 2025 08:03:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 14C8CAC7957;
 Wed, 25 Jun 2025 08:03:39 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:03:36 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
Message-ID: <aFutWCScsMNgXUAu@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-3-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2x3bFr3NhO0jjsdL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-3-kuba@szczodrzynski.pl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2x3bFr3NhO0jjsdL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Some comments below.

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> On Allwinner chips with a combo D-PHY, the TCON LCD0 should fetch it
> from device tree, in order to enable LVDS. Since the PHY also needs to
> be powered off to disable LVDS, add a function to the quirks.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  6 ++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 960e83c82..ccf335a61 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> @@ -183,6 +184,8 @@ static void sun4i_tcon_lvds_set_status(struct sun4i_t=
con *tcon,
>  	} else {
>  		regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_IF_REG,
>  				   SUN4I_TCON0_LVDS_IF_EN, 0);

Does the T113-S3/D1 also have LVDS support in TCON regsiters?
My understanding is that it only has the combo-phy, so this register write
should not take place.

I think it would be easier to just move this to a common callback for users=
 of
the tcon0 lvds phy and always call=20

> +		if (tcon->quirks->disable_lvds_phy)
> +			tcon->quirks->disable_lvds_phy(tcon, encoder);

Also "disable" is often used as opposite of "enable", so I would suggest us=
ing
"teardown" as opposite of "setup" instead.

>  	}
>  }
> =20
> @@ -1245,6 +1248,15 @@ static int sun4i_tcon_bind(struct device *dev, str=
uct device *master,
>  		goto err_free_dclk;
>  	}
> =20
> +	if (tcon->quirks->has_combo_dphy) {
> +		tcon->dphy =3D devm_phy_get(dev, "dphy");

I don't think it makes sense to call this dphy since it's used in LVDS mode
and not in D-PHY mode. I would suggest using "combo" as phy name instead.

It would have made more sense to also have the compatible reflect this
(by calling it combo-phy instead of mipi-dphy) but it's too late now.

> +		if (IS_ERR(tcon->dphy)) {
> +			dev_err(dev, "Couldn't get the combo D-PHY\n");
> +			ret =3D PTR_ERR(tcon->dphy);
> +			goto err_free_dclk;
> +		}
> +	}
> +
>  	if (tcon->quirks->has_channel_0) {
>  		/*
>  		 * If we have an LVDS panel connected to the TCON, we should
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/s=
un4i_tcon.h
> index fa23aa23f..b270d1a13 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -239,6 +239,7 @@ struct sun4i_tcon_quirks {
>  	bool	has_channel_0;	/* a83t does not have channel 0 on second TCON */
>  	bool	has_channel_1;	/* a33 does not have channel 1 */
>  	bool	has_lvds_alt;	/* Does the LVDS clock have a parent other than the =
TCON clock? */
> +	bool	has_combo_dphy; /* Is the D-PHY used for LVDS output? */
>  	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
>  	bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
>  	bool	supports_lvds;   /* Does the TCON support an LVDS output? */
> @@ -250,6 +251,8 @@ struct sun4i_tcon_quirks {
>  	/* handler for LVDS setup routine */
>  	void	(*setup_lvds_phy)(struct sun4i_tcon *tcon,
>  				  const struct drm_encoder *encoder);
> +	void	(*disable_lvds_phy)(struct sun4i_tcon *tcon,
> +				    const struct drm_encoder *encoder);
>  };
> =20
>  struct sun4i_tcon {
> @@ -282,6 +285,9 @@ struct sun4i_tcon {
>  	/* Associated crtc */
>  	struct sun4i_crtc		*crtc;
> =20
> +	/* Associated D-PHY */
> +	struct phy			*dphy;
> +
>  	int				id;
> =20
>  	/* TCON list management */
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--2x3bFr3NhO0jjsdL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbrVgACgkQhP3B6o/u
lQxnIhAAhxvpGk5iu3GYSCq8EbYxLP0XgYfTkaAH54Zet2LTYk7P4AuzXmopcX4e
N/4ZElElUqgy80ScsSc9cXgkVzESvITZct1RbbJrhMNsNnaJXiG2thBwlf+K/HDn
2mzyKSLPkgIzEbrhkLchwpnahcplsnRoTeDwuKjGVGRpHdgCjirSy2oyDjjWIPx8
yxRd6Lh3QnWef8Rp+2Ad/mzF/RwPsPf0j1Cd9sVa29ICvejakCdBPgP2r0/zLBiO
lixWOi6P/8896L+mXNGwtbitd7KGEMSHMGfMnuggyzQufD7kEIlVvujJf62j96JN
eGkeexJTO9ZBruyBM6HF72uPDe+UL57URKMPb0ZQEEu4s/XLKeqzy+am+JXj2lnI
lYjwceLHCmAeIuCEbqPWAxJDjJA5J3J9K4YRA8DKtBqbOn8hSZp21n1e3cKsVRL9
LPAxyJQ8HkbGrlldSEDTbw3vR5yrBins3OEVqt8/VH6NimfOjsfXnZxqXC8pTZ0A
kc27/8mojPQ8MMpf9ms2lBIcGh5dPZjAicy/Iahl/l1w5xEc7CJGiSUf4FEK29MJ
sIuHsVGsVDgzt39z6itWeGLGzYX8tT0SThStwa4h/DMb97Bj7XbWZfZNrfnZTWjS
pJzD1zflVjGaQWnsIzX5S+mAS44sCdV/5zZjzvFdOB65MaDEkOs=
=p+Op
-----END PGP SIGNATURE-----

--2x3bFr3NhO0jjsdL--
