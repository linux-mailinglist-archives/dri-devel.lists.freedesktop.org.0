Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358D2D9B69
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A33B6E213;
	Mon, 14 Dec 2020 15:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425CE6E213
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:50:09 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:50:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961009;
 bh=Qq101I6HQFjSJ0f8meR5JgRX4pD1pU+G5hTz2A6kqNI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/j4Q+hSaE9EBpsxq2b9yO63g/xJoXi3YUA7rB49Q5bgklSIyH5nPOxpNp0W8yFwE
 X9cjEpsWxB8riQ1lEhgdq4Lo6CgSB1xYXQAg6gOHMbUkhrZsPPn+HKHBPUVeVgZVPw
 75jPz/I5/iE+rLSuOGVZ56RnsWh//uoFDy1Fm3587/DNs1lONaX+u2xaecprpezMfY
 oTdUPVoaPJ5ScZR6kWRpx5PM0GgrwJDmQwwdJvxYmNr/QKNuMds1J96EOpiND76NiT
 Km0ZM4xLbztXPSKdj7ELgU7GHmU86qCopuQjGS7g4VDOYV0to+4TIj8vIPrmhWllEB
 DRP53Nrk0BfIw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 13/29] drm/omap: dsi: skip dsi_vc_enable_hs when
 already in correct mode
Message-ID: <20201214155006.7euc4ptnk66erzjz@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-14-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-14-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============1386161528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1386161528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjsk4eal7k7jmjw2"
Content-Disposition: inline


--vjsk4eal7k7jmjw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:39PM +0200, Tomi Valkeinen wrote:
> Simplify and optimize dsi_vc_enable_hs() so that it can be called
> without checking the current HS/LP mode. Make dsi_vc_enable_hs() return
> if the VC is already in the correct mode.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index a1f3623f45b1..544f5f1eed91 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -341,7 +341,6 @@ struct dsi_data {
>  	int irq;
> =20
>  	bool is_enabled;
> -	bool in_lp_mode;
> =20
>  	struct clk *dss_clk;
>  	struct regmap *syscon;
> @@ -2441,6 +2440,9 @@ static void dsi_vc_enable_hs(struct omap_dss_device=
 *dssdev, int vc,
> =20
>  	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
> =20
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 9, 9) =3D=3D enable)
> +		return;
> +
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
>  	dsi_vc_enable(dsi, vc, 0);
> @@ -2456,8 +2458,6 @@ static void dsi_vc_enable_hs(struct omap_dss_device=
 *dssdev, int vc,
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
>  		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
> -
> -	dsi->in_lp_mode =3D !enable;
>  }
> =20
>  static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
> @@ -4891,9 +4891,7 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_d=
ata *dsi, int vc,
>  	struct omap_dss_device *dssdev =3D &dsi->output;
>  	int r;
> =20
> -	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) !=3D dsi->in_lp_mode)
> -		dsi_vc_enable_hs(dssdev, vc,
> -				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
> +	dsi_vc_enable_hs(dssdev, vc, !(msg->flags & MIPI_DSI_MSG_USE_LPM));
> =20
>  	switch (msg->type) {
>  	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--vjsk4eal7k7jmjw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xia4ACgkQ2O7X88g7
+poNbA/8DSW6zBL8AM3rWF+1KZKvVAJ14T0P+M7ll+A2ZATuyeWozsiKWqIUnVNq
WhHbrewK04ZNna6nwBmq/H2DZeWV6ZFA6aDVT1df0nAaDR0veG1yrj7orftQ7r6b
NVYGPgrd6+eCLUzE2SojmiThubbbj7PWblBwB+VA2bZVZF9Nk9kpo7PrL15FuKQR
G8VqEF/y4ffyZf8d8ulNEbflZp00azexLX6wrlp4FdHR1iYCkrpf2NVC4te8XflS
ugA9G4vYwL9V+RZTqgHHDCsqadrCjimcjp0oRfABOJy0TLHLnWer8+7Nh9wj+l/z
kdBSgNHjdCs/8vSWxzYGInN5+S47p5WVGRu8w2EH9AZBfEduNGncjFoL+kaN9eJF
pmjP+PNOy8Plb4RabwLY6IUTJYQDQlJRhEnz25Y26MD3mHEY3yLwACyWG0Y2RReB
AuDXkboK2RhUl6Rfc34nTogl4dyWtJFJBxdZ9Nik05IaslzghlLZzZmnJN6Cub7S
1rq96acw4tCt4sj2/sRMUe41S9h/oEYzkFsqVapQLhzMfY76l4TneVe2Ik0aGHzM
r0rLkuNFFH6/pffQ+ppzWXFbi1rxduPCTSOeZkeE5IruyMcXVsmsZZQ16Nk+sHJf
wYDVWDpzquH3eSab3aHT5tmheFWJLq3u6ZaRT1KHau0BBv1bZYM=
=YVNv
-----END PGP SIGNATURE-----

--vjsk4eal7k7jmjw2--

--===============1386161528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1386161528==--
