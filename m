Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E23D1E2F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC856ECC9;
	Thu, 22 Jul 2021 06:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167116EB22
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:23:04 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4717710f-eab5-11eb-9082-0050568c148b;
 Thu, 22 Jul 2021 06:23:06 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CDB52194B25;
 Thu, 22 Jul 2021 08:23:19 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/7] drm/bridge: Add drm_bridge_new_crtc_state() helper
Date: Thu, 22 Jul 2021 08:22:42 +0200
Message-Id: <20210722062246.2512666-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722062246.2512666-1-sam@ravnborg.org>
References: <20210722062246.2512666-1-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_bridge_new_crtc_state() will be used by bridge drivers to provide
easy access to the mode from the drm_bridge_funcs operations.

The helper will be useful in the atomic operations of
struct drm_bridge_funcs.

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
 drivers/gpu/drm/drm_atomic.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a8bbb021684b..93d513078e9a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1133,6 +1133,40 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_bridge_new_crtc_state - get crtc_state for the bridge
+ * @bridge: bridge object
+ * @old_bridge_state: state of the bridge
+ *
+ * This function returns the &struct drm_crtc_state for the given bridge/state,
+ * or NULL if no crtc_state could be looked up. In case no crtc_state then this is
+ * logged using WARN as the crtc_state is always expected to be present.
+ * This function is often used in the &struct drm_bridge_funcs operations.
+ */
+const struct drm_crtc_state *
+drm_bridge_new_crtc_state(struct drm_bridge *bridge,
+			  struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_connector_state *conn_state;
+	const struct drm_crtc_state *crtc_state;
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
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return NULL;
+
+	return crtc_state;
+}
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..a3001eef98bf 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1119,5 +1119,8 @@ drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+const struct drm_crtc_state *
+drm_bridge_new_crtc_state(struct drm_bridge *bridge,
+			  struct drm_bridge_state *old_bridge_state);
 
 #endif /* DRM_ATOMIC_H_ */
-- 
2.30.2

