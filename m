Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32E801B6E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 09:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB6710E061;
	Sat,  2 Dec 2023 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8C110E1B6
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 08:13:39 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id A8EF16036E;
 Sat,  2 Dec 2023 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701504818;
 bh=i0Qu86EoRhOUVg9WF10PoY0z73qE6Fd4XRJM8U2Gwnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XhAXba3q4As+JAWyfJ9V+Wtm3bNibIxJV1nk4dV+DzoM4D+BOg8qFmOKE7VNk5rUi
 duEpAjKZkBkEobwfoMa37I0oLF5bm5ErQwDCygwPxkrHlDGNtNnRJ5QGXagt9CoGdk
 hUtL56xuaFboTocC78Q91JGxdkKugfTsW0/qRO1w9FuysMoMLE8YLGzg3QzFg9oVxU
 SaT3zf8sCEI6TJ7zo+H9tGkGprElAfW/KnDCzszG7X8CSePYpoDCKCDS2HdInjZ0Mq
 StEragMxDY0ExNm0PCJVuSthhg/n7bNdNHf+qxOROEwQdXsJYbxl9GG12CVUaQNVnZ
 5KzETygaMPpFg==
From: Tony Lindgren <tony@atomide.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
Date: Sat,  2 Dec 2023 10:11:53 +0200
Message-ID: <20231202081157.47222-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202081157.47222-1-tony@atomide.com>
References: <20231202081157.47222-1-tony@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BOE BP082WX1-100 is a 8.2" panel similar to the 10.1" panel
BP101WX1-100. Both panels use the same timings.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1336,6 +1336,23 @@ static const struct drm_display_mode boe_bp101wx1_100_mode = {
 	.vtotal = 800 + 6 + 8 + 2,
 };
 
+static const struct panel_desc boe_bp082wx1_100 = {
+	.modes = &boe_bp101wx1_100_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 180,
+		.height = 114,
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
@@ -4281,6 +4298,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.43.0
