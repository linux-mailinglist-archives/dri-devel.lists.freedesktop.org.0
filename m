Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B47DD2AD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97710E579;
	Tue, 31 Oct 2023 16:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816610E577
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:48:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E4ECDB81185;
 Tue, 31 Oct 2023 16:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDC6C433C9;
 Tue, 31 Oct 2023 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770932;
 bh=imyjYQb9m3BKL9OeHOQ88cy0zO9XOMWzQrhSaz1bFUA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tB9aGWaA6mjOhcYnPSmWdlEHHLuUP3+HAJv0diji1FEvMEJ9OLUsEWJ01ZWl6viB4
 IZdw2BjYKKqFr5sjNvyVidNSX2fTeetvknVUw0qrmuLU0dk4+1fo4DazewzUBnuCAf
 42F4bpzrYRYiCpcYTPgvKeQxIUx9gEqqECZ2qe5dShZ6AQ1VwND80GtB4X9M/EomLS
 tZb75vfK0KL5kXXmez7A6L0oAf0gnxAyw/RsazRjKN+qKJxVM4DQQBvb7/OA5/75RM
 cWMh2hmlBCquUnbikmiuA3RRJb6zR8e2vdjJBKAuEuxpRhQU6LdvjHLyjkS52DiHX0
 lI/lNafIGghRw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:19 +0100
Subject: [PATCH RFC v3 06/37] drm/connector: hdmi: Add support for output
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-6-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6141; i=mripard@kernel.org;
 h=from:subject:message-id; bh=imyjYQb9m3BKL9OeHOQ88cy0zO9XOMWzQrhSaz1bFUA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+veWv1zVfZV9loqJ9LcLE3csjJR+o2bVp6yeIqaRs
 sTXTnd+RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayyYvhv5fmtDezlt97smH/
 pN8HJiVyaZW/+/cgdesEK58zsccOL1ZgZPjvp36p92XrhfKTr+xa9LdOz9wz/QyTVf0yWakLK4+
 WrmIAAA==
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

Just like BPC, we'll add support for automatic selection of the output
format for HDMI connectors.

Let's add the needed defaults and fields for now.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c              |  2 ++
 drivers/gpu/drm/drm_atomic_state_helper.c |  4 +++-
 drivers/gpu/drm/drm_connector.c           | 28 ++++++++++++++++++++++++++++
 include/drm/drm_connector.h               | 16 ++++++++++++++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 51aac1b2aaaf..0ebe1142dcfe 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1148,6 +1148,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
 		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
+		drm_printf(p, "\toutput_format=%s\n",
+			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 406ba358aa14..37262dd002c8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -575,6 +575,7 @@ void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 	new_state->max_bpc = max_bpc;
 	new_state->max_requested_bpc = max_bpc;
 	new_state->hdmi.output_bpc = max_bpc;
+	new_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -692,7 +693,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
-	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
+	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 508d1c667732..9037e1b1b383 100644
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
@@ -489,6 +491,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	connector->hdmi.supported_formats = supported_formats;
+
 	if (max_bpc) {
 		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 			return -EINVAL;
@@ -1215,6 +1219,30 @@ drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_
 }
 EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
 
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
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2d664b6ac0a6..32f0b3b7383e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -391,6 +391,8 @@ enum drm_hdmi_broadcast_rgb {
 
 const char *
 drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
+const char *
+drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
 
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
@@ -1064,6 +1066,11 @@ struct drm_connector_state {
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
 
@@ -1930,6 +1937,14 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	struct {
+		/**
+		 * @supported_formats: Bitmask of @hdmi_colorspace
+		 * supported by the controller.
+		 */
+		unsigned long supported_formats;
+	} hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -1953,6 +1968,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
 			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);

-- 
2.41.0

