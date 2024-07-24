Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C038D93AA45
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 02:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FB410E0F4;
	Wed, 24 Jul 2024 00:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="XxsSAeJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22C10E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:57:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 650C1887CD;
 Wed, 24 Jul 2024 02:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1721782659;
 bh=fHtwjYQG3KRM9Dn7ry5SFTEDkfs04x1UiGwsnFooIcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxsSAeJ+1RITTfJL1h22In/6BTa9aCFcHXhMr0eHSryXRuw7bm1eWXh1BjckKNRhF
 obp20vL+mPz52q2DQsBQHaK0gjcvIcBALzEq5h9Kld6obAKULQdW4k7ChW0eQp3AOz
 OCu9aYe4R0DWd4837tTb/hTkzuMdz5tdTmPFeZMvsqn/VN6JUVUc+4LL+RnC5smPnw
 kiBQHY8fTkghddbBStsVu9nfrATMc7R/DAlWGkkMRHaiNcEeWMs9GLVuivFvVXg4gS
 XR+Io0LDIj11u3PBG1LnTE97yMnZh9ra9DF6lX+2eve8oDweLID/c3Q92fIWWUe345
 kf0Nm863mKT4Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] drm/panel/panel-ilitek-ili9806e: Add Densitron
 DMT028VGHMCMI-1D TFT to ILI9806E DSI TCON driver
Date: Wed, 24 Jul 2024 02:55:53 +0200
Message-ID: <20240724005700.196073-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724005700.196073-1-marex@denx.de>
References: <20240724005700.196073-1-marex@denx.de>
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

Add Densitron DMT028VGHMCMI-1D 480x640 TFT matrix 2.83 inch panel
attached to Ilitek ILI9806E DSI TCON into the ILI9806E driver.

Note that the Densitron panels use different TCONs, this driver is for
the later panel, use panel-ilitek-st7701.c for the former panel:
DMT028VGHMCMI-1A - ST7701
DMT028VGHMCMI-1D - ILI9806E

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
index e4a44cd26c4dc..a3c79ad99d0bd 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
@@ -380,7 +380,172 @@ static const struct panel_desc com35h3p70ulc_desc = {
 	.lanes = 2,
 };
 
+static void dmt028vghmcmi_1d_init(struct mipi_dsi_multi_context *ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x60, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x61, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x62, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x63, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x16);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x41, 0x44);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x42, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x43, 0x83);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x44, 0x89);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x45, 0x8a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x46, 0x44);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x47, 0x44);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x50, 0x78);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x51, 0x78);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x52, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x54, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x55, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x56, 0x00);
+	/* Gamma settings */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa1, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa2, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa3, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa6, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa7, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa8, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa9, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaa, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xab, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xac, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xad, 0x19);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xae, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaf, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc1, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc2, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc3, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc5, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc6, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc7, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc8, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc9, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xca, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcc, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcd, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xce, 0x13);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x00);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x77);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xe1, 0x79);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x13);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
+	/* GIP 0 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x21);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x05, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x98);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x09, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x10, 0xf7);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x00);
+	/* GIP 1 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x22, 0x44);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x23, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x24, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x25, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x27, 0x67);
+	/* GIP 2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x32, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x33, 0xbc);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0xad);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0xda);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0xcb);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x37, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x38, 0x55);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x39, 0x76);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3b, 0x88);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3c, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3d, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3f, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x22);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x52, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x54, 0x13);
+
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
+};
+
+static const struct drm_display_mode dmt028vghmcmi_1d_default_mode = {
+	.clock		= 22000,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 20,
+	.hsync_end	= 480 + 20 + 4,
+	.htotal		= 480 + 20 + 4 + 10,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 40,
+	.vsync_end	= 640 + 40 + 4,
+	.vtotal		= 640 + 40 + 4 + 20,
+
+	.width_mm	= 53,
+	.height_mm	= 79,
+
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc dmt028vghmcmi_1d_desc = {
+	.init_sequence = dmt028vghmcmi_1d_init,
+	.display_mode = &dmt028vghmcmi_1d_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9806e_of_match[] = {
+	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
 	{ }
 };
-- 
2.43.0

