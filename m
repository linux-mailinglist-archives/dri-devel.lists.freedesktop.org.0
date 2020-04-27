Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F189A1BBE16
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBF86E3EB;
	Tue, 28 Apr 2020 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505816E109
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 11:24:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BADA4ABC2;
 Mon, 27 Apr 2020 11:24:15 +0000 (UTC)
Message-ID: <4842d1b72192bb7c461a2d50c8798f178da964e0.camel@suse.de>
Subject: Re: [PATCH v2 04/91] firmware: rpi: Only create clocks device if we
 don't have a node for it
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Mon, 27 Apr 2020 13:24:14 +0200
In-Reply-To: <b181d867cb9523e1877a3dfd258bafde2988024f.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <b181d867cb9523e1877a3dfd258bafde2988024f.1587742492.git-series.maxime@cerno.tech>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0065676404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0065676404==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-t2CrNR4eS4OpaMihaaXw"


--=-t2CrNR4eS4OpaMihaaXw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri, 2020-04-24 at 17:33 +0200, Maxime Ripard wrote:
> The firmware clocks driver was previously probed through a platform_devic=
e
> created by the firmware driver.
>=20
> Since we will now have a node for that clocks driver, we need to create t=
he
> device only in the case where there's no node for it already.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/firmware/raspberrypi.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index da26a584dca0..1874f41b007c 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -210,6 +210,15 @@ rpi_register_hwmon_driver(struct device *dev, struct
> rpi_firmware *fw)
> =20
>  static void rpi_register_clk_driver(struct device *dev)
>  {
> +	/*
> +	 * Earlier DTs don't have a node for the firmware clocks but
> +	 * rely on us creating a platform device by hand. If we do
> +	 * have a node for the firmware clocks, just bail out here.
> +	 */
> +	if (of_get_compatible_child(dev->of_node,
> +				    "raspberrypi,firmware-clocks"))
> +		return;
> +
>  	rpi_clk =3D platform_device_register_data(dev, "raspberrypi-clk",
>  						-1, NULL, 0);
>  }
> @@ -262,8 +271,12 @@ static int rpi_firmware_remove(struct platform_devic=
e
> *pdev)
> =20
>  	platform_device_unregister(rpi_hwmon);
>  	rpi_hwmon =3D NULL;
> -	platform_device_unregister(rpi_clk);
> -	rpi_clk =3D NULL;
> +
> +	if (rpi_clk) {

rpi_clk, being a static global variable, will be zeroed by default. So, if =
you
don't register the platform device, rpi_clk is going to be NULL, which you'=
re
allowed to feed platform_device_unregister(), so no need to be extra carefu=
l.

Regards,
Nicolas

> +		platform_device_unregister(rpi_clk);
> +		rpi_clk =3D NULL;
> +	}
> +
>  	mbox_free_channel(fw->chan);
> =20
>  	return 0;


--=-t2CrNR4eS4OpaMihaaXw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6mwN4ACgkQlfZmHno8
x/5xXAf+Ng2E3SKjoUMbR1+VP/yWSENtjk2GqBEMGPPIZYYmsbkt9al9HYQZJ5C3
nwOXe0b3145xT5Von1/JrpzL3sPIp29cbA9zYKU+7x+WpZtSctau+dkeM5VpTPdw
hHu01BPVOX2KJERjvB8u4y25U2Xpm1LzosEf9CFGDxng3LDaBrgP4j779Oq9sbq3
0pfATYlX1KFsMwbN3twlsShGwuokSb6kdcrKj53kBP2alNxL2dGpre4COea33YAx
Ro1hGda3eGhqBndalntUHQ0MsSiKIwdkQP4H287W+D7UPb46ee0GdRcoVohqQadY
W9mJfQMFIP2MiJ/tYqxOUPFqBrJi7A==
=fYAz
-----END PGP SIGNATURE-----

--=-t2CrNR4eS4OpaMihaaXw--


--===============0065676404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0065676404==--

