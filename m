Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE37F989C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 06:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09310E18C;
	Mon, 27 Nov 2023 05:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09D10E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 05:17:40 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id B70BA60531;
 Mon, 27 Nov 2023 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701062259;
 bh=NcdojB4iPXFnRMSer1A13c9p7bqPNjtZkU2bEsQjc1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HtMyL3SXJ5CZxMW4xaUUGj/baz0bEZEAvkWdqxoBe+0v2QL446oBspJIIDET0mWxq
 +xBmwMsWuoQt9fljkxdyiOhTBGioU0goB83f7Gu85THtrHIMAdOUBVz1DFlyIBNvXp
 GTrz+/0QTOCz/nMAyrKNl/vmXEo2EXwa8qJgpctApVgDY7KuppfMjNT38eLKEu1sFD
 +FHm/e86HJPGZQxLVH7c6/eVpDQYX86bga5qAVg4i++8YWijEeNUruLrrXvL7bg/HK
 ABo2K55EQObyJwlbeFgdMzIJWfoawmdPDesmkpTjaSvy6Ofcyi/i8Ky0QDTZzPUVKK
 lvM7iW87qfDAA==
From: Tony Lindgren <tony@atomide.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panel: simple: Add BOE BP101WX1-100 panel
Date: Mon, 27 Nov 2023 07:15:44 +0200
Message-ID: <20231127051547.15023-2-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231127051547.15023-1-tony@atomide.com>
References: <20231127051547.15023-1-tony@atomide.com>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is found on Motorola mapphone tablets from mz615 to mz617.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1324,6 +1324,35 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 	},
 };
 
+static const struct drm_display_mode boe_bp101wx1_100_mode = {
+	.clock = 78945,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 0,
+	.hsync_end = 1280 + 0 + 2,
+	.htotal = 1280 + 62 + 0 + 2,
+	.vdisplay = 800,
+	.vsync_start = 800 + 8,
+	.vsync_end = 800 + 8 + 2,
+	.vtotal = 800 + 6 + 8 + 2,
+};
+
+static const struct panel_desc boe_bp101wx1_100 = {
+	.modes = &boe_bp101wx1_100_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
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
 static const struct display_timing boe_ev121wxm_n10_1850_timing = {
 	.pixelclock = { 69922000, 71000000, 72293000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4252,6 +4281,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "bananapi,s070wv20-ct16",
 		.data = &bananapi_s070wv20_ct16,
+	}, {
+		.compatible = "boe,bp101wx1-100",
+		.data = &boe_bp101wx1_100,
 	}, {
 		.compatible = "boe,ev121wxm-n10-1850",
 		.data = &boe_ev121wxm_n10_1850,
-- 
2.42.1
