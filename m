Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002ECAE7762
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C7610E674;
	Wed, 25 Jun 2025 06:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IlPQzXsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F6310E672
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:48:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B838F629C2;
 Wed, 25 Jun 2025 06:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EECDC4CEF3;
 Wed, 25 Jun 2025 06:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750834138;
 bh=f+KfQM4TtP/sqrm1b9UkeC8/43JwSB+sdZZLVFY5aKE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IlPQzXsKKBLvTJtxFQ7wxexXmJBQLSNCEEc7BYZfEdksfovbUBE/Kb7HyIYdD7f8O
 CypRoFBtTDwIYzDfUkfgaeZnGhvHrhTkMmwvt8+GG48psVomlXpD2/X/Fq+Bx5y0pI
 LvoJF4bTwjUHEVA91eeZOQB68FCN7vE8Eephb/4h0/VNCpVONaKYg2SPAlq+6gZGM6
 2kgT7j1qmBpVMqjBFSQpUYULaXB0OocRN/SJtPiPvGVNTPHbrYPKmfupAnRwX975+Z
 igY2UPja+z3WZu89mVbFzmPdqgN8qWbcdew5i0Y/YtdeSvQLybhwz4uyui/MQr+ZUF
 1EHRmnrL0rRgA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Jun 2025 08:48:41 +0200
Subject: [PATCH 4/5] drm/panel: panel-simple: Add function to look panel
 data up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-panel-simple-fixes-v1-4-c428494a86b8@kernel.org>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
In-Reply-To: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6286; i=mripard@kernel.org;
 h=from:subject:message-id; bh=f+KfQM4TtP/sqrm1b9UkeC8/43JwSB+sdZZLVFY5aKE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnRs0+7nTcvaTp7rtD6s3tjzVMLm4N9XFMWPUxlqG77G
 xKx9E9nx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI1m7GGs6IMxy64UmR73wa
 ZZcLr93vfOW9fuDl3RLq8gseJt95f0z12MxuvsvaH0KUUw5tP6VVxFifF5hxh8+Hw3K/j0ddpcT
 h3QqMk45s0Dx3+Wv0/J+LRQrUDCYxyM3d6G4Wv8BkHrPViccA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
place of devm_kzalloc()") moved the call to drm_panel_init into the
devm_drm_panel_alloc(), which needs a connector type to initialize
properly.

In the panel-dpi compatible case, the passed panel_desc structure is an
empty one used as a discriminant, and the connector type it contains
isn't actually initialized.

It is initialized through a call to panel_dpi_probe() later in the
function, which used to be before the call to drm_panel_init() that got
merged into devm_drm_panel_alloc().

So, we do need a proper panel_desc pointer before the call to
devm_drm_panel_alloc() now. All cases associate their panel_desc with
the panel compatible and use of_device_get_match_data, except for the
panel-dpi compatible.

In that case, we're expected to call panel_dpi_probe, which will
allocate and initialize the panel_desc for us.

Let's create such a helper function that would be called first in the
driver and will lookup the desc by compatible, or allocate one if
relevant.

Reported-by: Francesco Dolcini <francesco@dolcini.it>
Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 81 +++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e70ee2d4a538caaae673507b93e02b444a2e1640..d3390ba4ecec5a5aa531c12f51eebdf1ed9d5545 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -24,10 +24,11 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -134,10 +135,18 @@ struct panel_desc {
 
 	/** @connector_type: LVDS, eDP, DSI, DPI, etc. */
 	int connector_type;
 };
 
+struct panel_desc_dsi {
+	struct panel_desc desc;
+
+	unsigned long flags;
+	enum mipi_dsi_pixel_format format;
+	unsigned int lanes;
+};
+
 struct panel_simple {
 	struct drm_panel base;
 
 	ktime_t unprepared_time;
 
@@ -565,19 +574,52 @@ static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
 	}
 
 	return 0;
 }
 
-static struct panel_simple *panel_simple_probe(struct device *dev, const struct panel_desc *desc)
+static const struct panel_desc *panel_simple_get_desc(struct device *dev)
 {
+	if (dev_is_mipi_dsi(dev)) {
+		const struct panel_desc_dsi *dsi_desc;
+
+		dsi_desc = of_device_get_match_data(dev);
+		if (!dsi_desc)
+			return ERR_PTR(-ENODEV);
+
+		return &dsi_desc->desc;
+	}
+
+	if (dev_is_platform(dev)) {
+		const struct panel_desc *desc;
+
+		desc = of_device_get_match_data(dev);
+		if (!desc)
+			return ERR_PTR(-ENODEV);
+
+		if (desc == &panel_dpi)
+			return panel_dpi_probe(dev);
+
+		return desc;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+static struct panel_simple *panel_simple_probe(struct device *dev)
+{
+	const struct panel_desc *desc;
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
 	int connector_type;
 	u32 bus_flags;
 	int err;
 
+	desc = panel_simple_get_desc(dev);
+	if (IS_ERR(desc))
+		return ERR_CAST(desc);
+
 	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
 				     &panel_simple_funcs, desc->connector_type);
 	if (IS_ERR(panel))
 		return ERR_CAST(panel);
 
@@ -606,23 +648,13 @@ static struct panel_simple *panel_simple_probe(struct device *dev, const struct
 
 		if (!panel->ddc)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if (desc == &panel_dpi) {
-		/* Handle the generic panel-dpi binding */
-		desc = panel_dpi_probe(dev);
-		if (IS_ERR(desc)) {
-			err = PTR_ERR(desc);
-			goto free_ddc;
-		}
-
-		panel->desc = desc;
-	} else {
-		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
-			panel_simple_parse_panel_timing_node(dev, panel, &dt);
-	}
+	if ((desc != &panel_dpi) &&
+	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
+		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
 		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
 		if (err)
@@ -5374,18 +5406,13 @@ static const struct of_device_id platform_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
-	const struct panel_desc *desc;
 	struct panel_simple *panel;
 
-	desc = of_device_get_match_data(&pdev->dev);
-	if (!desc)
-		return -ENODEV;
-
-	panel = panel_simple_probe(&pdev->dev, desc);
+	panel = panel_simple_probe(&pdev->dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
 	return 0;
 }
@@ -5415,18 +5442,10 @@ static struct platform_driver panel_simple_platform_driver = {
 	.probe = panel_simple_platform_probe,
 	.remove = panel_simple_platform_remove,
 	.shutdown = panel_simple_platform_shutdown,
 };
 
-struct panel_desc_dsi {
-	struct panel_desc desc;
-
-	unsigned long flags;
-	enum mipi_dsi_pixel_format format;
-	unsigned int lanes;
-};
-
 static const struct drm_display_mode auo_b080uan01_mode = {
 	.clock = 154500,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 62,
 	.hsync_end = 1200 + 62 + 4,
@@ -5659,15 +5678,11 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
 	struct panel_simple *panel;
 	int err;
 
-	desc = of_device_get_match_data(&dsi->dev);
-	if (!desc)
-		return -ENODEV;
-
-	panel = panel_simple_probe(&dsi->dev, &desc->desc);
+	panel = panel_simple_probe(&dsi->dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
 	desc = container_of(panel->desc, struct panel_desc_dsi, desc);
 	dsi->mode_flags = desc->flags;

-- 
2.49.0

