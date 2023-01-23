Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF4677AD3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BA310E368;
	Mon, 23 Jan 2023 12:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39510E369
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:24:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so15102983pjg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Do3dhCYjC50CYA+L4s1clteIXcoOQ2GW8nVaTGD414U=;
 b=nojSeomHshElbOUipPOLwZabDxxWbVd2k095+Y6oMTQoI0ODawgaZIvhQ3Wu1oi48E
 kWffg/YNhoR3wOewoCXXpJgpXsGodVg/9QHO6aM+AbuoMZ5CfVUK4nxmnSG/Ix4u/qMJ
 i1zBPekLMi8tp5PLlnV21bb0teFH2f8eRhTec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Do3dhCYjC50CYA+L4s1clteIXcoOQ2GW8nVaTGD414U=;
 b=0agNEQQQXReOIjwA5YADE40k4Ox0sJJzRNXWmVpeybpi/ewUQhG0So7fS0J4Wp5rMx
 Ong17eBoe7OuF/azXuuDIKJrzDhDBfclGRXfSslFEuy4bFMbbyIlZ+YEsiIj8gdDqpfN
 /NGYi8X7jHDyPlcYGuj4p6Klv2LE3jlzE666OPHRkqC8St5s+YHO7krOJrzwG9eQBLZN
 8i99fZrAZzKvYnMnsQQiZGcT8ZE+NB0cho73J17P7bQGuJsGojMFwF2dl6zfp65l7PJL
 5S/WWY95f+q5k1ER3hSJbje+WZn5j4kIdDINU6szUDda2H2Lz8BpYSqTzqpfWyg2K36z
 nP3w==
X-Gm-Message-State: AFqh2kqj81i83eVHHYa4ZSkxwtPZdqKCjtZgdMxVbMwuQi+gTn1F3f5w
 MOJQUlrdIwrpDK+AL8KvHagBVg==
X-Google-Smtp-Source: AMrXdXuRNR3vmTZRHZPSirD9Rpd15IrZa4rJ5lIcFeAolGWEZmBxgse7BHARCjX0rUQp9P1DygjyCg==
X-Received: by 2002:a17:902:f54c:b0:192:fc9c:a238 with SMTP id
 h12-20020a170902f54c00b00192fc9ca238mr30487972plf.66.1674476696345; 
 Mon, 23 Jan 2023 04:24:56 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:24:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v11 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Date: Mon, 23 Jan 2023 17:53:12 +0530
Message-Id: <20230123122319.261341-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 68 +++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 5518d92c8455..7afbbe30d1d3 100644
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
@@ -1466,6 +1467,72 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
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
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
+{
+	int i;
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
+	if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
+		/*
+		 * Some bridge/display drivers are still not able to pass the
+		 * correct format, so handle those pipelines by falling back
+		 * to the default format till the supported formats finalized.
+		 */
+		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	default:
+		input_fmts[0] = output_fmt;
+		break;
+	}
+
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int exynos_dsi_atomic_check(struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
@@ -1514,6 +1581,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= exynos_dsi_atomic_get_input_bus_fmts,
 	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
-- 
2.25.1

