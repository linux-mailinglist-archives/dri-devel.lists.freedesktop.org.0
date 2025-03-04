Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB8A4DBFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4B10E581;
	Tue,  4 Mar 2025 11:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k4IlYg7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4129610E57F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C40FB5C5B27;
 Tue,  4 Mar 2025 11:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1916FC4CEEA;
 Tue,  4 Mar 2025 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086679;
 bh=+LGiRKEcCcITA0C2Yd4YksjVY0vEpo6IKjVYAWJOpdQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=k4IlYg7HVUNa8YD4gMi8CRWURh2O4g6xpm3gjw9Tk+lHfeRXqiKCaQcE4EjJMeMSZ
 Hmopuh8FEfSe1rd6koB0COQJwZkV3A6T63Cy5RayC8mm1+LfsfpyIAtsutU4lckF4A
 gEzm2adGMEF/6Rnb2pqkgiLQJf3rcgYKKMVBFMdBrwHXATnU7Y9WMjRG7vS4K854uy
 MHnzZD7FpN1ObfP5GVpDdNYmFbBKouWc/RTRAtaCgJ8FYzkG0YtNxc/cWch5qUCGDm
 6kXNNzkXCMAj6sw/i/CRvklkzYxVe5CYDOAvraeVHpK6IEwllVm+t3/naXXyRZ0lok
 VbHBMidqvxSRg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:49 +0100
Subject: [PATCH v5 06/16] drm/tests: hdmi_state_helpers: Switch to new helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-6-aacf461d2157@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15615; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+LGiRKEcCcITA0C2Yd4YksjVY0vEpo6IKjVYAWJOpdQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7u+b67rULuXx8+TYz7+/LXtdE3nNgOdP/6UW16cvt
 Izyup+ydUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJzGBibLhst+uBM+eMxInh
 0x2COOIrDARXcq5rygycfn5Lw/KVO47e9dF6fHbPU7tM+emLLzodEWSsszsw6by4pp3owWNc+gc
 vhOnw+/NOtN3oG3U0xOYCf/+zuheX1Z5fW63OoLRyHa+NZYYpAA==
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

We introduced a new helper that supersedes the light_up_connector()
function in drm_hdmi_state_helper_test, so let's convert all our tests
to it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 158 ++++++++++++---------
 1 file changed, 92 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e97efd3af9ed18e6cf8ee66b4923dfc805b34e19..7ffd666753b10bc991894e238206a3c5328d0e23 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -53,53 +53,10 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	mutex_unlock(&drm->mode_config.mutex);
 
 	return preferred;
 }
 
-static int light_up_connector(struct kunit *test,
-			      struct drm_device *drm,
-			      struct drm_crtc *crtc,
-			      struct drm_connector *connector,
-			      struct drm_display_mode *mode,
-			      struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_atomic_state *state;
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
-	int ret;
-
-	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
-
-retry:
-	conn_state = drm_atomic_get_connector_state(state, connector);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
-
-	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
-	if (ret == -EDEADLK) {
-		drm_atomic_state_clear(state);
-		ret = drm_modeset_backoff(ctx);
-		if (!ret)
-			goto retry;
-	}
-	KUNIT_EXPECT_EQ(test, ret, 0);
-
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
-
-	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
-	KUNIT_EXPECT_EQ(test, ret, 0);
-
-	crtc_state->enable = true;
-	crtc_state->active = true;
-
-	ret = drm_atomic_commit(state);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	return 0;
-}
-
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
 			      const char *edid, size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
 		connector_to_priv(connector);
@@ -296,11 +253,14 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -362,11 +322,14 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -430,11 +393,14 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -487,11 +453,14 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -545,11 +514,14 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -604,11 +576,14 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -664,11 +639,14 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -723,11 +701,14 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -787,11 +768,14 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -863,11 +847,14 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -939,11 +926,14 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -986,11 +976,14 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1035,11 +1028,14 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1084,11 +1080,14 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1132,11 +1131,14 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
 	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
 
@@ -1206,11 +1208,14 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1280,11 +1285,14 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1345,11 +1353,14 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1412,11 +1423,14 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1481,11 +1495,14 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1541,11 +1558,14 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1603,11 +1623,14 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1643,11 +1666,14 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, &ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     &ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 

-- 
2.48.1

