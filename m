Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1167CEA0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17B10E926;
	Thu, 26 Jan 2023 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25FD10E926
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:46:57 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso5460667pjj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIzwHk3KlOuotRd1vtFiT01NZHo9fUxqS1kmRS+uxAM=;
 b=jw5dG3mm8odtdyRm5Uo9QEAIU1wwhd6wFLqTbk27sdst8UXiLXs2nEBoe8I0sM9Lfi
 SsPkVrC73Lj0LjFKEcAzCo1hfuWhGr57ChLPoMIuQIHhzTz3SjCFp69+4g3F0ypISUjE
 V3xjmWFKINF/27yN4fqYWreCZVvjit1dWaS+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIzwHk3KlOuotRd1vtFiT01NZHo9fUxqS1kmRS+uxAM=;
 b=ICtUyucpuRQJTcq5kBJOCm3EfCBNJJaUMOn2K7SLDrY6LixHRV+FKd2RgamFtueZYv
 cHNuALRHiKOLQPkE7rGiu6g/NokB6e2fU7jsOk8VqTgXLSNNNhIN+ewkdyGrye7NZDmu
 7N8T5ViXNgXoL6aoGFwaMAQBfiZ40Du1LNHHW0FF058sfoRWddTrow+3TozCN/2KaU2t
 8l1SezXDmOqDVaYkccuVR3ZblbWj+tkSuq7VPe/KoAI74aeK6Oj/krTeaxy3lbUwl+64
 yGPiduyyD+513hESuw4pwlg94Pf15t1IypMJh0Sx99dg7qjgjtaC6SzuTWZ0wI9LEaQd
 pjEw==
X-Gm-Message-State: AO0yUKWnTSR9guoIXL4WEDUYPGjMs9gWKDKgm4YpDTHgVvxiKeV/Q/Iz
 VuWFq6sK+Iv7R4dywuV/sbsgXw==
X-Google-Smtp-Source: AK7set+WxXq5opVnH938Rg5wF9L4yKLutOFDJAC1/CzLyA+UxZairVq9vwV1Lkoz3tfXgUbBGp93FQ==
X-Received: by 2002:a17:90b:4a4f:b0:22c:4e1:94f with SMTP id
 lb15-20020a17090b4a4f00b0022c04e1094fmr6906913pjb.13.1674744417491; 
 Thu, 26 Jan 2023 06:46:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:46:57 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Date: Thu, 26 Jan 2023 20:14:20 +0530
Message-Id: <20230126144427.607098-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
index 5518d92c8455..9459c138d0e0 100644
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

