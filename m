Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FACC87ACE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2F810F137;
	Wed, 13 Mar 2024 17:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J3Jw97vT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8DF10F0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:20:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BF236000D;
 Wed, 13 Mar 2024 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710350426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cxt4rRwQDdEywKuxvwOOReRQvAjrL6urT5nnO/pBm6M=;
 b=J3Jw97vT+ILqpl1j49Q8O86WY7SE33uGUsifwrp8kTNxnRxv/oO/lK84KBukynQbTcNgHN
 b/cJxZq+GEPr0r5Ey3M8ABgJ4yoMmZ8bFz4ZrYwqBmCkpaaDnayofBF5GhRpKB6MEEpXa+
 MFaVLLIh6t68ZK78OeOku7yJw5n+MpMDOtefahec6cnPtJec3OJWrDXT38jkEKfjZ4tLnV
 SdcDMeSniUGFZACgQ6CP5nBvi2IX14pAmZCh2gIA4dk4S7zbwCqLlC6pA6yWrQWUXbmH5P
 /G2Hy0akFD38PNLrAoevu7LulneLA/Oux1dLkr9zPRlXCDzO+icACHI0wzINUA==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH v3 3/3] drm/panel: simple: add CMT430B19N00 LCD panel support
Date: Wed, 13 Mar 2024 18:20:16 +0100
Message-Id: <20240313172016.387277-4-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
References: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
TFT-LCD panel.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 20e3df1c59d4..d13c42d0f57b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing cct_cmt430b19n00_timing = {
+	.pixelclock = { 8000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hfront_porch = { 2, 8, 75 },
+	.hback_porch = { 3, 43, 43 },
+	.hsync_len = { 2, 4, 75 },
+	.vactive = { 272, 272, 272 },
+	.vfront_porch = { 2, 8, 37 },
+	.vback_porch = { 2, 12, 12 },
+	.vsync_len = { 2, 4, 37 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW
+};
+
+static const struct panel_desc cct_cmt430b19n00 = {
+	.timings = &cct_cmt430b19n00_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -4402,6 +4428,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,hv070wsa-100",
 		.data = &boe_hv070wsa
+	}, {
+		.compatible = "cct,cmt430b19n00",
+		.data = &cct_cmt430b19n00,
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
-- 
2.34.1

