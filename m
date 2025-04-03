Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC2A79A78
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 05:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0F10E8F7;
	Thu,  3 Apr 2025 03:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="dyjKiU+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 123F810E8F9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 03:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=WPxmA
 uWlwYEt4wtgaYwNh/Tud0GDwSZvHrMtJwu1Dsk=; b=dyjKiU+HgkQAKsi63xntR
 3e0VSWDMQDAciLnNJoL0HsYSU1cKrlgwJ9LL5hcNsISEJwx7GIsOro/b4sQt0+wk
 es55QbJKHDXXU3C6jAp30gSdOfDY8eXJy/Di52xIOu0mYXAE0DDva+M+qVxsDwCw
 RQOSQEFWwRGhHLtOCgPEt0=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wBHWgmNAu5n7FfDDg--.28713S5; 
 Thu, 03 Apr 2025 11:37:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v3 3/9] drm/rockchip: Add RK3588 DPTX output support
Date: Thu,  3 Apr 2025 11:37:31 +0800
Message-ID: <20250403033748.245007-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHWgmNAu5n7FfDDg--.28713S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3XrWxJF18Kw4ftr18Kw13CFg_yoWfCrykpa
 nrArWYyrW8Gr4Yqwn7JFs7CFZ0yanFyayxX397C3WSva4IkryUG3sxWr1Dur9xJFW7uF12
 kwsrJ3yUZF47ur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyE_NUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAIkXmft-c-KywAAsp
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

From: Andy Yan <andy.yan@rock-chips.com>

Add driver extension for Synopsys DesignWare DPTX IP used
on Rockchip RK3588 SoC.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Dmitry Baryshkov <lumag@kernel.org>

---

(no changes since v2)

Changes in v2:
- no include uapi path
- switch to drmm_encoder_init

 drivers/gpu/drm/rockchip/Kconfig            |   9 ++
 drivers/gpu/drm/rockchip/Makefile           |   1 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c   | 154 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h |   1 +
 5 files changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 26c4410b2407c..00315cc6be5a8 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -8,6 +8,7 @@ config DRM_ROCKCHIP
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+	select DRM_DW_DP if ROCKCHIP_DW_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
@@ -58,6 +59,14 @@ config ROCKCHIP_CDN_DP
 	  RK3399 based SoC, you should select this
 	  option.
 
+config ROCKCHIP_DW_DP
+	bool "Rockchip specific extensions for Synopsys DW DP"
+	help
+	  This selects support for Rockchip SoC specific extensions
+	  to enable Synopsys DesignWare Cores based DisplayPort transmit
+	  controller support on Rockchip SoC, If you want to enable DP on
+	  rk3588 based SoC, you should select this option.
+
 config ROCKCHIP_DW_HDMI
 	bool "Rockchip specific extensions for Synopsys DW HDMI"
 	help
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 2b867cebbc121..097f062399c7a 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -14,6 +14,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) += dw-mipi-dsi2-rockchip.o
+rockchipdrm-$(CONFIG_ROCKCHIP_DW_DP) += dw_dp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
 rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
 rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
new file mode 100644
index 0000000000000..5ff8a6a54997e
--- /dev/null
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co., Ltd.
+ *
+ * Author: Zhang Yubing <yubing.zhang@rock-chips.com>
+ * Author: Andy Yan <andy.yan@rock-chips.com>
+ */
+
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <drm/bridge/dw_dp.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include <linux/media-bus-format.h>
+#include <linux/videodev2.h>
+
+#include "rockchip_drm_drv.h"
+#include "rockchip_drm_vop.h"
+
+struct rockchip_dw_dp {
+	struct dw_dp *base;
+	struct device *dev;
+	struct rockchip_encoder encoder;
+};
+
+static inline struct rockchip_dw_dp *encoder_to_dp(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct rockchip_dw_dp, encoder);
+}
+
+static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct drm_atomic_state *state = conn_state->state;
+	struct drm_display_info *di = &conn_state->connector->display_info;
+	struct drm_bridge *bridge  = drm_bridge_chain_get_first_bridge(encoder);
+	struct drm_bridge_state *bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	u32 bus_format = bridge_state->input_bus_cfg.format;
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		s->output_mode = ROCKCHIP_OUT_MODE_YUV420;
+		break;
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		s->output_mode = ROCKCHIP_OUT_MODE_S888_DUMMY;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	default:
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	}
+
+	s->output_type = DRM_MODE_CONNECTOR_DisplayPort;
+	s->bus_format = bus_format;
+	s->bus_flags = di->bus_flags;
+	s->color_space = V4L2_COLORSPACE_DEFAULT;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
+	.atomic_check		= dw_dp_encoder_atomic_check,
+};
+
+static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dw_dp_plat_data plat_data;
+	struct drm_device *drm_dev = data;
+	struct rockchip_dw_dp *dp;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	dp->dev = dev;
+	plat_data.max_link_rate = 810000;
+	encoder = &dp->encoder.encoder;
+	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev, dev->of_node);
+	rockchip_drm_encoder_set_crtc_endpoint_id(&dp->encoder, dev->of_node, 0, 0);
+
+	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
+	drm_encoder_helper_add(encoder, &dw_dp_encoder_helper_funcs);
+
+	dp->base = dw_dp_bind(dev, encoder, &plat_data);
+	if (IS_ERR(dp->base)) {
+		ret = PTR_ERR(dp->base);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(drm_dev, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		return dev_err_probe(dev, ret, "Failed to init bridge connector");
+	}
+
+	drm_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+static const struct component_ops dw_dp_rockchip_component_ops = {
+	.bind = dw_dp_rockchip_bind,
+};
+
+static int dw_dp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return component_add(dev, &dw_dp_rockchip_component_ops);
+}
+
+static void dw_dp_remove(struct platform_device *pdev)
+{
+	struct rockchip_dw_dp *dp = platform_get_drvdata(pdev);
+
+	component_del(dp->dev, &dw_dp_rockchip_component_ops);
+}
+
+static const struct of_device_id dw_dp_of_match[] = {
+	{ .compatible = "rockchip,rk3588-dp", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_dp_of_match);
+
+struct platform_driver dw_dp_driver = {
+	.probe	= dw_dp_probe,
+	.remove = dw_dp_remove,
+	.driver = {
+		.name = "dw-dp",
+		.of_match_table = dw_dp_of_match,
+	},
+};
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index ed88788e04dd2..687bb7b252e8e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -531,6 +531,7 @@ static int __init rockchip_drm_init(void)
 	ADD_ROCKCHIP_SUB_DRIVER(rockchip_dp_driver,
 				CONFIG_ROCKCHIP_ANALOGIX_DP);
 	ADD_ROCKCHIP_SUB_DRIVER(cdn_dp_driver, CONFIG_ROCKCHIP_CDN_DP);
+	ADD_ROCKCHIP_SUB_DRIVER(dw_dp_driver, CONFIG_ROCKCHIP_DW_DP);
 	ADD_ROCKCHIP_SUB_DRIVER(dw_hdmi_rockchip_pltfm_driver,
 				CONFIG_ROCKCHIP_DW_HDMI);
 	ADD_ROCKCHIP_SUB_DRIVER(dw_hdmi_qp_rockchip_pltfm_driver,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index c183e82a42a51..2e86ad00979c4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -87,6 +87,7 @@ int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rencoder,
 					      struct device_node *np, int port, int reg);
 int rockchip_drm_endpoint_is_subdriver(struct device_node *ep);
 extern struct platform_driver cdn_dp_driver;
+extern struct platform_driver dw_dp_driver;
 extern struct platform_driver dw_hdmi_rockchip_pltfm_driver;
 extern struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver;
 extern struct platform_driver dw_mipi_dsi_rockchip_driver;
-- 
2.43.0

