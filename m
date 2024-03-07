Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48F875045
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAE410F464;
	Thu,  7 Mar 2024 13:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GIudKkeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0B10E6C0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:39:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A4C261465;
 Thu,  7 Mar 2024 13:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6071C43601;
 Thu,  7 Mar 2024 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709818759;
 bh=knNLcwVqg8jv1l/rgrHhTRsj59b8/zn3xoeOIeIyJfk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GIudKkeoDkMn+BtPXzwCpS6xMMrGuBZ7UV0fROChdqK4tX3gTXq98vHz2Bl/MaCPT
 /cAT78VQ9RE3ne+lj4+xlS/m4QvUEk+c37XfyIBPDL6OZ7YHWjfpfLyqmFpmDsop+r
 CzVLcXvjeWpVuq6xpe/X+fD+35WvgxTGJgvaQHnNrEXAMOvCQEZMdrT86sQzc/tB6h
 npjDzMohXJUalDiYu7oPusTqBamuw8+4a6I2+v9s5ORSv+u2xTk2VgISUoJ6VjZ63r
 XJeijMh219Wgf2GjpVlsoO0ZdEqUFyGGdVD4EXSrLQFDvcXwX1CONHaS6ZIxryGQOf
 3QaVuZIaZDGhQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Mar 2024 14:38:35 +0100
Subject: [PATCH v8 08/27] drm/connector: hdmi: Add HDMI compute clock
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms-hdmi-connector-state-v8-8-ef6a6f31964b@kernel.org>
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4451; i=mripard@kernel.org;
 h=from:subject:message-id; bh=knNLcwVqg8jv1l/rgrHhTRsj59b8/zn3xoeOIeIyJfk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKkvDye8FffR6jZ5UdDre3Ujn+Omhbc/L9T6ee1s1WcPr
 617Nu6611HKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJZE5k+O/gJsh9RN9fcILC
 px9r4m5tPCu7xeeNnuR+C5+CiwUSR/8zMqxlU/9f+vOk/O+/M7sXNgu0q31uso5d6hzooJ6aNPc
 OAzMA
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

A lot of HDMI drivers have some variation of the formula to calculate
the TMDS character rate from a mode, but few of them actually take all
parameters into account.

Let's create a helper to provide that rate taking all parameters into
account.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 71 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b629c8e990f4..8cc1332f11c2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2895,10 +2895,81 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
 	/* The hw_state property value may have changed, update it. */
 	drm_connector_update_privacy_screen_properties(connector, false);
 }
 EXPORT_SYMBOL(drm_connector_update_privacy_screen);
 
+/**
+ * drm_connector_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
+ * @mode: Display mode to compute the clock for
+ * @bpc: Bits per character
+ * @fmt: Output Pixel Format used
+ *
+ * Returns the TMDS Character Rate for a given mode, bpc count and output format.
+ *
+ * RETURNS:
+ * The TMDS Character Rate, in Hertz, or 0 on error.
+ */
+unsigned long long
+drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+				      unsigned int bpc,
+				      enum hdmi_colorspace fmt)
+{
+	unsigned long long clock = mode->clock * 1000ULL;
+	unsigned int vic = drm_match_cea_mode(mode);
+
+	/*
+	 * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
+	 * mandates that VIC 1 always uses 8 bpc.
+	 */
+	if (vic == 1 && bpc != 8)
+		return 0;
+
+	/*
+	 * HDMI 2.0 Spec, section 7.1 - YCbCr 4:2:0 Pixel Encoding
+	 * specifies that YUV420 encoding is only available for those
+	 * VICs.
+	 */
+	if (fmt == HDMI_COLORSPACE_YUV420 &&
+	    !(vic == 96 || vic == 97 || vic == 101 ||
+	      vic == 102 || vic == 106 || vic == 107))
+		return 0;
+
+	if (fmt == HDMI_COLORSPACE_YUV422) {
+		/*
+		 * HDMI 1.4b Spec, section 6.2.3 - Pixel Encoding Requirements
+		 * specifies that YUV422 is 36-bit only.
+		 */
+		if (bpc != 12)
+			return 0;
+
+		/*
+		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding
+		 * specifies that YUV422 requires two 12-bits components per
+		 * pixel clock, which is equivalent in our calculation to three
+		 * 8-bits components
+		 */
+		bpc = 8;
+	}
+
+	/*
+	 * HDMI 2.0 Spec, Section 7.1 - YCbCr 4:2:0 Pixel Encoding
+	 * specifies that YUV420 encoding is carried at a TMDS Character Rate
+	 * equal to half the pixel clock rate.
+	 */
+	if (fmt == HDMI_COLORSPACE_YUV420)
+		clock = clock / 2;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	clock = clock * bpc;
+	do_div(clock, 8);
+
+	return clock;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_compute_mode_clock);
+
 int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 				    struct drm_property *property,
 				    uint64_t value)
 {
 	int ret = -EINVAL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 29883e6f8e50..a859ad7ee04b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -36,10 +36,11 @@
 
 struct drm_connector_helper_funcs;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 struct drm_crtc;
+struct drm_display_mode;
 struct drm_encoder;
 struct drm_panel;
 struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
@@ -2092,10 +2093,14 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
 void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
 void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
+unsigned long long
+drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+				      unsigned int bpc,
+				      enum hdmi_colorspace fmt);
 
 /**
  * struct drm_tile_group - Tile group metadata
  * @refcount: reference count
  * @dev: DRM device

-- 
2.43.2

