Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAC43528C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C76E9F4;
	Wed, 20 Oct 2021 18:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBF86E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:19:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 446a2974-31d2-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 18:19:30 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1D569194B68;
 Wed, 20 Oct 2021 20:19:17 +0200 (CEST)
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
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 3/7] drm/bridge: Add drm_atomic_get_new_crtc_for_bridge()
 helper
Date: Wed, 20 Oct 2021 20:18:57 +0200
Message-Id: <20211020181901.2114645-4-sam@ravnborg.org>
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

drm_atomic_get_new_crtc_for_bridge() will be used by bridge
drivers to provide easy access to the mode from the
drm_bridge_funcs operations.

The helper will be useful in the conversion to the atomic
operations of struct drm_bridge_funcs.

v2:
  - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
  - Use atomic_state, not bridge_State (Maxime)
  - Drop WARN on crtc_state as it is a valid case (Maxime)
  - Added small code snip to help readers
  - Updated description, fixed kernel-doc and exported the symbol

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..8b107194b157 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
+ * @state: state of the bridge
+ * @bridge: bridge object
+ *
+ * This function is often used in the &struct drm_bridge_funcs operations
+ * to provide easy access to the mode like this:
+ *
+ * .. code-block:: c
+ *
+ *	crtc_state = drm_atomic_get_new_crtc_for_bridge(old_bridge_state->base.state,
+ *							bridge);
+ *	if (crtc_state) {
+ *		mode = &crtc_state->mode;
+ *		...
+ *
+ * If no connector can be looked up or if no connector state is available
+ * then this will be logged using WARN().
+ *
+ * Returns:
+ * The &struct drm_crtc_state for the given bridge/state, or NULL
+ * if no crtc_state could be looked up.
+ */
+const struct drm_crtc_state *
+drm_atomic_get_new_crtc_for_bridge(struct drm_atomic_state *state,
+				   struct drm_bridge *bridge)
+{
+	const struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return NULL;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state || !conn_state->crtc))
+		return NULL;
+
+	return drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+}
+EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_bridge);
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..f861d73296cc 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1119,5 +1119,8 @@ drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+const struct drm_crtc_state *
+drm_atomic_get_new_crtc_for_bridge(struct drm_atomic_state *state,
+				   struct drm_bridge *bridge);
 
 #endif /* DRM_ATOMIC_H_ */
-- 
2.30.2

