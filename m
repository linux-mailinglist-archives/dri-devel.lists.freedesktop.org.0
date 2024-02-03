Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75C848792
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00110EA3E;
	Sat,  3 Feb 2024 16:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YpDm/HNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AE510EA32
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:12 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7bf0f3bf331so130811939f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979252; x=1707584052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nS1U6CsEeokUdAK6p14gWlLI/p7zyPtTy5BLbUv6Q3Y=;
 b=YpDm/HNzIta9LzuUgh7Z3j8N4TykidmgXHxg8BEK0S9vWzINjOQwUey4T9t7ADtuIb
 xEaYqhDRiOfTrCSEmVB8OPkUl4u11Xijity9xVYqbjs7m2y0+t06rZuDqtxpqErEyjZu
 UoEQMRBZOYuY1/puYVrb+EO9/RLpKFrsv9+tFESOZtNGZF/6voVPW+Va7/qa2b/TCA2v
 ZBZNdBdPQofkjqADEo8yAqscXw/jwGOuSh+YFB0uGljIhmsrpWMH4vYpsLgq1j/WmZWY
 TquQLFQcHx7cjAvA7+xLH4e0tEHC1y+fSIOpBF6uPO736brmN41yYvVwnSzKPkEv9gRD
 IdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979252; x=1707584052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nS1U6CsEeokUdAK6p14gWlLI/p7zyPtTy5BLbUv6Q3Y=;
 b=bKIprM3BUKErLCiv8O8TazjjO+p9vONq3/k4QFN0OvCQsSqZIO7XJRbOrj/T4UVOIJ
 +XQjZaZThdYYANaPogYj6qd+IgALwH1LsYICd47cLMfLl0gKZWB7eUKG5LFJt0lBcMy0
 TXfdVELNLwAECkXgo+uLDzAu0NJCevmLMhQrw7KDbdG0jpfLQjvsnwBfb9/hBS/hiO4X
 QfAYaipVS8zv/1TG8usOd8di0n1z4iOCsnpg2GEyRLBbKkgEEgq5a85aefavGOb5+klU
 QF8rRkwUAV96S5f5VRI9e60idLOPrYWdDyc81BDEdxvGK3h366YXIZ50o5FHpNrR6096
 Bfhg==
X-Gm-Message-State: AOJu0Yx4jpQJ/avPFI7NPqeqpXXeoaHhz+EsSnXmoPqUSVOf5++69TQv
 mae95YSAuNbe+jqSFrW60SM20HwySEP4tbrzdZGWVg4EyVDNtfph
X-Google-Smtp-Source: AGHT+IFrrWdkMpDl5OZYBiBfbxaXp3K9xnVbfleGcTWpBuTBqAMQ2JwvReCiRUHRHQTm8YfOKToKsQ==
X-Received: by 2002:a5e:dc43:0:b0:7bf:da4d:3477 with SMTP id
 s3-20020a5edc43000000b007bfda4d3477mr12909894iop.9.1706979251851; 
 Sat, 03 Feb 2024 08:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWtJ3htmPbVibzr6e+4lQlOltg/gjP51UEUwO3KrmFljhhl5pWMKK9VZbywdm8qKxEksEtRtyXaaABe21u/XY9kBnWNeb5ACbwKIezVpe0uAKNNmNZgOrvuPFe4/yko2uwZuaX9ZuRnZEI9ZIZ2doxFNAIAio5aIxeOUm+jS+3hSf6OEkxpi5vGiCS3HUdmWtdwYI13pfK/d2iOyC5IQ6z1dDC70AKp1GY/udpFYQgJg1u3dUh+a3S1VrO2f0mCa/9FoNbBOE6GFbK+/jpZdVPAm7X6Mt0ytgwUbVGQ//znjDMQjA/3BA5QFN4V8+C6Nb/G2uYtH3vZa3oT3hIcRGUzREv0DaqhJkpzarzCjD3iICg+QPOqF7r3eFHuZWgfSE2p/xBckhEuaN5fC/2dr8ljB1uNBxClNLEZHNlAVWJ8Xu1sToM550SOvB1bC1SEm3OXmqqq2QxAdWZv/Y/XCpRdt8+2vFj8t+OagQCXbFco6V+2BJoWnEyTC6bkx5OwE5IALra9l7gE8X4+wQscveFtdwVltDcGq8pH+cBIQAQH6PH/jo6Om/3gRdmX3o6Uq1EzRcNLuXjO4bZj1x5Ej+/IG+lkIakEzBlaMC9lW2ydCYDEV98g+V/tGaQEXPZSuTMJbsm8OuUYJWTee7ZADdRYIJuRlKbHE2qPUL5ZjFyBi0j9iagnpEjKj6MNIx6EBwe76JTUK78e5FcC2jwU4Q54jSi1z7cI1CRHoO+RoeGm5Ef9jnBy5YNhKoFGdZYVrL0A8pjzWmj1FJ07W1MGA8phDBWUgtV6E5kIZ+gyVMD/qCn0Q//t1mYVOFGBmzRNRJE4rb+xvOPafqyZyhj0z2F9ALYwuEX9685QpY1zJC364Gw614rVX/42vo/LBf5t39N/W9WHQQyfitVcqxh7Ee5YkoRC7ge7Bc2TcVKymG4AcEd29eO/Ad8rS+9wVeOR4/nSO1
 AA2DxDnPtlcFS0Uyl6gXJ1pvSU98BPb9FuhJT+wtGQECFTYIRCCD3l7aUl7tb+dZIlTSWSRaTECmYXgD/n1twe3NLsnAHnOTOKcsN9mXTPv05Y6ZXEyah6i8LRal+ZShTupWEfcW69K7yX+6l1UNwMboVQ+Qr1kLob2n9LFgMYeF2OHD77j1eU8+rvNJN/WOPn1f2rSD4LS482dhwTTtipgjowm052XOo0JXXEAFIgVIkItlAFuEEbO3beWbvZfBhc5QiXYCsTzs0ovP+HtjWRQOFi3+w8u7msJPr1AFr9wDGdBlmumRUA9ku41IX9jThWYGI6u31VJ7sP9npKHlEJVMo=
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:10 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [PATCH V8 08/12] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Date: Sat,  3 Feb 2024 10:52:48 -0600
Message-ID: <20240203165307.7806-9-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
full timing generator and can switch between different video sources. On
the i.MX8MP however the only supported source is the LCDIF. The block
just needs to be powered up and told about the polarity of the video
sync signals to act in bypass mode.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
Tested-by: Marek Vasut <marex@denx.de> (v1)
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V8:  No Change

V7:  Re-do some includes to address build issues after rebasing from
     Linux-next

V6:  No change.

V5:  I (Adam) tried to help move this along, so I took Lucas' patch and
     attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.
     No changes from V4 to V5
---
 drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 207 +++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c

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

