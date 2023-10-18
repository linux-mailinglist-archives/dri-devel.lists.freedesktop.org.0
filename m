Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AE7CE291
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E810E193;
	Wed, 18 Oct 2023 16:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342C10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:57 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3ae5a014d78so4131996b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645936; x=1698250736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5RlhUqBqM3g+4MPGnE7ouhmH0KrUx/6TtzKaaWSu60=;
 b=dRE5VLNtGYrZRtkT4PGwoS6Drw+BRbdYRq0wHSw/I0mXKJfcQXkNH2BQxvUtAvb8iu
 geIKDL2ak2ZLSPJYcs66PGNeFAMpY+abATFadBmGD6cmHlFJQQbh26DHBFDbCPWuSbh0
 akQZtZ/FpMx9/cYpSeTFc9ZojNIARZmraXOg1dTaM3kw92p09639OQwH3Jo0tpkuxSXm
 lqxiJwoO4W+C4VbgNkZl9hDtpDx6ee6gxA4vGSR7ST5ajC7di0yMsYWsyrhpebtHNWK1
 om0N5CRyhWZZR7r3NNThjt5YLVIWq0h58+YLt8boJXnGFFXcF1aCCMy2LqHJnGcBcese
 V19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645936; x=1698250736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5RlhUqBqM3g+4MPGnE7ouhmH0KrUx/6TtzKaaWSu60=;
 b=Qi9Kj+/ZcZdUSZ/ClMI4hODPyGXrndA+y7zgKXoWL6LOTFAWzgnZRJBFdOCa5DZ91s
 BDdgE4puDv7tAUf2hzWnNJzzX+mHJc9hsRaec4FEdQUWr7cCg03JTdmqg50MTgW/tLK/
 P5vnSf+7eNtnMTpQfr8KeI8W5GXVDK6DVSdLgU0eJziTXgxwGkDrKSLwhALlqIEDxAGc
 7EWn5oaHRUu59RGDZZPn5JXzpHTPo+VMwDHO3PG6Vr4P00bQ7NFroZ9nAOMnzPnM6eFF
 28iD43FLNd1qkEUrMyPg/h9jTFq6Z7C3KThMxZDKbxcc6rnu4gXSOtlxuy0nlzFus8nh
 jf2w==
X-Gm-Message-State: AOJu0YzDTavERuxbjjLOjL9L+pTLQjR1d3znWBKQt89fzKhptBZwkIw2
 NxbUQ+ABxfNh7oJcGj0IO6A=
X-Google-Smtp-Source: AGHT+IEYc+5ohz4jYnwR7FiV33p5sIPOaesEd2oV9q3jHLHsmLR4rbrebzo3oxbolWRtBOaueSf98A==
X-Received: by 2002:a05:6808:2020:b0:3b2:e4b7:2af2 with SMTP id
 q32-20020a056808202000b003b2e4b72af2mr1658264oiw.6.1697645936268; 
 Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 2/5] drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
Date: Wed, 18 Oct 2023 11:18:45 -0500
Message-Id: <20231018161848.346947-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Refactor the driver to add support for the powkiddy,rk2023-panel
panel. This panel is extremely similar to the rg353p-panel but
requires a smaller vertical back porch and isn't as tolerant of
higher speeds.

Tested on my RG351V, RG353P, RG353V, and RK2023.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 56 +++++++++++++++----
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 79de6c886292..d24c51503d68 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -28,6 +28,7 @@ struct nv3051d_panel_info {
 	unsigned int num_modes;
 	u16 width_mm, height_mm;
 	u32 bus_flags;
+	u32 mode_flags;
 };
 
 struct panel_nv3051d {
@@ -385,15 +386,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
-
-	/*
-	 * The panel in the RG351V is identical to the 353P, except it
-	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
-	 */
-	if (of_device_is_compatible(dev->of_node, "anbernic,rg351v-panel"))
-		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->mode_flags = ctx->panel_info->mode_flags;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -481,18 +474,59 @@ static const struct drm_display_mode nv3051d_rgxx3_modes[] = {
 	},
 };
 
-static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
+static const struct drm_display_mode nv3051d_rk2023_modes[] = {
+	{
+		.hdisplay       = 640,
+		.hsync_start    = 640 + 40,
+		.hsync_end      = 640 + 40 + 2,
+		.htotal         = 640 + 40 + 2 + 80,
+		.vdisplay       = 480,
+		.vsync_start    = 480 + 18,
+		.vsync_end      = 480 + 18 + 2,
+		.vtotal         = 480 + 18 + 2 + 4,
+		.clock          = 24150,
+		.flags          = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3051d_panel_info nv3051d_rg351v_info = {
 	.display_modes = nv3051d_rgxx3_modes,
 	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
 	.width_mm = 70,
 	.height_mm = 57,
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static const struct nv3051d_panel_info nv3051d_rg353p_info = {
+	.display_modes = nv3051d_rgxx3_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
+static const struct nv3051d_panel_info nv3051d_rk2023_info = {
+	.display_modes = nv3051d_rk2023_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rk2023_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
 };
 
 static const struct of_device_id newvision_nv3051d_of_match[] = {
-	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
+	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
+	{ .compatible = "anbernic,rg353p-panel", .data = &nv3051d_rg353p_info },
+	{ .compatible = "powkiddy,rk2023-panel", .data = &nv3051d_rk2023_info },
 	{ /* sentinel */ }
 };
+
 MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
 
 static struct mipi_dsi_driver newvision_nv3051d_driver = {
-- 
2.34.1

