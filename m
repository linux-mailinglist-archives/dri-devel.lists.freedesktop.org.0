Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A71D38AE1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D410E03E;
	Sat, 17 Jan 2026 00:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZiV6WWac";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wPLPHo8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42DA10E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:50:41 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dtJ6l2WjGz9sd0;
 Sat, 17 Jan 2026 01:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768611039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vMEzItdsAbE2liSXjdq4NBlkXExC27cQwbIFLcmYzOE=;
 b=ZiV6WWackpoamqYgyKEFPZTHSXAYvATKikVa0xzUIvXBk8N3IziE+DCDJleT8BQj3ABMzY
 +VsRKLdmNmPxsstORV5pD2ESlTJ99KxYX/IiMJAl2ZkGvJJDS87PypdtggAEfHDinuqgYz
 DNwp8Nm8eXKiuN8ABn0KHh1BJIvAbiI5kcyHdwYTQzkkgJ46mlZ+jmXA6QmDahCuDmZQfp
 VmKuzfKCa7Io3zOsROsjSkR4igSE5N1y9yvzRUl5Isr7zYB7RS94eb3tSrJUtDWBIy5rWN
 6d0F24V4mAqirJ+pxCH/+xWIP7JLnKaUdjYEaEikikiww9xmei+3mvXlX3t7jw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768611037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vMEzItdsAbE2liSXjdq4NBlkXExC27cQwbIFLcmYzOE=;
 b=wPLPHo8BWJFARuopooxE+0h4vU3HV54wfOK3vooCLU61mrZ8UXXDNTX7K2ExEmCpFZtUde
 llEOz/wYRBeFF4xljFQ1Z1XyD4mTIF0bSbQCGgM5eIbiCiIMdeKHfu5MvZyoCgabyrzXH1
 fA85qG1+h8LBDCkyyI+hu12FxEw93CJ47j0iunQgoU+o9JXioRJONS4TXsEFwgVxML0AJn
 k5O/JUqC+Y+mW+nuxpweuImcbOL/DsTBqRFQrpSSMAQ2FzI/NCw73LRSB6wKAv/HLZxYUj
 TAQLLMvc+Yc2YKgaQNRH4ANATScXlrLU4m0gIjj8/a0gko4ggTdH7hlFjAfx0A==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel support
Date: Sat, 17 Jan 2026 01:49:48 +0100
Message-ID: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p9htipo4gu7ygoez4pjyw6mrx1ynd83w
X-MBO-RS-ID: ed634f5f0ea607bcdd5
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

Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.

While the panel is described as DPI panel, it is part of a larger unit
in non-removable metal casing, so the actual internal configuration is
not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
It is likely that internally, this panel is an LVDS panel, connected to
ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.

Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V3: New patch. Note that the compatible string is already part of
    Documentation/devicetree/bindings/display/panel/panel-simple.yaml
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 91ab280869bac..40a73c32b0b17 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct drm_display_mode waveshare_133inch_mode = {
+	.clock = 148500,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 88,
+	.hsync_end = 1920 + 88 + 44,
+	.htotal = 1920 + 88 + 44 + 148,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 4,
+	.vsync_end = 1080 + 4 + 5,
+	.vtotal = 1080 + 4 + 5 + 36,
+	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
+};
+
+static const struct panel_desc waveshare_133inch = {
+	.modes = &waveshare_133inch_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 293,
+		.height = 163,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
+};
+
 static const struct drm_display_mode winstar_wf35ltiacd_mode = {
 	.clock = 6410,
 	.hdisplay = 320,
@@ -5598,6 +5625,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "vxt,vl050-8048nt-c01",
 		.data = &vl050_8048nt_c01,
+	}, {
+		.compatible = "waveshare,13.3inch-panel",
+		.data = &waveshare_133inch,
 	}, {
 		.compatible = "winstar,wf35ltiacd",
 		.data = &winstar_wf35ltiacd,
-- 
2.51.0

