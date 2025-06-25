Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC5AE7641
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 06:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D13E10E664;
	Wed, 25 Jun 2025 04:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="GAwlN+5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2AC10E65D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750827411; x=1782363411;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QE4zUYyP981F+5VE7+ZTFWVBH1tBQt/2P/4OLcHIcbw=;
 b=GAwlN+5zEDum8Eps0VPruw76hCkHXH73F+liU9BiRK8h+miyN1au6ZtP
 ZuCG0C9vEfuUVY7zday4xcbB5RoVKzvNXkabr0lytvYD2ZxOWRE3cgv+e
 SLC9z0ehmp+h/m8MEj6p/kpQX8V0O6B9Zh4gSc3sMvmiqXqPrzq/6tW+9
 r4dn2A2xGTSQp/H3M9avpWC35ZWb4g65WFhw97FiwLqyKUU9BuGNp8Fgs
 BSofe9yaRNIy4GcDh2RZ6FY9jBKiNPXTrtWehAH3eX+Ag180gX95hSvpU
 BUsfiidCUH0KNHdUnfJuMGEILeFAKwSzS3VXU5k+Rem+i85f/+5pkqooO w==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: j+snhcXoROCfPAjH4NpPVQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="42713915"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 21:56:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:37 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:32 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:11 +0530
Subject: [PATCH v5 3/4] drm/bridge: microchip-lvds: add atomic pre_enable()
 and post_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-3-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
In-Reply-To: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=2425;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=QE4zUYyP981F+5VE7+ZTFWVBH1tBQt/2P/4OLcHIcbw=;
 b=sQHGhpQdgAwF6+teRgSAuveZIlU9LLriIJHN6qLdE5xtUivcSM7MUiBjbL7qP4b03sWHlXvuP
 rZ8nQFzp4m2C4dfmzTTjezKPhGyZ8Ye+kkuTnDm6CSiMAwwPFJrOcke
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
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

pm_runtime_get_sync() and clk_prepare_enable() must be outside the atomic
context, hence move the sleepable operations accordingly.

- atomic_pre_enable() handles pm_runtime and clock preparation
- atomic_enable() enables the serializer based on panel format
- atomic_disable() turns off the serializer
- atomic_post_disable() disables clock and releases runtime PM

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index c40c8717f026..b1800f78008c 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,8 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
+static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -128,7 +128,12 @@ static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
 		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
 		return;
 	}
+}
 
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	lvds_serialiser_on(lvds);
 }
 
@@ -139,6 +144,12 @@ static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
 
 	/* Turn off the serialiser */
 	lvds_writel(lvds, LVDSC_CR, 0);
+}
+
+static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
 	pm_runtime_put(lvds->dev);
 	clk_disable_unprepare(lvds->pclk);
@@ -146,8 +157,10 @@ static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
+	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
 	.atomic_enable = mchp_lvds_atomic_enable,
 	.atomic_disable = mchp_lvds_atomic_disable,
+	.atomic_post_disable = mchp_lvds_atomic_post_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

