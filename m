Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF345EF88
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 15:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579A46E937;
	Fri, 26 Nov 2021 14:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9886E8AE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 14:03:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235908222"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="235908222"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 06:03:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="498409922"
Received: from oletychx-mobl.ger.corp.intel.com (HELO [10.252.50.138])
 ([10.252.50.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 06:03:06 -0800
Message-ID: <cc2c3e2c-6993-b742-53d6-c6078a3ced09@linux.intel.com>
Date: Fri, 26 Nov 2021 15:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v7 2/6] drm/sprd: add Unisoc's drm kms master
Content-Language: en-US
To: Kevin Tang <kevin3.tang@gmail.com>, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
 pony1.wu@gmail.com
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
 <20211025093418.20545-3-kevin3.tang@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211025093418.20545-3-kevin3.tang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-10-2021 11:34, Kevin Tang wrote:
> Adds drm support for the Unisoc's display subsystem.
>
> This is drm kms driver, this driver provides support for the
> application framework in Android, Yocto and more.
>
> Application framework can access Unisoc's display internal
> peripherals through libdrm or libkms, it's test ok by modetest
> (DRM/KMS test tool) and Android HWComposer.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>
> v4:
>   - Move the devm_drm_dev_alloc to master_ops->bind function.
>   - The managed drmm_mode_config_init() it is no longer necessary for drivers to explicitly call drm_mode_config_cleanup, so delete it.
>
> v5:
>   - Remove subdir-ccflgas-y for Makefile.
>   - Keep the selects sorted by alphabet for Kconfig.
> ---
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/sprd/Kconfig    |  11 ++
>  drivers/gpu/drm/sprd/Makefile   |   3 +
>  drivers/gpu/drm/sprd/sprd_drm.c | 203 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sprd/sprd_drm.h |  16 +++
>  6 files changed, 236 insertions(+)
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2a926d0de..8220be1b5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -380,6 +380,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
>  
>  source "drivers/gpu/drm/gud/Kconfig"
>  
> +source "drivers/gpu/drm/sprd/Kconfig"
> +
>  config DRM_HYPERV
>  	tristate "DRM Support for Hyper-V synthetic video device"
>  	depends on DRM && PCI && MMU && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 0dff40bb8..ec2756806 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -127,3 +127,4 @@ obj-$(CONFIG_DRM_TIDSS) += tidss/
>  obj-y			+= xlnx/
>  obj-y			+= gud/
>  obj-$(CONFIG_DRM_HYPERV) += hyperv/
> +obj-$(CONFIG_DRM_SPRD) += sprd/
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> new file mode 100644
> index 000000000..726c3e76d
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -0,0 +1,11 @@
> +config DRM_SPRD
> +	tristate "DRM Support for Unisoc SoCs Platform"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this option if you have a Unisoc chipset.
> +	  If M is selected the module will be called sprd_drm.
> +
> diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
> new file mode 100644
> index 000000000..9850f00b8
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y := sprd_drm.o
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> new file mode 100644
> index 000000000..bb87f28f2
> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -0,0 +1,203 @@
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
> +	DRM_GEM_CMA_DRIVER_OPS,
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
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct drm_device *drm;
> +	struct sprd_drm *sprd;
> +	int ret;
> +
> +	sprd = devm_drm_dev_alloc(dev, &sprd_drm_drv, struct sprd_drm, drm);
> +	if (IS_ERR(sprd))
> +		return PTR_ERR(sprd);
> +
> +	drm = &sprd->drm;
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	sprd_drm_mode_config_init(drm);
> +
> +	/* bind and init sub drivers */
> +	ret = component_bind_all(drm->dev, drm);
> +	if (ret) {
> +		drm_err(drm, "failed to bind all component.\n");
> +		return ret;
> +	}
> +
> +	/* vblank init */
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize vblank.\n");
> +		goto err_unbind_all;
> +	}
> +
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(drm);
> +
> +	/* init kms poll for handling hpd */
> +	drm_kms_helper_poll_init(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_kms_helper_poll_fini;
> +
> +	return 0;
> +
> +err_kms_helper_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_unbind_all:
> +	component_unbind_all(drm->dev, drm);
> +	return ret;
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
> +	component_unbind_all(drm->dev, drm);
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
> +		drm_warn(drm, "drm device is not available, no shutdown\n");
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
> +	return platform_register_drivers(sprd_drm_drivers,
> +					ARRAY_SIZE(sprd_drm_drivers));
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
> index 000000000..9781fd591
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
> +	struct drm_device drm;
> +};

I've seen this in the patch adding sprd_plane too, are you planning to extend both structs?

~Maarten

