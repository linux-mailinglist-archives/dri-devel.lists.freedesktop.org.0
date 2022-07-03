Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1C565B38
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89210E271;
	Mon,  4 Jul 2022 16:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010310E0EA
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=PxA3VG1n//hCqbNnHOvQ6/C/f2hKdWweICZ6l62yN88=;
 b=C7vW08cbLpx86rSKem0XvGUPGftfYzsNfydV350YiSseyHz2auPzBmqEZ0pcEbEvA84R+HdMIXW+V
 pWCdOEFYXM3EYK/3ExDdw1q/f/WPQv0R5zwfNQLnTksvvnxkMYT2tAleO4QjgoGFNzjfq4MbFh8Oyk
 mVHr0gxs8KlmNbZcZHmZnd/nxmGvdi707YnAyWn4z7loAW97R7K5cL3eOfUzwd4ICkh4Zto0Vh4HLK
 nsUkNS0X3+z/jnC+edse22ZCnUOTCAjEoQ/SUSlxfpnTCS52LG70DWETgYUbF9EOXBCf5lBB2wKwkU
 sa396AXn81mF4tii9yq3cVTU+slUaVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=PxA3VG1n//hCqbNnHOvQ6/C/f2hKdWweICZ6l62yN88=;
 b=ZVoa5191akC+PFRXvzufOn0qMAepa1j1ZtD9GcMZE/IZd84yHN8Bg3KNMECtRC6gO70kNgjhCs38j
 NPbZP7HBw==
X-HalOne-Cookie: a8a98cd40b54c138607adf6c50499a0296698a3e
X-HalOne-ID: 99807b11-faff-11ec-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 99807b11-faff-11ec-a917-d0431ea8a290;
 Sun, 03 Jul 2022 18:40:24 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 1/1] drm/bridge: ti-sn65dsi86: Use atomic variants of
 drm_bridge_funcs
Date: Sun,  3 Jul 2022 20:40:07 +0200
Message-Id: <20220703184007.3488567-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703184007.3488567-1-sam@ravnborg.org>
References: <20220703184007.3488567-1-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move away from the deprecated enable/disable operations in
drm_bridge_funcs and enable atomic use.

v3:
 - Drop use of DRM_BRIDGE_STATE_OPS

v2:
 - fix build (kernel test robot <lkp@intel.com>)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c2b9227f7042..d6dd4d99a229 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void ti_sn_bridge_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	return ret;
 }
 
-static void ti_sn_bridge_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	const char *last_err_str = "No supported DP rate";
@@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   VSTREAM_ENABLE);
 }
 
-static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(100, 110);
 }
 
-static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1114,10 +1118,13 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.pre_enable = ti_sn_bridge_pre_enable,
-	.enable = ti_sn_bridge_enable,
-	.disable = ti_sn_bridge_disable,
-	.post_disable = ti_sn_bridge_post_disable,
+	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
+	.atomic_enable = ti_sn_bridge_atomic_enable,
+	.atomic_disable = ti_sn_bridge_atomic_disable,
+	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-- 
2.34.1

