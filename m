Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF9487952
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 15:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C9210F2A2;
	Fri,  7 Jan 2022 14:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37810F1A8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 14:55:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a5so7572122wrh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 06:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pH379CUx9SqYQtsjqTbRgt/h2k+Hd5kPDf3t6149ND8=;
 b=GHa8u2e0GAf1bPSMl+nBzDxtnc6B4622/Oz1G2G9K/+Rh2BLPkgC2uufWrkQPZ+pp9
 sOZebXOlSZGCi9y5l2p8VMYdKgzzdxXIOQGnMs6EsTjB1kkM1UW5eYOHhcb+wjFgYJVp
 ig1zIZcctF6/ChGxXO76wgdQh+ev3U0qQ8g58/MQiapChbyYjJHI2nW4AkWQMpFsEFOi
 xXFgeNOCgaJjWU6B75aslToa/f7/0ZdwQoekgy38sxntYtxYOChxUg8/9cga5l4K9kgk
 YExAFd5KOQ4nyS0IvFU1KOM9rGDX/uHDI2g1xW2PdNNI1EJzJW3uS85Twjty51tDf4aY
 E2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pH379CUx9SqYQtsjqTbRgt/h2k+Hd5kPDf3t6149ND8=;
 b=qP6Nw9LcIqJU/djE8ya55ss701gLg8R4xosZFoIBta+ICsbNVEdmZfgXWHpUM+gHrY
 k05uCFnU5TVIip4Ft6uwcDEnY8w/JQ8p6OfhXN4PxNUxkvbWrB6/8gaZKGWWUdlw1mh3
 EiA0Eja9MBluXQ6UjDzukg3nKP0XgDs378aVbw6a7kaDsLAF2asSX0kwavOaqDjTGsXJ
 jxS1dY6epRtc8w28A5wgcHcYYyA2Fz6Y9FhDfn59qWzV2Dz5MwfkFcn6fBtdh9qeC6eu
 bRs+5wybw1JSlX9LSZmoWtE5j6fQxklYkMxmMm9vl4jyVKfUWKN1IeZPU6J0/2r+qplU
 xZaQ==
X-Gm-Message-State: AOAM530D9FvdV9tyXMsUP0+rsFPolcN8I1fii5rK8wssdd7NPWGt64rd
 FPvoUEsg16ywZ7cfODRZCxpx4giGZQ4ElA==
X-Google-Smtp-Source: ABdhPJzlKJM2RXWPDo0ax+J98IJprBkTZIzh/+4tXwr1Zfb0X6nvDowbiFqyP6NrJsPG78hct601TQ==
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr53590278wri.203.1641567329557; 
 Fri, 07 Jan 2022 06:55:29 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:28 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/meson: add DSI encoder
Date: Fri,  7 Jan 2022 15:55:14 +0100
Message-Id: <20220107145515.613009-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds an encoder bridge designed to drive a MIPI-DSI display
by using the ENCL encoder through the internal MIPI DSI transceiver
connected to the output of the ENCL pixel encoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/Makefile            |   2 +-
 drivers/gpu/drm/meson/meson_drv.c         |   7 +
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 159 ++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h |  12 ++
 4 files changed, 179 insertions(+), 1 deletion(-)
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
index 80f1d439841a..ff278a2b9e6e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -33,6 +33,7 @@
 #include "meson_registers.h"
 #include "meson_encoder_cvbs.h"
 #include "meson_encoder_hdmi.h"
+#include "meson_encoder_dsi.h"
 #include "meson_viu.h"
 #include "meson_vpp.h"
 #include "meson_rdma.h"
@@ -323,6 +324,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto free_drm;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		ret = meson_encoder_dsi_init(priv);
+		if (ret)
+			goto free_drm;
+	}
+
 	ret = meson_plane_create(priv);
 	if (ret)
 		goto free_drm;
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
new file mode 100644
index 000000000000..90347821cf96
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -0,0 +1,159 @@
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
+	writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
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
+		dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
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

