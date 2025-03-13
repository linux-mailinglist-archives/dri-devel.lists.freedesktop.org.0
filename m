Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCAA5F38E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3423110E85B;
	Thu, 13 Mar 2025 12:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PsHeQA5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC7A10E85B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F08675C5D70;
 Thu, 13 Mar 2025 11:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388A6C4CEEA;
 Thu, 13 Mar 2025 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741867221;
 bh=0hHbjox8UHRiKYoDTXGFrh7PgRlPnPde9Kma2JZkQzo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PsHeQA5jlWWina4qgwZvMUoTjXVH/ki9SVJMcN2Q/wRkYgcR7MeITswgFhsNoalgq
 PYRpy0UWSRsL6ZVdi+6FzxaDKJShjoe8MzTAweg/WeEJE/DKA1lat/zf59tL+vLycm
 GPVPKAMH/zlPEeacKNhBeyjt5fbKDACc57HWJx4P1JiysQEGKHczT5EihMd8AOKQzx
 VCT1tV5xOIOTkMyUswpw2PQFN8PWH1IP6+2ZhICaP1dsA5SwZlnxeCFQLdtkyfjdgy
 /7vgOvQmGjGD/FcB8AwK4g3dUHULB3zMxoD+tkp5cNEKhRA7nyVas42IpgMUm4Z3tk
 1X66ahgM1nZ1g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Mar 2025 12:59:57 +0100
Subject: [PATCH v6 03/16] drm/tests: Add kunit tests for bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-bridge-connector-v6-3-511c54a604fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7953; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0hHbjox8UHRiKYoDTXGFrh7PgRlPnPde9Kma2JZkQzo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmXTuz3MTl/Pv7dNE3ubzv+Tf53IHXqZPsqZh+Gt29tb
 O7OlP/9tKOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATmZXH8E+p5eAV3gW5T9OO
 Gl68nfbr/O5dFZt956jHbPNNcKy9JfKV4Rezz4L0W5XMBwRPyovXXRC28Xx77ujG8J8NNYcnMFw
 80c0HAA==
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

None of the drm_bridge function have kunit tests so far. Let's change
that, starting with drm_bridge_get_current_state().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Kconfig                 |   1 +
 drivers/gpu/drm/tests/Makefile          |   1 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 210 ++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e5b59de28216385f3783373e636d193d38d02646..9b406123132912f0578e9c8288d4c80e65f75f67 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -72,10 +72,11 @@ config DRM_KUNIT_TEST_HELPERS
 	  KUnit Helpers for KMS drivers.
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM && KUNIT && MMU
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 0109bcf7faa54993cce337f522eae78f0fa6ffcb..6691c577d2d4581a4185bac2ce89a6b14b339b35 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -3,10 +3,11 @@
 obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_atomic_state_test.o \
+	drm_bridge_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
 	drm_dp_mst_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..c0a05c459d957c3f9d281957f002f6bd36cce367
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for drm_bridge functions
+ */
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_kunit_helpers.h>
+
+#include <kunit/test.h>
+
+struct drm_bridge_init_priv {
+	struct drm_device drm;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder encoder;
+	struct drm_bridge bridge;
+	struct drm_connector *connector;
+};
+
+static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs = {
+};
+
+static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+};
+
+KUNIT_DEFINE_ACTION_WRAPPER(drm_bridge_remove_wrapper,
+			    drm_bridge_remove,
+			    struct drm_bridge *);
+
+static int drm_kunit_bridge_add(struct kunit *test,
+				struct drm_bridge *bridge)
+{
+	drm_bridge_add(bridge);
+
+	return kunit_add_action_or_reset(test,
+					 drm_bridge_remove_wrapper,
+					 bridge);
+}
+
+static struct drm_bridge_init_priv *
+drm_test_bridge_init(struct kunit *test, const struct drm_bridge_funcs *funcs)
+{
+	struct drm_bridge_init_priv *priv;
+	struct drm_encoder *enc;
+	struct drm_bridge *bridge;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_bridge_init_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	if (IS_ERR(priv))
+		return ERR_CAST(priv);
+
+	drm = &priv->drm;
+	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
+							    NULL,
+							    NULL,
+							    NULL, 0,
+							    NULL);
+	if (IS_ERR(priv->plane))
+		return ERR_CAST(priv->plane);
+
+	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
+						  priv->plane, NULL,
+						  NULL,
+						  NULL);
+	if (IS_ERR(priv->crtc))
+		return ERR_CAST(priv->crtc);
+
+	enc = &priv->encoder;
+	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
+
+	bridge = &priv->bridge;
+	bridge->type = DRM_MODE_CONNECTOR_VIRTUAL;
+	bridge->funcs = funcs;
+
+	ret = drm_kunit_bridge_add(test, bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_bridge_attach(enc, bridge, NULL, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	priv->connector = drm_bridge_connector_init(drm, enc);
+	if (IS_ERR(priv->connector))
+		return ERR_CAST(priv->connector);
+
+	drm_connector_attach_encoder(priv->connector, enc);
+
+	drm_mode_config_reset(drm);
+
+	return priv;
+}
+
+/*
+ * Test that drm_bridge_get_current_state() returns the last committed
+ * state for an atomic bridge.
+ */
+static void drm_test_drm_bridge_get_current_state_atomic(struct kunit *test)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_init_priv *priv;
+	struct drm_bridge_state *curr_bridge_state;
+	struct drm_bridge_state *bridge_state;
+	struct drm_atomic_state *state;
+	struct drm_bridge *bridge;
+	struct drm_device *drm;
+	int ret;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	drm = &priv->drm;
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	bridge = &priv->bridge;
+	bridge_state = drm_atomic_get_bridge_state(state, bridge);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state);
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_state:
+	ret = drm_modeset_lock(&bridge->base.lock, &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_state;
+	}
+
+	curr_bridge_state = drm_bridge_get_current_state(bridge);
+	KUNIT_EXPECT_PTR_EQ(test, curr_bridge_state, bridge_state);
+
+	drm_modeset_unlock(&bridge->base.lock);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that drm_bridge_get_current_state() returns NULL for a
+ * non-atomic bridge.
+ */
+static void drm_test_drm_bridge_get_current_state_legacy(struct kunit *test)
+{
+	struct drm_bridge_init_priv *priv;
+	struct drm_bridge *bridge;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_legacy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	/*
+	 * NOTE: Strictly speaking, we should take the bridge->base.lock
+	 * before calling that function. However, bridge->base is only
+	 * initialized if the bridge is atomic, while we explicitly
+	 * initialize one that isn't there.
+	 *
+	 * In order to avoid unnecessary warnings, let's skip the
+	 * locking. The function would return NULL in all cases anyway,
+	 * so we don't really have any concurrency to worry about.
+	 */
+	bridge = &priv->bridge;
+	KUNIT_EXPECT_NULL(test, drm_bridge_get_current_state(bridge));
+}
+
+static struct kunit_case drm_bridge_get_current_state_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_get_current_state_atomic),
+	KUNIT_CASE(drm_test_drm_bridge_get_current_state_legacy),
+	{ }
+};
+
+
+static struct kunit_suite drm_bridge_get_current_state_test_suite = {
+	.name = "drm_test_bridge_get_current_state",
+	.test_cases = drm_bridge_get_current_state_tests,
+};
+
+kunit_test_suite(drm_bridge_get_current_state_test_suite);
+
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
+MODULE_LICENSE("GPL");

-- 
2.48.1

