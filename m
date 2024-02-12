Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13167851474
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6581610ED6C;
	Mon, 12 Feb 2024 13:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RGARsEI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAF810ED50
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2251FCE12BA;
 Mon, 12 Feb 2024 13:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602A9C433B2;
 Mon, 12 Feb 2024 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743667;
 bh=LhniIRDebcQ1WtQbDyA1K0rXNp4WmruPrv/0+dGUHSk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RGARsEI9kyGSSVGtidFq+XfP5T8+mkOh/+uHtPtUy5kGKrS09eIDPwqBXVkoS4Lwo
 ORcSZfKmfLMft2CfVpQNWMK8yhuM7uaVxc+pB0J3BqTxLWo0Dms0rIA5kZAlGSyO+L
 XLgHAgDzxKyck6g6UqMZimOkXrHRSFVkXonp4synnOmlZBW1+jM857op3o+9AJIkai
 d6cL5+/M61LR/kfHDxkWnCw5tD3Ox344Myht0BuiAwu4DLgbAAO2lIfJ24yacdNu8o
 klzSxIMQ4ALpyhLGfZ2EIdxBj/RwKj6+aSC0A7re2GResTmNN6j0cVWfP+mlYgim+T
 USPcSwa7EbgRA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:13:04 +0100
Subject: [PATCH v6 21/36] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-21-f4bcdc979e6f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10268; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LhniIRDebcQ1WtQbDyA1K0rXNp4WmruPrv/0+dGUHSk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJLN3FTwN/cr+uzvNdveV3+9Fp6W2bDK24LiV/Ps8q
 2rWj5vRHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIAkuGv4Kcxb3h/SycSWdm
 RT28sEqE35rx/cJiCW1PQyP1SwfzWBn+8PHFFCdafdlhXcpzuuGuw9R/LpKftwc/XyReXLZoa2U
 DGwA=
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
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++
 include/drm/drm_connector.h                        | 30 ++++++++++++++++++++++
 5 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index ac77d47a0ce3..3a965c4aa59b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -688,11 +688,20 @@ hdmi_clock_valid(const struct drm_connector *connector,
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
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 332477c6a987..a4466a79421e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -457,6 +457,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
@@ -476,6 +477,7 @@ EXPORT_SYMBOL(drmm_connector_init);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
@@ -512,6 +514,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	connector->hdmi.funcs = hdmi_funcs;
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index d76fafb91025..a43bbfc2c2d0 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -110,6 +110,9 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return 0;
 }
 
+static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -192,6 +195,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
+				       &dummy_connector_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 0a838924a546..6a3651b08c81 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -22,6 +22,9 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+};
+
 static const struct drm_connector_funcs dummy_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
@@ -187,6 +190,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -205,6 +209,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -223,6 +228,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -241,6 +247,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -263,6 +270,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -297,6 +305,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -331,6 +340,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -361,6 +371,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       0,
@@ -379,6 +390,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_YUV422),
@@ -398,6 +410,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -431,6 +444,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -695,6 +709,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 59016d9c17f5..3eaf4d54364d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1093,6 +1093,30 @@ struct drm_connector_state {
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
@@ -1967,6 +1991,11 @@ struct drm_connector {
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
 
@@ -1989,6 +2018,7 @@ int drmm_connector_init(struct drm_device *dev,
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,

-- 
2.43.0

