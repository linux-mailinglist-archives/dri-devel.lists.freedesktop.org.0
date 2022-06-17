Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138154F1F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978B711AA06;
	Fri, 17 Jun 2022 07:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5AD11A9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so7083706ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9idDRq6f3uYrzI3egJYajHbXTVkkHjkaJS35JiKo5s=;
 b=6H9drCsPt8M+NIiyJPKb4587xiV22pW3oj9lwi5MYAq1j7952D1vbkCIKvjXX4JHPu
 Kzl6rmIElgbwknvul+uMyPEuSOeUn98NTgLT45/PsMX9zmb8gDmVqD/Qvi3zuR7CIX3K
 u6KvCmzO4Tj/Yl5FswgaEnqB5s8x3zNHFJa/ji6HQ18NtK219d6IUy102aOL6i4B7oeC
 vUmHoTAb+nDoDgsgBXS2RDGSwzQnHBsdQhmXUU9op8yt4VADkkPefasOkNYAD/dKTyO4
 ZL4MYbX+7fZju56fviKeLNpMG1NGHS1iqizwMnsPwgHRh2dtBYf/xgSNfdgQ1yNo/5hg
 FHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9idDRq6f3uYrzI3egJYajHbXTVkkHjkaJS35JiKo5s=;
 b=FUGBqH9UN3boLNh4aBOM1b9QC0a1vROYvq4YlcezpEP7sGOthqRgLiUxzGF7CfvEXF
 nZ9HYbR3FjePYgzA5ymwwdIapI6kA1A/OzRkbN/ycwvSCHYgbtfMl1MLoij6Kz8XNqRx
 X1tQLfvf1lAQamsz3hYz1baByvSQ7esc7uDRLVsJNPoClMjTdwvHlfoTQK+2PTrLHjtZ
 xd+a3papU5g0jVfvKJbnd+K9ImYNqkKD6zZPjxIiWGoqRZ2rfBLEI2fNLASuzcREO69T
 UwSBjDSJXrqLE9p2+3RLOzszqg0ehG7dxlVYCb4J4s1jVe2IYSVPTbDJXHqXjIlh6Myz
 EV9A==
X-Gm-Message-State: AJIora85zgtIjdLb4CT7dgQP0QyBkEo4XvxwGe+rWxwMSPNUJSUnpESk
 JMue70dKI+/1kPvGDs9/+GbBe5Ouj+NDsQ==
X-Google-Smtp-Source: AGRyM1sPClhBZJqQrDM2bRzVMulZY7Z3bJ92cneBfVP/qtfPh6WkSoXLtPRCEsdYdzQgVqM3UlotIg==
X-Received: by 2002:a17:906:ee1:b0:70d:d293:7b30 with SMTP id
 x1-20020a1709060ee100b0070dd2937b30mr7854309eji.134.1655450856868; 
 Fri, 17 Jun 2022 00:27:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v3 5/6] drm/meson: add DSI encoder
Date: Fri, 17 Jun 2022 09:27:22 +0200
Message-Id: <20220617072723.1742668-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8193; h=from:subject;
 bh=5SY+f9FZbEJP2uh/90AJVMp0SJeiVB72aKbSQ+lKbKw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrRAp2aas4pFiDuPnKF1I1V3k2lhmdwsB7mny9
 9VwsiyqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0SJlD/
 9gsEdJBcBwjjIuBLZ5IJfYnwhpX6Ey27tU8+qMxilIboOin3AT8ubqLPrr6MPAq20rSuSu+aBk16P/
 rIjRrIXcIl/5/BVE2B7nIwPHny9RG9FVnuFir1NiIs1seryI5mYgFixaZ3GvC0MXLQEn7VWERKcccu
 cuwi+z1Uq8meRNgZnxo7SCZpyJK57xsBP9EGXcOHHuRX4hd70P+gLrNXCk3XGRxeRCF0OxvIFRujrH
 3V+rcQdPWXP6ovjtbn3rqnwKRP/OwsfGsqibENIsOox4JAuUO1DILH7WfbiCL9wlwtAc67GUUAejKz
 QVGacvGOlx/LqsIJ6G6V+i8VeJbtssRbH92WbVRgU9tkRecMBXBA4BHp+mQP0+tLWsPrlulRETkeFA
 DFhwjq0KdkEPtDCZ1pmmBbQnNb5MzlU8iM37/iSd1DVQzB1U3831FonJW9Fih/gCAZh5pj3e5WeoKE
 xmYlWH0RdFkqRQ2HHVV0q3oC4qDAwTnFTPjFYxqK697ndkhIuvrNGm+eCPkcwYQY9dCVy4turhCLHE
 cp0IIGz6ZxMg/Vo91j9WolA+z08rAtQEmlrLOslYVhM5NZ++7pS+75NBk89coZKAfxsKXEiFd2YpWe
 x4VpRi9gI9p43fw4qhQKEFmDfJbTzEuBDwHJyHz966j2n6aobVBfWLMs7BQg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds an encoder bridge designed to drive a MIPI-DSI display
by using the ENCL encoder through the internal MIPI DSI transceiver
connected to the output of the ENCL pixel encoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/meson/Makefile            |   2 +-
 drivers/gpu/drm/meson/meson_drv.c         |   7 +
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 160 ++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h |  12 ++
 4 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
index 3afa31bdc950..833e18c20603 100644
--- a/drivers/gpu/drm/meson/Makefile
+++ b/drivers/gpu/drm/meson/Makefile
@@ -2,7 +2,7 @@
 meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cvbs.o
 meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
 meson-drm-y += meson_rdma.o meson_osd_afbcd.o
-meson-drm-y += meson_encoder_hdmi.o
+meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
 
 obj-$(CONFIG_DRM_MESON) += meson-drm.o
 obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 1b70938cfd2c..896994862ad7 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -34,6 +34,7 @@
 #include "meson_registers.h"
 #include "meson_encoder_cvbs.h"
 #include "meson_encoder_hdmi.h"
+#include "meson_encoder_dsi.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
 #include "meson_rdma.h"
@@ -324,6 +325,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto exit_afbcd;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		ret = meson_encoder_dsi_init(priv);
+		if (ret)
+			goto free_drm;
+	}
+
 	ret = meson_plane_create(priv);
 	if (ret)
 		goto exit_afbcd;
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
new file mode 100644
index 000000000000..20485a254ac4
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_probe_helper.h>
+
+#include "meson_drv.h"
+#include "meson_encoder_dsi.h"
+#include "meson_registers.h"
+#include "meson_venc.h"
+#include "meson_vclk.h"
+
+struct meson_encoder_dsi {
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct meson_drm *priv;
+};
+
+#define bridge_to_meson_encoder_dsi(x) \
+	container_of(x, struct meson_encoder_dsi, bridge)
+
+static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
+				 &encoder_dsi->bridge, flags);
+}
+
+static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       const struct drm_display_mode *adjusted_mode)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = encoder_dsi->priv;
+
+	meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
+
+	meson_venc_mipi_dsi_mode_set(priv, mode);
+	meson_encl_load_gamma(priv);
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
+			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
+}
+
+static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = encoder_dsi->priv;
+
+	writel_bits_relaxed(BIT(0), 0, priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
+
+	writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
+}
+
+static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_dsi *meson_encoder_dsi =
+					bridge_to_meson_encoder_dsi(bridge);
+	struct meson_drm *priv = meson_encoder_dsi->priv;
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_bits_relaxed(BIT(0), BIT(0), priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
+}
+
+static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
+	.attach	= meson_encoder_dsi_attach,
+	/*
+	 * TOFIX: remove when dw-mipi-dsi moves out of mode_set
+	 * We should get rid of mode_set, but until dw-mipi-dsi uses it
+	 * we need to setup the pixel clock before the following
+	 * bridge tries to setup the HW.
+	 */
+	.mode_set = meson_encoder_dsi_mode_set,
+	.atomic_enable = meson_encoder_dsi_atomic_enable,
+	.atomic_disable	= meson_encoder_dsi_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+int meson_encoder_dsi_init(struct meson_drm *priv)
+{
+	struct meson_encoder_dsi *meson_encoder_dsi;
+	struct device_node *remote;
+	int ret;
+
+	meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
+	if (!meson_encoder_dsi)
+		return -ENOMEM;
+
+	/* DSI Transceiver Bridge */
+	remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
+	if (!remote) {
+		dev_err(priv->dev, "DSI transceiver device is disabled");
+		return 0;
+	}
+
+	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	if (!meson_encoder_dsi->next_bridge) {
+		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge\n");
+		return -EPROBE_DEFER;
+	}
+
+	/* DSI Encoder Bridge */
+	meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
+	meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
+	meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+
+	drm_bridge_add(&meson_encoder_dsi->bridge);
+
+	meson_encoder_dsi->priv = priv;
+
+	/* Encoder */
+	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+				      DRM_MODE_ENCODER_DSI);
+	if (ret) {
+		dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
+		return ret;
+	}
+
+	meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
+
+	/* Attach DSI Encoder Bridge to Encoder */
+	ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * We should have now in place:
+	 * encoder->[dsi encoder bridge]->[dw-mipi-dsi bridge]->[panel bridge]->[panel]
+	 */
+
+	dev_dbg(priv->dev, "DSI encoder initialized\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
new file mode 100644
index 000000000000..0f4b641eb633
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef __MESON_ENCODER_DSI_H
+#define __MESON_ENCODER_DSI_H
+
+int meson_encoder_dsi_init(struct meson_drm *priv);
+
+#endif /* __MESON_ENCODER_DSI_H */
-- 
2.25.1

