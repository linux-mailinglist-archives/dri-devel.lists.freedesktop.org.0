Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61066742384
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 11:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9110E099;
	Thu, 29 Jun 2023 09:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64E3410E099
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 09:51:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ECADC14
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 02:52:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4F123F663
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 02:51:35 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:51:33 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Faiz Abbas <faiz.abbas@arm.com>
Subject: Re: [PATCH] drm/arm/komeda: Remove component framework and add a
 simple encoder
Message-ID: <ZJ1UJaNJese6g2Ia@e110455-lin.cambridge.arm.com>
References: <20230621084116.26882-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621084116.26882-1-faiz.abbas@arm.com>
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

Thanks for the patch and for addressing what was at some moment on my "nice to
improve / cleanup" list. Sorry for the delay in responding, I had to revive
the bits of an old setup to be able to test this properly, with 2 encoders
attached.

On Wed, Jun 21, 2023 at 02:11:16PM +0530, Faiz Abbas wrote:
> The Komeda driver always expects the remote connector node to initialize
> an encoder. It uses the component aggregator framework which consists
> of component->bind() calls used to initialize the remote encoder and attach
> it to the crtc. This is different from other drm implementations which expect
> the display driver to supply a crtc and connect an encoder to it.

I think both approaches are valid in DRM. We don't want to remove the component
framework because it is doing the wrong thing, but because we cannot use it
with drivers that implement the drm_bridge API. Given that we usually pair with
a component encoder that also implements a drm_bridge, dropping support for
component framework should not affect the users of the driver.

> 
> Remove all component framework calls from the komeda driver and declare and
> attach an encoder inside komeda_crtc_add().

Unfortunately you haven't removed all component framework calls. The hint for
that is that you have not removed the #include <linux/component.h> line from
any of the files. Specifically, komeda_kms_attach()/detach() still calls
component_unbind_all() which will crash with your patch applied.

> 
> The remote connector driver has to implement the DRM bridge APIs which
> can be used to glue the encoder to the remote connector.
> 
> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 22 +++++++-
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   | 56 ++-----------------
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  4 --
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +
>  4 files changed, 30 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index cea3fd5772b57..144736a69b0ee 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_bridge.h>
>  
>  #include "komeda_dev.h"
>  #include "komeda_kms.h"
> @@ -612,9 +614,11 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
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
> @@ -626,6 +630,22 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  
>  	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);

I would move this line after the bridges are being initialised, just in case in the future
colour management will propagate some info down to the bridges.

>  
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

I'm a bit undecided on whether to make the absence of a bridge here fatal or not.
For the second pipeline it should be possible to act as a slave to the first
pipeline even if it doesn't have a bridge attached, but I need to investigate a
bit more here. The bindings suggest that this is mandatory, so keep it for now.


> +
> +	err = drm_bridge_attach(&kcrtc->encoder, bridge, NULL, 0);
> +
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index 28f76e07dd958..70b1b693c6eff 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -28,13 +28,11 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
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
> @@ -46,10 +44,13 @@ static void komeda_unbind(struct device *dev)
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
> @@ -89,52 +90,7 @@ static int komeda_bind(struct device *dev)
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
> index 62dc64550793e..91cbcb6974021 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -305,10 +305,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
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
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 3a872c2920912..6ef6553263570 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -84,6 +84,9 @@ struct komeda_crtc {
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

Code looks good and turns out swapping drm_bridge for component framework is not that painful. If you send v2
with the comments addressed I should be able to test it now and review the patch much sooner.

One issue I have observed from my testing of your patch is that on `rmmod komeda` we fail to disable the
interrupts after drm_kms_helper_poll_fini() call in komeda_kms_detach(), then we NULL the drm->dev_private
before we get an interrupt which causes komeda_kms_irq_handler() to access the NULL pointer. This is not
something caused by your patch, but if you want to test module removal I think you should be aware of this.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
