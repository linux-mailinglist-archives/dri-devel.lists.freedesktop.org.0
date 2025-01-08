Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045FA067BE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4DB10E953;
	Wed,  8 Jan 2025 22:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RwDG6Y9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EAD10E953
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736373840;
 bh=68SoE4MOSJftqwMv9rP4iJrgdeOwWAMMlV7RYCQqoIY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RwDG6Y9iFQsdiYDQgQTVv636cbLKLWFpvx0CTV7SVLL+VFu4gxYVr1QAlR70A19qD
 VRoOY5RpFB72FUfhS5NQruhqJBxjBiTV0sbmEReG7C2I2hLvbZ10IRv2IL/O4jCwfS
 FFfY70QuH3LrtadvsJN6egTmiAk4FHDcYOHgB9UH4Fs/GhrAnPKz6NuFYLlIktNiDM
 6FCKD+sYdjMv4KTUhsuwKrgZRYqC7FGClj6kWSbD1DSlJcUZ+txWiFtAfVuAErA7Un
 xA/LMOigtoJMlZoIS4gsZ/sOvXHxGQnqrX72kxHLdIJXGy6YHfxkspuLuQy/9WtM0u
 WCrViWOTTtCZA==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C043F17E360E;
 Wed,  8 Jan 2025 23:04:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jan 2025 00:03:40 +0200
Subject: [PATCH v2 2/2] drm/tests: hdmi: Add connector's CRTC deactivation
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-hdmi-conn-null-mode-v2-2-9eeaf1109547@collabora.com>
References: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
In-Reply-To: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Following up a fixed bug in drm_atomic_helper_connector_hdmi_check(),
discovered while unloading a DRM module, add a couple of tests to make
sure the helper will not exhibit any abnormal behaviour for use cases
that involve shutting down the connector's CRTC.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 173 +++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..98187ecee5d77b5f758af29f4c4bfddbd1f658fd 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1568,6 +1568,177 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
 }
 
+/*
+ * Test that if we deactivate connector's CRTC, we trigger a mode change
+ * on that CRTC, along with setting {connectors|active}_changed.
+ */
+static void drm_test_check_crtc_deactivate_mode_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
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
+	new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
+
+	new_crtc_state->active = false;
+	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
+
+	ret = drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
+}
+
+/*
+ * Test that if we deactivate connector's CRTC, while changing the max
+ * bpc property to a different value, will not have any effect on the
+ * output bpc property. However, we still trigger a mode change on that
+ * CRTC, along with setting {connectors|active}_changed.
+ */
+static void drm_test_check_crtc_deactivate_output_bpc_not_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
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
+	new_conn_state->max_requested_bpc = 8;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->max_requested_bpc,
+			new_conn_state->max_requested_bpc);
+
+	new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
+
+	new_crtc_state->active = false;
+	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
+
+	ret = drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
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
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
+	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -1596,6 +1767,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),
+	KUNIT_CASE(drm_test_check_crtc_deactivate_mode_changed),
+	KUNIT_CASE(drm_test_check_crtc_deactivate_output_bpc_not_changed),
 	/*
 	 * TODO: We should have tests to check that a change in the
 	 * format triggers a CRTC mode change just like we do for the

-- 
2.47.1

