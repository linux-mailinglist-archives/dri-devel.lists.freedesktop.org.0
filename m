Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5C87821F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA8112AC1;
	Mon, 11 Mar 2024 14:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BGvxM+h6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0F112ABC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:50:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69E17CE10FF;
 Mon, 11 Mar 2024 14:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41901C433F1;
 Mon, 11 Mar 2024 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710168635;
 bh=2vPwPO8kvi7SoILxLke9m0YI6xFI1AJM4npOguVc2BY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BGvxM+h6ShklFtRT+UmCyAcH3rIh2e/3i+xr27U1pbYT93bNEIlgOInkvEFfHVtL1
 PZo++MzBWMRHGYvMzOu+FVTrhJ36SAD8Pr+3w5i+j+UvUxdoX9o+FyQ3CBqRbgRBLh
 jB/1P61L/PvIfQ4mzLOjfMLP1TouoM2bpxPka7D2WaQvN/MSZg1Q22tPZvWi/ZTfGL
 dBIyxVmIuHM8letCCeLGIkGSnxijNabCaMQ3+/VXL0zFN25jDd98MYD8hwSqnrRPVS
 n0nfdaO1EtKtf/TJOK1K0np3HnjrmUf/OTYrUzGEBDImow5W6rnfmSfsRfsn08ukIl
 3kueEziGVzQJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:40 +0100
Subject: [PATCH v9 12/27] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-12-d45890323344@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12485; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2vPwPO8kvi7SoILxLke9m0YI6xFI1AJM4npOguVc2BY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpXguZkrUsUu68ExmlWPr314d/Kng+/oVd2t0nkXK2
 OVKf33VUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImYyDL897HNkmfKMr7UsmvR
 IsEZLB1HWI8zmNW4B75fE/mA6/RLS0aGU6Gp12c1c1w7o2LvdDjS0Pesw6VS98xbhg/jzH5dmxT
 JCAA=
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
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c          |  9 +++++++
 drivers/gpu/drm/drm_connector.c                    |  4 +++
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   |  4 +++
 drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
 include/drm/drm_connector.h                        | 30 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 63a96c691460..448b4a73d1c8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -665,15 +665,24 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
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
index 8cc1332f11c2..591d2d500f61 100644
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
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index dfed45b250a5..989661ad3aee 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -108,10 +108,13 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
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
@@ -190,10 +193,11 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
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
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 4d1ac744a844..ac4b8d00e992 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -20,10 +20,13 @@ struct drm_connector_init_priv {
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
@@ -185,10 +188,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
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
@@ -203,10 +207,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
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
@@ -221,10 +226,11 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
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
@@ -239,10 +245,11 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
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
@@ -261,10 +268,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
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
@@ -295,10 +303,11 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
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
@@ -329,10 +338,11 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
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
@@ -359,10 +369,11 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
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
@@ -377,10 +388,11 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
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
@@ -396,10 +408,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
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
@@ -429,10 +442,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
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
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3917ea93986..8cda902934cd 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1056,10 +1056,34 @@ struct drm_connector_state {
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
@@ -1924,10 +1948,15 @@ struct drm_connector {
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
 
@@ -1946,10 +1975,11 @@ int drmm_connector_init(struct drm_device *dev,
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
2.43.2

