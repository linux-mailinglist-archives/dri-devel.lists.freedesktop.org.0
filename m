Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9EC878226
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96DB112AD4;
	Mon, 11 Mar 2024 14:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BLUXWSrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55657112ACF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:50:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C39260EAD;
 Mon, 11 Mar 2024 14:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F81C43394;
 Mon, 11 Mar 2024 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710168655;
 bh=hdQFimYEoL1NKCgBJcqXUYcz0R/w6fqejvd5drDOq3w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BLUXWSrNEgGAhMyooRP8XizI3B6TeWhaYcK6UcjrPIuh6RFQ4vZbleS46e0OKdJen
 uKu1/IbmY6QHXuC6tWNkIJ4czVqcn6Fr7O6of49inM9tqJhNvcOvgT4w/kvxhPF/9R
 40w3uRukPc3gj3B4KyX6YXvvp/qSmnD9qA9BWHJehBVzh7U+sC8luAnsn9PWdPOV3Z
 cv3f78IkQPC507WUlWc20VNzRQZpPROaOD/ZXwxJa8yiTKwXRsM566Xi6cZMXcJdzj
 OqHmB3ARm6DlwHZltLRtEgehM+uYrbii9dmhFHyv5NkprmZbzmeUV3aBBClN2NDwyI
 XLKYmUeuKtSrg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:47 +0100
Subject: [PATCH v9 19/27] drm/tests: Add RGB Quantization tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-19-d45890323344@kernel.org>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=20952; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hdQFimYEoL1NKCgBJcqXUYcz0R/w6fqejvd5drDOq3w=;
 b=kA0DAAoW4+8Nb2cYUcUByyZiAGXvGhCjUGWnqbF0JDPdbQhFZPdtW8ODmyuvIqhaYUAC5ihoY
 4h1BAAWCgAdFiEEXBM3pF7KmuuJBg6e4+8Nb2cYUcUFAmXvGhAACgkQ4+8Nb2cYUcXb1AD9E/wS
 s81XFGERBRuv8T1/HpNWIgkG1ngv5JVduPo7VhQBAPt+Ju1kvGpJxD9oIQSnSuvi3FEabpD261M
 iwgBHYM8M
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

The previous commit added the infrastructure to the connector state to
track what RGB Quantization should be used in a given state for an HDMI
connector.

Let's add some kunit tests to make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 563 +++++++++++++++++++++
 1 file changed, 563 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 3de15cec2f5f..dcc0f7486f49 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -350,10 +350,564 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
 }
 
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to auto with a mode that isn't the
+ * VIC-1 mode, we will get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to auto with a VIC-1 mode, we will get
+ * a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to full with a mode that isn't the
+ * VIC-1 mode, we will get a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_FULL);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to full with a VIC-1 mode, we will get
+ * a full RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_FULL);
+
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to limited with a mode that isn't the
+ * VIC-1 mode, we will get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_LIMITED);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that for an HDMI connector, with an HDMI monitor, if the
+ * Broadcast RGB property is set to limited with a VIC-1 mode, we will
+ * get a limited RGB Quantization Range.
+ */
+static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test,
+			conn_state->hdmi.broadcast_rgb,
+			DRM_HDMI_BROADCAST_RGB_LIMITED);
+
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that if we have an HDMI connector that would use a YUV output,
+ * we always get a limited quantization range with the Broadcast RGB
+ * property set to auto.
+ */
+static void drm_test_check_broadcast_rgb_auto_yuv(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB) |
+						     BIT(HDMI_COLORSPACE_YUV422),
+						     12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that if we have an HDMI connector that would use a YUV output,
+ * we always get a limited quantization range even if we have the
+ * Broadcast RGB property set to full.
+ */
+static void drm_test_check_broadcast_rgb_full_yuv(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB) |
+						     BIT(HDMI_COLORSPACE_YUV422),
+						     12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
+/*
+ * Test that if we have an HDMI connector that would use a YUV output,
+ * we always get a limited quantization range even if we have the
+ * Broadcast RGB property set to full.
+ */
+static void drm_test_check_broadcast_rgb_limited_yuv(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_atomic_state *state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB) |
+						     BIT(HDMI_COLORSPACE_YUV422),
+						     12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_connector_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	KUNIT_ASSERT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.is_full_range);
+}
+
 /*
  * Test that if we change the maximum bpc property to a different value,
  * we trigger a mode change on the connector's CRTC, which will in turn
  * disable/enable the connector.
  */
@@ -1185,10 +1739,19 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_yuv),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_full_cea_mode_vic_1),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_full_yuv),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_cea_mode_vic_1),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_limited_yuv),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),

-- 
2.43.2

