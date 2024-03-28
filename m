Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD3878213
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 15:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0010FCF7;
	Mon, 11 Mar 2024 14:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hk9I7jTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE62A112470
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 14:50:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D963B60EB9;
 Mon, 11 Mar 2024 14:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57169C433F1;
 Mon, 11 Mar 2024 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710168618;
 bh=0CzX1jg40qqIJLC46w8/k2Ft/Q55zd3GeVatG2t1zbM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hk9I7jTwaZkvRWL6olsgzmu7TqvZbu3lgUCf9Mc8b+wsPbXzn6mYJN3l2885SCzet
 U3f9Oi+7Jh4Lkq4tJCVhBnPPLParmwjB75fMs2v6lgfYvAoCCnHCbEU0f4Uc/1HOZ0
 BVxbrj7diK6AT9iLkUERw76U2BRH9a2/Uq8nuArP3zwJl2W44Dz8bpA036lXCtQl/O
 M7IkyftCIUcWBTYwxtJsyknFKSsp0a8GZF5oSMxFOC6IIAxlFknbYrHHBiPcXHTNCs
 DPVwlypVnP05jeYOo2RPbO0nvoCHP6rLA6YJ541u5kTyIkVOdFlLQ2sFvD+T+sQ7bw
 bRkT34yM75DDw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:34 +0100
Subject: [PATCH v9 06/27] drm/connector: hdmi: Add support for output
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-6-d45890323344@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15064; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0CzX1jg40qqIJLC46w8/k2Ft/Q55zd3GeVatG2t1zbM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpTicrt66toTZbPZ9+T3X1y34sq3EkDP/isSfkD25u
 3+f57B73FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ2Bgy/PdJnbrwnw275B5V
 /es95+PT+oLMbB6Fsf20vLjTMm62YQrDf5fNM6rs6xXW8vkv+OYY+OP9aabo/gMvkk/8k/yzV+P
 ZJAYA
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

Just like BPC, we'll add support for automatic selection of the output
format for HDMI connectors.

Let's add the needed defaults and fields for now.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c                       |  2 ++
 drivers/gpu/drm/drm_atomic_state_helper.c          |  3 ++-
 drivers/gpu/drm/drm_connector.c                    | 31 ++++++++++++++++++++++
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 22 +++++++++++----
 drivers/gpu/drm/tests/drm_connector_test.c         |  9 +++++++
 include/drm/drm_connector.h                        | 20 ++++++++++++++
 6 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 4e11cfb4518b..8730137baa86 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1144,10 +1144,12 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+		drm_printf(p, "\toutput_format=%s\n",
+			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
 			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 460454904fe3..ae99765c45de 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -658,11 +658,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	struct drm_connector_state *old_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
-	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
+	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
+	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
 		if (IS_ERR(crtc_state))
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da51a2bcb978..b629c8e990f4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -457,10 +457,11 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
  *
@@ -475,25 +476,31 @@ EXPORT_SYMBOL(drmm_connector_init);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
 	int ret;
 
 	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
+		return -EINVAL;
+
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
+	connector->hdmi.supported_formats = supported_formats;
+
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
 	 */
 	if (connector->funcs->reset)
@@ -1199,10 +1206,34 @@ static const u32 dp_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
 	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const char * const output_format_str[] = {
+	[HDMI_COLORSPACE_RGB]		= "RGB",
+	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
+	[HDMI_COLORSPACE_YUV422]	= "YUV 4:2:2",
+	[HDMI_COLORSPACE_YUV444]	= "YUV 4:4:4",
+};
+
+/*
+ * drm_hdmi_connector_get_output_format_name() - Return a string for HDMI connector output format
+ * @fmt: Output format to compute name of
+ *
+ * Returns: the name of the output format, or NULL if the type is not
+ * valid.
+ */
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
+{
+	if (fmt >= ARRAY_SIZE(output_format_str))
+		return NULL;
+
+	return output_format_str[fmt];
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
+
 /**
  * DOC: standard connector properties
  *
  * DRM connectors have a few standardized properties:
  *
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 5d1a1dbff433..a129ea5f014c 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -145,10 +145,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 };
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int formats,
 				      unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
 	struct drm_encoder *enc;
@@ -188,10 +189,11 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       formats,
 				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
 	drm_connector_attach_encoder(conn, enc);
@@ -223,11 +225,13 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_connector *conn;
 	struct drm_device *drm;
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
@@ -290,11 +294,13 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_connector *conn;
 	struct drm_device *drm;
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
@@ -359,11 +365,13 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
 	conn_state = conn->state;
 	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
@@ -381,11 +389,13 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
 	conn_state = conn->state;
 	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
@@ -403,11 +413,13 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
 	conn_state = conn->state;
 	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 2519b91de95e..9589867bdf7c 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -185,10 +185,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 /*
@@ -202,10 +203,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 /*
@@ -219,10 +221,11 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       9);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
 /*
@@ -236,10 +239,11 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       0);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
 /*
@@ -257,10 +261,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
 	KUNIT_ASSERT_NOT_NULL(test, prop);
@@ -290,10 +295,11 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       10);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
 	KUNIT_ASSERT_NOT_NULL(test, prop);
@@ -323,10 +329,11 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       12);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
 	KUNIT_ASSERT_NOT_NULL(test, prop);
@@ -353,10 +360,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
 static const unsigned int drm_connector_hdmi_init_type_valid_tests[] = {
@@ -385,10 +393,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
 static const unsigned int drm_connector_hdmi_init_type_invalid_tests[] = {
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d4d2ae15bc1e..29883e6f8e50 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -366,10 +366,13 @@ enum drm_panel_orientation {
 	DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP,
 	DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
 	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
+
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
  * &drm_display_info
  *
  * This struct is used to store a frequency range supported by panel
@@ -1039,10 +1042,15 @@ struct drm_connector_state {
 	struct {
 		/**
 		 * @output_bpc: Bits per color channel to output.
 		 */
 		unsigned int output_bpc;
+
+		/**
+		 * @output_format: Pixel format to output in.
+		 */
+		enum hdmi_colorspace output_format;
 	} hdmi;
 };
 
 /**
  * struct drm_connector_funcs - control connectors on a given device
@@ -1900,10 +1908,21 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/**
+	 * @hdmi: HDMI-related variable and properties.
+	 */
+	struct {
+		/**
+		 * @supported_formats: Bitmask of @hdmi_colorspace
+		 * supported by the controller.
+		 */
+		unsigned long supported_formats;
+	} hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
 
 int drm_connector_init(struct drm_device *dev,
@@ -1923,10 +1942,11 @@ int drmm_connector_init(struct drm_device *dev,
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,

-- 
2.43.2

