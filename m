Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3A8261C3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 22:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4E10E0EE;
	Sat,  6 Jan 2024 21:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC110E0EE
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 21:51:56 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so44956239f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 13:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704577915; x=1705182715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KuN7JCW0Bisp4u3xzJKi2nSTq7XQgcjsA62I/U4TW3A=;
 b=OnJoPY3DIB5CCAhjCc5P4TJL9jNs+6vlozqnVeu94v2x0zshEwsSQqwJhIs4cZc9Ok
 hrGRGBERdW5eV82zbda4EFqvmmxrMtTvSEIvQudYZlSpWhPn/9yqn6NJqWaN6bldfrWR
 P8IJN6OJkeHAKCJFqplTqZwrymXAxvS0Qb3ABHtKks5yjhxxxgOgrvpwTyxT0YqYFrmd
 8rooKnkJUJ4AcQ/QvDLpL7FQX2sTtYkBNNHE6t70QOCYggMcvWrdTAgVion3x7brr7zF
 z0T30HcvGSqC0qUHQLBWNR+7houskI6nmPWlWOpyBY/OWaPSM+UKAeig3uhoF0F0cZUg
 1amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704577915; x=1705182715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KuN7JCW0Bisp4u3xzJKi2nSTq7XQgcjsA62I/U4TW3A=;
 b=Vs3r/vIPbfvsNyeBcOQQW3I83vwLhpJYIgnZ6seh6k106cgPsSAZz3o60ebFnWdK5W
 b4W+yYKjRD3qrxheujf6moxvjlukMSHgVHOGbGVl10Tbb28OTwHG2rb4nT1m4BgSH9jj
 172UhH1H/rdDKu7Z9YBJrKdA4HmXZsM1708OdNP/IsrfRxTLx5Rns6bJyoL8hAGijg8j
 xerctTWy9wVLmryQ5YCBpg+Jo4ZrP/RvUYCcTjAuxDwobZVhq5qquBplelrbUWdd1hp2
 HOxeQYML6CLqpxxyRz5bhb1oQ4FhI+GCUkXW7LWaGWIr19F+F/OkPpBIgi0MG4qKN2q5
 8UuA==
X-Gm-Message-State: AOJu0Yw/i/q7lY89HNedy/B4BdZv5UkG57KzyhM3M+lXWu3HRjx4tZmH
 YHqEpp/5SBa6nYaF6WLQM1OTaQa8gXe2CA==
X-Google-Smtp-Source: AGHT+IF1f6yHhDOJk822HXe9xe5K4BUdFnbM9KGxAEjC7oqzs5lpcPlbuKhvUK5y8QcsLPl36p7aAQ==
X-Received: by 2002:a05:6e02:1c8d:b0:35f:e990:cb5c with SMTP id
 w13-20020a056e021c8d00b0035fe990cb5cmr2949550ill.33.1704577914565; 
 Sat, 06 Jan 2024 13:51:54 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:af2f:17f0:33a3:d6fe])
 by smtp.gmail.com with ESMTPSA id
 du4-20020a056638604400b0046dc6ede06dsm1347498jab.5.2024.01.06.13.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 13:51:54 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 2/2] drm/bridge: imx: add driver for HDMI TX Parallel Video
 Interface
Date: Sat,  6 Jan 2024 15:51:45 -0600
Message-ID: <20240106215146.147922-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240106215146.147922-1-aford173@gmail.com>
References: <20240106215146.147922-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Leitner <richard.leitner@skidata.com>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
full timing generator and can switch between different video sources. On
the i.MX8MP however the only supported source is the LCDIF. The block
just needs to be powered up and told about the polarity of the video
sync signals to act in bypass mode.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
Tested-by: Marek Vasut <marex@denx.de> (v1)
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

---
V7:  Re-do some includes to address build issues after rebasing from
     Linux-next

V6:  No change.

V5:  I (Adam) tried to help move this along, so I took Lucas' patch and
     attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.
     No changes from V4 to V5

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 5a4f3d58501e..a4d13331e320 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -3,6 +3,13 @@ if ARCH_MXC || COMPILE_TEST
 config DRM_IMX_LDB_HELPER
 	tristate
 
+config DRM_IMX8MP_HDMI_PVI
+	tristate "Freescale i.MX8MP HDMI PVI bridge support"
+	depends on OF
+	help
+	  Choose this to enable support for the internal HDMI TX Parallel
+	  Video Interface found on the Freescale i.MX8MP SoC.
+
 config DRM_IMX8QM_LDB
 	tristate "Freescale i.MX8QM LVDS display bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 2b0c2e44aa1b..e2c2106509fa 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
new file mode 100644
index 000000000000..a76b7669fe8a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define HTX_PVI_CTRL			0x0
+#define  PVI_CTRL_OP_VSYNC_POL		BIT(18)
+#define  PVI_CTRL_OP_HSYNC_POL		BIT(17)
+#define  PVI_CTRL_OP_DE_POL		BIT(16)
+#define  PVI_CTRL_INP_VSYNC_POL		BIT(14)
+#define  PVI_CTRL_INP_HSYNC_POL		BIT(13)
+#define  PVI_CTRL_INP_DE_POL		BIT(12)
+#define  PVI_CTRL_MODE_MASK		GENMASK(2, 1)
+#define  PVI_CTRL_MODE_LCDIF		2
+#define  PVI_CTRL_EN			BIT(0)
+
+struct imx8mp_hdmi_pvi {
+	struct drm_bridge	bridge;
+	struct device		*dev;
+	struct drm_bridge	*next_bridge;
+	void __iomem		*regs;
+};
+
+static inline struct imx8mp_hdmi_pvi *
+to_imx8mp_hdmi_pvi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct imx8mp_hdmi_pvi, bridge);
+}
+
+static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
+					 enum drm_bridge_attach_flags flags)
+{
+	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, pvi->next_bridge,
+				 bridge, flags);
+}
+
+static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state)
+{
+	struct drm_atomic_state *state = bridge_state->base.state;
+	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
+	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	u32 bus_flags, val;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
+	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	val = FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI_CTRL_EN;
+
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+		val |= PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
+
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
+
+	if (pvi->next_bridge->timings)
+		bus_flags = pvi->next_bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+
+	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
+		val |= PVI_CTRL_OP_DE_POL | PVI_CTRL_INP_DE_POL;
+
+	writel(val, pvi->regs + HTX_PVI_CTRL);
+}
+
+static void imx8mp_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state)
+{
+	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
+
+	writel(0x0, pvi->regs + HTX_PVI_CTRL);
+
+	pm_runtime_put(pvi->dev);
+}
+
+static u32 *
+imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state,
+					  u32 output_fmt,
+					  unsigned int *num_input_fmts)
+{
+	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
+	struct drm_bridge *next_bridge = pvi->next_bridge;
+	struct drm_bridge_state *next_state;
+
+	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
+		return 0;
+
+	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+						     next_bridge);
+
+	return next_bridge->funcs->atomic_get_input_bus_fmts(next_bridge,
+							     next_state,
+							     crtc_state,
+							     conn_state,
+							     output_fmt,
+							     num_input_fmts);
+}
+
+static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
+	.attach		= imx8mp_hdmi_pvi_bridge_attach,
+	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
+	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
+	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
+{
+	struct device_node *remote;
+	struct imx8mp_hdmi_pvi *pvi;
+
+	pvi = devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
+	if (!pvi)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pvi);
+	pvi->dev = &pdev->dev;
+
+	pvi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pvi->regs))
+		return PTR_ERR(pvi->regs);
+
+	/* Get the next bridge in the pipeline. */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
+	if (!remote)
+		return -EINVAL;
+
+	pvi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
+
+	if (!pvi->next_bridge)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "could not find next bridge\n");
+
+	pm_runtime_enable(&pdev->dev);
+
+	/* Register the bridge. */
+	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
+	pvi->bridge.of_node = pdev->dev.of_node;
+	pvi->bridge.timings = pvi->next_bridge->timings;
+
+	drm_bridge_add(&pvi->bridge);
+
+	return 0;
+}
+
+static int imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
+{
+	struct imx8mp_hdmi_pvi *pvi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pvi->bridge);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id imx8mp_hdmi_pvi_match[] = {
+	{
+		.compatible = "fsl,imx8mp-hdmi-pvi",
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
+
+static struct platform_driver imx8mp_hdmi_pvi_driver = {
+	.probe	= imx8mp_hdmi_pvi_probe,
+	.remove	= imx8mp_hdmi_pvi_remove,
+	.driver		= {
+		.name = "imx-hdmi-pvi",
+		.of_match_table	= imx8mp_hdmi_pvi_match,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pvi_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI TX Parallel Video Interface bridge driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

