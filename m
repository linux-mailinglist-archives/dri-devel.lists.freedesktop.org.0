Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701A3BCCC4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2E6E249;
	Tue,  6 Jul 2021 11:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59F16E249
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:18:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AE0961CF9;
 Tue,  6 Jul 2021 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570318;
 bh=y5INbB7BhKNTobXp8zKDbun0s0xvNKCmJ4x0sSzC/yY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fcT1+UOpSLgXqfMUp9TbRE0AuMKu2Yhc3UIwDHqUoLexN7+BJb1PjztaSNDZqgdZN
 aoAFjRmifry/KITu/Qw57DTG5VXvCnqbPUKSNjqSzeEHPC8unN1pqaIQDZpnkUpDjU
 kPYhsPuV+aJYvampvnlbFXxbyFhljtLtEYo1mWgzS+pTWbzCkqk1hNYx2lYyXJ2VkP
 IRbHplVtuDKALmgQWm0/3gydOSbNMx2pyPq2SpV1Y2DwCxL8BrxypuHEy9Pr5tAP3q
 dOLDBgIryly4K9dSCIDtQN1FiGTxOpNZsBpo8+D52ukkq1zYk3Nmxbura7uZBKqpk/
 F+5vYKI02/VyA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 008/160] drm/bridge: nwl-dsi: Force a full
 modeset when crtc_state->active is changed to be true
Date: Tue,  6 Jul 2021 07:15:54 -0400
Message-Id: <20210706111827.2060499-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liu Ying <victor.liu@nxp.com>

[ Upstream commit 3afb2a28fa2404d11cce1956a003f2aaca4da421 ]

This patch replaces ->mode_fixup() with ->atomic_check() so that
a full modeset can be requested from there when crtc_state->active
is changed to be true(which implies only connector's DPMS is brought
out of "Off" status, though not necessarily).  Bridge functions are
added or changed to accommodate the ->atomic_check() callback.  That
full modeset is needed by the up-coming patch which gets MIPI DSI
controller and PHY ready in ->mode_set(), because it makes sure
->mode_set() and ->atomic_disable() are called in pairs.

Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1619170003-4817-2-git-send-email-victor.liu@nxp.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 61 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 66b67402f1ac..c65ca860712d 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -21,6 +21,7 @@
 #include <linux/sys_soc.h>
 #include <linux/time64.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -742,7 +743,9 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)
 	return 0;
 }
 
-static void nwl_dsi_bridge_disable(struct drm_bridge *bridge)
+static void
+nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
+			      struct drm_bridge_state *old_bridge_state)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -803,17 +806,6 @@ static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi,
 	return 0;
 }
 
-static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
-				      const struct drm_display_mode *mode,
-				      struct drm_display_mode *adjusted_mode)
-{
-	/* At least LCDIF + NWL needs active high sync */
-	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
-
-	return true;
-}
-
 static enum drm_mode_status
 nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_info *info,
@@ -831,6 +823,24 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/* At least LCDIF + NWL needs active high sync */
+	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+
+	/* Do a full modeset if crtc_state->active is changed to be true. */
+	if (crtc_state->active_changed && crtc_state->active)
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
 static void
 nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 			const struct drm_display_mode *mode,
@@ -862,7 +872,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_debug_printmodeline(adjusted_mode);
 }
 
-static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+static void
+nwl_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				 struct drm_bridge_state *old_bridge_state)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -897,7 +909,9 @@ static void nwl_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void nwl_dsi_bridge_enable(struct drm_bridge *bridge)
+static void
+nwl_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
@@ -942,14 +956,17 @@ static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
-	.pre_enable = nwl_dsi_bridge_pre_enable,
-	.enable     = nwl_dsi_bridge_enable,
-	.disable    = nwl_dsi_bridge_disable,
-	.mode_fixup = nwl_dsi_bridge_mode_fixup,
-	.mode_set   = nwl_dsi_bridge_mode_set,
-	.mode_valid = nwl_dsi_bridge_mode_valid,
-	.attach	    = nwl_dsi_bridge_attach,
-	.detach	    = nwl_dsi_bridge_detach,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_check		= nwl_dsi_bridge_atomic_check,
+	.atomic_pre_enable	= nwl_dsi_bridge_atomic_pre_enable,
+	.atomic_enable		= nwl_dsi_bridge_atomic_enable,
+	.atomic_disable		= nwl_dsi_bridge_atomic_disable,
+	.mode_set		= nwl_dsi_bridge_mode_set,
+	.mode_valid		= nwl_dsi_bridge_mode_valid,
+	.attach			= nwl_dsi_bridge_attach,
+	.detach			= nwl_dsi_bridge_detach,
 };
 
 static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
-- 
2.30.2

