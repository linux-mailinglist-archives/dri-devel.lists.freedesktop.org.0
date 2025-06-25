Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E89AE763D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 06:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FC10E0D8;
	Wed, 25 Jun 2025 04:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="dKAWTYTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A710E65D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750827411; x=1782363411;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=e/mJTOaSWA2P1JapKy8sNOWJL14LCqY1jBMNxyjcl4o=;
 b=dKAWTYTHft0gKMOA9tYE4Yrqs5kJnzw7jSdX8cc81m8IfOVCwoHxHe8i
 2+uEMHMjeMg9M/VI44WWDQ1sOFfNvcy/oAktJ709CHtYnxlU258qbttIo
 DCtR8naPUsiviD3vhPNSnnsEHvjV7Jy7QbRuzFQEXjPfRXX1omPEnb/Us
 q9PSSdzR/etVtt0pf8Y5KpWVP8mAEEFqJY98ubuRLKMQqWeQZK35kUt+N
 rJAyC0IvfIL769bLUTsKyTxOB7E4gEFTbFqzjo1zv+p2zNKrIq1oZfErT
 sYarsiZ8MmaxlGlmqEeTCsjb6LUCwvWp9Ur/plNN6I2Cb1JYtXuixV0PH g==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: Ottw10F8RHGo9SV422wKFg==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="42713913"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 21:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:19 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:09 +0530
Subject: [PATCH v5 1/4] drm/bridge: microchip-lvds: Remove unused drm_panel
 and redundant port node lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1861;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=e/mJTOaSWA2P1JapKy8sNOWJL14LCqY1jBMNxyjcl4o=;
 b=t1+npYydtMChl3XcRSzWZulvNLHRGo1f5cRnLqjyWS/apXPU1mSdxu508JLvCOp8TEYIak2TA
 IaaxLS0qeGBAoz+yR9lz9vIk94RFDhek0g3J+Sy/hVRu5+KBvT7ktbQ
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

Drop the unused drm_panel field from the mchp_lvds structure, and remove
the unnecessary port device node lookup, as devm_drm_of_get_bridge()
already performs the required checks internally.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 9f4ff82bc6b4..06d4169a2d8f 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -23,7 +23,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -56,7 +55,6 @@ struct mchp_lvds {
 	struct device *dev;
 	void __iomem *regs;
 	struct clk *pclk;
-	struct drm_panel *panel;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 };
@@ -151,7 +149,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mchp_lvds *lvds;
-	struct device_node *port;
 	int ret;
 
 	if (!dev->of_node)
@@ -173,19 +170,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
 				"could not get pclk_lvds\n");
 
-	port = of_graph_get_remote_node(dev->of_node, 1, 0);
-	if (!port) {
-		dev_err(dev,
-			"can't find port point, please init lvds panel port!\n");
-		return -ENODEV;
-	}
-
-	lvds->panel = of_drm_find_panel(port);
-	of_node_put(port);
-
-	if (IS_ERR(lvds->panel))
-		return -EPROBE_DEFER;
-
 	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 
 	if (IS_ERR(lvds->panel_bridge))

-- 
2.43.0

