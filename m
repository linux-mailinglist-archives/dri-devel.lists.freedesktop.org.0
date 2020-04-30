Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7B1C0ECD
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFE56EC15;
	Fri,  1 May 2020 07:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48126E406
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 16:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68804ACC4;
 Thu, 30 Apr 2020 16:19:43 +0000 (UTC)
Message-ID: <0f7f2350cebdbd6904274e6a4e8da6e0a6c72102.camel@suse.de>
Subject: Re: [PATCH v2 05/91] clk: bcm: rpi: Allow the driver to be probed
 by DT
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Thu, 30 Apr 2020 18:19:41 +0200
In-Reply-To: <0f5319caa4d1b9ba8a83a094abcb681d4be6eb1c.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <0f5319caa4d1b9ba8a83a094abcb681d4be6eb1c.1587742492.git-series.maxime@cerno.tech>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0360708308=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0360708308==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-q7dZwA3wemW7oWhPS4wd"


--=-q7dZwA3wemW7oWhPS4wd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-24 at 17:33 +0200, Maxime Ripard wrote:
> The current firmware clock driver for the RaspberryPi can only be probed =
by
> manually registering an associated platform_device.
>=20
> While this works fine for cpufreq where the device gets attached a clkdev
> lookup, it would be tedious to maintain a table of all the devices using
> one of the clocks exposed by the firmware.
>=20
> Since the DT on the other hand is the perfect place to store those
> associations, make the firmware clocks driver probe-able through the devi=
ce
> tree so that we can represent it as a node.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-
> raspberrypi.c
> index 1654fd0eedc9..aedeaaf2f66b 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -255,15 +255,22 @@ static int raspberrypi_clk_probe(struct platform_de=
vice
> *pdev)
>  	struct raspberrypi_clk *rpi;
>  	int ret;
> =20
> -	firmware_node =3D of_find_compatible_node(NULL, NULL,
> -					"raspberrypi,bcm2835-firmware");
> +	/*
> +	 * We can be probed either through the an old-fashioned
> +	 * platform device registration or through a DT node that is a
> +	 * child of the firmware node. Handle both cases.
> +	 */
> +	if (dev->of_node)
> +		firmware_node =3D of_get_parent(dev->of_node);
> +	else
> +		firmware_node =3D of_find_compatible_node(NULL, NULL,
> +							"raspberrypi,bcm2835-
> firmware");
>  	if (!firmware_node) {
>  		dev_err(dev, "Missing firmware node\n");
>  		return -ENOENT;
>  	}
> =20
>  	firmware =3D rpi_firmware_get(firmware_node);
> -	of_node_put(firmware_node);

Why remove this? I think it's still needed after your changes.

Regards,
Nicolas


--=-q7dZwA3wemW7oWhPS4wd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6q+p0ACgkQlfZmHno8
x/5Aewf/fIRt353bQjRQPXHvnCWvme3juReNuol1emq3w4qxjIbYk/3z6mE5Xqik
N6cAGO+Hf35L5nhpW9qXpVTT3vbylYXIZ/OW5weQzIN+oKmUvJh+7FUwzl790OiU
y2LJVs53mnmGErmkoTOkyoJNmDeft+FMuQ+105YbheOsgDY3XKDscjlwQgsk/Vx7
/ELAtNxaNwm0lU2V6TfIgDaIDysRbkao9DtA1c97wG1O6lZAanouAfuIFR+8+xrz
AYKm8KnHJXi4wRSh2BAjm0e3qX+/RaI9RNeT7Xq68tsLl4jbz673IXTuyETjVc0s
Csb4+I6CCUbczBNHzKUO2UntZvTpdQ==
=fDu0
-----END PGP SIGNATURE-----

--=-q7dZwA3wemW7oWhPS4wd--


--===============0360708308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0360708308==--

