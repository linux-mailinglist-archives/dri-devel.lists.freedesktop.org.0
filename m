Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754D7214B1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 06:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196D010E0D7;
	Sun,  4 Jun 2023 04:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7472C10E0D7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 04:52:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126166129043.28.openmobile.ne.jp
 [126.166.129.43])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FCFB2B6;
 Sun,  4 Jun 2023 06:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685854299;
 bh=QPHswfyHFlgag4yNECPy2EtKkjH7od8N3LgUR5wJUDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CXVlKHbGWHqtH7Zv5UUlvR0Y1a8KDqc8NJNBDZKzQ+B/j/K6Xb+JazDVDidcn0mfa
 mo2/nAUbCAUD3m4/kYleknrEMZOSdTy+TtxAy/v/SphX4t3tp91tct7NHDOJCwz1FE
 TZ+nlekz1WJonpvZB71w4cctTbCI0V+DUVRs2s9E=
Date: Sun, 4 Jun 2023 07:52:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] drm/bridge: imx: fix mixed module-builtin object
Message-ID: <20230604045202.GA29881@pendragon.ideasonboard.com>
References: <20230603170747.1753842-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230603170747.1753842-1-masahiroy@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nick Terrell <terrelln@fb.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yamada-san,

Thank you for the patch.

On Sun, Jun 04, 2023 at 02:07:46AM +0900, Masahiro Yamada wrote:
> With CONFIG_DRM_IMX8QM_LDB=m and CONFIG_DRM_IMX8QXP_LDB=y (or vice
> versa), imx-ldb-helper.o is linked to a module and also to vmlinux
> even though the expected CFLAGS are different between builtins and
> modules.
> 
> This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
> Fixing mixed module-builtin objects").
> 
> Turn helpers in imx-ldb-helper.c into inline functions.

Wouldn't it be better to turn it into a module ? It could then be
built-in for the above configuration, are compiled as a module when all
its users are module as well.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/gpu/drm/bridge/imx/Makefile         |   4 +-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 221 --------------------
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h | 213 +++++++++++++++++--
>  3 files changed, 197 insertions(+), 241 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index aa90ec8d5433..64b93009376a 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,7 +1,7 @@
> -imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
> +imx8qm-ldb-objs := imx8qm-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  
> -imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
> +imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>  
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> deleted file mode 100644
> index 7338b84bc83d..000000000000
> --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> +++ /dev/null
> @@ -1,221 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (C) 2012 Sascha Hauer, Pengutronix
> - * Copyright 2019,2020,2022 NXP
> - */
> -
> -#include <linux/media-bus-format.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/of.h>
> -#include <linux/regmap.h>
> -
> -#include <drm/drm_bridge.h>
> -#include <drm/drm_of.h>
> -#include <drm/drm_print.h>
> -
> -#include "imx-ldb-helper.h"
> -
> -bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> -{
> -	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> -}
> -
> -bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> -{
> -	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> -	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> -}
> -
> -int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> -				   struct drm_bridge_state *bridge_state,
> -				   struct drm_crtc_state *crtc_state,
> -				   struct drm_connector_state *conn_state)
> -{
> -	struct ldb_channel *ldb_ch = bridge->driver_private;
> -
> -	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> -	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
> -
> -	return 0;
> -}
> -
> -void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> -				const struct drm_display_mode *mode,
> -				const struct drm_display_mode *adjusted_mode)
> -{
> -	struct ldb_channel *ldb_ch = bridge->driver_private;
> -	struct ldb *ldb = ldb_ch->ldb;
> -	bool is_split = ldb_channel_is_split_link(ldb_ch);
> -
> -	if (is_split)
> -		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
> -
> -	switch (ldb_ch->out_bus_format) {
> -	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> -		break;
> -	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> -		if (ldb_ch->chno == 0 || is_split)
> -			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> -		if (ldb_ch->chno == 1 || is_split)
> -			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> -		break;
> -	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> -		if (ldb_ch->chno == 0 || is_split)
> -			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> -					 LDB_BIT_MAP_CH0_JEIDA;
> -		if (ldb_ch->chno == 1 || is_split)
> -			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> -					 LDB_BIT_MAP_CH1_JEIDA;
> -		break;
> -	}
> -}
> -
> -void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> -{
> -	struct ldb_channel *ldb_ch = bridge->driver_private;
> -	struct ldb *ldb = ldb_ch->ldb;
> -
> -	/*
> -	 * Platform specific bridge drivers should set ldb_ctrl properly
> -	 * for the enablement, so just write the ctrl_reg here.
> -	 */
> -	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> -}
> -
> -void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> -{
> -	struct ldb_channel *ldb_ch = bridge->driver_private;
> -	struct ldb *ldb = ldb_ch->ldb;
> -	bool is_split = ldb_channel_is_split_link(ldb_ch);
> -
> -	if (ldb_ch->chno == 0 || is_split)
> -		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> -	if (ldb_ch->chno == 1 || is_split)
> -		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> -
> -	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> -}
> -
> -int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> -			     enum drm_bridge_attach_flags flags)
> -{
> -	struct ldb_channel *ldb_ch = bridge->driver_private;
> -	struct ldb *ldb = ldb_ch->ldb;
> -
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -		DRM_DEV_ERROR(ldb->dev,
> -			      "do not support creating a drm_connector\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> -		return -ENODEV;
> -	}
> -
> -	return drm_bridge_attach(bridge->encoder,
> -				ldb_ch->next_bridge, bridge,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -}
> -
> -int ldb_init_helper(struct ldb *ldb)
> -{
> -	struct device *dev = ldb->dev;
> -	struct device_node *np = dev->of_node;
> -	struct device_node *child;
> -	int ret;
> -	u32 i;
> -
> -	ldb->regmap = syscon_node_to_regmap(np->parent);
> -	if (IS_ERR(ldb->regmap)) {
> -		ret = PTR_ERR(ldb->regmap);
> -		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> -		return ret;
> -	}
> -
> -	for_each_available_child_of_node(np, child) {
> -		struct ldb_channel *ldb_ch;
> -
> -		ret = of_property_read_u32(child, "reg", &i);
> -		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> -			ret = -EINVAL;
> -			DRM_DEV_ERROR(dev,
> -				      "invalid channel node address: %u\n", i);
> -			of_node_put(child);
> -			return ret;
> -		}
> -
> -		ldb_ch = ldb->channel[i];
> -		ldb_ch->ldb = ldb;
> -		ldb_ch->chno = i;
> -		ldb_ch->is_available = true;
> -		ldb_ch->np = child;
> -
> -		ldb->available_ch_cnt++;
> -	}
> -
> -	return 0;
> -}
> -
> -int ldb_find_next_bridge_helper(struct ldb *ldb)
> -{
> -	struct device *dev = ldb->dev;
> -	struct ldb_channel *ldb_ch;
> -	int ret, i;
> -
> -	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> -		ldb_ch = ldb->channel[i];
> -
> -		if (!ldb_ch->is_available)
> -			continue;
> -
> -		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
> -							     1, 0);
> -		if (IS_ERR(ldb_ch->next_bridge)) {
> -			ret = PTR_ERR(ldb_ch->next_bridge);
> -			if (ret != -EPROBE_DEFER)
> -				DRM_DEV_ERROR(dev,
> -					      "failed to get next bridge: %d\n",
> -					      ret);
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -void ldb_add_bridge_helper(struct ldb *ldb,
> -			   const struct drm_bridge_funcs *bridge_funcs)
> -{
> -	struct ldb_channel *ldb_ch;
> -	int i;
> -
> -	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> -		ldb_ch = ldb->channel[i];
> -
> -		if (!ldb_ch->is_available)
> -			continue;
> -
> -		ldb_ch->bridge.driver_private = ldb_ch;
> -		ldb_ch->bridge.funcs = bridge_funcs;
> -		ldb_ch->bridge.of_node = ldb_ch->np;
> -
> -		drm_bridge_add(&ldb_ch->bridge);
> -	}
> -}
> -
> -void ldb_remove_bridge_helper(struct ldb *ldb)
> -{
> -	struct ldb_channel *ldb_ch;
> -	int i;
> -
> -	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> -		ldb_ch = ldb->channel[i];
> -
> -		if (!ldb_ch->is_available)
> -			continue;
> -
> -		drm_bridge_remove(&ldb_ch->bridge);
> -	}
> -}
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> index a0a5cde27fbc..42e9b4aa8399 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
> @@ -65,32 +65,209 @@ struct ldb {
>  
>  #define bridge_to_ldb_ch(b)	container_of(b, struct ldb_channel, bridge)
>  
> -bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
> -bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
> +static inline bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
> +{
> +	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
> +}
>  
> -int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> -				   struct drm_bridge_state *bridge_state,
> -				   struct drm_crtc_state *crtc_state,
> -				   struct drm_connector_state *conn_state);
> +static inline bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
> +{
> +	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
> +	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
> +}
>  
> -void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> -				const struct drm_display_mode *mode,
> -				const struct drm_display_mode *adjusted_mode);
> +static inline int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
> +						 struct drm_bridge_state *bridge_state,
> +						 struct drm_crtc_state *crtc_state,
> +						 struct drm_connector_state *conn_state)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
>  
> -void ldb_bridge_enable_helper(struct drm_bridge *bridge);
> +	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
> +	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
>  
> -void ldb_bridge_disable_helper(struct drm_bridge *bridge);
> +	return 0;
> +}
>  
> -int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> -			     enum drm_bridge_attach_flags flags);
> +static inline void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
> +					      const struct drm_display_mode *mode,
> +					      const struct drm_display_mode *adjusted_mode)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
>  
> -int ldb_init_helper(struct ldb *ldb);
> +	if (is_split)
> +		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
>  
> -int ldb_find_next_bridge_helper(struct ldb *ldb);
> +	switch (ldb_ch->out_bus_format) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		if (ldb_ch->chno == 0 || is_split)
> +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
> +		if (ldb_ch->chno == 1 || is_split)
> +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		if (ldb_ch->chno == 0 || is_split)
> +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
> +					 LDB_BIT_MAP_CH0_JEIDA;
> +		if (ldb_ch->chno == 1 || is_split)
> +			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
> +					 LDB_BIT_MAP_CH1_JEIDA;
> +		break;
> +	}
> +}
>  
> -void ldb_add_bridge_helper(struct ldb *ldb,
> -			   const struct drm_bridge_funcs *bridge_funcs);
> +static inline void ldb_bridge_enable_helper(struct drm_bridge *bridge)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
>  
> -void ldb_remove_bridge_helper(struct ldb *ldb);
> +	/*
> +	 * Platform specific bridge drivers should set ldb_ctrl properly
> +	 * for the enablement, so just write the ctrl_reg here.
> +	 */
> +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> +}
> +
> +static inline void ldb_bridge_disable_helper(struct drm_bridge *bridge)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +	bool is_split = ldb_channel_is_split_link(ldb_ch);
> +
> +	if (ldb_ch->chno == 0 || is_split)
> +		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
> +	if (ldb_ch->chno == 1 || is_split)
> +		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
> +
> +	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
> +}
> +
> +static inline int ldb_bridge_attach_helper(struct drm_bridge *bridge,
> +					   enum drm_bridge_attach_flags flags)
> +{
> +	struct ldb_channel *ldb_ch = bridge->driver_private;
> +	struct ldb *ldb = ldb_ch->ldb;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		DRM_DEV_ERROR(ldb->dev,
> +			      "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!bridge->encoder) {
> +		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> +		return -ENODEV;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder,
> +				ldb_ch->next_bridge, bridge,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static inline int ldb_init_helper(struct ldb *ldb)
> +{
> +	struct device *dev = ldb->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +	u32 i;
> +
> +	ldb->regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(ldb->regmap)) {
> +		ret = PTR_ERR(ldb->regmap);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for_each_available_child_of_node(np, child) {
> +		struct ldb_channel *ldb_ch;
> +
> +		ret = of_property_read_u32(child, "reg", &i);
> +		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
> +			ret = -EINVAL;
> +			DRM_DEV_ERROR(dev,
> +				      "invalid channel node address: %u\n", i);
> +			of_node_put(child);
> +			return ret;
> +		}
> +
> +		ldb_ch = ldb->channel[i];
> +		ldb_ch->ldb = ldb;
> +		ldb_ch->chno = i;
> +		ldb_ch->is_available = true;
> +		ldb_ch->np = child;
> +
> +		ldb->available_ch_cnt++;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline int ldb_find_next_bridge_helper(struct ldb *ldb)
> +{
> +	struct device *dev = ldb->dev;
> +	struct ldb_channel *ldb_ch;
> +	int ret, i;
> +
> +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +		ldb_ch = ldb->channel[i];
> +
> +		if (!ldb_ch->is_available)
> +			continue;
> +
> +		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
> +							     1, 0);
> +		if (IS_ERR(ldb_ch->next_bridge)) {
> +			ret = PTR_ERR(ldb_ch->next_bridge);
> +			if (ret != -EPROBE_DEFER)
> +				DRM_DEV_ERROR(dev,
> +					      "failed to get next bridge: %d\n",
> +					      ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void ldb_add_bridge_helper(struct ldb *ldb,
> +					 const struct drm_bridge_funcs *bridge_funcs)
> +{
> +	struct ldb_channel *ldb_ch;
> +	int i;
> +
> +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +		ldb_ch = ldb->channel[i];
> +
> +		if (!ldb_ch->is_available)
> +			continue;
> +
> +		ldb_ch->bridge.driver_private = ldb_ch;
> +		ldb_ch->bridge.funcs = bridge_funcs;
> +		ldb_ch->bridge.of_node = ldb_ch->np;
> +
> +		drm_bridge_add(&ldb_ch->bridge);
> +	}
> +}
> +
> +static inline void ldb_remove_bridge_helper(struct ldb *ldb)
> +{
> +	struct ldb_channel *ldb_ch;
> +	int i;
> +
> +	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
> +		ldb_ch = ldb->channel[i];
> +
> +		if (!ldb_ch->is_available)
> +			continue;
> +
> +		drm_bridge_remove(&ldb_ch->bridge);
> +	}
> +}
>  
>  #endif /* __IMX_LDB_HELPER__ */

-- 
Regards,

Laurent Pinchart
