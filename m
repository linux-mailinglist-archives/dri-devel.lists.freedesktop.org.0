Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D0348E313
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD15D10EB7B;
	Fri, 14 Jan 2022 03:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3410EB6D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:49:00 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7BE45832E6;
 Fri, 14 Jan 2022 04:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132138;
 bh=CWj4MWvoo1GqchDHMnl+X0wpVDCSvQKmWpXFcPQYyxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T2b0uStcBs72RdwMrTsHsBym0RFEYkcn1MN1+LDMUtd9stBDg2y4Qb0gudGnJHhCq
 3+hshB09XdDO3epWJ/8xwCDoL1/xIM+NkHYCFyyDo+pbUyFH47nUTW7jl8GubrKUWj
 c1DK9CjdhvWnHRXXMvlKEdftIYf2KUW8RGpDZ+Dh9ieSKCNPVEeQR3PjlPzLwvb3q8
 SNF4oBciOZbwPX+bGcz+6cprGurMB7unNMQFLLK6XiJNxx49W+6b/k6/Tqmxz5XAH6
 JvLYOCsblsScWHMEkkNLoJtImC6RSIc30W918MNg4ynCDDjTNVpAKbOcsrPQOekdDq
 /OdeNiqITFKWQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm: bridge: icn6211: Add HS/VS/DE polarity handling
Date: Fri, 14 Jan 2022 04:48:30 +0100
Message-Id: <20220114034838.546267-6-marex@denx.de>
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

The driver currently hard-codes HS/VS polarity to active-low and DE to
active-high, which is not correct for a lot of supported DPI panels.
Add the missing mode flag handling for HS/VS/DE polarity.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index d6db1e77b5a35..3ad082c1d2bfd 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -190,7 +190,14 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	struct chipone *icn = bridge_to_chipone(bridge);
 	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_display_mode *mode = bridge_to_mode(bridge, state);
+	const struct drm_bridge_state *bridge_state;
 	u16 hfp, hbp, hsync;
+	u32 bus_flags;
+	u8 pol;
+
+	/* Get the DPI flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	bus_flags = bridge_state->output_bus_cfg.flags;
 
 	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
 
@@ -230,7 +237,13 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
-	ICN6211_DSI(icn, BIST_POL, BIST_POL_DE_POL);
+
+	/* DPI HS/VS/DE polarity */
+	pol = ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIST_POL_HSYNC_POL : 0) |
+	      ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIST_POL_VSYNC_POL : 0) |
+	      ((bus_flags & DRM_BUS_FLAG_DE_HIGH) ? BIST_POL_DE_POL : 0);
+	ICN6211_DSI(icn, BIST_POL, pol);
+
 	ICN6211_DSI(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
 	ICN6211_DSI(icn, PLL_REF_DIV, 0x71);
 	ICN6211_DSI(icn, PLL_INT(0), 0x2b);
-- 
2.34.1

