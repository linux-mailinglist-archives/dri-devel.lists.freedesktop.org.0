Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0CAE7A84
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C908310E6AA;
	Wed, 25 Jun 2025 08:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="McZHcGpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E469A10E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750840963; x=1782376963;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=we0d2ehlIOtxp7+Yqm9uSYJ7GkQr7pFecuAnOd/6pMA=;
 b=McZHcGpDKnJVC4iSZqDK+LbIK45b3uIX7dZjUmivwZZV+DwqciPh2zN6
 FkNbykMAl0oBr4QEH1j8TWTKrDJ8xvxn7ktl7Cw/+Fac4zzTb1cuwasRZ
 0E7PabC37jJoELQ+oxu535tNS2k+16IqfB26ZKKww4emxhwFpwKJKZ2SK
 UeEYB92QnX+9+KRx6CrMOqqmHFPuVDZO6bu2zAEopfNfkx5zU1L9gCrsA
 HQw7M052LTFnCOJcdqfwRtVab97QbqDi0B8nt6hlVtdbVUz7UO/NC8OQ7
 qdU7ZpY0JYBuVyeh+v2JNvfUq4gNbh+jdLcYwO9wUEWl16sQAT/LN8cF9 g==;
X-CSE-ConnectionGUID: cBHfqEUaQkGtLTAUKVdw1g==
X-CSE-MsgGUID: DqASLBELRGqO9OruYrhDLg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="274587525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2025 01:42:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 01:42:09 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 01:42:04 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:11:53 +0530
Subject: [PATCH v6 1/3] drm/bridge: microchip-lvds: Remove unused drm_panel
 and redundant port node lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v6-1-7ce91f89d35a@microchip.com>
References: <20250625-microchip-lvds-v6-0-7ce91f89d35a@microchip.com>
In-Reply-To: <20250625-microchip-lvds-v6-0-7ce91f89d35a@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840915; l=1910;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=we0d2ehlIOtxp7+Yqm9uSYJ7GkQr7pFecuAnOd/6pMA=;
 b=/NKJIWO8kD9Gt9nqsoC5LJCdw3/DA6wVT8AaU7pDDQHmjPvPK+xcZhFWoUtWT/GojIdUTkCk8
 ja/883mXLP8AK2U8jK/7s7GUWXpEyfhkUdr+2QhygFeRrTd017lh1EL
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

