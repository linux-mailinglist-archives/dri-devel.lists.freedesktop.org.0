Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C058D025B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 15:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970F910F4CF;
	Mon, 27 May 2024 13:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AAmj/kld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E54E10E95B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 13:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BC20DCE0F8B;
 Mon, 27 May 2024 13:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C45C2BBFC;
 Mon, 27 May 2024 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716818324;
 bh=kSiiMjjsZY7K9mTyS1MG3HJC7wR+Nx+5mIpcDTzOUiQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AAmj/kldZpDyJb1uwt4uNH4INUJIMYziJtVPV9R4wgycU0JpYU7pUX32R3xJIcoRn
 YBTZbpWGX4J5IAXnwxCTKJLlcfmdjVjVcGNLH+pj7kdudc3rtoaJwoKhVehMTqS/yd
 pV3cpZmtm+m28WCYepDDaEWQxQViYFhyRg51uPc5LJwA8aJEbvdHVb/PyzU9+nnewU
 Mz9X/vuTXJrr2ee5anxILxDcMIq6N3HTBdpowc/2P69UuZy7Efklgen+QmO0+AbhcY
 gSNtEnYs+CgMlr7Vh1ztm1M5NiyZw1okBGJQfp5pEUA8xYRMp0jNEzKjmMmwi3pp0T
 Kg2YMhetdUshg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:58:02 +0200
Subject: [PATCH v15 13/29] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-13-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12837; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kSiiMjjsZY7K9mTyS1MG3HJC7wR+Nx+5mIpcDTzOUiQ=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGZUkWWher5pzlPVp5RI1lbMAUZkiIrKKSEjpUf/ZgFtHFI4X
 YiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmZUkWUACgkQJ1/OGaI9vnbL3gF/XNdx
 4Cjm3Mc/5mBJ7RdpQp98cgOwdt/DISr1nqMAzo4IW/e4V92Uqsr1Vpq1p93zAYDl438rBfAHTo6
 F6zdkvIgNvBa5S9giBk8FkYbHsdSGWz/IyoDrDZo6Vqg94KxqPJE=
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

Most of the HDMI controllers have an upper TMDS character rate limit
they can't exceed. On "embedded"-grade display controllers, it will
typically be lower than what high-grade monitors can provide these days,
so drivers will filter the TMDS character rate based on the controller
capabilities.

To make that easier to handle for drivers, let's provide an optional
hook to be implemented by drivers so they can tell the HDMI controller
helpers if a given TMDS character rate is reachable for them or not.

This will then be useful to figure out the best format and bpc count for
a given mode.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  9 +++++++
 drivers/gpu/drm/drm_connector.c                    |  4 +++
 drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  4 +++
 include/drm/drm_connector.h                        | 31 ++++++++++++++++++++++
 5 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 08630561d864..063421835dba 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -51,15 +51,24 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 static enum drm_mode_status
 hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
 		 unsigned long long clock)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	const struct drm_display_info *info = &connector->display_info;
 
 	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
 		return MODE_CLOCK_HIGH;
 
+	if (funcs && funcs->tmds_char_rate_valid) {
+		enum drm_mode_status status;
+
+		status = funcs->tmds_char_rate_valid(connector, mode, clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
 static int
 hdmi_compute_clock(const struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b629c8e990f4..555eac20e5a4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -455,10 +455,11 @@ EXPORT_SYMBOL(drmm_connector_init);
 /**
  * drmm_connector_hdmi_init - Init a preallocated HDMI connector
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
@@ -474,10 +475,11 @@ EXPORT_SYMBOL(drmm_connector_init);
  * Zero on success, error code on failure.
  */
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
@@ -510,10 +512,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	connector->max_bpc = max_bpc;
 
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	connector->hdmi.funcs = hdmi_funcs;
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 8557f722080c..e44dfe2e9455 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -22,10 +22,13 @@ struct drm_connector_init_priv {
 	struct drm_device drm;
 	struct drm_connector connector;
 	struct i2c_adapter ddc;
 };
 
+static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+};
+
 static const struct drm_connector_funcs dummy_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.reset			= drm_atomic_helper_connector_reset,
 };
@@ -187,10 +190,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -205,10 +209,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -223,10 +228,11 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       9);
 	KUNIT_EXPECT_LT(test, ret, 0);
@@ -241,10 +247,11 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       0);
 	KUNIT_EXPECT_LT(test, ret, 0);
@@ -264,10 +271,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -303,10 +311,11 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       10);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -342,10 +351,11 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	uint64_t val;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       12);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -376,10 +386,11 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       0,
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
@@ -394,10 +405,11 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_YUV422),
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
@@ -413,10 +425,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
@@ -446,10 +459,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8ff53ee54e97..7f9a48902db4 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -110,10 +110,13 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	KUNIT_ASSERT_GT(test, ret, 0);
 
 	return 0;
 }
 
+static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
 		connector_to_priv(connector);
 	const struct drm_edid *edid;
@@ -192,10 +195,11 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
 
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
+				       &dummy_connector_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
 				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 54899c030031..3c0b6694074f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -36,10 +36,11 @@
 
 struct drm_connector_helper_funcs;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 struct drm_crtc;
+struct drm_display_mode;
 struct drm_encoder;
 struct drm_panel;
 struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
@@ -1055,10 +1056,34 @@ struct drm_connector_state {
 		 */
 		unsigned long long tmds_char_rate;
 	} hdmi;
 };
 
+/**
+ * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_hdmi_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+};
+
 /**
  * struct drm_connector_funcs - control connectors on a given device
  *
  * Each CRTC may have one or more connectors attached to it.  The functions
  * below allow the core DRM code to control connectors, enumerate available modes,
@@ -1923,10 +1948,15 @@ struct drm_connector {
 		/**
 		 * @supported_formats: Bitmask of @hdmi_colorspace
 		 * supported by the controller.
 		 */
 		unsigned long supported_formats;
+
+		/**
+		 * @funcs: HDMI connector Control Functions
+		 */
+		const struct drm_connector_hdmi_funcs *funcs;
 	} hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
 
@@ -1945,10 +1975,11 @@ int drmm_connector_init(struct drm_device *dev,
 			int connector_type,
 			struct i2c_adapter *ddc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);

-- 
2.45.0

