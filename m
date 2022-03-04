Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACE4CCABA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816D210E30D;
	Fri,  4 Mar 2022 00:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB4F10E264
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:25:41 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 34E3E839E2;
 Fri,  4 Mar 2022 01:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646353539;
 bh=95pMRNaH87zwKwTsQzD8pqbr8GRI55YSh3PC/XeOIcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VVwDdQgM9q6YbOACUMTqugpHLwKDYN+Q/hPKnP265CtyKjsfwrsrf/SlN8uyWEGkN
 cyjM4xk+4XcSO1ZM8f72ORSNGYcpD4n10YAuCGeqrVsRf/j/V3/U0oRHFQyGNxkJsh
 w9kMWNnUcjIafI8JsH1EjVlGbDupq3ne8eN88RedMWY8vmjrvs7qIGwjrc8M75hlyK
 lVMeLzntIohjgjcLNJJx+gnwloDod3MOD4hqRJMGffFjYw7cIuBv4ESO3+4IYSHQbE
 F8dpb3PkupoCk2zGsM1+Es9+qiqGiUCLiIHFJdDqTWKBp/tE8B7qv3T68KS9QNzuWd
 oZHJIY8NBE4Gw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 03/13] drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN
 handling
Date: Fri,  4 Mar 2022 01:24:58 +0100
Message-Id: <20220304002508.75676-4-marex@denx.de>
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

The HFP_HSW_HBP_HI register must be programmed with 2 LSbits of each
Horizontal Front Porch/Sync/Back Porch. Currently the driver programs
this register to 0, which breaks displays with either value above 255.

The HFP_MIN register must be set to the same value as HFP_LI, otherwise
there is visible image distortion, usually in the form of missing lines
at the bottom of the panel.

Fix this by correctly programming the HFP_HSW_HBP_HI and HFP_MIN registers.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Fixes: ce517f18944e3 ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
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
 drivers/gpu/drm/bridge/chipone-icn6211.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 4b8d1a5a50302..e29e6a84c39a6 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -35,6 +35,9 @@
 #define HSYNC_LI		0x24
 #define HBP_LI			0x25
 #define HFP_HSW_HBP_HI		0x26
+#define HFP_HSW_HBP_HI_HFP(n)		(((n) & 0x300) >> 4)
+#define HFP_HSW_HBP_HI_HS(n)		(((n) & 0x300) >> 6)
+#define HFP_HSW_HBP_HI_HBP(n)		(((n) & 0x300) >> 8)
 #define VFP			0x27
 #define VSYNC			0x28
 #define VBP			0x29
@@ -163,6 +166,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	struct drm_display_mode *mode = &icn->mode;
+	u16 hfp, hbp, hsync;
 
 	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
 
@@ -178,13 +182,18 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 		    ((mode->hdisplay >> 8) & 0xf) |
 		    (((mode->vdisplay >> 8) & 0xf) << 4));
 
-	ICN6211_DSI(icn, HFP_LI, mode->hsync_start - mode->hdisplay);
+	hfp = mode->hsync_start - mode->hdisplay;
+	hsync = mode->hsync_end - mode->hsync_start;
+	hbp = mode->htotal - mode->hsync_end;
 
-	ICN6211_DSI(icn, HSYNC_LI, mode->hsync_end - mode->hsync_start);
-
-	ICN6211_DSI(icn, HBP_LI, mode->htotal - mode->hsync_end);
-
-	ICN6211_DSI(icn, HFP_HSW_HBP_HI, 0x00);
+	ICN6211_DSI(icn, HFP_LI, hfp & 0xff);
+	ICN6211_DSI(icn, HSYNC_LI, hsync & 0xff);
+	ICN6211_DSI(icn, HBP_LI, hbp & 0xff);
+	/* Top two bits of Horizontal Front porch/Sync/Back porch */
+	ICN6211_DSI(icn, HFP_HSW_HBP_HI,
+		    HFP_HSW_HBP_HI_HFP(hfp) |
+		    HFP_HSW_HBP_HI_HS(hsync) |
+		    HFP_HSW_HBP_HI_HBP(hbp));
 
 	ICN6211_DSI(icn, VFP, mode->vsync_start - mode->vdisplay);
 
@@ -194,7 +203,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 
 	/* dsi specific sequence */
 	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
-	ICN6211_DSI(icn, HFP_MIN, 0x28);
+	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
 	ICN6211_DSI(icn, BIST_POL, BIST_POL_DE_POL);
-- 
2.34.1

