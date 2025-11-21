Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24504C7A64D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FD410E8AA;
	Fri, 21 Nov 2025 15:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="HKLVq3Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE910E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737585; x=1795273585;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aemOi5IutzwP6lzpzpNVxlpvX5r89JXmAras5OUfufs=;
 b=HKLVq3YpcBI/oP4aXZhnUzEMRn0TA/ASLVDr77LadZg1idQxnxJHnrNW
 GMuMkqhU1Fe4CuPrvaEybyJ7y6haDy4gehPBHnninJwbuUjroxCaTtnYh
 f2mkmLMd6DdSXu4YcSPyEz5aXCyFtomIqIgMGw0rBGhW/U9SPucTPAstg
 VqqczlyU8vZPT7xSLBljjjlpf9Y81gC0qouR32ovNzfFoQFxjnayObslh
 6I+/jeuG0wgncbZBwJCikMpn5YTOKI/R9O5piL+eZtMvn1znTqP1CGsE2
 JBfWB7Wm1nvV3uqaULkyzZ41iPYpTMLX+EArzu+OYrIM4hFf8dIi9W2Qs Q==;
X-CSE-ConnectionGUID: Ubo8wtofT1S9f5fCNZ+Rrw==
X-CSE-MsgGUID: pADxvoh3QCWJavHee7GYog==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="56053148"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2025 08:06:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:09 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:05 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:33 +0100
Subject: [PATCH 1/8] drm/atmel-hlcdc: use managed device resources for the
 display controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-1-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3275;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=aemOi5IutzwP6lzpzpNVxlpvX5r89JXmAras5OUfufs=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WnQGbg+azsgk8P3WvGqFEEKIarqJFR93R9
 Ow3U7VotzyJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LTvPD/0fqREFIc5dX+MVxkGSvLd5iUpodlj3CIqK+w0yexw9K/AjXTvSg947IYM71FIldcLWdl8
 o+Nm6c6B/Rpf7+Vweyxvzug9QW/0mNlDv8RA7b3AD88wFa62gcQf4N/88+SiGwgrHdYb2tyu9je
 kPADCx6V65Hd5hK+fNV3oetWrG6raS39BGgu+ZMyhQA14EaCpGFzPax4/7C8garb/iizxKWjJV5
 emn4yMaSnmOw+J03vBtTmohzYKNMrbwkBrFhCOzVE2SriRxfNLoBX+yAPj/4R5fnBWq7IBSGHGG
 12D4trxlx1HDibGWBK3q4dLL+W54n0iIgbpJ6qkGQbVy3+cKgOiqFJJtpqAG5NTj6Oc0ntuqdOW
 iTqejWqs24Qincze4MfhQF97L+M3GtoXJBRoo32RmB1We2S5UERaTmGlJEyDv1EEku3CBzKPby+
 PTphStV+eivBbKFkzapjR5/QkA4vWKjxXzA+i3Yj6r7av/D2lOEVC4M3iApKAZjDWsIte/WO9W3
 8Q/Hhyy9/9efkyiX73aHFIYMSYWFwi5K66qYe7Tk299Cb1CxWIRhUqoAPDiBjWiXUc6n4uK26AC
 s/D8+kdB5RVWoESbBl6mKWMu9OwEXMFiemtcWgr/eTtL9kAWlql/E1BKruxX6h5UVc0bJOOVxoQ
 PrUZrNBpxsQopjA==
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

Take benefit of managed device resources to reduce the risk of memory
leak and to simplify error paths.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 25 ++++++++++++-------------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h |  1 +
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index dd70894c8f38e7303e06167594ac289cb345b510..8ed029381c555db10d596efc8d52753c47767633 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -751,11 +751,16 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 	return 0;
 }
 
+static struct atmel_hlcdc_dc *atmel_hlcdc_dc_of_dev(struct drm_device *dev)
+{
+	return container_of(dev, struct atmel_hlcdc_dc, dev);
+}
+
 static int atmel_hlcdc_dc_load(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	const struct of_device_id *match;
-	struct atmel_hlcdc_dc *dc;
+	struct atmel_hlcdc_dc *dc = atmel_hlcdc_dc_of_dev(dev);
 	int ret;
 
 	match = of_match_node(atmel_hlcdc_of_match, dev->dev->parent->of_node);
@@ -769,10 +774,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 		return -EINVAL;
 	}
 
-	dc = devm_kzalloc(dev->dev, sizeof(*dc), GFP_KERNEL);
-	if (!dc)
-		return -ENOMEM;
-
 	dc->desc = match->data;
 	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
 	dev->dev_private = dc;
@@ -853,16 +854,18 @@ static const struct drm_driver atmel_hlcdc_dc_driver = {
 
 static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 {
+	struct atmel_hlcdc_dc *dc;
 	struct drm_device *ddev;
 	int ret;
 
-	ddev = drm_dev_alloc(&atmel_hlcdc_dc_driver, &pdev->dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
+	dc = devm_drm_dev_alloc(&pdev->dev, &atmel_hlcdc_dc_driver, struct atmel_hlcdc_dc, dev);
+	if (IS_ERR(dc))
+		return PTR_ERR(dc);
+	ddev = &dc->dev;
 
 	ret = atmel_hlcdc_dc_load(ddev);
 	if (ret)
-		goto err_put;
+		return ret;
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
@@ -875,9 +878,6 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
 err_unload:
 	atmel_hlcdc_dc_unload(ddev);
 
-err_put:
-	drm_dev_put(ddev);
-
 	return ret;
 }
 
@@ -887,7 +887,6 @@ static void atmel_hlcdc_dc_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	atmel_hlcdc_dc_unload(ddev);
-	drm_dev_put(ddev);
 }
 
 static void atmel_hlcdc_dc_drm_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 53d47f01db0bd4d906b73f9f2a46f2ef7326d8c6..26b26185cf34ac1678f385982caabd2dbbc22630 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -350,6 +350,7 @@ struct atmel_hlcdc_dc {
 	struct dma_pool *dscrpool;
 	struct atmel_hlcdc *hlcdc;
 	struct drm_crtc *crtc;
+	struct drm_device dev;
 	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
 	struct {
 		u32 imr;

-- 
2.51.0

