Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54A6B0EF6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CF10E699;
	Wed,  8 Mar 2023 16:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105D110E699
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:41:10 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i10so18187351plr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsgY6N6catKRCRfBq6xxwmLwSB7PaDK4tqNXn1E6zOw=;
 b=EKUzQ+uf2Qr4D2RH7a4R6f7r7LAQRae2J1OTJH2ZhmNisTdUXzKZKtmUvsPNZvXWIl
 wF0q8v5gBfw1kku7VGfXDWf0oWPJgvBlF/xZl17eOl2xh1U7ZNa2oMvt1QHqvBnVtcwp
 6pk1XNfWVu9aWPHnBVGAO2UcLQnd9qNSQd/Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsgY6N6catKRCRfBq6xxwmLwSB7PaDK4tqNXn1E6zOw=;
 b=wPRP4FMfQvk2brA8p5VHmDKUhOUQ4l25UCEm+BxJLAbgwIYKIp/jOKjGDsp6+cci7M
 LPjTh4r000ApoS3O9jR5WwjyBtaZg0XygmkQAurj3dED4XBsLY/7qpLPVM159QdkOk99
 7Fu2p5u05d4Spv5gZr1iE21vA4njxyQwlnJ1pMmuY5vSKjKLGroJeDIjpGrXVWQHzO8A
 OEYAb/5XPPjp7ZwhOgOXJsyclu4pdcBWjXL8uUbyXdIC2CPvEv3I5BwMjumFq1/GNfix
 YaRfIJdab1n3rcpmpqDBUJgN0/BsuYsr9iZ7sVS3axj5eqtfeGgQf7/8mA3Du14k2ho4
 hzUw==
X-Gm-Message-State: AO0yUKWy9SIb/YfDBFt4ZX1TsAvkeYrd3JyHHDHlNGabCZ5i8maeqTdW
 KSKLHN1NsoBjBFXzAqyffvgoTw==
X-Google-Smtp-Source: AK7set/gQAe3+o6+VsYiC9qcYya5fmJvkX7EmdiPMEJ9xkJP/megCncb/lLPrMvLCCKP5+9ZHN9f4A==
X-Received: by 2002:a17:903:244b:b0:19c:c9da:a62e with SMTP id
 l11-20020a170903244b00b0019cc9daa62emr22126627pls.54.1678293669560; 
 Wed, 08 Mar 2023 08:41:09 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:41:09 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 09/16] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Date: Wed,  8 Mar 2023 22:09:46 +0530
Message-Id: <20230308163953.28506-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finding the right input bus format throughout the pipeline is hard
so add atomic_get_input_bus_fmts callback and initialize with the
proper input format from list of supported output formats.

This format can be used in pipeline for negotiating bus format between
the DSI-end of this bridge and the other component closer to pipeline
components.

List of Pixel formats are taken from,
AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
3.7.4 Pixel formats
Table 14. DSI pixel packing formats

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- none 
Changes for v15:
- collect RB from Marek
Changes for v12:
- update the logic suggested by Marek
Changes for v11:
- collect RB from Frieder
- drop extra line
Changes for v10:
- none
Changes for v9:
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20, MEDIA_BUS_FMT_YUYV12_1X24
Changes for v8:
- added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
Changes for v7 - v4:
- none
Changes for v3:
- include media-bus-format.h
Changes for v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0c480be5f070..bd3bb8622ca3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/gpio/consumer.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
@@ -1466,6 +1467,66 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+/*
+ * This pixel output formats list referenced from,
+ * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
+ * 3.7.4 Pixel formats
+ * Table 14. DSI pixel packing formats
+ */
+static const u32 exynos_dsi_pixel_output_fmts[] = {
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_YUYV12_1X24,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_RGB101010_1X30,
+	MEDIA_BUS_FMT_RGB121212_1X36,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	if (fmt == MEDIA_BUS_FMT_FIXED)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
+		if (exynos_dsi_pixel_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state,
+				     u32 output_fmt,
+				     unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
+		/*
+		 * Some bridge/display drivers are still not able to pass the
+		 * correct format, so handle those pipelines by falling back
+		 * to the default format till the supported formats finalized.
+		 */
+		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	input_fmts[0] = output_fmt;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int exynos_dsi_atomic_check(struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
@@ -1514,6 +1575,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= exynos_dsi_atomic_get_input_bus_fmts,
 	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
-- 
2.25.1

