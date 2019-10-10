Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E2D2FBD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 19:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989AC6E394;
	Thu, 10 Oct 2019 17:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BA86E394
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 17:44:53 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 47D1424000B;
 Thu, 10 Oct 2019 17:44:47 +0000 (UTC)
Date: Thu, 10 Oct 2019 19:46:28 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 3/9] drm: rcar-du: Add support for CMM
Message-ID: <20191010174628.ta7qp75quo65jjdc@uno.localdomain>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-4-jacopo+renesas@jmondi.org>
 <20190918225534.GA11474@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190918225534.GA11474@pendragon.ideasonboard.com>
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
Cc: muroya@ksk.co.jp, horms@verge.net.au, VenkataRajesh.Kalakodima@in.bosch.com,
 airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, seanpaul@chromium.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 ezequiel@collabora.com
Content-Type: multipart/mixed; boundary="===============0934635577=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0934635577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dphniac3abst4qpd"
Content-Disposition: inline


--dphniac3abst4qpd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Sep 19, 2019 at 01:55:35AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Sep 06, 2019 at 03:54:30PM +0200, Jacopo Mondi wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> >
> > In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> > to perform image enhancement and color correction.
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM feature will be
> > implemented on top of this basic one.
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
> > +static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
> > +{
> > +	iowrite32(data, rcmm->base + reg);
> > +}
> > +
> > +/*
> > + * rcar_cmm_lut_extract() - Scale down to hardware precision the DRM LUT table
> > + *			    entries and store them.
>
> "Scale the DRM LUT table entries to hardware precision and store them."
>
> > + * @rcmm: Pointer to the CMM device
> > + * @drm_lut: Pointer to the DRM LUT table
> > + */
> > +static void rcar_cmm_lut_extract(struct rcar_cmm *rcmm,
> > +				 const struct drm_color_lut *drm_lut)
> > +{
> > +	unsigned int i;
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
> > + * rcar_cmm_lut_write() - Write to hardware the LUT table entries from the
> > + *			  local table.
>
> "Write the LUT table entries from the local table to the hardware."
>
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
> > + *
> > + * Configure the CMM unit with the CRTC-provided configuration.
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
>
> I would document this as "Intialize the CMM" to match the function name.
> We may add more initialization in the future.
>
> > + * @pdev: The platform device associated with the CMM instance
> > + *
> > + * Return: 0 if the CMM has probed, -EPROBE_DEFER otherwise
>
> 0 on success, -EPROBE_DEFER is the CMM isn't availablet yet
>

Just to note I've take Kieran's suggestion in to return -ENODEV when
the CMM config option is not set.

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
> > + * @lut.table:	1D-LUT table entries. Might be set to NULL when the CMM has to
> > + *		be re-enabled but not re=programmed.
>
> s/re=programmed/re-programmed/
>
> As discussed offline this can't really happen as far as I can tell.
> However, it will still be useful when we'll add CLU support, as then a
> CLU reprogramming without a LUT reprogramming could happen.

How are we going to program CLU ? Using which DRM property ?
I had a look at 'ctm', but it does not seems to apply, as it only
provides 9 64bits entries (why 9??)
https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_mode.h#L623

The CLU is programmed with pairs of 32bits entries, assembled using
8 bit data/addresses for each color components. Considering the LUT
entries have 16 bits per color components, we could re-use those, but
seems a bit of an abuse to me. Is there somethig more trivial I am
missing ?

Anyway, for now I think you are right, and if the 'crtc->state->gamma_lut'
field is set, then the table (provided it's of the right size) cannot be
NULL.

Disabling the CMM with:
			req.add(crtc, {
					{ "GAMMA_LUT", 0 },
			});

results in 'crtc->state->gamma_lut' being not set, and this is already
handled by setting to false the rcar_cmm_config.lut.enable flag in
rcar_du_atomic_commit_update_cmm() so I would rather drop the table ==
NULL case from documentation and re-think about it once we handle CLU.

>
> I think we should make the documentation a bit clearer:
>
> "1D-LUT table entries. Only valid when lut.enable is true, shall be NULL
> otherwise. When non-NULL, the LUT table will be programmed with the new
> values. Otherwise the LUT table will retain its previously programmed
> values."
>
> This being said, the code in rcar_cmm_setup() will crash if table is
> NULL. I would either drop the option of table being NULL (and thus
> update the documentation here) if you don't need this yet in the DU
> driver, or fix rcar_cmm_setup(). You've posted enough versions of this
> series in my opinion, so please pick the easiest option, and we'll
> rework the code when adding CLU support anyway.

Unfortunately I would love to take your tag in and being done with
this, but considering Sean's advices on Ezequiel's series, I think
I'll now need to move CMM handling to crtc's begin/enable as well, so
another review round will likely be required.

>
> With those small issues fixes,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
>
> --
> Regards,
>
> Laurent Pinchart

--dphniac3abst4qpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2fbnQACgkQcjQGjxah
VjzAeRAAq/ZejEJ3Zy6zJA4vwU+ZVv/qowQAgrkHJk8+ySSiDZXsO8coGQ6OWX2W
pqJQsFWBWy7FsvjsjfMxaeWA1y3nsupLV62MlwjULTt+bD7hF3oVaJIGN2qEPv+N
tsFTty+e0BiuukjkOOI2Ik8CiY80QP1oaXPhcG6XNMyfyAfeJ/aIBPs3KNopzFyX
z7RIHe24oddQJ3KYY/vt56GVcHBcdVfMnhE+RXfWPcXgQqPHhjKgB1mkjPhvpyBL
qAu3WVmj0zAURIPzbRROpfise1CsLPC0yKHqh0n7bSAt23+fQ1LQ3FHZ4/I1mxSP
9RAFPrI9mQeavIpPDCO7d4Z2jQvAU7PRHUM921LPS3CXWACgYz2oYsD/iaXIgbGG
QwdXX3kzr4EK27Zx5XVGMhD2fkeUGFcOQ/vUZEwUF7M1Nu7ivBSePuAEBuKNYsan
cQqE7Zxclb6Q6yQWs/wPBDPSYe9c+rxmq7bniStodg61GwGZcgPT3cdeEd4yR9al
4w+qrinod9IX6RQdOdcGz7f84F/prZ6WY4kuTNSbcUijgETwbr1e3QACWD0QyqGG
PBAjW9cjzV0YkdkgPHmPBHSCEvnZqsmQphVRrbjchqyEmp+/QurcwykNDDWnH0AV
KRYPkSLXGUh0s8ytZ5iNysuiIIuC3ticw+lTz6PhgRBJKPo1B0A=
=ji9x
-----END PGP SIGNATURE-----

--dphniac3abst4qpd--

--===============0934635577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0934635577==--
