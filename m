Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD54B94F4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62E410E6AF;
	Thu, 17 Feb 2022 00:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1B710E672
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:55 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B41A83A4F;
 Thu, 17 Feb 2022 01:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057553;
 bh=p47E/OxpVX//2CsCIEHhtLwFPwTKY6cuqIT3UXgk5qI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AehweO7apqd7YVISbU5u0+B79eie6+7lPVlnyWQAGTr6i/ULf9EroIvGCnX6XKztC
 h8HlMup4RppggJp9T8r0vvfaqU+wae6v+/VAA/prRi+jUQpG3pNXIdJn4UKWCIXjQL
 v3VK7tZ5Dgd2Q+PrBtXQPW4XeCWnqIg5FuOHbzRzdIWeBqoJtfCZepfS5QzaLU+Hn4
 8Sj9nSxQ3c0rdMzeNtbcc5V8g3sXOkqaa9nuU4WJj9e4YzLqdpCU86smilfWuseF+1
 qAzCVyJCoWzebtt4zTerAcg3z2N8+4/jrncyrTV6x4cm0OmtmyDEeGy5+5IdcvfwAa
 FHCFpA+Kn1/2A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 03/12] drm: bridge: icn6211: Add HS/VS/DE polarity handling
Date: Thu, 17 Feb 2022 01:25:21 +0100
Message-Id: <20220217002530.396563-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217002530.396563-1-marex@denx.de>
References: <20220217002530.396563-1-marex@denx.de>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver currently hard-codes HS/VS polarity to active-low and DE to
active-high, which is not correct for a lot of supported DPI panels.
Add the missing mode flag handling for HS/VS/DE polarity.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index e29e6a84c39a6..2ac8eb7e25f52 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -165,8 +165,16 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
 	struct drm_display_mode *mode = &icn->mode;
+	const struct drm_bridge_state *bridge_state;
 	u16 hfp, hbp, hsync;
+	u32 bus_flags;
+	u8 pol;
+
+	/* Get the DPI flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	bus_flags = bridge_state->output_bus_cfg.flags;
 
 	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
 
@@ -206,7 +214,13 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
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

