Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3677BAB2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1210E20A;
	Mon, 14 Aug 2023 13:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935010E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCD4A60ECA;
 Mon, 14 Aug 2023 13:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC478C433C9;
 Mon, 14 Aug 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021414;
 bh=TwReaH998r0w+lDww/DOcrQ1JLUr2wYXkauLvm1hQok=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tid9fnCU8+hamXnyiGxiIfRxjjDiaQF9gvadMkXm3RjXALVLFVUkaPJhUZhwyjJEg
 rTbhgriHjLnDk8BZYvNHMPMafBrjHFrVhi15PZl3e5qwUukyeWdNn0pmV429xe/CW5
 +RYJkVqGK5Rzsqt6nqDkMQZN9c2Q8oKRxk8CfcAQY+NmOPr0VajUmSkUsPy/cxsV9K
 8vOjlCfHN592FPEfFw9Wk9KN7nLFQXYItTIY6KOON7+qn+aBs9IU/k5+1Q9iLHKzlJ
 tVhsHCgzeYmuryuAjHS1f/gPszq1JbdNg/HsSHzpXkugMskwGMT8CVoF7fS+57iG+p
 4i+OD8nOwpRLg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:22 +0200
Subject: [PATCH RFC 10/13] drm/connector: hdmi: Add Infoframes generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-10-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15699; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TwReaH998r0w+lDww/DOcrQ1JLUr2wYXkauLvm1hQok=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNoE/sptM+I1vsh1SMZbx93XKKRW94bsHceN3yf0O
 C1c3/a2o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMpFWL4H+u8oevva7PfJ/zj
 T32XPvRmbdqVkx1z3lt+NM584+wrqMfwP9BqTcDTA/oCwV+fXLDklG/cr/Qp6nBYlPyCcwYHzxo
 4cQEA
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
 drivers/gpu/drm/drm_hdmi_connector.c | 287 +++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h          | 100 ++++++++++++
 2 files changed, 387 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index 22c49906dfb5..46cafb17def7 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -5,8 +5,10 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
+#include <drm/display/drm_hdmi_helper.h>
 
 #include <linux/export.h>
 
@@ -499,6 +501,131 @@ drm_hdmi_connector_compute_config(const struct drm_hdmi_connector *hdmi_connecto
 	return -EINVAL;
 }
 
+static int
+drm_hdmi_connector_generate_avi_infoframe(const struct drm_hdmi_connector *hdmi_connector,
+					  struct drm_hdmi_connector_state *hdmi_state)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	const struct drm_connector_state *state = &hdmi_state->base;
+	const struct drm_display_mode *mode =
+		connector_state_get_adjusted_mode(state);
+	struct hdmi_avi_infoframe *frame = &hdmi_state->infoframes.avi;
+	bool is_lim_range =
+		drm_atomic_helper_hdmi_connector_is_full_range(hdmi_connector,
+							       hdmi_state);
+	enum hdmi_quantization_range rgb_quant_range =
+		is_lim_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
+	int ret;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
+	if (ret)
+		return ret;
+
+	frame->colorspace = hdmi_state->output_format;
+
+	drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
+	drm_hdmi_avi_infoframe_colorimetry(frame, state);
+	drm_hdmi_avi_infoframe_bars(frame, state);
+
+	return 0;
+}
+
+static int
+drm_hdmi_connector_generate_spd_infoframe(const struct drm_hdmi_connector *hdmi_connector,
+					  struct drm_hdmi_connector_state *hdmi_state)
+{
+	struct hdmi_spd_infoframe *frame = &hdmi_state->infoframes.spd;
+	int ret;
+
+	ret = hdmi_spd_infoframe_init(frame,
+				      hdmi_connector->vendor,
+				      hdmi_connector->product);
+	if (ret)
+		return ret;
+
+	frame->sdi = HDMI_SPD_SDI_PC;
+
+	return 0;
+}
+
+static int
+drm_hdmi_connector_generate_hdr_infoframe(const struct drm_hdmi_connector *hdmi_connector,
+					  struct drm_hdmi_connector_state *hdmi_state)
+{
+	const struct drm_connector_state *state = &hdmi_state->base;
+	struct hdmi_drm_infoframe *frame = &hdmi_state->infoframes.drm;
+	int ret;
+
+	if (hdmi_connector->max_bpc < 10)
+		return 0;
+
+	if (!state->hdr_output_metadata)
+		return 0;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int
+drm_hdmi_connector_generate_vendor_infoframe(const struct drm_hdmi_connector *hdmi_connector,
+					     struct drm_hdmi_connector_state *hdmi_state)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	const struct drm_connector_state *state = &hdmi_state->base;
+	const struct drm_display_mode *mode =
+		connector_state_get_adjusted_mode(state);
+	struct hdmi_vendor_infoframe *frame = &hdmi_state->infoframes.vendor;
+	int ret;
+
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
+	if (ret == -EINVAL)
+		return 0;
+	else
+		return ret;
+
+	return 0;
+}
+
+static int
+drm_hdmi_connector_generate_infoframes(const struct drm_hdmi_connector *hdmi_connector,
+				       struct drm_hdmi_connector_state *hdmi_state)
+{
+	const struct drm_connector *connector = &hdmi_connector->base;
+	const struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	ret = drm_hdmi_connector_generate_avi_infoframe(hdmi_connector, hdmi_state);
+	if (ret)
+		return ret;
+
+	ret = drm_hdmi_connector_generate_spd_infoframe(hdmi_connector, hdmi_state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Audio Infoframes will be generated by ALSA.
+	 */
+
+	ret = drm_hdmi_connector_generate_hdr_infoframe(hdmi_connector, hdmi_state);
+	if (ret)
+		return ret;
+
+	ret = drm_hdmi_connector_generate_vendor_infoframe(hdmi_connector, hdmi_state);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * drm_atomic_helper_hdmi_connector_atomic_check() - Helper to check HDMI connector atomic state
  * @connector: the parent connector this state refers to
@@ -536,6 +663,10 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 	if (ret)
 		return ret;
 
+	ret = drm_hdmi_connector_generate_infoframes(hdmi_connector, new_hdmi_state);
+	if (ret)
+		return ret;
+
 	if (old_hdmi_state->broadcast_rgb != new_hdmi_state->broadcast_rgb ||
 	    old_hdmi_state->output_format != new_hdmi_state->output_format ||
 	    old_hdmi_state->output_bpc != new_hdmi_state->output_bpc) {
@@ -553,6 +684,152 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_atomic_check);
 
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static int write_infoframe(struct drm_hdmi_connector *hdmi_connector,
+			   union hdmi_infoframe *frame)
+{
+	const struct drm_hdmi_connector_funcs *funcs = hdmi_connector->funcs;
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
+	return funcs->write_infoframe(hdmi_connector, frame->any.type, buffer, len);
+}
+
+static int update_infoframe(struct drm_hdmi_connector *hdmi_connector,
+			    union hdmi_infoframe *frame)
+{
+	int ret;
+
+	ret = write_infoframe(hdmi_connector, frame);
+	if (ret)
+		return ret;
+
+	switch (frame->any.type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		memcpy(&hdmi_connector->infoframes.avi, &frame->avi,
+		       sizeof(hdmi_connector->infoframes.avi));
+		break;
+	case HDMI_INFOFRAME_TYPE_DRM:
+		memcpy(&hdmi_connector->infoframes.drm, &frame->drm,
+		       sizeof(hdmi_connector->infoframes.drm));
+		break;
+	case HDMI_INFOFRAME_TYPE_SPD:
+		memcpy(&hdmi_connector->infoframes.spd, &frame->spd,
+		       sizeof(hdmi_connector->infoframes.spd));
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		memcpy(&hdmi_connector->infoframes.vendor, &frame->vendor,
+		       sizeof(hdmi_connector->infoframes.vendor));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#define UPDATE_INFOFRAME(c, i)					\
+	update_infoframe(c, (union hdmi_infoframe *)&(c)->infoframes.i)
+
+/**
+ * drm_atomic_helper_hdmi_connector_update_infoframes - Update the Infoframes
+ * @hdmi_connector: A pointer to the HDMI connector
+ * @hdmi_state: The HDMI connector state to generate the infoframe from
+ *
+ * This function is meant for HDMI connector drivers to write their
+ * infoframes. It will typically be used in a
+ * @drm_connector_helper_funcs.atomic_enable implementation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_atomic_helper_hdmi_connector_update_infoframes(struct drm_hdmi_connector *hdmi_connector,
+						       struct drm_hdmi_connector_state *hdmi_state)
+{
+	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	mutex_lock(&hdmi_connector->infoframes.lock);
+
+	ret = UPDATE_INFOFRAME(hdmi_connector, avi);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(hdmi_connector, audio);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(hdmi_connector, drm);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(hdmi_connector, spd);
+	if (ret)
+		goto out;
+
+	ret = UPDATE_INFOFRAME(hdmi_connector, vendor);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&hdmi_connector->infoframes.lock);
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_update_infoframes);
+
+#undef UPDATE_INFOFRAME
+
+/**
+ * drm_atomic_helper_hdmi_connector_update_audio_infoframe - Update the Audio Infoframe
+ * @hdmi_connector: A pointer to the HDMI connector
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
+drm_atomic_helper_hdmi_connector_update_audio_infoframe(struct drm_hdmi_connector *hdmi_connector,
+							struct hdmi_audio_infoframe *frame)
+{
+	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	if (!info->has_hdmi_infoframe)
+		return 0;
+
+	mutex_lock(&hdmi_connector->infoframes.lock);
+
+	ret = update_infoframe(hdmi_connector, (union hdmi_infoframe *)frame);
+
+	mutex_unlock(&hdmi_connector->infoframes.lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_update_audio_infoframe);
+
 /**
  * drm_atomic_helper_hdmi_connector_is_full_range() - Checks whether a state uses Full-Range RGB
  * @hdmi_connector: the HDMI connector this state refers to
@@ -634,6 +911,8 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
  * drmm_hdmi_connector_init - Init a preallocated HDMI connector
  * @dev: DRM device
  * @hdmi_connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
@@ -652,6 +931,7 @@ EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
  */
 int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_hdmi_connector_funcs *hdmi_funcs,
 			     int connector_type,
@@ -670,6 +950,13 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	strscpy(hdmi_connector->vendor, vendor, sizeof(hdmi_connector->vendor));
+	strscpy(hdmi_connector->product, product, sizeof(hdmi_connector->product));
+
+	ret = drmm_mutex_init(dev, &hdmi_connector->infoframes.lock);
+	if (ret)
+		return ret;
+
 	prop = hdmi_connector->broadcast_rgb_property;
 	if (!prop) {
 		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 6e25a16420e4..21da6f428101 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2096,6 +2096,32 @@ struct drm_hdmi_connector_state {
 	 * selection value.
 	 */
 	enum drm_hdmi_broadcast_rgb broadcast_rgb;
+
+	/**
+	 * @infoframes: HDMI Infoframes matching that state
+	 */
+	struct {
+		/**
+		 * @avi: AVI Infoframes structure matching our state.
+		 */
+		struct hdmi_avi_infoframe avi;
+
+		/**
+		 * @drm: DRM Infoframes structure matching our state.
+		 */
+		struct hdmi_drm_infoframe drm;
+
+		/**
+		 * @spd: SPD Infoframes structure matching our state.
+		 */
+		struct hdmi_spd_infoframe spd;
+
+		/**
+		 * @vendor: Vendor Infoframes structure matching our
+		 * state.
+		 */
+		struct hdmi_vendor_infoframe vendor;
+	} infoframes;
 };
 
 #define connector_state_to_hdmi_connector_state(state) \
@@ -2127,6 +2153,11 @@ int drm_atomic_helper_hdmi_connector_atomic_check(struct drm_connector *connecto
 void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 						  const struct drm_connector_state *state);
 
+int drm_atomic_helper_hdmi_connector_update_infoframes(struct drm_hdmi_connector *hdmi_connector,
+						       struct drm_hdmi_connector_state *hdmi_state);
+int drm_atomic_helper_hdmi_connector_update_audio_infoframe(struct drm_hdmi_connector *hdmi_connector,
+							    struct hdmi_audio_infoframe *frame);
+
 bool
 drm_atomic_helper_hdmi_connector_is_full_range(const struct drm_hdmi_connector *hdmi_connector,
 					       const struct drm_hdmi_connector_state *hdmi_state);
@@ -2153,6 +2184,23 @@ struct drm_hdmi_connector_funcs {
 	(*tmds_char_rate_valid)(const struct drm_hdmi_connector *connector,
 				const struct drm_display_mode *mode,
 				unsigned long long tmds_rate);
+
+	/**
+	 * @write_infoframe:
+	 *
+	 * This callback is invoked through
+	 * @drm_atomic_helper_hdmi_connector_update_infoframes during a
+	 * commit to program the infoframes into the hardware. It will
+	 * be called multiple times, once for every infoframe type.
+	 *
+	 * The @write_infoframe callback is mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*write_infoframe)(struct drm_hdmi_connector *connector,
+			       enum hdmi_infoframe_type type,
+			       const u8 *buffer, size_t len);
 };
 
 struct drm_hdmi_connector {
@@ -2161,6 +2209,16 @@ struct drm_hdmi_connector {
 	 */
 	struct drm_connector base;
 
+	/**
+	 * @vendor: HDMI Controller Vendor Name
+	 */
+	char vendor[8];
+
+	/**
+	 * @product: HDMI Controller Product Name
+	 */
+	char product[16];
+
 	/**
 	 * @funcs: HDMI connector Control Functions
 	 */
@@ -2176,6 +2234,47 @@ struct drm_hdmi_connector {
 	 * Broadcast RGB selection to output with.
 	 */
 	struct drm_property *broadcast_rgb_property;
+
+	/**
+	 * @infoframes: Current Infoframes output by the connector
+	 */
+	struct {
+		/**
+		 * @lock: Mutex protecting against concurrent access to
+		 * the infoframes, most notably between KMS and ALSA.
+		 */
+		struct mutex lock;
+
+		/**
+		 * @audio: Current Audio Infoframes structure. Protected
+		 * by @lock.
+		 */
+		struct hdmi_audio_infoframe audio;
+
+		/**
+		 * @avi: Current AVI Infoframes structure. Protected by
+		 * @lock.
+		 */
+		struct hdmi_avi_infoframe avi;
+
+		/**
+		 * @drm: Current DRM Infoframes structure. Protected by
+		 * @lock.
+		 */
+		struct hdmi_drm_infoframe drm;
+
+		/**
+		 * @spd: Current SPD Infoframes structure. Protected by
+		 * @lock.
+		 */
+		struct hdmi_spd_infoframe spd;
+
+		/**
+		 * @vendor: Current Vendor Infoframes structure.
+		 * Protected by @lock.
+		 */
+		struct hdmi_vendor_infoframe vendor;
+	} infoframes;
 };
 
 #define connector_to_hdmi_connector(connector) \
@@ -2188,6 +2287,7 @@ drm_hdmi_connector_compute_mode_clock(const struct drm_display_mode *mode,
 
 int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct drm_hdmi_connector *hdmi_connector,
+			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
 			     const struct drm_hdmi_connector_funcs *hdmi_funcs,
 			     int connector_type,

-- 
2.41.0

