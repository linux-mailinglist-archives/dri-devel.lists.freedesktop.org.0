Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE1CA0F6F
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 19:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054610E190;
	Wed,  3 Dec 2025 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S9qLeMGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5075510E190
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764786530;
 bh=iYE+4UPkyqxTrSULtDzHdjdb79m0OVRNfhA4Xnqm7pI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=S9qLeMGFgmxmYmDXTM5boYIUoLs7eWKOW1sh8LOI9SFCUVbPuPxCMLFUNALOYjLw0
 +S5KIkF7SvMGz7P2ilri8RwV/wCXibQ6BfEAM0gLlv3OB4acS6LQq+nSjkezs8IYPy
 F3qZA34v3/mCNiKE9VKBVlcTor7+ePRFYCBaE1MXMoKoA2TrbCjk++8zZxpw7Bi9Xc
 aUSVmoAEPl0JEE4WC4i4be3yDbeELtez63g/AqXhOqWonzMpgEppXXcwQvhG4sN/We
 DgsPwb9UAad7Sw/5yc+PCeWQ1zWSukAdAxvaApQWOA/7vFNo+aYScben+6vxx5eGu7
 AuFkdNHp04ZwQ==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A348517E0360;
 Wed,  3 Dec 2025 19:28:50 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 03 Dec 2025 20:27:52 +0200
Subject: [PATCH 1/4] drm/bridge: Add ->detect_ctx hook and
 drm_bridge_detect_ctx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-dw-hdmi-qp-scramb-v1-1-836fe7401a69@collabora.com>
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
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

Add an atomic variant of the ->detect callback and a new helper to call
the hook while passing an optional drm_modeset_acquire_ctx reference.

When both ->detect_ctx and ->detect are defined, the latter is ignored.
If acquire_ctx is unset, the function takes care of the locking,
while also handling EDEADLK.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 30 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8f355df883d8..1fe03bcf2fc1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1280,6 +1280,64 @@ drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 }
 EXPORT_SYMBOL_GPL(drm_bridge_detect);
 
+/**
+ * drm_bridge_detect_ctx - check if anything is attached to the bridge output
+ * @bridge: bridge control structure
+ * @connector: attached connector
+ * @ctx: acquire_ctx, or NULL to let this function handle locking
+ *
+ * If the bridge supports output detection, as reported by the
+ * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect_ctx
+ * or &drm_bridge_funcs.detect for the bridge and return the connection status.
+ * Otherwise return connector_status_unknown.
+ *
+ * When both @ctx and &drm_bridge_funcs.detect_ctx are not set, this helper
+ * function is equivalent to drm_bridge_detect() above.
+ *
+ * RETURNS:
+ * The detection status on success, or connector_status_unknown if the bridge
+ * doesn't support output detection.
+ * If @ctx is set, it might also return -EDEADLK.
+ */
+int drm_bridge_detect_ctx(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
+		return connector_status_unknown;
+
+	if (bridge->funcs->detect_ctx) {
+		struct drm_modeset_acquire_ctx br_ctx;
+		int ret;
+
+		if (ctx)
+			return bridge->funcs->detect_ctx(bridge, connector, ctx);
+
+		drm_modeset_acquire_init(&br_ctx, 0);
+retry:
+		ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex,
+				       &br_ctx);
+		if (!ret)
+			ret = bridge->funcs->detect_ctx(bridge, connector, &br_ctx);
+
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&br_ctx);
+			goto retry;
+		}
+
+		if (ret < 0)
+			ret = connector_status_unknown;
+
+		drm_modeset_drop_locks(&br_ctx);
+		drm_modeset_acquire_fini(&br_ctx);
+
+		return ret;
+	}
+
+	return bridge->funcs->detect(bridge, connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_detect_ctx);
+
 /**
  * drm_bridge_get_modes - fill all modes currently valid for the sink into the
  * @connector
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa868..e11a1b39ef33 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -664,6 +664,33 @@ struct drm_bridge_funcs {
 	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 
+	/**
+	 * @detect_ctx:
+	 *
+	 * Check if anything is attached to the bridge output.
+	 *
+	 * This callback is optional, if not implemented the bridge will be
+	 * considered as always having a component attached to its output.
+	 * Bridges that implement this callback shall set the
+	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
+	 *
+	 * This is the atomic version of &drm_bridge_funcs.detect.
+	 *
+	 * To avoid races against concurrent connector state updates, the
+	 * helper libraries always call this with ctx set to a valid context,
+	 * and &drm_mode_config.connection_mutex will always be locked with
+	 * the ctx parameter set to this ctx. This allows taking additional
+	 * locks as required.
+	 *
+	 * RETURNS:
+	 *
+	 * &drm_connector_status indicating the bridge output status,
+	 * or the error code returned by drm_modeset_lock(), -EDEADLK.
+	 */
+	int (*detect_ctx)(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx);
+
 	/**
 	 * @get_modes:
 	 *
@@ -1527,6 +1554,9 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 
 enum drm_connector_status
 drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector);
+int drm_bridge_detect_ctx(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,

-- 
2.51.2

