Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAF1A12EA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 19:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C37A6E13A;
	Tue,  7 Apr 2020 17:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308FC6E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 17:47:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8B8E18048A;
 Tue,  7 Apr 2020 19:47:06 +0200 (CEST)
Date: Tue, 7 Apr 2020 19:47:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH v2 2/4] drm: ipk: Add DRM driver for DesignWare IPK DSI
Message-ID: <20200407174704.GA6356@ravnborg.org>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
 <488ff0f31581967517607e6860ab520839e29635.1586174459.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <488ff0f31581967517607e6860ab520839e29635.1586174459.git.angelo.ribeiro@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=e5mUnYsNAAAA:8 a=4Off-LMMQjLtHQkNATwA:9
 a=BqbDF8qqGYvOUDtP:21 a=wzVLAJofguk4pnjZ:21 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, Joao.Pinto@synopsys.com, airlied@linux.ie,
 Gustavo.Pimentel@synopsys.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo.

Has it been evaluated if the drm_simple_* stuff can be used?
It looks like this is a single plane, single connector thing so a good
candidate.

Some nits below.

	Sam

On Mon, Apr 06, 2020 at 03:24:12PM +0200, Angelo Ribeiro wrote:
> Add support for Synopsys DesignWare VPG (Video Pattern Generator) and
> DRM driver for Synopsys DesignWare DSI Host IPK solution.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  drivers/gpu/drm/Kconfig      |   2 +
>  drivers/gpu/drm/Makefile     |   1 +
>  drivers/gpu/drm/ipk/Kconfig  |  13 +
>  drivers/gpu/drm/ipk/Makefile |   6 +
>  drivers/gpu/drm/ipk/dw-drv.c | 189 +++++++++++++++
>  drivers/gpu/drm/ipk/dw-ipk.h |  30 +++
>  drivers/gpu/drm/ipk/dw-vpg.c | 559 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/ipk/dw-vpg.h |  55 +++++
>  8 files changed, 855 insertions(+)
>  create mode 100644 drivers/gpu/drm/ipk/Kconfig
>  create mode 100644 drivers/gpu/drm/ipk/Makefile
>  create mode 100644 drivers/gpu/drm/ipk/dw-drv.c
>  create mode 100644 drivers/gpu/drm/ipk/dw-ipk.h
>  create mode 100644 drivers/gpu/drm/ipk/dw-vpg.c
>  create mode 100644 drivers/gpu/drm/ipk/dw-vpg.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 4359497..29ea1d1 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -388,6 +388,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
>  
>  source "drivers/gpu/drm/tidss/Kconfig"
>  
> +source "drivers/gpu/drm/ipk/Kconfig"
> +
>  # Keep legacy drivers last
>  
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 183c600..5bcc1c1 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -125,3 +125,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
> +obj-$(CONFIG_DRM_IPK) += ipk/
> diff --git a/drivers/gpu/drm/ipk/Kconfig b/drivers/gpu/drm/ipk/Kconfig
> new file mode 100644
> index 0000000..1f87444
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_IPK
> +	tristate "DRM Support for Synopsys DesignWare IPK DSI"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_PANEL_BRIDGE
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Enable support for the Synopsys DesignWare DRM DSI.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called ipk-drm.
> diff --git a/drivers/gpu/drm/ipk/Makefile b/drivers/gpu/drm/ipk/Makefile
> new file mode 100644
> index 0000000..51d2774
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +ipk-drm-y := \
> +	dw-drv.o \
> +	dw-vpg.o
There is no point in adding '\' here.
A simple:

    ipk-drm-y := dw-drv.o dw-vpg.o

Lot's of Makefile uses the ugly '\' where they should
use a += instead :-(

> +obj-$(CONFIG_DRM_IPK) += ipk-drm.o
> diff --git a/drivers/gpu/drm/ipk/dw-drv.c b/drivers/gpu/drm/ipk/dw-drv.c
> new file mode 100644
> index 0000000..6205f1c
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-drv.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare MIPI DSI DRM driver
> + *
> + * Author: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> + */
> +
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "dw-ipk.h"
> +#include "dw-vpg.h"

Please order thei ncludes like this:

#include <linux/*>
[empty line]
#include <drm/*>
[empty line]
#include "dw*.h"

Within each block - sort alphabetically.
Drop unused includes - drm_probe_helper is IIRC for legacy stuff
mostly/only.

> +
> +static const struct drm_mode_config_funcs dw_ipk_drm_modecfg_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static int dw_ipk_load(struct drm_device *drm)
> +{
> +	int ret;
> +
> +	drm_mode_config_init(drm);
drmm_mode_config_init(drm);
And remember to check return value.

> +
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +
> +	/* To handle orientation */
> +	drm->mode_config.max_width = 2048;
> +	drm->mode_config.max_height = 2048;
> +
> +	drm->mode_config.funcs = &dw_ipk_drm_modecfg_funcs;
> +
> +	/* TODO
> +	 * Optional framebuffer memory resources allocation
> +	 */
> +
> +	ret = vpg_load(drm);
> +	if (ret)
> +		return ret;
> +
> +	/* Calls all the crtc's, encoder's and connector's reset */
> +	drm_mode_config_reset(drm);
> +
> +	/* Initialize and enable output polling */
> +	drm_kms_helper_poll_init(drm);
> +
> +	return ret;
> +}
> +
> +static void dw_ipk_unload(struct drm_device *drm)
> +{
> +	DRM_DEBUG_DRIVER("\n");
when you have a drm_device - then please use drm_xxx for
debug/warnings/errors - and also drm_WARN as applicable.
This goes for everywhere that DRM_XXX is used.
In this case use:
	drm_dbg(drm, "\n");

> +
> +	drm_kms_helper_poll_fini(drm);
> +	vpg_unload(drm);
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(ipk_drm_driver_fops);
> +
> +static int ipk_gem_cma_dumb_create(struct drm_file *file,
> +				   struct drm_device *dev,
> +				   struct drm_mode_create_dumb *args)
> +{
> +	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int err;
> +
> +	/*
> +	 * In order to optimize data transfer, pitch is aligned on
> +	 * 128 bytes, height is aligned on 4 bytes
> +	 */
> +	args->pitch = roundup(min_pitch, 128);
> +	args->height = roundup(args->height, 4);
> +
> +	err = drm_gem_cma_dumb_create_internal(file, dev, args);
> +	if (err < 0)
> +		drm_err(dev, "dumb_create failed %d\n", err);
> +
> +	return err;
> +}
> +
> +static struct drm_driver dw_ipk_drm_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.name = "dw_ipk",
> +	.desc = "DW IPK DSI Host Controller",
> +	.date = "20190725",
> +	.major = 1,
> +	.minor = 0,
> +	.patchlevel = 0,
> +	.fops = &ipk_drm_driver_fops,
> +	.dumb_create = ipk_gem_cma_dumb_create,
> +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_free_object_unlocked = drm_gem_cma_free_object,
From the documentation:

This is deprecated and should not be used by new drivers. Use
&drm_gem_object_funcs.free instead.


> +	.gem_vm_ops = &drm_gem_cma_vm_ops,
> +	.gem_prime_export = drm_gem_prime_export,
From documentation:

Export hook for GEM drivers. Deprecated in favour of
&drm_gem_object_funcs.export.


> +	.gem_prime_import = drm_gem_prime_import,
From documentation:
This defaults to drm_gem_prime_import() if not set.


> +	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> +	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> +	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> +	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> +	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> +};
Did not check all - please go through drm_drv.h - and fix so the driver
do not use any deprecated stuff.


> +
> +static int dw_ipk_drm_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct drm_device *drm;
> +	struct ipk_device *ipk;
> +	int ret;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	ipk = kzalloc(sizeof(*ipk), GFP_KERNEL);
drmm_kzalloc() - but see feedback from Daniel too.
> +	if (!ipk)
> +		return -ENOMEM;
> +
> +	ipk->platform = pdev;
> +	drm = &ipk->drm;
> +
> +	ret = drm_dev_init(&ipk->drm, &dw_ipk_drm_driver, dev);
> +	if (ret) {
> +		kfree(ipk);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret = dw_ipk_load(drm);
> +	if (ret)
> +		goto err_put;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		goto err_put;
> +
> +	drm_fbdev_generic_setup(drm, 24);
> +
> +	return ret;
> +
> +err_put:
> +	drm_dev_put(drm);
> +	return ret;
> +}
> +
> +static int dw_ipk_drm_platform_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_dev_unregister(drm);
> +	dw_ipk_unload(drm);
> +	drm_dev_put(drm);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dw_ipk_dt_ids[] = {
> +	{.compatible = "snps,dw-ipk-vpg"},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dw_ipk_dt_ids);
> +
> +static struct platform_driver dw_ipk_drm_platform_driver = {
> +	.probe = dw_ipk_drm_platform_probe,
> +	.remove = dw_ipk_drm_platform_remove,
> +	.driver = {
> +		.name = "dw-ipk-drm",
> +		.of_match_table = dw_ipk_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(dw_ipk_drm_platform_driver);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare IPK DRM driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Angelo Ribeiro <angelo.ribeiro@synopsys.com>");
> diff --git a/drivers/gpu/drm/ipk/dw-ipk.h b/drivers/gpu/drm/ipk/dw-ipk.h
> new file mode 100644
> index 0000000..4abb6dd
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-ipk.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare MIPI DSI Controller
> + */
> +
> +#ifndef _DW_IPK_H
> +#define _DW_IPK_H
> +
> +#include "drm/drm_device.h"
> +#include <drm/bridge/dw_mipi_dsi.h>
Add the inlcudes so the header file is standalone . the header file
should not relay on other files being includes.
Use forward as appropriate - like for example:

struct drm_bridge;
struct drm_framebuffer;
stuct drm_plane;

Keep the forwards alphabetically sorted.

> +
> +struct ipk_pipeline {
> +	struct drm_framebuffer	*fb;
> +	struct drm_crtc		crtc;
> +	struct drm_plane	*plane;
> +	struct drm_bridge	*bridge;
> +};
> +
> +struct ipk_device {
> +	struct drm_device drm;
> +	struct platform_device *platform;
> +	struct ipk_pipeline pipeline;
> +	struct vpg_device *vpg;
> +};
> +
> +#define drm_device_to_ipk_device(target) \
> +	container_of(target, struct ipk_device, drm)
> +
> +#endif /* _DW_IPK_H */
> diff --git a/drivers/gpu/drm/ipk/dw-vpg.c b/drivers/gpu/drm/ipk/dw-vpg.c
> new file mode 100644
> index 0000000..feb3e90
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-vpg.c
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare MIPI DSI controller
> + *
> + * Author: Angelo Ribeiro <angelor@synopsys.com>
> + * Author: Luis Oliveira <luis.oliveira@synopsys.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_vblank.h>
> +#include <linux/platform_data/simplefb.h>
> +#include <video/videomode.h>
> +
> +#include "dw-ipk.h"
> +#include "dw-vpg.h"
See earlier rant on include files.

> +
> +#define NB_CRTC 1
> +#define CRTC_MASK GENMASK(NB_CRTC - 1, 0)
> +#define MAX_ENDPOINTS 1
> +
> +struct vpg_device {
> +	void __iomem *base;
> +	void __iomem *base_mmcm;
> +};
> +
> +enum vpg_pixel_fmt {
> +	VIF_COLOR_CODE_16BIT_CONFIG1 = 0,
> +	VIF_COLOR_CODE_16BIT_CONFIG2,
> +	VIF_COLOR_CODE_16BIT_CONFIG3,
> +	VIF_COLOR_CODE_18BIT_CONFIG1,
> +	VIF_COLOR_CODE_18BIT_CONFIG2,
> +	VIF_COLOR_CODE_24BIT,
> +	VIF_COLOR_CODE_MAX
> +};
> +
> +static enum vpg_pixel_fmt to_vpg_pixel_format(u32 drm_fmt)
> +{
> +	enum vpg_pixel_fmt pf;
> +
> +	switch (drm_fmt) {
> +	case DRM_FORMAT_RGB888:
> +		pf = VIF_COLOR_CODE_24BIT;
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		pf = VIF_COLOR_CODE_16BIT_CONFIG1;
> +		break;
> +	default:
> +		pf = VIF_COLOR_CODE_MAX;
> +		break;
> +	}
> +	return pf;
> +}
> +
> +static struct simplefb_format supported_formats[] = {
> +	{"r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565},
> +	{"r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888},
> +	{"x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888},
> +};
> +
> +static const u64 vpg_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static const struct drm_encoder_funcs ipk_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
This driver is a candidate to use drm_simple_encoder_init()
This would get rid of the above ipk_encoder_funcs variable.

> +
> +static int ipk_encoder_init(struct drm_device *drm,
> +			    struct drm_bridge *bridge)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return -ENOMEM;
> +
> +	/* Only one CRTC can be attached in IPK_DSI */
> +	encoder->possible_crtcs = CRTC_MASK;
> +	encoder->possible_clones = 0;
> +
> +	ret = drm_encoder_init(drm, encoder, &ipk_encoder_funcs,
> +			       DRM_MODE_ENCODER_DPI, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +	if (ret)
> +		goto err_attach;
> +
> +	/* Add to the internal struct */
> +	ipk->pipeline.bridge = bridge;
> +
> +	DRM_DEBUG_DRIVER("Num of connectors = %d\n",
> +			 drm->mode_config.num_connector);
> +	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
drm_dbg(drm, ...)
> +
> +	return ret;
> +
> +err_attach:
> +	drm_encoder_cleanup(encoder);
> +	return ret;
> +}
> +
> +/*
> + * CRTC
> + */
> +static u32 vpg_read(struct vpg_device *dev, u32 reg)
> +{
> +	return readl(dev->base + reg);
> +}
> +
> +static void vpg_write(struct vpg_device *dev, u32 reg, u32 val)
> +{
> +	writel(val, dev->base + reg);
> +}
> +
> +static void vpg_write_part(struct vpg_device *dev, u32 reg,
> +			   u32 val, u8 shift, u8 width)
> +{
> +	u32 mask = (1 << width) - 1;
> +
> +	vpg_write(dev, reg, (vpg_read(dev, reg) &
> +		  ~(mask << shift)) | ((val & mask) << shift));
> +}
> +
> +static u32 mmcm_read(struct vpg_device *dev, u32 reg)
> +{
> +	return readl(dev->base_mmcm + reg);
> +}
> +
> +static void mmcm_write(struct vpg_device *dev, u32 reg, u32 value)
> +{
> +	writel(value, dev->base_mmcm + reg);
> +}
> +
> +static void mmcm_configure(struct vpg_device *vpg, struct videomode *v_mode)
> +{
> +	int div,  mul, cur_freq, cur_deviat, temp;
> +	int out_freq = v_mode->pixelclock / 1000;
> +	int in_freq = 100000;
> +	int deviat = 1000;	/* Deviation from desired master clock */
> +	int best_div = 0;	/* Divider for PLL */
> +	int best_mul = 0;	/* Multiplier for PLL */
> +
> +	DRM_DEBUG_DRIVER("out_freq = %d\n", out_freq);
> +
> +	for (div = 1; div < 150 && deviat > 50; div++) {
> +		for (mul = 1; mul <= 10 && deviat > 50; mul++) {
> +			cur_freq = in_freq * mul / div;
> +			cur_deviat = abs(out_freq - cur_freq);
> +			if (cur_deviat < deviat) {
> +				best_div = div;
> +				best_mul = mul;
> +				deviat = cur_deviat;
> +			}
> +		}
> +	}
> +
> +	DRM_DEBUG_DRIVER("deviat = %d\n best_div = %d\n best_mul = %d\n",
> +			 deviat, best_div, best_mul);
> +
> +	temp = mmcm_read(vpg, DW_MMCM_CLKOUT0_REG_1) & DW_MMCM_MASK;
> +	mmcm_write(vpg, DW_MMCM_CLKOUT0_REG_1, temp | (best_div << 6) |
> +		   best_div);
> +
> +	temp = mmcm_read(vpg, DW_MMCM_CLKFBOUT_REG_1) & DW_MMCM_MASK;
> +	mmcm_write(vpg, DW_MMCM_CLKFBOUT_REG_1, temp | (best_mul << 6) |
> +		   best_mul);
> +}
> +
> +static void vpg_set_fps(struct vpg_device *vpg,
> +			const struct drm_display_mode *mode)
> +{
> +	/* IF_Freq is in KHz */
> +	u32 line_time = (1000 * DW_VPG_FREQ) / (mode->vrefresh * mode->vtotal);
> +
> +	vpg_write(vpg, DW_VPG_LINE_TIME, line_time);
> +}
> +
> +static void vpg_select_pattern(struct vpg_device *vpg, unsigned int value)
> +{
> +	vpg_write(vpg, DW_VPG_TESTMODE, value);
> +}
> +
> +static void vpg_vertical_set(struct vpg_device *vpg, struct videomode *v_mode)
> +{
> +	vpg_write_part(vpg, DW_VPG_CANVAS, v_mode->vactive, 16, 16);
> +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vsync_len, 0, 8);
> +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vback_porch, 20, 12);
> +	vpg_write_part(vpg, DW_VPG_VBP_VFP_VSA, v_mode->vfront_porch, 8, 11);
> +}
> +
> +static void vpg_horizontal_set(struct vpg_device *vpg, struct videomode *v_mode)
> +{
> +	vpg_write_part(vpg, DW_VPG_CANVAS, v_mode->hactive, 0, 16);
> +	vpg_write_part(vpg, DW_VPG_HBP_HSA, v_mode->hsync_len, 0, 16);
> +	vpg_write_part(vpg, DW_VPG_HBP_HSA, v_mode->hback_porch, 16, 16);
> +}
> +
> +static ssize_t show_pattern(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> +	struct vpg_device *vpg = ipk->vpg;
> +
> +	return sprintf(buf, "%d\n", vpg_read(vpg, DW_VPG_TESTMODE));
> +}
> +
> +static ssize_t store_pattern(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> +	struct vpg_device *vpg = ipk->vpg;
> +	long pattern;
> +	int ret;
> +
> +	ret = kstrtol(buf, 0, &pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	vpg_select_pattern(vpg, pattern);
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute vpg_pattern = __ATTR(pattern, 0660,
> +						  (void *)show_pattern,
> +						  (void *)store_pattern);
> +
> +static struct attribute *vpg_attr[] = {
> +	&vpg_pattern.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group vpg_attr_group = {
> +	.attrs = vpg_attr,
> +};
> +
> +static void vpg_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	struct vpg_device *vpg = ipk->vpg;
> +	struct videomode v_mode;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	drm_display_mode_to_videomode(mode, &v_mode);
Could be dropped, and all users of videomode could use drm_display_mode.
One less indirection.

> +
> +	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
> +	DRM_DEBUG_DRIVER("Video mode: %dx%d", v_mode.hactive, v_mode.vactive);
> +	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
> +			 v_mode.hfront_porch, v_mode.hback_porch,
> +			 v_mode.hsync_len, v_mode.vfront_porch,
> +			 v_mode.vback_porch, v_mode.vsync_len);
> +
> +	mmcm_configure(vpg, &v_mode);
> +
> +	vpg_write(vpg, DW_VPG_SEL_DATA, 0x01);
> +	vpg_write(vpg, DW_VPG_SEL_DATA, 0x03);
> +
> +	vpg_horizontal_set(vpg, &v_mode);
> +
> +	vpg_vertical_set(vpg, &v_mode);
> +
> +	vpg_set_fps(vpg, mode);
> +
> +	vpg_select_pattern(vpg, 0);
> +}
> +
> +static void vpg_crtc_atomic_begin(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *state)
> +{
> +	struct drm_pending_vblank_event *event = crtc->state->event;
> +
> +	if (event) {
> +		crtc->state->event = NULL;
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +static struct drm_crtc_helper_funcs vpg_crtc_helper_funcs = {
> +	.mode_set_nofb = vpg_crtc_mode_set_nofb,
> +	.atomic_begin = vpg_crtc_atomic_begin,
> +};
> +
> +static int vpg_crtc_late_register(struct drm_crtc *crtc)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> +	struct platform_device *pdev = ipk->platform;
> +	int ret;
> +
> +	ret = sysfs_create_group(&pdev->dev.kobj, &vpg_attr_group);
> +	if (ret)
> +		drm_err(crtc->dev, "Failed to create sysfs entries");
> +
> +	return ret;
> +}
> +
> +static void vpg_crtc_early_unregister(struct drm_crtc *crtc)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(crtc->dev);
> +	struct platform_device *pdev = ipk->platform;
> +
> +	sysfs_remove_group(&pdev->dev.kobj, &vpg_attr_group);
> +}
> +
> +static const struct drm_crtc_funcs vpg_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.late_register =  vpg_crtc_late_register,
> +	.early_unregister = vpg_crtc_early_unregister
> +};
> +
> +/*
> + * Plane
> + */
> +static void vpg_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *old_state)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(plane->dev);
> +	struct drm_plane_state *state = plane->state;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct vpg_device *vpg = ipk->vpg;
> +	enum vpg_pixel_fmt pixel_format;
> +
> +	pixel_format = to_vpg_pixel_format(fb->format->format);
> +
> +	vpg_write(vpg, DW_VPG_DPICOLORMODE, pixel_format);
> +}
> +
> +static void vpg_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *oldstate)
> +{
> +	DRM_DEBUG_DRIVER("\n");
> +}
> +
> +static const struct drm_plane_helper_funcs vpg_plane_helper_funcs = {
> +	.atomic_update = vpg_plane_atomic_update,
> +	.atomic_disable = vpg_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs vpg_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static void vpg_plane_destroy_all(struct drm_device *drm)
> +{
> +	struct drm_plane *plane, *plane_temp;
> +
> +	list_for_each_entry_safe(plane, plane_temp,
> +				 &drm->mode_config.plane_list, head)
> +		drm_plane_cleanup(plane);
> +}
> +
> +static int vpg_crtc_init(struct drm_device *drm, struct drm_crtc *crtc)
> +{
> +	u32 formats[ARRAY_SIZE(supported_formats)], i;
> +	const u64 *modifiers = vpg_format_modifiers;
> +	unsigned long possible_crtcs = CRTC_MASK;
> +	struct device *drm_dev = drm->dev;
> +	struct drm_plane *plane;
> +	int ret;
> +
> +	plane = devm_kzalloc(drm_dev, sizeof(*plane), GFP_KERNEL);
> +	if (!plane)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
> +		formats[i] = supported_formats[i].fourcc;
> +
> +	ret = drm_universal_plane_init(drm, plane, possible_crtcs,
> +				       &vpg_plane_funcs, formats,
> +				       ARRAY_SIZE(formats), modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		goto cleanup_planes;
> +
> +	drm_plane_helper_add(plane, &vpg_plane_helper_funcs);
> +
> +	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
> +
> +	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> +					&vpg_crtc_funcs, "DSI-VPG");
> +	if (ret) {
> +		DRM_DEBUG_DRIVER("Failed initialize CRTC\n");
> +		goto cleanup_crtc;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &vpg_crtc_helper_funcs);
> +
> +	DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
> +
> +	return ret;
> +
> +cleanup_crtc:
> +	drm_crtc_cleanup(crtc);
> +cleanup_planes:
> +	vpg_plane_destroy_all(drm);
> +	return ret;
> +}
> +
> +int vpg_load(struct drm_device *drm)
> +{
> +	struct ipk_device *ipk = drm_device_to_ipk_device(drm);
> +	struct drm_bridge *bridge[MAX_ENDPOINTS] = {NULL};
> +	struct drm_panel *panel[MAX_ENDPOINTS] = {NULL};
> +	struct platform_device *pdev = ipk->platform;
> +	struct device_node *np = drm->dev->of_node;
> +	int ret, i, endpoint_not_ready = -ENODEV;
> +	struct reset_control *vpg_rst, *mmcm_rst;
> +	struct device *dev = drm->dev;
> +	struct vpg_device *vpg;
> +	struct drm_crtc *crtc;
> +	struct resource *res;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	vpg = devm_kzalloc(&pdev->dev, sizeof(*vpg), GFP_KERNEL);
> +	if (!vpg)
> +		return -ENOMEM;
> +
> +	ipk->vpg = vpg;
> +
> +	/* Get endpoints if any */
> +	for (i = 0; i < MAX_ENDPOINTS; i++) {
> +		ret = drm_of_find_panel_or_bridge(np, 0, i, &panel[i],
> +						  &bridge[i]);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +		else if (!ret)
> +			endpoint_not_ready = 0;
> +	}
> +
> +	if (endpoint_not_ready)
> +		return endpoint_not_ready;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpg");
> +	vpg->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(vpg->base)) {
> +		drm_err(drm, "Unable to get VPG registers\n");
> +		ret = PTR_ERR(vpg->base);
> +		goto err;
> +	}
> +
> +	vpg_rst = devm_reset_control_get_optional_exclusive(dev, "vpg");
> +	if (IS_ERR(vpg_rst)) {
> +		ret = PTR_ERR(vpg_rst);
> +		if (ret != -EPROBE_DEFER)
> +			drm_err(drm, "Unable to get reset control: %d\n", ret);
> +		goto err;
> +	}
> +
> +	if (vpg_rst) {
> +		reset_control_assert(vpg_rst);
> +		usleep_range(10, 20);
> +		reset_control_deassert(vpg_rst);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmcm");
> +	vpg->base_mmcm = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(vpg->base)) {
> +		ret = PTR_ERR(vpg->base);
> +		goto err;
> +	}
> +
> +	mmcm_rst = devm_reset_control_get_optional_exclusive(dev, "mmcm");
> +	if (IS_ERR(mmcm_rst)) {
> +		ret = PTR_ERR(mmcm_rst);
> +		if (ret != -EPROBE_DEFER)
> +			drm_err(drm, "Unable to get reset control: %d\n", ret);
> +		goto err;
> +	}
> +
> +	if (mmcm_rst) {
> +		reset_control_assert(mmcm_rst);
> +		usleep_range(10, 20);
> +		reset_control_deassert(mmcm_rst);
> +	}
> +
> +	/* Add endpoints panels or bridges if any */
> +	for (i = 0; i < MAX_ENDPOINTS; i++) {
> +		if (panel[i]) {
> +			bridge[i] = drm_panel_bridge_add_typed(panel[i],
> +							DRM_MODE_CONNECTOR_DSI);
> +			if (IS_ERR(bridge[i])) {
> +				ret = PTR_ERR(bridge[i]);
> +				goto err;
> +			}
> +		}
> +
> +		if (bridge[i]) {
> +			ret = ipk_encoder_init(drm, bridge[i]);
> +			if (ret)
> +				goto err;
> +		}
> +	}
> +
> +	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	ret = vpg_crtc_init(drm, crtc);
> +	if (ret)
> +		goto err;
> +
> +	return ret;
> +
> +err:
> +	for (i = 0; i < MAX_ENDPOINTS; i++)
> +		drm_panel_bridge_remove(bridge[i]);
> +
> +	return ret;
> +}
> +
> +void vpg_unload(struct drm_device *drm)
> +{
> +	int i;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +	for (i = 0; i < MAX_ENDPOINTS; i++)
> +		drm_of_panel_bridge_remove(drm->dev->of_node, 0, i);
> +}
> diff --git a/drivers/gpu/drm/ipk/dw-vpg.h b/drivers/gpu/drm/ipk/dw-vpg.h
> new file mode 100644
> index 0000000..869ccc4
> --- /dev/null
> +++ b/drivers/gpu/drm/ipk/dw-vpg.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2020 Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare VPG
> + */
> +
> +#ifndef _VPG_H_
> +#define _VPG_H_
> +
> +#define DW_VPG_PANX				0x00
> +#define DW_VPG_PANY				0x04
> +#define DW_VPG_PHASE_SEL			0x08
> +#define DW_VPG_SEL_DATA				0x0C
> +#define DW_VPG_SWAP_BAY				0x10
> +#define DW_VPG_TESTMODE				0x14
> +#define DW_VPG_ZOOM_OUT				0x18
> +#define DW_VPG_EDPICTRL				0x1C
> +#define DW_VPG_CANVAS				0x20
> +#define DW_VPG_HBP_HSA				0x24
> +#define DW_VPG_LINE_TIME			0x28
> +#define DW_VPG_VBP_VFP_VSA			0x2C
> +#define DW_VPG_DPICOLORMODE			0x30
> +#define DW_VPG_VERSION				0x34
> +#define DW_VPG_EXTRNAL_EDPI			0x38
> +#define DW_VPG_PVO_CEAVID			0x3C
> +#define DW_VPG_PAN_VALID			0x40
> +#define DW_VPG_TECONTROL			0x44
> +#define DW_VPG_IMAGE_START_POSITION_X		0x4C
> +#define DW_VPG_IMAGE_START_POSITION_Y		0x50
> +#define DW_VPG_IMAGE_Y				0x54
> +#define DW_VPG_IMAGE_WORD_COUNT			0x58
> +#define DW_VPG_IMAGE_DATA_TYPE			0x5C
> +#define DW_VPG_LINE_PIXS_CNT			0x60
> +#define DW_VPG_FRAME_LINES_CNT			0x64
> +
> +#define DW_MMCM_MASK				0x1000
> +#define DW_MMCM_CLKOUT0_REG_1			0x20
> +#define DW_MMCM_CLKOUT0_REG_2			0x24
> +#define DW_MMCM_CLKFBOUT_REG_1			0x50
> +#define DW_MMCM_CLKFBOUT_REG_2			0x54
> +#define DW_MMCM_POWER_REG			0xA0
> +
> +#define DW_VPG_ZOOM_OUT_STEP	1
> +#define DW_VPG_PAN_STEP	40
> +#define DW_VPG_FREQ	25000	/* [KHz] */
> +#define DW_VPG_V_FRONT_PORCH	2
> +#define DW_VPG_V_BACK_PORCH	2
> +#define DW_VPG_V_SYNC	2
> +#define SCREEN_SIZE_X	800
> +#define SCREEN_SIZE_Y	480
> +
> +int vpg_load(struct drm_device *ddev);
> +void vpg_unload(struct drm_device *ddev);
> +
> +#endif /* _VPG_H_ */
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
