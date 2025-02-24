Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB138A421D8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446F10E312;
	Mon, 24 Feb 2025 13:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sB6/ir7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EB710E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 622F35C6DC4;
 Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FC2FC4CEF8;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405064;
 bh=5ZnKgIAuKnEFK7Y8NZ5mOCc85+F4VvfoYmgu9iVxDVY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sB6/ir7j88IjurwQACHCenKq6ObU4ymiotnN4cEBDRMunvAS3UYTy1hF7nwYj1m8x
 UucFkvX65qjTbXCdEQt+A1J9zzOhrJZGVUHLCNFmQrbcJHdxbli8VhcJuZuwOy848l
 /xWU3nyEe/K80/qkA6kNHMkFePLb/59zh520fHZvxsV8cHXd+dBwX3To0lorryJstD
 jBvaPdEy9ds7MaT1ixJ+p/Bu42ypv4DlH7jaSIjiqYd7BhTpvcWE/bC1HYBVkwp1pP
 QvQTo7w8Xd9vD6jLOVGtMn/7ZmJbu7DWhhRlXv8u69ZPgfvJG/LNSpatRUU1kTz0xT
 YVYnlvtXVEm0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 87F28C021A4;
 Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:57 +0100
Subject: [PATCH 07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1886;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Cju7ma2SUhb+XLBd5DK6cBkjDfg4PKWYSUHWwciFPIU=;
 b=bnH85hLfjsMGDvGh+rvH0i7I1VxeDU9NSzTxo6hasSyf3NS+u/TjBLlkfwYzsKWsGujdRxJn+
 ZguaQGB1uQ8DSaVG5Bz4YOVYBI/PzV5ax7G8i3Wf5la1xd/tWSAKp1R
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

add support for the BOE AV101HDT-A10 10.1" LVDS panel

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b2f128fd3094bfb6731fc348b91cc101f495a86..a52977ab73dc2edab0d1954c702fd797d6a5b969 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1374,6 +1374,35 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 	},
 };
 
+static const struct display_timing boe_av101hdt_a10_timing = {
+	.pixelclock = { 74210000, 75330000, 76780000, },
+	.hactive = { 1280, 1280, 1280, },
+	.hfront_porch = { 10, 42, 33, },
+	.hback_porch = { 10, 18, 33, },
+	.hsync_len = { 30, 10, 30, },
+	.vactive = { 720, 720, 720, },
+	.vfront_porch = { 200, 183, 200, },
+	.vback_porch = { 8, 8, 8, },
+	.vsync_len = { 2, 19, 2, },
+	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc boe_av101hdt_a10 = {
+	.timings = &boe_av101hdt_a10_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 224,
+		.height = 126,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode boe_bp101wx1_100_mode = {
 	.clock = 78945,
 	.hdisplay = 1280,
@@ -4813,6 +4842,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "bananapi,s070wv20-ct16",
 		.data = &bananapi_s070wv20_ct16,
+	}, {
+		.compatible = "boe,av101hdt-a10",
+		.data = &boe_av101hdt_a10,
 	}, {
 		.compatible = "boe,bp082wx1-100",
 		.data = &boe_bp082wx1_100,

-- 
2.48.1


