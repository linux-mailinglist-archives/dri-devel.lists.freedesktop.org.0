Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C899A50B0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 22:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC3910E3C1;
	Sat, 19 Oct 2024 20:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bcP4Aht7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC06B10E3C3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 20:11:47 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729368342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WYLOQhw/RKMm5QY26fFHeUV0OebPBM++WNDwYTSgLM=;
 b=bcP4Aht74vh1QtzRH0g69+XKAHTMJpvXN0Wa7F08TjlqYGXloYOp0D/MzMK08HaBpj+uRO
 G/3jTRCW5tczqqL6HVcLJoHInDeuDs+f7f8/S3HAzGrf2WcmvxSSunJQty3jhJBTjPASrD
 m6p5zx9Cb8yYfKGxbasHSx0gRPm47hQ=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 08/13] drm/mipi-dsi: Add helper to find input format
Date: Sun, 20 Oct 2024 01:35:25 +0530
Message-Id: <20241019200530.270738-1-aradhya.bhatia@linux.dev>
In-Reply-To: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add a helper API that can be used by the DSI hosts to find the required
input bus format for the given output dsi pixel format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5e5c5f84daac..076826f2445a 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -36,6 +36,8 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
+#include <linux/media-bus-format.h>
+
 #include <video/mipi_display.h>
 
 /**
@@ -870,6 +872,41 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_read);
 
+/**
+ * drm_mipi_dsi_get_input_bus_fmt() - Get the required MEDIA_BUS_FMT_* based
+ *				      input pixel format for a given DSI output
+ *				      pixel format
+ * @dsi_format: pixel format that a DSI host needs to output
+ *
+ * Various DSI hosts can use this function during their
+ * &drm_bridge_funcs.atomic_get_input_bus_fmts operation to ascertain
+ * the MEDIA_BUS_FMT_* pixel format required as input.
+ *
+ * RETURNS:
+ * a 32-bit MEDIA_BUS_FMT_* value on success or 0 in case of failure.
+ */
+u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format)
+{
+	switch (dsi_format) {
+	case MIPI_DSI_FMT_RGB888:
+		return MEDIA_BUS_FMT_RGB888_1X24;
+
+	case MIPI_DSI_FMT_RGB666:
+		return MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		return MEDIA_BUS_FMT_RGB666_1X18;
+
+	case MIPI_DSI_FMT_RGB565:
+		return MEDIA_BUS_FMT_RGB565_1X16;
+
+	default:
+		/* Unsupported DSI Format */
+		return 0;
+	}
+}
+EXPORT_SYMBOL(drm_mipi_dsi_get_input_bus_fmt);
+
 /**
  * mipi_dsi_dcs_write_buffer() - transmit a DCS command with payload
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 94400a78031f..9e2804e3a2b0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -293,6 +293,7 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
+u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
 
 #define mipi_dsi_msleep(ctx, delay)	\
 	do {				\
-- 
2.34.1

