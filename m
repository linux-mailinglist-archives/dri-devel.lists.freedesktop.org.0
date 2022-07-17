Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D65777A2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A72113509;
	Sun, 17 Jul 2022 17:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EA310FFD0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=8xMDkuUfPGn0o735pjsKmzPk0fBw5yBNOtUUSLza8y8=;
 b=aoi4B6bMH3Cqlb15Pt+qz0yBgpA74ySyu5WsJzQLwhx5nXceezPGoNu2Dqm1PJmOVmPfMNmxT8+8h
 0Z8/JDQXKMg5v/f8+33EPObPtz1JjmoIBjNYH9+G06LdnT2ou2XsjpoEZ4OfqrlHYKAU1oX/v5+Luz
 7SzvdZPdevTuMpVnkjvrPHOkAfai+pByhDs9StAky2XNzasryvXV076zl6t+g/jFbpF2S2pwUmZAH3
 PkK/hbcyi9sLuRsnXX8sX9tBeK09kP/oW35yL5r/9rOuLbWdtgL8BG03YWgXvHVz/i+PkmDkViwUFv
 a+pBpQwd7vsayyeD4gKIwygIJU1cvUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=8xMDkuUfPGn0o735pjsKmzPk0fBw5yBNOtUUSLza8y8=;
 b=wNVu+OQTZtFBwr05sqKFwWIn3xsPomNIVKtIlMY7HEFSLGeaKUoEF2OW6IeHdYoYe+yv3O5YQE2zM
 tjk/AzvAA==
X-HalOne-Cookie: cb254aee6c7ec574bf0b0b704723fae5f8c7f5e7
X-HalOne-ID: 0789e88e-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0789e88e-05fa-11ed-be7f-d0431ea8bb03;
 Sun, 17 Jul 2022 17:58:15 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 09/12] drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:57:58 +0200
Message-Id: <20220717175801.78668-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated drm_bridge_funcs.mode_fixup() with
drm_bridge_funcs.atomic_check().
The driver implements the state operations, so no other changes
are required for the replacement.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 830aac0a2cb4..c4adbcede090 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
 	clk_disable_unprepare(lvds->clocks.mod);
 }
 
-static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adjusted_mode)
+static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
 {
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
 	int min_freq;
 
@@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
 	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
 
-	return true;
+	return 0;
 }
 
 static int rcar_lvds_attach(struct drm_bridge *bridge,
@@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = rcar_lvds_atomic_enable,
 	.atomic_disable = rcar_lvds_atomic_disable,
-	.mode_fixup = rcar_lvds_mode_fixup,
+	.atomic_check = rcar_lvds_atomic_check,
 };
 
 bool rcar_lvds_dual_link(struct drm_bridge *bridge)
-- 
2.34.1

