Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C349AE7959
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5BB10E68B;
	Wed, 25 Jun 2025 08:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jun 2025 08:02:54 UTC
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637DD10E68B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:02:54 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id B5D8E1F0004F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:56:09 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id C7969AC79ED; Wed, 25 Jun 2025 07:56:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id BC2BDAC79E5;
 Wed, 25 Jun 2025 07:56:04 +0000 (UTC)
Date: Wed, 25 Jun 2025 09:56:02 +0200
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
Subject: Re: [PATCH 1/5] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in
 combo D-PHY
Message-ID: <aFurkudIvrbRjJ5N@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20250221161751.1278049-2-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M3lDD/H+Q2OgnYvP"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-2-kuba@szczodrzynski.pl>
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


--M3lDD/H+Q2OgnYvP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for working on this! See a few comments below.

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0.
>=20
> In this mode, the DSI peripheral is not used and the PHY is not
> configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
> enable LVDS operation.
>=20
> Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.
>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 65 ++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/al=
lwinner/phy-sun6i-mipi-dphy.c
> index 36eab9527..f958e34da 100644
> --- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> +++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> @@ -166,8 +166,8 @@
>  #define SUN50I_COMBO_PHY_REG0_EN_CP		BIT(0)
> =20
>  #define SUN50I_COMBO_PHY_REG1		0x114
> -#define SUN50I_COMBO_PHY_REG2_REG_VREF1P6(n)	(((n) & 0x7) << 4)
> -#define SUN50I_COMBO_PHY_REG2_REG_VREF0P8(n)	((n) & 0x7)
> +#define SUN50I_COMBO_PHY_REG1_REG_VREF1P6(n)	(((n) & 0x7) << 4)
> +#define SUN50I_COMBO_PHY_REG1_REG_VREF0P8(n)	((n) & 0x7)

Good catch! Would be good to mention in the commit log (or split in a separ=
ate
patch but that might be overdoing it since this register wasn't used so far=
).

>  #define SUN50I_COMBO_PHY_REG2		0x118
>  #define SUN50I_COMBO_PHY_REG2_HS_STOP_DLY(n)	((n) & 0xff)
> @@ -181,7 +181,9 @@ struct sun6i_dphy;
> =20
>  struct sun6i_dphy_variant {
>  	void	(*tx_power_on)(struct sun6i_dphy *dphy);
> +	void	(*lvds_power_on)(struct sun6i_dphy *dphy);
>  	bool	rx_supported;
> +	bool	is_combo_dphy;
>  };
> =20
>  struct sun6i_dphy {
> @@ -222,6 +224,18 @@ static int sun6i_dphy_configure(struct phy *phy, uni=
on phy_configure_opts *opts)
>  	return 0;
>  }
> =20
> +static int sun6i_dphy_set_mode(struct phy *phy, enum phy_mode mode, int =
submode)
> +{
> +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> +
> +	if (mode =3D=3D PHY_MODE_LVDS && !dphy->variant->is_combo_dphy) {
> +		/* Not a combo D-PHY: LVDS is not supported */

Missing a final . in the comment.

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static void sun6i_a31_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
>  {
>  	u8 lanes_mask =3D GENMASK(dphy->config.lanes - 1, 0);
> @@ -329,6 +343,37 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct=
 sun6i_dphy *dphy)
>  	udelay(1);
>  }
> =20
> +static void sun50i_a100_mipi_dphy_lvds_power_on(struct sun6i_dphy *dphy)
> +{
> +	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1,
> +		     SUN50I_COMBO_PHY_REG1_REG_VREF1P6(4) |
> +		     SUN50I_COMBO_PHY_REG1_REG_VREF0P8(3));
> +
> +	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +		     SUN50I_COMBO_PHY_REG0_EN_CP);
> +	udelay(5);

Please add a white space here...

> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS);
> +	udelay(5);

here too...

> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
> +			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
> +	udelay(5);

here too...

> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_MIPI,
> +			   SUN50I_COMBO_PHY_REG0_EN_MIPI);
> +
> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
> +		     SUN6I_DPHY_ANA4_REG_EN_MIPI |
> +		     SUN6I_DPHY_ANA4_REG_IB(2));
here too...

> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
> +		     SUN6I_DPHY_ANA3_EN_LDOR |
> +		     SUN6I_DPHY_ANA3_EN_LDOD);

here too...

> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG, 0);

and here too in order to match the coding style.

> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG, 0);
> +}
> +
>  static int sun6i_dphy_tx_power_on(struct sun6i_dphy *dphy)
>  {
>  	u8 lanes_mask =3D GENMASK(dphy->config.lanes - 1, 0);
> @@ -492,6 +537,14 @@ static int sun6i_dphy_power_on(struct phy *phy)
>  {
>  	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> =20
> +	if (phy->attrs.mode =3D=3D PHY_MODE_LVDS && dphy->variant->is_combo_dph=
y) {
> +		if (dphy->variant->lvds_power_on) {
> +			dphy->variant->lvds_power_on(dphy);
> +			return 0;
> +		}
> +		return -EINVAL;

This would look better the other way round: first check:
	if (!dphy->variant->lvds_power_on)
		return -EINVAL;

and then call the function pointer and return 0 without extra indentation.

> +	}
> +
>  	switch (dphy->direction) {
>  	case SUN6I_DPHY_DIRECTION_TX:
>  		return sun6i_dphy_tx_power_on(dphy);
> @@ -514,6 +567,11 @@ static int sun6i_dphy_power_off(struct phy *phy)
>  	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG, 0);
>  	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG, 0);
> =20
> +	if (phy->attrs.mode =3D=3D PHY_MODE_LVDS && dphy->variant->is_combo_dph=
y) {
> +		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1, 0);
> +		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0, 0);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -533,6 +591,7 @@ static const struct phy_ops sun6i_dphy_ops =3D {
>  	.configure	=3D sun6i_dphy_configure,
>  	.power_on	=3D sun6i_dphy_power_on,
>  	.power_off	=3D sun6i_dphy_power_off,
> +	.set_mode	=3D sun6i_dphy_set_mode,
>  	.init		=3D sun6i_dphy_init,
>  	.exit		=3D sun6i_dphy_exit,
>  };
> @@ -619,6 +678,8 @@ static const struct sun6i_dphy_variant sun6i_a31_mipi=
_dphy_variant =3D {
> =20
>  static const struct sun6i_dphy_variant sun50i_a100_mipi_dphy_variant =3D=
 {
>  	.tx_power_on	=3D sun50i_a100_mipi_dphy_tx_power_on,
> +	.lvds_power_on	=3D sun50i_a100_mipi_dphy_lvds_power_on,
> +	.is_combo_dphy	=3D true,
>  };
> =20
>  static const struct of_device_id sun6i_dphy_of_table[] =3D {
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--M3lDD/H+Q2OgnYvP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbq5IACgkQhP3B6o/u
lQytpg//bGHggO6GMgSRUWrRfU67xQXC0LWqeX5lbWuCQJk2xbXl8iQMa9wosfOG
oGqxsObFtN+fh7G/j+I8hBtoB8V6/5PfYpYmN4YmZxwy2lur5ULXAB82DApLV2ki
+Eb5/Fox4n+t3mcfkrL9vseJHEfu1Em4CiM06U3h/GQidM6plSj+NU4J0+Rnn93G
ayYVPuuoqcfdfnjMbGCOoGJFjlVbCAM/D71wyeBepFaEYTPgq+4LidmpPhaS7irt
BgSH+D59cMj2ChJJQCRh3E5BkbAOWi62T7TIbzfIc/eKCaZgABN0DGFcpBoA22JG
tuRrdpDXp5YcfPYfitvRt0idVyJsBG+zcuHY2fQlqjCrMWAVcctNZWX8jpu8LY7r
oT727jRFb1oVVBr0FNyP1AM9PKmBhY2fj3S+vQvjSBYe1kKTjvxaMhyeT9+K7ihC
fY3Hm7hLbDjm5TO8mSfRADkZLXZ+mvtYw7wg7apzWWfE2aCmg+EItQcw9WYAIZrH
cCzCC2LftXzY9B24svI8K5rSE0gMGFKcs+2WWoEaLFCXosGWeJ+w2es6a0jQGvJc
augMFPF1G1NqbN61PLXrK5JYDvzwu//BgrmNKo9fgCHUsId03crklxmU/crqj3g5
5pkqZEm8h+ZWxCUbO6sC0qauT63pXfy5OmMSLpJeIGqW2z8B3u0=
=LII3
-----END PGP SIGNATURE-----

--M3lDD/H+Q2OgnYvP--
