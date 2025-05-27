Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6AAC4E6F
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C5110E4D8;
	Tue, 27 May 2025 12:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V4auGwRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7C10E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347897;
 bh=ztV+12rydUJsG7fHN8tZ18UBlJrT90/y+3ZYYbTzYS4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V4auGwRQVWlbLTB02vj9xgFim1Cex3R0ctXyP1FjC5I0K2vqd1hnA2p9VnPlGRtTh
 T6UPVtsYBOi274QLqAu07uodf5/zIomLmjPuQOjS/reWANEKrf+uD32yKIw35YHd6g
 rJrB5O4LVf27eQpA+W8kOAmd4Rva2jDQmZ43Y0CuodBh8jG//s2zOqt538fayzPBxW
 HN3yO2eXJLb7fxgYjIre9lzKazz765oRwIVLlAYZ+blvJ/e3aCvRTdZsFslvUgFSzr
 QluxcY7noLJ39dRqP84mmjG9sfhKcxQZB24Ydspucy+P3N6m4IdkYgsRzDsSS7NhS/
 e3xdQkPn+0Njw==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E10A517E1509;
 Tue, 27 May 2025 14:11:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:26 +0300
Subject: [PATCH v5 18/19] drm/tests: hdmi: Add max TMDS rate fallback tests
 for YUV420 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-18-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
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

Provide tests to verify drm_atomic_helper_connector_hdmi_check() helper
fallback behavior when using YUV420 output format.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c6f7c33f5f7142d6ee80970f73e9757fbc08b3d5..d98fb9803b46902016747f3fc9701eacd493d473 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1309,6 +1309,80 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if:
+ * - We have an HDMI connector and a display supporting both RGB and YUV420
+ * - The chosen mode can be supported in YUV420 output format only
+ * - The chosen mode has a TMDS character rate higher than the display
+ *   supports in YUV420/12bpc
+ * - The chosen mode has a TMDS character rate lower than the display
+ *   supports in YUV420/10bpc.
+ *
+ * Then we will pick the latter, and the computed TMDS character rate
+ * will be equal to 1.25 * 0.5 times the mode pixel clock.
+ */
+static void drm_test_check_max_tmds_rate_bpc_fallback_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *yuv420_only_mode;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
+
+	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
+	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
+
+	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 10, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, conn,
+						     yuv420_only_mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, yuv420_only_mode->clock * 625);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if:
  * - We have an HDMI connector supporting both RGB and YUV422 and up to
@@ -1382,6 +1456,84 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if:
+ * - We have an HDMI connector supporting both RGB and YUV420 and up to
+ *   12 bpc
+ * - The chosen mode has a TMDS character rate higher than the display
+ *   supports in RGB/10bpc but lower than the display supports in
+ *   RGB/8bpc
+ * - The chosen mode has a TMDS character rate lower than the display
+ *   supports in YUV420/12bpc.
+ *
+ * Then we will prefer to keep the RGB format with a lower bpc over
+ * picking YUV420.
+ */
+static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
+	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_also(info, preferred));
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, conn,
+						     preferred, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if a driver and screen supports RGB and YUV formats, and we
  * try to set the VIC 1 mode, we end up with 8bpc RGB even if we could
@@ -1775,7 +1927,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_disable_connector),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_rgb),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422),
+	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

