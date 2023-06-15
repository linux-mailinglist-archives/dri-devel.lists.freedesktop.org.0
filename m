Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89A7320CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9AD10E53C;
	Thu, 15 Jun 2023 20:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C021310E536
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:19:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BE1D386180;
 Thu, 15 Jun 2023 22:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860358;
 bh=o6AM8fWj4yCkI3rnUT+PaoaPEAEg3J+vBs+EPGSVwNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WjYulXmgfugDLOP6zcNcR9g2ieuo4hdYu+/Peuh68r7W88KyJMiivaiyO6iHhIjgu
 eRcPkxIQWf/9001l8q4Rj5XAqHEMzxf1iZIhx2z/t4/O9TRr6fOpcazR5V41aYV7Uj
 X3yM374dWNPS9lqQ0XDcKlLzw0A9QCM6kcM23il775q24Dq0sQxOngy+CG5eVAshWz
 3i36xAcUHj6/ZR6gx43ZFTFga7aNrw8L5gGGWwXuRwIyfgGpocFs4U04vcm0iV7sTr
 jVdwofy3iCz1NCvZ10UP60Oy+cvrdYNjR5oSAfI/Y3kSeFbJ63rg1aaBQuGyCt3P3/
 VkSfvXZWcE2yQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/bridge: tc358762: Handle HS/VS polarity
Date: Thu, 15 Jun 2023 22:19:02 +0200
Message-Id: <20230615201902.566182-5-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for handling the HS/VS sync signals polarity in the bridge
driver, otherwise e.g. DSIM bridge feeds the TC358762 inverted polarity
sync signals and the image is shifted to the left, up, and wobbly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index a092e2096074f..46198af9eebbf 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -74,6 +74,7 @@ struct tc358762 {
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *reset_gpio;
+	struct drm_display_mode mode;
 	bool pre_enabled;
 	int error;
 };
@@ -114,6 +115,8 @@ static inline struct tc358762 *bridge_to_tc358762(struct drm_bridge *bridge)
 
 static int tc358762_init(struct tc358762 *ctx)
 {
+	u32 lcdctrl;
+
 	tc358762_write(ctx, DSI_LANEENABLE,
 		       LANEENABLE_L0EN | LANEENABLE_CLEN);
 	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
@@ -123,8 +126,18 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
 
 	tc358762_write(ctx, SPICMR, 0x00);
-	tc358762_write(ctx, LCDCTRL, LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
-				     LCDCTRL_UNK6 | LCDCTRL_VTGEN);
+
+	lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
+		  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
+
+	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
+		lcdctrl |= LCDCTRL_HSPOL;
+
+	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
+		lcdctrl |= LCDCTRL_VSPOL;
+
+	tc358762_write(ctx, LCDCTRL, lcdctrl);
+
 	tc358762_write(ctx, SYSCTRL, 0x040f);
 	msleep(100);
 
@@ -194,6 +207,15 @@ static int tc358762_attach(struct drm_bridge *bridge,
 				 bridge, flags);
 }
 
+static void tc358762_bridge_mode_set(struct drm_bridge *bridge,
+				     const struct drm_display_mode *mode,
+				     const struct drm_display_mode *adj)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+
+	drm_mode_copy(&ctx->mode, mode);
+}
+
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.atomic_post_disable = tc358762_post_disable,
 	.atomic_pre_enable = tc358762_pre_enable,
@@ -202,6 +224,7 @@ static const struct drm_bridge_funcs tc358762_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = tc358762_attach,
+	.mode_set = tc358762_bridge_mode_set,
 };
 
 static int tc358762_parse_dt(struct tc358762 *ctx)
-- 
2.39.2

