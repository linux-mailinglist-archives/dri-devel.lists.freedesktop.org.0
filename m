Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95E8600A5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DD310E9F1;
	Thu, 22 Feb 2024 18:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRAyjeka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7934710E9F1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:15:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 63EADCE28BD;
 Thu, 22 Feb 2024 18:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD6C433F1;
 Thu, 22 Feb 2024 18:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708625699;
 bh=sJk+iLTFxQ+htecxrkrYH5cdVnbGhOy+H6wNvmnfl9g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MRAyjekaJWnFCibf/8lRly5LpNhCrqCamCfqZSAGKYI0Fu+I2GihG8D4ZYAs9MJ1X
 5YeDwUpW0fX43VfhyZFqZ+9Xe5sOAd+C7jOya4XsJh/qT4nn4LykNMZpotrV5Xjcoq
 Ap5ndFigpz9SxZyEiJfMXfjyS6XRKMIIp/RaZV3vXltWLJerB4LsrdEYTsngZNpVWM
 rnAQko12J8/ZECxscZ/ZBqNCbMTOh0h4zsL8sYwnY5E5TyOEPF73hV6SPB044NNGwX
 FwFhM34EuR8twNSZ7q328BDA5eMnlI3QN8r2MvNpypCZbnclmLLmKtKK/hruukmJxM
 DQQxlWGwrTiow==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Feb 2024 19:13:57 +0100
Subject: [PATCH v7 11/36] drm/connector: hdmi: Add support for output
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-kms-hdmi-connector-state-v7-11-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sJk+iLTFxQ+htecxrkrYH5cdVnbGhOy+H6wNvmnfl9g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+z64mfDFZnPPio2ROMUvlcqa9d4rfWGF5xfXbw1Pb
 wpU3nvdUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIk4vWZkeGxxo/PWUdH5Th+1
 rv9Zt25P0Trr/7sTYs8kNZu/S1r57hDD/8THzeuSLymksj29J2wyY+7201s3WvV9f8d6K6VQ/8h
 WLlYA
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
@@ -1146,6 +1146,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+		drm_printf(p, "\toutput_format=%s\n",
+			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 460454904fe3..ae99765c45de 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -660,7 +660,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
-	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
+	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
+	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da51a2bcb978..b629c8e990f4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
@@ -477,6 +478,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
 	int ret;
@@ -485,6 +487,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
+		return -EINVAL;
+
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
@@ -492,6 +497,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	connector->hdmi.supported_formats = supported_formats;
+
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
 	 * connector to have a state.
@@ -1201,6 +1208,30 @@ static const u32 dp_colorspaces =
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
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 5d1a1dbff433..a129ea5f014c 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -147,6 +147,7 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int formats,
 				      unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
@@ -190,6 +191,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 				       &dummy_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       formats,
 				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -225,7 +227,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -292,7 +296,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -361,7 +367,9 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -383,7 +391,9 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -405,7 +415,9 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 20da290abff3..a9a57cb23235 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -187,6 +187,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -204,6 +205,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -221,6 +223,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       9);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -238,6 +241,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       0);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
@@ -259,6 +263,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -292,6 +297,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       10);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -325,6 +331,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       12);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -355,6 +362,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
@@ -387,6 +395,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 				       &dummy_funcs,
 				       connector_type,
 				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
 				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d4d2ae15bc1e..29883e6f8e50 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -368,6 +368,9 @@ enum drm_panel_orientation {
 	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
+
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
  * &drm_display_info
@@ -1041,6 +1044,11 @@ struct drm_connector_state {
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
 
@@ -1902,6 +1910,17 @@ struct drm_connector {
 
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
@@ -1925,6 +1944,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);

-- 
2.43.2

