Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834CD9945E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E216EB1C;
	Thu, 22 Aug 2019 13:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC526EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:00:24 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 68168FF813;
 Thu, 22 Aug 2019 13:00:18 +0000 (UTC)
Date: Thu, 22 Aug 2019 15:01:46 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 14/19] drm: rcar-du: Add support for CMM
Message-ID: <20190822130146.fhei4vixavwaq2mg@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-15-jacopo+renesas@jmondi.org>
 <20190820173444.GF10820@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190820173444.GF10820@pendragon.ideasonboard.com>
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, kieran.bingham+renesas@ideasonboard.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============0623727312=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0623727312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l27sl7i5xt2hbwga"
Content-Disposition: inline


--l27sl7i5xt2hbwga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks for review

On Tue, Aug 20, 2019 at 08:34:44PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Sat, Jul 06, 2019 at 04:07:41PM +0200, Jacopo Mondi wrote:
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
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c | 292 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 ++++
> >  4 files changed, 338 insertions(+)
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
> > index 000000000000..76ed3fce2b33
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> > @@ -0,0 +1,292 @@
> > +// SPDX-License-Identifier: GPL-2.0+
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
> > +#include <linux/pm.h>
> > +
> > +#include <drm/drm_atomic.h>
>
> The only thing you need from DRM is the drm_color_lut structure, so I
> would include drm/drm_mode.h instead.
>
> > +#include "rcar_cmm.h"
> > +
> > +#define CM2_LUT_CTRL		0x0000
> > +#define CM2_LUT_CTRL_EN		BIT(0)
>
> The datasheet names the bit LUT_EN, I would thus rename the macro to
> CM2_LUT_CTRL_LUT_EN.
>
> > +#define CM2_LUT_TBLA_BASE	0x0600
> > +#define CM2_LUT_TBLA(__i)	(CM2_LUT_TBLA_BASE + (__i) * 4)
>
> Similarly, the datasheet names the register CM2_LUT_TBL (and the LUT
> table B is named CM2_LUT_TBL2), would it make sense to stick to those
> names ?
>

Ack on all of these

> > +
> > +struct rcar_cmm {
> > +	struct clk *clk;
> > +	void __iomem *base;
> > +	bool enabled;
> > +
> > +	/*
> > +	 * restore: LUT restore flag
>
> I'm none the wiser after reading this comment :-)
>
> > +	 * running: LUT operating flag
> > +	 * size: Number of programmed entries in the LUT table
> > +	 * table: Scratch buffer where to store the LUT table entries to be
> > +	 *	  later restored.
>
> If you want to document individual fields I propose using kerneldoc
> syntax.
>
> 	* @lut.restore: ...
> 	...
>

Yeah, might be a bit of over-documentation here. I don't mind it to be
honest, but I'm fine if someone wants this to be dropped.

> > +	 */
> > +	struct {
> > +		bool restore;
> > +		bool running;
> > +		unsigned int size;
> > +		struct drm_color_lut table[CMM_GAMMA_LUT_SIZE];
> > +	} lut;
>
> I think the lut.running field name is a bit confusing, as you modify it
> based on the lut.enable field in the cmm config structure. I would name
> it lut.enabled. That could then possibly be confused with cmm.enabled
> (although in my opinion that's fine), if you're concerned by that I
> would rename that field to running. It would be more logical to consider
> the CMM as a whole as running or stopped, with the LUT (and later the
> CLU) enabled or disabled.
>

I'm a bit bothered that we would have
        rcmm.enabled
        rcmm.lut.enabled
        rcmm_config.lut.enable

I'll see how it looks. enabled is probably the right name for all of
these fields, but it might get confusing...

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
> > +static void rcar_cmm_lut_write(struct rcar_cmm *rcmm, unsigned int size,
>
> s/unsigned int/size_t/ ?
>
> > +			       struct drm_color_lut *lut)
>
> You can make this pointer const.
>

Ack

> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < size; ++i) {
> > +		struct drm_color_lut *entry = &lut[i];
> > +
> > +		u32 val = (entry->red & 0xff) << 16 |
> > +			  (entry->green & 0xff) << 8 |
> > +			  (entry->blue & 0xff);
> > +		rcar_cmm_write(rcmm, CM2_LUT_TBLA(i), val);
> > +	}
> > +}
> > +
> > +/**
> > + * rcar_cmm_setup() - configure the CMM unit
> > + *
> > + * @pdev: The platform device associated with the CMM instance
> > + * @config: The CRTC provided configuration.
> > + *
> > + * Configure the CMM unit with the CRTC provided configuration.
>
> s/CRTC provided/CRTC-provided/
>
> "CRTC-provided" is a compound adjective, qualifying the noun
> "configuration". It thus needs a hyphen. If you had written "The process
> uses the CRTC provided to this function", then no hyphen would be
> needed, as "provided" then qualifies the noun "CRTC", without the
> combination being used as an adjective.
>
> > + * Currently enabling, disabling and programming of the 1-D LUT unit is
> > + * supported.
> > + */
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +	unsigned int i;
> > +
> > +	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * As cmm_setup is called by atomic commit tail helper, it might be
>
> s/cmm_setup/rcar_cmm_setup()/ (or just "this function").
>
> > +	 * called before enabling the CRTC (which calls cmm_enable()).
>
> I would phrase this as "... it might be called when the CMM is disabled.
> We can't program the hardware in that case, store the configuration
> internally and apply it when the CMM will be enabled by the CRTC through
> by rcar_cmm_enable()." and remove the next comment.
>

Ack

> > +	 */
> > +	if (!rcmm->enabled) {
> > +		if (!config->lut.enable)
> > +			return 0;
> > +
> > +		/*
> > +		 * Store the LUT table entries in the scratch buffer to be later
> > +		 * programmed at enable time.
> > +		 */
> > +		for (i = 0; i < config->lut.size; ++i)
> > +			rcmm->lut.table[i] = config->lut.table[i];
>
> Can you do a memcpy() over the whole table ?
>
> 		memcpy(rcmm->lut.table, config->lut.table,
> 		       sizeof(*rcmm->lut.table) * config.lut.size);
>

Yeah, probably better

> > +
> > +		rcmm->lut.size = config->lut.size;
> > +		rcmm->lut.restore = true;
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Stop LUT operations, if requested. */
> > +	if (rcmm->lut.running && !config->lut.enable) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +		rcmm->lut.running = 0;
> > +		rcmm->lut.size = 0;
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* Enable LUT and program the new gamma table values. */
> > +	if (!rcmm->lut.running) {
>
> Should this be !rcmm->lut.running && config->lut.enable ? Or do you rely
> on the caller to not try to disable the LUT when it's not currently
> enabled ? If you rely on the caller than I think you should rely on it
> for the enabling case above too, and write is if (!config->lut.enabled).
> Otherwise I think you're mishandling the !running && !enable, it will
> end up enabling the LUT.
>

I think it's fine, as if (!rcmm->enable) then (!rcmm->lut.running) so
the (!running && !enable) you have pointed out gets caught by the very
first condition check here above (!rcmm->enabled).

I'll try to restructure this to be more readable and as you suggested
get rid of the restore field.

> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> > +		rcmm->lut.running = true;
> > +	}
> > +
> > +	rcar_cmm_lut_write(rcmm, config->lut.size, config->lut.table);
>
> I'm still very puzzled by the fact that you have to write the LUT
> contents after enabling the LUT. The datasheet states
>

I know -\_(;.;)_/- (is this the crying cthulhu emoticon ?)


> "Note that if the module that references that space is operating, read
> and write accesses to the relevant space are prohibited. In case of
> double buffer mode, referenced side of LUT is distinguished by
> CM2_CTL1.BFS."
>
> It looks to me like you may have to implement double-buffering, but even
> without that,

I think you have left out the end of the sentence, but I agree that
what the manual reports suggests the table should be programmed when
it is not operating, but it also mentions double buffering, so in case
we're using single buffer mode maybe this does not apply?

with double buffering this is going to change anyway, but so far,
that's the only reliable operation sequence I have found...

>
> > +	rcmm->lut.size = config->lut.size;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> > +
> > +/**
> > + * rcar_cmm_enable - enable the CMM unit
> > + *
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
> > +	if (!rcmm)
> > +		return -EPROBE_DEFER;
> > +
> > +	ret = clk_prepare_enable(rcmm->clk);
> > +	if (ret)
> > +		return ret;
> > +
>
> Didn't you say this version would use runtime PM ? :-)
>

Ups. I do for suspend/resume not for runtime_suspend/resume. It will
be trivial to add.

> > +	/* Apply the LUT table values saved at cmm_setup time. */
>
> rcar_cmm_setup() here too.
>
> > +	if (rcmm->lut.restore) {
> > +		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> > +		rcar_cmm_lut_write(rcmm, rcmm->lut.size, rcmm->lut.table);
> > +
> > +		rcmm->lut.restore = false;
> > +		rcmm->lut.running = true;
> > +	}
> > +
> > +	rcmm->enabled = true;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_enable);
> > +
> > +/**
> > + * rcar_cmm_disable() - disable the CMM unit
> > + *
> > + * Disable the CMM unit by stopping the parent clock.
> > + *
> > + * @pdev: The platform device associated with the CMM instance
>
> Parameters usually go before the description test.
>

Indeed, sorry about this.

> > + */
> > +void rcar_cmm_disable(struct platform_device *pdev)
> > +{
> > +	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
> > +
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +
> > +	clk_disable_unprepare(rcmm->clk);
> > +
> > +	rcmm->lut.restore = false;
> > +	rcmm->lut.running = false;
> > +	rcmm->lut.size = 0;
> > +
> > +	rcmm->enabled = false;
> > +}
> > +EXPORT_SYMBOL_GPL(rcar_cmm_disable);
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int rcar_cmm_pm_suspend(struct device *dev)
> > +{
> > +	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
> > +	unsigned int i;
> > +
> > +	if (!(rcmm->lut.running || rcmm->lut.restore))
>
> Do you need the second part of this condition ? If a cached copy of the
> LUT data has been stored but not applied yet because the CMM is
> disabled, why would you need to overwrite that cached copy with values
> from the hardware ?

You are right, the second part of the condition is not needed (if not
wrong).

>
> I think you should have a first check on rcmm->enabled :
>
> 	if (!rcmm->enabled)
> 		return 0;
>
> as in that case you can't access the hardware. Then, you can save the
> LUT content only if it's running :
>
> 	if (rcmm->lut.running) {
> 		/* Save the content */
> 		...
> 		rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> 	}
>
> I wouldn't clear rcmm->lut.running here, as from a software point of
> view I think we still want to record that it's enabled. There's also no
> need to touch the restore flag, see below.
>
> > +		return 0;
> > +
> > +	/* Save the LUT table entries in the scratch buffer table. */
>
> Should we call this a cache instead of a scratch buffer ?
>
> > +	for (i = 0; i < rcmm->lut.size; ++i) {
> > +		int entry = rcar_cmm_read(rcmm, CM2_LUT_TBLA(i));
> > +		struct drm_color_lut *lut = &rcmm->lut.table[i];
> > +
> > +		lut->blue = entry & 0xff;
> > +		lut->green = (entry >> 8) & 0xff;
> > +		lut->red = (entry >> 16) & 0xff;
> > +	}
> > +
> > +	rcmm->lut.restore = true;
> > +	rcmm->lut.running = false;
> > +
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rcar_cmm_pm_resume(struct device *dev)
> > +{
> > +	struct rcar_cmm *rcmm = dev_get_drvdata(dev);
> > +
> > +	if (!rcmm->lut.restore)
> > +		return 0;
> > +
> > +	/* Program the LUT entries saved at suspend time. */
> > +	rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> > +	rcar_cmm_lut_write(rcmm, rcmm->lut.size, rcmm->lut.table);
> > +	rcmm->lut.running = true;
> > +	rcmm->lut.restore = false;
>
> To be kept in sync with the modifications proposed above,
>
>
> 	if (!rcmm->enabled)
> 		return 0;
>
> 	if (rcmm->lut.running) {
> 		/* Program the LUT entries saved at suspend time. */
> 		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
> 		rcar_cmm_lut_write(rcmm, rcmm->lut.size, rcmm->lut.table);
> 	}
>
> I think you can remove the restore field completely, as it's the only
> used in rcar_cmm_enable(), and there you can check rcmm->lut.running
> instead if you set rcmm->lut.running to true in rcar_cmm_setup() when
> the CMM is disabled and the config requests the LUT to be enabled. The
> overall logic should become simpler, with less corner cases.
>

Thanks, very good suggestion, I probably don't need any restore flag
at all. I'll see how it looks like, thanks.

> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops rcar_cmm_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(rcar_cmm_pm_suspend, rcar_cmm_pm_resume)
> > +};
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
> I still think you can use devm_ioremap_resource(). I agree it doesn't
> explicitly request an uncached mapping, but I think the magic happens
> behind the scene with the IO accessors to ensure it will work fine.
>

Probably, but does using the _nocache version hurt somehow ?


> > +
> > +	rcmm->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(rcmm->clk)) {
> > +		dev_err(&pdev->dev, "Failed to get CMM clock");
> > +		return PTR_ERR(rcmm->clk);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id rcar_cmm_of_table[] = {
> > +	{ .compatible = "renesas,rcar-gen3-cmm", },
> > +	{ .compatible = "renesas,rcar-gen2-cmm", },
> > +	{ },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
> > +
> > +static struct platform_driver rcar_cmm_platform_driver = {
> > +	.probe		= rcar_cmm_probe,
> > +	.driver		= {
> > +		.name	= "rcar-cmm",
> > +		.pm	= &rcar_cmm_pm_ops,
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
> > index 000000000000..8744e72f32cd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> > @@ -0,0 +1,38 @@
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
> > +#define CMM_GAMMA_LUT_SIZE		256
> > +
> > +struct platform_device;
> > +struct drm_color_lut;
>
> Could you please sort the forward declarations alphabetically ?
>
> > +
> > +/**
> > + * struct rcar_cmm_config - CMM configuration
> > + *
> > + * @lut:	1D-LUT configuration
> > + * @lut.enable:	1D-LUT enable flag
> > + * @lut.table:	1D-LUT table entries.
>
> s/\.$//
>
> > + * @lut.size	1D-LUT number of entries. Max is 256.
>
> "Number of 1D-LUT entries (max 256)"
>

And missing : after @lut.size

Thanks for review
   j

> > + */
> > +struct rcar_cmm_config {
> > +	struct {
> > +		bool enable;
> > +		struct drm_color_lut *table;
> > +		unsigned int size;
> > +	} lut;
> > +};
> > +
> > +int rcar_cmm_enable(struct platform_device *pdev);
> > +void rcar_cmm_disable(struct platform_device *pdev);
> > +
> > +int rcar_cmm_setup(struct platform_device *pdev,
> > +		   const struct rcar_cmm_config *config);
> > +
> > +#endif /* __RCAR_CMM_H__ */
>
> --
> Regards,
>
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--l27sl7i5xt2hbwga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1ekjoACgkQcjQGjxah
VjwQYg/+IgnCvqDMO4UbvOzSFontiSjKqnxYu+RndzRIZRtVy07Kc8cBIs3743I+
QAPzOzWxGqdcdMvbl1KqGl1hxmJNDNTI/ez6kmdrkEBFY8U7qFJwKqAG/lZHKubP
q4hNpFBJrdfhPpHMjaskYNek9Ge1pfiArY2LstxotvKhKHSpNxcESKZnssO4Q+dV
funHycyXB88Q0mJBUqeZeMJFKHHgHqUXQlLlQk5Hw81x1nNZHJ9VFdPZdoOOWx3G
GCBsGiHNQIgrENh3sE+q85vfP2tSiD3gHYi2lmB1FKJ2QoTIGRJbEsu09Yq+UIgf
qpA7csvUvB7cMqrp0NN89ATjAugOeRTQCAOD4gY1GuJrRPkXBRj0z8pXmzO9JPDM
Wy+eoUIoyzoHzuNmGcf5OIHbtxQmG9tb2x71cMr3fcV94dvtbv4VgEniEKL6dqk8
pjRywzV+DsVL/WOwMQYfJORUsta3gf78mqOvGwrfkHH3DzHPVC8opOGfVzVI6EEN
ka7KbfWTIawkLWoVvk7ptHjwAV6vpp0tM7eq40r0GU6ski1JgjJ2MYmUCrv+kHG2
akHJUXiMJGgxYXVf6UrvgxGH750MOgm+DkzdJO1MnRehEEslMvtwZIWpnB/Fujsi
vIXPa+4pG1Q5f+GQdxvnZOaAiYmLHu+CjgBMB7A/jSWayXaOwGs=
=5gN0
-----END PGP SIGNATURE-----

--l27sl7i5xt2hbwga--

--===============0623727312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0623727312==--
