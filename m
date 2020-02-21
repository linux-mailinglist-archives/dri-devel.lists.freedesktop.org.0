Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D5168964
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98EB6E4E3;
	Fri, 21 Feb 2020 21:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031EE6E4E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:36:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 37AB080672;
 Fri, 21 Feb 2020 22:36:54 +0100 (CET)
Date: Fri, 21 Feb 2020 22:36:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
Message-ID: <20200221213652.GD3456@ravnborg.org>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=icsG72s9AAAA:8
 a=e5mUnYsNAAAA:8 a=mBc8XXrrKEmOfWTREeEA:9 a=CjuIK1q_8ugA:10
 a=T89tl0cgrjxRNoSN2Dv0:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: mark.rutland@arm.com, baolin.wang@linaro.org, airlied@linux.ie,
 zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Fri, Feb 21, 2020 at 03:48:52PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
> 
> Adds drm support for the Unisoc's display subsystem.

Thanks for the updated driver patch.
Good split of patches.
A few comments in the following.
Please filter in the comments as some may not apply to this driver.

	Sam

> 
> This is drm device and gem driver. This driver provides support for the
> Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
Hmm, hopefully we can use this without XFree86?
Looks like the above was copied from something outdated.


> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	select VIDEOMODE_HELPERS
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Choose this option if you have a Unisoc chipsets.
> +	  If M is selected the module will be called sprd-drm.

Please check that VIDEOMODE_HELPERS is really needed.
Please add COMPILE_TEST - so we will build this driver with
allmodconfig/allyesconfig.
This is how we ofthe verify refactoring work.


> \ No newline at end of file
Please fix.


> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 0000000..63b8751
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ccflags-y += -Iinclude/drm
Not required - delete.

> +
> +subdir-ccflags-y += -I$(src)
Not required - delete.
> +
> +obj-y := sprd_drm.o

> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> new file mode 100644
> index 0000000..7cac098
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
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
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "sprd_drm.h"
> +
> +#define DRIVER_NAME	"sprd"
> +#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
> +#define DRIVER_DATE	"20191101"
We are in 2020 now..

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
You should embed drm_device in struct sprd_drm.
See example code in drm/drm_drv.c

This is what modern drm drivers do.

I *think* you can drop the component framework if you do this.

> +
> +	dev_set_drvdata(dev, drm);
> +
> +	sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
> +	if (!sprd) {
> +		err = -ENOMEM;
> +		goto err_free_drm;
> +	}
> +	drm->dev_private = sprd;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	err = component_bind_all(drm->dev, drm);
> +	if (err) {
> +		DRM_ERROR("failed to bind all component.\n");
> +		goto err_dc_cleanup;
> +	}
When you have a drm_device - which you do here.
Then please use drm_err() and friends for error messages.
Please verify all uses of DRM_XXX

> +
> +	/* vblank init */
> +	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (err) {
> +		DRM_ERROR("failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}


> +	/* with irq_enabled = true, we can use the vblank feature. */
> +	drm->irq_enabled = true;
I cannot see any irq being installed. This looks wrong.

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
> +err_free_drm:
> +	drm_dev_put(drm);
> +	return err;
Please see the example in drm/drm_drv.c - following the example
will simpligy error handling a bit.
Ad you will learn not to use drm_dev_put().

> +}
> +
> +static void sprd_drm_unbind(struct device *dev)
> +{
> +	drm_put_dev(dev_get_drvdata(dev));
> +}
> +
> +static const struct component_master_ops drm_component_ops = {
> +	.bind = sprd_drm_bind,
> +	.unbind = sprd_drm_unbind,
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +	struct device_node *np = data;
> +
> +	DRM_DEBUG("compare %s\n", np->full_name);
Leftover debugging that can be dropped?

> +
> +	return dev->of_node == np;
> +}
> +
> +static int sprd_drm_component_probe(struct device *dev,
> +			   const struct component_master_ops *m_ops)
> +{
> +	struct device_node *ep, *port, *remote;
> +	struct component_match *match = NULL;
> +	int i;
> +
> +	if (!dev->of_node)
> +		return -EINVAL;
> +
> +	/*
> +	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
> +	 * called from encoder's .bind callbacks works as expected
> +	 */
> +	for (i = 0; ; i++) {
> +		port = of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		component_match_add(dev, &match, compare_of, port->parent);
> +		of_node_put(port);
> +	}
> +
> +	if (i == 0) {
> +		dev_err(dev, "missing 'ports' property\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!match) {
> +		dev_err(dev, "no available port\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * For bound crtcs, bind the encoders attached to their remote endpoint
> +	 */
> +	for (i = 0; ; i++) {
> +		port = of_parse_phandle(dev->of_node, "ports", i);
> +		if (!port)
> +			break;
> +
> +		if (!of_device_is_available(port->parent)) {
> +			of_node_put(port);
> +			continue;
> +		}
> +
> +		for_each_child_of_node(port, ep) {
> +			remote = of_graph_get_remote_port_parent(ep);
> +			if (!remote || !of_device_is_available(remote)) {
> +				of_node_put(remote);
> +				continue;
> +			} else if (!of_device_is_available(remote->parent)) {
> +				dev_warn(dev, "parent device of %s is not available\n",
> +					 remote->full_name);
> +				of_node_put(remote);
> +				continue;
> +			}
> +
> +			component_match_add(dev, &match, compare_of, remote);
> +			of_node_put(remote);
> +		}
> +		of_node_put(port);
> +	}
> +
> +	return component_master_add_with_match(dev, m_ops, match);
> +}
> +
> +static int sprd_drm_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
I do not thing ~0 is always the right mask.
Please verify.

> +	if (ret) {
> +		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return sprd_drm_component_probe(&pdev->dev, &drm_component_ops);
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
> +	{},

Sometimes we use { /* sentinel */ },
here.

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
> index 0000000..137cb27
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Unisoc Inc.
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
