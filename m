Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA2AE7640
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 06:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192D810E65F;
	Wed, 25 Jun 2025 04:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="onJyqj9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B929810E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750827411; x=1782363411;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3nqEZxV/Y5uq+XwWCf1wbzoSm47wfpCQv/tVq85eryQ=;
 b=onJyqj9FDdZGmFIXuXw1MbboWwBexhBtkHT6cW8uuMf/GGay1WsINXEP
 r92Cudmv7OaJ5VHTBfyOwzbLEtbePCpalNrUttfsZWQ2m/m3CWJTiALo5
 GvXVQ3SQ3+AoUzR+X//GTPz6BO0vqzlHMBd2zdwAIHR/tGTz+u9xI//OZ
 Hsuj931COuVe7kf09CiwI7VvnBJaR4WzznqEaVnVjkC8/tmQiUw7DLSmy
 44sfsPGo9zeoa9TJl8vqwTRl47kYhkHatieQNmnrNEM5EvpoPtsm5yWIJ
 RPY/PS6LAG2erxyWBjQnWGRkrcGOoJUGBjhi5Hw/FeDXELYL6kcIGIkiw w==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: tiE5eSZaTme32b23sLO4TQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="42713914"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2025 21:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:31 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:26 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 10:26:10 +0530
Subject: [PATCH v5 2/4] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v5-2-624cf72b2651@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1753;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=3nqEZxV/Y5uq+XwWCf1wbzoSm47wfpCQv/tVq85eryQ=;
 b=4sdzPsgpBa4OlnMTfa/2tULoTtkrEe19367c/589Yny1LsbWdncOmxsb744sWmSNmJtkcdHMs
 Kz2M9gtS92sA3b/dmDiT0U19OeSBoOxF4/AQHGY5kC632yNsUV1DnXY
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

Replace legacy .enable and .disable callbacks with their atomic
counterparts .atomic_enable and .atomic_disable.

Also, add turn off the serialiser inside atomic_disable().

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 06d4169a2d8f..c40c8717f026 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -111,7 +111,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
-static void mchp_lvds_enable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 	int ret;
@@ -131,18 +132,22 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 	lvds_serialiser_on(lvds);
 }
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
+	/* Turn off the serialiser */
+	lvds_writel(lvds, LVDSC_CR, 0);
+
 	pm_runtime_put(lvds->dev);
 	clk_disable_unprepare(lvds->pclk);
 }
 
 static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
 	.attach = mchp_lvds_attach,
-	.enable = mchp_lvds_enable,
-	.disable = mchp_lvds_disable,
+	.atomic_enable = mchp_lvds_atomic_enable,
+	.atomic_disable = mchp_lvds_atomic_disable,
 };
 
 static int mchp_lvds_probe(struct platform_device *pdev)

-- 
2.43.0

