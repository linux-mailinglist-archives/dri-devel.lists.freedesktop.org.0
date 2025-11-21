Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B8C7A65F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEEC10E8AC;
	Fri, 21 Nov 2025 15:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="rqF6iQlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209110E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737605; x=1795273605;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LrFGjF1cQ/xx2DanwIh3lkueUOjcNFt4oFeE1YjJwXw=;
 b=rqF6iQlJeWuVwnVEVSf3ou+7XEmzgM16fRvnaNZGD4k0ts7FVPXp2Wy+
 kVnw28ePxB7P97OYyq3zgFeQQ9IIiZzZN6zqqU7z3RoMToaoanuWcCcB0
 9/15orLTZT7hP1iNunzUOV0VGAZWb6j8F85nq2kevYWZCGggfNYYtoVav
 ZENA3pK0ks4hZ0SalKP20VzpkqzZWMFt0syyE0jMq4KUBR4PuPUmKxtFv
 fC7vN9qCaOLCZS8U2KDF3R0fsonKFQBvFc/l/rw7s2vTMVpzE+FYJsoWN
 s8W5ed4TsBGHwLxKsKlLyvkSwdHu1I5TA8r3dRbjiAzL4OK0slViwIiS1 A==;
X-CSE-ConnectionGUID: QYOCTpQMSWiHPKM8DKtIjA==
X-CSE-MsgGUID: nlhkiNAZT/23BwN+3qdrHw==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="280874243"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2025 08:06:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Nov 2025 08:06:32 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:28 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:37 +0100
Subject: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=LrFGjF1cQ/xx2DanwIh3lkueUOjcNFt4oFeE1YjJwXw=;
 b=kA0DAAoBPjnmE/d7ZC0ByyZiAGkgf9ahRGYugbEKVpcEF6f1xnKpL6KcNeh6c8Yl9ls/2CBq1
 okCMwQAAQoAHRYhBAAwS8mJaaxbjW01TT455hP3e2QtBQJpIH/WAAoJED455hP3e2Qtfd8QAIpQ
 fB1clOh9Edtn7HnGd+yrG+lG/iJL3qBmUnh5rw/46p5uVkIvepwzhqFXEttkL9Mi+5huV0t9dKb
 joBRLyYnNqJFbkLIFsHCQCCduPowHMjWQAPaQvZqCFw5KERw+eW/JAZMAS0A/51gqHpKvhw2Iu1
 YGIe8LI4Vv/sff5BCeUl8tTC6qp04eVYV28tqjaUCGb3htppBpadnSvkQ2P4giJqi3axxH3Guve
 W3pmANEceOE++rQN4IBRaOdDgRFmRaBzaEjKDd/t+oV1EVGc0/T2LVLj96jC7M5NPgV+E6iblp9
 n8shgrZdxMWKo+Gx//ugIigTuPgopVfjVMguqwvi+gHoS9q3YIIeZS9blK9YRffP+CZObGYuu5/
 0FaRHIkAz0BZVBA9mgKlkZ1HVvg6SaeaSfT8ESNE+r3p8OSA6FbdjSOkgo68Zp2yhyP7mxAPApR
 kn1pL+dFUIjxIqoAc0N+Yep4n2WhkWgLa4+bgfpXooYtbfjwYQTgHrHirASPJl0zkvQ0HlvXVMh
 RubAouFhv0B3ObX9A6vCngnCmE+5WqIs5wG+lIeqvMnNaGhkxJ97fYqvDNyi+IKGTj0et/UDGsO
 k0zL9fr9Z9yN8vTmXyuXRgqfehoCNSenbdl+zY7Q2a9njppQ1kQFPwsUAA84lk/mPDxE0gYwsaL
 QtLI6
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

Get rid of drm_of_find_panel_or_bridge() as it is deprecated and use
devm_drm_of_get_bridge() instead.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index e582315f70a119f2b39057ff112bc427117b85f5..99bc7790d47ffc7e6df26768559407df0184565b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -69,16 +69,14 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 {
 	struct atmel_hlcdc_rgb_output *output;
 	struct device_node *ep;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct drm_crtc *crtc = dc->crtc;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(dev->dev->of_node, 0, endpoint,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, endpoint);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
 					   encoder, DRM_MODE_ENCODER_NONE);
@@ -97,22 +95,12 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 	}
 
 
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_Unknown);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
 	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
 
 	if (bridge) {
 		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
 		if (!ret)
 			return 0;
-
-		if (panel)
-			drm_panel_bridge_remove(bridge);
 	}
 
 	return ret;

-- 
2.51.0

