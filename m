Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84072A3A8C6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0F410E122;
	Tue, 18 Feb 2025 20:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rx/OCe1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690CD10E122
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 20:26:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B3385C6275;
 Tue, 18 Feb 2025 20:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1FBC4CEE2;
 Tue, 18 Feb 2025 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739910369;
 bh=5DLaOElvayKi697+1fM6Gb85nhcVFIWfpDVukyePrFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rx/OCe1XJiDuB/x1/8n9vHoeppQk7j3nECaNkzaVI+fUthdRXf3RcUi6w2Pkp5geW
 vpul8w0I6UhCZ1SFSnDXDpiH4Qlw6PAem4rxPLLW992M/L/dMhk6yheG1ZYyG3xBI6
 6vgALKBQCDlSnptqSa/doaMOIRkporXD4qz/9AIkriHKJDw2NBCAew4DgHk6UloiYF
 XMO6acW16d/NX2xDILm9/dero2ES8SPm9wZwDFXiBT7kB09s9z1gBT1YSYqcxhqPBV
 citB9tNevxNqZscDL+HGT+z7PwDBgy/SjwNHof7esxLLRXZEGNCfC2fNW2EUwSw8EK
 PIJyENgEhHE7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 30/31] drm/tests: hdmi: Reorder DRM entities
 variables assignment
Date: Tue, 18 Feb 2025 15:24:50 -0500
Message-Id: <20250218202455.3592096-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit
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

From: Maxime Ripard <mripard@kernel.org>

[ Upstream commit 6b6bfd63e1626ceedc738b2a06505aa5b46c1481 ]

The tests all deviate slightly in how they assign their local pointers
to DRM entities. This makes refactoring pretty difficult, so let's just
move the assignment as soon as the entities are allocated.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20250129-test-kunit-v2-3-fe59c43805d5@kernel.org
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Stable-dep-of: 5d14c08a4746 ("drm/tests: hdmi: Fix recursive locking")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/tests/drm_hdmi_state_helper_test.c    | 81 ++++++++++---------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index ac653346e766b..49a0a5e742921 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -251,15 +251,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -314,15 +315,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -377,6 +379,8 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
@@ -387,8 +391,6 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -488,6 +490,8 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
@@ -498,8 +502,6 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -603,6 +605,8 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
@@ -613,8 +617,6 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -720,6 +722,8 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
@@ -732,8 +736,6 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -794,6 +796,8 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
@@ -806,8 +810,6 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -865,6 +867,8 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_dvi_1080p,
@@ -880,8 +884,6 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -912,6 +914,8 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
@@ -925,8 +929,6 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -959,6 +961,8 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
@@ -972,8 +976,6 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1006,6 +1008,8 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
@@ -1019,8 +1023,6 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1057,15 +1059,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1113,6 +1116,8 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
@@ -1136,8 +1141,6 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1182,6 +1185,8 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
@@ -1208,8 +1213,6 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1305,6 +1308,8 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
@@ -1336,8 +1341,6 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1372,6 +1375,8 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
@@ -1403,8 +1408,6 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1438,6 +1441,8 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
@@ -1461,8 +1466,6 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1498,6 +1501,8 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	drm = &priv->drm;
+	crtc = priv->crtc;
 	conn = &priv->connector;
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_340mhz,
@@ -1521,8 +1526,6 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
-	drm = &priv->drm;
-	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-- 
2.39.5

