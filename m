Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C094487820D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5DF10FC68;
	Mon, 11 Mar 2024 14:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g5/oMlIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1780510F138
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:50:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D829F60EBC;
 Mon, 11 Mar 2024 14:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562AAC43399;
 Mon, 11 Mar 2024 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710168606;
 bh=CjIGYTbMXVCqb3XcBIX9A123T+vivJfkGlKpICpmC2k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g5/oMlIubhSeW1B2smF0/CI/QbzSzy8nDue4iZqfCebGwJxg14bY1ZH5JKRwaNKHc
 uVN5MPSENnqg+8BH0bf+iPWp7O6+vX02BruS5df+oPKnpARtXuvB1TxylceYabXe0N
 uFLHa0ILkKHMRLA8a3ATYtzxzINtcfu/Q7qItRm83i/yNSNHiCSxzakyhHKEWgm34h
 S7Zh8CH6sMp6PK+uwsawuIMpHU8TA8Zirdf4cDGHOFG40+qbg8nIz5Y4DF3sJsEZhx
 gfslY4KA0DCIvDCQc1wd06EPsheQqwOdYXmcnwH6KSNOpouIPxqzMGT25B4mqlTz2D
 Iw2P8e5c30a1g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:30 +0100
Subject: [PATCH v9 02/27] drm/tests: connector: Add tests for
 drmm_connector_hdmi_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-2-d45890323344@kernel.org>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5120; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CjIGYTbMXVCqb3XcBIX9A123T+vivJfkGlKpICpmC2k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpVhf7L0052D+ouA5+8S8bF+veO3akh8pJ/3EVrAlx
 OplIo9+RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayfQLD/7S3OulSB7+2LfVc
 /31dSHy7wOvfx5j5Jhg9d3N5zDHnNj/D/xyNHiExpuyQXS/MxV0Pp0TFlbLJ7v/UZ2zPnhl9zHg
 9OwA=
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

We just introduced a new initialization function for our connectors, so
let's build a kunit test suite for it as well.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 44f82ed2a958..261d4109946d 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -170,10 +170,132 @@ static struct kunit_suite drmm_connector_init_test_suite = {
 	.name = "drmm_connector_init",
 	.init = drm_test_connector_init,
 	.test_cases = drmm_connector_init_tests,
 };
 
+/*
+ * Test that the registration of a bog standard connector works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_connector_hdmi_init_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector without a DDC adapter
+ * doesn't report any error.
+ */
+static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector with an HDMI
+ * connector type succeeds.
+ */
+static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	unsigned int connector_type = *(unsigned int *)test->param_value;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       connector_type,
+				       &priv->ddc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static const unsigned int drm_connector_hdmi_init_type_valid_tests[] = {
+	DRM_MODE_CONNECTOR_HDMIA,
+	DRM_MODE_CONNECTOR_HDMIB,
+};
+
+static void drm_connector_hdmi_init_type_desc(const unsigned int *type, char *desc)
+{
+	sprintf(desc, "%s", drm_get_connector_type_name(*type));
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_valid,
+		  drm_connector_hdmi_init_type_valid_tests,
+		  drm_connector_hdmi_init_type_desc);
+
+/*
+ * Test that the registration of an HDMI connector with an !HDMI
+ * connector type fails.
+ */
+static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	unsigned int connector_type = *(unsigned int *)test->param_value;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       connector_type,
+				       &priv->ddc);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+static const unsigned int drm_connector_hdmi_init_type_invalid_tests[] = {
+	DRM_MODE_CONNECTOR_Unknown,
+	DRM_MODE_CONNECTOR_VGA,
+	DRM_MODE_CONNECTOR_DVII,
+	DRM_MODE_CONNECTOR_DVID,
+	DRM_MODE_CONNECTOR_DVIA,
+	DRM_MODE_CONNECTOR_Composite,
+	DRM_MODE_CONNECTOR_SVIDEO,
+	DRM_MODE_CONNECTOR_LVDS,
+	DRM_MODE_CONNECTOR_Component,
+	DRM_MODE_CONNECTOR_9PinDIN,
+	DRM_MODE_CONNECTOR_DisplayPort,
+	DRM_MODE_CONNECTOR_TV,
+	DRM_MODE_CONNECTOR_eDP,
+	DRM_MODE_CONNECTOR_VIRTUAL,
+	DRM_MODE_CONNECTOR_DSI,
+	DRM_MODE_CONNECTOR_DPI,
+	DRM_MODE_CONNECTOR_WRITEBACK,
+	DRM_MODE_CONNECTOR_SPI,
+	DRM_MODE_CONNECTOR_USB,
+};
+
+KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
+		  drm_connector_hdmi_init_type_invalid_tests,
+		  drm_connector_hdmi_init_type_desc);
+
+static struct kunit_case drmm_connector_hdmi_init_tests[] = {
+	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
+	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
+			 drm_connector_hdmi_init_type_valid_gen_params),
+	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
+			 drm_connector_hdmi_init_type_invalid_gen_params),
+	{ }
+};
+
+static struct kunit_suite drmm_connector_hdmi_init_test_suite = {
+	.name = "drmm_connector_hdmi_init",
+	.init = drm_test_connector_init,
+	.test_cases = drmm_connector_hdmi_init_tests,
+};
+
 struct drm_get_tv_mode_from_name_test {
 	const char *name;
 	enum drm_connector_tv_mode expected_mode;
 };
 
@@ -234,10 +356,11 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.name = "drm_get_tv_mode_from_name",
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
 kunit_test_suites(
+	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
 	&drm_get_tv_mode_from_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");

-- 
2.43.2

