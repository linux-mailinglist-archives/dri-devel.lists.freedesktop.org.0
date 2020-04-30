Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F781C05E1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9526E941;
	Thu, 30 Apr 2020 19:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD876E940
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:10:14 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 388DA1C000B;
 Thu, 30 Apr 2020 19:10:07 +0000 (UTC)
Date: Thu, 30 Apr 2020 21:10:07 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/2] drm: Add support for the LogiCVC display controller
Message-ID: <20200430191007.GK610776@aptenodytes>
References: <20200403093617.760278-1-paul.kocialkowski@bootlin.com>
 <20200403093617.760278-3-paul.kocialkowski@bootlin.com>
 <20200403110433.GU2363188@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20200403110433.GU2363188@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============2052516759=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2052516759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BFVE2HhgxTpCzM8t"
Content-Disposition: inline


--BFVE2HhgxTpCzM8t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri 03 Apr 20, 13:04, Daniel Vetter wrote:
> On Fri, Apr 03, 2020 at 11:36:17AM +0200, Paul Kocialkowski wrote:
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
>=20
> Just a few comments on stuff I've spotted since I'm working in this area.

Thanks for the review (and the devm_drm_dev_alloc series)!

I'm preparing a new version taking in account your comments. However, I did=
n't
find a suitable panel connector wrapper: all I see is a wrapper for the
bridge + panel use case.

Cheers,

Paul

> > ---
> >  MAINTAINERS                                 |   6 +
> >  drivers/gpu/drm/Kconfig                     |   2 +
> >  drivers/gpu/drm/Makefile                    |   1 +
> >  drivers/gpu/drm/logicvc/Kconfig             |   9 +
> >  drivers/gpu/drm/logicvc/Makefile            |   4 +
> >  drivers/gpu/drm/logicvc/logicvc_crtc.c      | 272 +++++++++
> >  drivers/gpu/drm/logicvc/logicvc_crtc.h      |  23 +
> >  drivers/gpu/drm/logicvc/logicvc_drm.c       | 471 +++++++++++++++
> >  drivers/gpu/drm/logicvc/logicvc_drm.h       |  60 ++
> >  drivers/gpu/drm/logicvc/logicvc_interface.c | 240 ++++++++
> >  drivers/gpu/drm/logicvc/logicvc_interface.h |  32 ++
> >  drivers/gpu/drm/logicvc/logicvc_layer.c     | 603 ++++++++++++++++++++
> >  drivers/gpu/drm/logicvc/logicvc_layer.h     |  65 +++
> >  drivers/gpu/drm/logicvc/logicvc_mode.c      | 104 ++++
> >  drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
> >  drivers/gpu/drm/logicvc/logicvc_of.c        | 205 +++++++
> >  drivers/gpu/drm/logicvc/logicvc_of.h        |  28 +
> >  drivers/gpu/drm/logicvc/logicvc_regs.h      |  88 +++
> >  18 files changed, 2228 insertions(+)
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
> > index aff76a779cfe..531128065d46 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5307,6 +5307,12 @@ S:	Orphan / Obsolete
> >  F:	drivers/gpu/drm/i810/
> >  F:	include/uapi/drm/i810_drm.h
> > =20
> > +DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
> > +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +S:	Supported
> > +F:	drivers/gpu/drm/logicvc/
> > +
> >  DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
> >  S:	Orphan / Obsolete
> >  F:	drivers/gpu/drm/mga/
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 43594978958e..700e6bb49249 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -360,6 +360,8 @@ source "drivers/gpu/drm/arc/Kconfig"
> > =20
> >  source "drivers/gpu/drm/hisilicon/Kconfig"
> > =20
> > +source "drivers/gpu/drm/logicvc/Kconfig"
> > +
> >  source "drivers/gpu/drm/mediatek/Kconfig"
> > =20
> >  source "drivers/gpu/drm/zte/Kconfig"
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 183c60048307..7dc2dec4dc0f 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -104,6 +104,7 @@ obj-$(CONFIG_DRM_STM) +=3D stm/
> >  obj-$(CONFIG_DRM_STI) +=3D sti/
> >  obj-$(CONFIG_DRM_IMX) +=3D imx/
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
> > +obj-$(CONFIG_DRM_LOGICVC) +=3D logicvc-drm.o
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/l=
ogicvc/logicvc_crtc.c
> > new file mode 100644
> > index 000000000000..d732821a255a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> > @@ -0,0 +1,272 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "logicvc_crtc.h"
> > +#include "logicvc_drm.h"
> > +#include "logicvc_interface.h"
> > +#include "logicvc_layer.h"
> > +#include "logicvc_regs.h"
> > +
> > +#define logicvc_crtc(c) \
> > +	container_of(c, struct logicvc_crtc, drm_crtc)
> > +
> > +static int logicvc_crtc_atomic_check(struct drm_crtc *drm_crtc,
> > +				     struct drm_crtc_state *state)
> > +{
> > +	struct drm_display_mode *mode =3D &state->adjusted_mode;
> > +
> > +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
> > +				      struct drm_crtc_state *old_state)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > +	struct drm_device *drm =3D drm_crtc->dev;
> > +	unsigned long flags;
> > +
> > +	/* Register pending event, only if vblank is already on. */
> > +	if (drm_crtc->state->event && old_state->active) {
> > +		spin_lock_irqsave(&drm->event_lock, flags);
> > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> > +
> > +		crtc->event =3D drm_crtc->state->event;
> > +		drm_crtc->state->event =3D NULL;
> > +
> > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > +	}
> > +}
> > +
> > +static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
> > +				       struct drm_crtc_state *old_state)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > +	struct logicvc_drm *logicvc =3D crtc->logicvc;
> > +	struct drm_display_mode *mode =3D &drm_crtc->state->adjusted_mode;
> > +	struct drm_device *drm =3D drm_crtc->dev;
> > +	unsigned int hact, hfp, hsl, hbp;
> > +	unsigned int vact, vfp, vsl, vbp;
> > +	unsigned long flags;
> > +	u32 ctrl;
> > +
> > +	/* Timings */
> > +
> > +	hact =3D mode->hdisplay;
> > +	hfp =3D mode->hsync_start - mode->hdisplay;
> > +	hsl =3D mode->hsync_end - mode->hsync_start;
> > +	hbp =3D mode->htotal - mode->hsync_end;
> > +
> > +	vact =3D mode->vdisplay;
> > +	vfp =3D mode->vsync_start - mode->vdisplay;
> > +	vsl =3D mode->vsync_end - mode->vsync_start;
> > +	vbp =3D mode->vtotal - mode->vsync_end;
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_FRONT_PORCH_REG, hfp - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_REG, hsl - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_BACK_PORCH_REG, hbp - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_HRES_REG, hact - 1);
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_FRONT_PORCH_REG, vfp - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_REG, vsl - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_BACK_PORCH_REG, vbp - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_VRES_REG, vact - 1);
> > +
> > +	/* Signals */
> > +
> > +	ctrl =3D LOGICVC_CTRL_HSYNC_ENABLE | LOGICVC_CTRL_VSYNC_ENABLE |
> > +	       LOGICVC_CTRL_DE_ENABLE;
> > +
> > +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > +		ctrl |=3D LOGICVC_CTRL_HSYNC_INVERT;
> > +
> > +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > +		ctrl |=3D LOGICVC_CTRL_VSYNC_INVERT;
> > +
> > +	if (logicvc->interface) {
> > +		struct drm_connector *connector =3D
> > +			&logicvc->interface->drm_connector;
> > +		struct drm_display_info *display_info =3D
> > +			&connector->display_info;
> > +
> > +		if (display_info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> > +			ctrl |=3D LOGICVC_CTRL_DE_INVERT;
> > +
> > +		if (display_info->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +			ctrl |=3D LOGICVC_CTRL_CLOCK_INVERT;
> > +	}
> > +
> > +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> > +			   LOGICVC_CTRL_HSYNC_ENABLE |
> > +			   LOGICVC_CTRL_HSYNC_INVERT |
> > +			   LOGICVC_CTRL_VSYNC_ENABLE |
> > +			   LOGICVC_CTRL_VSYNC_INVERT |
> > +			   LOGICVC_CTRL_DE_ENABLE |
> > +			   LOGICVC_CTRL_DE_INVERT |
> > +			   LOGICVC_CTRL_PIXEL_INVERT |
> > +			   LOGICVC_CTRL_CLOCK_INVERT, ctrl);
> > +
> > +	/* Generate internal state reset. */
> > +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> > +
> > +	drm_crtc_vblank_on(drm_crtc);
> > +
> > +	/* Register our event after vblank is enabled. */
> > +	if (drm_crtc->state->event && !old_state->active) {
> > +		spin_lock_irqsave(&drm->event_lock, flags);
> > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> > +
> > +		crtc->event =3D drm_crtc->state->event;
> > +		drm_crtc->state->event =3D NULL;
> > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > +	}
> > +}
> > +
> > +static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
> > +					struct drm_crtc_state *old_state)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > +	struct logicvc_drm *logicvc =3D crtc->logicvc;
> > +
> > +	drm_crtc_vblank_off(drm_crtc);
> > +
> > +	/* Disable and clear CRTC bits. */
> > +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> > +			   LOGICVC_CTRL_HSYNC_ENABLE |
> > +			   LOGICVC_CTRL_HSYNC_INVERT |
> > +			   LOGICVC_CTRL_VSYNC_ENABLE |
> > +			   LOGICVC_CTRL_VSYNC_INVERT |
> > +			   LOGICVC_CTRL_DE_ENABLE |
> > +			   LOGICVC_CTRL_DE_INVERT |
> > +			   LOGICVC_CTRL_PIXEL_INVERT |
> > +			   LOGICVC_CTRL_CLOCK_INVERT, 0);
> > +
> > +	/* Generate internal state reset. */
> > +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> > +
> > +	/* Consume leftover event since vblank is now disabled. */
> > +	if (drm_crtc->state->event && !drm_crtc->state->active) {
> > +		spin_lock_irq(&drm_crtc->dev->event_lock);
> > +
> > +		drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
> > +		drm_crtc->state->event =3D NULL;
> > +		spin_unlock_irq(&drm_crtc->dev->event_lock);
> > +	}
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs =
=3D {
> > +	.atomic_check		=3D logicvc_crtc_atomic_check,
> > +	.atomic_begin		=3D logicvc_crtc_atomic_begin,
> > +	.atomic_enable		=3D logicvc_crtc_atomic_enable,
> > +	.atomic_disable		=3D logicvc_crtc_atomic_disable,
> > +};
> > +
> > +static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > +	struct logicvc_drm *logicvc =3D crtc->logicvc;
> > +
> > +	/* Clear any pending V_SYNC interrupt. */
> > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
> > +			  LOGICVC_INT_STAT_V_SYNC, LOGICVC_INT_STAT_V_SYNC);
> > +
> > +	/* Unmask V_SYNC interrupt. */
> > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> > +			  LOGICVC_INT_MASK_V_SYNC, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > +	struct logicvc_drm *logicvc =3D crtc->logicvc;
> > +
> > +	/* Mask V_SYNC interrupt. */
> > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> > +			  LOGICVC_INT_MASK_V_SYNC, LOGICVC_INT_MASK_V_SYNC);
> > +}
> > +
> > +static const struct drm_crtc_funcs logicvc_crtc_funcs =3D {
> > +	.reset			=3D drm_atomic_helper_crtc_reset,
> > +	.destroy		=3D drm_crtc_cleanup,
> > +	.set_config		=3D drm_atomic_helper_set_config,
> > +	.page_flip		=3D drm_atomic_helper_page_flip,
> > +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
> > +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
> > +	.enable_vblank		=3D logicvc_crtc_enable_vblank,
> > +	.disable_vblank		=3D logicvc_crtc_disable_vblank,
> > +};
> > +
> > +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc)
> > +{
> > +	struct logicvc_crtc *crtc =3D logicvc->crtc;
> > +	struct drm_device *drm =3D logicvc->drm;
> > +	unsigned long flags;
> > +
> > +	if (!crtc)
> > +		return;
> > +
> > +	drm_crtc_handle_vblank(&crtc->drm_crtc);
> > +
> > +	if (crtc->event) {
> > +		spin_lock_irqsave(&drm->event_lock, flags);
> > +		drm_crtc_send_vblank_event(&crtc->drm_crtc, crtc->event);
> > +		drm_crtc_vblank_put(&crtc->drm_crtc);
> > +		crtc->event =3D NULL;
> > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > +	}
> > +}
> > +
> > +int logicvc_crtc_init(struct logicvc_drm *logicvc)
> > +{
> > +	struct device_node *of_node =3D logicvc->drm->dev->of_node;
> > +	struct logicvc_crtc *crtc;
> > +	struct logicvc_layer *layer_primary;
> > +	int ret;
> > +
> > +	crtc =3D devm_kzalloc(logicvc->drm->dev, sizeof(*crtc), GFP_KERNEL);
> > +	if (!crtc)
> > +		return -ENOMEM;
> > +
> > +	crtc->logicvc =3D logicvc;
> > +
> > +	layer_primary =3D logicvc_layer_get_primary(logicvc);
> > +	if (!layer_primary) {
> > +		DRM_ERROR("Failed to get primary layer\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D drm_crtc_init_with_planes(logicvc->drm, &crtc->drm_crtc,
> > +					&layer_primary->drm_plane, NULL,
> > +					&logicvc_crtc_funcs, NULL);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to initalize CRTC\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_crtc_helper_add(&crtc->drm_crtc, &logicvc_crtc_helper_funcs);
> > +
> > +	crtc->drm_crtc.port =3D of_graph_get_port_by_id(of_node, 1);
> > +
> > +	logicvc->crtc =3D crtc;
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/l=
ogicvc/logicvc_crtc.h
> > new file mode 100644
> > index 000000000000..b2fd96b3fe0f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_CRTC_H_
> > +#define _LOGICVC_CRTC_H_
> > +
> > +struct drm_pending_vblank_event;
> > +struct logicvc_drm;
> > +
> > +struct logicvc_crtc {
> > +	struct logicvc_drm *logicvc;
>=20
> You have these sprinkled all over, they're redundant imo just upcast the
> drm_device pointer that all the base class structures have already.
> There's a bunch of these all over. If you want to a nice little function
> to do the pointer chasing&casting so you can go directly from logicvc_crtc
> to logicvc_drm.
>=20
> > +
> > +	struct drm_crtc drm_crtc;
> > +	struct drm_pending_vblank_event *event;
> > +};
> > +
> > +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc);
> > +int logicvc_crtc_init(struct logicvc_drm *logicvc);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/lo=
gicvc/logicvc_drm.c
> > new file mode 100644
> > index 000000000000..527b12cbd17b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> > @@ -0,0 +1,471 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "logicvc_crtc.h"
> > +#include "logicvc_drm.h"
> > +#include "logicvc_interface.h"
> > +#include "logicvc_mode.h"
> > +#include "logicvc_layer.h"
> > +#include "logicvc_of.h"
> > +#include "logicvc_regs.h"
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(logicvc_drm_fops);
> > +
> > +static int logicvc_drm_gem_cma_dumb_create(struct drm_file *file_priv,
> > +					   struct drm_device *drm,
> > +					   struct drm_mode_create_dumb *args)
> > +{
> > +	struct logicvc_drm *logicvc =3D drm->dev_private;
> > +
> > +	/* Stride is always fixed to its configuration value. */
> > +	args->pitch =3D logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, =
8);
> > +
> > +	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
> > +}
> > +
> > +static struct drm_driver logicvc_drm_driver =3D {
> > +	.driver_features		=3D DRIVER_GEM | DRIVER_MODESET |
> > +					  DRIVER_ATOMIC,
> > +
> > +	.fops				=3D &logicvc_drm_fops,
> > +	.name				=3D "logicvc-drm",
> > +	.desc				=3D "Xylon LogiCVC DRM driver",
> > +	.date				=3D "20200403",
> > +	.major				=3D 1,
> > +	.minor				=3D 0,
> > +
> > +	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > +	.dumb_create			=3D logicvc_drm_gem_cma_dumb_create,
> > +};
> > +
> > +static struct regmap_config logicvc_drm_regmap_config =3D {
> > +	.reg_bits	=3D 32,
> > +	.val_bits	=3D 32,
> > +	.reg_stride	=3D 4,
> > +	.name		=3D "logicvc-drm",
> > +};
> > +
> > +static irqreturn_t logicvc_drm_irq_handler(int irq, void *data)
> > +{
> > +	struct logicvc_drm *logicvc =3D data;
> > +	irqreturn_t ret =3D IRQ_NONE;
> > +	u32 stat =3D 0;
> > +
> > +	/* Get pending interrupt sources. */
> > +	regmap_read(logicvc->regmap, LOGICVC_INT_STAT_REG, &stat);
> > +
> > +	/* Clear all pending interrupt sources. */
> > +	regmap_write(logicvc->regmap, LOGICVC_INT_STAT_REG, stat);
> > +
> > +	if (stat & LOGICVC_INT_STAT_V_SYNC) {
> > +		logicvc_crtc_vblank_handler(logicvc);
> > +		ret =3D IRQ_HANDLED;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
> > +{
> > +	struct device_node *of_node =3D logicvc->drm->dev->of_node;
> > +	struct logicvc_drm_config *config =3D &logicvc->config;
> > +	struct device_node *layers_node;
> > +	int ret;
> > +
> > +	logicvc_of_property_parse_bool(of_node, "xylon,dithering",
> > +				       &config->dithering);
> > +	logicvc_of_property_parse_bool(of_node, "xylon,background-layer",
> > +				       &config->background_layer);
> > +	logicvc_of_property_parse_bool(of_node, "xylon,layers-configurable",
> > +				       &config->layers_configurable);
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,display-interfa=
ce",
> > +					    &config->display_interface);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,display-colorsp=
ace",
> > +					    &config->display_colorspace);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,display-depth",
> > +					    &config->display_depth);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,row-stride",
> > +					    &config->row_stride);
> > +	if (ret)
> > +		return ret;
> > +
> > +	layers_node =3D of_get_child_by_name(of_node, "layers");
> > +	if (!layers_node) {
> > +		DRM_ERROR("Missing non-optional layers node\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	config->layers_count =3D of_get_child_count(layers_node);
> > +	if (!config->layers_count) {
> > +		DRM_ERROR("Missing a non-optional layers children node\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void logicvc_version_print(struct logicvc_drm *logicvc)
> > +{
> > +	u32 version;
> > +
> > +	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
> > +
> > +	DRM_INFO("LogiCVC version %d.%02d.%c\n",
> > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
> > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
> > +		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
> > +		 'a');
> > +}
> > +
> > +static int logicvc_clocks_prepare(struct logicvc_drm *logicvc)
> > +{
> > +	struct {
> > +		struct clk **clk;
> > +		char *name;
> > +		bool optional;
> > +	} clocks_map[] =3D {
> > +		{
> > +			.clk =3D &logicvc->vclk,
> > +			.name =3D "vclk",
> > +			.optional =3D false,
> > +		},
> > +		{
> > +			.clk =3D &logicvc->vclk2,
> > +			.name =3D "vclk2",
> > +			.optional =3D true,
> > +		},
> > +		{
> > +			.clk =3D &logicvc->lvdsclk,
> > +			.name =3D "lvdsclk",
> > +			.optional =3D true,
> > +		},
> > +		{
> > +			.clk =3D &logicvc->lvdsclkn,
> > +			.name =3D "lvdsclkn",
> > +			.optional =3D true,
> > +		},
> > +	};
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(clocks_map); i++) {
> > +		struct clk *clk;
> > +
> > +		clk =3D devm_clk_get(logicvc->drm->dev, clocks_map[i].name);
> > +		if (IS_ERR(clk)) {
> > +			if (PTR_ERR(clk) =3D=3D -ENOENT && clocks_map[i].optional)
> > +				continue;
> > +
> > +			DRM_ERROR("Missing non-optional clock %s\n",
> > +				  clocks_map[i].name);
> > +
> > +			ret =3D PTR_ERR(clk);
> > +			goto error;
> > +		}
> > +
> > +		ret =3D clk_prepare_enable(clk);
> > +		if (ret) {
> > +			DRM_ERROR("Failed to prepare and enable clock %s\n",
> > +				  clocks_map[i].name);
> > +			goto error;
> > +		}
> > +
> > +		*clocks_map[i].clk =3D clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +error:
> > +	for (i =3D 0; i < ARRAY_SIZE(clocks_map); i++) {
> > +		if (!*clocks_map[i].clk)
> > +			continue;
> > +
> > +		clk_disable_unprepare(*clocks_map[i].clk);
> > +		*clocks_map[i].clk =3D NULL;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int logicvc_clocks_unprepare(struct logicvc_drm *logicvc)
> > +{
> > +	struct clk **clocks[] =3D {
> > +		&logicvc->vclk,
> > +		&logicvc->vclk2,
> > +		&logicvc->lvdsclk,
> > +		&logicvc->lvdsclkn,
> > +	};
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(clocks); i++) {
> > +		if (!*clocks[i])
> > +			continue;
> > +
> > +		clk_disable_unprepare(*clocks[i]);
> > +		*clocks[i] =3D NULL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int logicvc_drm_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *of_node =3D pdev->dev.of_node;
> > +	struct device_node *reserved_mem_node;
> > +	struct reserved_mem *reserved_mem =3D NULL;
> > +	const struct logicvc_drm_caps *caps;
> > +	struct logicvc_drm *logicvc;
> > +	struct drm_device *drm;
> > +	struct regmap *regmap;
> > +	struct resource res;
> > +	void __iomem *base;
> > +	int irq;
> > +	int ret;
> > +
> > +	caps =3D of_device_get_match_data(&pdev->dev);
> > +	if (!caps)
> > +		return -EINVAL;
> > +
> > +	ret =3D of_reserved_mem_device_init(&pdev->dev);
> > +	if (ret && ret !=3D -ENODEV) {
> > +		dev_err(&pdev->dev, "Failed to init memory region\n");
> > +		goto error_early;
> > +	}
> > +
> > +	reserved_mem_node =3D of_parse_phandle(of_node, "memory-region", 0);
> > +	if (reserved_mem_node) {
> > +		reserved_mem =3D of_reserved_mem_lookup(reserved_mem_node);
> > +		of_node_put(reserved_mem_node);
> > +	}
> > +
> > +	/* Get regmap from syscon first if available. */
> > +	regmap =3D syscon_regmap_lookup_by_phandle(of_node, "xylon,syscon");
> > +
> > +	/* Then get regmap from parent if available. */
> > +	if (IS_ERR(regmap) && of_node->parent)
> > +		regmap =3D syscon_node_to_regmap(of_node->parent);
> > +
> > +	/* Register our own regmap otherwise. */
> > +	if (IS_ERR(regmap)) {
> > +		ret =3D of_address_to_resource(of_node, 0, &res);
> > +		if (ret) {
> > +			dev_err(&pdev->dev,
> > +				"Failed to get resource from address\n");
> > +			goto error_reserved_mem;
> > +		}
> > +
> > +		base =3D devm_ioremap_resource(&pdev->dev, &res);
> > +		if (IS_ERR(base)) {
> > +			dev_err(&pdev->dev, "Failed to map I/O base\n");
> > +			ret =3D PTR_ERR(base);
> > +			goto error_reserved_mem;
> > +		}
> > +
> > +		logicvc_drm_regmap_config.max_register =3D resource_size(&res) -
> > +							 4;
> > +
> > +		regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> > +					       &logicvc_drm_regmap_config);
> > +		if (IS_ERR(regmap)) {
> > +			dev_err(&pdev->dev,
> > +				"Failed to create regmap for I/O\n");
> > +			ret =3D PTR_ERR(regmap);
> > +			goto error_reserved_mem;
> > +		}
> > +	}
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> > +		ret =3D -ENODEV;
> > +		goto error_reserved_mem;
> > +	}
> > +
> > +	drm =3D drm_dev_alloc(&logicvc_drm_driver, &pdev->dev);
> > +	if (IS_ERR(drm)) {
> > +		ret =3D PTR_ERR(drm);
> > +		goto error_reserved_mem;
> > +	}
> > +
> > +	logicvc =3D devm_kzalloc(&pdev->dev, sizeof(*logicvc), GFP_KERNEL);
>=20
> Uh that's a wrong pattern. Please use devm_drm_dev_init and kzalloc and
> drmm_add_final_kfree. Or wait until I send out my latest patch series
> which adds a devm_drm_dev_alloc.
>=20
> > +	if (!logicvc) {
> > +		ret =3D -ENOMEM;
> > +		goto error_logicvc;
> > +	}
> > +
> > +	logicvc->caps =3D caps;
> > +	logicvc->drm =3D drm;
> > +	drm->dev_private =3D logicvc;
>=20
> Please don't set ->dev_private, instead subclass.
>=20
> > +	platform_set_drvdata(pdev, logicvc);
> > +
> > +	logicvc->regmap =3D regmap;
> > +	INIT_LIST_HEAD(&logicvc->layers_list);
> > +
> > +	if (reserved_mem)
> > +		logicvc->reserved_mem_base =3D reserved_mem->base;
> > +
> > +	ret =3D logicvc_clocks_prepare(logicvc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to prepare clocks\n");
> > +		goto error_logicvc;
> > +	}
> > +
> > +	ret =3D devm_request_irq(drm->dev, irq, logicvc_drm_irq_handler, 0,
> > +			       dev_name(drm->dev), logicvc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to request IRQ\n");
> > +		goto error_clocks;
> > +	}
> > +
> > +	logicvc_version_print(logicvc);
> > +
> > +	ret =3D logicvc_drm_config_parse(logicvc);
> > +	if (ret && ret !=3D -ENODEV) {
> > +		drm_err(logicvc->drm, "Failed to parse config\n");
> > +		goto error_clocks;
> > +	}
> > +
> > +	drm_mode_config_init(drm);
> > +
> > +	ret =3D logicvc_layers_init(logicvc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize layers\n");
> > +		goto error_mode_config;
> > +	}
> > +
> > +	ret =3D logicvc_crtc_init(logicvc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize CRTC\n");
> > +		goto error_mode_config;
> > +	}
> > +
> > +	logicvc_layers_attach_crtc(logicvc);
> > +
> > +	ret =3D logicvc_interface_init(logicvc);
> > +	if (ret) {
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			drm_err(logicvc->drm,
> > +				"Failed to initialize interface\n");
> > +
> > +		goto error_mode_config;
> > +	}
> > +
> > +	logicvc_interface_attach_crtc(logicvc);
> > +
> > +	ret =3D logicvc_mode_init(logicvc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize KMS\n");
> > +		goto error_mode_config;
> > +	}
> > +
> > +	ret =3D drm_dev_register(drm, 0);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to register DRM device\n");
> > +		goto error_mode;
> > +	}
> > +
> > +	return 0;
> > +
> > +error_mode:
> > +	logicvc_mode_fini(logicvc);
> > +
> > +error_mode_config:
> > +	drm_mode_config_cleanup(drm);
> > +
> > +error_clocks:
> > +	logicvc_clocks_unprepare(logicvc);
> > +
> > +error_logicvc:
> > +	drm_dev_put(drm);
> > +
> > +error_reserved_mem:
> > +	of_reserved_mem_device_release(&pdev->dev);
> > +
> > +error_early:
> > +	return ret;
> > +}
> > +
> > +static int logicvc_drm_remove(struct platform_device *pdev)
> > +{
> > +	struct logicvc_drm *logicvc =3D platform_get_drvdata(pdev);
> > +
> > +	drm_dev_unregister(logicvc->drm);
> > +	drm_atomic_helper_shutdown(logicvc->drm);
> > +
> > +	logicvc_mode_fini(logicvc);
> > +
> > +	drm_mode_config_cleanup(logicvc->drm);
> > +
> > +	logicvc_clocks_unprepare(logicvc);
> > +
> > +	drm_dev_put(logicvc->drm);
> > +
> > +	of_reserved_mem_device_release(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct logicvc_drm_caps logicvc_drm_caps_3 =3D {
> > +	.layer_address =3D false,
> > +};
> > +
> > +static const struct logicvc_drm_caps logicvc_drm_caps_4 =3D {
> > +	.layer_address =3D true,
> > +};
> > +
> > +static struct of_device_id logicvc_drm_of_table[] =3D {
> > +	{
> > +		.compatible =3D "xylon,logicvc-3.02.a-display",
> > +		.data =3D &logicvc_drm_caps_3,
> > +	},
> > +	{
> > +		.compatible =3D "xylon,logicvc-4.01.a-display",
> > +		.data =3D &logicvc_drm_caps_4,
> > +	},
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
> > +
> > +static struct platform_driver logicvc_drm_platform_driver =3D {
> > +	.probe		=3D logicvc_drm_probe,
> > +	.remove		=3D logicvc_drm_remove,
> > +	.driver		=3D {
> > +		.name		=3D "logicvc-drm",
> > +		.of_match_table	=3D logicvc_drm_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(logicvc_drm_platform_driver);
> > +
> > +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> > +MODULE_DESCRIPTION("Xylon LogiCVC DRM driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/lo=
gicvc/logicvc_drm.h
> > new file mode 100644
> > index 000000000000..cc728d5a4aee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
> > @@ -0,0 +1,60 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_DRM_H_
> > +#define _LOGICVC_DRM_H_
> > +
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +#include <drm/drm_device.h>
> > +
> > +#define LOGICVC_DISPLAY_INTERFACE_RGB			0
> > +#define LOGICVC_DISPLAY_INTERFACE_ITU656		1
> > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS		2
> > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA	3
> > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS		4
> > +#define LOGICVC_DISPLAY_INTERFACE_DVI			5
> > +
> > +#define LOGICVC_DISPLAY_COLORSPACE_RGB		0
> > +#define LOGICVC_DISPLAY_COLORSPACE_YUV422	1
> > +#define LOGICVC_DISPLAY_COLORSPACE_YUV444	2
> > +
> > +struct logicvc_crtc;
> > +struct logicvc_interface;
> > +
> > +struct logicvc_drm_config {
> > +	u32 display_interface;
> > +	u32 display_colorspace;
> > +	u32 display_depth;
> > +	u32 row_stride;
> > +	bool dithering;
> > +	bool background_layer;
> > +	bool layers_configurable;
> > +	u32 layers_count;
> > +};
> > +
> > +struct logicvc_drm_caps {
> > +	bool layer_address;
> > +};
> > +
> > +struct logicvc_drm {
> > +	const struct logicvc_drm_caps *caps;
> > +	struct logicvc_drm_config config;
> > +	struct drm_device *drm;
> > +	phys_addr_t reserved_mem_base;
> > +	struct regmap *regmap;
> > +
> > +	struct clk *vclk;
> > +	struct clk *vclk2;
> > +	struct clk *lvdsclk;
> > +	struct clk *lvdsclkn;
> > +
> > +	struct list_head layers_list;
> > +	struct logicvc_crtc *crtc;
> > +	struct logicvc_interface *interface;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/=
drm/logicvc/logicvc_interface.c
> > new file mode 100644
> > index 000000000000..05f2149ed338
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
> > @@ -0,0 +1,240 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "logicvc_crtc.h"
> > +#include "logicvc_drm.h"
> > +#include "logicvc_interface.h"
> > +#include "logicvc_regs.h"
> > +
> > +#define logicvc_interface_from_drm_encoder(c) \
> > +	container_of(c, struct logicvc_interface, drm_encoder)
> > +#define logicvc_interface_from_drm_connector(c) \
> > +	container_of(c, struct logicvc_interface, drm_connector)
> > +
> > +static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
> > +{
> > +	struct logicvc_interface *interface =3D
> > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > +
> > +	regmap_update_bits(interface->logicvc->regmap, LOGICVC_POWER_CTRL_REG,
> > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
> > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
> > +
> > +	if (interface->drm_panel) {
> > +		drm_panel_prepare(interface->drm_panel);
> > +
> > +		/* Encoder enable is too early to enable the panel and a white
> > +		 * screen will be seen if the panel gets enabled before the
> > +		 * first page flip is done (and no other framebuffer
> > +		 * configuration remains from the boot software). */
> > +		interface->drm_panel_enabled =3D false;
> > +	}
> > +}
> > +
> > +static void logicvc_encoder_disable(struct drm_encoder *drm_encoder)
> > +{
> > +	struct logicvc_interface *interface =3D
> > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > +
> > +	if (interface->drm_panel) {
> > +		drm_panel_disable(interface->drm_panel);
> > +		drm_panel_unprepare(interface->drm_panel);
> > +	}
> > +}
> > +
> > +static const struct drm_encoder_helper_funcs logicvc_encoder_helper_fu=
ncs =3D {
> > +	.enable			=3D logicvc_encoder_enable,
> > +	.disable		=3D logicvc_encoder_disable,
> > +};
> > +
> > +static const struct drm_encoder_funcs logicvc_encoder_funcs =3D {
> > +	.destroy		=3D drm_encoder_cleanup,
> > +};
> > +
> > +static int logicvc_connector_get_modes(struct drm_connector *drm_conne=
ctor)
> > +{
> > +	struct logicvc_interface *interface =3D
> > +		logicvc_interface_from_drm_connector(drm_connector);
> > +
> > +	if (interface->drm_panel)
> > +		return drm_panel_get_modes(interface->drm_panel, drm_connector);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs logicvc_connector_helpe=
r_funcs =3D {
> > +	.get_modes		=3D logicvc_connector_get_modes,
> > +};
>=20
> Don't we have a panel connector wrapper that does this for you
> automatically already? Including the other boilerplate below.
> -Daniel
>=20
> > +
> > +static void logicvc_connector_destroy(struct drm_connector *drm_connec=
tor)
> > +{
> > +	struct logicvc_interface *interface =3D
> > +		logicvc_interface_from_drm_connector(drm_connector);
> > +
> > +	if (interface->drm_panel)
> > +		drm_panel_detach(interface->drm_panel);
> > +
> > +	drm_connector_cleanup(drm_connector);
> > +}
> > +
> > +static const struct drm_connector_funcs logicvc_connector_funcs =3D {
> > +	.reset			=3D drm_atomic_helper_connector_reset,
> > +	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> > +	.destroy		=3D logicvc_connector_destroy,
> > +	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_sta=
te,
> > +	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int logicvc_interface_encoder_type(struct logicvc_drm *logicvc)
> > +{
> > +	switch (logicvc->config.display_interface) {
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> > +		return DRM_MODE_ENCODER_LVDS;
> > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > +		return DRM_MODE_ENCODER_TMDS;
> > +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> > +		return DRM_MODE_ENCODER_DPI;
> > +	default:
> > +		return DRM_MODE_ENCODER_NONE;
> > +	}
> > +}
> > +
> > +static int logicvc_interface_connector_type(struct logicvc_drm *logicv=
c)
> > +{
> > +	switch (logicvc->config.display_interface) {
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> > +		return DRM_MODE_CONNECTOR_LVDS;
> > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > +		return DRM_MODE_CONNECTOR_DVID;
> > +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> > +		return DRM_MODE_CONNECTOR_DPI;
> > +	default:
> > +		return DRM_MODE_CONNECTOR_Unknown;
> > +	}
> > +}
> > +
> > +static bool logicvc_interface_native_connector(struct logicvc_drm *log=
icvc)
> > +{
> > +	switch (logicvc->config.display_interface) {
> > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc)
> > +{
> > +	uint32_t possible_crtcs =3D drm_crtc_mask(&logicvc->crtc->drm_crtc);
> > +
> > +	logicvc->interface->drm_encoder.possible_crtcs =3D possible_crtcs;
> > +}
> > +
> > +int logicvc_interface_init(struct logicvc_drm *logicvc)
> > +{
> > +	struct logicvc_interface *interface;
> > +	struct device_node *of_node =3D logicvc->drm->dev->of_node;
> > +	int encoder_type =3D logicvc_interface_encoder_type(logicvc);
> > +	int connector_type =3D logicvc_interface_connector_type(logicvc);
> > +	bool native_connector =3D logicvc_interface_native_connector(logicvc);
> > +	int ret;
> > +
> > +	interface =3D devm_kzalloc(logicvc->drm->dev, sizeof(*interface),
> > +				 GFP_KERNEL);
> > +	if (!interface) {
> > +		ret =3D -ENOMEM;
> > +		goto error_early;
> > +	}
> > +
> > +	interface->logicvc =3D logicvc;
> > +
> > +	ret =3D drm_of_find_panel_or_bridge(of_node, 1, 0, &interface->drm_pa=
nel,
> > +					  &interface->drm_bridge);
> > +	if (ret =3D=3D -EPROBE_DEFER)
> > +		goto error_early;
> > +
> > +	ret =3D drm_encoder_init(logicvc->drm, &interface->drm_encoder,
> > +			       &logicvc_encoder_funcs, encoder_type, NULL);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initalize encoder\n");
> > +		goto error_early;
> > +	}
> > +
> > +	drm_encoder_helper_add(&interface->drm_encoder,
> > +			       &logicvc_encoder_helper_funcs);
> > +
> > +	if (native_connector || interface->drm_panel) {
> > +		ret =3D drm_connector_init(logicvc->drm,
> > +					 &interface->drm_connector,
> > +					 &logicvc_connector_funcs,
> > +					 connector_type);
> > +		if (ret) {
> > +			drm_err(logicvc->drm,
> > +				"Failed to initalize connector\n");
> > +			goto error_encoder;
> > +		}
> > +
> > +		drm_connector_helper_add(&interface->drm_connector,
> > +					 &logicvc_connector_helper_funcs);
> > +
> > +		ret =3D drm_connector_attach_encoder(&interface->drm_connector,
> > +						   &interface->drm_encoder);
> > +		if (ret) {
> > +			drm_err(logicvc->drm,
> > +				"Failed to attach connector to encoder\n");
> > +			goto error_encoder;
> > +		}
> > +	}
> > +
> > +	if (interface->drm_panel) {
> > +		ret =3D drm_panel_attach(interface->drm_panel,
> > +				       &interface->drm_connector);
> > +		if (ret) {
> > +			drm_err(logicvc->drm,
> > +				"Failed to attach panel to connector\n");
> > +			goto error_encoder;
> > +		}
> > +	}
> > +
> > +	if (interface->drm_bridge) {
> > +		ret =3D drm_bridge_attach(&interface->drm_encoder,
> > +					interface->drm_bridge, NULL, 0);
> > +		if (ret) {
> > +			drm_err(logicvc->drm,
> > +				"Failed to attach bridge to encoder\n");
> > +			goto error_encoder;
> > +		}
> > +	}
> > +
> > +	logicvc->interface =3D interface;
> > +
> > +	return 0;
> > +
> > +error_encoder:
> > +	drm_encoder_cleanup(&interface->drm_encoder);
> > +
> > +error_early:
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.h b/drivers/gpu/=
drm/logicvc/logicvc_interface.h
> > new file mode 100644
> > index 000000000000..d27abfff929f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_interface.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_INTERFACE_H_
> > +#define _LOGICVC_INTERFACE_H_
> > +
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_panel.h>
> > +
> > +struct logicvc_drm;
> > +
> > +struct logicvc_interface {
> > +	struct logicvc_drm *logicvc;
> > +
> > +	struct drm_encoder drm_encoder;
> > +	struct drm_connector drm_connector;
> > +
> > +	struct drm_panel *drm_panel;
> > +	struct drm_bridge *drm_bridge;
> > +
> > +	bool drm_panel_enabled;
> > +};
> > +
> > +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc);
> > +int logicvc_interface_init(struct logicvc_drm *logicvc);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/=
logicvc/logicvc_layer.c
> > new file mode 100644
> > index 000000000000..07a22e736ae7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> > @@ -0,0 +1,603 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_plane.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "logicvc_crtc.h"
> > +#include "logicvc_drm.h"
> > +#include "logicvc_layer.h"
> > +#include "logicvc_of.h"
> > +#include "logicvc_regs.h"
> > +
> > +#define logicvc_layer(p) \
> > +	container_of(p, struct logicvc_layer, drm_plane)
> > +
> > +static uint32_t logicvc_layer_formats_rgb16[] =3D {
> > +	DRM_FORMAT_RGB565,
> > +	DRM_FORMAT_BGR565,
> > +	DRM_FORMAT_INVALID,
> > +};
> > +
> > +static uint32_t logicvc_layer_formats_rgb24[] =3D {
> > +	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_INVALID,
> > +};
> > +
> > +/* What we call depth in this driver only counts color components, not=
 alpha.
> > + * This allows us to stay compatible with the LogiCVC bistream definit=
ions. */
> > +static uint32_t logicvc_layer_formats_rgb24_alpha[] =3D {
> > +	DRM_FORMAT_ARGB8888,
> > +	DRM_FORMAT_ABGR8888,
> > +	DRM_FORMAT_INVALID,
> > +};
> > +
> > +static struct logicvc_layer_formats logicvc_layer_formats[] =3D {
> > +	{
> > +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> > +		.depth		=3D 16,
> > +		.formats	=3D logicvc_layer_formats_rgb16,
> > +	},
> > +	{
> > +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> > +		.depth		=3D 24,
> > +		.formats	=3D logicvc_layer_formats_rgb24,
> > +	},
> > +	{
> > +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> > +		.depth		=3D 24,
> > +		.alpha		=3D true,
> > +		.formats	=3D logicvc_layer_formats_rgb24_alpha,
> > +	},
> > +	{ }
> > +};
> > +
> > +static bool logicvc_layer_format_inverted(uint32_t format)
> > +{
> > +	switch (format) {
> > +	case DRM_FORMAT_BGR565:
> > +	case DRM_FORMAT_BGR888:
> > +	case DRM_FORMAT_XBGR8888:
> > +	case DRM_FORMAT_ABGR8888:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
> > +				      struct drm_plane_state *state)
> > +{
> > +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> > +	struct logicvc_drm *logicvc =3D layer->logicvc;
> > +	struct drm_crtc_state *crtc_state;
> > +	int min_scale, max_scale;
> > +	bool can_position;
> > +	int ret;
> > +
> > +	if (!state->crtc)
> > +		return 0;
> > +
> > +	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> > +							state->crtc);
> > +	if (WARN_ON(!crtc_state))
> > +		return -EINVAL;
> > +
> > +	if (state->crtc_x < 0 || state->crtc_y < 0) {
> > +		drm_err(logicvc->drm,
> > +			"Negative on-CRTC positions are not supported.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!logicvc->caps->layer_address) {
> > +		ret =3D logicvc_layer_buffer_find_setup(layer, state, NULL);
> > +		if (ret) {
> > +			drm_err(logicvc->drm,
> > +				"No viable setup for buffer found.\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	min_scale =3D DRM_PLANE_HELPER_NO_SCALING;
> > +	max_scale =3D DRM_PLANE_HELPER_NO_SCALING;
> > +
> > +	can_position =3D (drm_plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
> > +			layer->index !=3D (logicvc->config.layers_count - 1) &&
> > +			logicvc->config.layers_configurable);
> > +
> > +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> > +						  min_scale, max_scale,
> > +						  can_position, true);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Invalid plane state\n\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
> > +					struct drm_plane_state *old_state)
> > +{
> > +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> > +	struct logicvc_drm *logicvc =3D layer->logicvc;
> > +	struct drm_plane_state *state =3D drm_plane->state;
> > +	struct drm_crtc *drm_crtc =3D &logicvc->crtc->drm_crtc;
> > +	struct drm_display_mode *mode =3D &drm_crtc->state->adjusted_mode;
> > +	struct drm_framebuffer *fb =3D state->fb;
> > +	struct logicvc_layer_buffer_setup setup =3D {};
> > +	u32 index =3D layer->index;
> > +	u32 reg;
> > +
> > +	/* Layer dimensions */
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_WIDTH_REG(index),
> > +		     state->crtc_w - 1);
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HEIGHT_REG(index),
> > +		     state->crtc_h - 1);
> > +
> > +	if (logicvc->caps->layer_address) {
> > +		phys_addr_t fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> > +
> > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
> > +			     fb_addr);
> > +	} else {
> > +		/* Rely on offsets to configure the address. */
> > +
> > +		logicvc_layer_buffer_find_setup(layer, state, &setup);
> > +
> > +		/* Layer memory offsets */
> > +
> > +		regmap_write(logicvc->regmap, LOGICVC_BUFFER_SEL_REG,
> > +			     LOGICVC_BUFFER_SEL_VALUE(index, setup.buffer_sel));
> > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_HOFFSET_REG(index),
> > +			     setup.hoffset);
> > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_VOFFSET_REG(index),
> > +			     setup.voffset);
> > +	}
> > +
> > +	/* Layer position */
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HPOSITION_REG(index),
> > +		     mode->hdisplay - 1 - state->crtc_x);
> > +
> > +	/* Vertical position must be set last to sync layer register changes.=
 */
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_VPOSITION_REG(index),
> > +		     mode->vdisplay - 1 - state->crtc_y);
> > +
> > +	/* Layer alpha */
> > +
> > +	if (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_LAYER) {
> > +		u32 alpha_bits;
> > +		u32 alpha_max;
> > +		u32 alpha;
> > +
> > +		switch (layer->config.depth) {
> > +		case 8:
> > +			alpha_bits =3D 3;
> > +			break;
> > +		case 16:
> > +			if (layer->config.colorspace =3D=3D LOGICVC_LAYER_COLORSPACE_YUV)
> > +				alpha_bits =3D 8;
> > +			else
> > +				alpha_bits =3D 6;
> > +			break;
> > +		default:
> > +			alpha_bits =3D 8;
> > +			break;
> > +		}
> > +
> > +		alpha_max =3D BIT(alpha_bits) - 1;
> > +		alpha =3D state->alpha * alpha_max / DRM_BLEND_ALPHA_OPAQUE;
> > +
> > +		DRM_DEBUG_DRIVER("Setting layer %d alpha to %d/%d\n", index,
> > +				 alpha, alpha_max);
> > +
> > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ALPHA_REG(index),
> > +			     alpha);
> > +	}
> > +
> > +	/* Layer control */
> > +
> > +	reg =3D LOGICVC_LAYER_CTRL_ENABLE;
> > +
> > +	if (logicvc_layer_format_inverted(fb->format->format))
> > +		reg |=3D LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
> > +
> > +	reg |=3D LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
> > +}
> > +
> > +static void logicvc_plane_atomic_disable(struct drm_plane *drm_plane,
> > +					 struct drm_plane_state *old_state)
> > +{
> > +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> > +	struct logicvc_drm *logicvc =3D layer->logicvc;
> > +	u32 index =3D layer->index;
> > +
> > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), 0);
> > +}
> > +
> > +static struct drm_plane_helper_funcs logicvc_plane_helper_funcs =3D {
> > +	.atomic_check		=3D logicvc_plane_atomic_check,
> > +	.atomic_update		=3D logicvc_plane_atomic_update,
> > +	.atomic_disable		=3D logicvc_plane_atomic_disable,
> > +};
> > +
> > +static const struct drm_plane_funcs logicvc_plane_funcs =3D {
> > +	.update_plane		=3D drm_atomic_helper_update_plane,
> > +	.disable_plane		=3D drm_atomic_helper_disable_plane,
> > +	.destroy		=3D drm_plane_cleanup,
> > +	.reset			=3D drm_atomic_helper_plane_reset,
> > +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
> > +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> > +};
> > +
> > +int logicvc_layer_buffer_find_setup(struct logicvc_layer *layer,
> > +				    struct drm_plane_state *state,
> > +				    struct logicvc_layer_buffer_setup *setup)
> > +{
> > +	struct logicvc_drm *logicvc =3D layer->logicvc;
> > +	struct drm_framebuffer *fb =3D state->fb;
> > +	/* All the supported formats have a single data plane. */
> > +	u32 layer_bytespp =3D fb->format->cpp[0];
> > +	u32 layer_stride =3D layer_bytespp * logicvc->config.row_stride;
> > +	u32 base_offset =3D layer->config.base_offset * layer_stride;
> > +	u32 buffer_offset =3D layer->config.buffer_offset * layer_stride;
> > +	u8 buffer_sel =3D 0;
> > +	u16 voffset =3D 0;
> > +	u16 hoffset =3D 0;
> > +	phys_addr_t fb_addr;
> > +	u32 fb_offset;
> > +	u32 gap;
> > +
> > +	if (!logicvc->reserved_mem_base) {
> > +		drm_err(logicvc->drm,
> > +			"No reserved memory base was registered!\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> > +	if (fb_addr < logicvc->reserved_mem_base) {
> > +		drm_err(logicvc->drm,
> > +			"Framebuffer memory below reserved memory base!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	fb_offset =3D (u32) (fb_addr - logicvc->reserved_mem_base);
> > +
> > +	if (fb_offset < base_offset) {
> > +		drm_err(logicvc->drm,
> > +			"Framebuffer offset below layer base offset!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	gap =3D fb_offset - base_offset;
> > +
> > +	/* Use the possible video buffers selection. */
> > +	if (gap && buffer_offset) {
> > +		buffer_sel =3D gap / buffer_offset;
> > +		if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
> > +			buffer_sel =3D LOGICVC_BUFFER_SEL_MAX;
> > +
> > +		gap -=3D buffer_sel * buffer_offset;
> > +	}
> > +
> > +	/* Use the vertical offset. */
> > +	if (gap && layer_stride && logicvc->config.layers_configurable) {
> > +		voffset =3D gap / layer_stride;
> > +		if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
> > +			voffset =3D LOGICVC_LAYER_VOFFSET_MAX;
> > +
> > +		gap -=3D voffset * layer_stride;
> > +	}
> > +
> > +	/* Use the horizontal offset. */
> > +	if (gap && layer_bytespp && logicvc->config.layers_configurable) {
> > +		hoffset =3D gap / layer_bytespp;
> > +		if (hoffset > LOGICVC_DIMENSIONS_MAX)
> > +			hoffset =3D LOGICVC_DIMENSIONS_MAX;
> > +
> > +		gap -=3D hoffset * layer_bytespp;
> > +	}
> > +
> > +	if (gap) {
> > +		drm_err(logicvc->drm,
> > +			"Unable to find layer %d buffer setup for 0x%x byte gap\n",
> > +			layer->index, fb_offset - base_offset);
> > +		return -EINVAL;
> > +	}
> > +
> > +	DRM_DEBUG_DRIVER("Found layer %d buffer setup for 0x%x byte gap:\n",
> > +			 layer->index, fb_offset - base_offset);
> > +
> > +	DRM_DEBUG_DRIVER("- buffer_sel =3D 0x%x chunks of 0x%x bytes\n",
> > +			 buffer_sel, buffer_offset);
> > +	DRM_DEBUG_DRIVER("- voffset =3D 0x%x chunks of 0x%x bytes\n", voffset,
> > +			 layer_stride);
> > +	DRM_DEBUG_DRIVER("- hoffset =3D 0x%x chunks of 0x%x bytes\n", hoffset,
> > +			 layer_bytespp);
> > +
> > +	if (setup) {
> > +		setup->buffer_sel =3D buffer_sel;
> > +		setup->voffset =3D voffset;
> > +		setup->hoffset =3D hoffset;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct logicvc_layer_formats *logicvc_layer_formats_lookup(stru=
ct logicvc_layer *layer)
> > +{
> > +	bool alpha;
> > +	unsigned int i =3D 0;
> > +
> > +	alpha =3D (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_PIXEL);
> > +
> > +	while (logicvc_layer_formats[i].formats) {
> > +		if (logicvc_layer_formats[i].colorspace =3D=3D layer->config.colorsp=
ace &&
> > +		    logicvc_layer_formats[i].depth =3D=3D layer->config.depth &&
> > +		    logicvc_layer_formats[i].alpha =3D=3D alpha)
> > +			return &logicvc_layer_formats[i];
> > +
> > +		i++;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static unsigned int logicvc_layer_formats_count(struct logicvc_layer_f=
ormats *formats)
> > +{
> > +	unsigned int count =3D 0;
> > +
> > +	while (formats->formats[count] !=3D DRM_FORMAT_INVALID)
> > +		count++;
> > +
> > +	return count;
> > +}
> > +
> > +static int logicvc_layer_config_parse(struct logicvc_drm *logicvc,
> > +				      struct logicvc_layer *layer)
> > +{
> > +	struct device_node *of_node =3D layer->of_node;
> > +	struct logicvc_layer_config *config =3D &layer->config;
> > +	int ret;
> > +
> > +	logicvc_of_property_parse_bool(of_node, "xylon,layer-primary",
> > +				       &config->primary);
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,layer-colorspac=
e",
> > +					    &config->colorspace);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,layer-depth",
> > +					    &config->depth);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,layer-alpha-mod=
e",
> > +					    &config->alpha_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Memory offset is only relevant without layer address configuration=
=2E */
> > +	if (logicvc->caps->layer_address)
> > +		return 0;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,layer-base-offs=
et",
> > +					    &config->base_offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D logicvc_of_property_parse_u32(of_node, "xylon,layer-buffer-of=
fset",
> > +					    &config->buffer_offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm =
*logicvc,
> > +						   u32 index)
> > +{
> > +	struct logicvc_layer *layer;
> > +
> > +	list_for_each_entry(layer, &logicvc->layers_list, list)
> > +		if (layer->index =3D=3D index)
> > +			return layer;
> > +
> > +	return NULL;
> > +}
> > +
> > +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *=
logicvc,
> > +						  enum drm_plane_type type)
> > +{
> > +	struct logicvc_layer *layer;
> > +
> > +	list_for_each_entry(layer, &logicvc->layers_list, list)
> > +		if (layer->drm_plane.type =3D=3D type)
> > +			return layer;
> > +
> > +	return NULL;
> > +}
> > +
> > +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *lo=
gicvc)
> > +{
> > +	return logicvc_layer_get_from_type(logicvc, DRM_PLANE_TYPE_PRIMARY);
> > +}
> > +
> > +static int logicvc_layer_init(struct logicvc_drm *logicvc,
> > +			      struct device_node *of_node, u32 index)
> > +{
> > +	struct logicvc_layer *layer =3D NULL;
> > +	struct logicvc_layer_formats *formats;
> > +	unsigned int formats_count;
> > +	enum drm_plane_type type;
> > +	unsigned int zpos;
> > +	int ret;
> > +
> > +	layer =3D devm_kzalloc(logicvc->drm->dev, sizeof(*layer), GFP_KERNEL);
> > +	if (!layer) {
> > +		ret =3D -ENOMEM;
> > +		goto error;
> > +	}
> > +
> > +	layer->logicvc =3D logicvc;
> > +	layer->of_node =3D of_node;
> > +	layer->index =3D index;
> > +
> > +	ret =3D logicvc_layer_config_parse(logicvc, layer);
> > +	if (ret) {
> > +		drm_err(logicvc->drm,
> > +			"Failed to parse config for layer #%d\n", index);
> > +		goto error;
> > +	}
> > +
> > +	formats =3D logicvc_layer_formats_lookup(layer);
> > +	if (!formats) {
> > +		drm_err(logicvc->drm,
> > +			"Failed to lookup formats for layer #%d\n", index);
> > +		goto error;
> > +	}
> > +
> > +	formats_count =3D logicvc_layer_formats_count(formats);
> > +
> > +	/* The final layer can be configured as a background layer. */
> > +	if (logicvc->config.background_layer &&
> > +	    index =3D=3D (logicvc->config.layers_count - 1)) {
> > +		/* A zero value for black is only valid for RGB, not for YUV,
> > +		 * so this will need to take the format in account for YUV. */
> > +		u32 background =3D 0;
> > +
> > +		DRM_DEBUG_DRIVER("Using layer #%d as background layer\n",
> > +				 index);
> > +
> > +		regmap_write(logicvc->regmap, LOGICVC_BACKGROUND_COLOR_REG,
> > +			     background);
> > +
> > +		devm_kfree(logicvc->drm->dev, layer);
> > +
> > +		return 0;
> > +	}
> > +
> > +	if (layer->config.primary)
> > +		type =3D DRM_PLANE_TYPE_PRIMARY;
> > +	else
> > +		type =3D DRM_PLANE_TYPE_OVERLAY;
> > +
> > +	ret =3D drm_universal_plane_init(logicvc->drm, &layer->drm_plane, 0,
> > +				       &logicvc_plane_funcs, formats->formats,
> > +				       formats_count, NULL, type, NULL);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize layer plane\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_plane_helper_add(&layer->drm_plane, &logicvc_plane_helper_funcs);
> > +
> > +	zpos =3D logicvc->config.layers_count - index - 1;
> > +	DRM_DEBUG_DRIVER("Giving layer #%d zpos %d\n", index, zpos);
> > +
> > +	if (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_LAYER)
> > +		drm_plane_create_alpha_property(&layer->drm_plane);
> > +
> > +	drm_plane_create_zpos_immutable_property(&layer->drm_plane, zpos);
> > +
> > +	DRM_DEBUG_DRIVER("Registering layer #%d\n", index);
> > +
> > +	layer->formats =3D formats;
> > +
> > +	list_add_tail(&layer->list, &logicvc->layers_list);
> > +
> > +	return 0;
> > +
> > +error:
> > +	if (layer)
> > +		devm_kfree(logicvc->drm->dev, layer);
> > +
> > +	return ret;
> > +}
> > +
> > +static void logicvc_layer_fini(struct logicvc_drm *logicvc,
> > +			       struct logicvc_layer *layer)
> > +{
> > +	list_del(&layer->list);
> > +	devm_kfree(logicvc->drm->dev, layer);
> > +}
> > +
> > +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc)
> > +{
> > +	uint32_t possible_crtcs =3D drm_crtc_mask(&logicvc->crtc->drm_crtc);
> > +	struct logicvc_layer *layer;
> > +
> > +	list_for_each_entry(layer, &logicvc->layers_list, list) {
> > +		if (layer->drm_plane.type !=3D DRM_PLANE_TYPE_OVERLAY)
> > +			continue;
> > +
> > +		layer->drm_plane.possible_crtcs =3D possible_crtcs;
> > +	}
> > +}
> > +
> > +int logicvc_layers_init(struct logicvc_drm *logicvc)
> > +{
> > +	struct device_node *of_node =3D logicvc->drm->dev->of_node;
> > +	struct device_node *layer_node =3D NULL;
> > +	struct device_node *layers_node;
> > +	struct logicvc_layer *layer;
> > +	struct logicvc_layer *next;
> > +	int ret =3D 0;
> > +
> > +	layers_node =3D of_get_child_by_name(of_node, "layers");
> > +	if (!layers_node) {
> > +		DRM_ERROR("No layers node found in the description\n");
> > +		ret =3D -ENODEV;
> > +		goto error;
> > +	}
> > +
> > +	for_each_child_of_node(layers_node, layer_node) {
> > +		u32 index =3D 0;
> > +
> > +		if (!logicvc_of_node_is_layer(layer_node))
> > +			continue;
> > +
> > +		ret =3D of_property_read_u32(layer_node, "reg", &index);
> > +		if (ret)
> > +			continue;
> > +
> > +		layer =3D logicvc_layer_get_from_index(logicvc, index);
> > +		if (layer) {
> > +			DRM_ERROR("Duplicated entry for layer #%d\n", index);
> > +			continue;
> > +		}
> > +
> > +		ret =3D logicvc_layer_init(logicvc, layer_node, index);
> > +		if (ret)
> > +			goto error;
> > +
> > +		of_node_put(layer_node);
> > +	}
> > +
> > +	of_node_put(layers_node);
> > +
> > +	return 0;
> > +
> > +error:
> > +	list_for_each_entry_safe(layer, next, &logicvc->layers_list, list)
> > +		logicvc_layer_fini(logicvc, layer);
> > +
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/=
logicvc/logicvc_layer.h
> > new file mode 100644
> > index 000000000000..71b3f177b093
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_LAYER_H_
> > +#define _LOGICVC_LAYER_H_
> > +
> > +#include <linux/of.h>
> > +#include <linux/types.h>
> > +#include <drm/drm_plane.h>
> > +
> > +#define LOGICVC_LAYER_COLORSPACE_RGB		0
> > +#define LOGICVC_LAYER_COLORSPACE_YUV		1
> > +
> > +#define LOGICVC_LAYER_ALPHA_LAYER		0
> > +#define LOGICVC_LAYER_ALPHA_PIXEL		1
> > +
> > +struct logicvc_layer_buffer_setup {
> > +	u8 buffer_sel;
> > +	u16 voffset;
> > +	u16 hoffset;
> > +};
> > +
> > +struct logicvc_layer_config {
> > +	u32 colorspace;
> > +	u32 depth;
> > +	u32 alpha_mode;
> > +	u32 base_offset;
> > +	u32 buffer_offset;
> > +	bool primary;
> > +};
> > +
> > +struct logicvc_layer_formats {
> > +	u32 colorspace;
> > +	u32 depth;
> > +	bool alpha;
> > +	uint32_t *formats;
> > +};
> > +
> > +struct logicvc_layer {
> > +	struct logicvc_drm *logicvc;
> > +
> > +	struct logicvc_layer_config config;
> > +	struct logicvc_layer_formats *formats;
> > +	struct device_node *of_node;
> > +
> > +	struct drm_plane drm_plane;
> > +	struct list_head list;
> > +	u32 index;
> > +};
> > +
> > +int logicvc_layer_buffer_find_setup(struct logicvc_layer *layer,
> > +				    struct drm_plane_state *state,
> > +				    struct logicvc_layer_buffer_setup *setup);
> > +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm =
*logicvc,
> > +						   u32 index);
> > +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *=
logicvc,
> > +						  enum drm_plane_type type);
> > +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *lo=
gicvc);
> > +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc);
> > +int logicvc_layers_init(struct logicvc_drm *logicvc);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/l=
ogicvc/logicvc_mode.c
> > new file mode 100644
> > index 000000000000..a97ca36fdae7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_mode_config.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "logicvc_drm.h"
> > +#include "logicvc_interface.h"
> > +#include "logicvc_layer.h"
> > +#include "logicvc_mode.h"
> > +
> > +static void logicvc_mode_atomic_commit_tail(struct drm_atomic_state *o=
ld_state)
> > +{
> > +	struct drm_device *drm =3D old_state->dev;
> > +	struct logicvc_drm *logicvc =3D drm->dev_private;
> > +	struct logicvc_interface *interface =3D logicvc->interface;
> > +
> > +	drm_atomic_helper_commit_tail(old_state);
> > +
> > +	/* Enable the panel after the first commit, which concerns our panel
> > +	 * since we only support a single interface. */
> > +	if (interface->drm_panel && !interface->drm_panel_enabled) {
> > +		drm_panel_enable(interface->drm_panel);
> > +		interface->drm_panel_enabled =3D true;
> > +	}
> > +}
> > +
> > +static const struct drm_mode_config_helper_funcs logicvc_mode_config_h=
elper_funcs =3D {
> > +	.atomic_commit_tail	=3D logicvc_mode_atomic_commit_tail,
> > +};
> > +
> > +static const struct drm_mode_config_funcs logicvc_mode_config_funcs =
=3D {
> > +	.fb_create		=3D drm_gem_fb_create,
> > +	.output_poll_changed	=3D drm_fb_helper_output_poll_changed,
> > +	.atomic_check		=3D drm_atomic_helper_check,
> > +	.atomic_commit		=3D drm_atomic_helper_commit,
> > +};
> > +
> > +int logicvc_mode_init(struct logicvc_drm *logicvc)
> > +{
> > +	struct drm_mode_config *mode_config =3D &logicvc->drm->mode_config;
> > +	struct logicvc_layer *layer_primary;
> > +	uint32_t preferred_depth;
> > +	int ret;
> > +
> > +	ret =3D drm_vblank_init(logicvc->drm, logicvc->drm->mode_config.num_c=
rtc);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize vblank\n");
> > +		return ret;
> > +	}
> > +
> > +	layer_primary =3D logicvc_layer_get_primary(logicvc);
> > +	if (!layer_primary) {
> > +		drm_err(logicvc->drm, "Failed to get primary layer\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	preferred_depth =3D layer_primary->formats->depth;
> > +
> > +	/* DRM counts alpha in depth, our driver doesn't. */
> > +	if (layer_primary->formats->alpha)
> > +		preferred_depth +=3D 8;
> > +
> > +	mode_config->min_width =3D 64;
> > +	mode_config->max_width =3D 2048;
> > +	mode_config->min_height =3D 1;
> > +	mode_config->max_height =3D 2048;
> > +	mode_config->preferred_depth =3D preferred_depth;
> > +	mode_config->funcs =3D &logicvc_mode_config_funcs;
> > +	mode_config->helper_private =3D &logicvc_mode_config_helper_funcs;
> > +
> > +	drm_mode_config_reset(logicvc->drm);
> > +
> > +	ret =3D drm_fbdev_generic_setup(logicvc->drm, preferred_depth);
> > +	if (ret) {
> > +		drm_err(logicvc->drm, "Failed to initialize fbdev\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_kms_helper_poll_init(logicvc->drm);
> > +
> > +	return 0;
> > +}
> > +
> > +void logicvc_mode_fini(struct logicvc_drm *logicvc)
> > +{
> > +	drm_kms_helper_poll_fini(logicvc->drm);
> > +}
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.h b/drivers/gpu/drm/l=
ogicvc/logicvc_mode.h
> > new file mode 100644
> > index 000000000000..690def1619a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_mode.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_MODE_H_
> > +#define _LOGICVC_MODE_H_
> > +
> > +struct logicvc_drm;
> > +
> > +int logicvc_mode_init(struct logicvc_drm *logicvc);
> > +void logicvc_mode_fini(struct logicvc_drm *logicvc);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_of.c b/drivers/gpu/drm/log=
icvc/logicvc_of.c
> > new file mode 100644
> > index 000000000000..19b7bc5ea572
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_of.c
> > @@ -0,0 +1,205 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#include <drm/drm_print.h>
> > +
> > +#include "logicvc_drm.h"
> > +#include "logicvc_layer.h"
> > +#include "logicvc_of.h"
> > +
> > +static struct logicvc_of_property_sv logicvc_of_display_interface_sv[]=
 =3D {
> > +	{ "lvds-4bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS },
> > +	{ "lvds-3bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS },
> > +	{ },
> > +};
> > +
> > +static struct logicvc_of_property_sv logicvc_of_display_colorspace_sv[=
] =3D {
> > +	{ "rgb",	LOGICVC_DISPLAY_COLORSPACE_RGB },
> > +	{ "yuv422",	LOGICVC_DISPLAY_COLORSPACE_YUV422 },
> > +	{ "yuv444",	LOGICVC_DISPLAY_COLORSPACE_YUV444 },
> > +	{ },
> > +};
> > +
> > +static struct logicvc_of_property_sv logicvc_of_layer_colorspace_sv[] =
=3D {
> > +	{ "rgb",	LOGICVC_LAYER_COLORSPACE_RGB },
> > +	{ "yuv",	LOGICVC_LAYER_COLORSPACE_YUV },
> > +	{ },
> > +};
> > +
> > +static struct logicvc_of_property_sv logicvc_of_layer_alpha_mode_sv[] =
=3D {
> > +	{ "layer",	LOGICVC_LAYER_ALPHA_LAYER },
> > +	{ "pixel",	LOGICVC_LAYER_ALPHA_PIXEL },
> > +	{ },
> > +};
> > +
> > +static struct logicvc_of_property logicvc_of_properties[] =3D {
> > +	{
> > +		.name		=3D "xylon,display-interface",
> > +		.sv		=3D logicvc_of_display_interface_sv,
> > +		.range		=3D {
> > +			LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS,
> > +			LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS,
> > +		},
> > +	},
> > +	{
> > +		.name		=3D "xylon,display-colorspace",
> > +		.sv		=3D logicvc_of_display_colorspace_sv,
> > +		.range		=3D {
> > +			LOGICVC_DISPLAY_COLORSPACE_RGB,
> > +			LOGICVC_DISPLAY_COLORSPACE_YUV444,
> > +		},
> > +	},
> > +	{
> > +		.name		=3D "xylon,display-depth",
> > +		.range		=3D { 8, 24 },
> > +	},
> > +	{
> > +		.name		=3D "xylon,row-stride",
> > +	},
> > +	{
> > +		.name		=3D "xylon,dithering",
> > +		.optional	=3D true,
> > +	},
> > +	{
> > +		.name		=3D "xylon,background-layer",
> > +		.optional	=3D true,
> > +	},
> > +	{
> > +		.name		=3D "xylon,layers-configurable",
> > +		.optional	=3D true,
> > +	},
> > +	{
> > +		.name		=3D "xylon,layers-count",
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-depth",
> > +		.range		=3D { 8, 24 },
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-colorspace",
> > +		.sv		=3D logicvc_of_layer_colorspace_sv,
> > +		.range		=3D {
> > +			LOGICVC_LAYER_COLORSPACE_RGB,
> > +			LOGICVC_LAYER_COLORSPACE_RGB,
> > +		},
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-alpha-mode",
> > +		.sv		=3D logicvc_of_layer_alpha_mode_sv,
> > +		.range		=3D {
> > +			LOGICVC_LAYER_ALPHA_LAYER,
> > +			LOGICVC_LAYER_ALPHA_PIXEL,
> > +		},
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-base-offset",
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-buffer-offset",
> > +	},
> > +	{
> > +		.name		=3D "xylon,layer-primary",
> > +		.optional	=3D true,
> > +	},
> > +	{ },
> > +};
> > +
> > +static int logicvc_of_property_sv_value(struct logicvc_of_property_sv =
*sv,
> > +					const char *string, u32 *value)
> > +{
> > +	unsigned int i =3D 0;
> > +
> > +	while (sv[i].string) {
> > +		if (!strcmp(sv[i].string, string)) {
> > +			*value =3D sv[i].value;
> > +			return 0;
> > +		}
> > +
> > +		i++;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static struct logicvc_of_property *logicvc_of_property_lookup(const ch=
ar *name)
> > +{
> > +	unsigned int i =3D 0;
> > +
> > +	while (logicvc_of_properties[i].name) {
> > +		if (!strcmp(logicvc_of_properties[i].name, name))
> > +			return &logicvc_of_properties[i];
> > +
> > +		i++;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +int logicvc_of_property_parse_u32(struct device_node *of_node,
> > +				  const char *name, u32 *target)
> > +{
> > +	struct logicvc_of_property *property;
> > +	const char *string;
> > +	u32 value;
> > +	int ret;
> > +
> > +	property =3D logicvc_of_property_lookup(name);
> > +	if (!property)
> > +		return -EINVAL;
> > +
> > +	if (!property->optional && !of_property_read_bool(of_node, name)) {
> > +		DRM_ERROR("Missing non-optional OF property %s\n", name);
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (property->sv) {
> > +		ret =3D of_property_read_string(of_node, name, &string);
> > +		if (ret) {
> > +			DRM_ERROR("Failed to read OF property %s\n", name);
> > +			return ret;
> > +		}
> > +
> > +		ret =3D logicvc_of_property_sv_value(property->sv, string,
> > +						   &value);
> > +		if (ret) {
> > +			DRM_ERROR("Failed to match OF string %s\n", name);
> > +			return ret;
> > +		}
> > +	} else {
> > +		ret =3D of_property_read_u32(of_node, name, &value);
> > +		if (ret) {
> > +			DRM_ERROR("Failed to read OF property %s\n", name);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (property->range[0] || property->range[1])
> > +		if (value < property->range[0] || value > property->range[1])
> > +			return -ERANGE;
> > +
> > +	*target =3D value;
> > +
> > +	return 0;
> > +}
> > +
> > +void logicvc_of_property_parse_bool(struct device_node *of_node,
> > +				    const char *name, bool *target)
> > +{
> > +	struct logicvc_of_property *property;
> > +
> > +	property =3D logicvc_of_property_lookup(name);
> > +	if (!property) {
> > +		*target =3D false;
> > +		return;
> > +	}
> > +
> > +	*target =3D of_property_read_bool(of_node, name);
> > +}
> > +
> > +bool logicvc_of_node_is_layer(struct device_node *of_node)
> > +{
> > +	return !of_node_cmp(of_node->name, "layer");
> > +}
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_of.h b/drivers/gpu/drm/log=
icvc/logicvc_of.h
> > new file mode 100644
> > index 000000000000..5c6f3f33503a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_of.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +#ifndef _LOGICVC_OF_H_
> > +#define _LOGICVC_OF_H_
> > +
> > +struct logicvc_of_property_sv {
> > +	const char *string;
> > +	u32 value;
> > +};
> > +
> > +struct logicvc_of_property {
> > +	char *name;
> > +	bool optional;
> > +	struct logicvc_of_property_sv *sv;
> > +	u32 range[2];
> > +};
> > +
> > +int logicvc_of_property_parse_u32(struct device_node *of_node,
> > +				  const char *name, u32 *target);
> > +void logicvc_of_property_parse_bool(struct device_node *of_node,
> > +				    const char *name, bool *target);
> > +bool logicvc_of_node_is_layer(struct device_node *of_node);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_regs.h b/drivers/gpu/drm/l=
ogicvc/logicvc_regs.h
> > new file mode 100644
> > index 000000000000..d0be5fe84856
> > --- /dev/null
> > +++ b/drivers/gpu/drm/logicvc/logicvc_regs.h
> > @@ -0,0 +1,88 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + *
> > + * Copyright (C) 2014 Xylon d.o.o.
> > + * Author: Davor Joja <davor.joja@logicbricks.com>
> > + */
> > +
> > +#ifndef _LOGICVC_REGS_H_
> > +#define _LOGICVC_REGS_H_
> > +
> > +#define LOGICVC_FIELD_GET(field, value) \
> > +	(((value) & field##_MASK) >> field##_SHIFT)
> > +#define LOGICVC_FIELD_SET(field, value) \
> > +	(((value) << field##_SHIFT) & field##_MASK)
> > +
> > +#define LOGICVC_DIMENSIONS_MAX		(BIT(16) - 1)
> > +
> > +#define LOGICVC_HSYNC_FRONT_PORCH_REG	0x00
> > +#define LOGICVC_HSYNC_REG		0x08
> > +#define LOGICVC_HSYNC_BACK_PORCH_REG	0x10
> > +#define LOGICVC_HRES_REG		0x18
> > +#define LOGICVC_VSYNC_FRONT_PORCH_REG	0x20
> > +#define LOGICVC_VSYNC_REG		0x28
> > +#define LOGICVC_VSYNC_BACK_PORCH_REG	0x30
> > +#define LOGICVC_VRES_REG		0x38
> > +
> > +#define LOGICVC_CTRL_REG		0x40
> > +#define LOGICVC_CTRL_CLOCK_INVERT	BIT(8)
> > +#define LOGICVC_CTRL_PIXEL_INVERT	BIT(7)
> > +#define LOGICVC_CTRL_DE_INVERT		BIT(5)
> > +#define LOGICVC_CTRL_DE_ENABLE		BIT(4)
> > +#define LOGICVC_CTRL_VSYNC_INVERT	BIT(3)
> > +#define LOGICVC_CTRL_VSYNC_ENABLE	BIT(2)
> > +#define LOGICVC_CTRL_HSYNC_INVERT	BIT(1)
> > +#define LOGICVC_CTRL_HSYNC_ENABLE	BIT(0)
> > +
> > +#define LOGICVC_DTYPE_REG		0x48
> > +#define LOGICVC_BACKGROUND_COLOR_REG	0x50
> > +
> > +#define LOGICVC_BUFFER_SEL_REG		0x58
> > +#define LOGICVC_BUFFER_SEL_VALUE(i, v) \
> > +	(BIT(10 + (i)) | ((v) << (2 * (i))))
> > +#define LOGICVC_BUFFER_SEL_MAX		2
> > +
> > +#define LOGICVC_DOUBLE_CLUT_REG		0x60
> > +
> > +#define LOGICVC_INT_STAT_REG		0x68
> > +#define LOGICVC_INT_STAT_V_SYNC		BIT(5)
> > +
> > +#define LOGICVC_INT_MASK_REG		0x70
> > +#define LOGICVC_INT_MASK_V_SYNC		BIT(5)
> > +
> > +#define LOGICVC_POWER_CTRL_REG		0x78
> > +#define LOGICVC_POWER_CTRL_BACKLIGHT_ENABLE	BIT(0)
> > +#define LOGICVC_POWER_CTRL_VDD_ENABLE		BIT(1)
> > +#define LOGICVC_POWER_CTRL_VEE_ENABLE		BIT(2)
> > +#define LOGICVC_POWER_CTRL_VIDEO_ENABLE		BIT(3)
> > +
> > +#define LOGICVC_IP_VERSION_REG		0xf8
> > +#define LOGICVC_IP_VERSION_MAJOR_MASK	GENMASK(16, 11)
> > +#define LOGICVC_IP_VERSION_MAJOR_SHIFT	11
> > +#define LOGICVC_IP_VERSION_MINOR_MASK	GENMASK(10, 5)
> > +#define LOGICVC_IP_VERSION_MINOR_SHIFT	5
> > +#define LOGICVC_IP_VERSION_LEVEL_MASK	GENMASK(4, 0)
> > +#define LOGICVC_IP_VERSION_LEVEL_SHIFT	0
> > +
> > +#define LOGICVC_LAYER_ADDRESS_REG(i)	(0x100 + (i) * 0x80)
> > +#define LOGICVC_LAYER_HOFFSET_REG(i)	(0x100 + (i) * 0x80)
> > +
> > +#define LOGICVC_LAYER_VOFFSET_REG(i)	(0x108 + (i) * 0x80)
> > +#define LOGICVC_LAYER_VOFFSET_MAX	4095
> > +
> > +#define LOGICVC_LAYER_HPOSITION_REG(i)	(0x110 + (i) * 0x80)
> > +#define LOGICVC_LAYER_VPOSITION_REG(i)	(0x118 + (i) * 0x80)
> > +#define LOGICVC_LAYER_WIDTH_REG(i)	(0x120 + (i) * 0x80)
> > +#define LOGICVC_LAYER_HEIGHT_REG(i)	(0x128 + (i) * 0x80)
> > +#define LOGICVC_LAYER_ALPHA_REG(i)	(0x130 + (i) * 0x80)
> > +
> > +#define LOGICVC_LAYER_CTRL_REG(i)	(0x138 + (i) * 0x80)
> > +#define LOGICVC_LAYER_CTRL_ENABLE	BIT(0)
> > +#define LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE	BIT(1)
> > +#define LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT	BIT(4)
> > +
> > +#define LOGICVC_LAYER_COLOR_KEY_REG(i)	(0x140 + (i) * 0x80)
> > +
> > +#endif
> > --=20
> > 2.26.0
> >=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--BFVE2HhgxTpCzM8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6rIo8ACgkQ3cLmz3+f
v9GLTAf7BDwitrebR5h6Sh8kVW4hVNabySDf3uoM9Lu9+dAvCX0rALwHKqa0oaOs
z4TQu79oPbpYPXu7dRc3E/LBoyHvBk0zMmgLpaeOJyEwoH/015WBoyezMHIS00T2
qm6E0Du5iP5p83ZB/mZoy9KvwqY5cJiibIECeTqvB4Axms5/2Iol3+8w7d5FnjOP
Rcs1oV+JD+1lcq93K+TQM++6J+iql4kJGH7nNZ9Ebm2snA7B5ea/PonVSU7KmWSE
Feq8FeMkyRURD3c+uNlsTkfh96LQUecNAFGzGkp00/2p10+YM4smsE8MqHWpJ3Nz
rJ0f03vgjq6+3bUR2aMVMHqybqR+CQ==
=naxr
-----END PGP SIGNATURE-----

--BFVE2HhgxTpCzM8t--

--===============2052516759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2052516759==--
