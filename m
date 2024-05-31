Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA068D6AE1
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F9D10E35B;
	Fri, 31 May 2024 20:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wb9ElQb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20A210E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:37:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C140CE1BBF;
 Fri, 31 May 2024 20:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B3BCC32786;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717187866;
 bh=8bGM/eiU7NTz6fPCc/iXWib0hQ5x48YiJgZm3kopRQw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Wb9ElQb0U6cg5Zx/iN10na0lbdtBy6xM001hqbPCBI2TB0QH0szKwLsTsbnRKqygJ
 Ozxz0ROMRXJDydbqseCjYrb2CZEaARALv3Zs24lURJhMwYKj5tCXVZI7hdWRFCn0b6
 MsLsYWNvchlSzt+HK658s/eaJIzxPxEQFMdMdOBHq0ToGUAzJscQsGgpSjsjOj30b+
 xwGbu/eK+aNW4X+ilIXFttSneKK64hUCn7AaV6lqJQVtQB987xW8CH93yhehXp2Hkc
 X6QNGegppWh4bcHSB1hye6wCwOo8xo87Dvq21SwQLoyVw4/go4xkF/rI2Bg7kcBYCU
 awz08vk35Z50Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4108FC27C50;
 Fri, 31 May 2024 20:37:46 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Fri, 31 May 2024 22:37:45 +0200
Subject: [PATCH 1/2] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge_chain_mode-v1-1-8b49e36c5dd3@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
In-Reply-To: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717187864; l=2519;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=g2zVbjZcqkh2hiGY7iFzlHZfu3znz4lPoZjniC5HZeQ=;
 b=w1EiPCAd7or7aUVHQp8xtVRJNOSZi3rzqoyygcHYSDL0tXhq+4GnhDrFo1QaJLFVumuIe3eIJ3h4
 mLJiwpcJBf0dYmx6OK/rqorlTGUd/cXH7dmKWbVIQxReLwBc+/tZ
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The mode_valid implementation had a call to
drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
not allowed to change anything - only to validate the mode.

As the next bridge is often/always a connector the call had no effect
anyway. So drop it.

From the git history I could see this call was included in the original
version of the driver so there was no help there to find out why it was
added in the first place. But a lot has changed since the initial driver
were added and is seems safe to remove the call now.

v4:
  - Link to v3: https://lore.kernel.org/dri-devel/20220717174454.46616-4-sam@ravnborg.org/
  - Rebase, and added acks/rb
v3:
  - Link to v2: https://lore.kernel.org/dri-devel/20211020181901.2114645-6-sam@ravnborg.org/
v2:
  - Link to v1: https://lore.kernel.org/dri-devel/20210722062246.2512666-6-sam@ravnborg.org/

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 6e1cca97a654..0a90fe448d14 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1208,22 +1208,11 @@ mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			   const struct drm_display_mode *mode)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct drm_bridge *next_bridge;
 
 	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
 		mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
 		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
 
-	next_bridge = drm_bridge_get_next_bridge(&hdmi->bridge);
-	if (next_bridge) {
-		struct drm_display_mode adjusted_mode;
-
-		drm_mode_init(&adjusted_mode, mode);
-		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
-						 &adjusted_mode))
-			return MODE_BAD;
-	}
-
 	if (hdmi->conf) {
 		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 			return MODE_BAD;

-- 
2.34.1


