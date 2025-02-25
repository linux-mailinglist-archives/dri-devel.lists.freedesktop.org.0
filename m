Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5AA4468B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5610E783;
	Tue, 25 Feb 2025 16:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mT/rZZdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C0E10E751
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A633612B7;
 Tue, 25 Feb 2025 16:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF5CC4CEEF;
 Tue, 25 Feb 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501858;
 bh=crnqJbWVQgBQt6KvimjOUXmWO3DyHGffspSB6DHDV9w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mT/rZZdNW24f3Hbmm892cwY/A3stWFqgv3iZVolPhm4Y0XLsK4T8fBI/xFFiuJ6em
 RdNgvk5cw4PVeKFyNfHsI0ySMWiIVFNi3YyYPvWP3Lep4l5mWoG9RzRtIiTp/Iq9wM
 lmRuRMEalble6qnJwOPEmWUd01HCYYp+CxMs8gRlclXC5gfmZ3SPdxdMX2lmwepx52
 0qrD0Xy5qU6WOp6FyPrs/nQGjYGJe4Gl5K5GuYjiyKYi+JkLXOpuU0hBZ/lhrMthe2
 84oozw9C/jbEeAPHQMaZbMnZ68Hlz2vAOGdpdtSBaHC9Y6dTfI15eqiiKLXDfrgTmn
 gQFedZ8mG7y/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 25 Feb 2025 17:43:53 +0100
Subject: [PATCH v4 05/15] drm/tests: helpers: Create new helper to enable
 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-bridge-connector-v4-5-7ecb07b09cad@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19418; i=mripard@kernel.org;
 h=from:subject:message-id; bh=crnqJbWVQgBQt6KvimjOUXmWO3DyHGffspSB6DHDV9w=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOl7P/v863G1m7SI/5hNbUu0O1f+83kd1T+qZ78puvSzT
 itNoaS4YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkiw9jndZ/+/ApDvprW+qn
 OuxZs46nyX/DRPUkZefNnX82Zpkuezl9Ybe2J/+3ij8lW77r+RimMDa0BUh17HlV0ya//+SqyfY
 7OZiaH7B83Drx3x218j9P1oR3973t8iziO22zoXHRMimRLA4A
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++--------
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  61 +++++++++
 include/drm/drm_kunit_helpers.h                    |   8 ++
 3 files changed, 161 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index b976a5e9aef58a26a1ef1a8d506010f3639d6c92..a255f6b45f4c82b30331766400912493ad9d3126 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -53,46 +53,10 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
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
-	conn_state = drm_atomic_get_connector_state(state, connector);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
-
-	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
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
@@ -289,11 +253,14 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -352,11 +319,14 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -418,11 +388,14 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -474,11 +447,14 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -530,11 +506,14 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -588,11 +567,14 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -646,11 +628,14 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -704,11 +689,14 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -766,11 +754,14 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -840,11 +831,14 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
@@ -914,11 +908,14 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -959,11 +956,14 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1006,11 +1006,14 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1053,11 +1056,14 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1098,11 +1104,14 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	/* You shouldn't be doing that at home. */
 	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
 
@@ -1170,11 +1179,14 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1242,11 +1254,14 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1306,11 +1321,14 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	rate = mode->clock * 1500;
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     mode,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1371,11 +1389,14 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1438,11 +1459,14 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1496,11 +1520,14 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1556,11 +1583,14 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
 
@@ -1594,11 +1624,14 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
-	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     preferred,
+						     ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 3c0b7824c0be37ad628015d3bbc384eed0f5c239..266009e5c01a745a923cc6336a4487253a3249a3 100644
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
@@ -310,10 +311,70 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 
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
index afdd46ef04f70dcd1adedef2be302d67b508f035..cac903495d058fac4e7a1b77f1ff7a351c8f077a 100644
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
@@ -118,10 +119,17 @@ drm_kunit_helper_create_crtc(struct kunit *test,
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

