Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725C721766
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 15:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5D810E06B;
	Sun,  4 Jun 2023 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A55810E06B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 13:26:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp
 [126.166.129.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8B5D2CF;
 Sun,  4 Jun 2023 15:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685885139;
 bh=k1erwYPQAWTg50eT/0A3oZ75+86lQmB6B0KQcxSHOgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ceWnev0Ap+lX6ohoWyGW9va8wSoHrzdUe/k31wLB5e1uyI+FnvrY/rXvcSMhXFPE+
 9XeTOoy2xA00i4UmtFStgrFG0hN1y6Cubjkl83XICM8KbM+Q6o8x6nHVkaleOm31Ej
 Xx0kbiMtl5HtjnKTo4woBshm7TJ96sO7v+ZYUy1Q=
Date: Sun, 4 Jun 2023 16:26:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/bridge: imx: fix mixed module-builtin object
Message-ID: <20230604132602.GB7754@pendragon.ideasonboard.com>
References: <20230604075713.1027261-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230604075713.1027261-1-masahiroy@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nick Terrell <terrelln@fb.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Yamada-san,

Thank you for the patch.

On Sun, Jun 04, 2023 at 04:57:12PM +0900, Masahiro Yamada wrote:
> With CONFIG_DRM_IMX8QM_LDB=m and CONFIG_DRM_IMX8QXP_LDB=y (or vice
> versa), imx-ldb-helper.o is linked to a module and also to vmlinux
> even though the expected CFLAGS are different between builtins and
> modules.
> 
> This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
> Fixing mixed module-builtin objects").
> 
> Split imx-ldb-helper.c into a separate module.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>  - Add a separate module instead of making the functions static inline
> 
>  drivers/gpu/drm/bridge/imx/Kconfig          |  5 +++++
>  drivers/gpu/drm/bridge/imx/Makefile         |  5 +++--
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 20 ++++++++++++++++++++
>  3 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 608f47f41bcd..9fae28db6aa7 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -1,9 +1,13 @@
>  if ARCH_MXC || COMPILE_TEST
>  
> +config DRM_IMX_LDB_HELPER
> +	tristate
> +
>  config DRM_IMX8QM_LDB
>  	tristate "Freescale i.MX8QM LVDS display bridge"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_IMX_LDB_HELPER
>  	select DRM_KMS_HELPER
>  	help
>  	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
> @@ -13,6 +17,7 @@ config DRM_IMX8QXP_LDB
>  	tristate "Freescale i.MX8QXP LVDS display bridge"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_IMX_LDB_HELPER
>  	select DRM_KMS_HELPER
>  	help
>  	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index aa90ec8d5433..5fc821278693 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,7 +1,8 @@
> -imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
> +obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
> +imx8qm-ldb-objs := imx8qm-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  
> -imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
> +imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>  
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> index 7338b84bc83d..7382cb1fbfd7 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> @@ -4,8 +4,10 @@
>   * Copyright 2019,2020,2022 NXP
>   */
>  
> +#include <linux/export.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
>  
> @@ -15,16 +17,20 @@
>  
>  #include "imx-ldb-helper.h"
>  
> +#define DRIVER_NAME		"imx-ldb-helper"
> +
>  bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
>  {
>  	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
>  }
> +EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
>  
>  bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
>  {
>  	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
>  	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
>  }
> +EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
>  
>  int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
>  				   struct drm_bridge_state *bridge_state,
> @@ -38,6 +44,7 @@ int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
>  
>  void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
>  				const struct drm_display_mode *mode,
> @@ -69,6 +76,7 @@ void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
>  		break;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
>  
>  void ldb_bridge_enable_helper(struct drm_bridge *bridge)
>  {
> @@ -81,6 +89,7 @@ void ldb_bridge_enable_helper(struct drm_bridge *bridge)
>  	 */
>  	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
>  }
> +EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
>  
>  void ldb_bridge_disable_helper(struct drm_bridge *bridge)
>  {
> @@ -95,6 +104,7 @@ void ldb_bridge_disable_helper(struct drm_bridge *bridge)
>  
>  	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
>  }
> +EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
>  
>  int ldb_bridge_attach_helper(struct drm_bridge *bridge,
>  			     enum drm_bridge_attach_flags flags)
> @@ -117,6 +127,7 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
>  				ldb_ch->next_bridge, bridge,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  }
> +EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
>  
>  int ldb_init_helper(struct ldb *ldb)
>  {
> @@ -157,6 +168,7 @@ int ldb_init_helper(struct ldb *ldb)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(ldb_init_helper);
>  
>  int ldb_find_next_bridge_helper(struct ldb *ldb)
>  {
> @@ -184,6 +196,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
>  
>  void ldb_add_bridge_helper(struct ldb *ldb,
>  			   const struct drm_bridge_funcs *bridge_funcs)
> @@ -204,6 +217,7 @@ void ldb_add_bridge_helper(struct ldb *ldb,
>  		drm_bridge_add(&ldb_ch->bridge);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
>  
>  void ldb_remove_bridge_helper(struct ldb *ldb)
>  {
> @@ -219,3 +233,9 @@ void ldb_remove_bridge_helper(struct ldb *ldb)
>  		drm_bridge_remove(&ldb_ch->bridge);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
> +
> +MODULE_DESCRIPTION("i.MX8 LVDS Display Bridge(LDB)/Pixel Mapper bridge helper");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRIVER_NAME);

Is the alias needed ? With that fixed (if needed),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
