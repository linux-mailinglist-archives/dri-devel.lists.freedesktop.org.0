Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2918BE367
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2BC10F4EE;
	Tue,  7 May 2024 13:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="suK3KZoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B595B10F4D4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2991F61762;
 Tue,  7 May 2024 13:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6A8C4DDE1;
 Tue,  7 May 2024 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087887;
 bh=3hc6xccJubKkqL1r2eJQXdXTnAar50Miht9H8iOUArE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=suK3KZoiRkBmfMBG8mb0LZIAfhEwppzDazRQTFhnnVKU9cLs+3xb6qgovtazhaadJ
 QsXY4S13TmRPjuyzyQLnxCfGPgBJygC3qKh7f+QpfRVL16bpWzleICJbmwCMCiubtU
 ahEYJKJZ0/3yw3J0fFURZTE13v4NYXxNWOMZV1JbldFhlPJmqSdAbyrIeLMM75iIcg
 v6HcdZF039al8Pwj99C8BMqbbvxwWwZLkVU6phz8yTSv26R9aueeijmSLpNdmQIFJi
 3J9bFAtIS+Gb2YXvs4Cs+4Uwn2Qxahlj6CISkbFlXTp3tBYHFTPqghJUMGzq6M8fRh
 LMyFsewpFpDKg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:26 +0200
Subject: [PATCH v13 08/28] drm/tests: Add output formats tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-8-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8024; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3hc6xccJubKkqL1r2eJQXdXTnAar50Miht9H8iOUArE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmq/sjCL7034mnZxvOlX237d/Nb93Bry80fItv6x+2
 0zTt2JdHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi82wYGxb62Iq8OdiSc8bt
 ZGpZ2K55PVN0nz+IcF79M5Y7UeJLp3gP92kDJrVjz13rnx2/zhpgztiwyONEaLDbvJtf10w5rTm
 FNaD70ZFV827k2QSqTOdoSf8zqdd4//5bdeGFhUtVFkybJbEWAA==
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

Now that we track the HDMI output format as part of the connector state,
let's add a few tests to make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c         | 99 +++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 32 +++++++
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 9589867bdf7c..72f22ec951d6 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -346,10 +346,46 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	prop = priv->drm.mode_config.hdr_output_metadata_property;
 	KUNIT_ASSERT_NOT_NULL(test, prop);
 	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
 }
 
+/*
+ * Test that the registration of an HDMI connector with no supported
+ * format fails.
+ */
+static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       0,
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector not listing RGB as a
+ * supported format fails.
+ */
+static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_YUV422),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
  */
 static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
@@ -431,10 +467,12 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
+	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
+	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
 			 drm_connector_hdmi_init_type_invalid_gen_params),
@@ -508,13 +546,72 @@ static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.name = "drm_get_tv_mode_from_name",
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
+struct drm_hdmi_connector_get_output_format_name_test {
+	unsigned int kind;
+	const char *expected_name;
+};
+
+#define OUTPUT_FORMAT_TEST(_kind, _name)	\
+	{					\
+		.kind = _kind,			\
+		.expected_name = _name,		\
+	}
+
+static void drm_test_drm_hdmi_connector_get_output_format_name(struct kunit *test)
+{
+	const struct drm_hdmi_connector_get_output_format_name_test *params =
+		test->param_value;
+
+	KUNIT_EXPECT_STREQ(test,
+			   drm_hdmi_connector_get_output_format_name(params->kind),
+			   params->expected_name);
+}
+
+static const
+struct drm_hdmi_connector_get_output_format_name_test
+drm_hdmi_connector_get_output_format_name_valid_tests[] = {
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_RGB, "RGB"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV420, "YUV 4:2:0"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV422, "YUV 4:2:2"),
+	OUTPUT_FORMAT_TEST(HDMI_COLORSPACE_YUV444, "YUV 4:4:4"),
+};
+
+static void
+drm_hdmi_connector_get_output_format_name_valid_desc(const struct drm_hdmi_connector_get_output_format_name_test *t,
+						     char *desc)
+{
+	sprintf(desc, "%s", t->expected_name);
+}
+
+KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_output_format_name_valid,
+		  drm_hdmi_connector_get_output_format_name_valid_tests,
+		  drm_hdmi_connector_get_output_format_name_valid_desc);
+
+static void drm_test_drm_hdmi_connector_get_output_format_name_invalid(struct kunit *test)
+{
+	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_output_format_name(4));
+};
+
+static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_output_format_name,
+			 drm_hdmi_connector_get_output_format_name_valid_gen_params),
+	KUNIT_CASE(drm_test_drm_hdmi_connector_get_output_format_name_invalid),
+	{ }
+};
+
+static struct kunit_suite drm_hdmi_connector_get_output_format_name_test_suite = {
+	.name = "drm_hdmi_connector_get_output_format_name",
+	.test_cases = drm_hdmi_connector_get_output_format_name_tests,
+};
+
 kunit_test_suites(
 	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
-	&drm_get_tv_mode_from_name_test_suite
+	&drm_get_tv_mode_from_name_test_suite,
+	&drm_hdmi_connector_get_output_format_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 333c81b8cf4f..8bc1f9b0b12b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -347,10 +347,19 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
+	/*
+	 * TODO: We should have tests to check that a change in the
+	 * format triggers a CRTC mode change just like we do for the
+	 * RGB Quantization and BPC.
+	 *
+	 * However, we don't have any way to control which format gets
+	 * picked up aside from changing the BPC or mode which would
+	 * already trigger a mode change.
+	 */
 	{ }
 };
 
 static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
 	.name		= "drm_atomic_helper_connector_hdmi_check",
@@ -427,14 +436,37 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
 	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
 }
 
+/*
+ * Test that the value of the output format property out of reset is set
+ * to RGB, even if the driver supports more than that.
+ */
+static void drm_test_check_format_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB) |
+						     BIT(HDMI_COLORSPACE_YUV422) |
+						     BIT(HDMI_COLORSPACE_YUV444),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
 	KUNIT_CASE(drm_test_check_bpc_8_value),
 	KUNIT_CASE(drm_test_check_bpc_10_value),
 	KUNIT_CASE(drm_test_check_bpc_12_value),
+	KUNIT_CASE(drm_test_check_format_value),
 	{ }
 };
 
 static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
 	.name		= "drm_atomic_helper_connector_hdmi_reset",

-- 
2.45.0

