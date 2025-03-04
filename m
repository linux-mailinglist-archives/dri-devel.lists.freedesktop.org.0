Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53AA4DBFE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D5F10E57D;
	Tue,  4 Mar 2025 11:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="orvLJAFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35510E57D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63CC35C5B14;
 Tue,  4 Mar 2025 11:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69758C4CEEA;
 Tue,  4 Mar 2025 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086676;
 bh=W1KZgJPSyJ/7ZZeebiPiFkuJP4qW6MCWO9Xt7TxeeEE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=orvLJAFi3IqjxY26li29CtOwHeOZsI+wgznmEx2TLKAcjwqKXaxJKtJxGuTVqXebs
 Q6n6wOCivgK64Yv2C+O0Qv/shV7CwLw/DCgV2F/7nfAwJYxkznU9Ag2o2gqvXHe7Mw
 QZKr2dGQ0xzbZUPqxMLCA8/qfUsVWLDqxaCf27JTiYVmiGhWdA0Z1E8ZB741DhylBk
 z6/Eu0qz7S/pYOkyBRa5yHpn1QLHmr798VHOMoS75ewzSvpFh0vyNFEZRs5ocoAW0c
 +U6rcFDs6SUp/SQCtUeBjhk0u3R/9sGoYoShom3QWIUw+Ec44guoy5unYMYGcP6y3z
 5ULWQRwliDPtw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:48 +0100
Subject: [PATCH v5 05/16] drm/tests: helpers: Create new helper to enable
 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-5-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
In-Reply-To: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7u+byuEx4eeiv8qVa2s2sa9I2co8xVuY5WT7qhK3N
 hvLMvZPHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi9yUZazjOdt2coLHRMFIv
 IfOM2ZRnXz12KdwN/x5vXir08NWVazlmSwT+B8Y7/p2y0qcgJfuzP2PD/mJdzjwO5sVHHpc35D7
 fUB4QVs327dDL/om5c/Mlls94siLr80xHnVdRT4pV1qu9XLgeAA==
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

