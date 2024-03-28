Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CC88FCFC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559A1123B5;
	Thu, 28 Mar 2024 10:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="YUenUkYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96610E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:28:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 258AA8814A;
 Thu, 28 Mar 2024 11:27:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711621679;
 bh=tKRAdKcsJyxMsK9Eo/rAjyJTnRfyMspJGQ0LhTHO4lA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YUenUkYgcHc7IznUlq4+M+v+8RWVQQWD7YznqTLWqJfInRKfaF03685kx6E96Q/P/
 CnTGat4xP3/fGCzKt7kXq6c605JGPl06macWwBdgtdKVeqRfKyA39V++VxbTlvg4b7
 +KVVPQQUpcBHtALpDc7kLFRELeEX0wt/TUB4Jz4wSnMJsrmfmDgFvW4l9hUCLTSWWw
 85HRFgfo7KdhCun0MtHte1EGL9eAb0qOQt2GCvwQ+AqqR/0NnDZ2Q0ixLBJMEne/XB
 46gKYyj3gdko8rGST0+w4kp5lvlIH3ztRNpNey45OisnTo+8RbERB7uaQKdVTNtpIB
 BqNBgAiuOIcAA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: [PATCH 4/4] drm/panel: simple: Add Innolux G121XCE-L01 LVDS display
 support
Date: Thu, 28 Mar 2024 11:27:38 +0100
Message-ID: <20240328102746.17868-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328102746.17868-1-marex@denx.de>
References: <20240328102746.17868-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

G121XCE-L01 is a Color Active Matrix Liquid Crystal Display composed of
a TFT LCD panel, a driver circuit, and LED backlight system. The screen
format is intended to support the 4:3, 1024(H) x 768(V) screen and either
262k/16.7M colors (RGB 6-bits or 8-bits) with LED backlight driver circuit.
All input signals are LVDS interface compatible.

Documentation [1] and [2] indicate that G121X1-L03 and G121XCE-L01 are
effectively identical panels, use the former as RGB 6-bits variant and
add the later as RGB 8-bits variant.

[1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G121X1-L03_Datasheet.pdf
[2] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G121XCE-L01_Datasheet.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 737c78b3b8a23..5acc9f2941909 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2623,6 +2623,24 @@ static const struct panel_desc innolux_g121x1_l03 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct panel_desc innolux_g121xce_l01 = {
+	.timings = &innolux_g121x1_l03_timings,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 246,
+		.height = 185,
+	},
+	.delay = {
+		.enable = 200,
+		.unprepare = 200,
+		.disable = 400,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing innolux_g156hce_l01_timings = {
 	.pixelclock = { 120000000, 141860000, 150000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -4596,6 +4614,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121x1-l03",
 		.data = &innolux_g121x1_l03,
+	}, {
+		.compatible = "innolux,g121xce-l01",
+		.data = &innolux_g121xce_l01,
 	}, {
 		.compatible = "innolux,g156hce-l01",
 		.data = &innolux_g156hce_l01,
-- 
2.43.0

