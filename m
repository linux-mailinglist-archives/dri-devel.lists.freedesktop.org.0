Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F6AC52BE
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99810E523;
	Tue, 27 May 2025 16:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="C/vAoEXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8910E523
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 16:13:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748362373; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NtLpvLpQ2cD63d250UpW91ucrcTkFj1f268fArWsk1u0o/kHwWNsaYZSuleG296zWy3w8a7PG18svX8qDwOhyaemO3eVLgjRsbTCn7KxRn+0a1DbBvUefz7VfffP1yqe6c3uCcTLXJOrpypVF4vIhjd7k9h/QU29ZgelazuHqGg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748362373;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MvbyqxXVQNHC5mh6gd7gRMge22HJjHVERWcwOyMawoE=; 
 b=Vyox1T7l5q/yil934iO+YkaxMAvKkeRaD7cqrreD9GitZ7Mr16O2LXJ3Fm3Oo4aJefi/slTn11y52TYxRAe4Qw618h3J13rWiZV1/GHJX47qF/yDC0Q3vQQmfLIiLpzYhG1YcIcZlxwgM22ZhV/s/0UnB69YG9hs6iILScA1rTU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748362373; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=MvbyqxXVQNHC5mh6gd7gRMge22HJjHVERWcwOyMawoE=;
 b=C/vAoEXaySIIVAT1HZQUZly5ajYDs7+nr4uXNyc2cQLvEjQVIZ/hOUJeJGWaKZYe
 srPw5HghmqrPUS3MWNv8STkH6nrwjVcUyOwF8rPGPMR/UX5/jXHjl2c8YROE7yoXIrA
 Cl1W+kaVJNWEPDecgKuNg6i12tqaN9SEDEH5cFtk=
Received: by mx.zohomail.com with SMTPS id 1748362370680719.5901778529433;
 Tue, 27 May 2025 09:12:50 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 Dmitry Baryshkov <lumag@kernel.org>, stephen@radxa.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, yubing.zhang@rock-chips.com, naoki@radxa.com,
 Laurent.pinchart@ideasonboard.com, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/9] drm/rockchip: Add RK3588 DPTX output support
Date: Tue, 27 May 2025 18:12:43 +0200
Message-ID: <2278911.CQOukoFCf9@workhorse>
In-Reply-To: <20250403033748.245007-4-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

thank you for the driver. I'll leave some review comments inline. I don't
have specific knowledge on the DRM subsystem so my comments will be of more
general nature.

On Thursday, 3 April 2025 05:37:31 Central European Summer Time Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add driver extension for Synopsys DesignWare DPTX IP used
> on Rockchip RK3588 SoC.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Acked-by: Dmitry Baryshkov <lumag@kernel.org>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - no include uapi path
> - switch to drmm_encoder_init
> 
>  drivers/gpu/drm/rockchip/Kconfig            |   9 ++
>  drivers/gpu/drm/rockchip/Makefile           |   1 +
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c   | 154 ++++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |   1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h |   1 +
>  5 files changed, 166 insertions(+)
>  create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 26c4410b2407c..00315cc6be5a8 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
>  	select DRM_PANEL
>  	select VIDEOMODE_HELPERS
>  	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> +	select DRM_DW_DP if ROCKCHIP_DW_DP
>  	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>  	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>  	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> @@ -58,6 +59,14 @@ config ROCKCHIP_CDN_DP
>  	  RK3399 based SoC, you should select this
>  	  option.
>  
> +config ROCKCHIP_DW_DP
> +	bool "Rockchip specific extensions for Synopsys DW DP"
> +	help
> +	  This selects support for Rockchip SoC specific extensions
> +	  to enable Synopsys DesignWare Cores based DisplayPort transmit
> +	  controller support on Rockchip SoC, If you want to enable DP on
> +	  rk3588 based SoC, you should select this option.
> +
>  config ROCKCHIP_DW_HDMI
>  	bool "Rockchip specific extensions for Synopsys DW HDMI"
>  	help
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index 2b867cebbc121..097f062399c7a 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -14,6 +14,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) += dw-mipi-dsi2-rockchip.o
> +rockchipdrm-$(CONFIG_ROCKCHIP_DW_DP) += dw_dp-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> new file mode 100644
> index 0000000000000..5ff8a6a54997e
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020 Rockchip Electronics Co., Ltd.
> + *
> + * Author: Zhang Yubing <yubing.zhang@rock-chips.com>
> + * Author: Andy Yan <andy.yan@rock-chips.com>
> + */
> +
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <drm/bridge/dw_dp.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>

I think there's a missing #include <drm/display/drm_dp_helper.h> here. It
gets pulled in implicitly in most configurations, but I think this is what
the s390 build failure from the kernel test robot report is about.

> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
> +
> +#include "rockchip_drm_drv.h"
> +#include "rockchip_drm_vop.h"
> +
> +struct rockchip_dw_dp {
> +	struct dw_dp *base;
> +	struct device *dev;
> +	struct rockchip_encoder encoder;
> +};
> +
> +static inline struct rockchip_dw_dp *encoder_to_dp(struct drm_encoder *encoder)
> +{
> +	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> +
> +	return container_of(rkencoder, struct rockchip_dw_dp, encoder);
> +}

This function appears to be unused, and will generate a warning:

  linux/drivers/gpu/drm/rockchip/dw_dp-rockchip.c:33:38: warning: unused
  function 'encoder_to_dp' [-Wunused-function]

I assume it may be used in a follow-up series. I think it's fine to add it
there when it's needed and avoid the warning for now by removing it.

> +
> +static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
> +	struct drm_atomic_state *state = conn_state->state;
> +	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct drm_bridge *bridge  = drm_bridge_chain_get_first_bridge(encoder);
> +	struct drm_bridge_state *bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	u32 bus_format = bridge_state->input_bus_cfg.format;
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +		s->output_mode = ROCKCHIP_OUT_MODE_YUV420;
> +		break;
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		s->output_mode = ROCKCHIP_OUT_MODE_S888_DUMMY;
> +		break;
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	default:
> +		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
> +		break;
> +	}
> +
> +	s->output_type = DRM_MODE_CONNECTOR_DisplayPort;
> +	s->bus_format = bus_format;
> +	s->bus_flags = di->bus_flags;
> +	s->color_space = V4L2_COLORSPACE_DEFAULT;

Reading the VOP2 code s->color_space gets read by, it seems this results
in the output always using BT.709 as the colour space in YUV output mode.
Is my understanding of the code correct?

I don't know if DP 1.4 is limited with regards to HDR or if this is just
left for later to implement, but BT.709 in the case of an HDR RGB VOP
input seems wrong, unless VOP2 sets the output color_space to something like
BT.2020 or similar in the case of output_mode == ROCKCHIP_OUT_MODE_AAAA and
I'm not seeing it.

> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
> +	.atomic_check		= dw_dp_encoder_atomic_check,
> +};
> +
> +static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct dw_dp_plat_data plat_data;
> +	struct drm_device *drm_dev = data;
> +	struct rockchip_dw_dp *dp;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> +	if (!dp)
> +		return -ENOMEM;
> +
> +	dp->dev = dev;
> +	plat_data.max_link_rate = 810000;
> +	encoder = &dp->encoder.encoder;
> +	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
> +	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
> +
> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
> +		return ret;
> +	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
> +
> +	dp->base = dw_dp_bind(dev, encoder, &plat_data);
> +	if (IS_ERR(dp->base)) {
> +		ret = PTR_ERR(dp->base);
> +		return ret;
> +	}
> +
> +	connector = drm_bridge_connector_init(drm_dev, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		return dev_err_probe(dev, ret, "Failed to init bridge connector");
> +	}
> +
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return 0;
> +}
> +
> +static const struct component_ops dw_dp_rockchip_component_ops = {
> +	.bind = dw_dp_rockchip_bind,
> +};
> +
> +static int dw_dp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	return component_add(dev, &dw_dp_rockchip_component_ops);
> +}
> +
> +static void dw_dp_remove(struct platform_device *pdev)
> +{
> +	struct rockchip_dw_dp *dp = platform_get_drvdata(pdev);

Does one of the helper functions or something else set drvdata? Otherwise
I don't see how this is ever non-null.

> +
> +	component_del(dp->dev, &dw_dp_rockchip_component_ops);
> +}
> +
> +static const struct of_device_id dw_dp_of_match[] = {
> +	{ .compatible = "rockchip,rk3588-dp", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dw_dp_of_match);
> +
> +struct platform_driver dw_dp_driver = {
> +	.probe	= dw_dp_probe,
> +	.remove = dw_dp_remove,
> +	.driver = {
> +		.name = "dw-dp",
> +		.of_match_table = dw_dp_of_match,
> +	},
> +};
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index ed88788e04dd2..687bb7b252e8e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -531,6 +531,7 @@ static int __init rockchip_drm_init(void)
>  	ADD_ROCKCHIP_SUB_DRIVER(rockchip_dp_driver,
>  				CONFIG_ROCKCHIP_ANALOGIX_DP);
>  	ADD_ROCKCHIP_SUB_DRIVER(cdn_dp_driver, CONFIG_ROCKCHIP_CDN_DP);
> +	ADD_ROCKCHIP_SUB_DRIVER(dw_dp_driver, CONFIG_ROCKCHIP_DW_DP);
>  	ADD_ROCKCHIP_SUB_DRIVER(dw_hdmi_rockchip_pltfm_driver,
>  				CONFIG_ROCKCHIP_DW_HDMI);
>  	ADD_ROCKCHIP_SUB_DRIVER(dw_hdmi_qp_rockchip_pltfm_driver,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> index c183e82a42a51..2e86ad00979c4 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -87,6 +87,7 @@ int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rencoder,
>  					      struct device_node *np, int port, int reg);
>  int rockchip_drm_endpoint_is_subdriver(struct device_node *ep);
>  extern struct platform_driver cdn_dp_driver;
> +extern struct platform_driver dw_dp_driver;
>  extern struct platform_driver dw_hdmi_rockchip_pltfm_driver;
>  extern struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver;
>  extern struct platform_driver dw_mipi_dsi_rockchip_driver;
> 

Other than that, the driver looks great, thank you! I've tested it on my
ROCK 5T over DP altmode, where it correctly interfaces with a DP monitor
I have through an alt-mode adapter. So feel free to add a

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli



