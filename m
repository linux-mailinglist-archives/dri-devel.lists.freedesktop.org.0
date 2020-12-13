Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475082D940F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0146E0E9;
	Mon, 14 Dec 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9F989D5F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 20:44:31 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n7so11106207pgg.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 12:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvKjXHeKYG4rw3Vizc9nWj33YjCQBp4adDcRZBt8deI=;
 b=WUd0JDQqJOsJbG8wM5hvHVXSPoqsnAIOkGX93riI/lYfTHBaTAcJK/ZY3Vq7Q2sxLa
 oLGgqrufgmKM7Bcw6IIa+IIqYtZzE3AEOqsI9LAHeN7HbUHYSBiGTT5unkmVNdaMRekn
 YbGi5E+2Nod4zDkfs8z1qTKlAHraPbXPeltiKC+G5ipwpm2+QLP+EXfWjn8TWQF1OHcB
 Y16QQiv+U7DFozk358ELVDMC9RPJsGpnvbWsiWl42DMPuBSs09MGdScLmNJ5C9QbeIZ1
 /gvPakpraO6zA6maHDgZU07t5Wz0NJCLNd95Af8Bsefv6NPg44SYGFj0GWiED9mjBdnV
 r0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvKjXHeKYG4rw3Vizc9nWj33YjCQBp4adDcRZBt8deI=;
 b=kM4eC5fbI82Uz+c3tQmzfusNScf75eEe/0QTQwlGoGEnRvLVjsJsTSRuLGiVEnxHvZ
 2ChLGP9tIuL2LCpRmmJY/JKQTNCEPPMjcj6KLr4b5lRU3vGrZfB4JyrRgCaI5AiuZAgF
 XZXba+hpcRExpugCL4SKosXk/Yegq2uxHZyMQUt4JhLtwnJeOEnpJVttbDpQor2nl0E/
 TI8nmZfFjk9RyAULTJv2qgcj/E34P20OxaeUzgv9VxGnTrmW2KtfVfYqRPh9f31Lsqr6
 r+eawGPcotvA2hLOmskr6CbrJzqI3/psEKpfR8gQco1LMtGQhl6lAc7+34Ih485KxRUO
 CUqA==
X-Gm-Message-State: AOAM530q0SjEWZt0mcKSUG3McCF1+lXUO488FVaoAnKaJy6VcDxdnMtz
 Sv4AYgsickpvXkNbMPE4NrE=
X-Google-Smtp-Source: ABdhPJxvTRsrHmYoWmyfd3kX5Y2qoMmDWMOhj6rO8a5hfOgB6tWYVqVgfT99lYzhlqR2k5slYVIKoQ==
X-Received: by 2002:a63:e246:: with SMTP id y6mr10695796pgj.412.1607892271435; 
 Sun, 13 Dec 2020 12:44:31 -0800 (PST)
Received: from glados.. ([2601:647:6000:3e5b::a27])
 by smtp.gmail.com with ESMTPSA id h32sm18411821pgl.36.2020.12.13.12.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:44:31 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: linux-kernel@vger.kernel.org, Nickey Yang <nickey.yang@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/rockchip: dsi: move all lane config except LCDC mux to
 bind()
Date: Sun, 13 Dec 2020 12:44:26 -0800
Message-Id: <95f16906d654057c912f089d286bd51856ee3bdf.1607892237.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Brian Norris <briannorris@chromium.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Hebb <tommyhebb@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we first enable the DSI encoder, we currently program some per-chip
configuration that we look up in rk3399_chip_data based on the device
tree compatible we match. This data configures various parameters of the
MIPI lanes, including on RK3399 whether DSI1 is slaved to DSI0 in a
dual-mode configuration. It also selects which LCDC (i.e. VOP) to scan
out from.

This causes a problem in RK3399 dual-mode configurations, though: panel
prepare() callbacks run before the encoder gets enabled and expect to be
able to write commands to the DSI bus, but the bus isn't fully
functional until the lane and master/slave configuration have been
programmed. As a result, dual-mode panels (and possibly others too) fail
to turn on when the rockchipdrm driver is initially loaded.

Because the LCDC mux is the only thing we don't know until enable time
(and is the only thing that can ever change), we can actually move most
of the initialization to bind() and get it out of the way early. That's
what this change does. (Rockchip's 4.4 BSP kernel does it in mode_set(),
which also avoids the issue, but bind() seems like the more correct
place to me.)

Tested on a Google Scarlet board (Acer Chromebook Tab 10), which has a
Kingdisplay KD097D04 dual-mode panel. Prior to this change, the panel's
backlight would turn on but no image would appear when initially loading
rockchipdrm. If I kept rockchipdrm loaded and reloaded the panel driver,
it would come on. With this change, the panel successfully turns on
during initial rockchipdrm load as expected.

Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 36 ++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index ce044db8c97e..d0c9610ad220 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -691,13 +691,8 @@ static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_rockchip_phy_ops = {
 	.get_timing = dw_mipi_dsi_phy_get_timing,
 };
 
-static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi,
-					int mux)
+static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi)
 {
-	if (dsi->cdata->lcdsel_grf_reg)
-		regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
-			mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
-
 	if (dsi->cdata->lanecfg1_grf_reg)
 		regmap_write(dsi->grf_regmap, dsi->cdata->lanecfg1_grf_reg,
 					      dsi->cdata->lanecfg1);
@@ -711,6 +706,13 @@ static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi,
 					      dsi->cdata->enable);
 }
 
+static void dw_mipi_dsi_rockchip_set_lcdsel(struct dw_mipi_dsi_rockchip *dsi,
+					    int mux)
+{
+	regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
+		mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
+}
+
 static int
 dw_mipi_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 				 struct drm_crtc_state *crtc_state,
@@ -766,9 +768,9 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	dw_mipi_dsi_rockchip_config(dsi, mux);
+	dw_mipi_dsi_rockchip_set_lcdsel(dsi, mux);
 	if (dsi->slave)
-		dw_mipi_dsi_rockchip_config(dsi->slave, mux);
+		dw_mipi_dsi_rockchip_set_lcdsel(dsi->slave, mux);
 
 	clk_disable_unprepare(dsi->grf_clk);
 }
@@ -922,6 +924,24 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 		return ret;
 	}
 
+	/*
+	 * With the GRF clock running, write lane and dual-mode configurations
+	 * that won't change immediately. If we waited until enable() to do
+	 * this, things like panel preparation would not be able to send
+	 * commands over DSI.
+	 */
+	ret = clk_prepare_enable(dsi->grf_clk);
+	if (ret) {
+		DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n", ret);
+		return ret;
+	}
+
+	dw_mipi_dsi_rockchip_config(dsi);
+	if (dsi->slave)
+		dw_mipi_dsi_rockchip_config(dsi->slave);
+
+	clk_disable_unprepare(dsi->grf_clk);
+
 	ret = rockchip_dsi_drm_create_encoder(dsi, drm_dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
