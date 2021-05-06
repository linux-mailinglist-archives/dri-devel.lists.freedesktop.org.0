Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BF374F8E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 08:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B016ECA1;
	Thu,  6 May 2021 06:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112996ECA0;
 Thu,  6 May 2021 06:47:18 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 05 May 2021 23:47:18 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 May 2021 23:47:15 -0700
X-QCInternal: smtphost
Received: from sbillaka-linux.qualcomm.com ([10.204.66.13])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 May 2021 12:16:49 +0530
Received: by sbillaka-linux.qualcomm.com (Postfix, from userid 2305739)
 id 9CA0D21D6F; Thu,  6 May 2021 12:16:47 +0530 (IST)
From: Sankeerth Billakanti <sbillaka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] drm/msm/edp: add support for next gen edp
Date: Thu,  6 May 2021 12:16:34 +0530
Message-Id: <1620283595-30471-3-git-send-email-sbillaka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620283595-30471-1-git-send-email-sbillaka@codeaurora.org>
References: <1620283595-30471-1-git-send-email-sbillaka@codeaurora.org>
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
Cc: mkrishn@codeaurora.org, dianders@chromium.org, abhinavk@codeaurora.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, Sankeerth Billakanti <sbillaka@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The eDP controller and phy hardware for the next generation
snapdragon platform has a different desgin compared to their
earlier generations. So, there is a need to implement new
sequences in driver software for the new hardware.

This change will implement the required seuqences to enable
eDP interface on the next generation snapdragon platforms.

Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile                      |    6 +
 drivers/gpu/drm/msm/edp/edp_common.c              |    4 +
 drivers/gpu/drm/msm/edp/edp_common.h              |    6 +
 drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
 drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 +++++++++++++++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
 11 files changed, 3446 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
 create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0a4ff4ea..f405fd6 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -32,6 +32,12 @@ msm-y := \
 	edp/v200/edp_v200_connector.o \
 	edp/v200/edp_v200_ctrl.o \
 	edp/v200/edp_v200_phy.o \
+	edp/v510/edp_v510.o \
+	edp/v510/edp_v510_aux.o \
+	edp/v510/edp_v510_bridge.o \
+	edp/v510/edp_v510_connector.o \
+	edp/v510/edp_v510_ctrl.o \
+	edp/v510/edp_v510_phy.o \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/mdp4/mdp4_crtc.o \
diff --git a/drivers/gpu/drm/msm/edp/edp_common.c b/drivers/gpu/drm/msm/edp/edp_common.c
index 8330050..32336a6 100644
--- a/drivers/gpu/drm/msm/edp/edp_common.c
+++ b/drivers/gpu/drm/msm/edp/edp_common.c
@@ -8,11 +8,13 @@
 void __init msm_edp_register(void)
 {
 	msm_edp_v200_register();
+	msm_edp_v510_register();
 }
 
 void __exit msm_edp_unregister(void)
 {
 	msm_edp_v200_unregister();
+	msm_edp_v510_unregister();
 }
 
 /* Second part of initialization, the drm/kms level modeset_init */
@@ -29,6 +31,8 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 
 	if (edp->version == MSM_EDP_VERSION_200)
 		ret = msm_edp_v200_modeset_init(edp, dev, encoder);
+	else if (edp->version == MSM_EDP_VERSION_510)
+		ret = msm_edp_v510_modeset_init(edp, dev, encoder);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/edp/edp_common.h b/drivers/gpu/drm/msm/edp/edp_common.h
index 30a74d9..768fce0 100644
--- a/drivers/gpu/drm/msm/edp/edp_common.h
+++ b/drivers/gpu/drm/msm/edp/edp_common.h
@@ -19,6 +19,7 @@
 #include "dpu_io_util.h"
 
 #define MSM_EDP_VERSION_200 200
+#define MSM_EDP_VERSION_510 510
 
 struct msm_edp {
 	struct drm_device *dev;
@@ -38,4 +39,9 @@ void __exit msm_edp_v200_unregister(void);
 int msm_edp_v200_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 				struct drm_encoder *encoder);
 
+void __init msm_edp_v510_register(void);
+void __exit msm_edp_v510_unregister(void);
+int msm_edp_v510_modeset_init(struct msm_edp *edp, struct drm_device *dev,
+				struct drm_encoder *encoder);
+
 #endif /* __EDP_COMMON_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510.c b/drivers/gpu/drm/msm/edp/v510/edp_v510.c
new file mode 100644
index 0000000..8650411
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/of_irq.h>
+#include "edp_v510.h"
+
+static irqreturn_t edp_irq(int irq, void *dev_id)
+{
+	struct msm_edp_v510 *edp = dev_id;
+
+	/* Process eDP irq */
+	return msm_edp_v510_ctrl_irq(edp->ctrl);
+}
+
+static void edp_destroy(struct platform_device *pdev)
+{
+	struct msm_edp_v510 *edp = platform_get_drvdata(pdev);
+
+	if (!edp)
+		return;
+
+	if (edp->ctrl) {
+		msm_edp_v510_ctrl_destroy(edp->ctrl);
+		edp->ctrl = NULL;
+	}
+
+	platform_set_drvdata(pdev, NULL);
+}
+
+/* construct eDP at bind/probe time, grab all the resources. */
+static struct msm_edp *edp_init(struct platform_device *pdev)
+{
+	struct msm_edp_v510 *edp = NULL;
+	int ret;
+
+	if (!pdev) {
+		DRM_ERROR("no eDP device\n");
+		ret = -ENXIO;
+		goto fail;
+	}
+
+	edp = devm_kzalloc(&pdev->dev, sizeof(*edp), GFP_KERNEL);
+	if (!edp) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+	DRM_INFO("eDP v510 probed\n");
+	edp->base.version = MSM_EDP_VERSION_510;
+
+	edp->base.pdev = pdev;
+	platform_set_drvdata(pdev, edp);
+
+	ret = msm_edp_v510_ctrl_init(edp);
+	if (ret)
+		goto fail;
+
+	return &edp->base;
+
+fail:
+	if (edp)
+		edp_destroy(pdev);
+
+	return ERR_PTR(ret);
+}
+
+static int edp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_edp *edp;
+
+	edp = edp_init(to_platform_device(dev));
+	if (IS_ERR(edp))
+		return PTR_ERR(edp);
+	priv->edp = edp;
+
+	return 0;
+}
+
+static void edp_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct msm_drm_private *priv = drm->dev_private;
+
+	if (priv->edp) {
+		edp_destroy(to_platform_device(dev));
+		priv->edp = NULL;
+	}
+}
+
+static const struct component_ops edp_ops = {
+		.bind   = edp_bind,
+		.unbind = edp_unbind,
+};
+
+static int edp_dev_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &edp_ops);
+}
+
+static int edp_dev_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &edp_ops);
+	return 0;
+}
+
+static const struct of_device_id dt_match[] = {
+	{ .compatible = "qcom,mdss-edp-v510" },
+	{}
+};
+
+static struct platform_driver edp_driver = {
+	.probe = edp_dev_probe,
+	.remove = edp_dev_remove,
+	.driver = {
+		.name = "msm_edp_v510",
+		.of_match_table = dt_match,
+	},
+};
+
+void __init msm_edp_v510_register(void)
+{
+	platform_driver_register(&edp_driver);
+}
+
+void __exit msm_edp_v510_unregister(void)
+{
+	platform_driver_unregister(&edp_driver);
+}
+
+static void edp_display_set_encoder_mode(struct msm_edp_v510 *edp)
+{
+	struct msm_drm_private *priv = edp->base.dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	if (!edp->encoder_mode_set && edp->base.encoder &&
+				kms->funcs->set_encoder_mode) {
+		kms->funcs->set_encoder_mode(kms,
+				edp->base.encoder, true);
+
+		edp->encoder_mode_set = true;
+	}
+}
+
+/* Second part of initialization, the drm/kms level modeset_init */
+int msm_edp_v510_modeset_init(struct msm_edp *edp, struct drm_device *dev,
+				struct drm_encoder *encoder)
+{
+	struct platform_device *pdev = edp->pdev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_edp_v510 *edp_ptr = NULL;
+	int ret;
+
+	if (WARN_ON(!encoder) || WARN_ON(!edp) || WARN_ON(!dev))
+		return -EINVAL;
+
+	edp->encoder = encoder;
+	edp->dev = dev;
+
+	edp_ptr = container_of(edp, struct msm_edp_v510, base);
+	if (IS_ERR(edp_ptr)) {
+		ret = PTR_ERR(edp_ptr);
+		DRM_DEV_ERROR(dev->dev, "failed to retrieve edp_v510 ptr: %d\n", ret);
+		goto fail;
+	}
+
+	edp_ptr->base.bridge = msm_edp_v510_bridge_init(edp_ptr);
+	if (IS_ERR(edp_ptr->base.bridge)) {
+		ret = PTR_ERR(edp_ptr->base.bridge);
+		DRM_DEV_ERROR(dev->dev, "failed to create eDP bridge: %d\n", ret);
+		edp_ptr->base.bridge = NULL;
+		goto fail;
+	}
+
+	edp_ptr->base.connector = msm_edp_v510_connector_init(edp_ptr);
+	if (IS_ERR(edp_ptr->base.connector)) {
+		ret = PTR_ERR(edp_ptr->base.connector);
+		DRM_DEV_ERROR(dev->dev, "failed to create eDP connector: %d\n", ret);
+		edp_ptr->base.connector = NULL;
+		goto fail;
+	}
+
+	edp_ptr->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (edp_ptr->irq < 0) {
+		ret = edp_ptr->irq;
+		DRM_DEV_ERROR(dev->dev, "failed to get IRQ: %d\n", ret);
+		goto fail;
+	}
+
+	ret = devm_request_irq(&pdev->dev, edp_ptr->irq,
+			edp_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+			"edp_isr", edp_ptr);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev->dev, "failed to request IRQ%u: %d\n",
+				edp_ptr->irq, ret);
+		goto fail;
+	}
+
+	edp_display_set_encoder_mode(edp_ptr);
+
+	priv->bridges[priv->num_bridges++]       = edp->bridge;
+	priv->connectors[priv->num_connectors++] = edp->connector;
+
+	return 0;
+
+fail:
+	/* bridge/connector are normally destroyed by drm */
+	if (edp->bridge) {
+		edp_v510_bridge_destroy(edp->bridge);
+		edp->bridge = NULL;
+	}
+	if (edp->connector) {
+		edp->connector->funcs->destroy(edp->connector);
+		edp->connector = NULL;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510.h b/drivers/gpu/drm/msm/edp/v510/edp_v510.h
new file mode 100644
index 0000000..9a01987
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __EDP_V510_CONNECTOR_H__
+#define __EDP_V510_CONNECTOR_H__
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_dp_helper.h>
+
+#include "msm_drv.h"
+#include "msm_kms.h"
+#include "dpu_io_util.h"
+#include "../edp_common.h"
+
+#define MSM_EDP_CONTROLLER_AHB_OFFSET	0x0000
+#define MSM_EDP_CONTROLLER_AHB_SIZE	0x0200
+#define MSM_EDP_CONTROLLER_AUX_OFFSET	0x0200
+#define MSM_EDP_CONTROLLER_AUX_SIZE	0x0200
+#define MSM_EDP_CONTROLLER_LINK_OFFSET	0x0400
+#define MSM_EDP_CONTROLLER_LINK_SIZE	0x0C00
+#define MSM_EDP_CONTROLLER_P0_OFFSET	0x1000
+#define MSM_EDP_CONTROLLER_P0_SIZE	0x0400
+
+static inline u32 edp_read_aux(void *base, u32 offset)
+{
+	offset += MSM_EDP_CONTROLLER_AUX_OFFSET;
+	return readl_relaxed(base + offset);
+}
+
+static inline void edp_write_aux(void *base, u32 offset, u32 data)
+{
+	offset += MSM_EDP_CONTROLLER_AUX_OFFSET;
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, base + offset);
+}
+
+static inline u32 edp_read_ahb(void *base, u32 offset)
+{
+	offset += MSM_EDP_CONTROLLER_AHB_OFFSET;
+	return readl_relaxed(base + offset);
+}
+
+static inline void edp_write_ahb(void *base, u32 offset, u32 data)
+{
+	offset += MSM_EDP_CONTROLLER_AHB_OFFSET;
+	/*
+	 * To make sure ahb reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, base + offset);
+}
+
+static inline void edp_write_p0(void *base, u32 offset, u32 data)
+{
+	offset += MSM_EDP_CONTROLLER_P0_OFFSET;
+	/*
+	 * To make sure pclk reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, base + offset);
+}
+
+static inline u32 edp_read_p0(void *base, u32 offset)
+{
+	offset += MSM_EDP_CONTROLLER_P0_OFFSET;
+	return readl_relaxed(base + offset);
+}
+
+static inline u32 edp_read_link(void *base, u32 offset)
+{
+	offset += MSM_EDP_CONTROLLER_LINK_OFFSET;
+	return readl_relaxed(base + offset);
+}
+
+static inline void edp_write_link(void *base, u32 offset, u32 data)
+{
+	offset += MSM_EDP_CONTROLLER_LINK_OFFSET;
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, base + offset);
+}
+
+struct edp_ctrl;
+struct edp_aux;
+struct edp_phy;
+struct edp_phy_opts {
+	unsigned long link_rate;
+	int lanes;
+	int voltage[4];
+	int pre[4];
+};
+
+
+struct msm_edp_v510 {
+	struct msm_edp base;
+	struct edp_ctrl *ctrl;
+
+	int irq;
+	bool encoder_mode_set;
+};
+
+/* eDP bridge */
+struct drm_bridge *msm_edp_v510_bridge_init(struct msm_edp_v510 *edp);
+void edp_v510_bridge_destroy(struct drm_bridge *bridge);
+
+/* eDP connector */
+struct drm_connector *msm_edp_v510_connector_init(struct msm_edp_v510 *edp);
+
+/* AUX */
+void *msm_edp_v510_aux_init(struct device *dev, void __iomem *regbase,
+			struct drm_dp_aux **drm_aux);
+void msm_edp_v510_aux_destroy(struct device *dev, struct edp_aux *aux);
+irqreturn_t msm_edp_v510_aux_irq(struct edp_aux *aux, u32 isr);
+void msm_edp_v510_aux_ctrl(struct edp_aux *aux, int enable);
+
+/* Phy */
+int msm_edp_v510_phy_enable(struct edp_phy *edp_phy);
+void msm_edp_v510_phy_vm_pe_init(struct edp_phy *edp_phy,
+					struct edp_phy_opts *opts);
+void *msm_edp_v510_phy_init(struct device *dev, void __iomem *regbase,
+			struct edp_phy_opts *opts);
+int msm_edp_v510_phy_power_on(struct edp_phy *edp_phy);
+void msm_edp_v510_phy_config(struct edp_phy *edp_phy, u8 v_level, u8 p_level);
+
+/* Ctrl */
+irqreturn_t msm_edp_v510_ctrl_irq(struct edp_ctrl *ctrl);
+void msm_edp_v510_ctrl_power(struct edp_ctrl *ctrl, bool on);
+int msm_edp_v510_ctrl_init(struct msm_edp_v510 *edp);
+void msm_edp_v510_ctrl_destroy(struct edp_ctrl *ctrl);
+bool msm_edp_v510_ctrl_panel_connected(struct edp_ctrl *ctrl);
+int msm_edp_v510_ctrl_get_panel_info(struct edp_ctrl *ctrl,
+	struct drm_connector *connector, struct edid **edid);
+int msm_edp_v510_ctrl_mode_set(struct edp_ctrl *ctrl,
+				const struct drm_display_mode *mode,
+				const struct drm_display_info *info);
+/* @pixel_rate is in kHz */
+bool msm_edp_v510_ctrl_pixel_clock_valid(struct edp_ctrl *ctrl, u32 pixel_rate);
+
+#endif /* __EDP_V510_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c b/drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
new file mode 100644
index 0000000..817e0e6
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include "edp_v510.h"
+#include "edp_v510_reg.h"
+
+#define AUX_CMD_FIFO_LEN	144
+#define AUX_CMD_NATIVE_MAX	16
+#define AUX_CMD_I2C_MAX		128
+
+#define EDP_INTR_AUX_I2C_ERR	\
+	(EDP_INTR_WRONG_ADDR | EDP_INTR_TIMEOUT | \
+	EDP_INTR_NACK_DEFER | EDP_INTR_WRONG_DATA_CNT | \
+	EDP_INTR_I2C_NACK | EDP_INTR_I2C_DEFER)
+
+#define EDP_INTR_TRANS_STATUS	\
+	(EDP_INTR_AUX_I2C_DONE | EDP_INTR_AUX_I2C_ERR)
+
+struct edp_aux {
+	void __iomem *base;
+	bool msg_err;
+
+	struct completion msg_comp;
+
+	/* To prevent the message transaction routine from reentry. */
+	struct mutex msg_mutex;
+
+	struct drm_dp_aux drm_aux;
+};
+#define to_edp_aux(x) container_of(x, struct edp_aux, drm_aux)
+
+static int edp_msg_fifo_tx(struct edp_aux *aux, struct drm_dp_aux_msg *msg)
+{
+	u32 data[4];
+	u32 reg, len;
+	bool native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
+	bool read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+	u8 *msgdata = msg->buffer;
+	int i;
+
+	if (read)
+		len = 4;
+	else
+		len = msg->size + 4;
+
+	/*
+	 * cmd fifo only has depth of 144 bytes
+	 */
+	if (len > AUX_CMD_FIFO_LEN)
+		return -EINVAL;
+
+	/* Pack cmd and write to HW */
+	data[0] = (msg->address >> 16) & 0xf;	/* addr[19:16] */
+	if (read)
+		data[0] |=  BIT(4);		/* R/W */
+
+	data[1] = (msg->address >> 8) & 0xff;	/* addr[15:8] */
+	data[2] = msg->address & 0xff;		/* addr[7:0] */
+	data[3] = (msg->size - 1) & 0xff;	/* len[7:0] */
+
+	for (i = 0; i < len; i++) {
+		reg = (i < 4) ? data[i] : msgdata[i - 4];
+		reg = EDP_AUX_DATA_DATA(reg); /* index = 0, write */
+		if (i == 0)
+			reg |= EDP_AUX_DATA_INDEX_WRITE;
+		edp_write_aux(aux->base, REG_EDP_AUX_DATA, reg);
+	}
+
+	reg = 0; /* Transaction number is always 1 */
+	if (!native) /* i2c */
+		reg |= EDP_AUX_TRANS_CTRL_I2C;
+
+	reg |= EDP_AUX_TRANS_CTRL_GO;
+	edp_write_aux(aux->base, REG_EDP_AUX_TRANS_CTRL, reg);
+
+	return 0;
+}
+
+static int edp_msg_fifo_rx(struct edp_aux *aux, struct drm_dp_aux_msg *msg)
+{
+	u32 data;
+	u8 *dp;
+	int i;
+	u32 len = msg->size;
+
+	edp_write_aux(aux->base, REG_EDP_AUX_DATA,
+		EDP_AUX_DATA_INDEX_WRITE | EDP_AUX_DATA_READ); /* index = 0 */
+
+	dp = msg->buffer;
+
+	/* discard first byte */
+	data = edp_read_aux(aux->base, REG_EDP_AUX_DATA);
+	for (i = 0; i < len; i++) {
+		data = edp_read_aux(aux->base, REG_EDP_AUX_DATA);
+		dp[i] = (u8)((data >> 8) & 0xff);
+	}
+
+	return 0;
+}
+
+/*
+ * This function does the real job to process an AUX transaction.
+ * It will call msm_edp_aux_ctrl() function to reset the AUX channel,
+ * if the waiting is timeout.
+ * The caller who triggers the transaction should avoid the
+ * msm_edp_aux_ctrl() running concurrently in other threads, i.e.
+ * start transaction only when AUX channel is fully enabled.
+ */
+static ssize_t edp_aux_transfer(struct drm_dp_aux *drm_aux,
+		struct drm_dp_aux_msg *msg)
+{
+	struct edp_aux *aux = to_edp_aux(drm_aux);
+	ssize_t ret;
+	unsigned long time_left;
+	bool native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
+	bool read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+
+	/* Ignore address only message */
+	if ((msg->size == 0) || (msg->buffer == NULL)) {
+		msg->reply = native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+		return msg->size;
+	}
+
+	/* msg sanity check */
+	if ((native && (msg->size > AUX_CMD_NATIVE_MAX)) ||
+		(msg->size > AUX_CMD_I2C_MAX)) {
+		pr_err("%s: invalid msg: size(%zu), request(%x)\n",
+			__func__, msg->size, msg->request);
+		return -EINVAL;
+	}
+
+	mutex_lock(&aux->msg_mutex);
+
+	aux->msg_err = false;
+	reinit_completion(&aux->msg_comp);
+
+	ret = edp_msg_fifo_tx(aux, msg);
+	if (ret < 0)
+		goto unlock_exit;
+
+	DRM_DEBUG_DP("wait_for_completion");
+	time_left = wait_for_completion_timeout(&aux->msg_comp,
+						msecs_to_jiffies(300));
+	if (!time_left) {
+		/*
+		 * Clear GO and reset AUX channel
+		 * to cancel the current transaction.
+		 */
+		edp_write_aux(aux->base, REG_EDP_AUX_TRANS_CTRL, 0);
+		msm_edp_v510_aux_ctrl(aux, 1);
+		pr_err("%s: aux timeout,\n", __func__);
+		ret = -ETIMEDOUT;
+		goto unlock_exit;
+	}
+	DRM_DEBUG_DP("completion");
+
+	if (!aux->msg_err) {
+		if (read) {
+			ret = edp_msg_fifo_rx(aux, msg);
+			if (ret < 0)
+				goto unlock_exit;
+		}
+
+		msg->reply = native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+	} else {
+		/* Reply defer to retry */
+		msg->reply = native ?
+			DP_AUX_NATIVE_REPLY_DEFER : DP_AUX_I2C_REPLY_DEFER;
+		/*
+		 * The sleep time in caller is not long enough to make sure
+		 * our H/W completes transactions. Add more defer time here.
+		 */
+		msleep(100);
+	}
+
+	/* Return requested size for success or retry */
+	ret = msg->size;
+
+unlock_exit:
+	mutex_unlock(&aux->msg_mutex);
+	return ret;
+}
+
+void *msm_edp_v510_aux_init(struct device *dev, void __iomem *regbase,
+	struct drm_dp_aux **drm_aux)
+{
+	struct edp_aux *aux = NULL;
+	int ret;
+
+	aux = devm_kzalloc(dev, sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return NULL;
+
+	aux->base = regbase;
+	mutex_init(&aux->msg_mutex);
+	init_completion(&aux->msg_comp);
+
+	aux->drm_aux.name = "msm_edp_aux";
+	aux->drm_aux.dev = dev;
+	aux->drm_aux.transfer = edp_aux_transfer;
+	ret = drm_dp_aux_register(&aux->drm_aux);
+	if (ret) {
+		pr_err("%s: failed to register drm aux: %d\n", __func__, ret);
+		mutex_destroy(&aux->msg_mutex);
+	}
+
+	if (drm_aux && aux)
+		*drm_aux = &aux->drm_aux;
+
+	return aux;
+}
+
+void msm_edp_v510_aux_destroy(struct device *dev, struct edp_aux *aux)
+{
+	if (aux) {
+		drm_dp_aux_unregister(&aux->drm_aux);
+		mutex_destroy(&aux->msg_mutex);
+	}
+}
+
+irqreturn_t msm_edp_v510_aux_irq(struct edp_aux *aux, u32 isr)
+{
+	if (isr & EDP_INTR_TRANS_STATUS) {
+		DRM_DEBUG_DP("isr=%x", isr);
+		edp_write_aux(aux->base, REG_EDP_AUX_TRANS_CTRL, 0);
+
+		if (isr & EDP_INTR_AUX_I2C_ERR)
+			aux->msg_err = true;
+		else
+			aux->msg_err = false;
+
+		complete(&aux->msg_comp);
+	}
+
+	return IRQ_HANDLED;
+}
+
+void msm_edp_v510_aux_ctrl(struct edp_aux *aux, int enable)
+{
+	u32 data;
+
+	DRM_INFO("enable=%d", enable);
+	data = edp_read_aux(aux->base, REG_EDP_AUX_CTRL);
+
+	if (enable) {
+		data |= EDP_AUX_CTRL_RESET;
+		edp_write_aux(aux->base, REG_EDP_AUX_CTRL, data);
+		/* Make sure full reset */
+		wmb();
+		usleep_range(500, 1000);
+
+		data &= ~EDP_AUX_CTRL_RESET;
+		edp_write_aux(aux->base, REG_EDP_AUX_CTRL, data);
+
+		edp_write_aux(aux->base, REG_EDP_TIMEOUT_COUNT, 0xffff);
+		edp_write_aux(aux->base, REG_EDP_AUX_LIMITS, 0xffff);
+
+		data |= EDP_AUX_CTRL_ENABLE;
+		edp_write_aux(aux->base, REG_EDP_AUX_CTRL, data);
+	} else {
+		data &= ~EDP_AUX_CTRL_ENABLE;
+		edp_write_aux(aux->base, REG_EDP_AUX_CTRL, data);
+	}
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c b/drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
new file mode 100644
index 0000000..12a85dd
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include "edp_v510.h"
+
+struct edp_bridge {
+	struct drm_bridge base;
+	struct msm_edp_v510 *edp;
+};
+#define to_edp_bridge(x) container_of(x, struct edp_bridge, base)
+
+void edp_v510_bridge_destroy(struct drm_bridge *bridge)
+{
+}
+
+static void edp_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
+	struct msm_edp_v510 *edp = edp_bridge->edp;
+
+	DBG("");
+	msm_edp_v510_ctrl_power(edp->ctrl, true);
+}
+
+static void edp_bridge_enable(struct drm_bridge *bridge)
+{
+	DBG("");
+}
+
+static void edp_bridge_disable(struct drm_bridge *bridge)
+{
+	DBG("");
+}
+
+static void edp_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
+	struct msm_edp_v510 *edp = edp_bridge->edp;
+
+	DBG("");
+	msm_edp_v510_ctrl_power(edp->ctrl, false);
+}
+
+static void edp_bridge_mode_set(struct drm_bridge *bridge,
+		const struct drm_display_mode *mode,
+		const struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = bridge->dev;
+	struct drm_connector *connector;
+	struct edp_bridge *edp_bridge = to_edp_bridge(bridge);
+	struct msm_edp_v510 *edp = edp_bridge->edp;
+
+	DRM_INFO("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
+
+	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+		struct drm_encoder *encoder = connector->encoder;
+		struct drm_bridge *first_bridge;
+
+		if (!connector->encoder)
+			continue;
+
+		first_bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (bridge == first_bridge) {
+			msm_edp_v510_ctrl_mode_set(edp->ctrl,
+				adjusted_mode, &connector->display_info);
+			break;
+		}
+	}
+}
+
+static const struct drm_bridge_funcs edp_bridge_funcs = {
+	.pre_enable = edp_bridge_pre_enable,
+	.enable = edp_bridge_enable,
+	.disable = edp_bridge_disable,
+	.post_disable = edp_bridge_post_disable,
+	.mode_set = edp_bridge_mode_set,
+};
+
+/* initialize bridge */
+struct drm_bridge *msm_edp_v510_bridge_init(struct msm_edp_v510 *edp)
+{
+	struct drm_bridge *bridge = NULL;
+	struct edp_bridge *edp_bridge;
+	int ret;
+
+	edp_bridge = devm_kzalloc(edp->base.dev->dev,
+			sizeof(*edp_bridge), GFP_KERNEL);
+	if (!edp_bridge) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	edp_bridge->edp = edp;
+
+	bridge = &edp_bridge->base;
+	bridge->funcs = &edp_bridge_funcs;
+
+	ret = drm_bridge_attach(edp->base.encoder, bridge, NULL, 0);
+	if (ret)
+		goto fail;
+
+	return bridge;
+
+fail:
+	if (bridge)
+		edp_v510_bridge_destroy(bridge);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c b/drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
new file mode 100644
index 0000000..6ba2071
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include "drm/drm_edid.h"
+#include "msm_kms.h"
+#include "edp_v510.h"
+
+struct edp_connector {
+	struct drm_connector base;
+	struct msm_edp_v510 *edp;
+};
+#define to_edp_connector(x) container_of(x, struct edp_connector, base)
+
+static enum drm_connector_status edp_connector_detect(
+		struct drm_connector *connector, bool force)
+{
+	struct edp_connector *edp_connector = to_edp_connector(connector);
+	struct msm_edp_v510 *edp = edp_connector->edp;
+
+	DBG("");
+	return msm_edp_v510_ctrl_panel_connected(edp->ctrl) ?
+		connector_status_connected : connector_status_disconnected;
+}
+
+static void edp_connector_destroy(struct drm_connector *connector)
+{
+	struct edp_connector *edp_connector = to_edp_connector(connector);
+
+	DBG("");
+
+	drm_connector_cleanup(connector);
+
+	kfree(edp_connector);
+}
+
+static int edp_connector_get_modes(struct drm_connector *connector)
+{
+	struct edp_connector *edp_connector = to_edp_connector(connector);
+	struct msm_edp_v510 *edp = edp_connector->edp;
+
+	struct edid *drm_edid = NULL;
+	int ret = 0;
+
+	DBG("");
+	ret = msm_edp_v510_ctrl_get_panel_info(edp->ctrl, connector, &drm_edid);
+	if (ret)
+		return ret;
+
+	drm_connector_update_edid_property(connector, drm_edid);
+	if (drm_edid)
+		ret = drm_add_edid_modes(connector, drm_edid);
+
+	return ret;
+}
+
+static int edp_connector_mode_valid(struct drm_connector *connector,
+				 struct drm_display_mode *mode)
+{
+	struct edp_connector *edp_connector = to_edp_connector(connector);
+	struct msm_edp_v510 *edp = edp_connector->edp;
+
+	if (!msm_edp_v510_ctrl_pixel_clock_valid(edp->ctrl, mode->clock))
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
+static const struct drm_connector_funcs edp_connector_funcs = {
+	.detect = edp_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = edp_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs edp_connector_helper_funcs = {
+	.get_modes = edp_connector_get_modes,
+	.mode_valid = edp_connector_mode_valid,
+};
+
+/* initialize connector */
+struct drm_connector *msm_edp_v510_connector_init(struct msm_edp_v510 *edp)
+{
+	struct drm_connector *connector = NULL;
+	struct edp_connector *edp_connector;
+	int ret;
+
+	edp_connector = devm_kzalloc(edp->base.dev->dev, sizeof(*edp_connector),
+				GFP_KERNEL);
+	if (!edp_connector)
+		return ERR_PTR(-ENOMEM);
+
+	edp_connector->edp = edp;
+
+	connector = &edp_connector->base;
+
+	ret = drm_connector_init(edp->base.dev, connector, &edp_connector_funcs,
+			DRM_MODE_CONNECTOR_eDP);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(connector, &edp_connector_helper_funcs);
+
+	/* We don't support HPD, so only poll status until connected. */
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+
+	/* Display driver doesn't support interlace now. */
+	connector->interlace_allowed = false;
+	connector->doublescan_allowed = false;
+
+	drm_connector_attach_encoder(connector, edp->base.encoder);
+
+	return connector;
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c b/drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
new file mode 100644
index 0000000..8bc4609
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
@@ -0,0 +1,1583 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/rational.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_edid.h>
+#include <linux/delay.h>
+
+#include "edp_v510.h"
+#include "edp_v510_reg.h"
+
+#define VDDA_UA_ON_LOAD		21800	/* uA units */
+#define VDDA_UA_OFF_LOAD	4	/* uA units */
+#define LVL_UA_ON_LOAD		36000	/* uA units */
+#define LVL_UA_OFF_LOAD		32	/* uA units */
+
+#define DPCD_LINK_VOLTAGE_MAX		4
+#define DPCD_LINK_PRE_EMPHASIS_MAX	4
+
+#define EDP_LINK_BW_MAX		DP_LINK_BW_5_4
+
+/* Link training return value */
+#define EDP_TRAIN_FAIL		-1
+#define EDP_TRAIN_SUCCESS	0
+#define EDP_TRAIN_RECONFIG	1
+
+#define EDP_CLK_MASK_AHB		BIT(0)
+#define EDP_CLK_MASK_AUX		BIT(1)
+#define EDP_CLK_MASK_LINK		BIT(2)
+#define EDP_CLK_MASK_PIXEL		BIT(3)
+#define EDP_CLK_MASK_MDP_CORE		BIT(4)
+#define EDP_CLK_MASK_LINK_CHAN	(EDP_CLK_MASK_LINK | EDP_CLK_MASK_PIXEL)
+#define EDP_CLK_MASK_AUX_CHAN	\
+	(EDP_CLK_MASK_AHB | EDP_CLK_MASK_AUX | EDP_CLK_MASK_MDP_CORE)
+#define EDP_CLK_MASK_ALL	(EDP_CLK_MASK_AUX_CHAN | EDP_CLK_MASK_LINK_CHAN)
+
+#define EDP_BACKLIGHT_MAX	255
+
+#define EDP_INTERRUPT_STATUS_ACK_SHIFT	1
+#define EDP_INTERRUPT_STATUS_MASK_SHIFT	2
+
+#define EDP_INTERRUPT_STATUS1 \
+	(EDP_INTR_AUX_I2C_DONE| \
+	EDP_INTR_WRONG_ADDR | EDP_INTR_TIMEOUT | \
+	EDP_INTR_NACK_DEFER | EDP_INTR_WRONG_DATA_CNT | \
+	EDP_INTR_I2C_NACK | EDP_INTR_I2C_DEFER | \
+	EDP_INTR_PLL_UNLOCKED | EDP_INTR_AUX_ERROR)
+
+#define EDP_INTERRUPT_STATUS1_ACK \
+	(EDP_INTERRUPT_STATUS1 << EDP_INTERRUPT_STATUS_ACK_SHIFT)
+#define EDP_INTERRUPT_STATUS1_MASK \
+	(EDP_INTERRUPT_STATUS1 << EDP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define EDP_INTERRUPT_STATUS2 \
+	(EDP_INTR_READY_FOR_VIDEO | EDP_INTR_IDLE_PATTERN_SENT | \
+	EDP_INTR_FRAME_END | EDP_INTR_CRC_UPDATED | EDP_INTR_SST_FIFO_UNDERFLOW)
+
+#define EDP_INTERRUPT_STATUS2_ACK \
+	(EDP_INTERRUPT_STATUS2 << EDP_INTERRUPT_STATUS_ACK_SHIFT)
+#define EDP_INTERRUPT_STATUS2_MASK \
+	(EDP_INTERRUPT_STATUS2 << EDP_INTERRUPT_STATUS_MASK_SHIFT)
+
+enum edp_pm_type {
+	EDP_CORE_PM,
+	EDP_CTRL_PM,
+	EDP_STREAM_PM,
+	EDP_PHY_PM,
+	EDP_MAX_PM
+};
+
+struct edp_ctrl {
+	struct platform_device *pdev;
+
+	void __iomem *base;
+	void __iomem *phy_base;
+
+	/* regulators */
+	struct regulator *vdda_vreg;	/* 1.8 V */
+	struct regulator *lvl_vreg;
+
+	/* clocks */
+	struct dss_module_power mp[EDP_MAX_PM];
+	bool core_clks_on;
+	bool link_clks_on;
+	bool stream_clks_on;
+
+	/* gpios */
+	struct gpio_desc *panel_en_gpio;
+	struct gpio_desc *panel_hpd_gpio;
+	struct gpio_desc *panel_bklt1_gpio;
+	struct gpio_desc *panel_bklt2_gpio;
+	struct gpio_desc *panel_pwm_gpio;
+
+	/* completion and mutex */
+	struct completion idle_comp;
+	struct mutex dev_mutex; /* To protect device power status */
+
+	/* work queue */
+	struct work_struct on_work;
+	struct work_struct off_work;
+	struct workqueue_struct *workqueue;
+
+	/* Interrupt register lock */
+	spinlock_t irq_lock;
+
+	bool edp_connected;
+	bool power_on;
+	bool core_initialized;
+
+	/* edid raw data */
+	struct edid *edid;
+
+	struct drm_dp_aux *drm_aux;
+
+	/* dpcd raw data */
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+	/* Link status */
+	u8 link_rate;
+	u8 lane_cnt;
+	u8 v_level;
+	u8 p_level;
+	struct edp_phy_opts edp_opts;
+
+	/* Timing status */
+	u8 interlaced;
+	u32 pixel_rate; /* in kHz */
+	u32 color_depth;
+	struct drm_display_mode drm_mode;
+
+	struct edp_aux *aux;
+	struct edp_phy *phy;
+};
+
+struct edp_ctrl_tu {
+	u32 rate;
+	u32 edp_tu;
+	u32 valid_boundary;
+	u32 valid_boundary2;
+};
+
+#define MAX_TU_TABLE 1
+static const struct edp_ctrl_tu tu[MAX_TU_TABLE] = {
+	{285550, 0x20, 0x13001B, 0x920035}, /* 1920x1080@120Hz CVT RB1 */
+};
+
+static inline bool edp_check_prefix(const char *clk_prefix,
+						const char *clk_name)
+{
+	return !strncmp(clk_prefix, clk_name, strlen(clk_prefix));
+}
+
+static int edp_init_clk_data(struct edp_ctrl *ctrl)
+{
+	int num_clk, i, rc;
+	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	const char *clk_name;
+	struct device *dev = &ctrl->pdev->dev;
+	struct dss_module_power *core_power = &ctrl->mp[EDP_CORE_PM];
+	struct dss_module_power *ctrl_power = &ctrl->mp[EDP_CTRL_PM];
+	struct dss_module_power *stream_power = &ctrl->mp[EDP_STREAM_PM];
+
+	num_clk = of_property_count_strings(dev->of_node, "clock-names");
+	if (num_clk <= 0) {
+		DRM_ERROR("no clocks are defined\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_clk; i++) {
+		rc = of_property_read_string_index(dev->of_node,
+				"clock-names", i, &clk_name);
+		if (rc < 0)
+			return rc;
+
+		if (edp_check_prefix("core", clk_name))
+			core_clk_count++;
+
+		if (edp_check_prefix("ctrl", clk_name))
+			ctrl_clk_count++;
+
+		if (edp_check_prefix("stream", clk_name))
+			stream_clk_count++;
+	}
+
+	/* Initialize the CORE power module */
+	if (core_clk_count == 0) {
+		DRM_ERROR("no core clocks are defined\n");
+		return -EINVAL;
+	}
+
+	core_power->num_clk = core_clk_count;
+	core_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * core_power->num_clk,
+			GFP_KERNEL);
+	if (!core_power->clk_config)
+		return -EINVAL;
+
+	/* Initialize the CTRL power module */
+	if (ctrl_clk_count == 0) {
+		DRM_ERROR("no ctrl clocks are defined\n");
+		return -EINVAL;
+	}
+
+	ctrl_power->num_clk = ctrl_clk_count;
+	ctrl_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * ctrl_power->num_clk,
+			GFP_KERNEL);
+	if (!ctrl_power->clk_config) {
+		ctrl_power->num_clk = 0;
+		return -EINVAL;
+	}
+
+	/* Initialize the STREAM power module */
+	if (stream_clk_count == 0) {
+		DRM_ERROR("no stream (pixel) clocks are defined\n");
+		return -EINVAL;
+	}
+
+	stream_power->num_clk = stream_clk_count;
+	stream_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * stream_power->num_clk,
+			GFP_KERNEL);
+	if (!stream_power->clk_config) {
+		stream_power->num_clk = 0;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int edp_clk_init(struct edp_ctrl *ctrl)
+{
+	int rc = 0, i = 0;
+	int num_clk = 0;
+	int core_clk_index = 0, ctrl_clk_index = 0, stream_clk_index = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
+	const char *clk_name;
+	struct device *dev = &ctrl->pdev->dev;
+	struct dss_module_power *core_power = &ctrl->mp[EDP_CORE_PM];
+	struct dss_module_power *ctrl_power = &ctrl->mp[EDP_CTRL_PM];
+	struct dss_module_power *stream_power = &ctrl->mp[EDP_STREAM_PM];
+
+	rc =  edp_init_clk_data(ctrl);
+	if (rc) {
+		DRM_ERROR("failed to initialize power data %d\n", rc);
+		return -EINVAL;
+	}
+
+	core_clk_count = core_power->num_clk;
+	ctrl_clk_count = ctrl_power->num_clk;
+	stream_clk_count = stream_power->num_clk;
+
+	num_clk = core_clk_count + ctrl_clk_count + stream_clk_count;
+
+	for (i = 0; i < num_clk; i++) {
+		rc = of_property_read_string_index(dev->of_node, "clock-names",
+				i, &clk_name);
+		if (rc) {
+			DRM_ERROR("error reading clock-names %d\n", rc);
+			return rc;
+		}
+		if (edp_check_prefix("core", clk_name) &&
+				core_clk_index < core_clk_count) {
+			struct dss_clk *clk =
+				&core_power->clk_config[core_clk_index];
+			strscpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			clk->type = DSS_CLK_AHB;
+			core_clk_index++;
+		} else if (edp_check_prefix("stream", clk_name) &&
+				stream_clk_index < stream_clk_count) {
+			struct dss_clk *clk =
+				&stream_power->clk_config[stream_clk_index];
+			strscpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			clk->type = DSS_CLK_PCLK;
+			stream_clk_index++;
+		} else if (edp_check_prefix("ctrl", clk_name) &&
+			   ctrl_clk_index < ctrl_clk_count) {
+			struct dss_clk *clk =
+				&ctrl_power->clk_config[ctrl_clk_index];
+			strscpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			ctrl_clk_index++;
+			if (edp_check_prefix("ctrl_link", clk_name) ||
+			    edp_check_prefix("stream_pixel", clk_name))
+				clk->type = DSS_CLK_PCLK;
+			else
+				clk->type = DSS_CLK_AHB;
+		}
+	}
+
+	DRM_DEBUG_DP("clock parsing successful\n");
+
+	rc = msm_dss_get_clk(dev, core_power->clk_config, core_power->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get core clk. err=%d\n", rc);
+		return rc;
+	}
+
+	rc = msm_dss_get_clk(dev, ctrl_power->clk_config, ctrl_power->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get ctrl clk. err=%d\n", rc);
+		msm_dss_put_clk(core_power->clk_config, core_power->num_clk);
+		return -ENODEV;
+	}
+
+	rc = msm_dss_get_clk(dev, stream_power->clk_config, stream_power->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get strem clk. err=%d\n", rc);
+		msm_dss_put_clk(core_power->clk_config, core_power->num_clk);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void edp_clk_deinit(struct edp_ctrl *ctrl)
+{
+	struct dss_module_power *core_power, *ctrl_power, *stream_power;
+
+	core_power = &ctrl->mp[EDP_CORE_PM];
+	ctrl_power = &ctrl->mp[EDP_CTRL_PM];
+	stream_power = &ctrl->mp[EDP_STREAM_PM];
+
+	if (!core_power || !ctrl_power || !stream_power)
+		DRM_ERROR("invalid power_data\n");
+
+	msm_dss_put_clk(ctrl_power->clk_config, ctrl_power->num_clk);
+	msm_dss_put_clk(core_power->clk_config, core_power->num_clk);
+	msm_dss_put_clk(stream_power->clk_config, stream_power->num_clk);
+}
+
+static int edp_clk_set_rate(struct edp_ctrl *ctrl,
+		enum edp_pm_type module, bool enable)
+{
+	int rc = 0;
+	struct dss_module_power *mp = &ctrl->mp[module];
+
+	if (enable) {
+		rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+		if (rc) {
+			DRM_ERROR("failed to set clks rate.\n");
+			return rc;
+		}
+	}
+
+	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
+	if (rc) {
+		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int edp_clk_enable(struct edp_ctrl *ctrl,
+		enum edp_pm_type pm_type, bool enable)
+{
+	int rc = 0;
+
+	if (pm_type != EDP_CORE_PM && pm_type != EDP_CTRL_PM &&
+			pm_type != EDP_STREAM_PM) {
+		DRM_ERROR("unsupported power module\n");
+		return -EINVAL;
+	}
+
+	if (enable) {
+		if (pm_type == EDP_CORE_PM && ctrl->core_clks_on) {
+			DRM_DEBUG_DP("core clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == EDP_CTRL_PM && ctrl->link_clks_on) {
+			DRM_DEBUG_DP("links clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == EDP_STREAM_PM && ctrl->stream_clks_on) {
+			DRM_DEBUG_DP("pixel clks already enabled\n");
+			return 0;
+		}
+
+		if ((pm_type == EDP_CTRL_PM) && (!ctrl->core_clks_on)) {
+			DRM_DEBUG_DP("Enable core clks before link clks\n");
+
+			rc = edp_clk_set_rate(ctrl, EDP_CORE_PM, enable);
+			if (rc) {
+				DRM_ERROR("fail to enable clks: core. err=%d\n",
+					rc);
+				return rc;
+			}
+			ctrl->core_clks_on = true;
+		}
+	}
+
+	rc = edp_clk_set_rate(ctrl, pm_type, enable);
+	if (rc) {
+		DRM_ERROR("failed to '%s' clks. err=%d\n",
+			enable ? "enable" : "disable", rc);
+			return rc;
+	}
+
+	if (pm_type == EDP_CORE_PM)
+		ctrl->core_clks_on = enable;
+	else if (pm_type == EDP_STREAM_PM)
+		ctrl->stream_clks_on = enable;
+	else
+		ctrl->link_clks_on = enable;
+
+	DRM_DEBUG_DP("stream_clks:%s link_clks:%s core_clks:%s\n",
+		ctrl->stream_clks_on ? "on" : "off",
+		ctrl->link_clks_on ? "on" : "off",
+		ctrl->core_clks_on ? "on" : "off");
+
+	return 0;
+}
+
+static void edp_ctrl_set_clock_rate(struct edp_ctrl *ctrl,
+			enum edp_pm_type module, char *name, unsigned long rate)
+{
+	u32 num = ctrl->mp[module].num_clk;
+	struct dss_clk *cfg = ctrl->mp[module].clk_config;
+
+	while (num && strcmp(cfg->clk_name, name)) {
+		num--;
+		cfg++;
+	}
+
+	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
+
+	if (num)
+		cfg->rate = rate;
+	else
+		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
+				name, rate);
+}
+
+static int edp_regulator_init(struct edp_ctrl *ctrl)
+{
+	struct device *dev = &ctrl->pdev->dev;
+	int ret;
+
+	ctrl->vdda_vreg = devm_regulator_get(dev, "vdda");
+	ret = PTR_ERR_OR_ZERO(ctrl->vdda_vreg);
+	if (ret) {
+		DRM_ERROR("%s: Could not get vdda reg, ret = %d\n", __func__,
+				ret);
+		ctrl->vdda_vreg = NULL;
+		return ret;
+	}
+	ctrl->lvl_vreg = devm_regulator_get(dev, "lvl-vdd");
+	ret = PTR_ERR_OR_ZERO(ctrl->lvl_vreg);
+	if (ret) {
+		DRM_ERROR("%s: Could not get lvl-vdd reg, ret = %d\n", __func__,
+				ret);
+		ctrl->lvl_vreg = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int edp_regulator_enable(struct edp_ctrl *ctrl)
+{
+	int ret;
+
+	ret = regulator_set_load(ctrl->vdda_vreg, VDDA_UA_ON_LOAD);
+	if (ret < 0) {
+		DRM_ERROR("%s: vdda_vreg set regulator mode failed.\n", __func__);
+		goto vdda_set_fail;
+	}
+
+	ret = regulator_enable(ctrl->vdda_vreg);
+	if (ret) {
+		DRM_ERROR("%s: Failed to enable vdda_vreg regulator.\n", __func__);
+		goto vdda_enable_fail;
+	}
+
+	ret = regulator_set_load(ctrl->lvl_vreg, LVL_UA_ON_LOAD);
+	if (ret < 0) {
+		DRM_ERROR("%s: vdda_vreg set regulator mode failed.\n", __func__);
+		goto vdda_set_fail;
+	}
+
+	ret = regulator_enable(ctrl->lvl_vreg);
+	if (ret) {
+		DRM_ERROR("Failed to enable lvl-vdd reg regulator, %d", ret);
+		goto lvl_enable_fail;
+	}
+
+	return 0;
+
+lvl_enable_fail:
+	regulator_disable(ctrl->vdda_vreg);
+vdda_enable_fail:
+	regulator_set_load(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
+vdda_set_fail:
+	return ret;
+}
+
+static void edp_regulator_disable(struct edp_ctrl *ctrl)
+{
+	regulator_disable(ctrl->lvl_vreg);
+	regulator_set_load(ctrl->lvl_vreg, LVL_UA_OFF_LOAD);
+	regulator_disable(ctrl->vdda_vreg);
+	regulator_set_load(ctrl->vdda_vreg, VDDA_UA_OFF_LOAD);
+}
+
+static int edp_gpio_config(struct edp_ctrl *ctrl)
+{
+	struct device *dev = &ctrl->pdev->dev;
+	int ret;
+
+	ctrl->panel_hpd_gpio = devm_gpiod_get(dev, "panel-hpd", GPIOD_IN);
+	if (IS_ERR(ctrl->panel_hpd_gpio)) {
+		ret = PTR_ERR(ctrl->panel_hpd_gpio);
+		ctrl->panel_hpd_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-hpd-gpios, %d\n", __func__, ret);
+		return ret;
+	}
+
+	ctrl->panel_en_gpio = devm_gpiod_get(dev, "panel-en", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctrl->panel_en_gpio)) {
+		ret = PTR_ERR(ctrl->panel_en_gpio);
+		ctrl->panel_en_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-en-gpios, %d\n", __func__, ret);
+		return ret;
+	}
+
+	ctrl->panel_bklt1_gpio = devm_gpiod_get(dev, "panel-bklt1",
+			GPIOD_OUT_HIGH);
+	if (IS_ERR(ctrl->panel_bklt1_gpio)) {
+		ret = PTR_ERR(ctrl->panel_bklt1_gpio);
+		ctrl->panel_bklt1_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-bklt1-gpios, %d\n", __func__, ret);
+		return ret;
+	}
+
+	ctrl->panel_bklt2_gpio = devm_gpiod_get(dev, "panel-bklt2",
+			GPIOD_OUT_HIGH);
+	if (IS_ERR(ctrl->panel_bklt2_gpio)) {
+		ret = PTR_ERR(ctrl->panel_bklt2_gpio);
+		ctrl->panel_bklt2_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-bklt2-gpios, %d\n", __func__, ret);
+		return ret;
+	}
+
+	ctrl->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctrl->panel_pwm_gpio)) {
+		ret = PTR_ERR(ctrl->panel_pwm_gpio);
+		ctrl->panel_pwm_gpio = NULL;
+		DRM_ERROR("%s: cannot get panel-pwm-gpios, %d\n", __func__, ret);
+		return ret;
+	}
+
+	DRM_INFO("gpio on");
+
+	return 0;
+}
+
+static void edp_ctrl_irq_enable(struct edp_ctrl *ctrl, int enable)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->irq_lock, flags);
+	if (enable) {
+		edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS,
+				EDP_INTERRUPT_STATUS1_MASK);
+		edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS2,
+				EDP_INTERRUPT_STATUS2_MASK);
+	} else {
+		edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS,
+				EDP_INTERRUPT_STATUS1_ACK);
+		edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS2,
+				EDP_INTERRUPT_STATUS2_ACK);
+	}
+	spin_unlock_irqrestore(&ctrl->irq_lock, flags);
+}
+
+static void edp_fill_link_cfg(struct edp_ctrl *ctrl)
+{
+	u32 prate;
+	u32 bpp;
+	u8 max_lane = drm_dp_max_lane_count(ctrl->dpcd);
+
+	prate = ctrl->pixel_rate;
+	bpp = ctrl->color_depth * 3;
+
+	/*
+	 * By default, use the maximum link rate and minimum lane count,
+	 * so that we can do rate down shift during link training.
+	 */
+	ctrl->link_rate = ctrl->dpcd[DP_MAX_LINK_RATE];
+	ctrl->lane_cnt = max_lane;
+	DRM_INFO("rate=%d lane=%d", ctrl->link_rate, ctrl->lane_cnt);
+}
+
+static void edp_config_ctrl(struct edp_ctrl *ctrl)
+{
+	u32 config = 0, depth = 0;
+	u8 *dpcd = ctrl->dpcd;
+
+	/* Default-> LSCLK DIV: 1/4 LCLK  */
+	config |= (2 << EDP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
+
+	/* Scrambler reset enable */
+	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP)
+		config |= EDP_CONFIGURATION_CTRL_ASSR;
+
+	if (ctrl->color_depth == 8)
+		depth = EDP_8BIT;
+	else if (ctrl->color_depth == 10)
+		depth = EDP_10BIT;
+	else if (ctrl->color_depth == 12)
+		depth = EDP_12BIT;
+	else if (ctrl->color_depth == 16)
+		depth = EDP_16BIT;
+	config |= depth << EDP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	/* Num of Lanes */
+	config |= ((ctrl->lane_cnt - 1)
+			<< EDP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
+
+	if (drm_dp_enhanced_frame_cap(dpcd))
+		config |= EDP_CONFIGURATION_CTRL_ENHANCED_FRAMING;
+
+	config |= EDP_CONFIGURATION_CTRL_P_INTERLACED; /* progressive video */
+
+	/* sync clock & static Mvid */
+	config |= EDP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
+	config |= EDP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
+
+	edp_write_link(ctrl->base, REG_EDP_CONFIGURATION_CTRL, config);
+}
+
+static void edp_state_ctrl(struct edp_ctrl *ctrl, u32 state)
+{
+	edp_write_link(ctrl->base, REG_EDP_STATE_CTRL, state);
+	/* Make sure H/W status is set */
+	wmb();
+}
+
+static int edp_lane_set_write(struct edp_ctrl *ctrl,
+	u8 voltage_level, u8 pre_emphasis_level)
+{
+	int i;
+	u8 buf[4];
+
+	if (voltage_level >= DPCD_LINK_VOLTAGE_MAX)
+		voltage_level |= 0x04;
+
+	if (pre_emphasis_level >= DPCD_LINK_PRE_EMPHASIS_MAX)
+		pre_emphasis_level |= 0x04;
+
+	pre_emphasis_level <<= 3;
+
+	for (i = 0; i < 4; i++)
+		buf[i] = voltage_level | pre_emphasis_level;
+
+	DRM_INFO("%s: p|v=0x%x", __func__, voltage_level | pre_emphasis_level);
+	if (drm_dp_dpcd_write(ctrl->drm_aux, 0x103, buf, 4) < 4) {
+		DRM_ERROR("%s: Set sw/pe to panel failed\n", __func__);
+		return -ENOLINK;
+	}
+
+	return 0;
+}
+
+static int edp_train_pattern_set_write(struct edp_ctrl *ctrl, u8 pattern)
+{
+	u8 p = pattern;
+
+	DRM_DEBUG_DP("pattern=%x", p);
+	if (drm_dp_dpcd_write(ctrl->drm_aux,
+				DP_TRAINING_PATTERN_SET, &p, 1) < 1) {
+		DRM_ERROR("%s: Set training pattern to panel failed\n", __func__);
+		return -ENOLINK;
+	}
+
+	return 0;
+}
+
+static void edp_sink_train_set_adjust(struct edp_ctrl *ctrl,
+	const u8 *link_status)
+{
+	int i;
+	u8 max = 0;
+	u8 data;
+
+	/* use the max level across lanes */
+	for (i = 0; i < ctrl->lane_cnt; i++) {
+		data = drm_dp_get_adjust_request_voltage(link_status, i);
+		DRM_DEBUG_DP("lane=%d req_voltage_swing=0x%x", i, data);
+		if (max < data)
+			max = data;
+	}
+
+	ctrl->v_level = max >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
+
+	/* use the max level across lanes */
+	max = 0;
+	for (i = 0; i < ctrl->lane_cnt; i++) {
+		data = drm_dp_get_adjust_request_pre_emphasis(link_status, i);
+		DRM_DEBUG_DP("lane=%d req_pre_emphasis=0x%x", i, data);
+		if (max < data)
+			max = data;
+	}
+
+	ctrl->p_level = max >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
+	DRM_DEBUG_DP("v_level=%d, p_level=%d", ctrl->v_level, ctrl->p_level);
+}
+
+static void edp_host_train_set(struct edp_ctrl *ctrl, u32 train)
+{
+	int cnt = 10;
+	u32 data;
+	u32 shift = train - 1;
+
+	DRM_DEBUG_DP("train=%d", train);
+
+	edp_state_ctrl(ctrl, EDP_STATE_CTRL_LINK_TRAINING_PATTERN1 << shift);
+	while (--cnt) {
+		data = edp_read_link(ctrl->base, REG_EDP_MAINLINK_READY);
+		if (data & (EDP_MAINLINK_READY_TRAIN_PATTERN_1_READY << shift))
+			break;
+	}
+
+	if (cnt == 0)
+		DRM_DEBUG_DP("%s: set link_train=%d failed\n", __func__, train);
+}
+
+static int edp_voltage_pre_emphasis_set(struct edp_ctrl *ctrl)
+{
+	DRM_DEBUG_DP("v=%d p=%d", ctrl->v_level, ctrl->p_level);
+
+	msm_edp_v510_phy_config(ctrl->phy, ctrl->v_level, ctrl->p_level);
+	return edp_lane_set_write(ctrl, ctrl->v_level, ctrl->p_level);
+}
+
+static int edp_start_link_train_1(struct edp_ctrl *ctrl)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	u8 old_v_level;
+	int tries;
+	int ret;
+	int rlen;
+
+	edp_host_train_set(ctrl, DP_TRAINING_PATTERN_1);
+	ret = edp_voltage_pre_emphasis_set(ctrl);
+	if (ret)
+		return ret;
+
+	ret = edp_train_pattern_set_write(ctrl,
+			DP_TRAINING_PATTERN_1 | DP_RECOVERED_CLOCK_OUT_EN);
+	if (ret)
+		return ret;
+
+	tries = 0;
+	old_v_level = ctrl->v_level;
+	while (1) {
+		drm_dp_link_train_clock_recovery_delay(ctrl->dpcd);
+
+		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
+		if (rlen < DP_LINK_STATUS_SIZE) {
+			DRM_ERROR("%s: read link status failed\n", __func__);
+			return -ENOLINK;
+		}
+		if (drm_dp_clock_recovery_ok(link_status, ctrl->lane_cnt)) {
+			ret = 0;
+			break;
+		}
+
+		if (ctrl->v_level == DPCD_LINK_VOLTAGE_MAX) {
+			ret = -1;
+			break;
+		}
+
+		if (old_v_level == ctrl->v_level) {
+			tries++;
+			if (tries >= 5) {
+				ret = -1;
+				break;
+			}
+		} else {
+			tries = 0;
+			old_v_level = ctrl->v_level;
+		}
+
+		edp_sink_train_set_adjust(ctrl, link_status);
+		ret = edp_voltage_pre_emphasis_set(ctrl);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int edp_start_link_train_2(struct edp_ctrl *ctrl)
+{
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	int tries = 0;
+	int ret;
+	int rlen;
+
+	edp_host_train_set(ctrl, DP_TRAINING_PATTERN_2);
+	ret = edp_voltage_pre_emphasis_set(ctrl);
+	if (ret)
+		return ret;
+
+	ret = edp_train_pattern_set_write(ctrl,
+			DP_TRAINING_PATTERN_2 | DP_RECOVERED_CLOCK_OUT_EN);
+	if (ret)
+		return ret;
+
+	while (1) {
+		drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
+
+		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
+		if (rlen < DP_LINK_STATUS_SIZE) {
+			DRM_ERROR("%s: read link status failed\n", __func__);
+			return -ENOLINK;
+		}
+		if (drm_dp_channel_eq_ok(link_status, ctrl->lane_cnt)) {
+			ret = 0;
+			break;
+		}
+
+		tries++;
+		if (tries > 10) {
+			ret = -1;
+			break;
+		}
+
+		edp_sink_train_set_adjust(ctrl, link_status);
+		ret = edp_voltage_pre_emphasis_set(ctrl);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int edp_link_rate_down_shift(struct edp_ctrl *ctrl)
+{
+	u32 prate, lrate, bpp;
+	u8 rate, lane, max_lane;
+	int changed = 0;
+
+	rate = ctrl->link_rate;
+	lane = ctrl->lane_cnt;
+	max_lane = drm_dp_max_lane_count(ctrl->dpcd);
+
+	bpp = ctrl->color_depth * 3;
+	prate = ctrl->pixel_rate;
+	prate *= bpp;
+	prate /= 8; /* in kByte */
+
+	if (rate > DP_LINK_BW_1_62 && rate <= EDP_LINK_BW_MAX) {
+		rate -= 4;	/* reduce rate */
+		changed++;
+	}
+
+	if (changed) {
+		if (lane >= 1 && lane < max_lane)
+			lane <<= 1;	/* increase lane */
+
+		lrate = 270000; /* in kHz */
+		lrate *= rate;
+		lrate /= 10; /* kByte, 10 bits --> 8 bits */
+		lrate *= lane;
+
+		DRM_DEBUG_DP("new lrate=%u prate=%u(kHz) rate=%d lane=%d p=%u b=%d",
+			lrate, prate, rate, lane,
+			ctrl->pixel_rate,
+			bpp);
+
+		if (lrate > prate) {
+			ctrl->link_rate = rate;
+			ctrl->lane_cnt = lane;
+			DRM_DEBUG_DP("new rate=%d %d", rate, lane);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int edp_clear_training_pattern(struct edp_ctrl *ctrl)
+{
+	int ret;
+
+	ret = edp_train_pattern_set_write(ctrl, 0);
+
+	drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
+
+	return ret;
+}
+
+static int edp_do_link_train(struct edp_ctrl *ctrl)
+{
+	u8 values[2], edp_config = 0;
+	int ret;
+
+	/*
+	 * Set the current link rate and lane cnt to panel. They may have been
+	 * adjusted and the values are different from them in DPCD CAP
+	 */
+	values[0] = ctrl->lane_cnt;
+	values[1] = ctrl->link_rate;
+
+	if (drm_dp_enhanced_frame_cap(ctrl->dpcd))
+		values[0] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+
+	if (drm_dp_dpcd_write(ctrl->drm_aux, DP_LINK_BW_SET, &values[1], 1) < 0)
+		return EDP_TRAIN_FAIL;
+
+	drm_dp_dpcd_write(ctrl->drm_aux, DP_LANE_COUNT_SET, &values[0], 1);
+	ctrl->v_level = 0; /* start from default level */
+	ctrl->p_level = 0;
+
+	values[0] = DP_SPREAD_AMP_0_5;
+	values[1] = 1;
+	drm_dp_dpcd_write(ctrl->drm_aux, DP_DOWNSPREAD_CTRL, &values[0], 1);
+	drm_dp_dpcd_write(ctrl->drm_aux, DP_MAIN_LINK_CHANNEL_CODING_SET, &values[1], 1);
+
+	edp_state_ctrl(ctrl, 0);
+	if (edp_clear_training_pattern(ctrl))
+		return EDP_TRAIN_FAIL;
+
+	ret = edp_start_link_train_1(ctrl);
+	if (ret < 0) {
+		if (edp_link_rate_down_shift(ctrl) == 0) {
+			DRM_ERROR("link reconfig");
+			ret = EDP_TRAIN_RECONFIG;
+			goto clear;
+		} else {
+			DRM_ERROR("%s: Training 1 failed", __func__);
+			ret = EDP_TRAIN_FAIL;
+			goto clear;
+		}
+	}
+	DRM_INFO("Training 1 completed successfully");
+
+	edp_state_ctrl(ctrl, 0);
+	if (edp_clear_training_pattern(ctrl))
+		return EDP_TRAIN_FAIL;
+
+	ret = edp_start_link_train_2(ctrl);
+	if (ret < 0) {
+		if (edp_link_rate_down_shift(ctrl) == 0) {
+			DRM_ERROR("link reconfig");
+			ret = EDP_TRAIN_RECONFIG;
+			goto clear;
+		} else {
+			DRM_ERROR("%s: Training 2 failed", __func__);
+			ret = EDP_TRAIN_FAIL;
+			goto clear;
+		}
+	}
+	DRM_INFO("Training 2 completed successfully");
+
+	edp_config = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
+	drm_dp_dpcd_write(ctrl->drm_aux, DP_EDP_CONFIGURATION_SET,
+			&edp_config, 1);
+
+	edp_state_ctrl(ctrl, EDP_STATE_CTRL_SEND_VIDEO);
+clear:
+	edp_clear_training_pattern(ctrl);
+
+	return ret;
+}
+
+static void edp_ctrl_config_misc(struct edp_ctrl *ctrl)
+{
+	u32 misc_val;
+	enum edp_color_depth depth = EDP_8BIT;
+
+	misc_val = edp_read_link(ctrl->base, REG_EDP_MISC1_MISC0);
+
+	if (ctrl->color_depth == 8)
+		depth = EDP_8BIT;
+	else if (ctrl->color_depth == 10)
+		depth = EDP_10BIT;
+	else if (ctrl->color_depth == 12)
+		depth = EDP_12BIT;
+	else if (ctrl->color_depth == 16)
+		depth = EDP_16BIT;
+
+	/* clear bpp bits */
+	misc_val &= ~(0x07 << EDP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val |= depth << EDP_MISC0_TEST_BITS_DEPTH_SHIFT;
+
+	/* Configure clock to synchronous mode */
+	misc_val |= EDP_MISC0_SYNCHRONOUS_CLK;
+
+	DRM_DEBUG_DP("misc settings = 0x%x\n", misc_val);
+	edp_write_link(ctrl->base, REG_EDP_MISC1_MISC0, misc_val);
+}
+
+static void edp_ctrl_config_msa(struct edp_ctrl *ctrl)
+{
+	u32 pixel_m, pixel_n;
+	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	unsigned long den, num;
+	u8 rate = ctrl->link_rate;
+	u32 stream_rate_khz = ctrl->pixel_rate;
+
+	if (rate == DP_LINK_BW_8_1)
+		pixel_div = 6;
+	else if (rate == DP_LINK_BW_1_62 || rate == DP_LINK_BW_2_7)
+		pixel_div = 2;
+	else if (rate == DP_LINK_BW_5_4)
+		pixel_div = 4;
+	else
+		DRM_ERROR("Invalid pixel mux divider\n");
+
+	dispcc_input_rate = (drm_dp_bw_code_to_link_rate(rate) * 10) / pixel_div;
+
+	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
+			(unsigned long)(1 << 16) - 1,
+			(unsigned long)(1 << 16) - 1, &den, &num);
+
+	den = ~(den - num);
+	den = den & 0xFFFF;
+	pixel_m = num;
+	pixel_n = den;
+
+	mvid = (pixel_m & 0xFFFF) * 5;
+	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
+
+	if (rate == DP_LINK_BW_5_4)
+		nvid *= 2;
+
+	if (rate == DP_LINK_BW_8_1)
+		nvid *= 3;
+
+	DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
+	edp_write_link(ctrl->base, REG_EDP_SOFTWARE_MVID, mvid);
+	edp_write_link(ctrl->base, REG_EDP_SOFTWARE_NVID, nvid);
+	edp_write_p0(ctrl->base, REG_EDP_DSC_DTO, 0x0);
+}
+
+static void edp_ctrl_config_TU(struct edp_ctrl *ctrl)
+{
+	int i;
+
+	for (i = 0; i < MAX_TU_TABLE; i++) {
+		if (tu[i].rate == ctrl->pixel_rate)
+			break;
+	}
+
+	edp_write_link(ctrl->base, REG_EDP_VALID_BOUNDARY,
+			tu[i].valid_boundary);
+
+	edp_write_link(ctrl->base, REG_EDP_TU, tu[i].edp_tu);
+
+	edp_write_link(ctrl->base, REG_EDP_VALID_BOUNDARY_2,
+			tu[i].valid_boundary2);
+}
+
+static void edp_ctrl_timing_cfg(struct edp_ctrl *ctrl)
+{
+	struct drm_display_mode *mode = &ctrl->drm_mode;
+	u32 hstart_from_sync, vstart_from_sync;
+	u32 data;
+
+	/* Configure eDP timing to HW */
+	edp_write_link(ctrl->base, REG_EDP_TOTAL_HOR_VER,
+		EDP_TOTAL_HOR_VER_HORIZ(mode->htotal) |
+		EDP_TOTAL_HOR_VER_VERT(mode->vtotal));
+
+	vstart_from_sync = mode->vtotal - mode->vsync_start;
+	hstart_from_sync = mode->htotal - mode->hsync_start;
+	edp_write_link(ctrl->base, REG_EDP_START_HOR_VER_FROM_SYNC,
+		EDP_START_HOR_VER_FROM_SYNC_HORIZ(hstart_from_sync) |
+		EDP_START_HOR_VER_FROM_SYNC_VERT(vstart_from_sync));
+
+	data = EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT(
+			mode->vsync_end - mode->vsync_start);
+	data |= EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ(
+			mode->hsync_end - mode->hsync_start);
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		data |= EDP_HSYNC_VSYNC_WIDTH_POLARITY_NVSYNC;
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		data |= EDP_HSYNC_VSYNC_WIDTH_POLARITY_NHSYNC;
+	edp_write_link(ctrl->base, REG_EDP_HSYNC_VSYNC_WIDTH_POLARITY, data);
+
+	edp_write_link(ctrl->base, REG_EDP_ACTIVE_HOR_VER,
+		EDP_ACTIVE_HOR_VER_HORIZ(mode->hdisplay) |
+		EDP_ACTIVE_HOR_VER_VERT(mode->vdisplay));
+
+}
+
+static void edp_mainlink_ctrl(struct edp_ctrl *ctrl, int enable)
+{
+	u32 data = 0;
+
+	edp_write_link(ctrl->base, REG_EDP_MAINLINK_CTRL, EDP_MAINLINK_CTRL_RESET);
+	/* Make sure fully reset */
+	wmb();
+	usleep_range(500, 1000);
+
+	if (enable) {
+		data = (EDP_MAINLINK_CTRL_ENABLE |
+				EDP_MAINLINK_FB_BOUNDARY_SEL);
+	}
+
+	edp_write_link(ctrl->base, REG_EDP_MAINLINK_CTRL, data);
+}
+
+static void edp_ctrl_phy_enable(struct edp_ctrl *ctrl, int enable)
+{
+	if (enable) {
+		edp_write_ahb(ctrl->base, REG_EDP_PHY_CTRL,
+			EDP_PHY_CTRL_SW_RESET | EDP_PHY_CTRL_SW_RESET_PLL);
+		usleep_range(1000, 1100);
+		edp_write_ahb(ctrl->base, REG_EDP_PHY_CTRL, 0);
+
+		msm_edp_v510_phy_enable(ctrl->phy);
+	}
+}
+
+static void edp_ctrl_phy_aux_enable(struct edp_ctrl *ctrl, int enable)
+{
+	if (ctrl->core_initialized == enable)
+		return;
+
+	if (enable) {
+		pm_runtime_get_sync(&ctrl->pdev->dev);
+		edp_regulator_enable(ctrl);
+		edp_clk_enable(ctrl, EDP_CORE_PM, 1);
+		edp_ctrl_phy_enable(ctrl, 1);
+		msm_edp_v510_aux_ctrl(ctrl->aux, 1);
+		ctrl->core_initialized =  true;
+	} else {
+		msm_edp_v510_aux_ctrl(ctrl->aux, 0);
+		edp_clk_enable(ctrl, EDP_CORE_PM, 0);
+		edp_regulator_disable(ctrl);
+		pm_runtime_put_sync(&ctrl->pdev->dev);
+		ctrl->core_initialized =  false;
+	}
+}
+
+static void edp_ctrl_link_enable(struct edp_ctrl *ctrl, int enable)
+{
+	unsigned long link_rate;
+
+	link_rate = drm_dp_max_link_rate(ctrl->dpcd);
+	ctrl->edp_opts.link_rate = link_rate;
+	ctrl->edp_opts.lanes = drm_dp_max_lane_count(ctrl->dpcd);
+
+	if (enable) {
+		msm_edp_v510_phy_vm_pe_init(ctrl->phy, &ctrl->edp_opts);
+		msm_edp_v510_phy_power_on(ctrl->phy);
+
+		/* Enable link channel clocks */
+		edp_ctrl_set_clock_rate(ctrl, EDP_CTRL_PM, "ctrl_link",
+				link_rate * 1000);
+		edp_clk_enable(ctrl, EDP_CTRL_PM, 1);
+
+		edp_ctrl_set_clock_rate(ctrl, EDP_STREAM_PM, "stream_pixel",
+				ctrl->pixel_rate * 1000);
+		edp_clk_enable(ctrl, EDP_STREAM_PM, 1);
+
+		edp_mainlink_ctrl(ctrl, 1);
+		edp_config_ctrl(ctrl);
+		edp_ctrl_config_misc(ctrl);
+		edp_ctrl_timing_cfg(ctrl);
+		edp_ctrl_config_msa(ctrl);
+		edp_ctrl_config_TU(ctrl);
+
+	} else {
+		edp_mainlink_ctrl(ctrl, 0);
+		edp_clk_enable(ctrl, EDP_STREAM_PM, 0);
+		edp_clk_enable(ctrl, EDP_CTRL_PM, 0);
+	}
+}
+
+static int edp_ctrl_training(struct edp_ctrl *ctrl)
+{
+	int ret;
+
+	/* Do link training only when power is on */
+	if (!ctrl->power_on)
+		return -EINVAL;
+
+train_start:
+	ret = edp_do_link_train(ctrl);
+	if (ret == EDP_TRAIN_RECONFIG) {
+		/* Re-configure main link */
+		edp_ctrl_irq_enable(ctrl, 0);
+		edp_ctrl_link_enable(ctrl, 0);
+
+		/* Make sure link is fully disabled */
+		wmb();
+		usleep_range(500, 1000);
+
+		edp_ctrl_phy_enable(ctrl, 1);
+		edp_ctrl_irq_enable(ctrl, 1);
+		edp_ctrl_link_enable(ctrl, 1);
+		goto train_start;
+	}
+
+	return ret;
+}
+
+static void edp_ctrl_on_worker(struct work_struct *work)
+{
+	struct edp_ctrl *ctrl = container_of(
+				work, struct edp_ctrl, on_work);
+	u8 value;
+	int ret;
+
+	mutex_lock(&ctrl->dev_mutex);
+
+	if (ctrl->power_on) {
+		DRM_INFO("already on");
+		goto unlock_ret;
+	}
+
+	edp_ctrl_phy_aux_enable(ctrl, 1);
+	edp_ctrl_irq_enable(ctrl, 1);
+	edp_ctrl_link_enable(ctrl, 1);
+
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (ctrl->dpcd[DP_DPCD_REV] >= 0x11) {
+		ret = drm_dp_dpcd_readb(ctrl->drm_aux, DP_SET_POWER, &value);
+		if (ret < 0)
+			goto fail;
+
+		value &= ~DP_SET_POWER_MASK;
+		value |= DP_SET_POWER_D0;
+
+		ret = drm_dp_dpcd_writeb(ctrl->drm_aux, DP_SET_POWER, value);
+		if (ret < 0)
+			goto fail;
+
+		/*
+		 * According to the DP 1.1 specification, a "Sink Device must
+		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
+		 * Table 5-52, "Sink Control Field" (register 0x600).
+		 */
+		usleep_range(1000, 2000);
+	}
+
+	ctrl->power_on = true;
+
+	/* Start link training */
+	ret = edp_ctrl_training(ctrl);
+	if (ret != EDP_TRAIN_SUCCESS)
+		goto fail;
+
+	DRM_INFO("DONE");
+	goto unlock_ret;
+
+fail:
+	edp_ctrl_irq_enable(ctrl, 0);
+	edp_ctrl_link_enable(ctrl, 0);
+	edp_ctrl_phy_aux_enable(ctrl, 0);
+	ctrl->power_on = false;
+unlock_ret:
+	mutex_unlock(&ctrl->dev_mutex);
+}
+
+static void edp_ctrl_off_worker(struct work_struct *work)
+{
+	struct edp_ctrl *ctrl = container_of(
+				work, struct edp_ctrl, off_work);
+	unsigned long time_left;
+
+	mutex_lock(&ctrl->dev_mutex);
+
+	if (!ctrl->power_on) {
+		DRM_INFO("already off");
+		goto unlock_ret;
+	}
+
+	reinit_completion(&ctrl->idle_comp);
+
+	edp_state_ctrl(ctrl, EDP_STATE_CTRL_PUSH_IDLE);
+
+	time_left = wait_for_completion_timeout(&ctrl->idle_comp,
+						msecs_to_jiffies(500));
+	if (!time_left)
+		DRM_ERROR("%s: idle pattern timedout\n", __func__);
+
+	edp_state_ctrl(ctrl, 0);
+
+	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
+	if (ctrl->dpcd[DP_DPCD_REV] >= 0x11) {
+		u8 value;
+		int ret;
+
+		ret = drm_dp_dpcd_readb(ctrl->drm_aux, DP_SET_POWER, &value);
+		if (ret > 0) {
+			value &= ~DP_SET_POWER_MASK;
+			value |= DP_SET_POWER_D3;
+
+			drm_dp_dpcd_writeb(ctrl->drm_aux, DP_SET_POWER, value);
+		}
+	}
+
+	edp_ctrl_irq_enable(ctrl, 0);
+
+	edp_ctrl_link_enable(ctrl, 0);
+
+	edp_ctrl_phy_aux_enable(ctrl, 0);
+
+	ctrl->power_on = false;
+
+unlock_ret:
+	mutex_unlock(&ctrl->dev_mutex);
+}
+
+irqreturn_t msm_edp_v510_ctrl_irq(struct edp_ctrl *ctrl)
+{
+	u32 isr1, isr2, mask1, mask2;
+	u32 ack;
+
+	spin_lock(&ctrl->irq_lock);
+	isr1 = edp_read_ahb(ctrl->base, REG_EDP_INTR_STATUS);
+	isr2 = edp_read_ahb(ctrl->base, REG_EDP_INTR_STATUS2);
+
+	mask1 = isr1 & EDP_INTERRUPT_STATUS1_MASK;
+	mask2 = isr2 & EDP_INTERRUPT_STATUS2_MASK;
+
+	isr1 &= ~mask1;	/* remove masks bit */
+	isr2 &= ~mask2;
+
+	DRM_DEBUG_DP("isr=%x mask=%x isr2=%x mask2=%x",
+			isr1, mask1, isr2, mask2);
+
+	ack = isr1 & EDP_INTERRUPT_STATUS1;
+	ack <<= 1;	/* ack bits */
+	ack |= mask1;
+	edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS, ack);
+
+	ack = isr2 & EDP_INTERRUPT_STATUS2;
+	ack <<= 1;	/* ack bits */
+	ack |= mask2;
+	edp_write_ahb(ctrl->base, REG_EDP_INTR_STATUS2, ack);
+	spin_unlock(&ctrl->irq_lock);
+
+	if (isr2 & EDP_INTR_READY_FOR_VIDEO)
+		DRM_INFO("edp_video_ready");
+
+	if (isr2 & EDP_INTR_IDLE_PATTERN_SENT) {
+		DRM_INFO("idle_patterns_sent");
+		complete(&ctrl->idle_comp);
+	}
+
+	msm_edp_v510_aux_irq(ctrl->aux, isr1);
+
+	return IRQ_HANDLED;
+}
+
+void msm_edp_v510_ctrl_power(struct edp_ctrl *ctrl, bool on)
+{
+	if (on)
+		queue_work(ctrl->workqueue, &ctrl->on_work);
+	else
+		queue_work(ctrl->workqueue, &ctrl->off_work);
+}
+
+int msm_edp_v510_ctrl_init(struct msm_edp_v510 *edp)
+{
+	struct edp_ctrl *ctrl = NULL;
+	struct device *dev = &edp->base.pdev->dev;
+	int ret;
+
+	if (!edp) {
+		DRM_ERROR("%s: edp is NULL!\n", __func__);
+		return -EINVAL;
+	}
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	edp->ctrl = ctrl;
+	ctrl->pdev = edp->base.pdev;
+
+	ctrl->base = msm_ioremap(ctrl->pdev, "edp_ctrl", "eDP_CTRL");
+	if (IS_ERR(ctrl->base))
+		return PTR_ERR(ctrl->base);
+
+	ctrl->phy_base = msm_ioremap(ctrl->pdev, "edp_phy", "eDP_PHY");
+	if (IS_ERR(ctrl->phy_base))
+		return PTR_ERR(ctrl->phy_base);
+
+	/* Get regulator, clock, gpio, pwm */
+	ret = edp_regulator_init(ctrl);
+	if (ret) {
+		DRM_ERROR("%s:regulator init fail\n", __func__);
+		return ret;
+	}
+	ret = edp_clk_init(ctrl);
+	if (ret) {
+		DRM_ERROR("%s:clk init fail\n", __func__);
+		return ret;
+	}
+	ret = edp_gpio_config(ctrl);
+	if (ret) {
+		DRM_ERROR("%s:failed to configure GPIOs: %d", __func__, ret);
+		return ret;
+	}
+
+	/* Init aux and phy */
+	ctrl->aux = msm_edp_v510_aux_init(dev, ctrl->base, &ctrl->drm_aux);
+	if (!ctrl->aux || !ctrl->drm_aux) {
+		DRM_ERROR("%s:failed to init aux\n", __func__);
+		return -ENOMEM;
+	}
+
+	ctrl->phy = msm_edp_v510_phy_init(dev, ctrl->phy_base, &ctrl->edp_opts);
+	if (!ctrl->phy) {
+		DRM_ERROR("%s:failed to init phy\n", __func__);
+		ret = -ENOMEM;
+		goto err_destory_aux;
+	}
+
+	pm_runtime_enable(dev);
+	spin_lock_init(&ctrl->irq_lock);
+	mutex_init(&ctrl->dev_mutex);
+	init_completion(&ctrl->idle_comp);
+
+	/* setup workqueue */
+	ctrl->workqueue = alloc_ordered_workqueue("edp_drm_work", 0);
+	INIT_WORK(&ctrl->on_work, edp_ctrl_on_worker);
+	INIT_WORK(&ctrl->off_work, edp_ctrl_off_worker);
+
+	return 0;
+
+err_destory_aux:
+	msm_edp_v510_aux_destroy(dev, ctrl->aux);
+	ctrl->aux = NULL;
+	return ret;
+}
+
+void msm_edp_v510_ctrl_destroy(struct edp_ctrl *ctrl)
+{
+	if (!ctrl)
+		return;
+
+	if (ctrl->workqueue) {
+		flush_workqueue(ctrl->workqueue);
+		destroy_workqueue(ctrl->workqueue);
+		ctrl->workqueue = NULL;
+	}
+
+	if (ctrl->aux) {
+		msm_edp_v510_aux_destroy(&ctrl->pdev->dev, ctrl->aux);
+		ctrl->aux = NULL;
+	}
+
+	edp_clk_deinit(ctrl);
+
+	kfree(ctrl->edid);
+	ctrl->edid = NULL;
+
+	mutex_destroy(&ctrl->dev_mutex);
+}
+
+bool msm_edp_v510_ctrl_panel_connected(struct edp_ctrl *ctrl)
+{
+	mutex_lock(&ctrl->dev_mutex);
+	if (ctrl->edp_connected) {
+		mutex_unlock(&ctrl->dev_mutex);
+		return true;
+	}
+
+	if (!ctrl->power_on) {
+		edp_ctrl_phy_aux_enable(ctrl, 1);
+		edp_ctrl_irq_enable(ctrl, 1);
+	}
+
+	if (drm_dp_dpcd_read(ctrl->drm_aux, DP_DPCD_REV, ctrl->dpcd,
+				DP_RECEIVER_CAP_SIZE) < DP_RECEIVER_CAP_SIZE) {
+		DRM_ERROR("%s: AUX channel is NOT ready\n", __func__);
+		memset(ctrl->dpcd, 0, DP_RECEIVER_CAP_SIZE);
+
+		if (!ctrl->power_on) {
+			edp_ctrl_irq_enable(ctrl, 0);
+			edp_ctrl_phy_aux_enable(ctrl, 0);
+		}
+
+	} else {
+		ctrl->edp_connected = true;
+	}
+
+
+	DRM_INFO("connect status=%d", ctrl->edp_connected);
+
+	mutex_unlock(&ctrl->dev_mutex);
+
+	return ctrl->edp_connected;
+}
+
+int msm_edp_v510_ctrl_get_panel_info(struct edp_ctrl *ctrl,
+		struct drm_connector *connector, struct edid **edid)
+{
+	int ret = 0;
+
+	mutex_lock(&ctrl->dev_mutex);
+
+	if (ctrl->edid) {
+		if (edid) {
+			DRM_DEBUG_DP("Just return edid buffer");
+			*edid = ctrl->edid;
+		}
+		goto unlock_ret;
+	}
+
+	if (!ctrl->power_on && !ctrl->edp_connected) {
+		edp_ctrl_phy_aux_enable(ctrl, 1);
+		edp_ctrl_irq_enable(ctrl, 1);
+	}
+
+	/* Initialize link rate as panel max link rate */
+	ctrl->link_rate = ctrl->dpcd[DP_MAX_LINK_RATE];
+
+
+	ctrl->edid = drm_get_edid(connector, &ctrl->drm_aux->ddc);
+	if (!ctrl->edid) {
+		DRM_ERROR("%s: edid read fail\n", __func__);
+		if (!ctrl->power_on) {
+			edp_ctrl_irq_enable(ctrl, 0);
+			edp_ctrl_phy_aux_enable(ctrl, 0);
+		}
+		goto unlock_ret;
+	}
+
+	if (edid)
+		*edid = ctrl->edid;
+
+unlock_ret:
+	mutex_unlock(&ctrl->dev_mutex);
+	return ret;
+}
+
+int msm_edp_v510_ctrl_mode_set(struct edp_ctrl *ctrl,
+				const struct drm_display_mode *mode,
+				const struct drm_display_info *info)
+{
+	/*
+	 * Need to keep color depth, pixel rate and
+	 * interlaced information in ctrl context
+	 */
+	ctrl->color_depth = info->bpc;
+	ctrl->pixel_rate = mode->clock;
+
+	memcpy(&ctrl->drm_mode, mode, sizeof(*mode));
+
+	ctrl->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+
+	/* Fill initial link config based on passed in timing */
+	edp_fill_link_cfg(ctrl);
+
+	return 0;
+}
+
+
+bool msm_edp_v510_ctrl_pixel_clock_valid(struct edp_ctrl *ctrl, u32 pixel_rate)
+{
+	u32 link_clock = 0;
+	unsigned long link_bw = 0, stream_bw = 0;
+
+	link_clock = drm_dp_bw_code_to_link_rate(ctrl->link_rate);
+	link_bw = link_clock * ctrl->lane_cnt;
+	stream_bw = pixel_rate * ctrl->color_depth * 3 / 8;
+
+	if (stream_bw > link_bw) {
+		DRM_ERROR("pixel clock %d(kHz) not supported", pixel_rate);
+		return false;
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c b/drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
new file mode 100644
index 0000000..3c575f4
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
@@ -0,0 +1,641 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+
+#include "edp_v510.h"
+#include "edp_v510_reg.h"
+
+#define MSM_EDP_PLL_OFFSET 0x0000
+#define MSM_EDP_TX0_OFFSET 0x0200
+#define MSM_EDP_TX1_OFFSET 0x0600
+#define MSM_EDP_PHY_OFFSET 0x0a00
+
+struct edp_phy_clks {
+	struct edp_phy *edp_phy;
+	struct clk_hw edp_link_hw;
+	struct clk_hw edp_pixel_hw;
+};
+
+struct edp_phy {
+	void __iomem *base;
+	struct edp_phy_opts *edp_opts;
+	struct edp_phy_clks *edp_clks;
+};
+
+static inline u32 edp_pll_read(struct edp_phy *phy, u32 offset)
+{
+	offset += MSM_EDP_PLL_OFFSET;
+	return readl_relaxed(phy->base + offset);
+}
+
+static inline u32 edp_tx0_read(struct edp_phy *phy, u32 offset)
+{
+	offset += MSM_EDP_TX0_OFFSET;
+	return readl_relaxed(phy->base + offset);
+}
+
+static inline u32 edp_tx1_read(struct edp_phy *phy, u32 offset)
+{
+	offset += MSM_EDP_TX1_OFFSET;
+	return readl_relaxed(phy->base + offset);
+}
+
+static inline u32 edp_phy_read(struct edp_phy *phy, u32 offset)
+{
+	offset += MSM_EDP_PHY_OFFSET;
+	return readl_relaxed(phy->base + offset);
+}
+
+static inline void edp_pll_write(struct edp_phy *phy, u32 offset, u32 data)
+{
+	offset += MSM_EDP_PLL_OFFSET;
+	writel(data, phy->base + offset);
+}
+
+static inline void edp_tx0_write(struct edp_phy *phy, u32 offset, u32 data)
+{
+	offset += MSM_EDP_TX0_OFFSET;
+	writel(data, phy->base + offset);
+}
+
+static inline void edp_tx1_write(struct edp_phy *phy, u32 offset, u32 data)
+{
+	offset += MSM_EDP_TX1_OFFSET;
+	writel(data, phy->base + offset);
+}
+
+static inline void edp_phy_write(struct edp_phy *phy, u32 offset, u32 data)
+{
+	offset += MSM_EDP_PHY_OFFSET;
+	writel(data, phy->base + offset);
+}
+
+static int edp_pixel_clk_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2160000000UL / 2:
+	case 2430000000UL / 2:
+	case 2700000000UL / 2:
+	case 5940000000UL / 6:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+edp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct edp_phy_clks *edp_clks;
+	struct edp_phy *edp_phy;
+	struct edp_phy_opts *opts;
+
+	edp_clks = container_of(hw, struct edp_phy_clks, edp_pixel_hw);
+	edp_phy = edp_clks->edp_phy;
+	opts = edp_phy->edp_opts;
+
+	switch (opts->link_rate) {
+	case 162000:
+		return 1620000000UL / 2;
+	break;
+	case 216000:
+		return 2160000000UL / 2;
+	break;
+	case 243000:
+		return 2430000000UL / 2;
+	break;
+	case 270000:
+		return 2700000000UL / 2;
+	break;
+	case 324000:
+		return 3240000000UL / 4;
+	break;
+	case 432000:
+		return 4320000000UL / 4;
+	break;
+	case 540000:
+		return 5400000000UL / 4;
+	break;
+	case 594000:
+		return 5940000000UL / 6;
+	case 810000:
+		return 8100000000UL / 6;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops edp_pixel_clk_ops = {
+	.determine_rate = edp_pixel_clk_determine_rate,
+	.recalc_rate = edp_pixel_clk_recalc_rate,
+};
+
+static int edp_link_clk_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 216000000:
+	case 243000000:
+	case 270000000:
+	case 324000000:
+	case 432000000:
+	case 540000000:
+	case 594000000:
+	case 810000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+edp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct edp_phy_clks *edp_clks;
+	struct edp_phy *edp_phy;
+	struct edp_phy_opts *opts;
+
+	edp_clks = container_of(hw, struct edp_phy_clks, edp_link_hw);
+	edp_phy = edp_clks->edp_phy;
+	opts = edp_phy->edp_opts;
+
+	switch (opts->link_rate) {
+	case 162000:
+	case 216000:
+	case 243000:
+	case 270000:
+	case 324000:
+	case 432000:
+	case 540000:
+	case 594000:
+	case 810000:
+		return opts->link_rate * 1000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops edp_link_clk_ops = {
+	.determine_rate = edp_link_clk_determine_rate,
+	.recalc_rate = edp_link_clk_recalc_rate,
+};
+
+static struct clk_hw *
+edp_clks_hw_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct edp_phy_clks *edp_clks = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= 2) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (idx == 0)
+		return &edp_clks->edp_link_hw;
+
+	return &edp_clks->edp_pixel_hw;
+}
+
+static void edp_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+static int edp_phy_clks_register(struct device *dev, struct edp_phy *edp_phy)
+{
+	struct clk_init_data init = { };
+	struct edp_phy_clks *edp_clks;
+	int ret;
+
+	edp_clks = devm_kzalloc(dev, sizeof(*edp_clks), GFP_KERNEL);
+	if (!edp_clks)
+		return -ENOMEM;
+
+	edp_clks->edp_phy = edp_phy;
+	edp_phy->edp_clks = edp_clks;
+
+	init.ops = &edp_link_clk_ops;
+	init.name = "edp_phy_pll_link_clk";
+	edp_clks->edp_link_hw.init = &init;
+	ret = devm_clk_hw_register(dev, &edp_clks->edp_link_hw);
+	if (ret)
+		return ret;
+
+	init.ops = &edp_pixel_clk_ops;
+	init.name = "edp_phy_pll_vco_div_clk";
+	edp_clks->edp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(dev, &edp_clks->edp_pixel_hw);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(dev->of_node, edp_clks_hw_get, edp_clks);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	ret = devm_add_action(dev, edp_clk_release_provider, dev->of_node);
+	if (ret)
+		edp_clk_release_provider(dev->of_node);
+
+	return ret;
+}
+
+static void edp_phy_ssc_en(struct edp_phy *edp_phy, bool en)
+{
+	if (en) {
+		edp_pll_write(edp_phy, 0x10, 0x01);
+		edp_pll_write(edp_phy, 0x14, 0x00);
+		edp_pll_write(edp_phy, 0x1c, 0x36);
+		edp_pll_write(edp_phy, 0x20, 0x01);
+		edp_pll_write(edp_phy, 0x24, 0x5c);
+		edp_pll_write(edp_phy, 0x28, 0x08);
+	} else {
+		edp_pll_write(edp_phy, 0x10, 0x00);
+	}
+}
+
+int msm_edp_v510_phy_enable(struct edp_phy *edp_phy)
+{
+	u32 status;
+
+	edp_phy_write(edp_phy, EDP_PHY_PD_CTL, 0x7D);
+	edp_pll_write(edp_phy, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x17);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG1, 0x13);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG2, 0x24);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG3, 0x00);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG4, 0x0a);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG5, 0x26);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG6, 0x0a);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG7, 0x03);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG8, 0xB7);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_CFG9, 0x03);
+	edp_phy_write(edp_phy, EDP_PHY_AUX_INTERRUPT_MASK, 0x1f);
+
+	edp_phy_write(edp_phy, EDP_PHY_MODE, 0xFC);
+
+	if (readl_poll_timeout_atomic((edp_phy->base +
+				MSM_EDP_PLL_OFFSET + QSERDES_COM_CMN_STATUS),
+				status, ((status & BIT(7)) > 0), 5, 100))
+		DRM_ERROR("%s: refgen not ready. Status=0x%x\n", __func__, status);
+
+	edp_tx0_write(edp_phy, TXn_LDO_CONFIG, 0x01);
+	edp_tx1_write(edp_phy, TXn_LDO_CONFIG, 0x01);
+	edp_tx0_write(edp_phy, TXn_LANE_MODE_1, 0x00);
+	edp_tx1_write(edp_phy, TXn_LANE_MODE_1, 0x00);
+
+	return 0;
+}
+
+static const u8 edp_hbr2_pre_emphasis[4][4] = {
+	{0x08, 0x11, 0x17, 0x1B},	/* pe0, 0 db */
+	{0x00, 0x0C, 0x13, 0xFF},	/* pe1, 3.5 db */
+	{0x05, 0x10, 0xFF, 0xFF},	/* pe2, 6.0 db */
+	{0x00, 0xFF, 0xFF, 0xFF}	/* pe3, 9.5 db */
+};
+
+static const u8 edp_hbr2_voltage_swing[4][4] = {
+	{0x0A, 0x11, 0x17, 0x1F}, /* sw0, 0.4v  */
+	{0x0C, 0x14, 0x1D, 0xFF}, /* sw1, 0.6 v */
+	{0x15, 0x1F, 0xFF, 0xFF}, /* sw1, 0.8 v */
+	{0x17, 0xFF, 0xFF, 0xFF}  /* sw1, 1.2 v, optional */
+};
+
+void msm_edp_v510_phy_vm_pe_init(struct edp_phy *edp_phy, struct edp_phy_opts *opts)
+{
+
+	edp_phy->edp_opts = opts;
+
+	edp_tx0_write(edp_phy, TXn_TX_DRV_LVL, edp_hbr2_voltage_swing[0][0]);
+	edp_tx0_write(edp_phy, TXn_TX_EMP_POST1_LVL,
+			edp_hbr2_pre_emphasis[0][0]);
+	edp_tx1_write(edp_phy, TXn_TX_DRV_LVL, edp_hbr2_voltage_swing[0][0]);
+	edp_tx1_write(edp_phy, TXn_TX_EMP_POST1_LVL,
+			edp_hbr2_pre_emphasis[0][0]);
+
+	edp_tx0_write(edp_phy, TXn_HIGHZ_DRVR_EN, 4);
+	edp_tx0_write(edp_phy, TXn_TRANSCEIVER_BIAS_EN, 3);
+	edp_tx1_write(edp_phy, TXn_HIGHZ_DRVR_EN, 7);
+	edp_tx1_write(edp_phy, TXn_TRANSCEIVER_BIAS_EN, 0);
+	edp_phy_write(edp_phy, EDP_PHY_CFG_1, 3);
+
+}
+
+void msm_edp_v510_phy_config(struct edp_phy *edp_phy, u8 v_level, u8 p_level)
+{
+	edp_tx0_write(edp_phy, TXn_TX_DRV_LVL,
+			edp_hbr2_voltage_swing[v_level][p_level]);
+	edp_tx0_write(edp_phy, TXn_TX_EMP_POST1_LVL,
+			edp_hbr2_pre_emphasis[v_level][p_level]);
+
+	edp_tx1_write(edp_phy, TXn_TX_DRV_LVL,
+			edp_hbr2_voltage_swing[v_level][p_level]);
+	edp_tx1_write(edp_phy, TXn_TX_EMP_POST1_LVL,
+			edp_hbr2_pre_emphasis[v_level][p_level]);
+}
+
+static void edp_pll_vco_init(struct edp_phy *edp_phy)
+{
+	edp_phy_ssc_en(edp_phy, true);
+	edp_pll_write(edp_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 0x01);
+	edp_pll_write(edp_phy, QSERDES_COM_SYSCLK_EN_SEL, 0x0b);
+	edp_pll_write(edp_phy, QSERDES_COM_SYS_CLK_CTRL, 0x02);
+	edp_pll_write(edp_phy, QSERDES_COM_CLK_ENABLE1, 0x0c);
+	edp_pll_write(edp_phy, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06);
+	edp_pll_write(edp_phy, QSERDES_COM_CLK_SEL, 0x30);
+	edp_pll_write(edp_phy, QSERDES_COM_PLL_IVCO, 0x07);
+	edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP_EN, 0x04);
+	edp_pll_write(edp_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
+	edp_pll_write(edp_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
+	edp_pll_write(edp_phy, QSERDES_COM_CP_CTRL_MODE0, 0x06);
+	edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00);
+	edp_pll_write(edp_phy, QSERDES_COM_CMN_CONFIG, 0x02);
+	edp_pll_write(edp_phy, QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x3f);
+	edp_pll_write(edp_phy, QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00);
+	edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE_MAP, 0x00);
+	edp_pll_write(edp_phy, QSERDES_COM_BG_TIMER, 0x0a);
+	edp_pll_write(edp_phy, QSERDES_COM_CORECLK_DIV_MODE0, 0x14);
+	edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE_CTRL, 0x00);
+	edp_pll_write(edp_phy, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x17);
+	edp_pll_write(edp_phy, QSERDES_COM_CORE_CLK_EN, 0x0f);
+
+	switch (edp_phy->edp_opts->link_rate) {
+	case 162000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x05);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x69);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x6f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x08);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0xa0);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x03);
+		break;
+	case 216000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x04);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x70);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x08);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x3f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x0b);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0x34);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x03);
+		break;
+	case 243000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x04);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x7e);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x09);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0xa7);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x0c);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0x5c);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
+		break;
+	case 270000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x03);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x69);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x0f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x0e);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0xa0);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x03);
+		break;
+	case 324000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x03);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x7e);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x09);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0xdf);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x10);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0x5c);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
+		break;
+	case 432000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x01);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x70);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x08);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x7f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x16);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0x34);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x03);
+		break;
+	case 540000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x01);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x8c);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x1f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x1c);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0x84);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x01);
+		break;
+	case 594000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x01);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x9a);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0b);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0xef);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x1e);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0xac);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x00);
+		break;
+	case 810000:
+		edp_pll_write(edp_phy, QSERDES_COM_HSCLK_SEL, 0x00);
+		edp_pll_write(edp_phy, QSERDES_COM_DEC_START_MODE0, 0x69);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80);
+		edp_pll_write(edp_phy, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP1_MODE0, 0x2f);
+		edp_pll_write(edp_phy, QSERDES_COM_LOCK_CMP2_MODE0, 0x2a);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE1_MODE0, 0xa0);
+		edp_pll_write(edp_phy, QSERDES_COM_VCO_TUNE2_MODE0, 0x03);
+		break;
+	default:
+		DRM_ERROR("%s: Invalid link rate. rate=%lu\n", __func__,
+					edp_phy->edp_opts->link_rate);
+		break;
+	}
+}
+
+static void edp_lanes_init(struct edp_phy *edp_phy)
+{
+	edp_tx0_write(edp_phy, TXn_TRANSCEIVER_BIAS_EN, 0x03);
+	edp_tx0_write(edp_phy, TXn_CLKBUF_ENABLE, 0x0f);
+	edp_tx0_write(edp_phy, TXn_RESET_TSYNC_EN, 0x03);
+	edp_tx0_write(edp_phy, TXn_TRAN_DRVR_EMP_EN, 0x01);
+	edp_tx0_write(edp_phy, TXn_TX_BAND, 0x4);
+
+	edp_tx1_write(edp_phy, TXn_TRANSCEIVER_BIAS_EN, 0x03);
+	edp_tx1_write(edp_phy, TXn_CLKBUF_ENABLE, 0x0f);
+	edp_tx1_write(edp_phy, TXn_RESET_TSYNC_EN, 0x03);
+	edp_tx1_write(edp_phy, TXn_TRAN_DRVR_EMP_EN, 0x01);
+	edp_tx1_write(edp_phy, TXn_TX_BAND, 0x4);
+}
+
+static void edp_lanes_configure(struct edp_phy *edp_phy)
+{
+	edp_tx0_write(edp_phy, TXn_HIGHZ_DRVR_EN, 0x1f);
+	edp_tx0_write(edp_phy, TXn_HIGHZ_DRVR_EN, 0x04);
+	edp_tx0_write(edp_phy, TXn_TX_POL_INV, 0x00);
+
+	edp_tx1_write(edp_phy, TXn_HIGHZ_DRVR_EN, 0x1f);
+	edp_tx1_write(edp_phy, TXn_HIGHZ_DRVR_EN, 0x04);
+	edp_tx1_write(edp_phy, TXn_TX_POL_INV, 0x00);
+
+	edp_tx1_write(edp_phy, TXn_HIGHZ_DRVR_EN, 0x04);
+	edp_tx1_write(edp_phy, TXn_TX_POL_INV, 0x00);
+
+	edp_tx0_write(edp_phy, TXn_TX_DRV_LVL_OFFSET, 0x10);
+	edp_tx1_write(edp_phy, TXn_TX_DRV_LVL_OFFSET, 0x10);
+
+	edp_tx0_write(edp_phy, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11);
+	edp_tx0_write(edp_phy, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11);
+
+	edp_tx1_write(edp_phy, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11);
+	edp_tx1_write(edp_phy, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11);
+
+	edp_tx0_write(edp_phy, TXn_TX_EMP_POST1_LVL, 0x00);
+	edp_tx0_write(edp_phy, TXn_TX_DRV_LVL, 0x18);
+	edp_tx1_write(edp_phy, TXn_TX_EMP_POST1_LVL, 0x00);
+	edp_tx1_write(edp_phy, TXn_TX_DRV_LVL, 0x18);
+}
+
+static int edp_pll_vco_configure(struct edp_phy *edp_phy)
+{
+	struct edp_phy_clks *edp_clks = edp_phy->edp_clks;
+	u32 phy_vco_div = 0, status;
+	unsigned long pixel_freq = 0;
+
+	switch (edp_phy->edp_opts->link_rate) {
+	case 162000:
+		phy_vco_div = 2;
+		pixel_freq = 1620000000UL / 2;
+	break;
+	case 216000:
+		phy_vco_div = 1;
+		pixel_freq = 2160000000UL / 2;
+	break;
+	case 243000:
+		phy_vco_div = 1;
+		pixel_freq = 2430000000UL / 2;
+	break;
+	case 270000:
+		phy_vco_div = 1;
+		pixel_freq = 2700000000UL / 2;
+	break;
+	case 324000:
+		phy_vco_div = 2;
+		pixel_freq = 3240000000UL / 4;
+	break;
+	case 432000:
+		phy_vco_div = 2;
+		pixel_freq = 4320000000UL / 4;
+	break;
+	case 540000:
+		phy_vco_div = 2;
+		pixel_freq = 5400000000UL / 4;
+	break;
+	case 594000:
+		phy_vco_div = 0;
+		pixel_freq = 5940000000UL / 6;
+	break;
+	case 810000:
+		phy_vco_div = 0;
+		pixel_freq = 8100000000UL / 6;
+	break;
+	default:
+		DRM_ERROR("%s: Invalid link rate. rate=%lu\n", __func__,
+					edp_phy->edp_opts->link_rate);
+	break;
+	}
+
+	edp_phy_write(edp_phy, EDP_PHY_VCO_DIV, phy_vco_div);
+
+	clk_set_rate(edp_clks->edp_link_hw.clk,
+			edp_phy->edp_opts->link_rate * 1000);
+	clk_set_rate(edp_clks->edp_pixel_hw.clk, pixel_freq);
+
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x01);
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x05);
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x01);
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x09);
+
+	edp_pll_write(edp_phy, QSERDES_COM_RESETSM_CNTRL, 0x20);
+
+	if (readl_poll_timeout_atomic((edp_phy->base +
+			MSM_EDP_PLL_OFFSET + QSERDES_COM_C_READY_STATUS),
+			status, ((status & BIT(0)) > 0), 500, 10000)) {
+		DRM_ERROR("%s: PLL not locked. Status=0x%x\n", __func__, status);
+		return -ETIMEDOUT;
+	}
+
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x19);
+	edp_lanes_configure(edp_phy);
+	edp_phy_write(edp_phy, EDP_PHY_CFG_1, 0x03);
+
+	if (readl_poll_timeout_atomic((edp_phy->base +
+				MSM_EDP_PHY_OFFSET + EDP_PHY_STATUS),
+				status, ((status & BIT(1)) > 0), 500, 10000)) {
+		DRM_ERROR("%s: PHY not ready. Status=0x%x\n", __func__, status);
+		return -ETIMEDOUT;
+	}
+
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x18);
+	udelay(2000);
+	edp_phy_write(edp_phy, EDP_PHY_CFG, 0x19);
+
+	return readl_poll_timeout_atomic((edp_phy->base +
+				MSM_EDP_PLL_OFFSET + QSERDES_COM_C_READY_STATUS),
+				status, ((status & BIT(0)) > 0), 500, 10000);
+
+}
+
+int msm_edp_v510_phy_power_on(struct edp_phy *edp_phy)
+{
+	int ret = 0;
+
+	edp_pll_vco_init(edp_phy);
+
+	edp_phy_write(edp_phy, EDP_PHY_TX0_TX1_LANE_CTL, 0x05);
+	edp_phy_write(edp_phy, EDP_PHY_TX2_TX3_LANE_CTL, 0x05);
+
+	edp_lanes_init(edp_phy);
+
+	ret = edp_pll_vco_configure(edp_phy);
+
+	return ret;
+}
+
+void *msm_edp_v510_phy_init(struct device *dev, void __iomem *regbase,
+		struct edp_phy_opts *opts)
+{
+	struct edp_phy *phy = NULL;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return NULL;
+
+	phy->base = regbase;
+	phy->edp_opts = opts;
+	edp_phy_clks_register(dev, phy);
+
+	return phy;
+}
diff --git a/drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h b/drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
new file mode 100644
index 0000000..10b4428
--- /dev/null
+++ b/drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
@@ -0,0 +1,339 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2014-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef EDP_V510_REG
+#define EDP_V510_REG
+
+enum edp_color_depth {
+	EDP_6BIT = 0,
+	EDP_8BIT = 1,
+	EDP_10BIT = 2,
+	EDP_12BIT = 3,
+	EDP_16BIT = 4,
+};
+
+enum edp_component_format {
+	EDP_RGB = 0,
+	EDP_YUV422 = 1,
+	EDP_YUV444 = 2,
+};
+
+/* DP_TX Registers */
+#define REG_EDP_HW_VERSION			(0x00000000)
+
+#define REG_EDP_SW_RESET			(0x00000010)
+#define DP_SW_RESET				(0x00000001)
+
+#define REG_EDP_PHY_CTRL			(0x00000014)
+#define EDP_PHY_CTRL_SW_RESET_PLL		(0x00000001)
+#define EDP_PHY_CTRL_SW_RESET			(0x00000004)
+
+#define REG_EDP_CLK_CTRL			(0x00000018)
+#define REG_EDP_CLK_ACTIVE			(0x0000001C)
+
+#define REG_EDP_INTR_STATUS			(0x00000020)
+#define EDP_INTR_AUX_I2C_DONE			BIT(3)
+#define EDP_INTR_WRONG_ADDR			BIT(6)
+#define EDP_INTR_TIMEOUT			BIT(9)
+#define EDP_INTR_NACK_DEFER			BIT(12)
+#define EDP_INTR_WRONG_DATA_CNT			BIT(15)
+#define EDP_INTR_I2C_NACK			BIT(18)
+#define EDP_INTR_I2C_DEFER			BIT(21)
+#define EDP_INTR_PLL_UNLOCKED			BIT(24)
+#define EDP_INTR_AUX_ERROR			BIT(27)
+
+#define REG_EDP_INTR_STATUS2			(0x00000024)
+#define EDP_INTR_READY_FOR_VIDEO		BIT(0)
+#define EDP_INTR_IDLE_PATTERN_SENT		BIT(3)
+#define EDP_INTR_FRAME_END			BIT(6)
+#define EDP_INTR_CRC_UPDATED			BIT(9)
+#define EDP_INTR_SST_FIFO_UNDERFLOW		BIT(28)
+
+
+#define REG_EDP_DP_HPD_CTRL			(0x00000000)
+#define EDP_DP_HPD_CTRL_HPD_EN			(0x00000001)
+
+#define REG_EDP_DP_HPD_INT_STATUS		(0x00000004)
+
+#define REG_EDP_DP_HPD_INT_ACK			(0x00000008)
+#define EDP_DP_HPD_PLUG_INT_ACK			(0x00000001)
+#define EDP_DP_IRQ_HPD_INT_ACK			(0x00000002)
+#define EDP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
+#define EDP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
+#define EDP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
+#define EDP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+
+#define REG_EDP_DP_HPD_INT_MASK			(0x0000000C)
+#define EDP_DP_HPD_PLUG_INT_MASK		(0x00000001)
+#define EDP_DP_IRQ_HPD_INT_MASK			(0x00000002)
+#define EDP_DP_HPD_REPLUG_INT_MASK		(0x00000004)
+#define EDP_DP_HPD_UNPLUG_INT_MASK		(0x00000008)
+#define EDP_DP_HPD_INT_MASK			(EDP_DP_HPD_PLUG_INT_MASK | \
+						EDP_DP_IRQ_HPD_INT_MASK | \
+						EDP_DP_HPD_REPLUG_INT_MASK | \
+						EDP_DP_HPD_UNPLUG_INT_MASK)
+#define EDP_DP_HPD_STATE_STATUS_CONNECTED	(0x40000000)
+#define EDP_DP_HPD_STATE_STATUS_PENDING		(0x20000000)
+#define EDP_DP_HPD_STATE_STATUS_DISCONNECTED	(0x00000000)
+#define EDP_DP_HPD_STATE_STATUS_MASK		(0xE0000000)
+
+#define REG_EDP_DP_HPD_REFTIMER			(0x00000018)
+#define EDP_DP_HPD_REFTIMER_ENABLE		(1 << 16)
+
+#define REG_EDP_DP_HPD_EVENT_TIME_0		(0x0000001C)
+#define REG_EDP_DP_HPD_EVENT_TIME_1		(0x00000020)
+#define EDP_DP_HPD_EVENT_TIME_0_VAL		(0x3E800FA)
+#define EDP_DP_HPD_EVENT_TIME_1_VAL		(0x1F407D0)
+
+#define REG_EDP_AUX_CTRL			(0x00000030)
+#define EDP_AUX_CTRL_ENABLE			(0x00000001)
+#define EDP_AUX_CTRL_RESET			(0x00000002)
+
+#define REG_EDP_AUX_DATA			(0x00000034)
+#define EDP_AUX_DATA_READ			(0x00000001)
+#define EDP_AUX_DATA_DATA__MASK			(0x0000ff00)
+#define EDP_AUX_DATA_DATA__SHIFT		(8)
+static inline uint32_t EDP_AUX_DATA_DATA(uint32_t val)
+{
+	return ((val) << EDP_AUX_DATA_DATA__SHIFT) & EDP_AUX_DATA_DATA__MASK;
+}
+#define EDP_AUX_DATA_INDEX__MASK		(0x00ff0000)
+#define EDP_AUX_DATA_INDEX__SHIFT		(16)
+static inline uint32_t EDP_AUX_DATA_INDEX(uint32_t val)
+{
+	return ((val) << EDP_AUX_DATA_INDEX__SHIFT) & EDP_AUX_DATA_INDEX__MASK;
+}
+#define EDP_AUX_DATA_INDEX_WRITE		(0x80000000)
+
+#define REG_EDP_AUX_TRANS_CTRL			(0x00000038)
+#define EDP_AUX_TRANS_CTRL_I2C			(0x00000100)
+#define EDP_AUX_TRANS_CTRL_GO			(0x00000200)
+#define EDP_AUX_TRANS_CTRL_NO_SEND_ADDR		(0x00000400)
+#define EDP_AUX_TRANS_CTRL_NO_SEND_STOP		(0x00000800)
+
+#define REG_EDP_TIMEOUT_COUNT			(0x0000003C)
+#define REG_EDP_AUX_LIMITS			(0x00000040)
+#define REG_EDP_AUX_STATUS			(0x00000044)
+
+#define EDP_INTERRUPT_TRANS_NUM			(0x000000A0)
+
+#define REG_EDP_MAINLINK_CTRL			(0x00000000)
+#define EDP_MAINLINK_CTRL_ENABLE		(0x00000001)
+#define EDP_MAINLINK_CTRL_RESET			(0x00000002)
+#define EDP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
+#define EDP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+
+#define REG_EDP_STATE_CTRL			(0x00000004)
+#define EDP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
+#define EDP_STATE_CTRL_LINK_TRAINING_PATTERN2	(0x00000002)
+#define EDP_STATE_CTRL_LINK_TRAINING_PATTERN3	(0x00000004)
+#define EDP_STATE_CTRL_LINK_TRAINING_PATTERN4	(0x00000008)
+#define EDP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE	(0x00000010)
+#define EDP_STATE_CTRL_LINK_PRBS7		(0x00000020)
+#define EDP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
+#define EDP_STATE_CTRL_SEND_VIDEO		(0x00000080)
+#define EDP_STATE_CTRL_PUSH_IDLE		(0x00000100)
+
+#define REG_EDP_CONFIGURATION_CTRL			(0x00000008)
+#define EDP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK		(0x00000001)
+#define EDP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN	(0x00000002)
+#define EDP_CONFIGURATION_CTRL_P_INTERLACED		(0x00000004)
+#define EDP_CONFIGURATION_CTRL_INTERLACED_BTF		(0x00000008)
+#define EDP_CONFIGURATION_CTRL_NUM_OF_LANES		(0x00000010)
+#define EDP_CONFIGURATION_CTRL_ENHANCED_FRAMING		(0x00000040)
+#define EDP_CONFIGURATION_CTRL_SEND_VSC			(0x00000080)
+#define EDP_CONFIGURATION_CTRL_BPC			(0x00000100)
+#define EDP_CONFIGURATION_CTRL_ASSR			(0x00000400)
+#define EDP_CONFIGURATION_CTRL_RGB_YUV			(0x00000800)
+#define EDP_CONFIGURATION_CTRL_LSCLK_DIV		(0x00002000)
+#define EDP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT	(0x04)
+#define EDP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
+#define EDP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT		(0x0D)
+
+#define REG_EDP_SOFTWARE_MVID			(0x00000010)
+#define REG_EDP_SOFTWARE_NVID			(0x00000018)
+
+#define REG_EDP_TOTAL_HOR_VER			(0x0000001C)
+#define EDP_TOTAL_HOR_VER_HORIZ__MASK		(0x0000FFFF)
+#define EDP_TOTAL_HOR_VER_HORIZ__SHIFT		(0)
+static inline uint32_t EDP_TOTAL_HOR_VER_HORIZ(uint32_t val)
+{
+	return ((val) << EDP_TOTAL_HOR_VER_HORIZ__SHIFT) & EDP_TOTAL_HOR_VER_HORIZ__MASK;
+}
+#define EDP_TOTAL_HOR_VER_VERT__MASK		(0xffff0000)
+#define EDP_TOTAL_HOR_VER_VERT__SHIFT		(16)
+static inline uint32_t EDP_TOTAL_HOR_VER_VERT(uint32_t val)
+{
+	return ((val) << EDP_TOTAL_HOR_VER_VERT__SHIFT) & EDP_TOTAL_HOR_VER_VERT__MASK;
+}
+
+#define REG_EDP_START_HOR_VER_FROM_SYNC			(0x00000020)
+#define EDP_START_HOR_VER_FROM_SYNC_HORIZ__MASK		(0x0000ffff)
+#define EDP_START_HOR_VER_FROM_SYNC_HORIZ__SHIFT	(0)
+static inline uint32_t EDP_START_HOR_VER_FROM_SYNC_HORIZ(uint32_t val)
+{
+	return ((val) << EDP_START_HOR_VER_FROM_SYNC_HORIZ__SHIFT) &
+		EDP_START_HOR_VER_FROM_SYNC_HORIZ__MASK;
+}
+#define EDP_START_HOR_VER_FROM_SYNC_VERT__MASK		(0xffff0000)
+#define EDP_START_HOR_VER_FROM_SYNC_VERT__SHIFT		(16)
+static inline uint32_t EDP_START_HOR_VER_FROM_SYNC_VERT(uint32_t val)
+{
+	return ((val) << EDP_START_HOR_VER_FROM_SYNC_VERT__SHIFT) &
+		EDP_START_HOR_VER_FROM_SYNC_VERT__MASK;
+}
+
+#define REG_EDP_HSYNC_VSYNC_WIDTH_POLARITY		(0x00000024)
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ__MASK	(0x00007fff)
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ__SHIFT	(0)
+static inline uint32_t EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ(uint32_t val)
+{
+	return ((val) << EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ__SHIFT) &
+		EDP_HSYNC_VSYNC_WIDTH_POLARITY_HORIZ__MASK;
+}
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_NHSYNC		(0x00008000)
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT__MASK	(0x7fff0000)
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT__SHIFT	(16)
+static inline uint32_t EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT(uint32_t val)
+{
+	return ((val) << EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT__SHIFT) &
+		EDP_HSYNC_VSYNC_WIDTH_POLARITY_VERT__MASK;
+}
+#define EDP_HSYNC_VSYNC_WIDTH_POLARITY_NVSYNC		(0x80000000)
+
+#define REG_EDP_ACTIVE_HOR_VER				(0x00000028)
+#define EDP_ACTIVE_HOR_VER_HORIZ__MASK			(0x0000ffff)
+#define EDP_ACTIVE_HOR_VER_HORIZ__SHIFT			(0)
+static inline uint32_t EDP_ACTIVE_HOR_VER_HORIZ(uint32_t val)
+{
+	return ((val) << EDP_ACTIVE_HOR_VER_HORIZ__SHIFT) & EDP_ACTIVE_HOR_VER_HORIZ__MASK;
+}
+#define EDP_ACTIVE_HOR_VER_VERT__MASK			(0xffff0000)
+#define EDP_ACTIVE_HOR_VER_VERT__SHIFT			(16)
+static inline uint32_t EDP_ACTIVE_HOR_VER_VERT(uint32_t val)
+{
+	return ((val) << EDP_ACTIVE_HOR_VER_VERT__SHIFT) & EDP_ACTIVE_HOR_VER_VERT__MASK;
+}
+
+
+#define REG_EDP_MISC1_MISC0				(0x0000002C)
+#define EDP_MISC0_SYNCHRONOUS_CLK			(0x00000001)
+#define EDP_MISC0_COLORIMETRY_CFG_SHIFT			(0x00000001)
+#define EDP_MISC0_TEST_BITS_DEPTH_SHIFT			(0x00000005)
+
+#define REG_EDP_VALID_BOUNDARY				(0x00000030)
+#define REG_EDP_VALID_BOUNDARY_2			(0x00000034)
+
+#define REG_EDP_LOGICAL2PHYSICAL_LANE_MAPPING		(0x00000038)
+#define LANE0_MAPPING_SHIFT				(0x00000000)
+#define LANE1_MAPPING_SHIFT				(0x00000002)
+#define LANE2_MAPPING_SHIFT				(0x00000004)
+#define LANE3_MAPPING_SHIFT				(0x00000006)
+
+#define REG_EDP_MAINLINK_READY				(0x00000040)
+#define EDP_MAINLINK_READY_FOR_VIDEO			(0x00000001)
+#define EDP_MAINLINK_READY_TRAIN_PATTERN_1_READY	(0x00000008)
+
+#define REG_EDP_MAINLINK_LEVELS				(0x00000044)
+#define EDP_MAINLINK_SAFE_TO_EXIT_LEVEL_2		(0x00000002)
+
+#define REG_EDP_TU					(0x0000004C)
+
+/* PCLK registers */
+#define REG_EDP_DSC_DTO					(0x0000007C)
+
+/* PHY registers */
+#define EDP_PHY_CFG					(0x00000010)
+#define EDP_PHY_CFG_1					(0x00000014)
+#define EDP_PHY_PD_CTL					(0x0000001C)
+#define EDP_PHY_MODE					(0x00000020)
+#define EDP_PHY_AUX_CFG0				(0x00000024)
+#define EDP_PHY_AUX_CFG1				(0x00000028)
+#define EDP_PHY_AUX_CFG2				(0x0000002C)
+#define EDP_PHY_AUX_CFG3				(0x00000030)
+#define EDP_PHY_AUX_CFG4				(0x00000034)
+#define EDP_PHY_AUX_CFG5				(0x00000038)
+#define EDP_PHY_AUX_CFG6				(0x0000003C)
+#define EDP_PHY_AUX_CFG7				(0x00000040)
+#define EDP_PHY_AUX_CFG8				(0x00000044)
+#define EDP_PHY_AUX_CFG9				(0x00000048)
+#define EDP_PHY_AUX_INTERRUPT_MASK			(0x00000058)
+#define EDP_PHY_VCO_DIV					(0x00000074)
+#define EDP_PHY_TX0_TX1_LANE_CTL			(0x0000007C)
+#define EDP_PHY_TX2_TX3_LANE_CTL			(0x000000A0)
+#define EDP_PHY_SPARE0					(0x000000CC)
+#define EDP_PHY_STATUS					(0x000000E0)
+
+
+/* Tx registers */
+#define TXn_CLKBUF_ENABLE				(0x00000000)
+#define TXn_TX_EMP_POST1_LVL				(0x00000004)
+#define TXn_TX_DRV_LVL					(0x00000014)
+#define TXn_TX_DRV_LVL_OFFSET				(0x00000018)
+#define TXn_RESET_TSYNC_EN				(0x0000001C)
+#define TXn_TX_BAND					(0x00000028)
+#define TXn_RES_CODE_LANE_OFFSET_TX0			(0x00000044)
+#define TXn_RES_CODE_LANE_OFFSET_TX1			(0x00000048)
+#define TXn_TRANSCEIVER_BIAS_EN				(0x00000054)
+#define TXn_HIGHZ_DRVR_EN				(0x00000058)
+#define TXn_TX_POL_INV					(0x0000005C)
+#define TXn_LANE_MODE_1					(0x00000064)
+#define TXn_TRAN_DRVR_EMP_EN				(0x00000078)
+#define TXn_LDO_CONFIG					(0x00000084)
+
+
+/* PLL registers */
+#define QSERDES_COM_BG_TIMER				(0x0000000C)
+#define QSERDES_COM_SSC_EN_CENTER			(0x00000010)
+#define QSERDES_COM_SSC_ADJ_PER1			(0x00000014)
+#define QSERDES_COM_SSC_ADJ_PER2			(0x00000018)
+#define QSERDES_COM_SSC_PER1				(0x0000001C)
+#define QSERDES_COM_SSC_PER2				(0x00000020)
+#define QSERDES_COM_SSC_STEP_SIZE1_MODE0		(0x00000024)
+#define QSERDES_COM_SSC_STEP_SIZE2_MODE0		(0x00000028)
+#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			(0x00000044)
+#define QSERDES_COM_CLK_ENABLE1				(0x00000048)
+#define QSERDES_COM_SYS_CLK_CTRL			(0x0000004C)
+#define QSERDES_COM_SYSCLK_BUF_ENABLE			(0x00000050)
+#define QSERDES_COM_PLL_IVCO				(0x00000058)
+#define QSERDES_COM_CP_CTRL_MODE0			(0x00000074)
+#define QSERDES_COM_PLL_RCTRL_MODE0			(0x0000007C)
+#define QSERDES_COM_PLL_CCTRL_MODE0			(0x00000084)
+#define QSERDES_COM_SYSCLK_EN_SEL			(0x00000094)
+#define QSERDES_COM_RESETSM_CNTRL			(0x0000009C)
+#define QSERDES_COM_LOCK_CMP_EN				(0x000000A4)
+#define QSERDES_COM_LOCK_CMP1_MODE0			(0x000000AC)
+#define QSERDES_COM_LOCK_CMP2_MODE0			(0x000000B0)
+#define QSERDES_COM_DEC_START_MODE0			(0x000000BC)
+#define QSERDES_COM_DIV_FRAC_START1_MODE0		(0x000000CC)
+#define QSERDES_COM_DIV_FRAC_START2_MODE0		(0x000000D0)
+#define QSERDES_COM_DIV_FRAC_START3_MODE0		(0x000000D4)
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		(0x000000EC)
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		(0x000000F0)
+#define QSERDES_COM_VCO_TUNE_CTRL			(0x00000108)
+#define QSERDES_COM_VCO_TUNE_MAP			(0x0000010C)
+#define QSERDES_COM_VCO_TUNE1_MODE0			(0x00000110)
+#define QSERDES_COM_VCO_TUNE2_MODE0			(0x00000114)
+#define QSERDES_COM_CMN_STATUS				(0x00000140)
+#define QSERDES_COM_CLK_SEL				(0x00000154)
+#define QSERDES_COM_HSCLK_SEL				(0x00000158)
+#define QSERDES_COM_CORECLK_DIV_MODE0			(0x00000168)
+#define QSERDES_COM_CORE_CLK_EN				(0x00000174)
+#define QSERDES_COM_C_READY_STATUS			(0x00000178)
+#define QSERDES_COM_CMN_CONFIG				(0x0000017C)
+#define QSERDES_COM_SVS_MODE_CLK_SEL			(0x00000184)
+
+
+#define DP_PHY_PLL_POLL_SLEEP_US			(500)
+#define DP_PHY_PLL_POLL_TIMEOUT_US			(10000)
+
+
+#define EDP_VCO_RATE_8100MHZDIV1000			(8100000UL)
+#define EDP_VCO_RATE_8640MHZDIV1000			(8640000UL)
+#define EDP_VCO_RATE_9720MHZDIV1000			(9720000UL)
+#define EDP_VCO_RATE_10800MHZDIV1000			(10800000UL)
+#define EDP_VCO_RATE_11880MHZDIV1000			(11880000UL)
+
+#endif /* EDP_V510_REG */
-- 
The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

