Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EF4CCAC5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8D410E3EF;
	Fri,  4 Mar 2022 00:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD8110E3C9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:25:44 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FA38838C7;
 Fri,  4 Mar 2022 01:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646353543;
 bh=B/fkH6FqKMDwbvhgG87M2lEWNNgQ0g2SfIrwzY7hYsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKgDixiUw/ajLoiyQC/AZTQVrYnLZIlT4BeuOrP1kV0/5Sifrr4XfsbTKIcfBxSmw
 cDjCFkuK652rVzZUQkai3AzY+FulRJjQPEDWemf1KQTY471aZtAw1CnvE2xBhpQOHR
 2Y636RO1+tTaIBzRqSAsLH04ZbYQfX2TJlUFnR3Le0trGha8jAj2Ma+P/Jtfi64gKD
 FbjPQ0j9+gfWT24ssOMu1nW3RaMzup5NdYv7Ez+6+pbX1ciyxGizn9MtNfvQGue3hw
 8d1bRc4fuCv3zwAyRKb4uVlNl4UMrbTyZrjCgV++gvWgh1/jDkEEoG2IZzep89i28A
 IwwJR5Tp4xpJQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 12/13] drm: bridge: icn6211: Rework ICN6211_DSI to
 chipone_writeb()
Date: Fri,  4 Mar 2022 01:25:07 +0100
Message-Id: <20220304002508.75676-13-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304002508.75676-1-marex@denx.de>
References: <20220304002508.75676-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename and inline macro ICN6211_DSI() into function chipone_writeb()
to keep all function names lower-case. No functional change.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 63 +++++++++++-------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 4ad149c13f599..c66eacc6b1e2a 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -153,8 +153,7 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 	return container_of(bridge, struct chipone, bridge);
 }
 
-static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
-				    size_t len)
+static void chipone_writeb(struct chipone *icn, u8 reg, u8 val)
 {
 	if (icn->interface_i2c)
 		i2c_smbus_write_byte_data(icn->client, reg, val);
@@ -162,12 +161,6 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
 		mipi_dsi_generic_write(icn->dsi, (u8[]){reg, val}, 2);
 }
 
-#define ICN6211_DSI(icn, seq...)				\
-	{							\
-		const u8 d[] = { seq };				\
-		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
-	}
-
 static void chipone_configure_pll(struct chipone *icn,
 				  const struct drm_display_mode *mode)
 {
@@ -242,11 +235,11 @@ static void chipone_configure_pll(struct chipone *icn,
 		(fin * best_m) / BIT(best_p + best_s + 2));
 
 	/* Clock source selection fixed to MIPI DSI clock lane */
-	ICN6211_DSI(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
-	ICN6211_DSI(icn, PLL_REF_DIV,
+	chipone_writeb(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
+	chipone_writeb(icn, PLL_REF_DIV,
 		    (best_p ? PLL_REF_DIV_Pe : 0) | /* Prefer /2 pre-divider */
 		    PLL_REF_DIV_P(best_p) | PLL_REF_DIV_S(best_s));
-	ICN6211_DSI(icn, PLL_INT(0), best_m);
+	chipone_writeb(icn, PLL_INT(0), best_m);
 }
 
 static void chipone_atomic_enable(struct drm_bridge *bridge,
@@ -265,19 +258,19 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	bus_flags = bridge_state->output_bus_cfg.flags;
 
 	if (icn->interface_i2c)
-		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_I2C);
+		chipone_writeb(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_I2C);
 	else
-		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
+		chipone_writeb(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
 
-	ICN6211_DSI(icn, HACTIVE_LI, mode->hdisplay & 0xff);
+	chipone_writeb(icn, HACTIVE_LI, mode->hdisplay & 0xff);
 
-	ICN6211_DSI(icn, VACTIVE_LI, mode->vdisplay & 0xff);
+	chipone_writeb(icn, VACTIVE_LI, mode->vdisplay & 0xff);
 
 	/*
 	 * lsb nibble: 2nd nibble of hdisplay
 	 * msb nibble: 2nd nibble of vdisplay
 	 */
-	ICN6211_DSI(icn, VACTIVE_HACTIVE_HI,
+	chipone_writeb(icn, VACTIVE_HACTIVE_HI,
 		    ((mode->hdisplay >> 8) & 0xf) |
 		    (((mode->vdisplay >> 8) & 0xf) << 4));
 
@@ -285,49 +278,49 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	hsync = mode->hsync_end - mode->hsync_start;
 	hbp = mode->htotal - mode->hsync_end;
 
-	ICN6211_DSI(icn, HFP_LI, hfp & 0xff);
-	ICN6211_DSI(icn, HSYNC_LI, hsync & 0xff);
-	ICN6211_DSI(icn, HBP_LI, hbp & 0xff);
+	chipone_writeb(icn, HFP_LI, hfp & 0xff);
+	chipone_writeb(icn, HSYNC_LI, hsync & 0xff);
+	chipone_writeb(icn, HBP_LI, hbp & 0xff);
 	/* Top two bits of Horizontal Front porch/Sync/Back porch */
-	ICN6211_DSI(icn, HFP_HSW_HBP_HI,
+	chipone_writeb(icn, HFP_HSW_HBP_HI,
 		    HFP_HSW_HBP_HI_HFP(hfp) |
 		    HFP_HSW_HBP_HI_HS(hsync) |
 		    HFP_HSW_HBP_HI_HBP(hbp));
 
-	ICN6211_DSI(icn, VFP, mode->vsync_start - mode->vdisplay);
+	chipone_writeb(icn, VFP, mode->vsync_start - mode->vdisplay);
 
-	ICN6211_DSI(icn, VSYNC, mode->vsync_end - mode->vsync_start);
+	chipone_writeb(icn, VSYNC, mode->vsync_end - mode->vsync_start);
 
-	ICN6211_DSI(icn, VBP, mode->vtotal - mode->vsync_end);
+	chipone_writeb(icn, VBP, mode->vtotal - mode->vsync_end);
 
 	/* dsi specific sequence */
-	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
-	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
+	chipone_writeb(icn, SYNC_EVENT_DLY, 0x80);
+	chipone_writeb(icn, HFP_MIN, hfp & 0xff);
 
 	/* DSI data lane count */
-	ICN6211_DSI(icn, DSI_CTRL,
+	chipone_writeb(icn, DSI_CTRL,
 		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
 
-	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
-	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
-	ICN6211_DSI(icn, MIPI_PN_SWAP, 0x00);
+	chipone_writeb(icn, MIPI_PD_CK_LANE, 0xa0);
+	chipone_writeb(icn, PLL_CTRL(12), 0xff);
+	chipone_writeb(icn, MIPI_PN_SWAP, 0x00);
 
 	/* DPI HS/VS/DE polarity */
 	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
 	      ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIST_POL_VSYNC_POL : 0) |
 	      ((bus_flags & DRM_BUS_FLAG_DE_HIGH) ? BIST_POL_DE_POL : 0);
-	ICN6211_DSI(icn, BIST_POL, pol);
+	chipone_writeb(icn, BIST_POL, pol);
 
 	/* Configure PLL settings */
 	chipone_configure_pll(icn, mode);
 
-	ICN6211_DSI(icn, SYS_CTRL(0), 0x40);
-	ICN6211_DSI(icn, SYS_CTRL(1), 0x88);
+	chipone_writeb(icn, SYS_CTRL(0), 0x40);
+	chipone_writeb(icn, SYS_CTRL(1), 0x88);
 
 	/* icn6211 specific sequence */
-	ICN6211_DSI(icn, MIPI_FORCE_0, 0x20);
-	ICN6211_DSI(icn, PLL_CTRL(1), 0x20);
-	ICN6211_DSI(icn, CONFIG_FINISH, 0x10);
+	chipone_writeb(icn, MIPI_FORCE_0, 0x20);
+	chipone_writeb(icn, PLL_CTRL(1), 0x20);
+	chipone_writeb(icn, CONFIG_FINISH, 0x10);
 
 	usleep_range(10000, 11000);
 }
-- 
2.34.1

