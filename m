Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86AAE9AB9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EEC10E873;
	Thu, 26 Jun 2025 10:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KtoCejcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F210E871
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:05:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D516143EC6;
 Thu, 26 Jun 2025 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64617C4CEF1;
 Thu, 26 Jun 2025 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750932322;
 bh=YK2pvdDJ6IkwTqiQaUwdS4JOldNd1Bm6lfp6cF1eOl0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KtoCejcZvwrXKBc19UBfUuJRvuQXkjK0YvAF8pjmw982/e0/xMCJlb/Mzmt1yLMn1
 dLq3n4JorGh16+y9Unac9ONGEnMzXBgGsxl2hZmfLvaR/dt0YEje0gdInXqm2MjQ3O
 5jrnjDfBZxblG7UYqf6cy/zraw/e4CcuIujambZX6MeS2PqKlZU9mYlmQ4XuH4ry/r
 lwxvS9VNjCb4J02EiBcPaPtKADLFWSBZA7M5XeKy5p3JpP67vpHfjr7k9DTIOb4wJP
 fdHsEV99VXCpO+p4l63oM5TxhRRt7f+dTlqQliya6cIPHQvQnkDcp72sGjEa3PTb2e
 dmTyC80zgg/gg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:05:03 +0200
Subject: [PATCH v2 5/5] drm/panel: panel-simple: get rid of panel_dpi hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2757; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YK2pvdDJ6IkwTqiQaUwdS4JOldNd1Bm6lfp6cF1eOl0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0kHmN7mnHHA+b5e5eHpo7Jt938VnnDkjUFnl4ed0s
 qGlz+Bjx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI80HGhqbQpCUtsz4q1wqd
 nCu3K7rjq/7LDaXntU97K2xiCWJNnjbLJe1iReS+pZmnuKRNVm4VZqz32HTJdI9W+SVZxtnTeQu
 39wnKcqslC5ieC0/a2lYfbdljuGPSLJusGqGDLRn7Xp5RXAEA
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

The empty panel_dpi struct was only ever used as a discriminant, but
it's kind of a hack, and with the reworks done in the previous patches,
we shouldn't need it anymore.

Let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4c831af86414aba6a6b44dbc6020c0268dbd78b7..9f81fa960b460290759f5f9eba97045ab55fe5b8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -437,12 +437,10 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_modes = panel_simple_get_modes,
 	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-static struct panel_desc panel_dpi;
-
 static struct panel_desc *panel_dpi_probe(struct device *dev)
 {
 	struct display_timing *timing;
 	const struct device_node *np;
 	struct panel_desc *desc;
@@ -591,15 +589,21 @@ static const struct panel_desc *panel_simple_get_desc(struct device *dev)
 
 	if (dev_is_platform(dev)) {
 		const struct panel_desc *desc;
 
 		desc = of_device_get_match_data(dev);
-		if (!desc)
-			return ERR_PTR(-ENODEV);
-
-		if (desc == &panel_dpi)
-			return panel_dpi_probe(dev);
+		if (!desc) {
+			/*
+			 * panel-dpi probes without a descriptor and
+			 * panel_dpi_probe() will initialize one for us
+			 * based on the device tree.
+			 */
+			if (of_device_is_compatible(dev->of_node, "panel-dpi"))
+				return panel_dpi_probe(dev);
+			else
+				return ERR_PTR(-ENODEV);
+		}
 
 		return desc;
 	}
 
 	return ERR_PTR(-ENODEV);
@@ -649,11 +653,11 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 
 		if (!panel->ddc)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if ((desc != &panel_dpi) &&
+	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
 	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
 		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
@@ -5398,11 +5402,16 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "microchip,ac69t88a",
 		.data = &mchp_ac69t88a,
 	}, {
 		/* Must be the last entry */
 		.compatible = "panel-dpi",
-		.data = &panel_dpi,
+
+		/*
+		 * Explicitly NULL, the panel_desc structure will be
+		 * allocated by panel_dpi_probe().
+		 */
+		.data = NULL,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);

-- 
2.49.0

