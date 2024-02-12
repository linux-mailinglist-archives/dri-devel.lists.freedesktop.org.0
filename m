Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE2851467
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D01910ED25;
	Mon, 12 Feb 2024 13:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bIlM9cqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4110ED24
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 28D78CE12AF;
 Mon, 12 Feb 2024 13:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9D6C43394;
 Mon, 12 Feb 2024 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743659;
 bh=ZZs3RiNqAbzKhZAn8FdhUoLV6Zsye/PNcQYJLT+nsKQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bIlM9cqTfDiaeJYbu39rmV8IEb4XPHqACpMyfNfToH5Vp19LTwGiHoT+MjQHJ9cMs
 da7M86muyqLHIz75QX+uC1RLkOM+WRnH0p4cK/V5c1aKsTGEapF69g/MSEpDjdKRcY
 FGEhj83nPRb7NgR/y0VY/o9jyvjTGWPIRKEVHX1D8HlPsL9ufvOw5NkNVVCgriMfgz
 q6mdSYKtlCF2l6adRm/CR7jHrqljshYhODZv4T4DbX+I7UElFRU0keeSaX1c+eUnQC
 c+oBgmI0sjwyIydgsM2+kdnOe9Ryy4QfeI/xgO94zgCJdnr+cOzdkfZ3/FDERjkaJX
 4CrmqtmJMsbCA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:13:01 +0100
Subject: [PATCH v6 18/36] drm/tests: Add HDMI TDMS character rate tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-18-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13298; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZZs3RiNqAbzKhZAn8FdhUoLV6Zsye/PNcQYJLT+nsKQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJDNl87Lmrs/4s+WcNQODycl3mn+yv4lzufNfsWkVq
 fPUW7S6o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABORaWNkWKO3YWn4yykvdsRM
 jHR4rdzXsulE+Dwt3TqOGU92P3p0NZuR4W/NocMTkz9lBS6R8boUeDdmzvu1e+4/3yzfePj/MpH
 MVXwA
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

The previous patch added an helper to compute the TMDS character rate on
an HDMI connector. Let's add a few tests to make sure it works as
expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 323 +++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index fa6fe8084107..0a838924a546 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -8,7 +8,9 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_kunit_helpers.h>
+#include <drm/drm_modes.h>
 
 #include <kunit/test.h>
 
@@ -719,10 +721,331 @@ static struct kunit_suite drm_connector_attach_broadcast_rgb_property_test_suite
 	.test_cases = drm_connector_attach_broadcast_rgb_property_tests,
 };
 
+/*
+ * Test that for a given mode, with 8bpc and an RGB output the TMDS
+ * character rate is equal to the mode pixel clock.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
+}
+
+/*
+ * Test that for a given mode, with 10bpc and an RGB output the TMDS
+ * character rate is equal to 1.25 times the mode pixel clock.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1250, rate);
+}
+
+/*
+ * Test that for the VIC-1 mode, with 10bpc and an RGB output the TMDS
+ * character rate computation fails.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc_vic_1(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, with 12bpc and an RGB output the TMDS
+ * character rate is equal to 1.5 times the mode pixel clock.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1500, rate);
+}
+
+/*
+ * Test that for the VIC-1 mode, with 12bpc and an RGB output the TMDS
+ * character rate computation fails.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc_vic_1(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a mode with the pixel repetition flag, the TMDS
+ * character rate is indeed double the mode pixel clock.
+ */
+static void drm_test_drm_connector_hdmi_compute_mode_clock_rgb_double(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 6);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_TRUE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) * 2, rate);
+}
+
+/*
+ * Test that the TMDS character rate computation for the VIC modes
+ * explicitly listed in the spec as supporting YUV420 succeed and return
+ * half the mode pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+	unsigned int vic = *(unsigned int *)test->param_value;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) / 2, rate);
+}
+
+static const unsigned int drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[] = {
+	96, 97, 101, 102, 106, 107,
+};
+
+static void drm_connector_hdmi_compute_mode_clock_yuv420_vic_desc(const unsigned int *vic, char *desc)
+{
+	sprintf(desc, "VIC %u", *vic);
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_hdmi_compute_mode_clock_yuv420_valid,
+		  drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests,
+		  drm_connector_hdmi_compute_mode_clock_yuv420_vic_desc);
+
+/*
+ * Test that trying to compute the TMDS char rate with the YUV420 format
+ * for a mode that doesn't support the YUV420 encoding returns an error.
+ *
+ * TODO: We should probably test this with all the VIC but the
+ * explicitly supported ones. Since the list of VIC is quite long and
+ * not linear, the best way to support it at the moment would be to
+ * create a custom gen_params function that would only return valid
+ * VICs. At the moment, that function expects to get a pointer back
+ * however, and compilers don't really like casting between integer and
+ * pointers.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_invalid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 42);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV420);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode listed supporting it and an YUV420 output
+ * with 10bpc, the TMDS character rate is equal to 0.625 times the mode
+ * pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned int vic =
+		drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+
+	KUNIT_EXPECT_EQ(test, mode->clock * 625, rate);
+}
+
+/*
+ * Test that for a given mode listed supporting it and an YUV420 output
+ * with 12bpc, the TMDS character rate is equal to 0.75 times the mode
+ * pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned int vic =
+		drm_connector_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+
+	KUNIT_EXPECT_EQ(test, mode->clock * 750, rate);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 8bpc and a YUV422 output fails.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 10bpc and a YUV422 output fails.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 12bpc and a YUV422 output succeeds and returns a rate equal
+ * to the mode pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_connector_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV422);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1000, rate);
+}
+
+static struct kunit_case drm_connector_hdmi_compute_mode_clock_tests[] = {
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb),
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc),
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_10bpc_vic_1),
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc),
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_12bpc_vic_1),
+	KUNIT_CASE(drm_test_drm_connector_hdmi_compute_mode_clock_rgb_double),
+	KUNIT_CASE_PARAM(drm_test_connector_hdmi_compute_mode_clock_yuv420_valid,
+			 drm_connector_hdmi_compute_mode_clock_yuv420_valid_gen_params),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_invalid),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc),
+	{ }
+};
+
+static struct kunit_suite drm_connector_hdmi_compute_mode_clock_test_suite = {
+	.name = "drm_test_connector_hdmi_compute_mode_clock",
+	.init = drm_test_connector_init,
+	.test_cases = drm_connector_hdmi_compute_mode_clock_tests,
+};
+
 kunit_test_suites(
 	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
 	&drm_connector_attach_broadcast_rgb_property_test_suite,
+	&drm_connector_hdmi_compute_mode_clock_test_suite,
 	&drm_get_tv_mode_from_name_test_suite,
 	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite,
 	&drm_hdmi_connector_get_output_format_name_test_suite

-- 
2.43.0

