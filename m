Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A3C932AD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D5B10E93E;
	Fri, 28 Nov 2025 21:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="NZbHEXjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F510E93E;
 Fri, 28 Nov 2025 21:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764364082; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W0wRcrmmJx5TV0wiGP3y8G0CADpZyebzywEeKT9Qu2O3RAYUWH1pWuLPjChwEi4FqF0fdhkIdumjn4IhFXO7B1SyHA/upBT2E1yiYWDo3T0SnywVbqr4xLu/PrI7t1vyzAk1chOPTXtHSqCfrKFb9WVb+1AMWh6q8TBa3ARur5M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764364082;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=G/TwWJgbgaJ4CV8gTMN/jzKwmmdChg5+47UVxWfc6AU=; 
 b=iPTCfclv0aGzId86DHKASv/9cZY8Eb9TOkuBUCESDywgdwD9+PQZ+q4OZq5iS1mQzlGY2eX1N24ej91pzq1hk6Wh2ckTCLf/TkiZMFpsgcp8/dSGpF53cNDGd8SD1wKyPJfp6FClh013tJd7rPDDFhJIo47UraIXJJ8COY0YFlM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364082; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=G/TwWJgbgaJ4CV8gTMN/jzKwmmdChg5+47UVxWfc6AU=;
 b=NZbHEXjT1kiPnE7l5lMpIarCRF3zWxpE+Se0Ul+zB3ze/1YVk4Sn/sEAcfvp5I8X
 13hWJXnwn3HrZ8cF5Ij7sHs5nmHNevurqboRp11sZRRAPCVuOpVRtKRYkT6g6SBWKxU
 OLnL0RN3zmdbPs1NIXRzmGuU9GKr9OpHDdxHpMsE=
Received: by mx.zohomail.com with SMTPS id 1764364081586438.6523800934766;
 Fri, 28 Nov 2025 13:08:01 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:53 +0100
Subject: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

Add some KUnit tests to check the color_format property is working as
expected with the HDMI state helper.

The added tests check that AUTO results in RGB, and the YCBCR modes
result in the corresponding YUV modes. An additional test ensures that
only DRM_COLOR_FORMAT_AUTO falls back to YUV420 with a YUV420-only mode,
and RGB errors out instead, while explicitly asking for YUV420 still
works.

This requires exporting hdmi_compute_config, so that it is accessible
from the tests.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   3 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 3 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 1800e00b30c5..e86fb837ceaf 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -641,7 +641,7 @@ hdmi_compute_format_bpc(const struct drm_connector *connector,
 	return -EINVAL;
 }
 
-static int
+int
 hdmi_compute_config(const struct drm_connector *connector,
 		    struct drm_connector_state *conn_state,
 		    const struct drm_display_mode *mode)
@@ -680,6 +680,7 @@ hdmi_compute_config(const struct drm_connector *connector,
 
 	return ret;
 }
+EXPORT_SYMBOL(hdmi_compute_config);
 
 static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
 				       struct drm_connector_state *conn_state)
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8bd412735000..e7050cd9cb12 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -55,6 +55,23 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	return preferred;
 }
 
+static struct drm_display_mode *find_420_only_mode(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+
+	mutex_lock(&drm->mode_config.mutex);
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (drm_mode_is_420_only(&connector->display_info, mode)) {
+			mutex_unlock(&drm->mode_config.mutex);
+			return mode;
+		}
+	}
+	mutex_unlock(&drm->mode_config.mutex);
+
+	return NULL;
+}
+
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
 			      const void *edid, size_t edid_len)
 {
@@ -1999,6 +2016,95 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+struct color_format_test_param {
+	enum drm_color_format fmt;
+	enum hdmi_colorspace expected;
+	const char *desc;
+};
+
+/* Test that AUTO results in RGB, and explicit choices result in those */
+static void drm_test_check_hdmi_color_format(struct kunit *test)
+{
+	const struct color_format_test_param *param = test->param_value;
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV420) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn_state = priv->connector.state;
+	info = &priv->connector.display_info;
+	conn_state->color_format = param->fmt;
+	KUNIT_ASSERT_TRUE(test, priv->connector.ycbcr_420_allowed);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420(info, preferred));
+
+	ret = hdmi_compute_config(&priv->connector, conn_state, preferred);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, param->expected);
+}
+
+static const struct color_format_test_param hdmi_color_format_params[] = {
+	{ DRM_COLOR_FORMAT_AUTO, HDMI_COLORSPACE_RGB, "AUTO -> RGB" },
+	{ DRM_COLOR_FORMAT_YCBCR422, HDMI_COLORSPACE_YUV422, "YCBCR422 -> YUV422" },
+	{ DRM_COLOR_FORMAT_YCBCR420, HDMI_COLORSPACE_YUV420, "YCBCR420 -> YUV420" },
+	{ DRM_COLOR_FORMAT_YCBCR444, HDMI_COLORSPACE_YUV444, "YCBCR444 -> YUV444" },
+	{ DRM_COLOR_FORMAT_RGB444, HDMI_COLORSPACE_RGB, "RGB -> RGB" },
+};
+
+KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format,
+		  hdmi_color_format_params, desc);
+
+
+/* Test that AUTO falls back to YUV420, and that RGB does not, but YUV420 works */
+static void drm_test_check_hdmi_color_format_420_only(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_display_mode *dank;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV420) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn_state = priv->connector.state;
+
+	dank = find_420_only_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, dank);
+
+	conn_state->color_format = DRM_COLOR_FORMAT_AUTO;
+	ret = hdmi_compute_config(&priv->connector, conn_state, dank);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
+
+	conn_state->color_format = DRM_COLOR_FORMAT_RGB444;
+	ret = hdmi_compute_config(&priv->connector, conn_state, dank);
+	KUNIT_EXPECT_LT(test, ret, 0);
+
+	conn_state->color_format = DRM_COLOR_FORMAT_YCBCR420;
+	ret = hdmi_compute_config(&priv->connector, conn_state, dank);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
+};
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -2028,6 +2134,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),
+	KUNIT_CASE_PARAM(drm_test_check_hdmi_color_format,
+			 check_hdmi_color_format_gen_params),
+	KUNIT_CASE(drm_test_check_hdmi_color_format_420_only),
 	/*
 	 * TODO: We should have tests to check that a change in the
 	 * format triggers a CRTC mode change just like we do for the
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2349c0d0f00f..01ae31209820 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -30,4 +30,8 @@ enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode);
 
+int hdmi_compute_config(const struct drm_connector *connector,
+			struct drm_connector_state *conn_state,
+			const struct drm_display_mode *mode);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.52.0

