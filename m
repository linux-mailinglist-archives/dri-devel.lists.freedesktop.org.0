Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306F87067D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC281122D8;
	Mon,  4 Mar 2024 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hSIUVb6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679C1122D4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 447ECC399F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 949B920004;
 Mon,  4 Mar 2024 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709568301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02ddm9Xy6N7z/+neL8gzCb13I4/NT+KuYhzJAZBmiP4=;
 b=hSIUVb6E9z+JSB3bVvrNY/dPAlfXj7zfaI3INTwE8Z2MqF10k09JJmTREEaB3DRgjsWAQj
 YwzYwrwJKxnGbuvvtKJw9iaJxJvbXAzkzEXZeTUcF58cWnZDswtLxwJNXEVgAPkiSIgJtc
 9lroxmwHSoB34Yz6fFszoK/HGENu8aOAhW+7unBeOQ2lIxYlqzYMgCqQwIYnS3ASG9W+mX
 tixzkUi6qIOWAa+ekwBb2CBGStwPBvV/uqrjaRzm4I8BjtYxsd/8EjxtKvgcf8zQ1GRw7Y
 tu1aM+ajydcauOYQjMoKO7iApTuYrnLSblJ2fCiJYBYBBnYiG5xrDw6qRSSo7A==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH v2 3/3] drm/panel: simple: add CMT430B19N00 LCD panel support
Date: Mon,  4 Mar 2024 17:04:54 +0100
Message-Id: <20240304160454.96977-4-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
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

Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 20e3df1c59d4..b940220f56e2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode cct_cmt430b19n00_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 43,
+	.hsync_end = 480 + 43 + 8,
+	.htotal = 480 + 43 + 8 + 4,
+	.vdisplay = 272,
+	.vsync_start = 272 + 12,
+	.vsync_end = 272 + 12 + 8,
+	.vtotal = 272 + 12 + 8 + 4,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cct_cmt430b19n00 = {
+	.modes = &cct_cmt430b19n00_mode,
+	.num_modes = 1,
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

