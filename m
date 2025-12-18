Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE55CCBFDB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585E310E955;
	Thu, 18 Dec 2025 13:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="ArrwhWzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D668010E432
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766064409; x=1797600409;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
 b=ArrwhWzF5rFZOgWH9FMHl1gjMy9bKOdWEjrh6sOyBHeBE/xzH1rdqxwq
 BGQFyIREmJFD57QFX6CeyE+Zdmuzb4nH9q/ZpUTVwxKcj78hrSuWVaatH
 o0HoF1RHvSsMzwJYzdWiddO96gLuTcKzUS/F2wdla1ejapg2G0YUwu8oy
 CDda1ZpvGuaeldGlz0Pnj0Eoy9XQeaAejqCGhwFAbdmW6WxZUOsP3sB3C
 4PTFvTVbli/HygiwV1yNOsqs1n00Z/jPpBr8E+8RHNDEbymUaimNnCZgT
 F3qReoYxWG1c4fQ42TRt8TfCJBCngqAz+KSr3H4ohCdpjDyjJoR0Pawid Q==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: HoMX2EtATVqNcLM7kPIctg==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="218051103"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:26:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:39 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:36 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:05 +0100
Subject: [PATCH v2 7/8] drm/atmel-hlcdc: use drmm_universal_plane_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-7-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=6+fNHOwf5B3Mr/H+++1aDzYmBahYT1JXyEW9NioMyYc=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxJCeXN8wMoRK2QGik2s1K3uFzsLStzA6lP
 /4JG0ZMm5iJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LWPOD/9cwXbDaLa7/EexwyQcOYwedjwilzyuTyYKw0vMYSwVRe4hQEk/FOlSLaM7y+CY5YttyrH
 CCS5vcLriLlQdpugbtCa+Q4MuTRFDEV70QQk/qYLf57xXrfnE7kn3qZN7xTwaLpWC2rCdz52wFG
 /7oGvkHjwirMPQZUOoG2C+vB4BDDmtNjMIJq4zQmY2e7n2lK4taKwWuCRObnjww0vJsZGLEfmhu
 LdaEGmVzWz/3YHD8PzfmhxKIjN2V9OgIP8lNTpqCdpBA6cmct4Pc/Li5Uzk8dYVIx4xng939wBf
 dt+9Bb42/HeYbsgl1PefiwY4tk203PSAa95KrmkjuaTUT2jmfPbGHDqY39UBHcAVh+DmCCME7XB
 aP1rW71Dc2Ws8Ngz3wDtGS5qeiVhDA0ja5A1ddtSWLcGkrZ6rycBr7PYxmpNuIZxNECV2tFAusT
 o7ad5MEMpl6s8iqDjqGbe8Zz+x3KAyX5/oIwSqIdCkQosAPu44lcsNtOTEhR3zct4hRyH9O27mi
 kWlLivDekNnE09Gku1IVp1q2IpQuMaQ/tI5Pg1Y7o1kkGjd9u5ox/ZgibeOoKEuHa+NIs9NLK5v
 DKgGgveipKautIMsUIkKwvRUho9pEdWCNUv9q+9RIWvtlMaJxpzodwkgUDFwiJcB0U4VWUD+h2a
 /1E1MVDS0p8joOw==
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

