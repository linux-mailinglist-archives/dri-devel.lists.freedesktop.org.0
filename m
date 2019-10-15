Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7619D777E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 15:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57C89C29;
	Tue, 15 Oct 2019 13:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB18D89C29
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 13:31:39 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1AA3840014;
 Tue, 15 Oct 2019 13:31:31 +0000 (UTC)
Date: Tue, 15 Oct 2019 15:33:20 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 3/8] drm: rcar-du: Add support for CMM
Message-ID: <20191015133320.uj4y5twxfkyopqi5@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-4-jacopo+renesas@jmondi.org>
 <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
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
Cc: muroya@ksk.co.jp, seanpaul@chromium.org,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 ezequiel@collabora.com
Content-Type: multipart/mixed; boundary="===============1835098872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1835098872==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cby6ddsouvfhyjd2"
Content-Disposition: inline


--cby6ddsouvfhyjd2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kieran, thanks for review

On Tue, Oct 15, 2019 at 12:53:55PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 15/10/2019 11:46, Jacopo Mondi wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> >
> > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > to perform image enhancement and color correction.
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM features will be
> > implemented on top of this initial one.
> >
>
> This is looking good to me.
>
> I have patches which start to add CLU on top of this, which refactor
> things slightly - but I don't think that refactoring needs to be in this
> series, and this version is independent and looks good ... thus:
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 198 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  60 +++++++++
> >  4 files changed, 266 insertions(+)
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
>
>
> DRM_RCAR_DU already depends on both DRM && OF, so I wonder if those are
> needed to be specified explicitly.
>
> Doesn't hurt of course, but I see DRM_RCAR_DW_HDMI does the same, and so
> does DRM_RCAR_LVDS, so I don't think you need to remove it.
>

I did the same as it is done for HDMI and LVDS here. The extra
dependencies could be dropped yes, I chose to be consistent.

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
> > index 000000000000..9675a8587dee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > @@ -0,0 +1,198 @@
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
> > +	 * @lut:		1D-LUT status
> > +	 * @lut.enabled:	1D-LUT enabled flag
> > +	 */
> > +	struct {
> > +		bool enabled;
> > +	} lut;
>
> This used to be a more complex structure in an earlier version storing a
> cached version of the table. Now that the cached entry is removed, does
> this need to be such a complex structure rather than just say, a bool
> lut_enabled?
>
> (We will soon add an equivalent clu_enabled too, but I don't know what
> other per-table options we'll need.)
>
> In fact, we'll potentially have other options specific to the HGO, and
> CSC at some point in the future - so grouping by entity is indeed a good
> thing IMO.

You are right, I pondered a bit it this was worth it, but I assume the
other CMM functions would have required some more complex fields so I
chose to keep it separate. I have no problem to make this a
lut_enabled, but I fear as soon as we support say, double buffering
for the lut, having a dedicated struct would be nice.

Is it ok if I keep this the way it is?

>
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
> > + *			  and write to the CMM registers.
> > + * @rcmm: Pointer to the CMM device
> > + * @drm_lut: Pointer to the DRM LUT table
> > + */
> > +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm,
> > +			       const struct drm_color_lut *drm_lut)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < CM2_LUT_SIZE; ++i) {
> > +		u32 entry =  drm_color_lut_extract(drm_lut[i].red, 8) << 16
> > +			  | drm_color_lut_extract(drm_lut[i].green, 8) << 8
> > +			  | drm_color_lut_extract(drm_lut[i].blue, 8);
> > +
> > +		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
> > +	}
> > +}
> > +
> > +/*
> > + * rcar_cmm_setup() - Configure the CMM unit.
> > + * @pdev: The platform device associated with the CMM instance
> > + * @config: The CMM unit configuration
> > + *
> > + * Configure the CMM unit with the given configuration. Currently enabling,
> > + * disabling and programming of the 1-D LUT unit is supported.
> > + */
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	/* Disable LUT if requested. */
> > +	if (!config->lut.enable) {
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
> > + * rcar_cmm_enable() - Enable the CMM unit.
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Enable the CMM unit by enabling the parent clock.
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
> > + * rcar_cmm_disable() - Disable the CMM unit.
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Disable the CMM unit by stopping the parent clock.
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
> > + * rcar_cmm_init() - Initialize the CMM
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
> > index 000000000000..358ec03cf48a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > @@ -0,0 +1,60 @@
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
> > + * @lut.enable:	1D-LUT enable flag
> > + * @lut.table:	1D-LUT table entries
> > + */
> > +struct rcar_cmm_config {
> > +	struct {
> > +		bool enable;
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
>
> Excellent :-D
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
> >
>

--cby6ddsouvfhyjd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2lyqAACgkQcjQGjxah
Vjzgmg/9FPurFgRRQutdgDWSnavcbTw2qmksWIWlXcg3KevHrv9SuTUb2qP/n5Et
ODj25ggaYDoKJ3OvHXQTK038Fp6I8N+oUqT5t8yPgthDWqroKV4NVsjEdO1kgU3h
oAYiBLl8BjZS3uNs+Z6Emn44oUmUkGeZ4Erk3hOi1Jyj6nG6/KLmbc+1hXYeaAC3
Qw6XfUCyEJHemnJuDcSn3RFfW16+tAFM5smGBH/jBraoH6F1FSS9KiXjTS+8Os0T
SPc4dRTVaRSuf4OA3Aqc0IPoOWqhoEVOBbx/u6zHZMLLtrvhx+DQcFkM5VS/oXbw
wxBKsdol7G4OCPZg8Sh78mo2QMG02CfIf8JuX4l1+PW0pVEnNpBrGYW5f9M/T3vv
2D89velrNr8gXzP/jBV57hvouatnYhPItrAClmOlGaQapsP0MWNb+vRyKoj+Do11
4kC+iuR59Th8Ad2kHH0oVwjxexrmnP+aJeKPV5FRib41L4MFkZ5KST6/gGsz5/4Y
++/udJSwp1m0ZNgyfXSaTf2qCUDZX6ajcXGtahpG6asD2kg5KEWhoOlhAdCuuyPH
GJI75g+7Jk0vfkx9TLanVUVcPs1lDAWH29+VBkQSZbCfbFkGnsx4DjkNSXTjXMvx
Tly7BahNZr1h9vfa55rek5u+yURt7ChX5aiSdG1wGk/D4IInVJE=
=i7DB
-----END PGP SIGNATURE-----

--cby6ddsouvfhyjd2--

--===============1835098872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1835098872==--
