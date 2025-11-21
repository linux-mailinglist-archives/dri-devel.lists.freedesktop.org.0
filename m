Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419ABC7A653
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2F10E8AE;
	Fri, 21 Nov 2025 15:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="SpCkqob4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302C10E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737586; x=1795273586;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
 b=SpCkqob4J8wcwvHWfhCxeYfkl9Yl5BoIO2NZNAdNd16SMCvmhcCzI2W8
 ywnLxEFD15+PRGE09LF3edgavviIlA6p+Q7Ai6Ze9yWPWI8f025dJRcV9
 BkTQZNq75zfjMcXREOW+OGdMnTS2YklMzR3w1PGsUDe+7Rs+MJuEnsWUY
 0irWJo/uUwAfteCdWE7IPYiLbZJQuWo4UdhU/Lex85LO1Y9R/FN5Ap//t
 nJtnwPCI4uARv32jH/iElim9wHdcyK/y8WdOu4lKk0qyim2TdoWewM2Hq
 Hujh0oyE0r2eB4I5gcmlpHmcUdc9urmnGRV7Gh20EpfhvAA0dfaa3AkkG Q==;
X-CSE-ConnectionGUID: Ubo8wtofT1S9f5fCNZ+Rrw==
X-CSE-MsgGUID: g4LF2+ioTUiA4vtG7Q8JpA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="56053150"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2025 08:06:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:21 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:17 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:35 +0100
Subject: [PATCH 3/8] drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-3-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WAcQuo7Hgt4L59frM6s6uPhpepMvIVGwjA
 wngCTtUKpSJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LbjmD/0U/W8SnPLpZ3AacgQf/X++EdIxaLPSqNaRprjSPoBQYv3cwL/inKrefkFcq5nP7RGIF6z
 2N9u2TaEbXxjmmkhlWiZCjCS+M0drepYHLRPgfacVB++6MZwD1eP2n+WS0wS34bNPSrAv2Y282P
 49kr6YeXe81iexpbzUj4SjB0gEFupC8b0gcF2Xv69qfh6DhZ9xYlsGJ44liLSHSwaTmAmklPN76
 6MLyX8yZCaUDRTWr3g7/aFA3dIeSojg+g53lFn9UkpJ30WhBUR3xnimUV1YpQUetprbueOSwOxL
 rnoczMML1Wue7kpJ4aFIFk+JsAXD3UCq9unihXIA1DN3vO92S5MOexHDZR17biWPL4ct8XfqMnG
 /7D+WPdos5i/V03gP0PA3qbxSdGAm2JwWS1xPd1ZbbHRRY4rIy3b/ImGoKYfvzJMAW+LlIS+rau
 qVreRuxCUkgeYkCWW1Gl9eC1nraap29z2n5KFWhjAgH2AMNKNMdaK/wXpS8wHJE84QOkMiOvm2h
 G+w6a1wGT4tqeW2C4zLsR9zZAA+JKA5Gd8AG88h7Z7JPCuW3reQbbJhGPiEW0tEqGNPI48/epcS
 PKtjBc6FFuxAzRluPil0rlUrgVNYuOVeHXwjv+fHhilfXdKN/HWKNXlnzdmCU+ltarb2rmPvvlg
 QskfThUnRSANNGg==
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

Simplify the code using drmm_simple_encoder_alloc to handle allocation
and initialization at once.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 27 ++++++++----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 0b8a86afb0965ca3085dd5524983a0072199ec0b..1f43e0feeedae54321a17efc266654e72e8b9d8e 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -73,22 +73,19 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	struct drm_bridge *bridge;
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
-	if (!ep)
-		return -ENODEV;
-
 	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
 					  &panel, &bridge);
-	if (ret) {
-		of_node_put(ep);
+	if (ret)
 		return ret;
-	}
 
-	output = devm_kzalloc(dev->dev, sizeof(*output), GFP_KERNEL);
-	if (!output) {
-		of_node_put(ep);
-		return -ENOMEM;
-	}
+	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
+					   encoder, DRM_MODE_ENCODER_NONE);
+	if (IS_ERR(output))
+		return PTR_ERR(output);
+
+	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
+	if (!ep)
+		return -ENODEV;
 
 	output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
 	of_node_put(ep);
@@ -97,10 +94,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		return -EINVAL;
 	}
 
-	ret = drm_simple_encoder_init(dev, &output->encoder,
-				      DRM_MODE_ENCODER_NONE);
-	if (ret)
-		return ret;
 
 	output->encoder.possible_crtcs = 0x1;
 
@@ -120,8 +113,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 			drm_panel_bridge_remove(bridge);
 	}
 
-	drm_encoder_cleanup(&output->encoder);
-
 	return ret;
 }
 

-- 
2.51.0

