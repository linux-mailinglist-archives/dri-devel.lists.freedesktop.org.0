Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10526241506
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 04:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041BD6E096;
	Tue, 11 Aug 2020 02:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25886E096
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 02:41:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF77358;
 Tue, 11 Aug 2020 04:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597113709;
 bh=IP3vvfZRAj5uZH057vJvXmMQLsLN1/Y6gQCRiqmJQYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9VoCGk2vi/0jLsh7/9dZlpSVzS9CBQmnmfh6JqHRy/UfNGssyd69kj20ArJb3UoA
 68INVB8BA/qM6c6gAAdJ7SnWv3gVhFtQmzh2SuP1uH90eFGTFJgIHfMDfqkorvhSCH
 b71r4wgT1LNg7zlpm9CEJnhU5C8AJsZbiwoBe/vc=
Date: Tue, 11 Aug 2020 05:41:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v8 3/3] drm: bridge: cdns-mhdp: Add j721e wrapper
Message-ID: <20200811024135.GD13513@pendragon.ideasonboard.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-4-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596713672-8146-4-git-send-email-sjakhade@cadence.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie, tomi.valkeinen@ti.com,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil,

Thank you for the patch.

On Thu, Aug 06, 2020 at 01:34:32PM +0200, Swapnil Jakhade wrote:
> Add j721e wrapper for mhdp, which sets up the clock and data muxes.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           | 13 +++++
>  drivers/gpu/drm/bridge/Makefile          |  2 +
>  drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 15 +++++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 72 ++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 19 +++++++
>  6 files changed, 122 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6a4c324302a8..8c1738653b7e 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -38,6 +38,19 @@ config DRM_CDNS_MHDP
>  	  It takes a DPI stream as input and outputs it encoded
>  	  in DP format.
>  
> +if DRM_CDNS_MHDP
> +
> +config DRM_CDNS_MHDP_J721E
> +	depends on ARCH_K3_J721E_SOC

	depends on ARCH_K3_J721E_SOC || COMPILE_TEST

> +	bool "J721E Cadence DPI/DP wrapper support"
> +	default y
> +	help
> +	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
> +	  which adds support for J721E related platform ops. It
> +	  initializes the J721e Display Port and sets up the
> +	  clock and data muxes.
> +endif
> +
>  config DRM_CHRONTEL_CH7033
>  	tristate "Chrontel CH7033 Video Encoder"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 7046bf077603..be92ebf620b6 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -2,6 +2,8 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
>  cdns-mhdp-y := cdns-mhdp-core.o
> +cdns-mhdp-$(CONFIG_DRM_CDNS_MHDP_J721E) += cdns-mhdp-j721e.o
> +
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> index d47187ab358b..53c25f6ecddf 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> @@ -42,6 +42,8 @@
>  
>  #include "cdns-mhdp-core.h"
>  
> +#include "cdns-mhdp-j721e.h"
> +
>  static DECLARE_WAIT_QUEUE_HEAD(fw_load_wq);
>  
>  static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> @@ -1702,6 +1704,16 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
>  
>  	conn->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH;
>  
> +	if (of_device_is_compatible(mhdp->dev->of_node, "ti,j721e-mhdp8546"))
> +	/*
> +	 * DP is internal to J7 SoC and we need to use DRIVE_POSEDGE
> +	 * in the display controller. This is achieved for the time being
> +	 * by defining SAMPLE_NEGEDGE here.
> +	 */

The indentation is wrong. You can adjust it or move it before the if (...).

> +		conn->display_info.bus_flags |=
> +					DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +					DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;

This should be set in drm_bridge_timings.input_bus_flags instead, and
the tidss should use those when available instead of getting the value
from the connector.

> +
>  	ret = drm_connector_attach_encoder(conn, bridge->encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
> @@ -2521,6 +2533,9 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id mhdp_ids[] = {
>  	{ .compatible = "cdns,mhdp8546", },
> +#ifdef CONFIG_DRM_CDNS_MHDP_J721E
> +	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
> +#endif
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mhdp_ids);
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> index bd97a7aeb28b..d40a0f8615a4 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> @@ -343,6 +343,7 @@ struct cdns_mhdp_bridge_state {
>  
>  struct cdns_mhdp_device {
>  	void __iomem *regs;
> +	void __iomem *j721e_regs;
>  
>  	struct device *dev;
>  	struct clk *clk;
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> new file mode 100644
> index 000000000000..cc33c9afb5bb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com

Missing >

> + */
> +
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
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
> +static int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
> +{
> +	struct platform_device *pdev = to_platform_device(mhdp->dev);
> +
> +	mhdp->j721e_regs = devm_platform_ioremap_resource(pdev, 1);
> +	return PTR_ERR_OR_ZERO(mhdp->j721e_regs);
> +}
> +
> +static void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
> +{
> +	/*
> +	 * Eneble VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected

s/Eneble/Enable/

> +	 * to eDP DPI2. This is the only supported SST configuration on
> +	 * J721E.
> +	 */
> +	writel(DPTX_SRC_VIF_0_EN | DPTX_SRC_VIF_0_SEL_DPI2,
> +	       mhdp->j721e_regs + DPTX_SRC_CFG);
> +}
> +
> +static void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp)
> +{
> +	/* Put everything to defaults  */
> +	writel(0, mhdp->j721e_regs + DPTX_DSC_CFG);
> +}
> +
> +const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
> +	.init = cdns_mhdp_j721e_init,
> +	.enable = cdns_mhdp_j721e_enable,
> +	.disable = cdns_mhdp_j721e_disable,
> +};
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> new file mode 100644
> index 000000000000..7a4a1a269b5e
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com

Missing >

> + */
> +
> +#ifndef CDNS_MHDP_J721E_H
> +#define CDNS_MHDP_J721E_H
> +
> +#include <linux/platform_device.h>
> +#include "cdns-mhdp-core.h"

I don't think you need any of those two headers.

> +
> +struct mhdp_platform_ops;
> +
> +extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
> +
> +#endif /* !CDNS_MHDP_J721E_H */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
