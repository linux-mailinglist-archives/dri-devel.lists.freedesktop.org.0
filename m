Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D985785145F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE0310ED1A;
	Mon, 12 Feb 2024 13:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gxNV4ehr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B19110ED23
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 08AEACE12AE;
 Mon, 12 Feb 2024 13:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250ABC433F1;
 Mon, 12 Feb 2024 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743645;
 bh=XvHRjcHEGiov3nC8A3+QY9gmoUVMU7VKG4/iarE/bio=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gxNV4ehrJRbEcJVUpKlsyn482unviXCacOgGYQ/B6Zluddv9FYzW6QKAZrGdJkCuE
 bK4bzpkncTD4+x0qzTF4iyGLpWgMvv9HK087A4/MP4x2A3VDOwQJ04UymyF3zSeFSg
 ZSYPLBvhf99V32yLbdrE3xSmWcQb5UwAioPo7M1q2J/WF5HH3veduwmaBtv9F8DN0c
 of1PS0uNWHNhSI5Imm4VEm5+ijh6qBf2xAixvpwLxJiBf8l3vS40/AHhncovmmLWw6
 183pRJ6kwfGyVUSXNmfHng7j6D/wTVbBG4bjI94DL7Vt9cTTDURSmj4RsPqn7cVGgN
 CXGIF9oAgFnwA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:12:56 +0100
Subject: [PATCH v6 13/36] drm/connector: hdmi: Add output BPC to the
 connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-13-f4bcdc979e6f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11447; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XvHRjcHEGiov3nC8A3+QY9gmoUVMU7VKG4/iarE/bio=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJNNWNDXxTDvJsi5rw/bfF+a97V8jvu7I4m2Hz53fs
 lXkPWPDyo5SFgYxLgZZMUWWGGHzJXGnZr3uZOObBzOHlQlkCAMXpwBMZPk/Robz8fcS6w40r03v
 9Dpb+ibVwsNLeJLxYf8FNi/vzF4Yo7aTkeHZ63cs841Kn1spcVSkTw854L+Lab/rR+Hk6tA46VU
 zjrECAA==
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

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c                       |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |  7 ++++++-
 drivers/gpu/drm/drm_connector.c                    | 20 +++++++++++++++++-
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 24 ++++++++++++----------
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++-----
 include/drm/drm_connector.h                        | 13 +++++++++++-
 6 files changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0c283964cee0..5fcdab90c793 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1148,6 +1148,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
 		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
+		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 08db9956840b..2025d053e54f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -585,6 +585,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_state->max_bpc = max_bpc;
+	new_state->max_requested_bpc = max_bpc;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -701,7 +705,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
-	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 53abf213a045..ca39fd027e20 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
@@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	int ret;
 
@@ -483,10 +485,26 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
+	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
+	/*
+	 * drm_connector_attach_max_bpc_property() requires the
+	 * connector to have a state.
+	 */
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
+	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+	connector->max_bpc = max_bpc;
+
+	if (max_bpc > 8)
+		drm_connector_attach_hdr_output_metadata_property(connector);
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 7750c3d214a4..64ba1f6256ba 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -146,7 +146,8 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test)
+drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -188,7 +189,8 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test)
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL);
+				       NULL,
+				       max_bpc);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
@@ -223,7 +225,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -284,7 +286,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -345,7 +347,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -399,7 +401,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -452,7 +454,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -508,7 +510,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -563,7 +565,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -619,7 +621,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -684,7 +686,7 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test);
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 41d33dea30af..96b19a5954b4 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -186,7 +186,8 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -202,7 +203,8 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL);
+				       NULL,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -219,7 +221,8 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -250,7 +253,8 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       connector_type,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -447,7 +451,8 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc);
+				       &priv->ddc,
+				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	ret = drm_connector_attach_broadcast_rgb_property(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 76eecd449fb8..1b1b6aed04ee 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1072,6 +1072,11 @@ struct drm_connector_state {
 		 * RGB Quantization Range or not?
 		 */
 		bool is_full_range;
+
+		/**
+		 * @output_bpc: Bits per color channel to output.
+		 */
+		unsigned int output_bpc;
 	} hdmi;
 };
 
@@ -1717,6 +1722,11 @@ struct drm_connector {
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
+	/**
+	 * @max_bpc: Maximum bits per color channel the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.
@@ -1956,7 +1966,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.43.0

