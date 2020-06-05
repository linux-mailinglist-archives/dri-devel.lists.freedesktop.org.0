Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9B1EFEBA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 19:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE546E954;
	Fri,  5 Jun 2020 17:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472586E954
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:26:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eda7fee0001>; Fri, 05 Jun 2020 10:25:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 05 Jun 2020 10:26:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 05 Jun 2020 10:26:41 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 17:26:41 +0000
Date: Fri, 5 Jun 2020 19:26:38 +0200
From: Thierry Reding <treding@nvidia.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/dsi: use stack buffer in mipi_dsi_dcs_write()
Message-ID: <20200605172638.GA1265773@ulmo>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.13.1 (2019-12-14)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591377902; bh=cO63qlzZcdapJPw4SxcoaKTGpD3ASzlJay+DwUDJ3NQ=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Disposition;
 b=C7gj/vIdNPlB3V2dfVj6TXn3XYhb8Zew+OP4WC9uFO39MbrpxO7uqPVtmV09FmTeK
 iFZAGGnokXvM/Xb1a74wKBMLyWee1NINcKOByYQDNjNEXf0lDCzyyuR3eQ187M+J+E
 Jg6GdhYIHKPOnpsFyNGmHpZhv5bdCXd0SH9DDGJ70erOw91fwbzPbWLPCvVjHDizVS
 fAGKDti38G0N5KSzAvdurIy1iyFKVyk7mfgaQ1LDtzeESK2uqomzKxC/c0HDUdnSp4
 PWhMDnMaKpQeyjhcWzm+FbO2XxkOnlPL6fGjlHT947CjoOh6fkStUSz6Z4IFAzcrrn
 9+I/sWdfYKyzg==
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0583710639=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0583710639==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 05:03:27PM +0100, Emil Velikov wrote:
> Currently the function heap allocates when we have any payload. Where in
> many case the payload is 1 byte - ouch.
>=20
> From casual observation, vast majority of the payloads are smaller than
> 8 bytes - so use a stack array tx[8] to avoid the senseless kmalloc and
> kfree dance.
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 55531895dde6..b96d5b4629d7 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -748,26 +748,26 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *=
dsi, u8 cmd,
>  {
>  	ssize_t err;
>  	size_t size;
> +	u8 stack_tx[8];
>  	u8 *tx;
> =20
> -	if (len > 0) {
> -		size =3D 1 + len;
> -
> +	size =3D 1 + len;
> +	if (len > ARRAY_SIZE(stack_tx) - 1) {

I think it would be clearer to do:

	if (size > ARRAY_SIZE(stack_tx))

but either way:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7agEwACgkQ3SOs138+
s6FZFBAAiOaIVVnJD8OOSCt7DKABkRAsZEx4T30bJsmThnn5EgoOBxOZK3Do6W0Z
Dka9iho5p8ATX5eAwFPZNyLxs3PJSTukkZfrby1yFRqkDV9V1LK+9vxJc4Mmzexv
m9DkKLiQAJULPSomtXXk0xGi9uUcCUX14P9AzozZVUMPMpQySAcBAga3X2PgVyat
D6t+U/TVSGJmCKsSA/Y0YwCOofMShNZhIZnxjHc3DX0Kg9tTPDS2XwzMqUh+Z9sU
0DtSzx8bTRqQWMoLaYk8JzxabmYJ/LfsGeLpLoCKkkpdaY7JRvmw9osqmpYTJDlH
/M07364eWDY+HT+zvyfoxJ0d14xKehBDKxDBcpyfytT+KjcFPsWMR2YehUnPBe4V
X//SK60y2WUPDGEhdrfRQ9o70DM1lesSfFPBmcD0zP58UFjJ6d9u/kW/6GHkrlQl
Z05bwz8xRbG9QUDowQx/AKdp7Cfxj+nG8fHBsSdSfaCp7hWF4OSO7fONupm9bqZi
lj2ElLu78cbDAuvcgqHznTkbOZK6gAIhKz7bJM7VS2SRCHu4eLvi94VQBO0RQCla
itgie3oDuvn6gLaK/mNEttC6MScOPuGz2g5cQ4nGWe0Grb84BqTqijGxiDrJ24Fb
5fjKA+CHRBSUrZqv+32JKj5P9+EjjMkQ4rfkMbhIm+yCKr7+WD4=
=TUvx
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

--===============0583710639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0583710639==--
