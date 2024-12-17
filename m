Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97B9F4DFD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B6C10E426;
	Tue, 17 Dec 2024 14:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ImKvhuDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E90110E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:39:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 93DBAC11CD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:32:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 49B4E1C0006;
 Tue, 17 Dec 2024 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734445944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOl01A0J4zS7bD55OnoODRpUmSiylYagae5vOcM5HKw=;
 b=ImKvhuDnPDoKcXobBysVBrEa9VgE2Nf6ioyie6UIkaxC/XIFP46oYDbB2lvvdNMSs6p4YX
 4vFvmyXI1ukivifVU/TkscmfGoLsyPBoaEmP9qyGT0kBvbfT8nIHyPIubr+mobE0MHSrhD
 ffQbpngYAQ0o1Ev2c+D+tS8rasnTB51lVKEeWZ6WWcAADbrRJyBQZ4/OWhKwirJPiaigKX
 k5g8g6hDqfZOGYsS1OW1g24mL+STytWnzPz2gcrW8BGcQHtLGRrsYt6uSjjj4FqjODUB7/
 pYuMyQw/P0VbiEIYIjQ8fmEm6nkKXp9Q+H4uC7zoY2mttZAFaHclOS0mDMtQ4g==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 2/3] drm/atomic-helpers: Introduce
 drm_atomic_helper_disable_connector()
Date: Tue, 17 Dec 2024 15:32:14 +0100
Message-ID: <20241217143216.658461-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217143216.658461-1-herve.codina@bootlin.com>
References: <20241217143216.658461-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

drm_atomic_helper_disable_connector() disables a connector taking care
of disabling the CRTC as well if the disabled connector was the only one
connector connected to the CRTC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 67 +++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  2 +
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8ed186ddaeaf..1d691cbb047e 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3279,6 +3279,73 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(drm_atomic_helper_set_config);
 
+/**
+ * drm_atomic_helper_disable_connector - disable connector
+ * @connector: connector to disable
+ * @ctx: lock acquisition context
+ *
+ * Turn off the given connector by setting its DPMS mode to off.
+ * Also deactivate the CRTC is this connector was the only one connected to the
+ * CRTC.
+ *
+ * Note that if callers haven't already acquired all modeset locks this might
+ * return -EDEADLK, which must be handled by calling drm_modeset_backoff().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_atomic_helper_disable_connector(struct drm_connector *connector,
+					struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector_state *connector_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_crtc *crtc;
+	int ret;
+
+	state = drm_atomic_state_alloc(connector->dev);
+	if (!state)
+		return -ENOMEM;
+
+	state->acquire_ctx = ctx;
+
+	connector_state = drm_atomic_get_connector_state(state, connector);
+	if (IS_ERR(connector_state)) {
+		ret = PTR_ERR(connector_state);
+		goto end;
+	}
+
+	crtc = connector_state->crtc;
+
+	ret = drm_atomic_set_crtc_for_connector(connector_state, NULL);
+	if (ret < 0)
+		goto end;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto end;
+	}
+
+	if (!crtc_state->connector_mask) {
+		/*
+		 * The only one connector from the crtc has
+		 * been disabled -> Disable the CRTC too
+		 */
+		ret = drm_atomic_set_mode_prop_for_crtc(crtc_state, NULL);
+		if (ret < 0)
+			goto end;
+
+		crtc_state->active = false;
+	}
+
+	ret = drm_atomic_commit(state);
+end:
+	drm_atomic_state_put(state);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_disable_connector);
+
 /**
  * drm_atomic_helper_disable_all - disable all currently active outputs
  * @dev: DRM device
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..923a354577a3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -137,6 +137,8 @@ int drm_atomic_helper_disable_plane(struct drm_plane *plane,
 int drm_atomic_helper_set_config(struct drm_mode_set *set,
 				 struct drm_modeset_acquire_ctx *ctx);
 
+int drm_atomic_helper_disable_connector(struct drm_connector *connector,
+					struct drm_modeset_acquire_ctx *ctx);
 int drm_atomic_helper_disable_all(struct drm_device *dev,
 				  struct drm_modeset_acquire_ctx *ctx);
 void drm_atomic_helper_shutdown(struct drm_device *dev);
-- 
2.47.0

