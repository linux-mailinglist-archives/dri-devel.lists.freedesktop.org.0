Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FC48E30B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3262710EB6D;
	Fri, 14 Jan 2022 03:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1670B10EB61
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:48:59 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F158A83042;
 Fri, 14 Jan 2022 04:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132137;
 bh=ZhKQXWqX44XeyWUZVM1QyjkX8yLiwKmvnbBRVDGCgeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OuiOPLKks6q1OdsZVpS/l5xAI93tHbSsYYNJxtja4v/f96UiNC+f8B8ZG0QivNlgR
 //ciRFxo4N2t14YGFW0pqaICno3wmkybISwylM3sd5sH04UCb/x1wlPD6o53clBVS+
 +jIXiHVnQExLhtbGO3eaklOFP2LV+2xPFRTPD7bAbOYNIir5++SXfs+yDlfcAmPju/
 qlI+AZlzJAMnCD/A7Hx4yhOF1yXsdUDlRmFd643Qhk4lSLKRVd0pFtPgKzJAHLlTEj
 xn102I71jzP9xtYvND30Yv4tD8xCXqIQu/zCYda4PUEKXCeRwJGQYsFWyI+EZMhEho
 6w5ILAGu5oacw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN
 handling
Date: Fri, 14 Jan 2022 04:48:26 +0100
Message-Id: <20220114034838.546267-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HFP_HSW_HBP_HI register must be programmed with 2 LSbits of each
Horizontal Front Porch/Sync/Back Porch. Currently the driver programs
this register to 0, which breaks displays with either value above 255.

The HFP_MIN register must be set to the same value as HFP_LI, otherwise
there is visible image distortion, usually in the form of missing lines
at the bottom of the panel.

Fix this by correctly programming the HFP_HSW_HBP_HI and HFP_MIN registers.

Fixes: ce517f18944e3 ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index eb26615b2993a..d7eedf35e8415 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -34,6 +34,9 @@
 #define HSYNC_LI		0x24
 #define HBP_LI			0x25
 #define HFP_HSW_HBP_HI		0x26
+#define HFP_HSW_HBP_HI_HFP(n)		(((n) & 0x300) >> 4)
+#define HFP_HSW_HBP_HI_HS(n)		(((n) & 0x300) >> 6)
+#define HFP_HSW_HBP_HI_HBP(n)		(((n) & 0x300) >> 8)
 #define VFP			0x27
 #define VSYNC			0x28
 #define VBP			0x29
@@ -165,6 +168,7 @@ static void chipone_enable(struct drm_bridge *bridge)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	struct drm_display_mode *mode = bridge_to_mode(bridge);
+	u16 hfp, hbp, hsync;
 
 	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
 
@@ -180,13 +184,18 @@ static void chipone_enable(struct drm_bridge *bridge)
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
 
@@ -196,7 +205,7 @@ static void chipone_enable(struct drm_bridge *bridge)
 
 	/* dsi specific sequence */
 	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
-	ICN6211_DSI(icn, HFP_MIN, 0x28);
+	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
 	ICN6211_DSI(icn, BIST_POL, BIST_POL_DE_POL);
-- 
2.34.1

