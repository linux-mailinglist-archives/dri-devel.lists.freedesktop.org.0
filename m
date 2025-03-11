Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570DA5BE52
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E4610E561;
	Tue, 11 Mar 2025 10:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S0zH9qhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B4F10E561
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741690684;
 bh=m12YxcYWc+9SFb2yUXZbsZJ4A3lF1Cu0QDtjyLDBXSs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=S0zH9qhvNtGn2QH8qWUpS52zBPsT5egUPdPD8c6vRLEfEVq32fuu820II3PnFpYpP
 HB7QSA1YPHuBFRQsAJeUTUXoJkXtLGU3bFQcxO3jVsGayuf3+/6XXVU86CIUkNO2cU
 0ggNtVIfirueWni3x074sPUS6dWedEPKAtCbslb2U7g+gmULj2CgYzS/j+fPURQ29o
 GRSyAxRCxi9DKhoWptjYARzJnLjmCrjuFLPcPQ14TSr8zvdNBBqVqI1REgfcORteZG
 yiI+b6Hed5+nBFgqEzTvPAmSqJktkfWorL6FNaopgL0YvgMl81xo1nkx4WiU3Aj57F
 1EKjTe0s3z/sQ==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2715717E1511;
 Tue, 11 Mar 2025 11:58:04 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Mar 2025 12:57:37 +0200
Subject: [PATCH v2 5/7] drm/tests: hdmi: Add macros to simplify EDID setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-hdmi-conn-yuv-v2-5-fbdb94f02562@collabora.com>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
In-Reply-To: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
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

Introduce a few macros to facilitate setting custom (i.e. non-default)
EDID data during connector initialization.

This helps reducing boilerplate code while also drops some redundant
calls to set_connector_edid().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 245 ++++++++-------------
 1 file changed, 93 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index e97efd3af9ed18e6cf8ee66b4923dfc805b34e19..a3f7f3ce31c73335c2c2643bdc5395b6ceb6f071 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -183,10 +183,12 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+connector_hdmi_init_funcs_set_edid(struct kunit *test,
+				   unsigned int formats,
+				   unsigned int max_bpc,
+				   const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				   const char *edid_data,
+				   size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -240,30 +242,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
 
 	drm_mode_config_reset(drm);
 
+	if (edid_data && edid_len) {
+		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
+		KUNIT_ASSERT_GT(test, ret, 0);
+	}
+
 	return priv;
 }
 
-static
-struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init(struct kunit *test,
-				     unsigned int formats,
-				     unsigned int max_bpc)
-{
-	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	int ret;
+#define drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, edid) \
+	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  formats, max_bpc,
-							  &dummy_connector_hdmi_funcs);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bpc, funcs)		\
+	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, NULL, 0)
 
-	ret = set_connector_edid(test, &priv->connector,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
+#define drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max_bpc, edid)		\
+	drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, formats, max_bpc,		\
+							    &dummy_connector_hdmi_funcs, edid)
 
-	return priv;
-}
+#define drm_kunit_helper_connector_hdmi_init(test, formats, max_bpc)				\
+	drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max_bpc,			\
+						      test_edid_hdmi_1080p_rgb_max_200mhz)
 
 /*
  * Test that if we change the RGB quantization property to a different
@@ -771,19 +770,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
 
@@ -847,19 +842,15 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
 
@@ -918,21 +909,17 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
 
@@ -969,19 +956,15 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1018,19 +1001,15 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    10);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1067,19 +1046,15 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1179,19 +1154,15 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1248,21 +1219,17 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1313,20 +1280,16 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1377,19 +1340,15 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1444,21 +1403,17 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1514,19 +1469,15 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1574,21 +1525,17 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB) |
-						    BIT(HDMI_COLORSPACE_YUV422) |
-						    BIT(HDMI_COLORSPACE_YUV444),
-						    12);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
@@ -1906,9 +1853,9 @@ static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
 	int ret;
 
 	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_100_MHz_connector_hdmi_funcs);
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_100_MHz_connector_hdmi_funcs);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1943,9 +1890,9 @@ static void drm_test_check_mode_valid_reject(struct kunit *test)
 	int ret;
 
 	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  BIT(HDMI_COLORSPACE_RGB),
-							  8,
-							  &reject_connector_hdmi_funcs);
+					BIT(HDMI_COLORSPACE_RGB),
+					8,
+					&reject_connector_hdmi_funcs);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1970,20 +1917,14 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_display_mode *preferred;
-	int ret;
 
-	priv = drm_kunit_helper_connector_hdmi_init(test,
-						    BIT(HDMI_COLORSPACE_RGB),
-						    8);
+	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
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
2.48.1

