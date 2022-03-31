Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECA4EDC58
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95DB10F239;
	Thu, 31 Mar 2022 15:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A0310E2D4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:05:42 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FB9384217;
 Thu, 31 Mar 2022 17:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648739140;
 bh=+Qk8P+CleVBqz0ksMohbFEMzdd3p3MirqkE/OKN361o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M754md3eaKvqSQNqh6ZbirY+WNQjtKT3oA7FECPALErQ+/L4xnt1XZo7COSDgWdQ9
 VFZDzWut6rGFwRtkHmF57guSpcIdmx0wPe44Ty5B/gL4jUGHfzdl0qCM51IrYRRCI9
 /QRmDgH5N1hNU9GRXjjgMjb0f8gmiq4GAQIrWX16zOtufb8ptAQ1QiCRIPHc87a01c
 Abmiu2JzeQEOai5C0PaWoRiPJgEe30Ag+JmkAZEqXFAa6xpJXOIjRmOUN2wPXKfcpG
 /qQanA4Z9ushp2dPIsZPhoRdK24gTh8E0Doz9xQUH7lYjx0j24MlO8gKSLbypDXTUs
 NFN+PRCtpwG4A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/11] drm: bridge: icn6211: Add HS/VS/DE polarity handling
Date: Thu, 31 Mar 2022 17:05:01 +0200
Message-Id: <20220331150509.9838-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331150509.9838-1-marex@denx.de>
References: <20220331150509.9838-1-marex@denx.de>
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

The driver currently hard-codes HS/VS polarity to active-low and DE to
active-high, which is not correct for a lot of supported DPI panels.
Add the missing mode flag handling for HS/VS/DE polarity.

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
V3: No change
V4: Add AB from Maxime
V5: No change
V6: No change
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index c871a90c0b8f..30db8d1783ce 100644
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
2.35.1

