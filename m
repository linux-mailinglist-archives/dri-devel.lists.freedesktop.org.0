Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A4C7A677
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0710E8B3;
	Fri, 21 Nov 2025 15:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="vE3azDwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6F10E8B2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737631; x=1795273631;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
 b=vE3azDwowUrIUF1Ys8iVSgw22S9E6bK1V+Xv/4PuzLdORGlLag/nHgCw
 FzKOk7GqrnlioeX2XyvlIqVwMd1rX2hlfwsaHkxUAKRZ3730+Rlqfbs1f
 e3Iq3RLYNWBH3h93XjgOu1uWHvc5aoO6edeXsVv7BlVAamg77j/6wk8Rq
 irR2enK4IZjhzc4OlfaHxLK9ihnmpHkONafR1WDNofr2Nd2b7GU8uc6Pt
 5p3J3T9eSesiJJg3oPEtoVwOamkwV1h2uLpDpJJn9MOlnKSBlsARKzlBf
 GSYy9cKXjuG4x6n2bvPx21lmmvxiC0f358BjdrXIDd+Caqy7yRnCDqeZk g==;
X-CSE-ConnectionGUID: f+FH760WRD6H6erujY1rjg==
X-CSE-MsgGUID: MX79BasPTICOUlTHpgwyyA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="216838769"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:07:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:45 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:37 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:39 +0100
Subject: [PATCH 7/8] drm/atmel-hlcdc: use drmm_universal_plane_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-7-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WgEXyc8uLNun0CUk9KwvC9R+kGfXdvvIqB
 69iTO4Y6FGJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LebkEACuIxE1e0eQkRC4jb4H0E5QKRV+eEqX2xtt6KjJ3o/x/eJbRO4BFcODojFL/QLWJy6P9de
 3tjyLPR9v5DaH7S2dDxbTkijvCaZ2Qp1EbhBSX0ABAOQibt7/SN7BDrqk7W6cOIp/VpRQfTt/WG
 sx4/8EYny35PO12JefX12jRHKcVOt7//m4I8+VQJGF2Tqe7+Pq+y+uaShau2kqHU1gybDKkW2ai
 TocpkF7R3oRqMk/mO1s0v5XrN0jxNxx60WukhF4o/ndb12Ut414KE0XRdKA177JagF8Xm+gaAZR
 skUHKd6sveMQMuFs4bsks/oxWwGMqv3Mg8GirvH+2pNgw+0vhYYyqhZUGjK3KoT0So80XuIvnNM
 P/3ZzFvjD5hiVSnpzDCa5ub3f1ISZRn1EYXhFNPdXO5w0nYGaDEbW4lvK/e+0Toaalb+3bxIfdO
 pxdbYJgoOet2o+JydjTCk/Sr///nh8U+w+WmZ14SiytCs7jx1viElEcqKySXnuUVueIIJw5mwuB
 VIDr1bg/v1b+5Cdj6eAevAhtzJ75BWnIEAQpoQFDSK+o7sSTYDZ6CtQs8kNiilNL/C3vs7Anx4S
 BGbR/KBZutlaANS3az071hDy91UHcIeUYpDqOlIXyfINJ+3/RH371C8xgJkLYjd1iqEpvx4Sau7
 yab9EM5J9ttKPhQ==
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

Use the drmm_universal_plane_alloc() helper to simplify the code. Using
it, we no longer need to register the destroy callback for
drm_plane_funcs.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 92132be9823f1e705d266f9547702ea9530bd043..c1f3aaae29fb9f6b947f81e2fb4e7a61e10ac5d9 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1225,7 +1225,6 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 static const struct drm_plane_funcs layer_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
 	.reset = atmel_hlcdc_plane_reset,
 	.atomic_duplicate_state = atmel_hlcdc_plane_atomic_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_plane_atomic_destroy_state,
@@ -1239,12 +1238,6 @@ static int atmel_hlcdc_plane_create(struct drm_device *dev,
 	enum drm_plane_type type;
 	int ret;
 
-	plane = devm_kzalloc(dev->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return -ENOMEM;
-
-	atmel_hlcdc_layer_init(&plane->layer, desc, dc->hlcdc->regmap);
-
 	if (desc->type == ATMEL_HLCDC_BASE_LAYER)
 		type = DRM_PLANE_TYPE_PRIMARY;
 	else if (desc->type == ATMEL_HLCDC_CURSOR_LAYER)
@@ -1252,13 +1245,13 @@ static int atmel_hlcdc_plane_create(struct drm_device *dev,
 	else
 		type = DRM_PLANE_TYPE_OVERLAY;
 
-	ret = drm_universal_plane_init(dev, &plane->base, 0,
-				       &layer_plane_funcs,
-				       desc->formats->formats,
-				       desc->formats->nformats,
-				       NULL, type, NULL);
-	if (ret)
-		return ret;
+	plane = drmm_universal_plane_alloc(dev, struct atmel_hlcdc_plane, base, 0,
+					   &layer_plane_funcs, desc->formats->formats,
+					   desc->formats->nformats, NULL, type, NULL);
+	if (IS_ERR(plane))
+		return PTR_ERR(plane);
+
+	atmel_hlcdc_layer_init(&plane->layer, desc, dc->hlcdc->regmap);
 
 	drm_plane_helper_add(&plane->base,
 			     &atmel_hlcdc_layer_plane_helper_funcs);

-- 
2.51.0

