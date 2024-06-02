Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2228D7539
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E28110E127;
	Sun,  2 Jun 2024 12:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uLmAiim9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827EE10E0F7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b88740a93so2385701e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329892; x=1717934692; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gC4tSJBea8UmW/N+lhpg1fIpD1gqTE3H4TGkKQw6PNs=;
 b=uLmAiim91LKVsdinwHvDbkZ143upWpcJ8iqLA7+hS9YbA9Qqx9iCa3Ys0Ep5g6H0Iw
 vd8wkQRjyfCV6N85L/rw6/F7pflWxaQft+tRpABCN5h/zYm8d8P9oRn+uiF8oqywJvqL
 4CRi/R2IH8S3Z1+P8FDicUn/5OnkhWvln3OcPFmwOBw5rS9L4tkQZ8OG8x8tty6FLBaL
 8WJulvFvP9sPHbNu+eQvkmuHaA3+jOH2MqHMcc3dlio2whn5v7wl8ZqcesC7xozErmzT
 AHFfXqJBKqZnEaASz/Lgj/kxp02bBF4kkIY/yJbF69z0PsF/aVhtZ5ry3oP2doP2VuOR
 eVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329892; x=1717934692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gC4tSJBea8UmW/N+lhpg1fIpD1gqTE3H4TGkKQw6PNs=;
 b=HaGKagkUAH26TGCMxXdA6DjFQDnMy7/h0TTYjEPwANVS48QDrg+0jjHjymSvIbAFAq
 RvdR6Sq+lIchMF60Gz0QQNGAhNYDFDqaM2FYXFR1GtYxFDjYL1JTscPJTqoZMNVKukII
 u862wgLfQCC/4d3HEgxST5xppWydH6FfGGqEcftAXXFNU6ZRbvncGJlWwnzrl/W3hCyb
 N4CmO8xwQdThIfkHmnKASF6d0g77KgJ0Kc0RoOcXNBS4CLnwEuyuUmSuHrfoJBnvx180
 NF3vI3R3Svh6sMDRmIYVclIeCTHUumcqEY4JCB3b0iiMLXs9wZzkh6ed1cpst7ECa/tx
 2Tzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+3xGrzLI3rXmMNvW+ubb5xKH78OpuM7Yir1MScnrKKoxpCOyKJxuNlb+Fvr1ThOFY6BRYvE4Inoa2qpDQC+Or6Z+Mz4xFNsHHucFmfo0t
X-Gm-Message-State: AOJu0Yx8d3EbEKukzm1A+hpSmuJrvWl6SMG5vUEnK5qMgacojdtPf4fi
 OSorIAcQ8qeBI2ytpD0E6xF/qNbSwMSmY9rWYLpd9aDDNFHsQ7NmL/2C7ICsJV4=
X-Google-Smtp-Source: AGHT+IHXq2dXnaN4xvg4VJ6ZhYzE3eiC4TjSwrCDwgXw0dsCBzUpfF8VdkGxF7KGe/zlEOchf5dRmQ==
X-Received: by 2002:a19:7708:0:b0:51d:3f07:c93c with SMTP id
 2adb3069b0e04-52b89560924mr4547518e87.3.1717329892477; 
 Sun, 02 Jun 2024 05:04:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:47 +0300
Subject: [PATCH v3 07/12] drm/imx: ldb: switch to drm_panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-7-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4752;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WBClGWrNVswdIn4UlsSFs/7q2W6RzczPr0uXKZRLUaE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/dMKaGCWF4xzbQpN9kDrjKai+DQFg5AY1OU
 B3N3BGopfKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1W8bB/0W9wht582BaLK/4++Mstz6lJY9J8D8p9faJd+tTSYsGFkysEZkXrFJ3nZhT6mNGzNkRQ6
 QXSlyP4rfJ1d3lmEYkjo8fN09pK9Sp+lx8c4+F7Kvp7ck8Y/1OeMIu/LitOdjJW3trxUGqD2u8I
 uocvla1K0+SsLtT1KrA/z9bh/OFaXpX7DIMbjB3hce0HIv0BIT/adoGSrinENUDL/uRN1i8/wl1
 nd4klFahiXtNXeALmLY7inN9GTE/cThbtJyX3Uz48ReTPC+hjdRO8GVmXmWx7HPyMpTZwXpNEOa
 9XT024wPuNoOU5VQ5xKjJ8rPzjXFeI9wvCpCHkXx2E+UgVpc
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

Defer panel handling to drm_panel_bridge, unifying codepaths for the
panel and bridge cases. The MFD_SYSCON symbol is moved to select to
prevent Kconfig symbol loops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig   |  6 +++--
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 44 ++++++++++++-------------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index bacf0655ebaf..6abcf9c833d4 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -26,9 +26,11 @@ config DRM_IMX_TVE
 
 config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
-	depends on DRM_IMX && MFD_SYSCON
+	depends on DRM_IMX
 	depends on COMMON_CLK
-	select DRM_PANEL
+	select MFD_SYSCON
+	select DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 3f669604377e..bc7ad9697130 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -27,7 +27,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -64,8 +63,6 @@ struct imx_ldb;
 struct imx_ldb_channel {
 	struct imx_ldb *ldb;
 
-	/* Defines what is connected to the ldb, only one at a time */
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
@@ -135,10 +132,6 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	struct imx_ldb_channel *imx_ldb_ch = con_to_imx_ldb_ch(connector);
 	int num_modes;
 
-	num_modes = drm_panel_get_modes(imx_ldb_ch->panel, connector);
-	if (num_modes > 0)
-		return num_modes;
-
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -193,8 +186,6 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	drm_panel_prepare(imx_ldb_ch->panel);
-
 	if (dual) {
 		clk_set_parent(ldb->clk_sel[mux], ldb->clk[0]);
 		clk_set_parent(ldb->clk_sel[mux], ldb->clk[1]);
@@ -233,8 +224,6 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	regmap_write(ldb->regmap, IOMUXC_GPR2, ldb->ldb_ctrl);
-
-	drm_panel_enable(imx_ldb_ch->panel);
 }
 
 static void
@@ -311,8 +300,6 @@ static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
 	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
 	int mux, ret;
 
-	drm_panel_disable(imx_ldb_ch->panel);
-
 	if (imx_ldb_ch == &ldb->channel[0] || dual)
 		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
 	if (imx_ldb_ch == &ldb->channel[1] || dual)
@@ -346,8 +333,6 @@ static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
 		dev_err(ldb->dev,
 			"unable to set di%d parent clock to original parent\n",
 			mux);
-
-	drm_panel_unprepare(imx_ldb_ch->panel);
 }
 
 static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
@@ -640,13 +625,15 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		 * The output port is port@4 with an external 4-port mux or
 		 * port@2 with the internal 2-port mux.
 		 */
-		ret = drm_of_find_panel_or_bridge(child,
-						  imx_ldb->lvds_mux ? 4 : 2, 0,
-						  &channel->panel, &channel->bridge);
-		if (ret && ret != -ENODEV)
-			goto free_child;
+		channel->bridge = devm_drm_of_get_bridge(dev, child,
+						imx_ldb->lvds_mux ? 4 : 2, 0);
+		if (IS_ERR(channel->bridge)) {
+			ret = PTR_ERR(channel->bridge);
+			if (ret != -ENODEV)
+				goto free_child;
+
+			channel->bridge = NULL;
 
-		if (!channel->bridge && !channel->panel) {
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
 						      &channel->bus_flags,
@@ -658,15 +645,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		}
 
 		bus_format = of_get_bus_format(dev, child);
-		if (bus_format == -EINVAL) {
-			/*
-			 * If no bus format was specified in the device tree,
-			 * we can still get it from the connected panel later.
-			 */
-			if (channel->panel && channel->panel->funcs &&
-			    channel->panel->funcs->get_modes)
-				bus_format = 0;
-		}
+		/*
+		 * If no bus format was specified in the device tree,
+		 * we can still get it from the connected panel later.
+		 */
+		if (bus_format == -EINVAL && channel->bridge)
+			bus_format = 0;
 		if (bus_format < 0) {
 			dev_err(dev, "could not determine data mapping: %d\n",
 				bus_format);

-- 
2.39.2

