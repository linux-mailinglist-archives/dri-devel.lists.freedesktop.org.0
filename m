Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03EA714A5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B0810E69F;
	Wed, 26 Mar 2025 10:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PeFvgVGw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B3110E69F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984415;
 bh=emC1Ap/GyYEiZF9+ueiI+N364GJu+ISfmPEzU6k0TqQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PeFvgVGwyQafHYULtLhzNKltRkaaXKtNVebk1xbetqan/Vrtx+36b2Gr4iPNWz8q0
 5a1YbJP4mgYNbYSVq2Ljafn4w3HG61/Vp4rQz6SAkF727EXBi1RLF74OcauNY59kV7
 jxPKTr6ksm58egQBpEz3Vii8w/SnyK7inuYcTu6n4kydUgzFw7iu0IfPCqP+82Op3V
 UjLB2uPkEm4++sroyAEdprGB/+tNOQ7bWQfdz6sZ65eZ5iyA5wHgLWIQlhIGkXR/Ph
 4Kpow6g3aqpAmRJDbFbcFiTBsPw9Z6L5ENLCHYlsLarXL25D5uxEOLVJ79z8NuXxqI
 QthgN9lBAU4lA==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 5736A17E0B9D;
 Wed, 26 Mar 2025 11:20:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:20:04 +0200
Subject: [PATCH v3 15/15] drm/tests: hdmi: Add test for unsuccessful forced
 fallback to YUV420
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-15-294d3ebbb4b2@collabora.com>
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

Provide test to verify a forced fallback to YUV420 output cannot succeed
when driver doesn't advertise YUV420 support.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 99bedb2d6f555b3b140256000dfa7491d2a8f515..c2976b42aa2aacd2a68a871bffe97e795ca713d4 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1493,6 +1493,51 @@ static void drm_test_check_max_tmds_rate_format_fallback_yuv420(struct kunit *te
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that if a driver supports only RGB, but the chosen mode can be
+ * supported by the screen only in YUV420 output format, we end up with
+ * an unsuccessful forced fallback attempt.
+ */
+static void drm_test_check_driver_unsupported_fallback_yuv420(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_display_info *info;
+	struct drm_display_mode *yuv420_only_mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				12,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_FALSE(test, conn->ycbcr_420_allowed);
+
+	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
+	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
+						     crtc, conn,
+						     yuv420_only_mode,
+						     &ctx);
+	KUNIT_EXPECT_LT(test, ret, 0);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 /*
  * Test that if a driver and screen supports RGB and YUV formats, and we
  * try to set the VIC 1 mode, we end up with 8bpc RGB even if we could
@@ -1884,6 +1929,7 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback_yuv422),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback_yuv420),
+	KUNIT_CASE(drm_test_check_driver_unsupported_fallback_yuv420),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_dvi),

-- 
2.49.0

