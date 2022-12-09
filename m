Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D629964857D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D06E10E54D;
	Fri,  9 Dec 2022 15:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39610E54D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:28:10 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d3so5207284plr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ymr+DEOHacJTvc2Uck5JB4sOzfEDxvLbYqSHqNsRapU=;
 b=lq0Dd3U+vIK/vr5aRMFNeSULQoc0THFbOnL6NRIu3WthVZznvyYe5MqC8+h4jclNzG
 Ih2u3D58wnAqyN3XQ9hWynCRuxYFrQTpnI0qhLxz3WcAWuKcqIKJsNOJuQkETkPDq5F8
 hrl8DJE583MagpI/cQpccpnlZFvYitrsPVIss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ymr+DEOHacJTvc2Uck5JB4sOzfEDxvLbYqSHqNsRapU=;
 b=SYWu3P0ybkQGu4bVu0tcs+nUfNvs79GcOn2cgX0Wt3kAqJzlEKDmpe/6hs3Mojav9E
 njsCb/XyxHk5UyInn7B6ZNdAD6OCLt3wn+y6DSbGFNdQxuSYl6ocBhwB98zPtgYLeyUi
 9uvfeYLDItaGKWqONZlHUSzuPim4hZpmGIZHDODNFBrmInUrCqAyxbqagFWz8/uA+PQG
 ntWkPZVfzhs4B0xoMPvIU+3ru792op0Zb3sGhvQ4HljoeIfOIV3xaxUbQDkzIS69+jsZ
 DklaYnljvktufGk+C5YuvU8BsysnQpC0Qm/H3cUMyV1646EafKfTv1OMmHTZCjQio/Id
 zYLQ==
X-Gm-Message-State: ANoB5plAb3cznlzawikQmdcFQGcVczX2MdnNLfNpQQE8UtgJkycL/RAX
 Hwv4jwRj3mhQ8PKJCkPrMRzm2w==
X-Google-Smtp-Source: AA0mqf68YgV/o1c4fxAysjrC3qcV0mPVebM+Q1QCWs/JKU+KjkPgVtx3HFMnVPbSd1oBfKXqthDveQ==
X-Received: by 2002:a17:902:e806:b0:185:4421:72e5 with SMTP id
 u6-20020a170902e80600b00185442172e5mr7789428plg.42.1670599690133; 
 Fri, 09 Dec 2022 07:28:10 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:28:09 -0800 (PST)
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
Subject: [PATCH v9 13/18] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Date: Fri,  9 Dec 2022 20:53:38 +0530
Message-Id: <20221209152343.180139-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

v9:
* added MEDIA_BUS_FMT_FIXED
* return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
* added MEDIA_BUS_FMT_YUYV10_1X20, MEDIA_BUS_FMT_YUYV12_1X24

v8:
* added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2

v7, v6, v5, v4:
* none

v3:
* include media-bus-format.h

v2:
* none

v1:
* new patch

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 69 +++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9203116f1efb..ef0d802d25bf 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 
@@ -1348,6 +1349,73 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+/*
+ * This pixel output formats list referenced from,
+ * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
+ * 3.7.4 Pixel formats
+ * Table 14. DSI pixel packing formats
+ */
+static const u32 samsung_dsim_pixel_output_fmts[] = {
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_YUYV12_1X24,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_RGB101010_1X30,
+	MEDIA_BUS_FMT_RGB121212_1X36,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB888_1X24,
+
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
+		if (samsung_dsim_pixel_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
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
 static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
 				     struct drm_crtc_state *crtc_state,
@@ -1396,6 +1464,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

