Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA670A21EF9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4556410E800;
	Wed, 29 Jan 2025 14:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FhsWwlVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C007410E800
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:22:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A3CEA419B0;
 Wed, 29 Jan 2025 14:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0AAC4CED1;
 Wed, 29 Jan 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160536;
 bh=EhZYWNER23QUBxjobvk8JDtMawsPWxjBAGFhERxSkn4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FhsWwlVe5A/hk5pqHJDS4sferUKUeF21+5srLpiGs8jCVs69k3y8VuFH0q7cOJeCV
 yqKQBumrOe3hnzXCdPK+ViWeNQUBVG3P/vXZoWXSuLvkOoNGig9GwWyAK6NPNlArL4
 X3JiUhblVPaqf3J6/jwtDVSXLl4afPHYuarAHX5evcp4fG6LFpu3N3NBvVahvRvKbf
 y2p/fL2HAzyT7PzMiW7UufBnAygVHHRxtj4jiZHrNXZNfXdfKNnobc89wPInWxLV+q
 zzshHRULcQKuoQjOqNl7f0FUvSRLfu7JB4Y2bMbusEe7pZkFPmNef3mofgVnxMdWE/
 /9DYBzpkv+AsQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 29 Jan 2025 15:21:56 +0100
Subject: [PATCH v2 4/4] drm/tests: hdmi: Fix recursive locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-test-kunit-v2-4-fe59c43805d5@kernel.org>
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17211; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EhZYWNER23QUBxjobvk8JDtMawsPWxjBAGFhERxSkn4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmzLDuspKakTfzbuGXbZ+MFavERx9IPSU0vf3/jpcqLw
 1MkE1cldExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJdEkx1sp/KNu7eOpphddH
 3t+UEPhx9+OsG66T5E9qfNgrN3FCMFuhwubrbys183nmPM46V3nSfQtjwwc/rWOLEjf+N59X9JB
 V+VMRh/VKn4j5+u3nZGV7o55nqhSEXTG+9Z1n+6Fks/x1LrM6AA==
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

The find_preferred_mode() functions takes the mode_config mutex, but due
to the order most tests have, is called with the crtc_ww_class_mutex
taken. This raises a warning for a circular dependency when running the
tests with lockdep.

Reorder the tests to call find_preferred_mode before the acquire context
has been created to avoid the issue.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 114 ++++++++++-----------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c265d28631603f266ba606564e77b8f965b7f83b..037c19875daf8b9b13e7702c8640dde1547f817c 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -291,16 +291,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 
 	drm = &priv->drm;
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -355,16 +355,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 
 	drm = &priv->drm;
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -420,17 +420,17 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	drm = &priv->drm;
 	crtc = priv->crtc;
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -531,17 +531,17 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	drm = &priv->drm;
 	crtc = priv->crtc;
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -646,17 +646,17 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	drm = &priv->drm;
 	crtc = priv->crtc;
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -766,16 +766,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -840,16 +840,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
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
 
 	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
@@ -914,16 +914,16 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	KUNIT_ASSERT_GT(test, ret, 0);
 
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
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -958,17 +958,17 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
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
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1005,17 +1005,17 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
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
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1052,17 +1052,17 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
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
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1099,16 +1099,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 
 	drm = &priv->drm;
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
 
 	/* You shouldn't be doing that at home. */
 	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
@@ -1164,23 +1164,23 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1233,13 +1233,10 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
@@ -1249,10 +1246,13 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1295,13 +1295,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
 	/*
 	 * NOTE: We can't use drm_hdmi_compute_mode_clock()
@@ -1311,10 +1308,13 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	 * Thus, we have to calculate the rate by hand.
 	 */
 	rate = mode->clock * 1500;
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	crtc = priv->crtc;
 	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
@@ -1356,13 +1356,10 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	/*
 	 * We're making sure that YUV422 would be the preferred option
@@ -1377,10 +1374,13 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1423,13 +1423,10 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	/*
 	 * We're making sure that YUV422 would be the preferred option
@@ -1444,10 +1441,13 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
 
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1489,23 +1489,23 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	/*
 	 * We're making sure that we have headroom on the TMDS character
 	 * clock to actually use 12bpc.
 	 */
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
@@ -1549,23 +1549,23 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
 
-	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	/*
 	 * We're making sure that we have headroom on the TMDS character
 	 * clock to actually use 12bpc.
 	 */
 	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
 	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
 
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
 	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);

-- 
2.47.1

