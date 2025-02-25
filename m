Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E3A4468E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA510E774;
	Tue, 25 Feb 2025 16:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cdu7lTz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E0D10E76A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3FD54612BB;
 Tue, 25 Feb 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B93C4CEDD;
 Tue, 25 Feb 2025 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501864;
 bh=0pHBWiLF7FqmjJ3t9kErg7VKqqz+a8+rLeHPnlasuq4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cdu7lTz+aDSKRdhXzfJxaoO2IV/uIlDgon3ntQorvzZfNFgigr9MD/RYYVz6zdUYx
 RtT1bvPzds1rjiSqdLWf8F66jM6jszGa+OKasrICq+ttBpXG64mrUK5NNnfHuhkPI7
 kuZzaNvL3cZDRwpSOzlGGJwFvW9/X+RZ9/rcfjRTMSvFqbiWxkoyPhdvfBkq5fiI9Q
 Ciu9vGWpHyNAMyZyfp1+P0w0SbHOPVvUCHThVKvyAvVLwaNEVLtNhZaN6PqdbSjhYy
 So8lXa0LZkryxdPM+0ue7WH8BScHxABOXaTy/ZL7R3kR1VS5WEF/cbKqjTMOA+tt1x
 1qoU9jiJDYgEQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:43:55 +0100
Subject: [PATCH v4 07/15] drm/bridge: Add helper to reset bridge pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-7-7ecb07b09cad@kernel.org>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
In-Reply-To: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0pHBWiLF7FqmjJ3t9kErg7VKqqz+a8+rLeHPnlasuq4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P/vunr+w4Hi045a/dqXFTic3Vz6PjbmoY3bSgklqe
 XR/2HyDjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR16GM9aXR5Znrlj2f63Xr
 GONe/b3CwUE5OhdYPuYnOmzo/Xbf91ul1vYt1V2ftM5tY8+2mtZ0h7Hed1n3u1ltD99+WLq7LXn
 y/L5T5w/vzL/3JebwKo9Nl5Ijc66fuLaQSY7FjrUgoE9MRqsDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Let's provide an helper to make it easier for bridge drivers to
power-cycle their bridge.

Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8241c00e4506eceeb9bb4ba74a38d8f360c65d38..ca894531a2042fc9296c40a1f51a6cdea6e97ed7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -24,10 +24,11 @@
 #include <linux/err.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
@@ -1269,10 +1270,53 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 		bridge->hpd_cb(bridge->hpd_data, status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+/**
+ * drm_bridge_reset_crtc - Reset the pipeline feeding a bridge
+ * @bridge: DRM bridge to reset
+ * @ctx: lock acquisition context
+ *
+ * Reset a @bridge pipeline. It will power-cycle all active components
+ * between the CRTC and connector that bridge is connected to.
+ *
+ * Returns:
+ *
+ * 0 on success or a negative error code on failure. If the error
+ * returned is EDEADLK, the whole atomic sequence must be restarted.
+ */
+int drm_bridge_reset_crtc(struct drm_bridge *bridge,
+			  struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector *connector;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_device *dev = encoder->dev;
+	struct drm_crtc *crtc;
+	int ret;
+
+	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
+	if (ret)
+		return ret;
+
+	connector = drm_atomic_get_connector_for_encoder(encoder, ctx);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		goto out;
+	}
+
+	crtc = connector->state->crtc;
+	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
+	if (ret)
+		goto out;
+
+out:
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(drm_bridge_reset_crtc);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6fb1da7c195e99143a67a999d16fe361c1e3f4ab..32169e62463bb268a281a5903c0c9f448a1042b3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1085,10 +1085,12 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
+int drm_bridge_reset_crtc(struct drm_bridge *bridge,
+			  struct drm_modeset_acquire_ctx *ctx);
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,

-- 
2.48.1

