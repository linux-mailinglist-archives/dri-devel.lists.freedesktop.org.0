Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3A435287
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9D6E3C4;
	Wed, 20 Oct 2021 18:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F5D6E364
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:19:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3c28bb8a-31d2-11ec-9c3f-0050568c148b;
 Wed, 20 Oct 2021 18:19:16 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C5CEA194B05;
 Wed, 20 Oct 2021 20:19:10 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Date: Wed, 20 Oct 2021 20:18:55 +0200
Message-Id: <20211020181901.2114645-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020181901.2114645-1-sam@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic variants of enable/disable in drm_bridge_funcs are the
preferred operations - introduce these.

The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
drm_bridge_chain_post_disable - convert these to the atomic variants.

v2:
  - Added a few more people to cc: (Jitao, Enric, Philip) to increase
    possibility to get test feedback

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philip Chen <philipchen@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3aaa90913bf8..0b620afe99c0 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -376,7 +376,8 @@ static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
 	ps_bridge->powered = false;
 }
 
-static void ps8640_pre_enable(struct drm_bridge *bridge)
+static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	int ret;
@@ -388,7 +389,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 		ps8640_bridge_poweroff(ps_bridge);
 }
 
-static void ps8640_post_disable(struct drm_bridge *bridge)
+static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
@@ -489,7 +491,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_bridge_chain_pre_enable(bridge);
+	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
@@ -499,7 +501,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * before, return the chip to its original power state.
 	 */
 	if (poweroff)
-		drm_bridge_chain_post_disable(bridge);
+		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 
 	return edid;
 }
@@ -508,8 +510,8 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
 	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
-	.post_disable = ps8640_post_disable,
-	.pre_enable = ps8640_pre_enable,
+	.atomic_post_disable = ps8640_atomic_post_disable,
+	.atomic_pre_enable = ps8640_atomic_pre_enable,
 };
 
 static int ps8640_probe(struct i2c_client *client)
-- 
2.30.2

