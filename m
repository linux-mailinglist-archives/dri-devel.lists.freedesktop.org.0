Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC0A4468D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C410E769;
	Tue, 25 Feb 2025 16:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bl0StFUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1410E77C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF0D7612AA;
 Tue, 25 Feb 2025 16:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2332DC4CEEA;
 Tue, 25 Feb 2025 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501867;
 bh=Tisp1QT2x8YcI+elpOV2oG8s12h8TQKg1tUE8KBC2Eo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bl0StFURWhIdH9QK6rMC9/XYUnuLqkCm2Dll1NMNnFJZm73Rt9SZoXjltS/8B7huD
 l7XViZYYh5yx3IbrqHMzSwE/sOELq5iQ51gGFJpgaOJCEQmROombCCAMPxGfLvdrUn
 9o+arxmlYY3tDmgqoQur/yMECte827o+76BFjF9RSoIUSf0YKa/EQtmKtjq/jfnw0R
 dp4aWXiwcWZ24JvuThXF2SC24YmzGJUM+GXJB5yxyY0SWNeZ6wMEGNZkGNx1c1Eg7C
 8ALzQpRbc4cGD2op2qPyD+Ccp+eUTXZQqRx2qDa41yRitzqlrwt42VH1QxAGtrFf4f
 F9fz2c0f+YxBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:43:56 +0100
Subject: [PATCH v4 08/15] drm/tests: bridge: Provide tests for
 drm_bridge_reset_crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-8-7ecb07b09cad@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6336; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Tisp1QT2x8YcI+elpOV2oG8s12h8TQKg1tUE8KBC2Eo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P/tWJ35+eTFmNev5p6W6++5yJr3X6Ni8+fvKTtZ04
 7P/9Ypvd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ2LYzNrwvvy9i950xZ/Ff
 FnX5jRXd7FrfSsQ2tzgudv/02FM3zMPSovL2LSk9oQUNPJVTr+7ew1hffVQkdFLV+7pXO0u9ny/
 9w994/P9ljlnilfeZLy949lO9icf+0yMJRRmtOwKWE9z7bV8AAA==
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

Let's provide a bunch of kunit tests to make sure
drm_bridge_reset_crtc() works as expected.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 168 +++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index c0a05c459d957c3f9d281957f002f6bd36cce367..4bcc761b3ba70bfa0ccc56b0685e35f86bde63fd 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -14,17 +14,57 @@ struct drm_bridge_init_priv {
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_connector *connector;
+	unsigned int enable_count;
+	unsigned int disable_count;
 };
 
+static void drm_test_bridge_enable(struct drm_bridge *bridge)
+{
+	struct drm_bridge_init_priv *priv =
+		container_of(bridge, struct drm_bridge_init_priv, bridge);
+
+	priv->enable_count++;
+}
+
+static void drm_test_bridge_disable(struct drm_bridge *bridge)
+{
+	struct drm_bridge_init_priv *priv =
+		container_of(bridge, struct drm_bridge_init_priv, bridge);
+
+	priv->disable_count++;
+}
+
 static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs = {
+	.enable			= drm_test_bridge_enable,
+	.disable		= drm_test_bridge_disable,
 };
 
+static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_atomic_state *state)
+{
+	struct drm_bridge_init_priv *priv =
+		container_of(bridge, struct drm_bridge_init_priv, bridge);
+
+	priv->enable_count++;
+}
+
+static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_atomic_state *state)
+{
+	struct drm_bridge_init_priv *priv =
+		container_of(bridge, struct drm_bridge_init_priv, bridge);
+
+	priv->disable_count++;
+}
+
 static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
+	.atomic_enable		= drm_test_bridge_atomic_enable,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_disable		= drm_test_bridge_atomic_disable,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 };
 
 KUNIT_DEFINE_ACTION_WRAPPER(drm_bridge_remove_wrapper,
@@ -201,10 +241,136 @@ static struct kunit_case drm_bridge_get_current_state_tests[] = {
 static struct kunit_suite drm_bridge_get_current_state_test_suite = {
 	.name = "drm_test_bridge_get_current_state",
 	.test_cases = drm_bridge_get_current_state_tests,
 };
 
-kunit_test_suite(drm_bridge_get_current_state_test_suite);
+/*
+ * Test that an atomic bridge is properly power-cycled when calling
+ * drm_bridge_reset_crtc().
+ */
+static void drm_test_drm_bridge_reset_crtc_atomic(struct kunit *test)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_init_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_bridge *bridge;
+	int ret;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_atomic_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_commit:
+	ret = drm_kunit_helper_enable_crtc_connector(test,
+						     &priv->drm, priv->crtc,
+						     priv->connector,
+						     mode,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	bridge = &priv->bridge;
+	KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_reset:
+	ret = drm_bridge_reset_crtc(bridge, &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_reset;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
+	KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
+}
+
+/*
+ * Test that a non-atomic bridge is properly power-cycled when calling
+ * drm_bridge_reset_crtc().
+ */
+static void drm_test_drm_bridge_reset_crtc_legacy(struct kunit *test)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_init_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_bridge *bridge;
+	int ret;
+
+	priv = drm_test_bridge_init(test, &drm_test_bridge_legacy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_commit:
+	ret = drm_kunit_helper_enable_crtc_connector(test,
+						     &priv->drm, priv->crtc,
+						     priv->connector,
+						     mode,
+						     &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	bridge = &priv->bridge;
+	KUNIT_ASSERT_EQ(test, priv->enable_count, 1);
+	KUNIT_ASSERT_EQ(test, priv->disable_count, 0);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_reset:
+	ret = drm_bridge_reset_crtc(bridge, &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_reset;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	KUNIT_EXPECT_EQ(test, priv->enable_count, 2);
+	KUNIT_EXPECT_EQ(test, priv->disable_count, 1);
+}
+
+static struct kunit_case drm_bridge_reset_crtc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_reset_crtc_atomic),
+	KUNIT_CASE(drm_test_drm_bridge_reset_crtc_legacy),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_reset_crtc_test_suite = {
+	.name = "drm_test_bridge_reset_crtc",
+	.test_cases = drm_bridge_reset_crtc_tests,
+};
+
+kunit_test_suites(
+	&drm_bridge_get_current_state_test_suite,
+	&drm_bridge_reset_crtc_test_suite,
+);
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
 MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
 MODULE_LICENSE("GPL");

-- 
2.48.1

