Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A79EF47
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035E0892BE;
	Tue, 27 Aug 2019 15:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5F892BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:46:48 +0000 (UTC)
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5ECA3200007;
 Tue, 27 Aug 2019 15:46:39 +0000 (UTC)
Date: Tue, 27 Aug 2019 17:48:10 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Message-ID: <20190827154810.mr5jt2rkaorrry3t@uno.localdomain>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-9-jacopo+renesas@jmondi.org>
 <20190827002422.GQ5031@pendragon.ideasonboard.com>
 <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
MIME-Version: 1.0
In-Reply-To: <20190827145619.33s7gkv7tgtsr6nz@uno.localdomain>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============0140039973=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0140039973==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4lusbristpbjpnut"
Content-Disposition: inline


--4lusbristpbjpnut
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 27, 2019 at 04:56:19PM +0200, Jacopo Mondi wrote:
> Hi Laurent,
>
> On Tue, Aug 27, 2019 at 03:24:22AM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Sun, Aug 25, 2019 at 03:51:48PM +0200, Jacopo Mondi wrote:
> > > Add a driver for the R-Car Display Unit Color Correction Module.
> > >
> > > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > > to perform image enhancement and color correction.
> > >
> > > Add support for CMM through a driver that supports configuration of
> > > the 1-dimensional LUT table. More advanced CMM feature will be
> > > implemented on top of this basic one.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> > >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> > >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 262 +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 +++++
> > >  4 files changed, 308 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index 1529849e217e..539d232790d1 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -13,6 +13,13 @@ config DRM_RCAR_DU
> > >  	  Choose this option if you have an R-Car chipset.
> > >  	  If M is selected the module will be called rcar-du-drm.
> > >
> > > +config DRM_RCAR_CMM
> > > +	bool "R-Car DU Color Management Module (CMM) Support"
> > > +	depends on DRM && OF
> > > +	depends on DRM_RCAR_DU
> > > +	help
> > > +	  Enable support for R-Car Color Management Module (CMM).
> > > +
> > >  config DRM_RCAR_DW_HDMI
> > >  	tristate "R-Car DU Gen3 HDMI Encoder Support"
> > >  	depends on DRM && OF
> > > diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> > > index 6c2ed9c46467..4d1187ccc3e5 100644
> > > --- a/drivers/gpu/drm/rcar-du/Makefile
> > > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > > @@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
> > >  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
> > >  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
> > >
> > > +obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
> > >  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> > >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
> > >  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > > new file mode 100644
> > > index 000000000000..55361f5701e8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > > @@ -0,0 +1,262 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> > > + *
> > > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > + */
> > > +
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +
> > > +#include <drm/drm_color_mgmt.h>
> > > +
> > > +#include "rcar_cmm.h"
> > > +
> > > +#define CM2_LUT_CTRL		0x0000
> > > +#define CM2_LUT_CTRL_LUT_EN	BIT(0)
> > > +#define CM2_LUT_TBL_BASE	0x0600
> > > +#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
> > > +
> > > +struct rcar_cmm {
> > > +	void __iomem *base;
> > > +	bool enabled;
> > > +
> > > +	/*
> > > +	 * @lut:		1D-LUT status
> > > +	 * @lut.enabled:	1D-LUT enabled flag
> > > +	 * @lut.size:		Number of entries in the LUT table
> >
> > Please see my review of patch 13/14, I wonder if we could drop this
> > field.
> >
> > > +	 * @lut.table:		Table of 1D-LUT entries scaled to HW support
> > > +	 *			precision (8-bits per color component)
> > > +	 */
> > > +	struct {
> > > +		bool enabled;
> > > +		unsigned int size;
> > > +		u32 table[CMM_GAMMA_LUT_SIZE];
> > > +	} lut;
> > > +};
> > > +
> > > +static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> > > +{
> > > +	return ioread32(rcmm->base + reg);
> > > +}
> > > +
> > > +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
> > > +{
> > > +	iowrite32(data, rcmm->base + reg);
> > > +}
> > > +
> > > +/*
> > > + * rcar_cmm_lut_extract() - Scale down to hw precision the DRM LUT table
> >
> > s/hw/hardware/ (and below too)
> >
> > > + *			    entries and store them.
> > > + * @rcmm: Pointer to the CMM device
> > > + * @size: Number of entries in the table
> > > + * @drm_lut: DRM LUT table
> > > + */
> > > +static void rcar_cmm_lut_extract(struct rcar_cmm *rcmm, size_t size,
> > > +				 const struct drm_color_lut *drm_lut)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < size; ++i) {
> > > +		const struct drm_color_lut *lut = &drm_lut[i];
> > > +
> > > +		rcmm->lut.table[i] = drm_color_lut_extract(lut->red, 8) << 16
> > > +				   | drm_color_lut_extract(lut->green, 8) << 8
> > > +				   | drm_color_lut_extract(lut->blue, 8);
> > > +	}
> > > +
> > > +	rcmm->lut.size = size;
> > > +}
> > > +
> > > +/*
> > > + * rcar_cmm_lut_load() - Write to hw the LUT table entries from the local table.
> > > + *
> >
> > No need for a blank line
> >
> > > + * @rcmm: Pointer to the CMM device
> > > + */
> > > +static void rcar_cmm_lut_load(struct rcar_cmm *rcmm)
> >
> > I would name this rcar_cmm_lut_write().
> >
>
> I won't, as I would like to convey the LUT tables is loaded from the

Sorry, I meant "I wouldn't"... "I won't" is really harsh, sorry about
it :p


--4lusbristpbjpnut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1lULoACgkQcjQGjxah
Vjz9iA//TFm2CoEu6Ejbp575oyCLJDwkQOTEwiJ6XCrh6OvQqM9UpDmpsrgZm5MO
ugkRzecDH+1BwFQZOg2gZThpv1DfTel5kuP/4aNAZFJIUEjPn4Ze+NiD9jA/mdnQ
K0cCc43qlRbKo19aUPWH+w3rpuyQfVZs9hFvgcXHskkdvv3mrcgiZIYOEe0xgvn8
IZTWr8hNdlngKr2Fz6GRYjoK/+gnrmcOfWP7feD0Gn5+Cl6qwDBukldOhiMvWr0E
UGisydFFzwx0al9UZQ6vjkLUiowcVaFuFVNqREu+CLaj/uOXPvYE2vG5pBS690Mu
EiMGVHKFzQJF4C82LsKCoL7rNEdZV6ll0mKZG+btbPAlAzaJOyACmrV1eSFUdcZi
7ohp8iflx8n2H6u2nkvahDxrnOEKjZlqPkfmECl/uHDlfRd6FHmVgu//K6oO3Xgs
uaH3xMwned6dgs4xZMKw03Cp/uZu49kGVXP+ZDeFFsAhAgIrxAf41c/DseR66lkY
T52rkiR5kj465Gj/egoLjSAePE690WKEJJtdY521oP/Y9WJPFHWEvtla98jf+rBq
XWzENDhmV9AKdUOwwyzreCvMFvPdLhhB8Yb9KJxfzcQIYZVUWbzt2I5CNnvDbeBi
RiNjmP5gy1A115kPbc2R+U5ighB5Pk0PPk4F0U0+ThS6tmCMhqY=
=NTm4
-----END PGP SIGNATURE-----

--4lusbristpbjpnut--

--===============0140039973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0140039973==--
