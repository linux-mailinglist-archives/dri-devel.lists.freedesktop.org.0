Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F2AE9ABA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9710E87C;
	Thu, 26 Jun 2025 10:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PH/kIZVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2E10E894
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:05:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57F9161F1E;
 Thu, 26 Jun 2025 10:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E9BC4CEF2;
 Thu, 26 Jun 2025 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750932317;
 bh=D9tNmt4CZw29EZUUZcqPTZ6E8NGJet4lpsy9/3O0OYE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PH/kIZVQEI+sTG1XjJlstsFNgJr4gXAD/OjpXdYCBPfFBh5nNhYMYMHkjPx88cgE4
 Jp486I8lnH2wzrkxEhLODI0n1lFsScsj/D2es8ePP2OU6Ga79bbCFpKgit70W/fXwx
 of89vftQZFAgUgIINYc29IsvPnBvURs6szDXY/GunbteFaX6Dn2lQ7NVagooN2dA7o
 YDHE3R+VNX5L/VKdbywYNC/gqs6LQ2Dp1S0OinxOn+Wtogv9dlUu0DYECv2Mu+EnBo
 CA/7838XF9TEajU2Aq1/Cwch28sENosLZgY6c8qwc+SHdIs5ieSgM+VWrVLVgM3ITY
 5u1YYLa/I5AJQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:05:01 +0200
Subject: [PATCH v2 3/5] drm/panel: panel-simple: Make panel_simple_probe
 return its panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-3-5afcaa608bdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5194; i=mripard@kernel.org;
 h=from:subject:message-id; bh=D9tNmt4CZw29EZUUZcqPTZ6E8NGJet4lpsy9/3O0OYE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0oGsqsbGr73Of4putfj86cI/gaNZp4+kWEzzKNbRd
 YqLcm3rmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMRv8RYZ7Iyav2KuqrUS3vW
 u19vz7glp/pYs918Rpu0o9RH1Ub9vLsujR94bGL29S1+Xf6rISiJsb7+n0F34J8by7w45gox6qt
 uijnw6YF9regKicnnxE4czBW/0i5yNN/4peb52RJd4pXHFwAA
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

In order to fix the regession introduced by commit de04bb0089a9
("drm/panel/panel-simple: Use the new allocation in place of
devm_kzalloc()"), we need to move the panel_desc lookup into the common
panel_simple_probe() function.

There's two callers for that function, the probe implementations of the
platform and MIPI-DSI drivers panel-simple implements.

The MIPI-DSI driver's probe will need to access the current panel_desc
to initialize properly, which won't be possible anymore if we make that
lookup in panel_simple_probe().

However, we can make panel_simple_probe() return the initialized
panel_simple structure it allocated, which will contain a pointer to the
associated panel_desc in its desc field.

This doesn't fix de04bb0089a9 ("drm/panel/panel-simple: Use the new
allocation in place of devm_kzalloc()") still, but makes progress
towards that goal.

Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 89188e683822f9202ec580c9a294e42083b9704a..e70ee2d4a538caaae673507b93e02b444a2e1640 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -565,11 +565,11 @@ static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
 	}
 
 	return 0;
 }
 
-static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
+static struct panel_simple *panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
 	int connector_type;
@@ -577,37 +577,37 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	int err;
 
 	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
 				     &panel_simple_funcs, desc->connector_type);
 	if (IS_ERR(panel))
-		return PTR_ERR(panel);
+		return ERR_CAST(panel);
 
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
-		return PTR_ERR(panel->supply);
+		return ERR_CAST(panel->supply);
 
 	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(panel->enable_gpio))
-		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
-				     "failed to request GPIO\n");
+		return dev_err_cast_probe(dev, panel->enable_gpio,
+					  "failed to request GPIO\n");
 
 	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
 	if (err) {
 		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
-		return err;
+		return ERR_PTR(err);
 	}
 
 	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
 	if (ddc) {
 		panel->ddc = of_find_i2c_adapter_by_node(ddc);
 		of_node_put(ddc);
 
 		if (!panel->ddc)
-			return -EPROBE_DEFER;
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	if (desc == &panel_dpi) {
 		/* Handle the generic panel-dpi binding */
 		desc = panel_dpi_probe(dev);
@@ -701,20 +701,20 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		goto disable_pm_runtime;
 	}
 
 	drm_panel_add(&panel->base);
 
-	return 0;
+	return panel;
 
 disable_pm_runtime:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
 
-	return err;
+	return ERR_PTR(err);
 }
 
 static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
@@ -5375,16 +5375,21 @@ static const struct of_device_id platform_of_match[] = {
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
 	const struct panel_desc *desc;
+	struct panel_simple *panel;
 
 	desc = of_device_get_match_data(&pdev->dev);
 	if (!desc)
 		return -ENODEV;
 
-	return panel_simple_probe(&pdev->dev, desc);
+	panel = panel_simple_probe(&pdev->dev, desc);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
+
+	return 0;
 }
 
 static void panel_simple_platform_remove(struct platform_device *pdev)
 {
 	panel_simple_remove(&pdev->dev);
@@ -5651,20 +5656,22 @@ static const struct of_device_id dsi_of_match[] = {
 MODULE_DEVICE_TABLE(of, dsi_of_match);
 
 static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc_dsi *desc;
+	struct panel_simple *panel;
 	int err;
 
 	desc = of_device_get_match_data(&dsi->dev);
 	if (!desc)
 		return -ENODEV;
 
-	err = panel_simple_probe(&dsi->dev, &desc->desc);
-	if (err < 0)
-		return err;
+	panel = panel_simple_probe(&dsi->dev, &desc->desc);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
+	desc = container_of(panel->desc, struct panel_desc_dsi, desc);
 	dsi->mode_flags = desc->flags;
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
 
 	err = mipi_dsi_attach(dsi);

-- 
2.49.0

