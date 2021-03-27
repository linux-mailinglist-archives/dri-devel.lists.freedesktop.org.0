Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15C34B6E9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9EC6E05A;
	Sat, 27 Mar 2021 11:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9D6E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:58:00 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 1/3] drm: bridge/panel: Cleanup connector on bridge detach
Date: Sat, 27 Mar 2021 11:57:40 +0000
Message-Id: <20210327115742.18986-2-paul@crapouillou.net>
In-Reply-To: <20210327115742.18986-1-paul@crapouillou.net>
References: <20210327115742.18986-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we don't call drm_connector_cleanup() manually in
panel_bridge_detach(), the connector will be cleaned up with the other
DRM objects in the call to drm_mode_config_cleanup(). However, since our
drm_connector is devm-allocated, by the time drm_mode_config_cleanup()
will be called, our connector will be long gone. Therefore, the
connector must be cleaned up when the bridge is detached to avoid
use-after-free conditions.

v2: Cleanup connector only if it was created

v3: Add FIXME

v4: (Use connector->dev) directly in if() block

Fixes: 13dfc0540a57 ("drm/bridge: Refactor out the panel wrapper from the lvds-encoder bridge.")
Cc: <stable@vger.kernel.org> # 4.12+
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/panel.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ddc37551194..c916f4b8907e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -87,6 +87,18 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 static void panel_bridge_detach(struct drm_bridge *bridge)
 {
+	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_connector *connector = &panel_bridge->connector;
+
+	/*
+	 * Cleanup the connector if we know it was initialized.
+	 *
+	 * FIXME: This wouldn't be needed if the panel_bridge structure was
+	 * allocated with drmm_kzalloc(). This might be tricky since the
+	 * drm_device pointer can only be retrieved when the bridge is attached.
+	 */
+	if (connector->dev)
+		drm_connector_cleanup(connector);
 }
 
 static void panel_bridge_pre_enable(struct drm_bridge *bridge)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
