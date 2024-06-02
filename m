Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AA8D753F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DF910E194;
	Sun,  2 Jun 2024 12:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZuCP6Ypu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B9B10E12E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:55 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52b82d57963so3289783e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329894; x=1717934694; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YwLGlhS8c4MSDhZlnMfqrMoYx9jr0+buWOu6Q2vrZUo=;
 b=ZuCP6YpucNncJwzPiek/NrZsLsoTxM8tCJOtKHNfwm9DQzesue2gEsrni2QaNrhELx
 xZ2K18tm206V77HdBGYIdD3kLnjWxfyJW+uKOMnFAgiWPQCO+nq4bLKxpVDLP7WL75YC
 i0K8AqauKF3foFUoNiQjgxrAZ8+u2bWUwA9tmMIlskH+73Rr82jNIm2KZdDovQdmEPg9
 02wB2BeMlIYfaBuxx69JDlGszky2SxYoZKnMdLZzteoggX22v0Qb2drQsqoX53eSNwb3
 pYG64hoYw704R2wtHzr8wdzGLTbDyLkX2AsMjv5L8AkKuTNMUCmg/UlO+F7Zj+3mwo/A
 h6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329894; x=1717934694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwLGlhS8c4MSDhZlnMfqrMoYx9jr0+buWOu6Q2vrZUo=;
 b=LWuZpqa0kGEKBqXjPBBd9XwJZKyLD5vEMLIegndg/O3rZp/Ua+RJXIredcNtn/FYkD
 C24ZNx4OB4NDyZj+g8ZoTZ7rusm1GpbqGyropdUEZccAGW2Hsrzwh2vwUtIJzLRSztSB
 7c9GIUoDXMDbSvCKt/sWtGI9eQOMvB/LpvSXHImcfkzORGDi5Ccx3Rv5539oTzGnYI3u
 1IjgLlfS+8pYKJmzrk8Bf/qV7Td5miYxlSV9IgzPk/Cry+G0th9cE1gxT2PqPv7Twstp
 QGZDlw0nIzS4k0hJet2iPOTDYSEAt0CccZnWX+aQG11NeqsanMNjt92F+daCa4KZ0GCg
 sryw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx6yOP7ZaxM7F9m/EMRv4pAlZYHUYus7ccC4bDtln3ZdHZcn6JC91Q0DtDHGNidjHeDGZTdheKE2IYHQLpOOY3UleVbBTGKWuWIMKgiSF+
X-Gm-Message-State: AOJu0YyNWMoKVNtQMp2YjYcNA3zDN2dX03MeCur7LTu8aaFEr2+/2sgK
 fPEFDW/w8o1XH3MgdHPHsy3er6Rx931HGToKplLRG9GRfEg3sexg4kVGJzOzXis=
X-Google-Smtp-Source: AGHT+IHQTqu9po4Q58mn5dmh/iNF52AD9wdFkQoRIF/Qt4N/Ulzqw4wOqZkzdJsVft3tRiPNgYeHdg==
X-Received: by 2002:ac2:4556:0:b0:526:81ab:191 with SMTP id
 2adb3069b0e04-52b8970078fmr3604279e87.60.1717329894052; 
 Sun, 02 Jun 2024 05:04:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:49 +0300
Subject: [PATCH v3 09/12] drm/imx: add internal bridge handling
 display-timings DT node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-9-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5qwH6l5MO1K0SbjK3RylTsbBZG/ntitWTbJUNUocDzw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/d/Fah3CGztXwsM4kY3CMDCT+cEaYdiMGWa
 3/3qeABMJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1YFGCACQRurwdwe8yveOmxw8xeQgho8g6nkzyJ3kQ+gCq9JB2tSgAze+ZI4VDVW41MZ5u77trMB
 jfxDeC7F4oSTGz0+cvoLiqd5iFxLg7fOsLjLaW0XsFp5HqR2Ujgj69oLKtl3eCZwW93VtLwVjCV
 QF20Qc398qLsZoCWU/DUtwvUYH2kchX/mmQ/gLK9qeM+b8/FuKCix3CWW+BrLY3dWXAy5bxKdFS
 vUdTre5Ulmcdhsz8hpehTUDFyUjcRd3913TosViZUGou2j6GgO3dytGOOZ4mZIuzqodgchDtXBv
 Ma13/Sp4iomIpGUDn+j9HQWTADrjoZgk42vPGI3UD63QZZHP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

i.MX DRM DT bindings allow using either a proper panel / bridge graph to
provide information about connected panels, or just a display-timings DT
node, describing just the timings and the flags. Add helper bridge
driver supporting the latter usecase. It will be used by both LDB and
parallel-display drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/imx/Kconfig             | 10 +++
 drivers/gpu/drm/bridge/imx/Makefile            |  1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 85 ++++++++++++++++++++++++++
 include/drm/bridge/imx.h                       | 13 ++++
 4 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 8dd89efa8ea7..9a480c6abb85 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -3,6 +3,16 @@ if ARCH_MXC || COMPILE_TEST
 config DRM_IMX_LDB_HELPER
 	tristate
 
+config DRM_IMX_LEGACY_BRIDGE
+	tristate
+	depends on DRM_IMX
+	help
+	  This is a DRM bridge implementation for the DRM i.MX IPUv3 driver,
+	  that uses of_get_drm_display_mode to acquire display mode.
+
+	  Newer designs should not use this bridge and should use proper panel
+	  driver instead.
+
 config DRM_IMX8MP_DW_HDMI_BRIDGE
 	tristate "Freescale i.MX8MP HDMI-TX bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index edb0a7b71b30..dd5d48584806 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
new file mode 100644
index 000000000000..fb3a030928f0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Freescale i.MX drm driver
+ *
+ * bridge driver for legacy DT bindings, utilizing display-timings node
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/bridge/imx.h>
+
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
+
+struct imx_legacy_bridge {
+	struct drm_bridge base;
+
+	struct drm_display_mode mode;
+	u32 bus_flags;
+};
+
+#define to_imx_legacy_bridge(bridge)	container_of(bridge, struct imx_legacy_bridge, base)
+
+static int imx_legacy_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int imx_legacy_bridge_get_modes(struct drm_bridge *bridge,
+				       struct drm_connector *connector)
+{
+	struct imx_legacy_bridge *imx_bridge = to_imx_legacy_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &imx_bridge->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = imx_bridge->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs imx_legacy_bridge_funcs = {
+	.attach = imx_legacy_bridge_attach,
+	.get_modes = imx_legacy_bridge_get_modes,
+};
+
+struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
+					      struct device_node *np,
+					      int type)
+{
+	struct imx_legacy_bridge *imx_bridge;
+	int ret;
+
+	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
+	if (!imx_bridge)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_get_drm_display_mode(np,
+				      &imx_bridge->mode,
+				      &imx_bridge->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ERR_PTR(ret);
+
+	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	imx_bridge->base.funcs = &imx_legacy_bridge_funcs;
+	imx_bridge->base.of_node = np;
+	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	imx_bridge->base.type = type;
+
+       ret = devm_drm_bridge_add(dev, &imx_bridge->base);
+       if (ret)
+               return ERR_PTR(ret);
+
+	return &imx_bridge->base;
+}
+EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
new file mode 100644
index 000000000000..e14f429a9ca2
--- /dev/null
+++ b/include/drm/bridge/imx.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ */
+
+#ifndef DRM_IMX_BRIDGE_H
+#define DRM_IMX_BRIDGE_H
+
+struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
+					      struct device_node *np,
+					      int type);
+
+#endif

-- 
2.39.2

