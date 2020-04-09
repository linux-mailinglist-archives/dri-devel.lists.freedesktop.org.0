Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B41A3605
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC096EBCC;
	Thu,  9 Apr 2020 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40EE6EBD5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 14:34:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id ED35F20029;
 Thu,  9 Apr 2020 16:34:49 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:34:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] drm: pl111: Move VExpress setup into versatile init
Message-ID: <20200409143448.GC4673@ravnborg.org>
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409013947.12667-4-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=-VAfIpHNAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=JXkyV6Z2wAxNnFGdFEwA:9
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

On Wed, Apr 08, 2020 at 07:39:47PM -0600, Rob Herring wrote:
> Since the VExpress setup in pl111_vexpress.c is now just a single
> function call, let's move it into pl111_versatile.c and we can further
> simplify pl111_versatile_init() by moving the other pieces for VExpress
> into pl111_vexpress_clcd_init().
> 
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
Patch looks good - nits below, but anyway:

Acked-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  drivers/gpu/drm/pl111/Makefile          |   1 -
>  drivers/gpu/drm/pl111/pl111_versatile.c | 122 ++++++++++++++++++++----
>  drivers/gpu/drm/pl111/pl111_vexpress.c  |  96 -------------------
>  drivers/gpu/drm/pl111/pl111_vexpress.h  |  22 -----
>  4 files changed, 102 insertions(+), 139 deletions(-)
>  delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.c
>  delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.h
> 
> diff --git a/drivers/gpu/drm/pl111/Makefile b/drivers/gpu/drm/pl111/Makefile
> index 0c70f0e91d21..67d430d433e0 100644
> --- a/drivers/gpu/drm/pl111/Makefile
> +++ b/drivers/gpu/drm/pl111/Makefile
> @@ -3,7 +3,6 @@ pl111_drm-y +=	pl111_display.o \
>  		pl111_versatile.o \
>  		pl111_drv.o
>  
> -pl111_drm-$(CONFIG_ARCH_VEXPRESS) += pl111_vexpress.o
>  pl111_drm-$(CONFIG_ARCH_NOMADIK) += pl111_nomadik.o
>  pl111_drm-$(CONFIG_DEBUG_FS) += pl111_debugfs.o
>  
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 8c2551088f26..1b55f977e945 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -11,7 +11,6 @@
>  #include <linux/vexpress.h>
>  
>  #include "pl111_versatile.h"
> -#include "pl111_vexpress.h"
>  #include "pl111_drm.h"
>  
>  static struct regmap *versatile_syscon_map;
> @@ -309,13 +308,110 @@ static const struct pl111_variant_data pl111_vexpress = {
>  	.broken_clockdivider = true,
>  };
>  
> +#define VEXPRESS_FPGAMUX_MOTHERBOARD		0x00
> +#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
> +#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
> +
> +static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
> +				    struct pl111_drm_dev_private *priv)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *root;
> +	struct device_node *child;
> +	struct device_node *ct_clcd = NULL;
> +	struct regmap *map;
> +	bool has_coretile_clcd = false;
> +	bool has_coretile_hdlcd = false;
> +	bool mux_motherboard = true;
> +	u32 val;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> +		return -ENODEV;
Thats was a simple way to get out of this.
Maybe a WARN() was in place, because should we ever hit this?

> +
> +	/*
> +	 * Check if we have a CLCD or HDLCD on the core tile by checking if a
> +	 * CLCD or HDLCD is available in the root of the device tree.
> +	 */
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -EINVAL;
> +
> +	for_each_available_child_of_node(root, child) {
> +		if (of_device_is_compatible(child, "arm,pl111")) {
> +			has_coretile_clcd = true;
> +			ct_clcd = child;
> +			break;
> +		}
> +		if (of_device_is_compatible(child, "arm,hdlcd")) {
> +			has_coretile_hdlcd = true;
> +			of_node_put(child);
> +			break;
> +		}
> +	}
> +
> +	of_node_put(root);
> +
> +	/*
> +	 * If there is a coretile HDLCD and it has a driver,
> +	 * do not mux the CLCD on the motherboard to the DVI.
> +	 */
> +	if (has_coretile_hdlcd && IS_ENABLED(CONFIG_DRM_HDLCD))
> +		mux_motherboard = false;
> +
> +	/*
> +	 * On the Vexpress CA9 we let the CLCD on the coretile
> +	 * take precedence, so also in this case do not mux the
> +	 * motherboard to the DVI.
> +	 */
> +	if (has_coretile_clcd)
> +		mux_motherboard = false;
> +
> +	if (mux_motherboard) {
> +		dev_info(dev, "DVI muxed to motherboard CLCD\n");
> +		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
> +	} else if (ct_clcd == dev->of_node) {
> +		dev_info(dev,
> +			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
> +		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
> +	} else {
> +		dev_info(dev, "core tile graphics present\n");
> +		dev_info(dev, "this device will be deactivated\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Call into deep Vexpress configuration API */
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev) {
> +		dev_err(dev, "can't find the sysreg device, deferring\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	map = devm_regmap_init_vexpress_config(&pdev->dev);
> +	if (IS_ERR(map)) {
> +		platform_device_put(pdev);
> +		return PTR_ERR(map);
> +	}
> +
> +	ret = regmap_write(map, 0, val);
> +	platform_device_put(pdev);
> +	if (ret) {
> +		dev_err(dev, "error setting DVI muxmode\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->variant = &pl111_vexpress;
> +	dev_info(dev, "initializing Versatile Express PL111\n");
> +
> +	return 0;
> +}
> +
>  int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  {
>  	const struct of_device_id *clcd_id;
>  	enum versatile_clcd versatile_clcd_type;
>  	struct device_node *np;
>  	struct regmap *map;
> -	int ret;
>  
>  	np = of_find_matching_node_and_match(NULL, versatile_clcd_of_match,
>  					     &clcd_id);
> @@ -326,17 +422,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
>  
>  	/* Versatile Express special handling */
> -	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> -		struct platform_device *pdev;
> -		/* Call into deep Vexpress configuration API */
> -		pdev = of_find_device_by_node(np);
> -		if (!pdev) {
> -			dev_err(dev, "can't find the sysreg device, deferring\n");
> -			of_node_put(np);
> -			return -EPROBE_DEFER;
> -		}
> -		map = devm_regmap_init_vexpress_config(&pdev->dev);
> -		platform_device_put(pdev);
> +	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> +		int ret = pl111_vexpress_clcd_init(dev, np, priv);
> +		of_node_put(np);
> +		return ret;
It is often in error situations one return early, but in this case it is
a normal case. Maybe a small comment?


>  	} else {
>  		map = syscon_node_to_regmap(np);
>  	}
> @@ -380,13 +469,6 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  		priv->variant_display_disable = pl111_realview_clcd_disable;
>  		dev_info(dev, "set up callbacks for RealView PL111\n");
>  		break;
> -	case VEXPRESS_CLCD_V2M:
> -		priv->variant = &pl111_vexpress;
> -		dev_info(dev, "initializing Versatile Express PL111\n");
> -		ret = pl111_vexpress_clcd_init(dev, priv, map);
> -		if (ret)
> -			return ret;
> -		break;

The switch no longer includes VEXPRESS_CLCD_V2M - because we will never
reach the switch in this case.
I guess some gcc falgs may cause a warning that not all enums are
accounted for. But then again, the default may supress it.

Anyway, I noticed so you got a comment.
I think current code is fine.

	Sam


>  	default:
>  		dev_info(dev, "unknown Versatile system controller\n");
>  		break;
> diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
> deleted file mode 100644
> index 37ed3f1da820..000000000000
> --- a/drivers/gpu/drm/pl111/pl111_vexpress.c
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Versatile Express PL111 handling
> - * Copyright (C) 2018 Linus Walleij
> - *
> - * This module binds to the "arm,vexpress-muxfpga" device on the
> - * Versatile Express configuration bus and sets up which CLCD instance
> - * gets muxed out on the DVI bridge.
> - */
> -#include <linux/device.h>
> -#include <linux/module.h>
> -#include <linux/regmap.h>
> -#include <linux/vexpress.h>
> -#include <linux/platform_device.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> -#include "pl111_drm.h"
> -#include "pl111_vexpress.h"
> -
> -#define VEXPRESS_FPGAMUX_MOTHERBOARD		0x00
> -#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
> -#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
> -
> -int pl111_vexpress_clcd_init(struct device *dev,
> -			     struct pl111_drm_dev_private *priv,
> -			     struct regmap *map)
> -{
> -	struct device_node *root;
> -	struct device_node *child;
> -	struct device_node *ct_clcd = NULL;
> -	bool has_coretile_clcd = false;
> -	bool has_coretile_hdlcd = false;
> -	bool mux_motherboard = true;
> -	u32 val;
> -	int ret;
> -
> -	/*
> -	 * Check if we have a CLCD or HDLCD on the core tile by checking if a
> -	 * CLCD or HDLCD is available in the root of the device tree.
> -	 */
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return -EINVAL;
> -
> -	for_each_available_child_of_node(root, child) {
> -		if (of_device_is_compatible(child, "arm,pl111")) {
> -			has_coretile_clcd = true;
> -			ct_clcd = child;
> -			break;
> -		}
> -		if (of_device_is_compatible(child, "arm,hdlcd")) {
> -			has_coretile_hdlcd = true;
> -			of_node_put(child);
> -			break;
> -		}
> -	}
> -
> -	of_node_put(root);
> -
> -	/*
> -	 * If there is a coretile HDLCD and it has a driver,
> -	 * do not mux the CLCD on the motherboard to the DVI.
> -	 */
> -	if (has_coretile_hdlcd && IS_ENABLED(CONFIG_DRM_HDLCD))
> -		mux_motherboard = false;
> -
> -	/*
> -	 * On the Vexpress CA9 we let the CLCD on the coretile
> -	 * take precedence, so also in this case do not mux the
> -	 * motherboard to the DVI.
> -	 */
> -	if (has_coretile_clcd)
> -		mux_motherboard = false;
> -
> -	if (mux_motherboard) {
> -		dev_info(dev, "DVI muxed to motherboard CLCD\n");
> -		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
> -	} else if (ct_clcd == dev->of_node) {
> -		dev_info(dev,
> -			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
> -		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
> -	} else {
> -		dev_info(dev, "core tile graphics present\n");
> -		dev_info(dev, "this device will be deactivated\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = regmap_write(map, 0, val);
> -	if (ret) {
> -		dev_err(dev, "error setting DVI muxmode\n");
> -		return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.h b/drivers/gpu/drm/pl111/pl111_vexpress.h
> deleted file mode 100644
> index bb54864ca91e..000000000000
> --- a/drivers/gpu/drm/pl111/pl111_vexpress.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -struct device;
> -struct pl111_drm_dev_private;
> -struct regmap;
> -
> -#ifdef CONFIG_ARCH_VEXPRESS
> -
> -int pl111_vexpress_clcd_init(struct device *dev,
> -			     struct pl111_drm_dev_private *priv,
> -			     struct regmap *map);
> -
> -#else
> -
> -static inline int pl111_vexpress_clcd_init(struct device *dev,
> -					   struct pl111_drm_dev_private *priv,
> -					   struct regmap *map)
> -{
> -	return -ENODEV;
> -}
> -
> -#endif
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
