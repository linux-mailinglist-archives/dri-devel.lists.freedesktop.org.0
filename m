Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CDCCBFD5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5300310E108;
	Thu, 18 Dec 2025 13:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="kFUrUA5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AFA10E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766064409; x=1797600409;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ha1BPyyylS6A6UQC8yFXbfo2wrOczjUDbfibr5RJHhA=;
 b=kFUrUA5iKdZMlBC3hAdxjTAQPiGMmW5ukweZqf99th2wQ6tTAaZHOuFI
 xLrQM1ndrSx5hn0GlY+DTxPcFLncKJockwB6T9uaZ84HW3js1vsFk8Jdc
 8OMelZkhtkZL430+yfEtVYNMGnEeq6aeR3Bb8X2/6E2gav5vuWld1tCHY
 S17Gcp6G+2ViTOf/cA9yqleUUvl8aHLWD3QJC9pjdbUMul9s0LDPJ9XKy
 LEClokjROPeZ1T98On3Vs8ORfQgPCh2U8l7hJtTPgWj6fWhCBIDNPKhoD
 vUBMSeHN5McgnUgZWwUsYgPEaUrwLNZFpb8fZafAKrbHzgl25WJ9EB4tS w==;
X-CSE-ConnectionGUID: 2/lmXmCJRTiQR6o8m97H0g==
X-CSE-MsgGUID: Pj9SRKW8T/S19f0gjxewKw==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; d="scan'208";a="218051105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:26:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 06:26:43 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 06:26:40 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 18 Dec 2025 14:26:06 +0100
Subject: [PATCH v2 8/8] drm/atmel-hlcdc: destroy properly the plane state
 in the reset callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-lcd_cleanup_mainline-v2-8-df837aba878f@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2586;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=Ha1BPyyylS6A6UQC8yFXbfo2wrOczjUDbfibr5RJHhA=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpRADxs5WwSpLHexLLPdA+Ag7BoEpd0T98A1MYa
 C3r5qhF9MOJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaUQA8QAKCRA+OeYT93tk
 LQpBEADDm8axtqGmQ6pBRiJfC22kJFO0nLsMZDsY2Qb/vSknc2TIe9gdqAvmBSG87AHRlV18GGm
 UoqB+IoBkyzlOq8WnFfSc9zArT9sxm7zPw1zk9farQEoIduOP39DB0xsb+TBbSM9tPLDhm7yJWE
 lusSRkzyoIAgASTSvIiEFAf4Xunz3hZXJCNuaNSygjGLz6P9EXlFkx896DyBxVK3S5okIcgRqKc
 JQnTZ+N4VTb2DckBKPwjKXfERPW3VaM5Z3cTx74+vzuccXO/0zbuHG+mnuz6yeymNoJfEG7Cbr8
 SHwz40iwe0L6WaMxJFbewpfI1wQhct8QfDx7NiZSoTYCu0LGpDgSYZjGjfyhs0mk/3ZRbinjG18
 U/Vqj6tL63YgvNDGxECl5JNO4iS59StGK0k/g9wetn2aB9TMyF/miLDKs6FfcIvE3yK2cV5Azhr
 AmHPw+WBV3Z7J0LAmkzzfJtX+BFGq0B9ZXeQGJGSPWg6uyUlrVGixBiKw1TxwW1GUl4v1umEa47
 0h34Vqidj5VoIqge3GlsdxEr6XK96zolCmepHseh6cVhm5PSdYfGm7c+F/1vhihOKD/CNhU3+0a
 8yziU3EO7ZJ/dPcgOIsgVjy56bPwyPAXCMA3IGRglebzCrBx1pVkUbrettg7JuaEu6c0PwaXVPx
 CNzohovPgq7jvMQ==
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

If there is a plane state to destroy when doing a plane reset, destroy
it using the atmel_hlcdc_plane_destroy_state() function. So we call
__drm_atomic_helper_plane_destroy_state() and avoid code duplication.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 52 ++++++++++++-------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index c1f3aaae29fb9f6b947f81e2fb4e7a61e10ac5d9..81dc730362322a4bae9b48dca97b06baa1e331e7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1155,32 +1155,6 @@ static int atmel_hlcdc_plane_alloc_dscrs(struct drm_plane *p,
 	return -ENOMEM;
 }
 
-static void atmel_hlcdc_plane_reset(struct drm_plane *p)
-{
-	struct atmel_hlcdc_plane_state *state;
-
-	if (p->state) {
-		state = drm_plane_state_to_atmel_hlcdc_plane_state(p->state);
-
-		if (state->base.fb)
-			drm_framebuffer_put(state->base.fb);
-
-		kfree(state);
-		p->state = NULL;
-	}
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
-		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
-			kfree(state);
-			drm_err(p->dev,
-				"Failed to allocate initial plane state\n");
-			return;
-		}
-		__drm_atomic_helper_plane_reset(p, &state->base);
-	}
-}
-
 static struct drm_plane_state *
 atmel_hlcdc_plane_atomic_duplicate_state(struct drm_plane *p)
 {
@@ -1222,6 +1196,32 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 	kfree(state);
 }
 
+static void atmel_hlcdc_plane_reset(struct drm_plane *p)
+{
+	struct atmel_hlcdc_plane_state *state;
+	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
+	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
+
+	if (p->state) {
+		atmel_hlcdc_plane_atomic_destroy_state(p, p->state);
+		p->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state) {
+		if (atmel_hlcdc_plane_alloc_dscrs(p, state)) {
+			kfree(state);
+			drm_err(p->dev,
+				"Failed to allocate initial plane state\n");
+			return;
+		}
+		__drm_atomic_helper_plane_reset(p, &state->base);
+	}
+
+	if (plane->layer.desc->layout.csc)
+		dc->desc->ops->lcdc_csc_init(plane, plane->layer.desc);
+}
+
 static const struct drm_plane_funcs layer_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,

-- 
2.51.0

