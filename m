Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413DA4DC01
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0FC10E58B;
	Tue,  4 Mar 2025 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HyQ6T6tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1099A10E58B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD6485C5B14;
 Tue,  4 Mar 2025 11:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9BDC4CEE9;
 Tue,  4 Mar 2025 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086682;
 bh=eNUkeV7AVLYPrx6JpkksY/XA1qUwL/vhE5SBrSDA1JU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HyQ6T6tPYE4vHG8SlPz1UL0ko0mrZaVsG7tJlBZ4x0SqvJDFYXbZc5nM0lxCt5Chl
 4iu7SfT/YuJbWIK7nt5vRLBIKXSswD4DRdGrw5XyCPOEErvabsTcDovSHXeZ+OSSOM
 Gr7cLq95vp94XLz/J/cwdX5+/d6c40KS8l3b8nhz3CF2TpMaXn0iHsUVcuLBkz8Ehc
 EZSTZg1nbnJ5EPrvnP5M4FzEen0X/PQW4u/n1G6dG/YGfKawwctuKnMaxJAJ0rsvh8
 jPP7VHNyRBWsN/5YKzCpQ5YcdjyWQLM5+JKTz55bqnfzieWH6eK0Xkk1HfBDUpu0aJ
 ZffMupymugbNA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:50 +0100
Subject: [PATCH v5 07/16] drm/tests: Create tests for drm_atomic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-7-aacf461d2157@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5633; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eNUkeV7AVLYPrx6JpkksY/XA1qUwL/vhE5SBrSDA1JU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7u+3FVHsPnihULWL5eNldwlp0axopdnLFzAyROtmb
 nPJe93QMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbCq8PYcJvVsP1q6zS+97+y
 O5h+TXnIPXe5atGTnPlHTxbpbnwRIzKzeRG7ytpT0nwxxU7JfQetGRtmRot96RJrPbRtkaaVpkW
 E3yLTbcf5dB7s5SwXdD/Hvtxz2r+Jziu7bTS4+f+d81p89ioA
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

We don't have a set of kunit tests for the functions under drm_atomic.h.
Let's use the introduction of drm_atomic_get_connector_for_encoder() to
create some tests for it and thus create that set.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/Makefile          |   1 +
 drivers/gpu/drm/tests/drm_atomic_test.c | 153 ++++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 6691c577d2d4581a4185bac2ce89a6b14b339b35..3afd6587df0831a0d10e91ff0a584af6ba1813e4 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -2,10 +2,11 @@
 
 obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_atomic_test.o \
 	drm_atomic_state_test.o \
 	drm_bridge_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
diff --git a/drivers/gpu/drm/tests/drm_atomic_test.c b/drivers/gpu/drm/tests/drm_atomic_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..ea91bec6569e688ad33149d8ee6ecc3562b61254
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_atomic_test.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for drm_atomic functions
+ */
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_kunit_helpers.h>
+#include <drm/drm_modeset_helper_vtables.h>
+
+#include <kunit/test.h>
+
+struct drm_atomic_test_priv {
+	struct drm_device drm;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+static const struct drm_connector_helper_funcs drm_atomic_init_connector_helper_funcs = {
+};
+
+static const struct drm_connector_funcs drm_atomic_init_connector_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.reset			= drm_atomic_helper_connector_reset,
+};
+
+static struct drm_atomic_test_priv *create_device(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_connector *connector;
+	struct drm_encoder *enc;
+	struct drm_device *drm;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_atomic_test_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	if (IS_ERR(priv))
+		return ERR_CAST(priv);
+
+	drm = &priv->drm;
+	plane = drm_kunit_helper_create_primary_plane(test, drm,
+						      NULL,
+						      NULL,
+						      NULL, 0,
+						      NULL);
+	if (IS_ERR(plane))
+		return ERR_CAST(plane);
+	priv->plane = plane;
+
+	crtc = drm_kunit_helper_create_crtc(test, drm,
+					    plane, NULL,
+					    NULL,
+					    NULL);
+	if (IS_ERR(crtc))
+		return ERR_CAST(crtc);
+	priv->crtc = crtc;
+
+	enc = &priv->encoder;
+	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	enc->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &priv->connector;
+	ret = drmm_connector_init(drm, connector,
+				  &drm_atomic_init_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL,
+				  NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(connector, &drm_atomic_init_connector_helper_funcs);
+
+	drm_connector_attach_encoder(connector, enc);
+
+	drm_mode_config_reset(drm);
+
+	return priv;
+}
+
+static void drm_test_drm_atomic_get_connector_for_encoder(struct kunit *test)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_test_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_connector *curr_connector;
+	int ret;
+
+	priv = create_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, &priv->drm,
+						     priv->crtc, &priv->connector,
+						     mode, &ctx);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn:
+	curr_connector = drm_atomic_get_connector_for_encoder(&priv->encoder,
+							      &ctx);
+	if (PTR_ERR(curr_connector) == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_conn;
+	}
+	KUNIT_EXPECT_PTR_EQ(test, curr_connector, &priv->connector);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static struct kunit_case drm_atomic_get_connector_for_encoder_tests[] = {
+	KUNIT_CASE(drm_test_drm_atomic_get_connector_for_encoder),
+	{ }
+};
+
+
+static struct kunit_suite drm_atomic_get_connector_for_encoder_test_suite = {
+	.name = "drm_test_atomic_get_connector_for_encoder",
+	.test_cases = drm_atomic_get_connector_for_encoder_tests,
+};
+
+kunit_test_suite(drm_atomic_get_connector_for_encoder_test_suite);
+
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_DESCRIPTION("Kunit test for drm_atomic functions");
+MODULE_LICENSE("GPL");

-- 
2.48.1

