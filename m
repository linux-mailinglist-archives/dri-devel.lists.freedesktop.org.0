Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671ABCCBFCF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4196610E523;
	Thu, 18 Dec 2025 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="CGtFPgAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8510E432
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766064408; x=1797600408;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=CGtFPgAbZWJFhdXYgmqtxaJIq8F1mW1rw2J6LY/tToHWrKG6Mf+bSkUt
 IYlzqCZ7auFV3+a9UVWlQjMHYJVHY4IbydzKQWqx8cP1Aa+XxVRImQI/P
 N1B8VpOMQfOu/kmSGBbo0KAbXppwIdlcGylI52PQysAVRzdI+GdqY8gIY
 IS3VKEhtOFkraARaFfgaUG34Z6OmfNnECUiqS0ggiFSkanYaEKScEuCJG
 LzguZujLvf+EJ0tvDrHsNpp5Y6lDeO346bUWlPTVLuU8j8DZbMMiuugha
 Ho28uq/HSlOo4F9xtfua56sX4VngF1SNm96tPX+sGu0+JckY4gUO0olBR w==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: 2G7U0F7qSrejLDKfYF/h8A==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="218051102"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:26:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:35 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:32 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:04 +0100
Subject: [PATCH v2 6/8] drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-6-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxtrpSY4xe5mXFiCi30OuU2WXVgrLPk8OV2
 2OPMMOSKyKJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LS3ND/0WWZx3nxRsawY1DkE7jRoOUUN9YS7ELjs0+OXTRGywegRnTNxx9PDlorjWA9qpiaIDnM2
 bZS3LTTByn30RYHLRCoHLYCxK2aCN9Hy8iPKH6qGZ4u9HsG1e0DR5uBQr2ngbrHhuwjDoLlnFLc
 +H+XDUI8ggRHJXA16QriEj1/vT8W8lvzNkRPxXdBEiSujA2CTIgPDtX5Jj4ON4rj1DaqhRz/3Vh
 AyHd/eIGMS1KMSi8j5ME9KePibIcgldjFKR1sBFys8r2+LguNCRHhUgUZd/nKpjj6d/E4safDlq
 d2KHXZ6JGUznJkPqItiQlxKvkeHsMldXFxf9lyh884DojJEw7zkhStqUiH75f7N5UbLzzqNJcuF
 l9ssCUXhjpL8JFUTSUYUAARKgkxtOsVfwAi9V0ByDYNnO6sQ92smGhg11kQrqjcneBsFfEnzw/J
 rjyZywV5vLfeDeNWHJtCvfuy71l6zOMEXO4smycWRRdb9hWMXSEirB67MoKRluuhfSOdZi575JR
 gbt7E03+4p1q1syjxwXn92+bNW6r6uP6CIxaLukqydURO+lk4+yvkzMdSXUc9haE+0xYGvQ6PsY
 7+l43whavLtaoTgWLaHLumQQbyNsq0U7QHrnQ2FyNkImC1UwPR+ctZm+uVaV3fmzSfCAx24a5ji
 uQH7dRrOckQKwNg==
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

Use drmm_crtc_alloc_with_planes() to simplify the code. As we no longer
have to take care about cleanup, we can get rid of
atmel_hlcdc_crtc_destroy().

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 32 +++++---------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index e0efc7309b1b256520eff29462431476f8589255..b075f291847f9eb91e07b7844382871f38ed5f81 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -509,14 +509,6 @@ static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
 	.atomic_disable = atmel_hlcdc_crtc_atomic_disable,
 };
 
-static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
-{
-	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
-
-	drm_crtc_cleanup(c);
-	kfree(crtc);
-}
-
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
@@ -607,7 +599,6 @@ static void atmel_hlcdc_crtc_disable_vblank(struct drm_crtc *c)
 static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = atmel_hlcdc_crtc_destroy,
 	.reset = atmel_hlcdc_crtc_reset,
 	.atomic_duplicate_state =  atmel_hlcdc_crtc_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
@@ -620,15 +611,8 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	struct atmel_hlcdc_plane *primary = NULL, *cursor = NULL;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct atmel_hlcdc_crtc *crtc;
-	int ret;
 	int i;
 
-	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
-	if (!crtc)
-		return -ENOMEM;
-
-	crtc->dc = dc;
-
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
 		if (!dc->layers[i])
 			continue;
@@ -646,13 +630,13 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 			break;
 		}
 	}
+	crtc = drmm_crtc_alloc_with_planes(dev, struct atmel_hlcdc_crtc, base,
+					   &primary->base, &cursor->base, &atmel_hlcdc_crtc_funcs,
+					   NULL);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 
-	ret = drm_crtc_init_with_planes(dev, &crtc->base, &primary->base,
-					&cursor->base, &atmel_hlcdc_crtc_funcs,
-					NULL);
-	if (ret < 0)
-		goto fail;
-
+	crtc->dc = dc;
 	crtc->id = drm_crtc_index(&crtc->base);
 
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
@@ -674,8 +658,4 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	dc->crtc = &crtc->base;
 
 	return 0;
-
-fail:
-	atmel_hlcdc_crtc_destroy(&crtc->base);
-	return ret;
 }

-- 
2.51.0

