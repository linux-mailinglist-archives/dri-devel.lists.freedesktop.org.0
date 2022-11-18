Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A162F01F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E610E1F0;
	Fri, 18 Nov 2022 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBB610E6FB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:00:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1668758422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FMMNXg0Pi9R/TC2aglIYxF4cXai7D/gu9XZHy3zUX4=;
 b=Uet0K3NdvFLDlt3eGJxTUm40otjvaYR0uK5uN7Y43yDEGQN9ChmGLKkeit4Cgn/KkbAptZ
 b2FDntpVx1yY8HpZIJRhmvD17ETDFC8T6YciXl9AyHq7efFGSuIdT/sSGaJpEoqjWuKXGF
 ZYJR7jvYkJWL9q7U+att0E6LhIlPCnU=
From: richard.leitner@linux.dev
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: simple: Add InnoLux G070ACE-L01
Date: Fri, 18 Nov 2022 08:58:56 +0100
Message-Id: <20221118075856.401373-2-richard.leitner@linux.dev>
In-Reply-To: <20221118075856.401373-1-richard.leitner@linux.dev>
References: <20221118075856.401373-1-richard.leitner@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 18 Nov 2022 08:52:43 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Leitner <richard.leitner@skidata.com>

Add InnoLux G070ACE-L01 7" 800x480 TFT LCD with WLED backlight panel
support. Timing data was extracted from datasheet and vendor provided
EDID file.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org

---
 drivers/gpu/drm/panel/panel-simple.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2944228a8e2c..b2b5ec5839de 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2142,6 +2142,38 @@ static const struct panel_desc innolux_at070tn92 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing innolux_g070ace_l01_timing = {
+	.pixelclock = { 25200000, 35000000, 35700000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 30, 32, 87 },
+	.hback_porch = { 30, 32, 87 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 13, 13, 13 },
+	.vsync_len = { 1, 1, 4 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc innolux_g070ace_l01 = {
+	.timings = &innolux_g070ace_l01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.delay = {
+		.prepare = 10,
+		.enable = 50,
+		.disable = 50,
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing innolux_g070y2_l01_timing = {
 	.pixelclock = { 28000000, 29500000, 32000000 },
 	.hactive = { 800, 800, 800 },
@@ -4096,6 +4128,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,at070tn92",
 		.data = &innolux_at070tn92,
+	}, {
+		.compatible = "innolux,g070ace-l01",
+		.data = &innolux_g070ace_l01,
 	}, {
 		.compatible = "innolux,g070y2-l01",
 		.data = &innolux_g070y2_l01,
-- 
2.38.1

