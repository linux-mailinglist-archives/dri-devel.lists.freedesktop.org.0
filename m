Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E18C7A666
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F710E8B1;
	Fri, 21 Nov 2025 15:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="s7QGKQWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A4E10E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737618; x=1795273618;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
 b=s7QGKQWdgnBlOIqAxZPB89AaBeuUQpMDTd0sh9/IbHwWuEv4bkLLs5zO
 DqUDlngMc16j91R727IzwxOsQKVxlZMIEdBb4hS2N+Bf53s0TBhJiS6Wg
 A8RfkZaXv5zJLzhmoOxhbCmYlYZw4cYtVOqnZIv/k4zh0D8qqdhVz6Mzt
 MKeQvyqcsxfh+a1c8L2OrzrwDvaoGUfACAwVMeq9tC+Layh0hXqAB8Ai+
 tcDQByQJMn4E3l6ZyExXuz5tJH3RR8uQTJpJ3QyPy7HWdPXnoEWPttRYU
 V+Ze4o09hUP54tyB+4I5qnWPsTFKQJiTulVE1IYMB5adZfCdIl9wwo0xD w==;
X-CSE-ConnectionGUID: ZsY1rJHWSEWAtJuR27K+Sw==
X-CSE-MsgGUID: qyzdrfUkTTWgu9IQmxnKWg==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="280874262"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:06:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:27 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:22 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:36 +0100
Subject: [PATCH 4/8] drm/atmel-hlcdc: use drm_crtc_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-4-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=ykS7JdsTZDTvpcv0YzakxnBGh6GHP2mr6Lt81AtHCBs=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/Wto7t+cwIKFwcL7ixOr20oYrI6fqOiPoVu
 hN4ZiWNMryJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LQKYD/0Wg6ViuiiaWT23b0Hu883goIyW2Gn2x0x+1Dbik+Sw5Ju7GaRkAsC2ZGwi35vbCuj/Y+b
 RJ3G65JYSs5Bdrtgtj/brCoJUwJrnOUx6QcNi1kyxqyPhekrsOOoKTTzGCo+6gRPE/AcmNRMXzZ
 rFqZZWw8JyGy6OLXHFEeAMNvli4SYn0XzHaxo+Freu1EbAj+yXIaHdzsjdG2BEU0NgLpizS5umz
 ZHLK8Y+qPROPLEZcTvxvTAkVulpmj2px6wZxq7vbsbhj4nw2Im0F4Y7QC37dH4UPWtJcEKZgAJH
 NJMLd9N+EyhLvRRLeGsjBZQZjXNwJtVxiL1bQ3hT6jcMPO9gQGGcFpZW8FaDjCEibkNyN7i49fl
 g47nNF03rR8ZYrzAFkqGHc/8XTpRfFKtvk5qkeQum4nJkw65uu51pkeBbuwq7x2z3aBq0SP7lT1
 3UXRtlZVs0E5crWpx1VnSGSAXFU1EMDbQaclf2rBeals+C2qeetefpZZp3grlKXf4MwrFMZ5EPd
 tDwH5QovWi1s2FDDoluJBdaSc05LZld463pgXp/84hxcIAhbixgXj/cp20RlQriz+UnUS5Vue4J
 FEx+wagocUitMBoZQITlYWcgSwJX+ZahZOsHyT5RJVgMT9ejTKB7QsVCCwU7b3JQVDoywcfP1RP
 4w3cnpifpsBw0XQ==
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

Prefer using the drm_crtc_mask() helper instead of a raw value. It
involves reordering components initialization as we need a valid crtc.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c     | 12 ++++++------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c |  4 +++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 8ff582a394794aacf84f9e23fd59f123445926a3..d1f5451ebfeaf81c382b49d0c1a6c3c32e44866b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -723,12 +723,6 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 
 	drm_mode_config_init(dev);
 
-	ret = atmel_hlcdc_create_outputs(dev);
-	if (ret) {
-		drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
-		return ret;
-	}
-
 	ret = atmel_hlcdc_create_planes(dev);
 	if (ret) {
 		drm_err(dev, "failed to create planes: %d\n", ret);
@@ -741,6 +735,12 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 		return ret;
 	}
 
+	ret = atmel_hlcdc_create_outputs(dev);
+	if (ret) {
+		drm_err(dev, "failed to create HLCDC outputs: %d\n", ret);
+		return ret;
+	}
+
 	dev->mode_config.min_width = dc->desc->min_width;
 	dev->mode_config.min_height = dc->desc->min_height;
 	dev->mode_config.max_width = dc->desc->max_width;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 1f43e0feeedae54321a17efc266654e72e8b9d8e..e582315f70a119f2b39057ff112bc427117b85f5 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -71,6 +71,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	struct device_node *ep;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct atmel_hlcdc_dc *dc = dev->dev_private;
+	struct drm_crtc *crtc = dc->crtc;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
@@ -95,7 +97,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 
-	output->encoder.possible_crtcs = 0x1;
 
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
@@ -103,6 +104,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	}
+	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
 
 	if (bridge) {
 		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);

-- 
2.51.0

