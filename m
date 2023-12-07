Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458D808C5B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F9D10E8F4;
	Thu,  7 Dec 2023 15:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F7B10E8F4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:50:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7AA9CE1FC8;
 Thu,  7 Dec 2023 15:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D8CC433C7;
 Thu,  7 Dec 2023 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964217;
 bh=5HzKdcUbMiINP5ijTIi/A58IQD7r7dboPG5JDKzL2yY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IBD/8hKE2+7f2cvuL4A1q2mNWroRocgTevaBstq/ORS0oJGRcXtwIBUsGCut2zy4L
 CRjMkWqADT/7ywn82o3Xrc4cYA3x0yWUIPGQYM/FQ4aah4PdYkdxVoSHGysrVGhLSU
 uJu2TJL8G59bekDBfJHS0eX0+cXMTQMcSeKpqcuBkEy2izBaEgrNgADRQi74FDpZ93
 t6z+atq58jKqloylY6L/sb7lEQ0XtRitXnOQ1Hq6zJoZUutXulJQ73oh7sJ46cP7yC
 OhX66w8ur2ZpnmLn6MFUq17Kjbsx0hjQ7pzJCVb85uvAADVeWxNNmsJh57q7U5DPDh
 NuO9TdzcnyN+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:39 +0100
Subject: [PATCH v5 16/44] drm/connector: hdmi: Add Infoframes generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-16-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=31673; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5HzKdcUbMiINP5ijTIi/A58IQD7r7dboPG5JDKzL2yY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1uv+9XNMBFJ5r6nV6fwcNHJWxPyuWYoyqduXvyV7
 8WxuSFPO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR4c0Mf4UMd9999+HVnfBg
 x56MvRtyelavuDInTeeYji1L93cNexNGhrYzewpniR88d6NNZtKGPcrsUw9YnZp0UrOOZ36k2uH
 z0/kB
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Infoframes in KMS is usually handled by a bunch of low-level helpers
that require quite some boilerplate for drivers. This leads to
discrepancies with how drivers generate them, and which are actually
sent.

Now that we have everything needed to generate them in the HDMI
connector state, we can generate them in our common logic so that
drivers can simply reuse what we precomputed.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c          | 327 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |  16 +
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 231 +++++++++++++++
 include/drm/drm_atomic_state_helper.h              |   7 +
 include/drm/drm_connector.h                        | 133 +++++++++
 7 files changed, 716 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 31cfe2c2a2af..acf733426bde 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -100,6 +100,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 2442b5a2d94f..78e5d3463570 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -38,6 +38,8 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+
 #include <linux/slab.h>
 #include <linux/dma-fence.h>
 
@@ -905,6 +907,142 @@ hdmi_compute_config(const struct drm_connector *connector,
 	return -EINVAL;
 }
 
+static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *state)
+{
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(state);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&state->hdmi.infoframes.avi;
+	struct hdmi_avi_infoframe *frame =
+		&infoframe->data.avi;
+	bool is_full_range = state->hdmi.is_full_range;
+	enum hdmi_quantization_range rgb_quant_range =
+		is_full_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
+	int ret;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
+	if (ret)
+		return ret;
+
+	frame->colorspace = state->hdmi.output_format;
+
+	drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
+	drm_hdmi_avi_infoframe_colorimetry(frame, state);
+	drm_hdmi_avi_infoframe_bars(frame, state);
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *state)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&state->hdmi.infoframes.spd;
+	struct hdmi_spd_infoframe *frame =
+		&infoframe->data.spd;
+	int ret;
+
+	ret = hdmi_spd_infoframe_init(frame,
+				      connector->hdmi.vendor,
+				      connector->hdmi.product);
+	if (ret)
+		return ret;
+
+	frame->sdi = HDMI_SPD_SDI_PC;
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
+				       struct drm_connector_state *state)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&state->hdmi.infoframes.hdr_drm;
+	struct hdmi_drm_infoframe *frame =
+		&infoframe->data.drm;
+	int ret;
+
+	if (connector->max_bpc < 10)
+		return 0;
+
+	if (!state->hdr_output_metadata)
+		return 0;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
+	if (ret)
+		return ret;
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *connector,
+					       struct drm_connector_state *state)
+{
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(state);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&state->hdmi.infoframes.hdmi;
+	struct hdmi_vendor_infoframe *frame =
+		&infoframe->data.vendor.hdmi;
+	int ret;
+
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
+	if (ret) {
+		if (ret == -EINVAL)
+			return 0;
+
+		return ret;
+	}
+
+	infoframe->set = true;
+
+	return 0;
+}
+
+static int
+hdmi_generate_infoframes(const struct drm_connector *connector,
+			 struct drm_connector_state *state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	ret = hdmi_generate_avi_infoframe(connector, state);
+	if (ret)
+		return ret;
+
+	ret = hdmi_generate_spd_infoframe(connector, state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Audio Infoframes will be generated by ALSA, and updated by
+	 * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
+	 */
+
+	ret = hdmi_generate_hdr_infoframe(connector, state);
+	if (ret)
+		return ret;
+
+	ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -934,6 +1072,10 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
+	ret = hdmi_generate_infoframes(connector, new_state);
+	if (ret)
+		return ret;
+
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
 	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
 	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
@@ -951,6 +1093,191 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static int clear_device_infoframe(struct drm_connector *connector,
+				  enum hdmi_infoframe_type type)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+
+	if (!funcs || !funcs->clear_infoframe)
+		return 0;
+
+	return funcs->clear_infoframe(connector, type);
+}
+
+static int clear_infoframe(struct drm_connector *connector,
+			   struct drm_connector_hdmi_infoframe *conn_frame,
+			   struct drm_connector_hdmi_infoframe *old_frame)
+{
+	int ret;
+
+	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret)
+		return ret;
+
+	memset(old_frame, 0, sizeof(*old_frame));
+
+	return 0;
+}
+
+static int write_device_infoframe(struct drm_connector *connector,
+				  union hdmi_infoframe *frame)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
+	int len;
+
+	if (!funcs || !funcs->write_infoframe)
+		return -ENOSYS;
+
+	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
+	if (len < 0)
+		return len;
+
+	return funcs->write_infoframe(connector, frame->any.type, buffer, len);
+}
+
+static int write_infoframe(struct drm_connector *connector,
+			   struct drm_connector_hdmi_infoframe *conn_frame,
+			   struct drm_connector_hdmi_infoframe *new_frame)
+{
+	int ret;
+
+	ret = write_device_infoframe(connector, &new_frame->data);
+	if (ret)
+		return ret;
+
+	if (conn_frame)
+		memcpy(conn_frame, new_frame, sizeof(*conn_frame));
+
+	return 0;
+}
+
+static int write_or_clear_infoframe(struct drm_connector *connector,
+				    struct drm_connector_hdmi_infoframe *conn_frame,
+				    struct drm_connector_hdmi_infoframe *old_frame,
+				    struct drm_connector_hdmi_infoframe *new_frame)
+{
+	if (new_frame->set)
+		return write_infoframe(connector, conn_frame, new_frame);
+
+	if (old_frame->set && !new_frame->set)
+		return clear_infoframe(connector, conn_frame, old_frame);
+
+	return 0;
+}
+
+#define UPDATE_INFOFRAME(c, os, ns, i)				\
+	write_or_clear_infoframe(c,				\
+				 &(c)->hdmi.infoframes.i,	\
+				 &(os)->hdmi.infoframes.i,	\
+				 &(ns)->hdmi.infoframes.i)
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_infoframes - Update the Infoframes
+ * @connector: A pointer to the HDMI connector
+ * @state: The HDMI connector state to generate the infoframe from
+ *
+ * This function is meant for HDMI connector drivers to write their
+ * infoframes. It will typically be used in a
+ * @drm_connector_helper_funcs.atomic_enable implementation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
+						       struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
+	if (ret)
+		goto out;
+
+	if (connector->hdmi.infoframes.audio.set) {
+		ret = write_infoframe(connector,
+				      NULL,
+				      &connector->hdmi.infoframes.audio);
+		if (ret)
+			goto out;
+	}
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdr_drm);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, spd);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
+
+#undef UPDATE_INFOFRAME
+#undef UPDATE_INFOFRAME_TOGGLE
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
+ * @connector: A pointer to the HDMI connector
+ * @frame: A pointer to the audio infoframe to write
+ *
+ * This function is meant for HDMI connector drivers to update their
+ * audio infoframe. It will typically be used in one of the ALSA hooks
+ * (most likely prepare).
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
+							struct hdmi_audio_infoframe *frame)
+{
+	struct drm_connector_hdmi_infoframe infoframe = {};
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	memcpy(&infoframe.data, frame, sizeof(infoframe.data));
+	infoframe.set = true;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	ret = write_infoframe(connector,
+			      &connector->hdmi.infoframes.audio,
+			      &infoframe);
+
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9f314fee26ce..1f783f82423b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -456,6 +456,8 @@ EXPORT_SYMBOL(drmm_connector_init);
  * drmm_connector_hdmi_init - Init a preallocated HDMI connector
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
  * @funcs: callbacks for this connector
  * @hdmi_funcs: HDMI-related callbacks for this connector
  * @connector_type: user visible type of the connector
@@ -476,6 +478,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  */
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
@@ -485,6 +488,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 {
 	int ret;
 
+	if (!vendor || !product)
+		return -EINVAL;
+
+	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
+	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
+		return -EINVAL;
+
 	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
@@ -500,6 +510,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		return ret;
 
 	connector->hdmi.supported_formats = supported_formats;
+	strtomem_pad(connector->hdmi.vendor, vendor, 0);
+	strtomem_pad(connector->hdmi.product, product, 0);
+
+	ret = drmm_mutex_init(dev, &connector->hdmi.infoframes.lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 860e34b00fee..1eaa83af9dd0 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -203,6 +203,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
+				       "Vendor", "Product",
 				       &dummy_connector_funcs,
 				       &dummy_connector_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 6a3651b08c81..07066b704b36 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -189,6 +189,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -208,6 +209,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -217,6 +219,217 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of an HDMI connector with a NULL vendor
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       NULL, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector with a NULL product
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", NULL,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a valid, shorter than
+ * the max length, product name succeeds, and is stored padded with 0.
+ */
+static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd',
+	};
+	const char *product_name = "Prod";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a valid, at max
+ * length, product name succeeds, and is stored padded without any
+ * trailing \0.
+ */
+static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r',
+	};
+	const char *product_name = "ProductProductPr";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a product name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *product_name = "ProductProductProduct";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a vendor name smaller
+ * than the maximum length succeeds, and is stored padded with zeros.
+ */
+static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd',
+	};
+	const char *vendor_name = "Vend";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name at the
+ * maximum length succeeds, and is stored padded without the trailing
+ * zero.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd', 'o', 'r',
+		'V', 'e',
+	};
+	const char *vendor_name = "VendorVe";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *vendor_name = "VendorVendor";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 /*
  * Test that the registration of a connector with an invalid maximum bpc
  * count fails.
@@ -227,6 +440,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -246,6 +460,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -269,6 +484,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -304,6 +520,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -339,6 +556,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -370,6 +588,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -389,6 +608,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
@@ -409,6 +629,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
@@ -443,6 +664,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
@@ -488,6 +710,14 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_product),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_vendor),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_valid),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
@@ -708,6 +938,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	int ret;
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 8072ac18e536..22f083968aa8 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -40,6 +40,8 @@ struct drm_private_state;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 
+struct hdmi_audio_infoframe;
+
 void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
@@ -89,6 +91,11 @@ __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
+							    struct hdmi_audio_infoframe *frame);
+int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
+						       struct drm_atomic_state *state);
+
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3eaf4d54364d..5964ef283022 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -914,6 +914,21 @@ struct drm_tv_connector_state {
 	unsigned int hue;
 };
 
+/**
+ * struct drm_connector_hdmi_infoframe - HDMI Infoframe container
+ */
+struct drm_connector_hdmi_infoframe {
+	/**
+	 * @data: HDMI Infoframe structure
+	 */
+	union hdmi_infoframe data;
+
+	/**
+	 * @set: Is the content of @data valid?
+	 */
+	bool set;
+};
+
 /**
  * struct drm_connector_state - mutable connector state
  */
@@ -1070,6 +1085,35 @@ struct drm_connector_state {
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 
+		/**
+		 * @infoframes: HDMI Infoframes matching that state
+		 */
+		struct {
+			/**
+			 * @avi: AVI Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe avi;
+
+			/**
+			 * @hdr_drm: DRM (Dynamic Range and Mastering)
+			 * Infoframes structure matching our state.
+			 */
+			struct drm_connector_hdmi_infoframe hdr_drm;
+
+			/**
+			 * @spd: SPD Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe spd;
+
+			/**
+			 * @vendor: HDMI Vendor Infoframes structure
+			 * matching our state.
+			 */
+			struct drm_connector_hdmi_infoframe hdmi;
+		} infoframes;
+
 		/**
 		 * @is_full_range: Is the output supposed to use a full
 		 * RGB Quantization Range or not?
@@ -1115,6 +1159,41 @@ struct drm_connector_hdmi_funcs {
 	(*tmds_char_rate_valid)(const struct drm_connector *connector,
 				const struct drm_display_mode *mode,
 				unsigned long long tmds_rate);
+
+	/**
+	 * @clear_infoframe:
+	 *
+	 * This callback is invoked through
+	 * @drm_atomic_helper_hdmi_connector_update_infoframes during a
+	 * commit to clear the infoframes into the hardware. It will be
+	 * called multiple times, once for every disabled infoframe
+	 * type.
+	 *
+	 * The @clear_infoframe callback is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*clear_infoframe)(struct drm_connector *connector,
+			       enum hdmi_infoframe_type type);
+
+	/**
+	 * @write_infoframe:
+	 *
+	 * This callback is invoked through
+	 * @drm_atomic_helper_hdmi_connector_update_infoframes during a
+	 * commit to program the infoframes into the hardware. It will
+	 * be called multiple times, once for every updated infoframe
+	 * type.
+	 *
+	 * The @write_infoframe callback is mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*write_infoframe)(struct drm_connector *connector,
+			       enum hdmi_infoframe_type type,
+			       const u8 *buffer, size_t len);
 };
 
 /**
@@ -1986,6 +2065,18 @@ struct drm_connector {
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct {
+#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
+		/**
+		 * @vendor: HDMI Controller Vendor Name
+		 */
+		unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
+
+#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
+		/**
+		 * @product: HDMI Controller Product Name
+		 */
+		unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
+
 		/**
 		 * @supported_formats: Bitmask of @hdmi_colorspace
 		 * supported by the controller.
@@ -1996,6 +2087,47 @@ struct drm_connector {
 		 * @funcs: HDMI connector Control Functions
 		 */
 		const struct drm_connector_hdmi_funcs *funcs;
+
+		/**
+		 * @infoframes: Current Infoframes output by the connector
+		 */
+		struct {
+			/**
+			 * @lock: Mutex protecting against concurrent access to
+			 * the infoframes, most notably between KMS and ALSA.
+			 */
+			struct mutex lock;
+
+			/**
+			 * @audio: Current Audio Infoframes structure. Protected
+			 * by @lock.
+			 */
+			struct drm_connector_hdmi_infoframe audio;
+
+			/**
+			 * @avi: Current AVI Infoframes structure. Protected by
+			 * @lock.
+			 */
+			struct drm_connector_hdmi_infoframe avi;
+
+			/**
+			 * @hdr_drm: Current DRM (Dynamic Range and Mastering)
+			 * Infoframes structure. Protected by @lock.
+			 */
+			struct drm_connector_hdmi_infoframe hdr_drm;
+
+			/**
+			 * @spd: Current SPD Infoframes structure. Protected by
+			 * @lock.
+			 */
+			struct drm_connector_hdmi_infoframe spd;
+
+			/**
+			 * @vendor: Current HDMI Vendor Infoframes structure.
+			 * Protected by @lock.
+			 */
+			struct drm_connector_hdmi_infoframe hdmi;
+		} infoframes;
 	} hdmi;
 };
 
@@ -2017,6 +2149,7 @@ int drmm_connector_init(struct drm_device *dev,
 			struct i2c_adapter *ddc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,

-- 
2.43.0

