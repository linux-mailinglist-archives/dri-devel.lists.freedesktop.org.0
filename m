Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11ED1A35A7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E176EBC1;
	Thu,  9 Apr 2020 14:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5D6EBC1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 14:16:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1998A2008E;
 Thu,  9 Apr 2020 16:16:05 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:16:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] drm: pl111: Simplify vexpress init
Message-ID: <20200409141603.GB4673@ravnborg.org>
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409013947.12667-3-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=-VAfIpHNAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=p5rtVDZEVmgweJBV8HQA:9
 a=CjuIK1q_8ugA:10 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

On Wed, Apr 08, 2020 at 07:39:46PM -0600, Rob Herring wrote:
> The init VExpress variants currently instantiates a 'muxfpga' driver for
> the sole purpose of getting a regmap for it. There's no reason to
> instantiate a driver and doing so just complicates things. The muxfpga
> driver also isn't unregistered properly on module unload. Let's
> just simplify all this this by just calling
> devm_regmap_init_vexpress_config() directly.
> 
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Procastinating, so I took a look at this.
Nice simplification - on nit below.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/pl111/pl111_versatile.c | 21 +++----------
>  drivers/gpu/drm/pl111/pl111_vexpress.c  | 42 -------------------------
>  drivers/gpu/drm/pl111/pl111_vexpress.h  |  7 -----
>  3 files changed, 4 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 09aeaffb7660..8c2551088f26 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/regmap.h>
> +#include <linux/vexpress.h>
>  
>  #include "pl111_versatile.h"
>  #include "pl111_vexpress.h"
> @@ -325,17 +326,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
>  
>  	/* Versatile Express special handling */
> -	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> +	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
>  		struct platform_device *pdev;
> -
> -		/* Registers a driver for the muxfpga */
> -		ret = vexpress_muxfpga_init();
> -		if (ret) {
> -			dev_err(dev, "unable to initialize muxfpga driver\n");
> -			of_node_put(np);
> -			return ret;
> -		}
> -
>  		/* Call into deep Vexpress configuration API */
>  		pdev = of_find_device_by_node(np);
>  		if (!pdev) {
> @@ -343,13 +335,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  			of_node_put(np);
>  			return -EPROBE_DEFER;
>  		}
> -		map = dev_get_drvdata(&pdev->dev);
> -		if (!map) {
> -			dev_err(dev, "sysreg has not yet probed\n");
> -			platform_device_put(pdev);
> -			of_node_put(np);
> -			return -EPROBE_DEFER;
> -		}
> +		map = devm_regmap_init_vexpress_config(&pdev->dev);
> +		platform_device_put(pdev);
>  	} else {
>  		map = syscon_node_to_regmap(np);
>  	}

On the following line there is:
	if (IS_ERR(map)) {
                dev_err(dev, "no Versatile syscon regmap\n");
                return PTR_ERR(map);
        }

The error message no longer tell if this was
devm_regmap_init_vexpress_config() or syscon_node_to_regmap() that
caused the error.

	Sam

> diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
> index 350570fe06b5..37ed3f1da820 100644
> --- a/drivers/gpu/drm/pl111/pl111_vexpress.c
> +++ b/drivers/gpu/drm/pl111/pl111_vexpress.c
> @@ -94,45 +94,3 @@ int pl111_vexpress_clcd_init(struct device *dev,
>  
>  	return 0;
>  }
> -
> -/*
> - * This sets up the regmap pointer that will then be retrieved by
> - * the detection code in pl111_versatile.c and passed in to the
> - * pl111_vexpress_clcd_init() function above.
> - */
> -static int vexpress_muxfpga_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct regmap *map;
> -
> -	map = devm_regmap_init_vexpress_config(&pdev->dev);
> -	if (IS_ERR(map))
> -		return PTR_ERR(map);
> -	dev_set_drvdata(dev, map);
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id vexpress_muxfpga_match[] = {
> -	{ .compatible = "arm,vexpress-muxfpga", },
> -	{}
> -};
> -
> -static struct platform_driver vexpress_muxfpga_driver = {
> -	.driver = {
> -		.name = "vexpress-muxfpga",
> -		.of_match_table = of_match_ptr(vexpress_muxfpga_match),
> -	},
> -	.probe = vexpress_muxfpga_probe,
> -};
> -
> -int vexpress_muxfpga_init(void)
> -{
> -	int ret;
> -
> -	ret = platform_driver_register(&vexpress_muxfpga_driver);
> -	/* -EBUSY just means this driver is already registered */
> -	if (ret == -EBUSY)
> -		ret = 0;
> -	return ret;
> -}
> diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.h b/drivers/gpu/drm/pl111/pl111_vexpress.h
> index 5d3681bb4c00..bb54864ca91e 100644
> --- a/drivers/gpu/drm/pl111/pl111_vexpress.h
> +++ b/drivers/gpu/drm/pl111/pl111_vexpress.h
> @@ -10,8 +10,6 @@ int pl111_vexpress_clcd_init(struct device *dev,
>  			     struct pl111_drm_dev_private *priv,
>  			     struct regmap *map);
>  
> -int vexpress_muxfpga_init(void);
> -
>  #else
>  
>  static inline int pl111_vexpress_clcd_init(struct device *dev,
> @@ -21,9 +19,4 @@ static inline int pl111_vexpress_clcd_init(struct device *dev,
>  	return -ENODEV;
>  }
>  
> -static inline int vexpress_muxfpga_init(void)
> -{
> -	return 0;
> -}
> -
>  #endif
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
