Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E71C89E17
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0410E2AC;
	Wed, 26 Nov 2025 12:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="CjtlR8BK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DEA10E5E7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1764161812; x=1795697812;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=mFc6PriI8q/y6PQmRvrLPCas+8lJvlxyqDjXK7teF6M=;
 b=CjtlR8BKWbdwDqk7u6hn+p1YLPhMuOxn1kw6pHdn8EfJXEOHnBiRLFQl
 THQtgW4vLofkVrqn+WpPkrTQ0OjCD6FB7Sy6yuMUj56TdgZA0iIcEIiaN
 hkrCV1SEe8ZlqS319sH0jMjtk2iNiLKB2jfLJvNhuMU7Vqb8MZDmp9Afg
 uEukykZAjDz4Twxqd7qsAhCJ061sc2uV9qVGkyNCVzcplYIROtw2K+1vV
 otmfA6vMEgfZylb4aiNr56MjaacuTgfotfYBZAGLxOc2a1ZU0RpgD8ipt
 318O15yDWPp9DoKp77fqDTQKuXWzLEcXxOJ9zDXEtvPx9IJfc/rbHmRA+ A==;
X-CSE-ConnectionGUID: SwmzKxapS2aFRuX/oZVhGA==
X-CSE-MsgGUID: bxIwf3JrSS2Gzn+igB42PA==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="217045314"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:56:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 05:56:31 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 26 Nov 2025 05:56:27 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Nov 2025 13:56:02 +0100
Subject: [PATCH REGRESSION v2] drm/panel: simple: restore connector_type
 fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-lcd_panel_connector_type_fix-v2-1-c15835d1f7cb@microchip.com>
X-B4-Tracking: v=1; b=H4sIAOH4JmkC/42NTQqDMBCFr1Jm3RQTrYWuupHSTQu6LCIxTuqAJ
 iERqYh3b/AEXb6/760Q0BMGuB5W8DhTIGuiEMcDqF6aDzLqogaRiDPngrNBdY2TBodGWWNQTdY
 30+Kw0fRlOkk0ppc8l5mAiHAeo73j31AW97KoqsfrCXXMegpxu+zPM98b/53MnHGmu7ZFnWaSy
 +w2kvJW9eROyo5Qb9v2AxUpWJrYAAAA
X-Change-ID: 20251121-lcd_panel_connector_type_fix-f00fe3766a42
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Anusha Srivatsa <asrivats@redhat.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5388;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=mFc6PriI8q/y6PQmRvrLPCas+8lJvlxyqDjXK7teF6M=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpJvj92rPOhVt9UO9uwwYwkIJQKVyyC0RGRQRX5
 ZeAA2XAsTGJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSb4/QAKCRA+OeYT93tk
 LRiiEACtzBEkshsLEah620fkv2jOEfPa0uM8aaRLm4oKdA1pN9MAW1SRmGMQEZRRQ9hctvq5dhq
 xAYnFiTueUk9JaaP0B73i7aQLOeSfua5RNJukLVS7Nb2EPm8FjHB4j+E6onWSJ4o9+LJVeP2Lcb
 MSRkme3Yj1fBZ2NtlvEsVIG51YI8IRjxdOOjk/ui+Qw0cV3ErP17zanVjaHjA9Tp42Auvc0gTTD
 aM5LBo0GANFd6J3I2YCCfK051tWBKWOHNWWk5xxXnY69vJhiUt0Bt/xyWPRk8diRmhU5L9v2+KZ
 Fz1BClu3NXu09dau8gFxdpfAHhedqAu2QwaWTfnETpdd1AUKhavIzxHq1xbkOwcRi6+BFTOqNbM
 TFLzxLt+KwMcKCoAwjahcLyRCVcHhR+srPIDLpwCemXBAhGexqUW/H1f0h+yro2+vaMXSZ++vrx
 wrdv0aPzv80C7TH6PspZNhYhsqQ+gx25I8jz7ioqc7VrxpMkCQCOChoa1xIspoCsgqoxhUXcqZO
 Tvuan3B5W++QruDjjR5yrACweJMtvRok8gL5VkFacpeZxbY6f5hCujSZVHXqfL7ALeGGpgaSrV0
 SSMKrTRzVlA8/j51+nm0gRB4NIhY9DfqSTV17N+dkKSn8DuA0iGAFmWTaSaU/6sdqDPMCGFUCVi
 ER+B3MAK+BXd08A==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

The switch from devm_kzalloc() + drm_panel_init() to
devm_drm_panel_alloc() introduced a regression.

Several panel descriptors do not set connector_type. For those panels,
panel_simple_probe() used to compute a connector type (currently DPI as a
fallback) and pass that value to drm_panel_init(). After the conversion
to devm_drm_panel_alloc(), the call unconditionally used
desc->connector_type instead, ignoring the computed fallback and
potentially passing DRM_MODE_CONNECTOR_Unknown, which
drm_panel_bridge_add() does not allow.

Move the connector_type validation / fallback logic before the
devm_drm_panel_alloc() call and pass the computed connector_type to
devm_drm_panel_alloc(), so panels without an explicit connector_type
once again get the DPI default.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
---
Changes in v2:
- Fix a warning introduced by the code move. There is no need to jump to
  free_ddc, we can directly return from the function.
- Link to v1: https://lore.kernel.org/r/20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com
---
 drivers/gpu/drm/panel/panel-simple.c | 89 ++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0019de93be1b663f55b04160606363cd043ab38b..5fd75b3939c635ca3e5b293ea37a759f479fa3f8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -623,49 +623,6 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 	if (IS_ERR(desc))
 		return ERR_CAST(desc);
 
-	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
-				     &panel_simple_funcs, desc->connector_type);
-	if (IS_ERR(panel))
-		return ERR_CAST(panel);
-
-	panel->desc = desc;
-
-	panel->supply = devm_regulator_get(dev, "power");
-	if (IS_ERR(panel->supply))
-		return ERR_CAST(panel->supply);
-
-	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
-						     GPIOD_OUT_LOW);
-	if (IS_ERR(panel->enable_gpio))
-		return dev_err_cast_probe(dev, panel->enable_gpio,
-					  "failed to request GPIO\n");
-
-	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
-	if (err) {
-		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
-		return ERR_PTR(err);
-	}
-
-	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
-	if (ddc) {
-		panel->ddc = of_find_i2c_adapter_by_node(ddc);
-		of_node_put(ddc);
-
-		if (!panel->ddc)
-			return ERR_PTR(-EPROBE_DEFER);
-	}
-
-	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
-	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
-		panel_simple_parse_panel_timing_node(dev, panel, &dt);
-
-	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
-		/* Optional data-mapping property for overriding bus format */
-		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
-		if (err)
-			goto free_ddc;
-	}
-
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {
@@ -690,8 +647,7 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
 		dev_warn(dev, "eDP panels moved to panel-edp\n");
-		err = -EINVAL;
-		goto free_ddc;
+		return ERR_PTR(-EINVAL);
 	case DRM_MODE_CONNECTOR_DSI:
 		if (desc->bpc != 6 && desc->bpc != 8)
 			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
@@ -720,6 +676,49 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
 		break;
 	}
 
+	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
+				     &panel_simple_funcs, connector_type);
+	if (IS_ERR(panel))
+		return ERR_CAST(panel);
+
+	panel->desc = desc;
+
+	panel->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(panel->supply))
+		return ERR_CAST(panel->supply);
+
+	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(panel->enable_gpio))
+		return dev_err_cast_probe(dev, panel->enable_gpio,
+					  "failed to request GPIO\n");
+
+	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
+	if (err) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
+		return ERR_PTR(err);
+	}
+
+	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (ddc) {
+		panel->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
+		if (!panel->ddc)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
+	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
+		panel_simple_parse_panel_timing_node(dev, panel, &dt);
+
+	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
+		/* Optional data-mapping property for overriding bus format */
+		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
+		if (err)
+			goto free_ddc;
+	}
+
 	dev_set_drvdata(dev, panel);
 
 	/*

---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251121-lcd_panel_connector_type_fix-f00fe3766a42

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

