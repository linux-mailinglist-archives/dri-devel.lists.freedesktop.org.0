Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADAE2CC0FE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 16:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8067A6EA58;
	Wed,  2 Dec 2020 15:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718716EA5B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 15:37:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 2D12C3B9A17
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 15:37:23 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CA480C0009;
 Wed,  2 Dec 2020 15:36:59 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:36:59 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <X8e0mwSnhVZBUcU2@aptenodytes>
References: <20201102155308.142691-1-paul.kocialkowski@bootlin.com>
 <20201102155308.142691-3-paul.kocialkowski@bootlin.com>
 <20201104212221.GA5588@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20201104212221.GA5588@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0081424732=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0081424732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Xz4AXsuSr8pfC7G"
Content-Disposition: inline


--2Xz4AXsuSr8pfC7G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Wed 04 Nov 20, 22:22, Sam Ravnborg wrote:
> Hi Paul.
>=20
> A few comments in the following. I did not find time to read all of the
> driver.

Thanks for taking a look at the driver!

>=20
> 	Sam
>=20
> On Mon, Nov 02, 2020 at 04:53:07PM +0100, Paul Kocialkowski wrote:
> > Introduces a driver for the LogiCVC display controller, a programmable
> > logic controller optimized for use in Xilinx Zynq-7000 SoCs and other
> > Xilinx FPGAs. The controller is mostly configured at logic synthesis
> > time so only a subset of configuration is left for the driver to
> > handle.
> >=20
> > The following features are implemented and tested:
> > - LVDS 4-bit interface;
> > - RGB565 pixel formats;
> > - Multiple layers and hardware composition;
> > - Layer-wide alpha mode;
> >=20
> > The following features are implemented but untested:
> > - Other RGB pixel formats;
> > - Layer framebuffer configuration for version 4;
> > - Lowest-layer used as background color;
> > - Per-pixel alpha mode.
> >=20
> > The following features are not implemented:
> > - YUV pixel formats;
> > - DVI, LVDS 3-bit, ITU656 and camera link interfaces;
> > - External parallel input for layer;
> > - Color-keying;
> > - LUT-based alpha modes.
> >=20
> > Additional implementation-specific notes:
> > - Panels are only enabled after the first page flip to avoid flashing a
> >   white screen.
> > - Depth used in context of the LogiCVC driver only counts color compone=
nts
> >   to match the definition of the synthesis parameters.
> >=20
> > Support is implemented for both version 3 and 4 of the controller.
> >=20
> > With version 3, framebuffers are stored in a dedicated contiguous
> > memory area, with a base address hardcoded for each layer. This requires
> > using a dedicated CMA pool registered at the base address and tweaking a
> > few offset-related registers to try to use any buffer allocated from
> > the pool. This is done on a best-effort basis to have the hardware cope
> > with the DRM framebuffer allocation model and there is no guarantee
> > that each buffer allocated by GEM CMA can be used for any layer.
> > In particular, buffers allocated below the base address for a layer are
> > guaranteed not to be configurable for that layer. See the implementatio=
n of
> > logicvc_layer_buffer_find_setup for specifics.
> >=20
> > Version 4 allows configuring each buffer address directly, which
> > guarantees that any buffer can be configured.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  MAINTAINERS                                 |   6 +
> >  drivers/gpu/drm/Kconfig                     |   2 +
> >  drivers/gpu/drm/Makefile                    |   1 +
> >  drivers/gpu/drm/logicvc/Kconfig             |   9 +
> >  drivers/gpu/drm/logicvc/Makefile            |   4 +
> >  drivers/gpu/drm/logicvc/logicvc_crtc.c      | 277 +++++++++
> >  drivers/gpu/drm/logicvc/logicvc_crtc.h      |  21 +
> >  drivers/gpu/drm/logicvc/logicvc_drm.c       | 472 +++++++++++++++
> >  drivers/gpu/drm/logicvc/logicvc_drm.h       |  64 ++
> >  drivers/gpu/drm/logicvc/logicvc_interface.c | 224 +++++++
> >  drivers/gpu/drm/logicvc/logicvc_interface.h |  30 +
> >  drivers/gpu/drm/logicvc/logicvc_layer.c     | 615 ++++++++++++++++++++
> >  drivers/gpu/drm/logicvc/logicvc_layer.h     |  64 ++
> >  drivers/gpu/drm/logicvc/logicvc_mode.c      | 101 ++++
> >  drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
> >  drivers/gpu/drm/logicvc/logicvc_of.c        | 197 +++++++
> >  drivers/gpu/drm/logicvc/logicvc_of.h        |  46 ++
> >  drivers/gpu/drm/logicvc/logicvc_regs.h      |  88 +++
> >  18 files changed, 2236 insertions(+)
> >  create mode 100644 drivers/gpu/drm/logicvc/Kconfig
> >  create mode 100644 drivers/gpu/drm/logicvc/Makefile
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
> >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 71e29dc0ab9d..9c4c5edef0ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5522,6 +5522,12 @@ S:	Orphan / Obsolete
> >  F:	drivers/gpu/drm/i810/
> >  F:	include/uapi/drm/i810_drm.h
> > =20
> > +DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
> > +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +S:	Supported
> > +F:	drivers/gpu/drm/logicvc/
> > +
> >  DRM DRIVER FOR LVDS PANELS
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  L:	dri-devel@lists.freedesktop.org
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 64376dd298ed..7b280056207f 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -352,6 +352,8 @@ source "drivers/gpu/drm/arc/Kconfig"
> > =20
> >  source "drivers/gpu/drm/hisilicon/Kconfig"
> > =20
> > +source "drivers/gpu/drm/logicvc/Kconfig"
> > +
> >  source "drivers/gpu/drm/mediatek/Kconfig"
> > =20
> >  source "drivers/gpu/drm/zte/Kconfig"
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 81569009f884..29fbb7cd9570 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -102,6 +102,7 @@ obj-$(CONFIG_DRM_STM) +=3D stm/
> >  obj-$(CONFIG_DRM_STI) +=3D sti/
> >  obj-y 			+=3D imx/
> >  obj-$(CONFIG_DRM_INGENIC) +=3D ingenic/
> > +obj-$(CONFIG_DRM_LOGICVC) +=3D logicvc/
> >  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek/
> >  obj-$(CONFIG_DRM_MESON)	+=3D meson/
> >  obj-y			+=3D i2c/
> > diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/=
Kconfig
> > new file mode 100644
> > index 000000000000..300b2be07385
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/Kconfig
> > @@ -0,0 +1,9 @@
> > +config DRM_LOGICVC
> > +	tristate "LogiCVC DRM"
> > +	depends on DRM
> > +	depends on OF || COMPILE_TEST
> > +	select DRM_KMS_HELPER
> > +	select DRM_KMS_CMA_HELPER
> > +	select DRM_GEM_CMA_HELPER
> > +	help
> > +	  DRM display driver for the logiCVC programmable logic block from Xy=
lon
> > diff --git a/drivers/gpu/drm/logicvc/Makefile b/drivers/gpu/drm/logicvc=
/Makefile
> > new file mode 100644
> > index 000000000000..c09531fbd6ad
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/Makefile
> > @@ -0,0 +1,4 @@
> > +logicvc-drm-y +=3D logicvc_crtc.o logicvc_drm.o logicvc_interface.o \
> > +		 logicvc_layer.o logicvc_mode.o logicvc_of.o
> > +
> Even after maintaining kbuild for several years and reading far too many
> Makefile I still dislike the use of '\' to break long assignments.
>=20
> logicvc-drm-y :=3D logicvc_crtc.o
> logicvc-drm-y +=3D logicvc_drm.o
> logicvc-drm-y +=3D logicvc_interface.o
> logicvc-drm-y +=3D logicvc_layer.o
> logicvc-drm-y +=3D logicvc_mode.o
> logicvc-drm-y +=3D logicvc_of.o
>=20
> Or if this is too much repeated the shorter:
> logicvc-drm-y :=3D logicvc_crtc.o logicvc_drm.o logicvc_interface.o
> logicvc-drm-y +=3D logicvc_layer.o logicvc_mode.o logicvc_of.o
>=20
> Also note that the first stement is an assingnment and not an addition.
>=20
> It is a personal thing - so feel free to ignore.

I agree that it looks ugly and starting with +=3D doesn't really make sense.
But personally, I find that repeating the variable name doesn't look quite
nice either. I think I'll settle for something like:

logicvc-drm-y =3D logicvc_crtc.o \
		logicvc_drm.o \
		...
		logicvc_of.o
>=20
> > +obj-$(CONFIG_DRM_LOGICVC) +=3D logicvc-drm.o
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/l=
ogicvc/logicvc_crtc.c
> > new file mode 100644
> > index 000000000000..75e6a47a7724
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> > @@ -0,0 +1,277 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> ...
>=20
>  +
> > +int logicvc_crtc_init(struct logicvc_drm *logicvc)
> > +{
> > +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> > +	struct device *dev =3D drm_dev->dev;
> > +	struct device_node *of_node =3D dev->of_node;
> > +	struct logicvc_crtc *crtc;
> > +	struct logicvc_layer *layer_primary;
> > +	int ret;
> > +
> > +	crtc =3D devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> > +	if (!crtc)
> > +		return -ENOMEM;
> > +
> > +	layer_primary =3D logicvc_layer_get_primary(logicvc);
> > +	if (!layer_primary) {
> > +		DRM_ERROR("Failed to get primary layer\n");
> > +		return -EINVAL;
> > +	}
> Please use drm_err(logicvc->drm, "...") and friends all over the file.
> DRM_DEV_ERROR() and friends are deprecated.
> If you have no drm_device use whatever.

Understood, I'll change that in the next revision!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2Xz4AXsuSr8pfC7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/HtJsACgkQ3cLmz3+f
v9FQDgf/fZpfvWdvgx3Tm9BVP4vHB4lWjs4uxfn2wWWfJYpvh/uJ6j8a/Z9y+BxH
V7Dgt44xakQhnYa5D1Y8B+3gtRb+aSlwV1bzErc4pRv0Hb/Ld1zeN23Ic8Kf+7I9
YOrKntMHEunF4QB+CMO0n0yEvQLubl/wWt2Y0SDhS0hvE5bWEMJn1mT+JByhpZYL
BxMHpUPYAoi3HEnYhm/IJ1sEEk4GIiOa4mn/qZ4LO2PQvNc9WpCAC4iGyrW7xOMU
a6sGcXcUSyjl2M8I4DhqAe7efcK/e9clRXMxG5HS9vcw6Y36TkAiyiDiMiKKBlPt
kvlwDl6NWSwGwJUj3nmh8xWbUC727Q==
=zAa+
-----END PGP SIGNATURE-----

--2Xz4AXsuSr8pfC7G--

--===============0081424732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0081424732==--
