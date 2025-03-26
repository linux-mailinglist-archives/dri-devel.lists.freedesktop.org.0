Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1CA7149C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424DE10E696;
	Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fT88P8DW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7818510E697
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984409;
 bh=JY0o5v2vlBhjkX9Cg9CiF7H42fvwkyULxa0W+g4684g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fT88P8DWjUEgr4L9frZioVeQjoaQWBNH1SZjmeNb9JyMM1eA13eJYdLhz8OmtJIXQ
 RctLkJnhviR/w9E5+al/KNZx4Lc6rMoY6tNSBKjD69HXNe/Lbiy938ZqTibeTB+mpf
 GXa7kr8fBfDEQUje17NoP5XiRBibUmXTSI/VuFqGRNGDIcakn+ICvSitxtwqJ5w6v3
 PPZC9l4D3ZVMyQoLKVy1jWVaUBdCoijiWBDJlvAFtiOQtHpCjVjhHBT6obuic/a65k
 4cGe2EXYRbrqrBH5VrniqAeyQTmBhqXVRNq9AYlv2YO3MsGwo1GfO4K4TopWmTXq8K
 NUuna5ld/MP/w==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id EB84417E0A5D;
 Wed, 26 Mar 2025 11:20:08 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:59 +0200
Subject: [PATCH v3 10/15] drm/tests: hdmi: Replace open coded EDID setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-10-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
In-Reply-To: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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

Make use of the recently introduced macros to reduce boilerplate code
around EDID setup. This also helps dropping the redundant calls to
set_connector_edid().

No functional changes intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 220 ++++++++-------------
 1 file changed, 78 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 284bd9b1418a454d05c4a38263519eb8ae450090..7b2aaee5009ce58e6edf2649e2182c43ba834523 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -751,19 +751,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -830,19 +826,15 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -904,21 +896,17 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+					BIT(HDMI_COLORSPACE_RGB) |
+					BIT(HDMI_COLORSPACE_YUV422) |
+					BIT(HDMI_COLORSPACE_YUV444),
+					12,
+					test_edid_dvi_1080p);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_dvi_1080p,
-				 ARRAY_SIZE(test_edid_dvi_1080p));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
 
@@ -958,19 +946,15 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1010,19 +994,15 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				10,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1062,19 +1042,15 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
@@ -1180,19 +1156,15 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1252,21 +1224,17 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1320,20 +1288,16 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1387,19 +1351,15 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1457,21 +1417,17 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1530,19 +1486,15 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1593,21 +1545,17 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				test_edid_hdmi_1080p_rgb_max_340mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
 	conn = &priv->connector;
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_340mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_340mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
 	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
@@ -1926,28 +1874,20 @@ static void drm_test_check_mode_valid(struct kunit *test)
 static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
-	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_100mhz_connector_hdmi_funcs);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_100mhz_connector_hdmi_funcs,
+					test_edid_hdmi_1080p_rgb_max_200mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
-	conn = &priv->connector;
-
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	/*
 	 * Unlike the drm_test_check_mode_valid() here 1080p is rejected, but
 	 * 480p is allowed.
 	 */
-	preferred = find_preferred_mode(conn);
+	preferred = find_preferred_mode(&priv->connector);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
 	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
@@ -1965,12 +1905,14 @@ static void drm_test_check_mode_valid_reject(struct kunit *test)
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
+	unsigned char no_edid[] = {};
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_connector_hdmi_funcs);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_connector_hdmi_funcs,
+					no_edid);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1995,20 +1937,14 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
-	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				test_edid_hdmi_1080p_rgb_max_100mhz);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
-
-	ret = set_connector_edid(test, conn,
-				 test_edid_hdmi_1080p_rgb_max_100mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_100mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
 	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 100 * 1000);
 
 	preferred = find_preferred_mode(conn);

-- 
2.49.0

