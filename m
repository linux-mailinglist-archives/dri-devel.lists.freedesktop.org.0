Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA0AE60D0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E8D10E560;
	Tue, 24 Jun 2025 09:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="qkViuFAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FED10E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750757095; x=1782293095;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Ein54qI7rmxnJ9OTf6MtXF+MZAoUwZCXJsSkm5CT8gQ=;
 b=qkViuFAShT/b12bETmFqQq7jceAGL2WmDBdZquef1EnFFOHc8C8OgHZ5
 MGuym7JqzGy+Q3bQZXL+1tM0kYNTVZaXZTIOLcl2YLmnwDlQQ6APN5xGw
 wNLIde6IfGT+MR56DSWOw7GWfms2pOGa9a5XVwizKAaXuBUkBf0AxYsU0
 dFVfsQqijg+g2H4p5Vueuha9L3LoV03zmdinrLPuOSQ+I0qGwH0whtEMW
 Z36BxATZGTwcUlX8nULm6ReBtic2rvedfFG+vz6uWCTeSiUx42xtw5vhH
 EFZsOQAsNWwCl4ilGg0RU0K+rl2BassSE4BbF1SrqV3c4REx6y5GRCgrk w==;
X-CSE-ConnectionGUID: mOi1Uhg9QQ68o5XA/b6ZIQ==
X-CSE-MsgGUID: 8FTTMBV6RAqJ75glG+jTrg==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="48218059"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 02:24:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:29 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Tue, 24 Jun 2025 14:54:15 +0530
Subject: [PATCH v4 2/3] drm/bridge: microchip-lvds: switch to use atomic
 variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-microchip-lvds-v4-2-937d42a420e9@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
In-Reply-To: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=2189;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=Ein54qI7rmxnJ9OTf6MtXF+MZAoUwZCXJsSkm5CT8gQ=;
 b=92vmKg7GGXHMY1DbRPHHVGB6YwkchhJrwJe06eHgs5CaoCCeqg9/Lyawg2IVE81Meq7Uhcc6J
 ba97tJnmur+CHDYuxZqQyDsTDqnFI9Uf4GrTjtt9rPkvpDWhB006h2U
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

Modernize the bridge ops to use atomic_enable/disable.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 42751124b868..e4ff46b03d54 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,7 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_enable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -127,11 +128,26 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
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
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	/* Turn off the serialiser */
+	lvds_writel(lvds, LVDSC_CR, 0);
+}
+
+static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
@@ -141,8 +157,10 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
-	.enable = mchp_lvds_enable,
-	.disable = mchp_lvds_disable,
+	.atomic_pre_enable = mchp_lvds_atomic_pre_enable,
+	.atomic_enable = mchp_lvds_atomic_enable,
+	.atomic_disable = mchp_lvds_atomic_disable,
+	.atomic_post_disable = mchp_lvds_atomic_post_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

