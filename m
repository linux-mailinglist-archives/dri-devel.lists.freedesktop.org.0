Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA48508CB
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 12:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC410E61D;
	Sun, 11 Feb 2024 11:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="S4VHzaJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6A10E61D
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 11:18:29 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id ABE38604E8;
 Sun, 11 Feb 2024 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707650308;
 bh=y3V35ER3Ilcu2aNMexJjIxdCPyQR6xRTWRwiX3tpK34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S4VHzaJwkBtpb0wUV0eH7YHUTKWHPpVyeVmkIXTc7BD2SD48iEtZhb7/7NsA3K5pv
 fYddUA9B2eCxye1E9+PcWmrN+VtuG7sOPhKCaTl6p1UlEjOxxA5vT5wmX/xjIJ/Jfj
 YSo22xkt0HnXqRgmt2iiBPZEKj/X+cKFoQCOBXUssQd1/J+s8rWctdLTf3SIHqZf69
 +YnMHxMCVpZdobhHLKPA/kud14O1jh/Oeozq7S60zHPTqhLLr05801j7M065h09ZJf
 Q1Q/lwlWDimKyMF05HDViZm9AcM7UXFN8ply2qYmQSjIqsYhwSAB8X4dqnKFwKIrNX
 NiUPqXHvFJJ1A==
From: Tony Lindgren <tony@atomide.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
Date: Sun, 11 Feb 2024 13:16:59 +0200
Message-ID: <20240211111703.7567-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240211111703.7567-1-tony@atomide.com>
References: <20240211111703.7567-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The BOE BP082WX1-100 is a 8.2" panel similar to the 10.1" panel
BP101WX1-100. Both panels use the same timings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v1:
- Update viewport dimensions based on panelook values asa suggested
  by Dmitry

---
 drivers/gpu/drm/panel/panel-simple.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1367,6 +1367,23 @@ static const struct drm_display_mode boe_bp101wx1_100_mode = {
 	.vtotal = 800 + 6 + 8 + 2,
 };
 
+static const struct panel_desc boe_bp082wx1_100 = {
+	.modes = &boe_bp101wx1_100_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 177,
+		.height = 110,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct panel_desc boe_bp101wx1_100 = {
 	.modes = &boe_bp101wx1_100_mode,
 	.num_modes = 1,
@@ -4343,6 +4360,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "bananapi,s070wv20-ct16",
 		.data = &bananapi_s070wv20_ct16,
+	}, {
+		.compatible = "boe,bp082wx1-100",
+		.data = &boe_bp082wx1_100,
 	}, {
 		.compatible = "boe,bp101wx1-100",
 		.data = &boe_bp101wx1_100,
-- 
2.43.1
