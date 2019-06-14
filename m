Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A3457FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 10:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CE88933E;
	Fri, 14 Jun 2019 08:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4F48933E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:53:26 +0000 (UTC)
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F3D8AC0013;
 Fri, 14 Jun 2019 08:53:17 +0000 (UTC)
Date: Fri, 14 Jun 2019 10:54:31 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 14/20] drm: rcar-du: Add support for CMM
Message-ID: <20190614085431.sbv2ivxouy4dsdse@uno.localdomain>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-15-jacopo+renesas@jmondi.org>
 <20190607113540.GB7593@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190607113540.GB7593@pendragon.ideasonboard.com>
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
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1197125817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1197125817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ci2n4ye4j6wx6vv4"
Content-Disposition: inline


--ci2n4ye4j6wx6vv4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks for the review

On Fri, Jun 07, 2019 at 02:35:40PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Jun 06, 2019 at 04:22:14PM +0200, Jacopo Mondi wrote:
> > Add a driver for the R-Car Display Unit Color Correction Module.
> >
> > Each DU output channel is provided with a CMM unit to perform image
> > enhancement and color correction.
>
> I would say "On most Gen3 SoCs, each DU ..." as V3* SoCs have no CMM.
>
> >
> > Add support for CMM through a driver that supports configuration of
> > the 1-dimensional LUT table. More advanced CMM feature could be
> > implemented on top of this basic one.
>
> s/could be/will be/ ? :-)
>

Hopefully :)

> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig    |   7 +
> >  drivers/gpu/drm/rcar-du/Makefile   |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 197 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 ++++++
> >  4 files changed, 243 insertions(+)
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
> > index 000000000000..5d9d917b91f4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > @@ -0,0 +1,197 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * rcar_cmm.c -- R-Car Display Unit Color Management Module
> > + *
> > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +
> > +#include "rcar_cmm.h"
> > +
> > +#define CM2_LUT_CTRL		0x00
>
> I would write all register addresses with 3 (or 4) digits.
>
> > +#define CM2_LUT_CTRL_EN		BIT(0)
> > +#define CM2_LUT_TBLA		0x600
>
> I would define this as
>
> #define CM2_LUT_TBLA(n)		(0x600 + (n) * 4)
>

Ack to both

> > +
> > +struct rcar_cmm {
> > +	struct clk *clk;
> > +	void __iomem *base;
> > +	bool enabled;
> > +
> > +	/* LUT table scratch buffer. */
> > +	struct {
> > +		bool restore;
> > +		unsigned int size;
> > +		uint32_t table[CMM_GAMMA_LUT_SIZE];
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
> > +int rcar_cmm_setup(struct platform_device *pdev, struct rcar_cmm_config *config)
>
> Please document the functions exposed to the DU driver. It's hard to
> understand the setup vs. enable/disable split by just reading this
> driver.
>

Ack. Document it in the header or here in the implementation?

> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +	unsigned int i;
> > +
> > +	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * As cmm_setup is called by atomic commit tail helper, it might be
> > +	 * called before the enabling the CRTC (which calls cmm_enable()).
> > +	 *
> > +	 * Store the LUT table entries in the scratch buffer to be later
> > +	 * programmed at enable time.
> > +	 */
> > +	if (!rcmm->enabled) {
> > +		if (!config->lut.enable)
> > +			return 0;
> > +
> > +		for (i = 0; i < config->lut.size; ++i) {
> > +			struct drm_color_lut *lut = &config->lut.table[i];
> > +
> > +			rcmm->lut.table[i] = (lut->red & 0xff) << 16 |
> > +					     (lut->green & 0xff) << 8 |
> > +					     (lut->blue & 0xff);
> > +		}
> > +
> > +		rcmm->lut.restore = true;
> > +		rcmm->lut.size = config->lut.size;
> > +
> > +		return 0;
> > +	}
> > +
> > +	if (rcar_cmm_read(rcmm, CM2_LUT_CTRL) & CM2_LUT_CTRL_EN &&
> > +	    !config->lut.enable) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +		return 0;
> > +	}
> > +
> > +	/* Enable LUT and program the new gamma table values. */
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
>
> Shouldn't you write the LUT contents before enabling it (same below) ?
>

Surprisingly, no. I lost quite some time trying to fix a bug that was
due to the fact I wrote the table content first, then enabled the CMM.

But, in facts, section 35A.3.2, which lists the CMM activation steps,
prescribes to enable the CMM first, then update the LUT table entries.

> > +	for (i = 0; i < config->lut.size; ++i) {
> > +		struct drm_color_lut *lut = &config->lut.table[i];
> > +		u32 val = (lut->red & 0xff) << 16 | (lut->green & 0xff) << 8 |
> > +			  (lut->blue & 0xff);
>
> Do you need to recompute the value, can't you use rcmm->lut.table ?
>

rcmm->lut.table stores the already computed table entries to be later
restored at 'enable()' time. Here I'm writing the values to the HW
directly, so I don't need to cache them in rcmm->lut.table first.

> > +
> > +		rcar_cmm_write(rcmm, CM2_LUT_TBLA + i * 4, val);
> > +	}
> > +
> > +	return 0;
> > +}
>
> You need to export this and the next two functions.
>

Ah! Correct, I wonder however if it makes any difference, as the CMM
and the DU will always be compiled together.

> > +
> > +int rcar_cmm_enable(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	if (rcmm->enabled)
> > +		return 0;
>
> Can this happen without a bug in the caller ? If it can, and assuming
> the caller balances the enable and disable calls, you will have
> unbalanced clk_prepare_enable() and clk_disable_unprepare() calls.
>

It shouldn't, but if I check here, I should check below as well.

> > +
> > +	ret = clk_prepare_enable(rcmm->clk);
> > +	if (ret)
> > +		return ret;
>
> Could you use pm_runtime_get_sync() instead ?
>

I'll move to use pm_runtime in next version

> > +
> > +	/* Apply the LUT table values saved at cmm_setup time. */
> > +	if (rcmm->lut.restore) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> > +		for (i = 0; i < rcmm->lut.size; ++i)
> > +			rcar_cmm_write(rcmm, CM2_LUT_TBLA + i * 4,
> > +				       rcmm->lut.table[i]);
> > +
> > +		rcmm->lut.restore = false;
> > +		rcmm->lut.size = 0;
> > +	}
> > +
> > +	rcmm->enabled = true;
> > +
> > +	return 0;
> > +}
> > +
> > +void rcar_cmm_disable(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +
> > +	clk_disable_unprepare(rcmm->clk);
> > +
> > +	rcmm->lut.restore = false;
> > +	rcmm->lut.size = 0;
> > +	rcmm->enabled = false;
> > +}
> > +
> > +static int rcar_cmm_probe(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm;
> > +	struct resource *res;
> > +	resource_size_t size;
> > +
> > +	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
> > +	if (!rcmm)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, rcmm);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	size = resource_size(res);
> > +	if (!devm_request_mem_region(&pdev->dev, res->start, size,
> > +				     dev_name(&pdev->dev))) {
> > +		dev_err(&pdev->dev,
> > +			"can't request region for resource %pR\n", res);
> > +		return -EBUSY;
> > +	}
> > +
> > +	rcmm->base = devm_ioremap_nocache(&pdev->dev, res->start, size);
> > +	if (IS_ERR(rcmm->base))
> > +		return PTR_ERR(rcmm->base);
>
> Anything wrong with devm_ioremap_resource() ?
>

The manual prescribes to map the CMM register address space to a
non-cachable memory region (probably due to histograms tables,
which the CMM generates?). I admit I have been 'inspired' by the BSP
code, which maps the memory resources using dev_ioremap_nocache() (but
doesn't request_mem_region() first...)

> > +
> > +	rcmm->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(rcmm->clk)) {
> > +		dev_err(&pdev->dev, "Failed to get CMM clock");
> > +		return PTR_ERR(rcmm->clk);
> > +	}
> > +
> > +	rcmm->lut.restore = false;
> > +	rcmm->lut.size = 0;
> > +	rcmm->enabled = false;
>
> As you allocate memory with kzalloc() you could skip this.
>

Yes, I should, even if I like explict initialization of driver global
flags.

> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rcar_cmm_of_table[] = {
> > +	{ .compatible = "renesas,cmm-gen3" },
> > +	{ .compatible = "renesas,cmm-gen2" },
> > +	{ },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> > +
> > +static struct platform_driver rcar_cmm_platform_driver = {
> > +	.probe		= rcar_cmm_probe,
> > +	.driver		= {
> > +		.name	= "rcar-cmm",
> > +		.of_match_table = rcar_cmm_of_table,
> > +	},
>
> No need for suspend/resume support ? The DU driver should disable/enable
> the CMM in its suspend/resume paths, so this should be fine, but won't
> the LUT contents be lost and need to be restored ?
>

I should test this, you're right. In case, I'll cache the LUT content
at suspend, and verify if I need to restore it or not.

> > +};
> > +
> > +module_platform_driver(rcar_cmm_platform_driver);
> > +
> > +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
>
> Missing >.
>
> > +MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > new file mode 100644
> > index 000000000000..da61a145dc5c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > @@ -0,0 +1,38 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
>
> The .c and .h file licenses don't match.
>

Ah ups, that'a typo, but as the DU is licensed with GPL-2.0+ I should
probably change the SPDX header in the .c file.

> > +/*
> > + * rcar_cmm.h -- R-Car Display Unit Color Management Module
> > + *
> > + * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
> > + */
> > +
> > +#ifndef __RCAR_CMM_H__
> > +#define __RCAR_CMM_H__
> > +
> > +#include <linux/platform_device.h>
>
> You can forward-declare struct platform_device instead.
>
> > +
> > +#define CMM_GAMMA_LUT_SIZE		256
> > +
> > +struct drm_color_lut;
> > +
> > +/**
> > + * struct rcar_cmm_config - CMM configuration
> > + *
> > + * @lut:	1D-LUT configuration
> > + * @lut.enable:	1D-LUT enable flag
> > + * @lut.table:	1D-LUT table entries.
> > + * @lut.size	1D-LUT number of entries. Max is 256
>
> The last line is missing a colon.
>
> > + */
> > +struct rcar_cmm_config {
> > +	struct {
> > +		bool enable;
> > +		struct drm_color_lut *table;
> > +		unsigned int size;
> > +	} lut;
> > +};
> > +
> > +int rcar_cmm_enable(struct platform_device *);
>
> As the OF API looks up a struct device from a device_node, should we use
> struct device here ?

of_find_device_by_node() returns a "struct platform_device *".. I
could easily get to the struct device if you think it's better. I have
no strong preferences...

>
> > +void rcar_cmm_disable(struct platform_device *);
>
> I find headers more readable when function arguments are named. In this
> case the types probably provide enough information, but good luck trying
> to read a function such as
>
> int foo(int, int, bool);
>
> > +
> > +int rcar_cmm_setup(struct platform_device *, struct rcar_cmm_config *);
>
> Can the second argument be const ?
>
It probably could right now. Not sure if this will hold when we'll
have to read histograms from the CMM, if they ever will go through
this structure.

Thanks
   j

> > +
> > +#endif /* __RCAR_CMM_H__ */
>
> --
> Regards,
>
> Laurent Pinchart

--ci2n4ye4j6wx6vv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DYMcACgkQcjQGjxah
Vjz4gA/8CPodJz1nU/pHSLRehN8kw/Ff9xyp6vv7qeIq/ZeJ4IfO3mt/OJDLyn4+
wkkTovCR5q3Lp5r+jmZdI9HNcDGyMe4UnP3U+vIeHfiB1MBCrU7ZFiCMr2D6p293
6ylXnzuKLq8BIpoIDLQ4Vg7YUc49CehlG4BaNTxrUyA9vvMKBHZ2raVahd/Jr4IF
c968vRc1CI4b7gDQhhFzIzvQ2VHDLy/QF6EWlAuM5FT9mrYheTD1ZIjPpMVtt+35
jJuCSo4SHAyv73Mz9vuA2bTQmKAeGVCK09+s42iaimb48E6EN/wig105BAP5DWMg
h7vx6IxBvMgcBxEpr+uzNqybUptY+AJ7COat9qg8oO+DGMd4gz0kNXCmu7Gs23jt
vhAXgb5/o68NJbv5ylr2dN6KH7SCd6e4+kp1I9DZZAON0nsA98Ont4s4KNDGTltZ
WLzgeK8bzBPE85expEXQ4h5nIOv9akFfFdU3vYcE0/9rR34CTv8LID2AwKxwbuRM
6eHnwzBaGzcSyBfqo09UfgHsdRStcAkCdEdu7mfFbeNnzVljfickIXba8g3Zh1Wt
uKBXz5Whb+LhbkhbrShC2fV5ZRdBOLSxmixc7XCGzxJVryoSPR8lCbn6b211ADIO
1KZsJqWqW/pWTAkLVTUJy+/oMrh+KckDJl3D13U5C+HtUcvc/Is=
=ipqo
-----END PGP SIGNATURE-----

--ci2n4ye4j6wx6vv4--

--===============1197125817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1197125817==--
