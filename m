Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97678A5F392
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058D510E869;
	Thu, 13 Mar 2025 12:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LPlfVPX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8841910E866
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C27CEA47129;
 Thu, 13 Mar 2025 11:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D2CC4CEDD;
 Thu, 13 Mar 2025 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741867227;
 bh=W1KZgJPSyJ/7ZZeebiPiFkuJP4qW6MCWO9Xt7TxeeEE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LPlfVPX3gG65jow2lxcGL+w/QiHfr4IY1IXnm5O15ffsR3kUvzPfOiJ/M8fz7WxDS
 0zFAqW8hmv7U7JpbtWc6QeEp7o8L1eQCTvnSAaptOaoFnJySh3vvf+mvRh99swg71m
 +AUrx2/jur8eyFrexG1cIYAEBwSBDxPTVGO/Kgrm3dxYC+HOFmebn/ssJ6hxoVbVZR
 8HdfyUIFdYh9HUN3/Mj48jmHeF0WsWObFD3mRexbmm6QFMwMYOx6aX748p4t5e909I
 ZqI1Ytbc6SI4Qx9ktFJt1XcmLc6ZW19pIb4T7pJ/lz7Zxur96YF4AJp7NglGxA7uzr
 cE2WJkKKYPuBA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Mar 2025 12:59:59 +0100
Subject: [PATCH v6 05/16] drm/tests: helpers: Create new helper to enable
 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-bridge-connector-v6-5-511c54a604fb@kernel.org>
References: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
In-Reply-To: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4286; i=mripard@kernel.org;
 h=from:subject:message-id; bh=W1KZgJPSyJ/7ZZeebiPiFkuJP4qW6MCWO9Xt7TxeeEE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmXThzYc5vFjYH1/c6/nFoPV1nKbsu+ucJ/wvHCQ21bV
 Ap8XpjwdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAih88wMlwx/JTmbqBUcPbX
 mvhvH74am2zYMlUmYUZO+x6h88Ff/O8xMmxVEl6gcVK6weffi20ls6T7tBKmMLsyhVWbxfL3Nl1
 9wwMA
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

We'll need the HDMI state tests light_up_connector() function in more
tests, so let's promote it to a helper.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 61 +++++++++++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           |  8 ++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index a4eb68f0decca15988105b9d58266e3871934a8b..14ad8f0a0af18410a7129ec34635678a8120d3cb 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
@@ -269,10 +270,70 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 
 	return crtc;
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_create_crtc);
 
+/**
+ * drm_kunit_helper_enable_crtc_connector - Enables a CRTC -> Connector output
+ * @test: The test context object
+ * @drm: The device to alloc the plane for
+ * @crtc: The CRTC to enable
+ * @connector: The Connector to enable
+ * @mode: The display mode to configure the CRTC with
+ * @ctx: Locking context
+ *
+ * This function creates an atomic update to enable the route from @crtc
+ * to @connector, with the given @mode.
+ *
+ * Returns:
+ *
+ * A pointer to the new CRTC, or an ERR_PTR() otherwise. If the error
+ * returned is EDEADLK, the entire atomic sequence must be restarted.
+ */
+int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
+					   struct drm_device *drm,
+					   struct drm_crtc *crtc,
+					   struct drm_connector *connector,
+					   const struct drm_display_mode *mode,
+					   struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_atomic_state *state;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	conn_state = drm_atomic_get_connector_state(state, connector);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
+	if (ret)
+		return ret;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret)
+		return ret;
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
+
 static void kunit_action_drm_mode_destroy(void *ptr)
 {
 	struct drm_display_mode *mode = ptr;
 
 	drm_mode_destroy(NULL, mode);
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 11d59ce0bac0bbec07ae5f07ed9710cf01d73f09..1cda7281f30029e649c62fc0fd9d9ae6889d43ac 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -7,10 +7,11 @@
 
 #include <linux/device.h>
 
 #include <kunit/test.h>
 
+struct drm_connector;
 struct drm_crtc_funcs;
 struct drm_crtc_helper_funcs;
 struct drm_device;
 struct drm_plane_funcs;
 struct drm_plane_helper_funcs;
@@ -116,10 +117,17 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 			     struct drm_plane *primary,
 			     struct drm_plane *cursor,
 			     const struct drm_crtc_funcs *funcs,
 			     const struct drm_crtc_helper_funcs *helper_funcs);
 
+int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
+					   struct drm_device *drm,
+					   struct drm_crtc *crtc,
+					   struct drm_connector *connector,
+					   const struct drm_display_mode *mode,
+					   struct drm_modeset_acquire_ctx *ctx);
+
 struct drm_display_mode *
 drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device *dev,
 				    u8 video_code);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.48.1

