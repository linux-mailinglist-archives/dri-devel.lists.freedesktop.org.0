Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5A7DD2D1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094E10E584;
	Tue, 31 Oct 2023 16:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE110E57C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:49:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6D8961014;
 Tue, 31 Oct 2023 16:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CCCC433C8;
 Tue, 31 Oct 2023 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770946;
 bh=4PpB/U9VHUHQvnHZN8RJ/xe/mP17dYRyQXlwKwcx6a0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Unsyczr+jnQMoLrbAdCfEcLfw0D805ZLiN5cHHpI8rryMahOaL3jUshbr/4u+PHvV
 aXtsktD9oBoz9hkjYSBSkITB1/j+Szzv3ImRxJ4LYjOVd8i02Ot0P/L5+PW20DtzVP
 CxdTYdaIwOQtuxnv+VYXiW1zl37z6X2TDFyY/2fl21wHUgs9nTnWwLxx2z0SdNthkS
 sTL7Jt90Z8NKnJoLDevuhtWGXbdH0i3S1DMlmCilg0xDs6VjG6VaxmYJF2sx/x1uri
 FHSWAhjg81p0XeXq9sD5TeQFsJg4W/6uCVoWI0LxIR4PHge1A4c4NxorGl5nLMfil9
 A5qkq7xquEVPA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:24 +0100
Subject: [PATCH RFC v3 11/37] drm/connector: hdmi: Add Infoframes
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-11-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=18595; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4PpB/U9VHUHQvnHZN8RJ/xe/mP17dYRyQXlwKwcx6a0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vcsv87tvxSfWFVS5acxt6zzvk25FxPb6Y9rPR6Ks
 vhwuGzqKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwER6eRgZNuxp/l1XOunStTPP
 F8j+VC3oUNhx/fT1Naddv22tr33neJuRYb/9watN79xkrz7I9DrEGsA3/ebf3l9MvFmBhWkyN6f
 /5gYA
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
 drivers/gpu/drm/Kconfig                   |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c | 327 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c           |   9 +
 include/drm/drm_atomic_state_helper.h     |   7 +
 include/drm/drm_connector.h               | 131 ++++++++++++
 5 files changed, 475 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3caa020391c7..b82a38fc8355 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 1420d9fdfa35..c8331a779d74 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -38,6 +38,8 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+
 #include <linux/slab.h>
 #include <linux/dma-fence.h>
 
@@ -893,6 +895,142 @@ hdmi_compute_config(const struct drm_connector *connector,
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
+		&state->hdmi.infoframes.drm;
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
+static int hdmi_generate_vendor_infoframe(const struct drm_connector *connector,
+					  struct drm_connector_state *state)
+{
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(state);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&state->hdmi.infoframes.vendor;
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
+	ret = hdmi_generate_vendor_infoframe(connector, state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -922,6 +1060,10 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
+	ret = hdmi_generate_infoframes(connector, new_state);
+	if (ret)
+		return ret;
+
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
 	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
 	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
@@ -939,6 +1081,191 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
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
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, drm);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, spd);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(connector, old_state, new_state, vendor);
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
index 6dd5a82df884..bc82738306d9 100644
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
@@ -494,6 +497,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		return ret;
 
 	connector->hdmi.supported_formats = supported_formats;
+	strscpy(connector->hdmi.vendor, vendor, sizeof(connector->hdmi.vendor));
+	strscpy(connector->hdmi.product, product, sizeof(connector->hdmi.product));
+
+	ret = drmm_mutex_init(dev, &connector->hdmi.infoframes.lock);
+	if (ret)
+		return ret;
 
 	if (max_bpc) {
 		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
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
index 5005b4c196ac..459eea45af29 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -905,6 +905,21 @@ struct drm_tv_connector_state {
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
@@ -1057,6 +1072,35 @@ struct drm_connector_state {
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
+			 * @drm: DRM Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe drm;
+
+			/**
+			 * @spd: SPD Infoframes structure matching our
+			 * state.
+			 */
+			struct drm_connector_hdmi_infoframe spd;
+
+			/**
+			 * @vendor: Vendor Infoframes structure matching
+			 * our state.
+			 */
+			struct drm_connector_hdmi_infoframe vendor;
+		} infoframes;
+
 		/**
 		 * @is_full_range: Is the output supposed to use a full
 		 * RGB Quantization Range or not?
@@ -1102,6 +1146,41 @@ struct drm_connector_hdmi_funcs {
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
@@ -1969,6 +2048,16 @@ struct drm_connector {
 	struct hdr_sink_metadata hdr_sink_metadata;
 
 	struct {
+		/**
+		 * @vendor: HDMI Controller Vendor Name
+		 */
+		char vendor[8];
+
+		/**
+		 * @product: HDMI Controller Product Name
+		 */
+		char product[16];
+
 		/**
 		 * @supported_formats: Bitmask of @hdmi_colorspace
 		 * supported by the controller.
@@ -1979,6 +2068,47 @@ struct drm_connector {
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
+			 * @drm: Current DRM Infoframes structure. Protected by
+			 * @lock.
+			 */
+			struct drm_connector_hdmi_infoframe drm;
+
+			/**
+			 * @spd: Current SPD Infoframes structure. Protected by
+			 * @lock.
+			 */
+			struct drm_connector_hdmi_infoframe spd;
+
+			/**
+			 * @vendor: Current Vendor Infoframes structure.
+			 * Protected by @lock.
+			 */
+			struct drm_connector_hdmi_infoframe vendor;
+		} infoframes;
 	} hdmi;
 };
 
@@ -2000,6 +2130,7 @@ int drmm_connector_init(struct drm_device *dev,
 			struct i2c_adapter *ddc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,

-- 
2.41.0

