Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3C6A40F5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112310E3E2;
	Mon, 27 Feb 2023 11:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90110E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:40:53 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso9780455pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yy00kSfB9ubDpN+1KzITSR+hdj0rooRsqbMSOz16J0s=;
 b=Fg/gj+++XGYr/RwUTRHJPXDNTeFdySdGCOa9PdQntDIELC+AMtd8Q4ewYv20UO1T+R
 IvYlnTAb8j6zf0j84HkxD1fDTXAQZD8v6HNeev0nYheejuxSCSQzv+UbQejBg+zyxr8t
 D7W87Y1+bnjJy4u1XFo4h72ZAdzU4iNIqs0gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yy00kSfB9ubDpN+1KzITSR+hdj0rooRsqbMSOz16J0s=;
 b=aBf6Ob9O+nR9f5fx0tDwjAqW157ApX75nz9v3L1deVU7lfJRUkg2jMZwadZql9TYpm
 g37PcoJNdqfVCE4fQGUJ5PZe3j7ghgXPBtcXQ+b1Q6T7t81ITZT4OckRNPGTUVPIKbk8
 djZVtwMMhroMzPxEAZ/VQHrS7pSQVaXUbm9QK3Nip1wLlz17uY+gFMxdwgx6nxQuXZEJ
 n68eSpaI5KYOAsHNVSCpsKjL84x/qVeqTRKqEVMjHB9AbwvfQO1yoENlAu+NlW0RgkTe
 z9QMfg+1DTKuBu4375jehaOSbhyP8RuYzLgfbg8fsPVyOFD/XU2uPH4DvtOB59dbTHHt
 gdZw==
X-Gm-Message-State: AO0yUKU3Fd2hBXZP0CkJkFGbVBpucetIOKo9mCh8GzFGgZ/vwaIHNTX6
 e1Br3ef6cifGuhhhvrXSqaj5fA==
X-Google-Smtp-Source: AK7set/DgV5oe2uaIFIqoU6WGp00B2tHnrE3Du7O0KYqUJYw5Goa2IoYCcNKjV0pZxrIgBfQ57QbQw==
X-Received: by 2002:a17:902:cf4e:b0:19d:b20:4d1a with SMTP id
 e14-20020a170902cf4e00b0019d0b204d1amr3321667plg.60.1677498053066; 
 Mon, 27 Feb 2023 03:40:53 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:40:52 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Date: Mon, 27 Feb 2023 17:09:18 +0530
Message-Id: <20230227113925.875425-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
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

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
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
index 7f0703582506..aea56b6fbf17 100644
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
@@ -1467,6 +1468,66 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1515,6 +1576,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= exynos_dsi_atomic_get_input_bus_fmts,
 	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
-- 
2.25.1

