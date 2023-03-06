Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D86ABE1A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95910E0B0;
	Mon,  6 Mar 2023 11:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3670110E0B0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:25:58 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pZ8yR-00032d-NE; Mon, 06 Mar 2023 12:25:47 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pZ8yP-0002WN-Lz; Mon, 06 Mar 2023 12:25:45 +0100
Date: Mon, 6 Mar 2023 12:25:45 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 2/2] drm/imx/lcdc: Implement DRM driver for imx25
Message-ID: <20230306112545.GA5486@pengutronix.de>
References: <20230210180014.173379-1-u.kleine-koenig@pengutronix.de>
 <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

just a few nitpicks, see below.

On Fri, Feb 10, 2023 at 07:00:14PM +0100, Uwe Kleine-König wrote:
> From: Marian Cichy <m.cichy@pengutronix.de>
> 
> Add support for the LCD Controller found on i.MX21 and i.MX25.
> 
> It targets to be a drop in replacement for the imx-fb driver.
> 
> Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> [ukl: Rebase to a newer kernel version, various smaller fixes and
> improvements]
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/imx/Kconfig         |   1 +
>  drivers/gpu/drm/imx/Makefile        |   1 +
>  drivers/gpu/drm/imx/lcdc/Kconfig    |   7 +
>  drivers/gpu/drm/imx/lcdc/Makefile   |   1 +
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 553 ++++++++++++++++++++++++++++
>  5 files changed, 563 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/lcdc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/lcdc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> 
[...]
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> new file mode 100644
> index 000000000000..c2197fc50306
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -0,0 +1,553 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// SPDX-FileCopyrightText: 2020 Marian Cichy <M.Cichy@pengutronix.de>
> +
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_fourcc.h>

Choose one, remove the other.

[...]
> +struct imx_lcdc {
> +	struct drm_device drm;
> +	struct drm_simple_display_pipe pipe;
> +	const struct drm_display_mode *mode;

The mode pointer appears to be unused.

> +	struct drm_bridge *bridge;

The bridge could be a local variable in _probe().

> +	struct drm_connector *connector;
> +	void __iomem *base;
> +
> +	struct clk *clk_ipg;
> +	struct clk *clk_ahb;
> +	struct clk *clk_per;
> +};
> +
> +static const u32 imx_lcdc_formats[] = {
> +	DRM_FORMAT_RGB565, DRM_FORMAT_XRGB8888,
> +};
> +
> +static inline struct imx_lcdc *imx_lcdc_from_drmdev(struct drm_device *drm)
> +{
> +	return container_of(drm, struct imx_lcdc, drm);
> +}
> +
> +static unsigned int imx_lcdc_get_format(unsigned int drm_format)
> +{
> +	unsigned int bpp;
> +
> +	switch (drm_format) {
> +	default:
> +		DRM_WARN("Format not supported - fallback to XRGB8888\n");
> +		fallthrough;
> +
> +	case DRM_FORMAT_XRGB8888:
> +		bpp = BPP_XRGB8888;
> +		break;

This could just return directly, no need for the local bpp variable.

> +
> +	case DRM_FORMAT_RGB565:
> +		bpp = BPP_RGB565;
> +		break;
> +	}
> +
> +	return bpp;
> +}
> +
[...]
> +
> +static int imx_lcdc_probe(struct platform_device *pdev)
> +{
> +	struct imx_lcdc *lcdc;
> +	struct drm_device *drm;
> +	int irq;
> +	int ret;
> +	struct device *dev = &pdev->dev;
> +
> +	lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
> +				  struct imx_lcdc, drm);
> +	if (!lcdc)
> +		return -ENOMEM;
> +
> +	drm = &lcdc->drm;
> +
> +	lcdc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(lcdc->base))
> +		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO memory\n");
> +
> +	lcdc->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(lcdc->bridge))
> +		return dev_err_probe(dev, PTR_ERR(lcdc->bridge), "Failed to find bridge\n");
[...]
> +	ret = drm_bridge_attach(&lcdc->pipe.encoder, lcdc->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");

The bridge could be a local variable.

With those addressed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
