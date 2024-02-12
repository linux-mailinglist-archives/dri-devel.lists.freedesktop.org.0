Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D52F85145E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130F10ED19;
	Mon, 12 Feb 2024 13:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahH0nBwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741C10ED1A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B3F360FA2;
 Mon, 12 Feb 2024 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EA5C43394;
 Mon, 12 Feb 2024 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743648;
 bh=I4evIYup75xS6vmBfT/80RTCAbSYJRYnF6r52PiyOBA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ahH0nBwEi9enkoHNoo/mH37ytQWb9phtgwFPJBwtWqfe2BCHsJYOjUKTN+JcpBnvr
 PlSVPg34paLhS8jHQ5jEs6ChAaNoB0tTqzKGHsDZq67IqrNwzocq8mBCxGAbz9ZiAS
 zDRHnpT4KnPFWgao0xjZcEC+tV/jk0/dKw7VqMtsDfA2fI2xgiNAv9CuZm17Qhd/YY
 o1Fn9G3el2iPhJF6N74WvZrUtdmOD+sVz+yDhV4BJbTz80lnT+DliTqrQQAn379czU
 VoAHVbQDLWoHcLaMSQBUIs/XQuH/gmTQ8q3jamLMCMV4KbBwaSm8ofj4JD2LM5xSqY
 wFMWr0JIh5xbA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:12:57 +0100
Subject: [PATCH v6 14/36] drm/tests: Add output bpc tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-14-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14272; i=mripard@kernel.org;
 h=from:subject:message-id; bh=I4evIYup75xS6vmBfT/80RTCAbSYJRYnF6r52PiyOBA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJNOk5scY3P/U5u2ho8nhFfM6pubNgttmX94ue6CkO
 ptB4WVRRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayUpKRoWvdxAZ/9xDRKzdX
 tXa2zHvsZVLc/lhf+PmzVVPjBdulbBn+yu6t82TQ2ea570b15/ub752R/cYw5w5TkVHtx5RtfFY
 CTAA=
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

Now that we're tracking the output bpc count in the connector state,
let's add a few tests to make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 203 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 138 ++++++++++++++
 2 files changed, 341 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 64ba1f6256ba..a1b0e6914cf8 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -659,6 +659,138 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
 }
 
+/*
+ * Test that if we change the maximum bpc property to a different value,
+ * we trigger a mode change on the connector's CRTC, which will in turn
+ * disable/enable the connector.
+ */
+static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.output_bpc = 8;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
+}
+
+/*
+ * Test that if we set the output bpc property to the same value, we
+ * don't trigger a mode change on the connector's CRTC and leave the
+ * connector unaffected.
+ */
+static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			new_conn_state->hdmi.output_bpc,
+			old_conn_state->hdmi.output_bpc);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_EXPECT_EQ(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -668,6 +800,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	{ }
 };
 
@@ -694,8 +828,77 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
 }
 
+/*
+ * Test that if the connector was initialised with a maximum bpc of 8,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 8, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_8_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 10,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 10, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_10_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 12,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 12, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_12_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
+	KUNIT_CASE(drm_test_check_bpc_8_value),
+	KUNIT_CASE(drm_test_check_bpc_10_value),
+	KUNIT_CASE(drm_test_check_bpc_12_value),
 	{ }
 };
 
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 96b19a5954b4..fef7d53d34d4 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -208,6 +208,139 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of a connector with an invalid maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       9);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a null maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       0);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 8 succeeds, registers the max bpc property, but doesn't register the
+ * HDR output metadata one.
+ */
+static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 8);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 10 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       10);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 10);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 12 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       12);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 12);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
@@ -286,6 +419,11 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
 
 static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),

-- 
2.43.0

