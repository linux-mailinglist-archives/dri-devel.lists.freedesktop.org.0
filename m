Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC3808C50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F2210E8F0;
	Thu,  7 Dec 2023 15:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1495210E8EC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:50:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D2464CE1D04;
 Thu,  7 Dec 2023 15:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB964C433C9;
 Thu,  7 Dec 2023 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964203;
 bh=eM6MiC7KJtBQC3Pv2LlWKIscUpIkiyaWvuaCef0KyRg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f0VTXfMbUN2nAiIZhl3b3DwZuW61N5Wew9DSGiPhVe3smSJIDIfljqnbYxvnb7yZV
 hP0DJ9mIllHxgmVboSgdYWnaQxxuo0CBpQtPPw1h1elusl6oak+DB2HTYXOZBI4frS
 qQD364DhZbixY6hZXMP18FB/x1orywiCq/g+EpzEEF7i31rF4Xkc1WR3alFOpQxwfY
 w0O23jNCbwuJg7v//NeUv7UifjBbh67XSfdDFdujtWnzRuepx8bFYtzE27rICz/z5s
 jqswdaJM32yK6xau6EfUdG1rgvUr1dzNBwyrqxKAHza4ZnY1X03jpYufNRQAQ0Mm/9
 fddRgBkIPmAKQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:34 +0100
Subject: [PATCH v5 11/44] drm/connector: hdmi: Add support for output
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-11-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=22055; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eM6MiC7KJtBQC3Pv2LlWKIscUpIkiyaWvuaCef0KyRg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1tDvmxfJLwlxJH1nuLcZ0+PKjHHHTwqGO/18oKf3
 F8e8aLkjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkky8jQ+NS1h0fXi+4Xqi1
 +FcJq/OGjHDO/YHTJp4653CVQWtTgATD//KE07z2+5fYLr3qeir7XfC1y9J8L0ITP8/ZufS6yRH
 mx+wA
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just like BPC, we'll add support for automatic selection of the output
format for HDMI connectors.

Let's add the needed defaults and fields for now.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c                       |   2 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   3 +-
 drivers/gpu/drm/drm_connector.c                    |  31 ++++++
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   |  90 ++++++++++++++---
 drivers/gpu/drm/tests/drm_connector_test.c         | 109 ++++++++++++++++++++-
 include/drm/drm_connector.h                        |  19 ++++
 6 files changed, 238 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 76c63ed04af4..7aaa2a4d70d9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1148,6 +1148,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
 		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+		drm_printf(p, "\toutput_format=%s\n",
+			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 883bdc0349c0..92e1b087c3d0 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -705,7 +705,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
-	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
+	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 139ac3d8160c..a72f38b6dbc8 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
@@ -477,6 +478,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
 	int ret;
@@ -485,6 +487,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
+		return -EINVAL;
+
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
@@ -492,6 +497,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	connector->hdmi.supported_formats = supported_formats;
+
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
@@ -1224,6 +1231,30 @@ drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_
 }
 EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
 
+static const char * const output_format_str[] = {
+	[HDMI_COLORSPACE_RGB]		= "RGB",
+	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
+	[HDMI_COLORSPACE_YUV422]	= "YUV 4:2:2",
+	[HDMI_COLORSPACE_YUV444]	= "YUV 4:4:4",
+};
+
+/*
+ * drm_hdmi_connector_get_output_format_name() - Return a string for HDMI connector output format
+ * @fmt: Output format to compute name of
+ *
+ * Returns: the name of the output format, or NULL if the type is not
+ * valid.
+ */
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
+{
+	if (fmt >= ARRAY_SIZE(output_format_str))
+		return NULL;
+
+	return output_format_str[fmt];
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
+
 /**
  * DOC: standard connector properties
  *
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index a1b0e6914cf8..4e2ec436987b 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -147,6 +147,7 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int formats,
 				      unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
@@ -190,6 +191,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 				       &dummy_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       formats,
 				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -225,7 +227,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -286,7 +290,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -347,7 +353,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -401,7 +409,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -454,7 +464,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -510,7 +522,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -565,7 +579,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -621,7 +637,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -678,7 +696,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -745,7 +765,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -802,6 +824,15 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
+	/*
+	 * TODO: We should have tests to check that a change in the
+	 * format triggers a CRTC mode change just like we do for the
+	 * RGB Quantization and BPC.
+	 *
+	 * However, we don't have any way to control which format gets
+	 * picked up aside from changing the BPC or mode which would
+	 * already trigger a mode change.
+	 */
 	{ }
 };
 
@@ -820,7 +851,9 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -840,7 +873,9 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -862,7 +897,9 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -884,7 +921,9 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -894,11 +933,34 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
 }
 
+/*
+ * Test that the value of the output format property out of reset is set
+ * to RGB, even if the driver supports more than that.
+ */
+static void drm_test_check_format_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB) |
+						     BIT(HDMI_COLORSPACE_YUV422) |
+						     BIT(HDMI_COLORSPACE_YUV444),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
 	KUNIT_CASE(drm_test_check_bpc_8_value),
 	KUNIT_CASE(drm_test_check_bpc_10_value),
 	KUNIT_CASE(drm_test_check_bpc_12_value),
+	KUNIT_CASE(drm_test_check_format_value),
 	{ }
 };
 
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index fef7d53d34d4..fa6fe8084107 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -187,6 +187,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -204,6 +205,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -221,6 +223,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       9);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -238,6 +241,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       0);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -259,6 +263,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -292,6 +297,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       10);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -325,6 +331,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       12);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -341,6 +348,42 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
 }
 
+/*
+ * Test that the registration of an HDMI connector with no supported
+ * format fails.
+ */
+static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       0,
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector not listing RGB as a
+ * supported format fails.
+ */
+static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_YUV422),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
@@ -355,6 +398,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -387,6 +431,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -424,6 +469,8 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
+	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
+	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
@@ -558,6 +605,64 @@ static struct kunit_suite drm_hdmi_connector_get_broadcast_rgb_name_test_suite =
 	.test_cases = drm_hdmi_connector_get_broadcast_rgb_name_tests,
 };
 
+struct drm_hdmi_connector_get_output_format_name_test {
+	unsigned int kind;
+	const char *expected_name;
+};
+
+#define OUTPUT_FORMAT_TEST(_kind, _name)	\
+	{					\
+		.kind = _kind,			\
+		.expected_name = _name,		\
+	}
+
+static void drm_test_drm_hdmi_connector_get_output_format_name(struct kunit *test)
+{
+	const struct drm_hdmi_connector_get_output_format_name_test *params =
+		test->param_value;
+
+	KUNIT_EXPECT_STREQ(test,
+			   drm_hdmi_connector_get_output_format_name(params->kind),
+			   params->expected_name);
+}
+
+static const
+struct drm_hdmi_connector_get_output_format_name_test
+drm_hdmi_connector_get_output_format_name_valid_tests[] = {
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_RGB, "RGB"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV420, "YUV 4:2:0"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV422, "YUV 4:2:2"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV444, "YUV 4:4:4"),
+};
+
+static void
+drm_hdmi_connector_get_output_format_name_valid_desc(const struct drm_hdmi_connector_get_output_format_name_test *t,
+						     char *desc)
+{
+	sprintf(desc, "%s", t->expected_name);
+}
+
+KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_output_format_name_valid,
+		  drm_hdmi_connector_get_output_format_name_valid_tests,
+		  drm_hdmi_connector_get_output_format_name_valid_desc);
+
+static void drm_test_drm_hdmi_connector_get_output_format_name_invalid(struct kunit *test)
+{
+	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_output_format_name(4));
+};
+
+static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_output_format_name,
+			 drm_hdmi_connector_get_output_format_name_valid_gen_params),
+	KUNIT_CASE(drm_test_drm_hdmi_connector_get_output_format_name_invalid),
+	{ }
+};
+
+static struct kunit_suite drm_hdmi_connector_get_output_format_name_test_suite = {
+	.name = "drm_hdmi_connector_get_output_format_name",
+	.test_cases = drm_hdmi_connector_get_output_format_name_tests,
+};
+
 static void drm_test_drm_connector_attach_broadcast_rgb_property(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
@@ -590,6 +695,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -618,7 +724,8 @@ kunit_test_suites(
 	&drmm_connector_init_test_suite,
 	&drm_connector_attach_broadcast_rgb_property_test_suite,
 	&drm_get_tv_mode_from_name_test_suite,
-	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite
+	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite,
+	&drm_hdmi_connector_get_output_format_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1b1b6aed04ee..74db5ce47e01 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -391,6 +391,8 @@ enum drm_hdmi_broadcast_rgb {
 
 const char *
 drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
 
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
@@ -1077,6 +1079,11 @@ struct drm_connector_state {
 		 * @output_bpc: Bits per color channel to output.
 		 */
 		unsigned int output_bpc;
+
+		/**
+		 * @output_format: Pixel format to output in.
+		 */
+		enum hdmi_colorspace output_format;
 	} hdmi;
 };
 
@@ -1944,6 +1951,17 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/**
+	 * @hdmi: HDMI-related variable and properties.
+	 */
+	struct {
+		/**
+		 * @supported_formats: Bitmask of @hdmi_colorspace
+		 * supported by the controller.
+		 */
+		unsigned long supported_formats;
+	} hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -1967,6 +1985,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);

-- 
2.43.0

