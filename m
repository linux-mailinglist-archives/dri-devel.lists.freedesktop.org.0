Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A3CCBFC9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB210E432;
	Thu, 18 Dec 2025 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="IuHsSn5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4410E434
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766064407; x=1797600407;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=B5OMjTtB3KvSOSitHSwKvJyc6OwPvRdH+hvUZpIHPnI=;
 b=IuHsSn5QPNFZ8sVkJP0s+QgRsH048PXg7yxGNtTHE4vb2vz1Yut2STkn
 mWqc3lwJnXOJRA7WwFrsq0Q1oxNlCSu8dugQuxH8nkAuFiXmpTQaJdryl
 RbAZ3qz3KANfDZZgKu3C0qqT1fK8rjF09AmpEd9Q2RJtFrL9sGye1x8Fm
 xPGFNf2ZpvqcUjs9HQEl5NJPLQiPXgz5d86ZPTp/uEpc9m/KNYM3AKL0y
 MiSQDPzUTzt4YZwUO34fI70ovmbgYjNFbP6Rf1yiC3A6tIvSaup+ktHHc
 HqFissAXSsjIEuKqTFBfP1N62fdpTHhbfzydeHQHhySIZN6KpqfPo49l4 Q==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: vqkeqlxMSF27mt6zgOc2/w==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="218051099"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:26:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:21 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:01 +0100
Subject: [PATCH v2 3/8] drm/atmel-hlcdc: use drmm_simple_encoder_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-3-df837aba878f@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
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
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxmkT1ZVBs1iBWhVCsdRGhMAVx0EtZocCfg
 GPMEdN15hGJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LdtsD/4tDMttbpQ8n+8yJUQph2yvedsFtEUcrui5cfdF8Fg62QRTSyAohKRNCHXQEGmt6cGJvrp
 LDaqprYJO3e5buwhYxZbdBKLVtCIrM6LY6Ty4gN2d1iuTUf+V2jbYKR2mgBAFa7AhP7MkfjN+OZ
 5qBv8s/+4XQdUXA7VspAo+rhaPiPSNnRbokBDKdOAsNhS9EYZEfO8UTpqWUHlgoUT3rYnBJVbUO
 aLZL3DB+kmArIA0Fxi2UzJFNWVNxGq+k8z8m7wLnDaqx35MUjz1JYf20D4BYVSnKvtToDUG/Q8a
 S+VjZ4ZpBbqg9PnRJKItPX5WZppiMH2NP06fNSYGB7yHdlertS1Uw15saLln8uXvFredbNwl/gI
 yBod30u9B7eiSp56VZ2sYnLla9dyy2GziW5oRdivyStQy3XoSlHStWWlsOkmCrA0ChJUlmiB5Rp
 PCFPsdXbZK7ZQHrsxPaCQT86/AjwhBRSergVMRJluxeYTpBJUXC8X+lB+bbjGPnD8ug5xconAQa
 mikuwhuJMETYPnb60qGLexmbez4GDqcluNoggkNv8NTLE1+IOVyIgBpTaQv92lW3dQeUe3FyIUY
 4WkaBVcEC7Ni9QSKzlHwon4Cy6q+ns78z9TSRduaUbQ+A3e7X3zpxZ/vKO9eZr1p1LUFqMgFw8W
 9QnnScHv2Z91OMA==
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

