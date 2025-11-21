Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02637C795C8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759910E027;
	Fri, 21 Nov 2025 13:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="GlpatKYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 21 Nov 2025 13:28:49 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBC810E027
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763731730; x=1795267730;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=6rzw3wR5dUfOYlSfhUkAsd44MLDxQ7vrhBiUg3Jq5nA=;
 b=GlpatKYDcnJbIjpRPGlvspr2pesSN9vGHnRmfBKZL29W4K3FecIzXMJm
 VmFHhcfHWMJo9n0f+sIaGgJxBLN3mwYp81m9t0WDa8trerhK00D83RAZE
 JnyN2399iO70YjCPmtYHx0Wq1LrYMicncutPUU5YxIc6JaH/RyMeSh2XX
 6Adam1luTaW/E2bVfVwuPLN6TlioPx+LpT8jZDr7bTGVIoN2yIY+aU5VO
 DTMCx0NaQf76y83r+NIZIimVugN3USYBjCjDfwA7/558nWvP7LdZ6CWuu
 Na4xH0MM5dcDcLJlhQAzx9LI0Skc+5UC2ruPeo2Rlz+CjRfTexEKlh7MV w==;
X-CSE-ConnectionGUID: xDvkwLU6SPqBbOQ2+GbYfA==
X-CSE-MsgGUID: C5bIzEmsQq2TfDZ+nPLjow==
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="49983260"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2025 06:21:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 06:21:08 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 06:21:05 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 14:20:48 +0100
Subject: [PATCH REGRESSION] drm/panel: simple: restore connector_type fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
X-B4-Tracking: v=1; b=H4sIAC9nIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3ZzklPiCxLzUnPjk/Ly81OSS/KL4ksqC1Pi0zArdNAODtFRjczO
 zRBMjJaARBUWpQGGw8dFKQa7uQa7BwZ7+fkqxtbUAF6tkj3oAAAA=
X-Change-ID: 20251121-lcd_panel_connector_type_fix-f00fe3766a42
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Anusha Srivatsa <asrivats@redhat.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=6rzw3wR5dUfOYlSfhUkAsd44MLDxQ7vrhBiUg3Jq5nA=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIGdACQGqsia9V4GlQ+9DQpHU+3XyP5o1dJcz0
 R/IGuWGV/iJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSBnQAAKCRA+OeYT93tk
 LYtZD/4rbEzqLIjZBDiSKelrsPFqQDDwEgM4F6WrwBuTLRDlDl4M7TpWLe8LhJGls+8oOPYGG+X
 4CcD43GlnojuDwTHJQ3HK17Asar2ayX35bNX40mcuk2H60biMHKZMoeZDqtUxWIvxcL5P06q8X2
 aq0FzAB1I6++x64SbDgnOycFosx0kvhH9gLHhLZR6uILa8LyuJrCjCvw0ojTS5vaYKvGEU6Kaui
 TBo/XuTvKJ5U5MQJIMGVPK1qkHtrQE0zJsGEyLtwVIO+IPI7hTBZKPDi/z0YFoCvCTZNsFh1ico
 VqhpCaoZIoZsAx6TmrLrUdy9nrpib0OfgL94DKL/VqzEJJNctHZds8uC/t0DtpifU5bRd7+0bbk
 kjQrEbPmtLOavW179zIzLZgPJJpshmKE8uzZYIxawT/gq1HNglBjjojHPJ2DiF3eoHQJN+29RAG
 1sHG/DArriJFdy8th/c9c0W8GORsS3h5uZNbVvrk0Il1/C6bfHa6AlcN88Bgryp+K0wyP2FF5+3
 P0SFu+gV8JDzBHT2t9BRcqr1urCLXsDaiW+8esDvmM8CDoG5a5y9tfFGzWnC6m/AMgJDxehB598
 9eMnYtbYT+hDPR68oVDNtD1RwCsGoEYji9DA20pBf+ejxkvamzDxjw0m+T6bACsyF4+XqTi/Ikn
 gpYrNNI7FTeETzw==
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
Hi,

I am not sure whether this regression has already been reported or
addressed. If it has, please feel free to drop this patch.
---
 drivers/gpu/drm/panel/panel-simple.c | 86 ++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index da6b71b70a463400fcc45006788f87e97b0c148c..dc41789f6a53c78b928ff39291ab7219a2d835dd 100644
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
@@ -720,6 +677,49 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
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
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-lcd_panel_connector_type_fix-f00fe3766a42

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

