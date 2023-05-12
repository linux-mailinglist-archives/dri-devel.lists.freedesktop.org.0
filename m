Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2857008B8
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424F010E6A0;
	Fri, 12 May 2023 13:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF2D10E6A0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:12:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4449fa085so25749005e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897122; x=1686489122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7b90wZD8kl4nSe3L54vqh3vzRZZbXkNospgY2qCejUs=;
 b=yI2/VTaYsDKekDUxX3m1eXWkp2TR3ofEAIJSz6ah2AGopChpKZjFhupSCYLZF5SHZI
 pof/haujLQyfMZa8CqzUpaLlqislbpvLX1Mxl3zxDzJZVPVDHiU+Wc4fPHb7ftfxlg/R
 CUwqQnoinj/uFK8azdHs35qBgAsf8bPOIGR+l1u5erxpGuKspNAh5kQfZckWjQU7Nopw
 xsXd9AUC8EUie0is0OQj54kemYrvRYdPytDSuiF5kUoN5IgBHw3mvF/GkK/wBRw+mSQH
 CdD9Cp3LW2lAaJAvD4O7uqjbGYwjeOaea6xJ6GYBU4nrY2EFFOT00BFAJtTU1gVI5zzt
 TMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897122; x=1686489122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7b90wZD8kl4nSe3L54vqh3vzRZZbXkNospgY2qCejUs=;
 b=j0e0kxkv/hzaj49rlesd6R0GC35C1xx4T6aUNLJqKknQE5G8yRN+Nry4iVklLvFqPa
 /VnBLMC9J7fL2Qnd1sRWLp/jJqYCZBPYAb5kuJfnFFXjURJzl7bJBkGyzcScS1RwAZed
 P/EwGriW36RaGcg/Y6ibQucTrckTGmLfZCpnslb5XTP9m+faxZjetv3RhhcoYXZHPrXH
 +cKR5UxXkOe7Cgdc6z6YfbhHCgVRjkLfzKe+TGM7/+9gbXBIPRRvSsR+rVcHmNL/KruD
 0r2SdxT+z0lf45A9XV+tB0rM9x5Vs5ZpJYpYwaIqbLQ4zORzOBLBrp2ZVQrZ8054au6X
 cCYQ==
X-Gm-Message-State: AC+VfDx3nHaKvkniz99xBORhcbTqdBEWW/CzDb8HXUcmTd9jd0XraDft
 MBSFtbDm83z9ChOyKVZYuZg8Nw==
X-Google-Smtp-Source: ACHHUZ6IulSV4BEpEuCbtSOSt/0uv03yfEvODajkoW21O50J9lsQFhIrlZhKcn5YX/szOGrxz+CRzw==
X-Received: by 2002:a5d:4848:0:b0:306:3284:824f with SMTP id
 n8-20020a5d4848000000b003063284824fmr15495923wrs.8.1683897122067; 
 Fri, 12 May 2023 06:12:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:12:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:39 +0200
Subject: [PATCH v4 08/13] drm/meson: add DSI encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-8-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HX4/37GDlHAGNLHUHVTRUc93uf2l6U5h3hplLWCS/to=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsVHcarE36UT+Ibqtz4ewrBGuSC/NaLtMhxaQN7
 3iolF6WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FQAKCRB33NvayMhJ0ZJoEA
 CSoO1Zuzyw4XWR/XDxUtYBs9dF4ddRxOrmvz+VrpOKxM4+OfwCDuUoQPKaiZBVp3WQgoYVIvl+ZM3N
 iMhZy3DZFUE4e8izSnvvXjN/nb9FhoW3xyFCKzRsj/QLk4WdwMQJE/orLpQOSXYE2/oWuNkS57UxE6
 AVNqEcXZdsIr/3btlXh4BYtZBsSXYcMMz4pm+Y9HlcYU8lj2MyAVlkD/ApmGRbakBTrD4gAwHPNFZC
 jcorXEzD0V9dULFJJxMVfsiKAsNKdRIOLHDDGdNdv6CIN0WiPjJBPYidy/1C9opkRPjF/aWcI78o2Q
 f68bimy0bwY/DlO9reNBNIDxzn7OQ2r/O3eWqsq8SFQX8zISeJGMvSyvDYf7bfPCWAczSWsLw4DR1k
 gt54yU2rYeRLjSB5aKuRWR5FvTnqWX34G7KHQBTPsDsnljyei/kNrOMuEcGPkU1XPalNtJLml9vwIb
 IvHSAzrZSP8h+vJet3ofQeu8OzSGUlNSLzKI/EuVqHLdon0iQQ2W9v5XC7ps7TDlR/pzceZYBhti8n
 XA+yaA9fwnQPsHFuNWPF18znRzDDA/0qlfH/V0QsQFhhQfjYMmoiQgNEaydGHHUnLFRzs3+lMbBrnL
 +seQ3QyU77d8FfDzKSxkvNPhBYzaQ9SS6glpamCtcufDuQalm4LHZa4If1Bg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds an encoder bridge designed to drive a MIPI-DSI display
by using the ENCL encoder through the internal MIPI DSI transceiver
connected to the output of the ENCL pixel encoder.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/Makefile            |   2 +-
 drivers/gpu/drm/meson/meson_drv.c         |   9 ++
 drivers/gpu/drm/meson/meson_drv.h         |   1 +
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 174 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h |  13 +++
 5 files changed, 198 insertions(+), 1 deletion(-)

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
index a30d61f1c817..7939f8a9ccb5 100644
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
@@ -329,6 +330,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (ret)
 		goto exit_afbcd;
 
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		ret = meson_encoder_dsi_init(priv);
+		if (ret)
+			goto exit_afbcd;
+	}
+
 	ret = meson_plane_create(priv);
 	if (ret)
 		goto exit_afbcd;
@@ -367,6 +374,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 free_drm:
 	drm_dev_put(drm);
 
+	meson_encoder_dsi_remove(priv);
 	meson_encoder_hdmi_remove(priv);
 	meson_encoder_cvbs_remove(priv);
 
@@ -399,6 +407,7 @@ static void meson_drv_unbind(struct device *dev)
 	free_irq(priv->vsync_irq, drm);
 	drm_dev_put(drm);
 
+	meson_encoder_dsi_remove(priv);
 	meson_encoder_hdmi_remove(priv);
 	meson_encoder_cvbs_remove(priv);
 
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index c62ee358456f..b23009a3380f 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -28,6 +28,7 @@ enum vpu_compatible {
 enum {
 	MESON_ENC_CVBS = 0,
 	MESON_ENC_HDMI,
+	MESON_ENC_DSI,
 	MESON_ENC_LAST,
 };
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
new file mode 100644
index 000000000000..812e172dec63
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -0,0 +1,174 @@
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
+static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state)
+{
+	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
+	struct drm_atomic_state *state = bridge_state->base.state;
+	struct meson_drm *priv = encoder_dsi->priv;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	/* ENCL clock setup is handled by CCF */
+
+	meson_venc_mipi_dsi_mode_set(priv, &crtc_state->adjusted_mode);
+	meson_encl_load_gamma(priv);
+
+	writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
+
+	writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
+			    priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
+	writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
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
+	priv->encoders[MESON_ENC_DSI] = meson_encoder_dsi;
+
+	dev_dbg(priv->dev, "DSI encoder initialized\n");
+
+	return 0;
+}
+
+void meson_encoder_dsi_remove(struct meson_drm *priv)
+{
+	struct meson_encoder_dsi *meson_encoder_dsi;
+
+	if (priv->encoders[MESON_ENC_DSI]) {
+		meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
+		drm_bridge_remove(&meson_encoder_dsi->bridge);
+		drm_bridge_remove(meson_encoder_dsi->next_bridge);
+	}
+}
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.h b/drivers/gpu/drm/meson/meson_encoder_dsi.h
new file mode 100644
index 000000000000..9277d7015193
--- /dev/null
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.h
@@ -0,0 +1,13 @@
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
+void meson_encoder_dsi_remove(struct meson_drm *priv);
+
+#endif /* __MESON_ENCODER_DSI_H */

-- 
2.34.1

