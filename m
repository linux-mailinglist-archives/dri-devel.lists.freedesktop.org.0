Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29BDAC7F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 14:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612296EA67;
	Thu, 17 Oct 2019 12:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58866EA67
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 12:42:06 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E9679240005;
 Thu, 17 Oct 2019 12:41:59 +0000 (UTC)
Date: Thu, 17 Oct 2019 14:43:49 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 3/8] drm: rcar-du: Add support for CMM
Message-ID: <20191017124349.ncay2wc75bwpcd7d@uno.localdomain>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191016085548.105703-4-jacopo+renesas@jmondi.org>
 <20191016134526.GD5175@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20191016134526.GD5175@pendragon.ideasonboard.com>
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
Cc: horms@verge.net.au, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, uli+renesas@fpond.eu
Content-Type: multipart/mixed; boundary="===============0639846377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0639846377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s2atx54st7begqc2"
Content-Disposition: inline


--s2atx54st7begqc2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Wed, Oct 16, 2019 at 04:45:26PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Oct 16, 2019 at 10:55:43AM +0200, Jacopo Mondi wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> >
> > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > to perform image enhancement and color correction.
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM features will be
> > implemented on top of this initial one.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 212 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  58 ++++++++
> >  4 files changed, 278 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index 1529849e217e..539d232790d1 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -13,6 +13,13 @@ config DRM_RCAR_DU
> >  	  Choose this option if you have an R-Car chipset.
> >  	  If M is selected the module will be called rcar-du-drm.
> >
> > +config DRM_RCAR_CMM
> > +	bool "R-Car DU Color Management Module (CMM) Support"
> > +	depends on DRM && OF
> > +	depends on DRM_RCAR_DU
> > +	help
> > +	  Enable support for R-Car Color Management Module (CMM).
> > +
> >  config DRM_RCAR_DW_HDMI
> >  	tristate "R-Car DU Gen3 HDMI Encoder Support"
> >  	depends on DRM && OF
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> > index 6c2ed9c46467..4d1187ccc3e5 100644
> > --- a/drivers/gpu/drm/rcar-du/Makefile
> > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > @@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
> >  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
> >  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
> >
> > +obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
> >  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
> >  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > new file mode 100644
> > index 000000000000..4170626208cf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > @@ -0,0 +1,212 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> > + *
> > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include <drm/drm_color_mgmt.h>
> > +
> > +#include "rcar_cmm.h"
> > +
> > +#define CM2_LUT_CTRL		0x0000
> > +#define CM2_LUT_CTRL_LUT_EN	BIT(0)
> > +#define CM2_LUT_TBL_BASE	0x0600
> > +#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
> > +
> > +struct rcar_cmm {
> > +	void __iomem *base;
> > +
> > +	/*
> > +	 * @lut:		1D-LUT state
> > +	 * @lut.enabled:	1D-LUT enabled flag
> > +	 */
> > +	struct {
> > +		bool enabled;
> > +	} lut;
> > +};
> > +
> > +static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> > +{
> > +	return ioread32(rcmm->base + reg);
> > +}
> > +
> > +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
> > +{
> > +	iowrite32(data, rcmm->base + reg);
> > +}
> > +
> > +/*
> > + * rcar_cmm_lut_write() - Scale the DRM LUT table entries to hardware precision
> > + *			  and write to the CMM registers
> > + * @rcmm: Pointer to the CMM device
> > + * @drm_lut: Pointer to the DRM LUT table
> > + */
> > +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
> > +			       const struct drm_color_lut *drm_lut)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < CM2_LUT_SIZE; ++i) {
> > +		u32 entry = drm_color_lut_extract(drm_lut[i].red, 8) << 16
> > +			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
> > +			  | drm_color_lut_extract(drm_lut[i].blue, 8);
> > +
> > +		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> > +	}
> > +}
> > +
> > +/*
> > + * rcar_cmm_setup() - Configure the CMM unit
> > + * @pdev: The platform device associated with the CMM instance
> > + * @config: The CMM unit configuration
> > + *
> > + * Configure the CMM unit with the given configuration. Currently enabling,
> > + * disabling and programming of the 1-D LUT unit is supported.
>
> Did you miss the comment in the previous version about explaining when
> rcar_cmm_setup() can be called (basically requiring the CMM to be
> enabled) ? I can fix this when applying if you tell me what I should
> write.
>

No I didn't.

As the DU is the only user of this function, I don't get why we should
specify here which is the order of the calls, as they are performed by
the crct driver in the right order already.

Please feel free to add whatever you consider appropriate to this
comment section when applying.

Thanks
   j

> > + *
> > + * TODO: Add support for LUT double buffer operations to avoid updating the
> > + * LUT table entries while a frame is being displayed.
> > + */
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	/* Disable LUT if no table is provided. */
> > +	if (!config->lut.table) {
> > +		if (rcmm->lut.enabled) {
> > +			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +			rcmm->lut.enabled = false;
> > +		}
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Enable LUT and program the new gamma table values. */
> > +	if (!rcmm->lut.enabled) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> > +		rcmm->lut.enabled = true;
> > +	}
> > +
> > +	rcar_cmm_lut_write(rcmm, config->lut.table);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> > +
> > +/*
> > + * rcar_cmm_enable() - Enable the CMM unit
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * When the output of the corresponding DU channel is routed to the CMM unit,
> > + * the unit shall be enabled before the DU channel is started, and remain
> > + * enabled until the channel is stopped. The CMM unit shall be disabled with
> > + * rcar_cmm_disable().
> > + *
> > + * Calls to rcar_cmm_enable() and rcar_cmm_disable() are not reference-counted.
> > + * It is an error to attempt to enable an already enabled CMM unit, or to
> > + * attempt to disable a disabled unit.
> > + */
> > +int rcar_cmm_enable(struct platform_device *pdev)
> > +{
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_sync(&pdev->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_enable);
> > +
> > +/*
> > + * rcar_cmm_disable() - Disable the CMM unit
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * See rcar_cmm_enable() for usage information.
> > + *
> > + * Disabling the CMM unit disable all the internal processing blocks. The CMM
> > + * state shall thus be restored with rcar_cmm_setup() when re-enabling the CMM
> > + * unit after the next rcar_cmm_enable() call.
> > + */
> > +void rcar_cmm_disable(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +	rcmm->lut.enabled = false;
> > +
> > +	pm_runtime_put(&pdev->dev);
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> > +
> > +/*
> > + * rcar_cmm_init() - Initialize the CMM unit
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Return: 0 on success, -EPROBE_DEFER if the CMM is not available yet,
> > + *         -ENODEV if the DRM_RCAR_CMM config option is disabled
> > + */
> > +int rcar_cmm_init(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	if (!rcmm)
> > +		return -EPROBE_DEFER;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_init);
> > +
> > +static int rcar_cmm_probe(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm;
> > +
> > +	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> > +	if (!rcmm)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, rcmm);
> > +
> > +	rcmm->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rcmm->base))
> > +		return PTR_ERR(rcmm->base);
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rcar_cmm_remove(struct platform_device *pdev)
> > +{
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rcar_cmm_of_table[] = {
> > +	{ .compatible = "renesas,rcar-gen3-cmm", },
> > +	{ .compatible = "renesas,rcar-gen2-cmm", },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> > +
> > +static struct platform_driver rcar_cmm_platform_driver = {
> > +	.probe		= rcar_cmm_probe,
> > +	.remove		= rcar_cmm_remove,
> > +	.driver		= {
> > +		.name	= "rcar-cmm",
> > +		.of_match_table = rcar_cmm_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(rcar_cmm_platform_driver);
> > +
> > +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org>");
> > +MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > new file mode 100644
> > index 000000000000..b5f7ec6db04a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > @@ -0,0 +1,58 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * rcar_cmm.h -- R-Car Display Unit Color Management Module
> > + *
> > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + */
> > +
> > +#ifndef __RCAR_CMM_H__
> > +#define __RCAR_CMM_H__
> > +
> > +#define CM2_LUT_SIZE		256
> > +
> > +struct drm_color_lut;
> > +struct platform_device;
> > +
> > +/**
> > + * struct rcar_cmm_config - CMM configuration
> > + *
> > + * @lut:	1D-LUT configuration
> > + * @lut.table:	1D-LUT table entries. Disable LUT operations when NULL
> > + */
> > +struct rcar_cmm_config {
> > +	struct {
> > +		struct drm_color_lut *table;
> > +	} lut;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> > +int rcar_cmm_init(struct platform_device *pdev);
> > +
> > +int rcar_cmm_enable(struct platform_device *pdev);
> > +void rcar_cmm_disable(struct platform_device *pdev);
> > +
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config);
> > +#else
> > +static inline int rcar_cmm_init(struct platform_device *pdev)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +static inline int rcar_cmm_enable(struct platform_device *pdev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline void rcar_cmm_disable(struct platform_device *pdev)
> > +{
> > +}
> > +
> > +static inline int rcar_cmm_setup(struct platform_device *pdev,
> > +				 const struct rcar_cmm_config *config)
> > +{
> > +	return 0;
> > +}
> > +#endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
> > +
> > +#endif /* __RCAR_CMM_H__ */
>
> --
> Regards,
>
> Laurent Pinchart

--s2atx54st7begqc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2oYgUACgkQcjQGjxah
VjwiBQ//eQ3+KakGd43Q45rEyakp7nVinWW6wZfvMBCF+aci17r47cWw8q9AsVT+
/Hxi4ujAHOdAsMpBT/rUODlSK5beGWk+tmxeTHkTF0J5Xfj8tmduKcXIdONf+k1Y
eOLK24MXCgAFbG6jSe4XzBewt+5BoSBSQOKpxkosKB1Rrge1aZmnXAvnNd/EHDW1
ZuHGl803ohm9TQlXtzpilGxr/9o0qmilshgLMLzuuHl8RZQDoY4JiuY4k/p6z0s1
MsNSxrJyGmVAPEyhs6GdPQPElebOqOKe2/0qBx5WoReP34IWaO4t+tr+8tDMKKHm
BasPS/92dTu2c41Mg9KD44hmMVfc1OC97Am3vRLfV80dcEbr9d+NAI3Qd70VYIA1
3X2mKC+2n3dNox6FQVV3XHVIUu3qhQnwPNDZPdOnpzU3fjLOZAqA3IdQEDxY7Rmg
sOMo0FPiSaBF33P2Eq1lH8mgHmYMtOripC4pZEHHoUeGwVrZ/Hu65FfohjcDXLc3
NxgzI1TDblBU1K59fjJy019SNk4QXCRNLhKiiJPACBjRsp4CEiLBwLjitbV8EEwU
5dbM2l3vM2Kq+Skz8SEJtDorqi/ZzntL5g3iZMMT4XPanUJ+siTbER07MS2CluDY
sx98L6zpiL2QPNgXo2wfNBeN94ZoIWp8rhlMHKv1iRsghBEc/cE=
=Ad+p
-----END PGP SIGNATURE-----

--s2atx54st7begqc2--

--===============0639846377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0639846377==--
