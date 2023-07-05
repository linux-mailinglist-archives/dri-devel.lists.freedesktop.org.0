Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC67489EF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 19:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2576F10E182;
	Wed,  5 Jul 2023 17:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 075BE10E182
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 17:14:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8E461762
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 10:14:54 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A2BE3F762
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 10:14:12 -0700 (PDT)
Date: Wed, 5 Jul 2023 18:14:05 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Faiz Abbas <faiz.abbas@arm.com>
Subject: Re: [PATCH v2] drm/arm/komeda: Remove component framework and add a
 simple encoder
Message-ID: <ZKWk3YkM7jI304uv@e110455-lin.cambridge.arm.com>
References: <20230704163454.5138-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230704163454.5138-1-faiz.abbas@arm.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Faiz,

On Tue, Jul 04, 2023 at 10:04:54PM +0530, Faiz Abbas wrote:
> The Komeda driver always expects the remote connector node to initialize
> an encoder. It uses the component aggregator framework which consists
> of component->bind() calls used to initialize the remote encoder and attach
> it to the crtc. This makes it incompatible with connector drivers which
> implement drm_bridge APIs.
> 
> Remove all component framework calls from the komeda driver and declare and
> attach an encoder inside komeda_crtc_add().
> 
> The remote connector driver has to implement the DRM bridge APIs which
> can be used to glue the encoder to the remote connector. Since we
> usually pair this with a component encoder that also implements a
> drm_bridge, dropping support is not expected to affect users of this
> driver.

Thanks for updating the commit description, I think it shows the intent better.

When I'm trying to apply your patch to drm-misc next (or any branch that matters)
it fails because ...

> 
> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 23 +++++++-
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 57 ++-----------------
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   | 10 +---
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +
>  4 files changed, 32 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 4cc07d6bb9d82..e5a8a80b173f4 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -13,6 +13,8 @@
>  #include <drm/drm_crtc_helper.h>

... this line is different in my tree. It looks like your tree is missing
commit e3b63718827880 ("drm/arm/komeda: Remove unnecessary include
statements for drm_crtc_helper.h"), which has been applied in early January.

Best regards,
Liviu

>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_bridge.h>
>  
>  #include "komeda_dev.h"
>  #include "komeda_kms.h"
> @@ -613,9 +615,11 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  			   struct komeda_crtc *kcrtc)
>  {
>  	struct drm_crtc *crtc = &kcrtc->base;
> +	struct drm_device *base = &kms->base;
> +	struct drm_bridge *bridge;
>  	int err;
>  
> -	err = drm_crtc_init_with_planes(&kms->base, crtc,
> +	err = drm_crtc_init_with_planes(base, crtc,
>  					get_crtc_primary(kms, kcrtc), NULL,
>  					&komeda_crtc_funcs, NULL);
>  	if (err)
> @@ -625,6 +629,23 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  
>  	crtc->port = kcrtc->master->of_output_port;
>  
> +
> +	/* Construct an encoder for each pipeline and attach it to the remote
> +	 * bridge
> +	 */
> +	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
> +	err = drm_simple_encoder_init(base, &kcrtc->encoder,
> +				      DRM_MODE_ENCODER_TMDS);
> +	if (err)
> +		return err;
> +
> +	bridge = devm_drm_of_get_bridge(base->dev, kcrtc->master->of_node,
> +					KOMEDA_OF_PORT_OUTPUT, 0);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
> +
> +	err = drm_bridge_attach(&kcrtc->encoder, bridge, NULL, 0);
> +
>  	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
>  
>  	return err;
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index 9fce4239d4ad4..98e7ca1ad8fe7 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -7,7 +7,6 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
> -#include <linux/component.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_module.h>
> @@ -27,13 +26,11 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
>  	return mdrv ? mdrv->mdev : NULL;
>  }
>  
> -static void komeda_unbind(struct device *dev)
> +static int komeda_platform_remove(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>  
> -	if (!mdrv)
> -		return;
> -
>  	komeda_kms_detach(mdrv->kms);
>  
>  	if (pm_runtime_enabled(dev))
> @@ -45,10 +42,13 @@ static void komeda_unbind(struct device *dev)
>  
>  	dev_set_drvdata(dev, NULL);
>  	devm_kfree(dev, mdrv);
> +
> +	return 0;
>  }
>  
> -static int komeda_bind(struct device *dev)
> +static int komeda_platform_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct komeda_drv *mdrv;
>  	int err;
>  
> @@ -88,52 +88,7 @@ static int komeda_bind(struct device *dev)
>  free_mdrv:
>  	devm_kfree(dev, mdrv);
>  	return err;
> -}
> -
> -static const struct component_master_ops komeda_master_ops = {
> -	.bind	= komeda_bind,
> -	.unbind	= komeda_unbind,
> -};
>  
> -static void komeda_add_slave(struct device *master,
> -			     struct component_match **match,
> -			     struct device_node *np,
> -			     u32 port, u32 endpoint)
> -{
> -	struct device_node *remote;
> -
> -	remote = of_graph_get_remote_node(np, port, endpoint);
> -	if (remote) {
> -		drm_of_component_match_add(master, match, component_compare_of, remote);
> -		of_node_put(remote);
> -	}
> -}
> -
> -static int komeda_platform_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct component_match *match = NULL;
> -	struct device_node *child;
> -
> -	if (!dev->of_node)
> -		return -ENODEV;
> -
> -	for_each_available_child_of_node(dev->of_node, child) {
> -		if (of_node_cmp(child->name, "pipeline") != 0)
> -			continue;
> -
> -		/* add connector */
> -		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 0);
> -		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 1);
> -	}
> -
> -	return component_master_add_with_match(dev, &komeda_master_ops, match);
> -}
> -
> -static int komeda_platform_remove(struct platform_device *pdev)
> -{
> -	component_master_del(&pdev->dev, &komeda_master_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id komeda_of_match[] = {
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 451746ebbe713..95eb53c284366 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -4,7 +4,6 @@
>   * Author: James.Qian.Wang <james.qian.wang@arm.com>
>   *
>   */
> -#include <linux/component.h>
>  #include <linux/interrupt.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -307,17 +306,13 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  	if (err)
>  		goto cleanup_mode_config;
>  
> -	err = component_bind_all(mdev->dev, kms);
> -	if (err)
> -		goto cleanup_mode_config;
> -
>  	drm_mode_config_reset(drm);
>  
>  	err = devm_request_irq(drm->dev, mdev->irq,
>  			       komeda_kms_irq_handler, IRQF_SHARED,
>  			       drm->driver->name, drm);
>  	if (err)
> -		goto free_component_binding;
> +		goto cleanup_mode_config;
>  
>  	drm_kms_helper_poll_init(drm);
>  
> @@ -329,8 +324,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  
>  free_interrupts:
>  	drm_kms_helper_poll_fini(drm);
> -free_component_binding:
> -	component_unbind_all(mdev->dev, drm);
>  cleanup_mode_config:
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
> @@ -346,7 +339,6 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
>  	drm_dev_unregister(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
> -	component_unbind_all(mdev->dev, drm);
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
>  	drm->dev_private = NULL;
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 7339339ef6b87..9b070d504f4ad 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -85,6 +85,9 @@ struct komeda_crtc {
>  
>  	/** @disable_done: this flip_done is for tracing the disable */
>  	struct completion *disable_done;
> +
> +	/** @encoder: encoder at the end of the pipeline */
> +	struct drm_encoder encoder;
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
