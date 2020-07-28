Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB654231425
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 22:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4616E258;
	Tue, 28 Jul 2020 20:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346E6E258
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:45:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BFA5C2003E;
 Tue, 28 Jul 2020 22:45:33 +0200 (CEST)
Date: Tue, 28 Jul 2020 22:45:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v6 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <20200728204532.GC1277651@ravnborg.org>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595930879-2478-3-git-send-email-kevin3.tang@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=icsG72s9AAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=smJmRsUk-V0iNW54c5wA:9 a=CjuIK1q_8ugA:10 a=T89tl0cgrjxRNoSN2Dv0:22
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
Cc: mark.rutland@arm.com, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

Nice split of the driver.
Some feedback in the following.
Most to bring the driver up-to-date with what have happened since
we saw it last time.
Keeping up with the changes in drm is not always easy.

	Sam


On Tue, Jul 28, 2020 at 06:07:55PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> Adds drm support for the Unisoc's display subsystem.
> 
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
> 
> Application framework can access Unisoc's display internel
> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
> 
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  12 +++
>  drivers/gpu/drm/sprd/Makefile   |   5 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 226 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 262 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c4fd57d..7fe7ab91 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -386,6 +386,8 @@ source "drivers/gpu/drm/mcde/Kconfig"
>  
>  source "drivers/gpu/drm/tidss/Kconfig"
>  
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  # Keep legacy drivers last
>  
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2c0e5a7..ee2ccd9 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -123,3 +123,4 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 0000000..b189a54
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,12 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	help
> +	  Choose this option if you have a Unisoc chipsets.
> +	  If M is selected the module will be called sprd-drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 0000000..86d95d9
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y += -I$(srctree)/$(src)
subdir-ccflags-y is not needed - drop it.

> +
> +obj-y := sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> new file mode 100644
> index 0000000..4706185
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20200201"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_helper = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static void sprd_drm_mode_config_init(struct drm_device *drm)
> +{
> +	drm_mode_config_init(drm);
The documentation of this functions says:

FIXME: This function is deprecated and drivers should be converted over to
drmm_mode_config_init().


> +
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +	drm->mode_config.max_width = 8192;
> +	drm->mode_config.max_height = 8192;
> +	drm->mode_config.allow_fb_modifiers = true;
> +
> +	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
> +	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(sprd_drm_fops);
> +
> +static struct drm_driver sprd_drm_drv = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			= &sprd_drm_fops,
> +
> +	/* GEM Operations */
> +  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> +
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +};
> +
> +static int sprd_drm_bind(struct device *dev)
> +{
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int err;
> +
> +	drm = drm_dev_alloc(&sprd_drm_drv, dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	dev_set_drvdata(dev, drm);
> +
> +	sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> +	if (!sprd)
> +		err = -ENOMEM;

Embed drm_device in sprd_drm and use devm_drm_dev_alloc
See other drivers and drm_drv.c how to do it.
drm_drv.c has a nice example explained in one of the comment blocks.

> +
> +	drm->dev_private = sprd;
dev_private is deprecated. Alwyas use upclassing.

> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	err = component_bind_all(drm->dev, drm);
> +	if (err) {
> +		DRM_ERROR("failed to bind all component.\n");
> +		goto err_dc_cleanup;
> +	}
> +
> +	/* vblank init */
> +	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (err) {
> +		DRM_ERROR("failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +	/* with irq_enabled = true, we can use the vblank feature. */
> +	drm->irq_enabled = true;
Can drm_irq_install() be used?
Then this flag shall not be set by the driver.

> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);
> +
> +	err = drm_dev_register(drm, 0);
> +	if (err < 0)
> +		goto err_kms_helper_poll_fini;
> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +err_dc_cleanup:
> +	drm_mode_config_cleanup(drm);
> +	return err;
> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +
> +	drm_mode_config_cleanup(drm);
> +
> +	component_unbind_all(drm->dev, drm);
> +	drm->dev_private = NULL;
> +	dev_set_drvdata(dev, NULL);
> +
> +	drm_dev_put(drm);
> +}
> +
> +static const struct component_master_ops drm_component_ops = {
> +	.bind = sprd_drm_bind,
> +	.unbind = sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
> +	if (ret) {
> +		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return drm_of_component_probe(&pdev->dev, compare_of, &drm_component_ops);
> +}
> +
> +static int sprd_drm_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &drm_component_ops);
> +	return 0;
> +}
> +
> +static void sprd_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	if (!drm) {
> +		DRM_WARN("drm device is not available, no shutdown\n");
> +		return;
> +	}
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static const struct of_device_id drm_match_table[] = {
> +	{ .compatible = "sprd,display-subsystem", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, drm_match_table);
> +
> +static struct platform_driver sprd_drm_driver = {
> +	.probe = sprd_drm_probe,
> +	.remove = sprd_drm_remove,
> +	.shutdown = sprd_drm_shutdown,
> +	.driver = {
> +		.name = "sprd-drm-drv",
> +		.of_match_table = drm_match_table,
> +	},
> +};
> +
> +static struct platform_driver *sprd_drm_drivers[]  = {
> +	&sprd_drm_driver,
> +};
> +
> +static int __init sprd_drm_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_register_drivers(sprd_drm_drivers,
> +					ARRAY_SIZE(sprd_drm_drivers));
> +	return ret;
> +}
> +
> +static void __exit sprd_drm_exit(void)
> +{
> +	platform_unregister_drivers(sprd_drm_drivers,
> +				    ARRAY_SIZE(sprd_drm_drivers));
> +}
> +
> +module_init(sprd_drm_init);
> +module_exit(sprd_drm_exit);
> +
> +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
> new file mode 100644
> index 0000000..edf0881
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef _SPRD_DRM_H_
> +#define _SPRD_DRM_H_
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_print.h>
> +
> +struct sprd_drm {
> +	struct drm_device *drm;
> +};
> +
> +#endif /* _SPRD_DRM_H_ */
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
