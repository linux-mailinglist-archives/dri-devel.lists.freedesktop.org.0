Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2E18238C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 21:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C216EA07;
	Wed, 11 Mar 2020 20:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547F6E50C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 20:52:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1F485F;
 Wed, 11 Mar 2020 21:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583959940;
 bh=kTaX6VMIUAOnenWOcSe+Kmbg6Iv6BtKNrjiYY/XbExM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTMqFz+K/S8C7GqkCeXAjep4ngma5f/uX804ehKV96todjPyeIa6+AnfOo95+s8eU
 SYovWNEuhGChkg62OzdDAUuHah1w4eeXsoftXRkjbj9ZDLRnzs3gO+l/Qb/HCvdkei
 i5sGx05SLAuH6q0AosNO9M2ypOOaGF5UtAyx98C4=
Date: Wed, 11 Mar 2020 22:52:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v6 3/3] drm: bridge: cdns-mhdp: add j721e wrapper
Message-ID: <20200311205217.GD4863@pendragon.ideasonboard.com>
References: <1582712579-28504-1-git-send-email-yamonkar@cadence.com>
 <1582712579-28504-4-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582712579-28504-4-git-send-email-yamonkar@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 praneeth@ti.com, narmstrong@baylibre.com, airlied@linux.ie,
 tomi.valkeinen@ti.com, jonas@kwiboo.se, jsarha@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, maxime@cerno.tech,
 sjakhade@cadence.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuti,

Thank you for the patch.

On Wed, Feb 26, 2020 at 11:22:59AM +0100, Yuti Amonkar wrote:
> Add j721e wrapper for mhdp, which sets up the clock and data muxes.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           | 12 ++++
>  drivers/gpu/drm/bridge/Makefile          |  4 ++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 14 +++++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 79 ++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 55 +++++++++++++++++
>  6 files changed, 165 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 3bfabb76f2bb..ba945071bb0b 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -38,6 +38,18 @@ config DRM_CDNS_MHDP
>  	  It takes a DPI stream as input and output it encoded
>  	  in DP format.
>  
> +if DRM_CDNS_MHDP
> +
> +config DRM_CDNS_MHDP_J721E
> +	bool "J721E Cadence DPI/DP wrapper support"
> +	default y

Should this be automatically selected when support for the J721E
platform is enabled, instead of being user-selectable ?

> +	help
> +	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
> +	  which adds support for J721E related platform ops. It
> +	  initializes the J721e Display Port and sets up the
> +	  clock and data muxes.
> +endif
> +
>  config DRM_DUMB_VGA_DAC
>  	tristate "Dumb VGA DAC Bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 2e2c5be7c714..fa575ad57b95 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -19,5 +19,9 @@ obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
>  obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
>  cdns-mhdp-objs := cdns-mhdp-core.o
>  
> +ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
> +	cdns-mhdp-objs += cdns-mhdp-j721e.o
> +endif
> +
>  obj-y += analogix/
>  obj-y += synopsys/
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> index cc642893baa8..8d07ffe2d791 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> @@ -36,8 +36,22 @@
>  
>  #include "cdns-mhdp-core.h"
>  

You can drop the blank line here.

> +#include "cdns-mhdp-j721e.h"
> +
> +#ifdef CONFIG_DRM_CDNS_MHDP_J721E
> +static const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
> +	.init = cdns_mhdp_j721e_init,
> +	.exit = cdns_mhdp_j721e_fini,
> +	.enable = cdns_mhdp_j721e_enable,
> +	.disable = cdns_mhdp_j721e_disable,
> +};
> +#endif
> +

How about moving this structure to cdns-mhdp-j721e.c instead of exposing
the four functions ?

>  static const struct of_device_id mhdp_ids[] = {
>  	{ .compatible = "cdns,mhdp8546", },
> +#ifdef CONFIG_DRM_CDNS_MHDP_J721E
> +	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
> +#endif
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mhdp_ids);
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> index f8df54917816..0878a6e3fd31 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> @@ -335,6 +335,7 @@ struct mhdp_platform_ops {
>  
>  struct cdns_mhdp_device {
>  	void __iomem *regs;
> +	void __iomem *j721e_regs;
>  
>  	struct device *dev;
>  	struct clk *clk;
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> new file mode 100644
> index 000000000000..a87faf55c065
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

You can drop this paragraph, it's implied by the SPDX header.

> + */
> +
> +#include <linux/device.h>

This should be linux/platform_device.h

> +#include <linux/io.h>
> +
> +#include "cdns-mhdp-j721e.h"
> +
> +#define	REVISION			0x00
> +#define	DPTX_IPCFG			0x04
> +#define	ECC_MEM_CFG			0x08
> +#define	DPTX_DSC_CFG			0x0c
> +#define	DPTX_SRC_CFG			0x10
> +#define	DPTX_VIF_SECURE_MODE_CFG	0x14
> +#define	DPTX_VIF_CONN_STATUS		0x18
> +#define	PHY_CLK_STATUS			0x1c
> +
> +#define DPTX_SRC_AIF_EN			BIT(16)
> +#define DPTX_SRC_VIF_3_IN30B		BIT(11)
> +#define DPTX_SRC_VIF_2_IN30B		BIT(10)
> +#define DPTX_SRC_VIF_1_IN30B		BIT(9)
> +#define DPTX_SRC_VIF_0_IN30B		BIT(8)
> +#define DPTX_SRC_VIF_3_SEL_DPI5		BIT(7)
> +#define DPTX_SRC_VIF_3_SEL_DPI3		0
> +#define DPTX_SRC_VIF_2_SEL_DPI4		BIT(6)
> +#define DPTX_SRC_VIF_2_SEL_DPI2		0
> +#define DPTX_SRC_VIF_1_SEL_DPI3		BIT(5)
> +#define DPTX_SRC_VIF_1_SEL_DPI1		0
> +#define DPTX_SRC_VIF_0_SEL_DPI2		BIT(4)
> +#define DPTX_SRC_VIF_0_SEL_DPI0		0
> +#define DPTX_SRC_VIF_3_EN		BIT(3)
> +#define DPTX_SRC_VIF_2_EN		BIT(2)
> +#define DPTX_SRC_VIF_1_EN		BIT(1)
> +#define DPTX_SRC_VIF_0_EN		BIT(0)
> +
> +/* TODO turn DPTX_IPCFG fw_mem_clk_en at pm_runtime_suspend. */
> +
> +int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
> +{
> +	struct platform_device *pdev = to_platform_device(mhdp->dev);
> +	struct resource *regs;
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	mhdp->j721e_regs = devm_ioremap_resource(&pdev->dev, regs);

You can use

	mhdp->j721e_regs = devm_platform_ioremap_resource(&pdev->dev, 1);

> +	if (IS_ERR(mhdp->j721e_regs))
> +		return PTR_ERR(mhdp->j721e_regs);
> +
> +	return 0;
> +}
> +
> +void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp)
> +{
> +}
> +

To avoid the need for empty functions, how about a NULL check in the
caller ?

> +void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
> +{
> +	/*
> +	 * Eneble VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected
> +	 * to eDP DPI2. This is the only supported SST configuration on
> +	 * J721E.

Without hardware documentation I can't really comment on this, but I'd
like to make sure it doesn't imply that the MHDP has more than one input
and one output.

> +	 */
> +	writel(DPTX_SRC_VIF_0_EN | DPTX_SRC_VIF_0_SEL_DPI2,
> +	       mhdp->j721e_regs + DPTX_SRC_CFG);
> +}
> +
> +void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp)
> +{
> +	/* Put everything to defaults  */
> +	writel(0, mhdp->j721e_regs + DPTX_DSC_CFG);
> +}
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> new file mode 100644
> index 000000000000..c7f9e8bc9391
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

You can drop this paragraph too.

> + */
> +
> +#ifndef CDNS_MHDP_J721E_H
> +#define CDNS_MHDP_J721E_H
> +
> +#include <linux/platform_device.h>
> +#include "cdns-mhdp-core.h"
> +
> +struct cdns_mhdp_j721e_wrap;

This is unused.

> +
> +#ifdef CONFIG_DRM_CDNS_MHDP_J721E
> +
> +int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp);
> +
> +void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp);
> +
> +void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp);
> +
> +void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp);
> +
> +#else
> +
> +static inline
> +int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
> +{
> +	return 0;
> +}
> +
> +static inline
> +void cdns_mhdp_j721e_fini(struct cdns_mhdp_device *mhdp)
> +{
> +}
> +
> +static inline
> +void cdns_mhdp_j721e_sst_enable(struct cdns_mhdp_device *mhdp)
> +{
> +}
> +
> +static inline
> +void cdns_mhdp_j721e_sst_disable(struct cdns_mhdp_device *mhdp)
> +{
> +}
> +#endif /* CONFIG_DRM_CDNS_MHDP_J721E */

No need for the CONFIG_DRM_CDNS_MHDP_J721E check, there's already one in
cdns-mhdp-core.c. If you follow my above suggestion, the above should
just become

struct mhdp_platform_ops;

extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;

Lots of small comments but nothing blocking. After addressing them,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +#endif /* !CDNS_MHDP_J721E_H */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
