Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C461F0F1C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45A16E426;
	Sun,  7 Jun 2020 19:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB546E96E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 18:11:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2843AF48;
 Fri,  5 Jun 2020 18:11:07 +0000 (UTC)
Message-ID: <977dd9ba222d8c513b09743da5cb53fd14bfd9a0.camel@suse.de>
Subject: Re: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 Jun 2020 20:11:01 +0200
In-Reply-To: <20200605174329.hf5d6oulmcewzw63@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
 <faacbc33174e77500e04e609a654c5810045cb42.camel@suse.de>
 <20200605174329.hf5d6oulmcewzw63@gilmour.lan>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1002658026=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1002658026==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+FKCCfaEGN1+KOjI+Hug"


--=-+FKCCfaEGN1+KOjI+Hug
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-05 at 19:43 +0200, Maxime Ripard wrote:
> Hi Nicolas,
>=20
> On Thu, Jun 04, 2020 at 07:26:07PM +0200, Nicolas Saenz Julienne wrote:
> > On Wed, 2020-05-27 at 17:47 +0200, Maxime Ripard wrote:
> > > The HDMI block has a block that controls clocks and reset signals to =
the
> > > HDMI0 and HDMI1 controllers.
> >=20
> > Why not having two separate drivers?
>=20
> They share the same address space, so it wouldn't really make sense to
> split it into two drivers and an MFD, especially when the clock/reset
> association is fairly common.

Fair enough.

>=20
> > > Let's expose that through a clock driver implementing a clock and res=
et
> > > provider.
> > >=20
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/bcm/Kconfig           |  11 +++-
> > >  drivers/clk/bcm/Makefile          |   1 +-
> > >  drivers/clk/bcm/clk-bcm2711-dvp.c | 127 ++++++++++++++++++++++++++++=
+++-
> > >  3 files changed, 139 insertions(+)
> > >  create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
> > >=20
> > > diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> > > index 8c83977a7dc4..784f12c72365 100644
> > > --- a/drivers/clk/bcm/Kconfig
> > > +++ b/drivers/clk/bcm/Kconfig
> > > @@ -1,4 +1,15 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config CLK_BCM2711_DVP
> > > +	tristate "Broadcom BCM2711 DVP support"
> > > +	depends on ARCH_BCM2835 ||COMPILE_TEST
> > > +	depends on COMMON_CLK
> > > +	default ARCH_BCM2835
> > > +	select RESET_SIMPLE
> > > +	help
> > > +	  Enable common clock framework support for the Broadcom BCM2711
> > > +	  DVP Controller.
> > > +
> > >  config CLK_BCM2835
> > >  	bool "Broadcom BCM2835 clock support"
> > >  	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
> > > diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> > > index 0070ddf6cdd2..2c1349062147 100644
> > > --- a/drivers/clk/bcm/Makefile
> > > +++ b/drivers/clk/bcm/Makefile
> > > @@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-kona-setup.o
> > >  obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-bcm281xx.o
> > >  obj-$(CONFIG_CLK_BCM_KONA)	+=3D clk-bcm21664.o
> > >  obj-$(CONFIG_COMMON_CLK_IPROC)	+=3D clk-iproc-armpll.o clk-iproc-pll=
.o
> > > clk-iproc-asiu.o
> > > +obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2711-dvp.o
> > >  obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2835.o
> > >  obj-$(CONFIG_CLK_BCM2835)	+=3D clk-bcm2835-aux.o
> > >  obj-$(CONFIG_CLK_RASPBERRYPI)	+=3D clk-raspberrypi.o
> > > diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-
> > > bcm2711-
> > > dvp.c
> > > new file mode 100644
> > > index 000000000000..c1c4b5857d32
> > > --- /dev/null
> > > +++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
> > > @@ -0,0 +1,127 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +// Copyright 2020 Cerno
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset-controller.h>
> > > +#include <linux/reset/reset-simple.h>
> > > +
> > > +#define DVP_HT_RPI_SW_INIT	0x04
> > > +#define DVP_HT_RPI_MISC_CONFIG	0x08
> > > +
> > > +#define NR_CLOCKS	2
> > > +#define NR_RESETS	6
> > > +
> > > +struct clk_dvp {
> > > +	struct clk_hw_onecell_data	*data;
> > > +	struct reset_simple_data	reset;
> > > +};
> > > +
> > > +static const struct clk_parent_data clk_dvp_parent =3D {
> > > +	.index	=3D 0,
> > > +};
> > > +
> > > +static int clk_dvp_probe(struct platform_device *pdev)
> > > +{
> > > +	struct clk_hw_onecell_data *data;
> > > +	struct resource *res;
> > > +	struct clk_dvp *dvp;
> > > +	void __iomem *base;
> > > +	int ret;
> > > +
> > > +	dvp =3D devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
> > > +	if (!dvp)
> > > +		return -ENOMEM;
> > > +	platform_set_drvdata(pdev, dvp);
> > > +
> > > +	dvp->data =3D devm_kzalloc(&pdev->dev,
> > > +				 struct_size(dvp->data, hws, NR_CLOCKS),
> > > +				 GFP_KERNEL);
> > > +	if (!dvp->data)
> > > +		return -ENOMEM;
> > > +	data =3D dvp->data;
> > > +
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	base =3D devm_ioremap_resource(&pdev->dev, res);
> >=20
> > I think the cool function to use these days is
> > devm_platform_get_and_ioremap_resource().
>=20
> i'll change it, thanks!

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-+FKCCfaEGN1+KOjI+Hug
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7airUACgkQlfZmHno8
x/6RAwgAoMvooAyRe7S9Zeth+KfsqdhHw7fSaIfcyW+1B1hAhY9U35yLYXdM9MqY
aYWnkeHuMN+ic3frCKcxnR4ySNuiDgvYl9jFOhaEZZePo7dnVoLVrOTaMBs421SQ
0+roDhCtWXx2tUMKkNLK7w7YRMyDrHP0xFO0+3gFV0k4dD4bBQYwTpT7Yz9k6Big
wDDlyAeh+Tj5UlMZ7ADJx4Du6nPMDk0P/urKo0AyrnegExOBwlDLKDInRHZg5+G8
VzgHMoQylpyo3hTBHpSYv2ZXtk3MwvJHi22o42gDzKSfsy6xCrI+/FxdJ+JFmd5i
Eb0zIV6tEQZNERBn5IILIGn3CWeKzA==
=i89s
-----END PGP SIGNATURE-----

--=-+FKCCfaEGN1+KOjI+Hug--


--===============1002658026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1002658026==--

