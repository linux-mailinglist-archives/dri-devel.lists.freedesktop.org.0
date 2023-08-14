Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76877BAB6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CB810E210;
	Mon, 14 Aug 2023 13:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8D510E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:57:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32838625FD;
 Mon, 14 Aug 2023 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D23C433C9;
 Mon, 14 Aug 2023 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021422;
 bh=JPQX2x+iI21IAczs4dC2NfI3O3fRHsco0qFR057uzd0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JXLrycuMRm+lVnb004gLMNtCTs2WTIGNO9BuLJMeVVZ3fxUSqs46crusEg9WK7hCM
 NOeCc4yclfegJVFC9QxDeK/bhpiw2Ftpsp12gcvBTJkQoFm1i7x7QQH0+lZTx5p2aK
 fjMdSnVUBnT8nwynKGyDK07+CafukAj7jvPd4awTQxECYG2HBXrgm+h2B3VbcW9LEc
 ZjpQkS0X9PwFo/VSW0GdfJDK4qqahSXhyRXKG3IMgT9qSOAdXjMixiRU2o0fgt9KO4
 itZi2DgegGxdHsRXlhExQSP9liAcjAC+sq9B322zYT/BBA+H2dU+IGyCQNfzuJX2rR
 8k9RNy1vENoDA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:25 +0200
Subject: [PATCH RFC 13/13] drm/vc4: hdmi: Switch to HDMI connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-13-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=49401; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JPQX2x+iI21IAczs4dC2NfI3O3fRHsco0qFR057uzd0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNpUf3+svssneVg4iePr3Ykt2ok6/3xO1O1PkTJoP
 WqRfLy9o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPpkmH4716w3zDQKdiUK+/O
 /I7kl11ZXJnns4vWpU9ceY7jXGzdeYZ/9q8+Kmk/3hSyfVmdYpvYUYPXQj08YpeUWItUkqVj2vf
 yAwA=
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

The new HDMI connector infrastructure allows us to remove a lot of
boilerplate, so let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c     | 730 +++++++------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h     |  37 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |   4 +-
 3 files changed, 139 insertions(+), 632 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ac5debd47e99..9a17e5d64b4c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -109,28 +109,10 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static const char * const output_format_str[] = {
-	[VC4_HDMI_OUTPUT_RGB]		= "RGB",
-	[VC4_HDMI_OUTPUT_YUV420]	= "YUV 4:2:0",
-	[VC4_HDMI_OUTPUT_YUV422]	= "YUV 4:2:2",
-	[VC4_HDMI_OUTPUT_YUV444]	= "YUV 4:4:4",
-};
-
-static const char *vc4_hdmi_output_fmt_str(enum vc4_hdmi_output_format fmt)
-{
-	if (fmt >= ARRAY_SIZE(output_format_str))
-		return "invalid";
-
-	return output_format_str[fmt];
-}
-
-static unsigned long long
-vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc, enum vc4_hdmi_output_format fmt);
-
 static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
+	struct drm_display_info *display = &connector->display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
@@ -148,31 +130,16 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 					   unsigned int bpc,
 					   enum vc4_hdmi_output_format fmt)
 {
-	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
+	unsigned long long clock = drm_hdmi_connector_compute_mode_clock(mode, bpc, fmt);
 
 	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
-static bool vc4_hdmi_is_full_range(struct vc4_hdmi *vc4_hdmi,
-				   struct vc4_hdmi_connector_state *vc4_state)
-{
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_LIMITED)
-		return false;
-	else if (vc4_state->broadcast_rgb == VC4_HDMI_BROADCAST_RGB_FULL)
-		return true;
-
-	return !display->is_hdmi ||
-		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
-}
-
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
 	struct vc4_hdmi *vc4_hdmi = entry->file.data;
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
@@ -195,7 +162,7 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 
 static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -228,7 +195,7 @@ static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 
 static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -257,7 +224,7 @@ static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long cec_rate;
 	unsigned long flags;
 	u16 clk_cnt;
@@ -410,7 +377,7 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    struct drm_modeset_acquire_ctx *ctx,
 				    enum drm_connector_status status)
 {
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct edid *edid;
 	int ret;
 
@@ -534,12 +501,8 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 {
 	struct drm_connector_state *old_state =
 		drm_atomic_get_old_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *old_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(old_state);
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *new_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 
 	if (!crtc)
@@ -571,9 +534,7 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 			return ret;
 	}
 
-	if (old_state->colorspace != new_state->colorspace ||
-	    old_vc4_state->broadcast_rgb != new_vc4_state->broadcast_rgb ||
-	    !drm_connector_atomic_hdr_metadata_equal(old_state, new_state)) {
+	if (old_state->colorspace != new_state->colorspace) {
 		struct drm_crtc_state *crtc_state;
 
 		crtc_state = drm_atomic_get_crtc_state(state, crtc);
@@ -583,112 +544,23 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 		crtc_state->mode_changed = true;
 	}
 
-	return 0;
-}
-
-static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
-					   const struct drm_connector_state *state,
-					   struct drm_property *property,
-					   uint64_t *val)
-{
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi =
-		connector_to_vc4_hdmi(connector);
-	const struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	if (property == vc4_hdmi->broadcast_rgb_property) {
-		*val = vc4_conn_state->broadcast_rgb;
-	} else {
-		drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
-			property->base.id, property->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
-					   struct drm_connector_state *state,
-					   struct drm_property *property,
-					   uint64_t val)
-{
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi =
-		connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	if (property == vc4_hdmi->broadcast_rgb_property) {
-		vc4_conn_state->broadcast_rgb = val;
-		return 0;
-	}
-
-	drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
-		property->base.id, property->name);
-	return -EINVAL;
+	return drm_atomic_helper_hdmi_connector_atomic_check(connector, state);
 }
 
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
-	struct vc4_hdmi_connector_state *old_state =
-		conn_state_to_vc4_hdmi_conn_state(connector->state);
-	struct vc4_hdmi_connector_state *new_state =
-		kzalloc(sizeof(*new_state), GFP_KERNEL);
-
-	if (connector->state)
-		__drm_atomic_helper_connector_destroy_state(connector->state);
-
-	kfree(old_state);
-	__drm_atomic_helper_connector_reset(connector, &new_state->base);
-
-	if (!new_state)
-		return;
-
-	new_state->base.max_bpc = 8;
-	new_state->base.max_requested_bpc = 8;
-	new_state->output_format = VC4_HDMI_OUTPUT_RGB;
-	new_state->broadcast_rgb = VC4_HDMI_BROADCAST_RGB_AUTO;
+	drm_atomic_helper_hdmi_connector_reset(connector);
 	drm_atomic_helper_connector_tv_margins_reset(connector);
 }
 
-static struct drm_connector_state *
-vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
-{
-	struct drm_connector_state *conn_state = connector->state;
-	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
-	struct vc4_hdmi_connector_state *new_state;
-
-	new_state = kzalloc(sizeof(*new_state), GFP_KERNEL);
-	if (!new_state)
-		return NULL;
-
-	new_state->tmds_char_rate = vc4_state->tmds_char_rate;
-	new_state->output_bpc = vc4_state->output_bpc;
-	new_state->output_format = vc4_state->output_format;
-	new_state->broadcast_rgb = vc4_state->broadcast_rgb;
-	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
-
-	return &new_state->base;
-}
-
-static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
-					     struct drm_connector_state *state)
-{
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-
-	__drm_atomic_helper_connector_destroy_state(state);
-	kfree(vc4_state);
-}
-
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
-	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
-	.atomic_destroy_state = vc4_hdmi_connector_destroy_state,
-	.atomic_get_property = vc4_hdmi_connector_get_property,
-	.atomic_set_property = vc4_hdmi_connector_set_property,
+	.atomic_duplicate_state = drm_atomic_helper_hdmi_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_hdmi_connector_destroy_state,
+	.atomic_get_property = drm_atomic_helper_hdmi_connector_get_property,
+	.atomic_set_property = drm_atomic_helper_hdmi_connector_set_property,
+	.debugfs_init = drm_helper_hdmi_connector_debugfs_init,
 };
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
@@ -697,44 +569,23 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 };
 
-static const struct drm_prop_enum_list broadcast_rgb_names[] = {
-	{ VC4_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
-	{ VC4_HDMI_BROADCAST_RGB_FULL, "Full" },
-	{ VC4_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
-};
-
-static void
-vc4_hdmi_attach_broadcast_rgb_property(struct drm_device *dev,
-				       struct vc4_hdmi *vc4_hdmi)
-{
-	struct drm_property *prop = vc4_hdmi->broadcast_rgb_property;
-
-	if (!prop) {
-		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
-						"Broadcast RGB",
-						broadcast_rgb_names,
-						ARRAY_SIZE(broadcast_rgb_names));
-		if (!prop)
-			return;
-
-		vc4_hdmi->broadcast_rgb_property = prop;
-	}
-
-	drm_object_attach_property(&vc4_hdmi->connector.base, prop,
-				   VC4_HDMI_BROADCAST_RGB_AUTO);
-}
+static const struct drm_hdmi_connector_funcs vc4_hdmi_hdmi_connector_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &hdmi_connector->base;
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
-	ret = drmm_connector_init(dev, connector,
-				  &vc4_hdmi_connector_funcs,
-				  DRM_MODE_CONNECTOR_HDMIA,
-				  vc4_hdmi->ddc);
+	ret = drmm_hdmi_connector_init(dev, hdmi_connector,
+				       "Broadcom", "Videocore",
+				       &vc4_hdmi_connector_funcs,
+				       &vc4_hdmi_hdmi_connector_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       vc4_hdmi->ddc,
+				       12);
 	if (ret)
 		return ret;
 
@@ -758,7 +609,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	drm_connector_attach_colorspace_property(connector);
 	drm_connector_attach_tv_margin_properties(connector);
-	drm_connector_attach_max_bpc_property(connector, 8, 12);
 
 	connector->polled = (DRM_CONNECTOR_POLL_CONNECT |
 			     DRM_CONNECTOR_POLL_DISCONNECT);
@@ -767,22 +617,16 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	connector->doublescan_allowed = 0;
 	connector->stereo_allowed = 1;
 
-	if (vc4_hdmi->variant->supports_hdr)
-		drm_connector_attach_hdr_output_metadata_property(connector);
-
-	vc4_hdmi_attach_broadcast_rgb_property(dev, vc4_hdmi);
-
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
 }
 
-static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
+static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 				enum hdmi_infoframe_type type,
 				bool poll)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	u32 packet_id = type - 0x80;
 	unsigned long flags;
 	int ret = 0;
@@ -805,12 +649,13 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 	return ret;
 }
 
-static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
-				     union hdmi_infoframe *frame)
+static int vc4_hdmi_write_infoframe(struct drm_hdmi_connector *hdmi_connector,
+				    enum hdmi_infoframe_type type,
+				    const u8 *buffer, size_t len)
 {
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	u32 packet_id = frame->any.type - 0x80;
+	struct vc4_hdmi *vc4_hdmi = hdmi_connector_to_vc4_hdmi(hdmi_connector);
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
+	u32 packet_id = type - 0x80;
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
 	u32 packet_reg = ram_packet_start->offset + VC4_HDMI_PACKET_STRIDE * packet_id;
@@ -818,24 +663,19 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		VC4_HDMI_PACKET_STRIDE * (packet_id + 1);
 	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
 						       ram_packet_start->reg);
-	uint8_t buffer[VC4_HDMI_PACKET_STRIDE] = {};
 	unsigned long flags;
-	ssize_t len, i;
+	ssize_t i;
 	int ret;
 	int idx;
 
 	if (!drm_dev_enter(drm, &idx))
-		return;
+		return 0;
 
 	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
 		    VC4_HDMI_RAM_PACKET_ENABLE),
 		  "Packet RAM has to be on to store the packet.");
 
-	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
-	if (len < 0)
-		goto out;
-
-	ret = vc4_hdmi_stop_packet(encoder, frame->any.type, true);
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
 	if (ret) {
 		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
 		goto out;
@@ -877,130 +717,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 
 out:
 	drm_dev_exit(idx);
-}
-
-static void vc4_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
-					      enum vc4_hdmi_output_format fmt)
-{
-	switch (fmt) {
-	case VC4_HDMI_OUTPUT_RGB:
-		frame->colorspace = HDMI_COLORSPACE_RGB;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV420:
-		frame->colorspace = HDMI_COLORSPACE_YUV420;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV422:
-		frame->colorspace = HDMI_COLORSPACE_YUV422;
-		break;
-
-	case VC4_HDMI_OUTPUT_YUV444:
-		frame->colorspace = HDMI_COLORSPACE_YUV444;
-		break;
-
-	default:
-		break;
-	}
-}
-
-static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *cstate = connector->state;
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(cstate);
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	union hdmi_infoframe frame;
-	int ret;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						       connector, mode);
-	if (ret < 0) {
-		DRM_ERROR("couldn't fill AVI infoframe\n");
-		return;
-	}
-
-	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
-					   connector, mode,
-					   vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ?
-					   HDMI_QUANTIZATION_RANGE_FULL :
-					   HDMI_QUANTIZATION_RANGE_LIMITED);
-	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
-	vc4_hdmi_avi_infoframe_colorspace(&frame.avi, vc4_state->output_format);
-	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
-{
-	union hdmi_infoframe frame;
-	int ret;
-
-	ret = hdmi_spd_infoframe_init(&frame.spd, "Broadcom", "Videocore");
-	if (ret < 0) {
-		DRM_ERROR("couldn't fill SPD infoframe\n");
-		return;
-	}
-
-	frame.spd.sdi = HDMI_SPD_SDI_PC;
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct hdmi_audio_infoframe *audio = &vc4_hdmi->audio.infoframe;
-	union hdmi_infoframe frame;
-
-	memcpy(&frame.audio, audio, sizeof(*audio));
-
-	if (vc4_hdmi->packet_ram_enabled)
-		vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_hdr_infoframe(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *conn_state = connector->state;
-	union hdmi_infoframe frame;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!vc4_hdmi->variant->supports_hdr)
-		return;
-
-	if (!conn_state->hdr_output_metadata)
-		return;
-
-	if (drm_hdmi_infoframe_set_hdr_metadata(&frame.drm, conn_state))
-		return;
-
-	vc4_hdmi_write_infoframe(encoder, &frame);
-}
-
-static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	vc4_hdmi_set_avi_infoframe(encoder);
-	vc4_hdmi_set_spd_infoframe(encoder);
-	/*
-	 * If audio was streaming, then we need to reenabled the audio
-	 * infoframe here during encoder_enable.
-	 */
-	if (vc4_hdmi->audio.streaming)
-		vc4_hdmi_set_audio_infoframe(encoder);
-
-	vc4_hdmi_set_hdr_infoframe(encoder);
+	return ret;
 }
 
 #define SCRAMBLING_POLLING_DELAY_MS	1000
@@ -1008,7 +725,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
@@ -1046,7 +763,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_device *drm = connector->dev;
 	unsigned long flags;
 	int idx;
@@ -1080,7 +797,7 @@ static void vc4_hdmi_scrambling_wq(struct work_struct *work)
 	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
 						 struct vc4_hdmi,
 						 scrambling_work);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 
 	if (drm_scdc_get_scrambling_status(connector))
 		return;
@@ -1096,7 +813,7 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -1134,7 +851,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int ret;
 	int idx;
@@ -1169,9 +886,13 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
+	bool is_lim_range =
+		drm_atomic_helper_hdmi_connector_is_full_range(hdmi_connector,
+							       hdmi_state);
 	unsigned long flags;
 	u32 csc_ctl;
 	int idx;
@@ -1184,7 +905,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (!vc4_hdmi_is_full_range(vc4_hdmi, vc4_state)) {
+	if (!is_lim_range) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1406,10 +1127,13 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
-	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
+	struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
+	unsigned int lim_range =
+		drm_atomic_helper_hdmi_connector_is_full_range(hdmi_connector,
+							       hdmi_state) ? 0 : 1;
 	unsigned long flags;
 	const u16 (*csc)[4];
 	u32 if_cfg = 0;
@@ -1424,14 +1148,14 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	switch (vc4_state->output_format) {
-	case VC4_HDMI_OUTPUT_YUV444:
+	switch (hdmi_state->output_format) {
+	case HDMI_COLORSPACE_YUV444:
 		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
 
 		vc5_hdmi_set_csc_coeffs_swap(vc4_hdmi, csc);
 		break;
 
-	case VC4_HDMI_OUTPUT_YUV422:
+	case HDMI_COLORSPACE_YUV422:
 		csc = vc5_hdmi_find_yuv_csc_coeffs(vc4_hdmi, state->colorspace, !!lim_range);
 
 		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
@@ -1448,7 +1172,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, csc);
 		break;
 
-	case VC4_HDMI_OUTPUT_RGB:
+	case HDMI_COLORSPACE_RGB:
 		if_xbar = 0x354021;
 
 		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_rgb[lim_range]);
@@ -1472,7 +1196,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -1536,9 +1260,9 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	const struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(state);
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
+	const struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -1590,7 +1314,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (vc4_state->output_bpc) {
+	switch (hdmi_state->output_bpc) {
 	case 12:
 		gcp = 6;
 		break;
@@ -1607,7 +1331,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	 * YCC422 is always 36-bit and not considered deep colour so
 	 * doesn't signal in GCP.
 	 */
-	if (vc4_state->output_format == VC4_HDMI_OUTPUT_YUV422) {
+	if (hdmi_state->output_format == HDMI_COLORSPACE_YUV422) {
 		gcp = 0;
 	}
 
@@ -1643,7 +1367,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	u32 drift;
 	int ret;
@@ -1687,14 +1411,14 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 						struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
-	struct vc4_hdmi_connector_state *vc4_conn_state =
-		conn_state_to_vc4_hdmi_conn_state(conn_state);
+	struct drm_hdmi_connector_state *hdmi_conn_state =
+		connector_state_to_hdmi_connector_state(conn_state);
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	unsigned long tmds_char_rate = vc4_conn_state->tmds_char_rate;
+	unsigned long tmds_char_rate = hdmi_conn_state->tmds_char_rate;
 	unsigned long bvb_rate, hsm_rate;
 	unsigned long flags;
 	int ret;
@@ -1771,7 +1495,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	}
 
 	if (vc4_hdmi->variant->phy_init)
-		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
+		vc4_hdmi->variant->phy_init(vc4_hdmi, hdmi_conn_state);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1806,8 +1530,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
+	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
@@ -1836,9 +1560,15 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &hdmi_connector->base;
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_hdmi_connector_state *new_hdmi_state =
+		connector_state_to_hdmi_connector_state(new_conn_state);
+	struct drm_device *drm = connector->dev;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+	struct drm_display_info *display = &connector->display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1901,10 +1631,11 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 		vc4_hdmi->packet_ram_enabled = true;
-
-		vc4_hdmi_set_infoframes(encoder);
 	}
 
+	drm_atomic_helper_hdmi_connector_update_infoframes(hdmi_connector,
+							   new_hdmi_state);
+
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 	vc4_hdmi_enable_scrambling(encoder);
 
@@ -1919,109 +1650,25 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_connector_state *vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(conn_state);
+	const struct drm_hdmi_connector_state *hdmi_state =
+		connector_state_to_hdmi_connector_state(conn_state);
 
 	mutex_lock(&vc4_hdmi->mutex);
 	drm_mode_copy(&vc4_hdmi->saved_adjusted_mode,
 		      &crtc_state->adjusted_mode);
-	vc4_hdmi->output_bpc = vc4_state->output_bpc;
-	vc4_hdmi->output_format = vc4_state->output_format;
+	vc4_hdmi->output_bpc = hdmi_state->output_bpc;
+	vc4_hdmi->output_format = hdmi_state->output_format;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static bool
-vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
-				  const struct drm_display_info *info,
-				  const struct drm_display_mode *mode,
-				  unsigned int format, unsigned int bpc)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	u8 vic = drm_match_cea_mode(mode);
-
-	if (vic == 1 && bpc != 8) {
-		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
-		return false;
-	}
-
-	if (!info->is_hdmi &&
-	    (format != VC4_HDMI_OUTPUT_RGB || bpc != 8)) {
-		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
-		return false;
-	}
-
-	switch (format) {
-	case VC4_HDMI_OUTPUT_RGB:
-		drm_dbg(dev, "RGB Format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
-			return false;
-
-		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
-			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
-			return false;
-		}
-
-		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
-			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "RGB format supported in that configuration.\n");
-
-		return true;
-
-	case VC4_HDMI_OUTPUT_YUV422:
-		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
-			drm_dbg(dev, "Sink doesn't support YUV422.\n");
-			return false;
-		}
-
-		if (bpc != 12) {
-			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
-
-		return true;
-
-	case VC4_HDMI_OUTPUT_YUV444:
-		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
-
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
-			drm_dbg(dev, "Sink doesn't support YUV444.\n");
-			return false;
-		}
-
-		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
-			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
-			return false;
-		}
-
-		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
-			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
-			return false;
-		}
-
-		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
-
-		return true;
-	}
-
-	return false;
-}
-
 static enum drm_mode_status
-vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
-			     const struct drm_display_mode *mode,
-			     unsigned long long clock)
+vc4_hdmi_connector_clock_valid(const struct drm_hdmi_connector *hdmi_connector,
+			       const struct drm_display_mode *mode,
+			       unsigned long long clock)
 {
-	const struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_display_info *info = &connector->display_info;
-	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
+	const struct drm_connector *connector = &hdmi_connector->base;
+	const struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	const struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
@@ -2035,125 +1682,13 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	    drm_mode_vrefresh(mode) >= 50)
 		return MODE_CLOCK_HIGH;
 
-	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
-		return MODE_CLOCK_HIGH;
-
 	return MODE_OK;
 }
 
-static unsigned long long
-vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
-				    unsigned int bpc,
-				    enum vc4_hdmi_output_format fmt)
-{
-	unsigned long long clock = mode->clock * 1000ULL;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		clock = clock * 2;
-
-	if (fmt == VC4_HDMI_OUTPUT_YUV422)
-		bpc = 8;
-
-	clock = clock * bpc;
-	do_div(clock, 8);
-
-	return clock;
-}
-
-static int
-vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
-			       struct vc4_hdmi_connector_state *vc4_state,
-			       const struct drm_display_mode *mode,
-			       unsigned int bpc, unsigned int fmt)
-{
-	unsigned long long clock;
-
-	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, clock) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->tmds_char_rate = clock;
-
-	return 0;
-}
-
-static int
-vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
-				struct vc4_hdmi_connector_state *vc4_state,
-				const struct drm_display_mode *mode,
-				unsigned int bpc)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	const struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_display_info *info = &connector->display_info;
-	unsigned int format;
-
-	drm_dbg(dev, "Trying with an RGB output\n");
-
-	format = VC4_HDMI_OUTPUT_RGB;
-	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
-		int ret;
-
-		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
-						     mode, bpc, format);
-		if (!ret) {
-			vc4_state->output_format = format;
-			return 0;
-		}
-	}
-
-	drm_dbg(dev, "Failed, Trying with an YUV422 output\n");
-
-	format = VC4_HDMI_OUTPUT_YUV422;
-	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, bpc)) {
-		int ret;
-
-		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
-						     mode, bpc, format);
-		if (!ret) {
-			vc4_state->output_format = format;
-			return 0;
-		}
-	}
-
-	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
-
-	return -EINVAL;
-}
-
-static int
-vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
-				struct vc4_hdmi_connector_state *vc4_state,
-				const struct drm_display_mode *mode)
-{
-	struct drm_device *dev = vc4_hdmi->connector.dev;
-	struct drm_connector_state *conn_state = &vc4_state->base;
-	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
-	unsigned int bpc;
-	int ret;
-
-	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
-
-		ret = vc4_hdmi_encoder_compute_format(vc4_hdmi, vc4_state,
-						      mode, bpc);
-		if (ret)
-			continue;
-
-		vc4_state->output_bpc = bpc;
-
-		drm_dbg(dev,
-			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
-			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
-			vc4_state->output_bpc,
-			vc4_hdmi_output_fmt_str(vc4_state->output_format),
-			vc4_state->tmds_char_rate);
-
-		break;
-	}
-
-	return ret;
-}
+static const struct drm_hdmi_connector_funcs vc4_hdmi_hdmi_connector_funcs = {
+	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.write_infoframe	= vc4_hdmi_write_infoframe,
+};
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
@@ -2163,16 +1698,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_connector_state *old_conn_state =
-		drm_atomic_get_old_connector_state(conn_state->state, connector);
-	struct vc4_hdmi_connector_state *old_vc4_state =
-		conn_state_to_vc4_hdmi_conn_state(old_conn_state);
-	struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	unsigned long long tmds_char_rate = mode->clock * 1000;
 	unsigned long long tmds_bit_rate;
-	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings) {
 		if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
@@ -2208,15 +1736,6 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		tmds_char_rate = mode->clock * 1000;
 	}
 
-	ret = vc4_hdmi_encoder_compute_config(vc4_hdmi, vc4_state, mode);
-	if (ret)
-		return ret;
-
-	/* vc4_hdmi_encoder_compute_config may have changed output_bpc and/or output_format */
-	if (vc4_state->output_bpc != old_vc4_state->output_bpc ||
-	    vc4_state->output_format != old_vc4_state->output_format)
-		crtc_state->mode_changed = true;
-
 	return 0;
 }
 
@@ -2225,6 +1744,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -2232,7 +1752,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
+	return vc4_hdmi_connector_clock_valid(hdmi_connector, mode, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
@@ -2283,7 +1803,7 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 
 static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	u32 hotplug;
 	int idx;
@@ -2304,7 +1824,7 @@ static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 					 unsigned int samplerate)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	u32 hsm_clock;
 	unsigned long flags;
 	unsigned long n, m;
@@ -2366,7 +1886,8 @@ static inline struct vc4_hdmi *dai_to_hdmi(struct snd_soc_dai *dai)
 
 static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
+	struct drm_display_info *display = &connector->display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
@@ -2383,7 +1904,7 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int ret = 0;
 	int idx;
@@ -2424,7 +1945,6 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	unsigned long flags;
 	int ret;
@@ -2432,7 +1952,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
 	vc4_hdmi->audio.streaming = false;
-	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, HDMI_INFOFRAME_TYPE_AUDIO, false);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
@@ -2448,7 +1968,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -2522,8 +2042,8 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
+	struct drm_hdmi_connector *hdmi_connector = &vc4_hdmi->connector;
+	struct drm_device *drm = hdmi_connector->base.dev;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2600,8 +2120,10 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
-	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
-	vc4_hdmi_set_audio_infoframe(encoder);
+	ret = drm_atomic_helper_hdmi_connector_update_audio_infoframe(hdmi_connector,
+								      &params->cea);
+	if (ret)
+		goto out_dev_exit;
 
 out_dev_exit:
 	drm_dev_exit(idx);
@@ -2649,7 +2171,7 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 				  uint8_t *buf, size_t len)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 
 	mutex_lock(&vc4_hdmi->mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
@@ -2832,7 +2354,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct drm_device *dev = connector->dev;
 
 	if (dev && dev->registered)
@@ -2843,7 +2365,7 @@ static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 
 static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_connector *connector = &vc4_hdmi->connector.base;
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	int ret;
 
@@ -2916,7 +2438,7 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 
 static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.base.dev;
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
@@ -3056,7 +2578,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	unsigned long flags;
@@ -3123,7 +2645,7 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -3167,7 +2689,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	int idx;
 
@@ -3196,7 +2718,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.base.dev;
 	unsigned long flags;
 	u32 val;
 	unsigned int i;
@@ -3273,7 +2795,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	if (ret < 0)
 		return ret;
 
-	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
+	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector.base);
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
 	if (vc4_hdmi->variant->external_irq_controller) {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 934d5d61485a..1e2752798bbb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -76,7 +76,7 @@ struct vc4_hdmi_variant {
 
 	/* Callback to initialize the PHY according to the connector state */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
-			 struct vc4_hdmi_connector_state *vc4_conn_state);
+			 struct drm_hdmi_connector_state *vc4_conn_state);
 
 	/* Callback to disable the PHY */
 	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
@@ -117,12 +117,6 @@ enum vc4_hdmi_output_format {
 	VC4_HDMI_OUTPUT_YUV420,
 };
 
-enum vc4_hdmi_broadcast_rgb {
-	VC4_HDMI_BROADCAST_RGB_AUTO,
-	VC4_HDMI_BROADCAST_RGB_FULL,
-	VC4_HDMI_BROADCAST_RGB_LIMITED,
-};
-
 /* General HDMI hardware state. */
 struct vc4_hdmi {
 	struct vc4_hdmi_audio audio;
@@ -131,12 +125,10 @@ struct vc4_hdmi {
 	const struct vc4_hdmi_variant *variant;
 
 	struct vc4_encoder encoder;
-	struct drm_connector connector;
+	struct drm_hdmi_connector connector;
 
 	struct delayed_work scrambling_work;
 
-	struct drm_property *broadcast_rgb_property;
-
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
@@ -218,8 +210,8 @@ struct vc4_hdmi {
 	bool scdc_enabled;
 
 	/**
-	 * @output_bpc: Copy of @vc4_connector_state.output_bpc for use
-	 * outside of KMS hooks. Protected by @mutex.
+	 * @output_bpc: Copy of @drm_hdmi_connector_state.output_bpc for
+	 * use outside of KMS hooks. Protected by @mutex.
 	 */
 	unsigned int output_bpc;
 
@@ -230,9 +222,13 @@ struct vc4_hdmi {
 	enum vc4_hdmi_output_format output_format;
 };
 
-#define connector_to_vc4_hdmi(_connector)				\
+#define hdmi_connector_to_vc4_hdmi(_connector)				\
 	container_of_const(_connector, struct vc4_hdmi, connector)
 
+#define connector_to_vc4_hdmi(_connector)				\
+	container_of_const(_connector, struct vc4_hdmi, connector.base)
+
+
 static inline struct vc4_hdmi *
 encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 {
@@ -240,25 +236,14 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 	return container_of_const(_encoder, struct vc4_hdmi, encoder);
 }
 
-struct vc4_hdmi_connector_state {
-	struct drm_connector_state	base;
-	unsigned long long		tmds_char_rate;
-	unsigned int 			output_bpc;
-	enum vc4_hdmi_output_format	output_format;
-	enum vc4_hdmi_broadcast_rgb	broadcast_rgb;
-};
-
-#define conn_state_to_vc4_hdmi_conn_state(_state)			\
-	container_of_const(_state, struct vc4_hdmi_connector_state, base)
-
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *vc4_conn_state);
+		       struct drm_hdmi_connector_state *conn_state);
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
 
 void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *vc4_conn_state);
+		       struct drm_hdmi_connector_state *conn_state);
 void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
 void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index ec24999bf96d..54deb30306df 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -128,7 +128,7 @@
 #define OSCILLATOR_FREQUENCY	54000000
 
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *conn_state)
+		       struct drm_hdmi_connector_state *conn_state)
 {
 	unsigned long flags;
 
@@ -361,7 +361,7 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
 }
 
 void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
-		       struct vc4_hdmi_connector_state *conn_state)
+		       struct drm_hdmi_connector_state *conn_state)
 {
 	const struct phy_lane_settings *chan0_settings, *chan1_settings, *chan2_settings, *clock_settings;
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;

-- 
2.41.0

