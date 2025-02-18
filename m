Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF650A3A8C7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238B410E757;
	Tue, 18 Feb 2025 20:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ERoFO7My";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7955610E757
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 20:26:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D4ED5C6275;
 Tue, 18 Feb 2025 20:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421D4C4CEE2;
 Tue, 18 Feb 2025 20:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739910376;
 bh=snTcBP13Eanpe9XjiQzDvd2KlamQiUoa1H1lH/77FWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERoFO7MyUl8FsFSDO3yv+XBd98uOma8U6VJBSyZuZTq51fg5OF+FHn64ca72qPm4X
 gWHId6NK0pnNG6aV4p7765UZ+D7yRXktmRpnTDuB/CwtvFKKiePLU5L4gfRr63648Z
 k8lWbMRU3mPP6p6qF+XRBIL17a25QddRSBYcftB1QLezFk7l6AOyHXIRjxN7CJuivq
 zv6EazWPdyPikSLGEOQ46cCO2QLFO9QqqYekhVwecmqV3m9AYut/d5730ByAuoyvEV
 ANln3foyXjtfVO2ctLK0iD0zS628YPIHYfK+lVdR8dYCtNH+QeUkCi+Uipfw/BaJ+v
 IX7WO7t0ARkjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 31/31] drm/tests: hdmi: Fix recursive locking
Date: Tue, 18 Feb 2025 15:24:51 -0500
Message-Id: <20250218202455.3592096-31-sashal@kernel.org>
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

[ Upstream commit 5d14c08a47460e8eedf0185a28b116420ea7f29d ]

The find_preferred_mode() functions takes the mode_config mutex, but due
to the order most tests have, is called with the crtc_ww_class_mutex
taken. This raises a warning for a circular dependency when running the
tests with lockdep.

Reorder the tests to call find_preferred_mode before the acquire context
has been created to avoid the issue.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20250129-test-kunit-v2-4-fe59c43805d5@kernel.org
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/tests/drm_hdmi_state_helper_test.c    | 114 +++++++++---------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 49a0a5e742921..0bdba1bc585e8 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -255,12 +255,12 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	crtc = priv->crtc;
 	conn = &priv->connector;
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -319,12 +319,12 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	crtc = priv->crtc;
 	conn = &priv->connector;
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -384,13 +384,13 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -495,13 +495,13 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -610,13 +610,13 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	conn = &priv->connector;
 	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -730,12 +730,12 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -804,12 +804,12 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -878,12 +878,12 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	info = &conn->display_info;
 	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -922,13 +922,13 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -969,13 +969,13 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1016,13 +1016,13 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1063,12 +1063,12 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	crtc = priv->crtc;
 	conn = &priv->connector;
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -1128,9 +1128,6 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1141,6 +1138,9 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1197,9 +1197,6 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1213,6 +1210,9 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1259,9 +1259,6 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
@@ -1275,6 +1272,9 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	rate = mode->clock * 1500;
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -1320,9 +1320,6 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -1341,6 +1338,9 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1387,9 +1387,6 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -1408,6 +1405,9 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1453,9 +1453,6 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -1466,6 +1463,9 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -1513,9 +1513,6 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -1526,6 +1523,9 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-- 
2.39.5

