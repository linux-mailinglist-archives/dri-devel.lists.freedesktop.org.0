Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0216B09C1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98286EC24;
	Thu, 12 Sep 2019 07:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D001B6EC24
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 07:57:56 +0000 (UTC)
X-Originating-IP: 85.243.204.24
Received: from uno.localdomain (bl10-204-24.dsl.telepac.pt [85.243.204.24])
 (Authenticated sender: jacopo@jmondi.org)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 588624000D;
 Thu, 12 Sep 2019 07:57:49 +0000 (UTC)
Date: Thu, 12 Sep 2019 09:59:21 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/9] drm: rcar-du: Add support for CMM
Message-ID: <20190912075921.bslnfwmco7rhmowz@uno.localdomain>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-4-jacopo+renesas@jmondi.org>
 <d46b0e1b-d0a8-3e6b-41e5-029bf07c2cae@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <d46b0e1b-d0a8-3e6b-41e5-029bf07c2cae@ideasonboard.com>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu
Content-Type: multipart/mixed; boundary="===============0703874395=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0703874395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zqsgyw66jwhjebpi"
Content-Disposition: inline


--zqsgyw66jwhjebpi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kiernan,
   thanks for review

On Wed, Sep 11, 2019 at 04:54:58PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> <This time replying to the mail with ML's included Doh!>
>
> On 06/09/2019 14:43, Jacopo Mondi wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> >
> > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > to perform image enhancement and color correction.
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM feature will be
>
> s/feature/features/
>
> > implemented on top of this basic one.
>
> s/basic/initial/
>
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 251 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  61 +++++++
> >  4 files changed, 320 insertions(+)
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> b/drivers/gpu/drm/rcar-du/Kconfig
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
> > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> b/drivers/gpu/drm/rcar-du/Makefile
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
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > new file mode 100644
> > index 000000000000..3cacdc4474c7
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > @@ -0,0 +1,251 @@
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
>
> I'd have a new line here
>
> > +#define CM2_LUT_TBL_BASE	0x0600
> > +#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
> > +
> > +struct rcar_cmm {
> > +	void __iomem *base;
> > +	bool enabled;
> > +
> > +	/*
> > +	 * @lut:		1D-LUT status
> > +	 * @lut.enabled:	1D-LUT enabled flag
> > +	 * @lut.table:		Table of 1D-LUT entries scaled to hardware
> > +	 *			precision (8-bits per color component)
> > +	 */
> > +	struct {
> > +		bool enabled;
> > +		u32 table[CM2_LUT_SIZE];
> > +	} lut;
> > +};
> > +
> > +static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> > +{
> > +	return ioread32(rcmm->base + reg);
> > +}
> > +
> > +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32
> data)
> > +{
> > +	iowrite32(data, rcmm->base + reg);
> > +}
> > +
> > +/*
> > + * rcar_cmm_lut_extract() - Scale down to hardware precision the DRM
> LUT table
> > + *			    entries and store them.
> > + * @rcmm: Pointer to the CMM device
> > + * @drm_lut: Pointer to the DRM LUT table
> > + */
> > +static void rcar_cmm_lut_extract(struct rcar_cmm *rcmm,
> > +				 const struct drm_color_lut *drm_lut)
> > +{
> > +	unsigned int i;
>
> I think you're missing the following here:
>
> 	if (!drm_lut)
> 		return;
>
> You mention below that drm_lut could be passed in as NULL, which would
> cause a segfault here otherwise.
>

Thanks for spotting, but I should have removed that comment, as I have
killed that case in rcar_du_atomic_commit_update_cmm() in patch 8/9,
as from my testing it seems it is not possible to provide from
userspace a non populated LUT table to just re-enable the CMM.

So we're fine here.

>
> > +
> > +	for (i = 0; i < CM2_LUT_SIZE; ++i) {
> > +		const struct drm_color_lut *lut = &drm_lut[i];
> > +
> > +		rcmm->lut.table[i] = drm_color_lut_extract(lut->red, 8) << 16
> > +				   | drm_color_lut_extract(lut->green, 8) << 8
> > +				   | drm_color_lut_extract(lut->blue, 8);
> > +	}
> > +}
> > +
> > +/*
> > + * rcar_cmm_lut_write() - Write to hardware the LUT table entries
> from the
> > + *			  local table.
> > + * @rcmm: Pointer to the CMM device
> > + */
> > +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < CM2_LUT_SIZE; ++i)
> > +		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), rcmm->lut.table[i]);
> > +}
> > +
> > +/*
> > + * rcar_cmm_setup() - Configure the CMM unit.
> > + * @pdev: The platform device associated with the CMM instance
> > + * @config: The CRTC-provided configuration.
>
> I don't think CRTC-provided should be hyphenated like that.
> Perhaps just:
> 	"The colour management configuration".
>
> As I don't think who provides the configuration is relevant to the
> actual call.
>

I have no idea. I've been bought into this by the comment

"CRTC-provided" is a compound adjective, qualifying the noun
"configuration". It thus needs a hyphen.

I'm happy to remove it for a simpler version.

Thanks
   j

> > + * Configure the CMM unit with the CRTC-provided configuration.
>
> s/CRTC-provided/given/
>
> > + * Currently enabling, disabling and programming of the 1-D LUT unit is
> > + * supported.
> > + */
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	/*
> > +	 * As rcar_cmm_setup() is called by atomic commit tail helper, it might
> > +	 * be called when the CMM is disabled. As we can't program the hardware
> > +	 * in that case, store the configuration internally and apply it when
> > +	 * the CMM will be enabled by the CRTC through rcar_cmm_enable().
> > +	 */
> > +	if (!rcmm->enabled) {
> > +		if (!config->lut.enable)
> > +			return 0;
> > +
> > +		rcar_cmm_lut_extract(rcmm, config->lut.table);
> > +		rcmm->lut.enabled = true;
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Stop LUT operations if requested. */
> > +	if (!config->lut.enable) {
> > +		if (rcmm->lut.enabled) {
> > +			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +			rcmm->lut.enabled = false;
> > +		}
> > +
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * Enable LUT and program the new gamma table values.
> > +	 *
> > +	 * FIXME: In order to have stable operations it is required to first
> > +	 * enable the 1D-LUT and then program its table entries. This seems to
> > +	 * contradict what the chip manual reports, and will have to be
> > +	 * reconsidered when implementing support for double buffering.
> > +	 */
> > +	if (!rcmm->lut.enabled) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> > +		rcmm->lut.enabled = true;
> > +	}
> > +
> > +	rcar_cmm_lut_extract(rcmm, config->lut.table);
> > +	rcar_cmm_lut_write(rcmm);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> > +
> > +/*
> > + * rcar_cmm_enable() - Enable the CMM unit.
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Enable the CMM unit by enabling the parent clock and enabling the CMM
> > + * components, such as 1-D LUT, if requested.
> > + */
> > +int rcar_cmm_enable(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_sync(&pdev->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Apply the LUT table values saved at rcar_cmm_setup() time. */
> > +	if (rcmm->lut.enabled) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
> > +		rcar_cmm_lut_write(rcmm);
> > +	}
> > +
> > +	rcmm->enabled = true;
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
> > +
> > +	pm_runtime_put(&pdev->dev);
> > +
> > +	rcmm->lut.enabled = false;
> > +	rcmm->enabled = false;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> > +
> > +/*
> > + * rcar_cmm_init() - Make sure the CMM has probed.
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Return: 0 if the CMM has probed, -EPROBE_DEFER otherwise
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
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h
> b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > new file mode 100644
> > index 000000000000..15a2c874b6a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > @@ -0,0 +1,61 @@
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
> > + * @lut.table:	1D-LUT table entries. Might be set to NULL when the
> CMM has to
> > + *		be re-enabled but not re=programmed.
>
> So lut.table can be NULL ... See comment at rcar_cmm_lut_extract()
>
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
> > +	return 0;
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
> > +static int rcar_cmm_setup(struct platform_device *pdev,
> > +			  const struct rcar_cmm_config *config)
> > +{
> > +	return 0;
> > +}
> > +#endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
> > +
> > +#endif /* __RCAR_CMM_H__ */
> >
>

--zqsgyw66jwhjebpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl15+tQACgkQcjQGjxah
Vjzckg//c4EoqbMa+jfELQG/UMPYWDGCPbKs7EjJD7vDmcKyU5BDQuVlOPUbHckP
s+P+eGecgT7bH7Q2UFB+RtEQOvRJ/eLmL59vwfz4XTXrNxu7fsxOTMfMrWKk9h6o
9h+/gcAKEVLmW7UuRpZhEGve0X9Ce2bHIBw2BtU9P7bHPXGcj9tCkGKFIgXRs4Gz
fefQMrnk8BFCWu4mWpuOmcv7tV63E4XNh37Srr74vxMXxxIXTMx7k2epU33zWVy0
/ZiMNsVxSxi+LDorjsdRckmjKiHFGRZ3dl1JdhFyYwpcu/cM++M/L0J/ci5W3lXx
GaNEQKlhCQGN2BrBjkGNQTJiGVdJN8DFNtxR/xJaCtqVjMMp/R8OCfwgI33nGcI4
ofmiD5I6laqnnS3w/8x8A+cFi5ie51Z9Gc7/XwUcALVJnB/rEVQ0G4KaxqlGy7e5
lOtWiZg4pUhoFSCYOf5Mu8cJz1aLhYtnn5GxsK+fpAPDcslpl8zWZS4VI0IwfOe0
y6ll9yvBo2tmPe/2twAcTgh6Py0VgFYmuhjjMWSTRkiQqY3ooqljreiNkAXwP2YS
psdxF+FTgtShZMP0mXkar5/jM7EOfJgIxlRaIGloQsYhxx0dbGUKfeywlUti+/NQ
h4RNt/66bSVE3ktPKgOV/Q7alSflmxgQ83EBVtanQJXb7M7kWGU=
=uQHH
-----END PGP SIGNATURE-----

--zqsgyw66jwhjebpi--

--===============0703874395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0703874395==--
