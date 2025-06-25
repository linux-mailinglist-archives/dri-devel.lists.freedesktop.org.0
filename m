Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1AAE7A83
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A8E10E6A7;
	Wed, 25 Jun 2025 08:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="ZsCXiDgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D12D10E6A8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1750840963; x=1782376963;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jRHcWjqXkbpU4dlcT7V4DZxOI9eS/auzfoKMTr9Ocmc=;
 b=ZsCXiDgrLF3d84CiVByfVFNhyvJW8AXwyNCBa0i/5xTSuVVwzAXO3bKg
 eDkOcq5synIE4iQZDupoo0BBJuHKNSgIHkOXxXjSEt1tC+tkCBFhqR/ft
 +blFhpdNvU4LOxGr1F8be+J1SSXBycP0KC529u5NmZ1Y5Vc0NNWQOvzdo
 2dbcz5+emUpNRNuzZdVvYKNJyUnow3A2JbjtM2LbqWN/NO9J5Ysdd1A87
 3sC6DSBjADurP3XlbI5S05VO0B+EARQwCRU1LCF1KG2XLvtUAMBDcyakE
 x0/yx54ExYNSnMfAaIppr2sl1Lq0HIkGpoJZEFPdfFngArBP9TIHM6XiT A==;
X-CSE-ConnectionGUID: cBHfqEUaQkGtLTAUKVdw1g==
X-CSE-MsgGUID: wpML76ntTYaKlx0V78GeDw==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="274587526"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2025 01:42:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 01:42:15 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 01:42:10 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 25 Jun 2025 14:11:54 +0530
Subject: [PATCH v6 2/3] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-microchip-lvds-v6-2-7ce91f89d35a@microchip.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840915; l=1621;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=jRHcWjqXkbpU4dlcT7V4DZxOI9eS/auzfoKMTr9Ocmc=;
 b=Vd4R0rYgDrd+nWx4fM7lsU3Mn0L/c7Vxf17UY0cGRtDiqIWprWZpbBSs2+Ti+qSNeq1cYfK4N
 T484VX0rH07D+W/H2WPsrR8sIIPqp/wpISKvufX9QtznxGByufZIj3U
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

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 06d4169a2d8f..042e83494d8c 100644
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
@@ -131,7 +132,8 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 	lvds_serialiser_on(lvds);
 }
 
-static void mchp_lvds_disable(struct drm_bridge *bridge)
+static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_state *state)
 {
 	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
 
@@ -141,8 +143,8 @@ static void mchp_lvds_disable(struct drm_bridge *bridge)
 
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

