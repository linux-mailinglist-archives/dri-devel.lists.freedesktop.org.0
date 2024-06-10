Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD690202A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586310E0C6;
	Mon, 10 Jun 2024 11:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HMQE3nJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004DF10E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86FD6CE10BD;
 Mon, 10 Jun 2024 11:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F5BC2BBFC;
 Mon, 10 Jun 2024 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718017925;
 bh=zbf6dUVQ+mUL80WUx1rknZpckAvRBVAPgDmu71VVBQM=;
 h=From:To:Cc:Subject:Date:From;
 b=HMQE3nJ5HyDWdyzfL4Y95GKDRx2+IzrrIeiQg748upUDeeB0dti+HeewXZUcMWNiy
 TF4b3JG9Sz+yWaPw+QEV/SHnQzDUmefFc3XpJedZmMixqlLklw+kHe1lC4TmnSsyta
 u+dEO8dRELQX/j6lI2BWWYwcsTFvmVZa8VDWQk5NuN/mxb2/cO9olD2p2Y1+IXdHnC
 Cj41CPlp9wdA/DjvnSxyvkhRc0B+MqJmPpvKb7WOEZNZMWV2rL2aX0a4RyGFajmIo2
 M6VaOPZ/AHXjJwiCaSwd/mYOSuo+T41lhy+YZjZ4T6BkhuxAVAr6udvv8QwN/DWYzI
 FDd3822EO0FGA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Date: Mon, 10 Jun 2024 13:12:00 +0200
Message-ID: <20240610111200.428224-1-mripard@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It looks like the documentation for the HDMI-related fields recently
added to both the drm_connector and drm_connector_state structures
trigger some warnings because of their use of anonymous structures:

  $ scripts/kernel-doc -none include/drm/drm_connector.h
  include/drm/drm_connector.h:1138: warning: Excess struct member 'broadcast_rgb' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'infoframes' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_drm' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'vendor' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'is_limited_range' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'output_bpc' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'output_format' description in 'drm_connector_state'
  include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_char_rate' description in 'drm_connector_state'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'vendor' description in 'drm_connector'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'product' description in 'drm_connector'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'supported_formats' description in 'drm_connector'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'infoframes' description in 'drm_connector'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'lock' description in 'drm_connector'
  include/drm/drm_connector.h:2112: warning: Excess struct member 'audio' description in 'drm_connector'

Create some intermediate structures instead of anonymous ones to silence
the warnings.

Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
Fixes: 948f01d5e559 ("drm/connector: hdmi: Add support for output format")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_connector.h | 207 +++++++++++++++++++-----------------
 1 file changed, 109 insertions(+), 98 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e04a8a0d1bbd..1afee2939b71 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -927,10 +927,72 @@ struct drm_connector_hdmi_infoframe {
 	 * @set: Is the content of @data valid?
 	 */
 	bool set;
 };
 
+/*
+ * struct drm_connector_hdmi_state - HDMI state container
+ */
+struct drm_connector_hdmi_state {
+	/**
+	 * @broadcast_rgb: Connector property to pass the
+	 * Broadcast RGB selection value.
+	 */
+	enum drm_hdmi_broadcast_rgb broadcast_rgb;
+
+	/**
+	 * @infoframes: HDMI Infoframes matching that state
+	 */
+	struct {
+		/**
+		 * @avi: AVI Infoframes structure matching our
+		 * state.
+		 */
+		struct drm_connector_hdmi_infoframe avi;
+
+		/**
+		 * @hdr_drm: DRM (Dynamic Range and Mastering)
+		 * Infoframes structure matching our state.
+		 */
+		struct drm_connector_hdmi_infoframe hdr_drm;
+
+		/**
+		 * @spd: SPD Infoframes structure matching our
+		 * state.
+		 */
+		struct drm_connector_hdmi_infoframe spd;
+
+		/**
+		 * @vendor: HDMI Vendor Infoframes structure
+		 * matching our state.
+		 */
+		struct drm_connector_hdmi_infoframe hdmi;
+	} infoframes;
+
+	/**
+	 * @is_limited_range: Is the output supposed to use a limited
+	 * RGB Quantization Range or not?
+	 */
+	bool is_limited_range;
+
+	/**
+	 * @output_bpc: Bits per color channel to output.
+	 */
+	unsigned int output_bpc;
+
+	/**
+	 * @output_format: Pixel format to output in.
+	 */
+	enum hdmi_colorspace output_format;
+
+	/**
+	 * @tmds_char_rate: TMDS Character Rate, in Hz.
+	 */
+	unsigned long long tmds_char_rate;
+
+}
+
 /**
  * struct drm_connector_state - mutable connector state
  */
 struct drm_connector_state {
 	/** @connector: backpointer to the connector */
@@ -1076,67 +1138,11 @@ struct drm_connector_state {
 
 	/**
 	 * @hdmi: HDMI-related variable and properties. Filled by
 	 * @drm_atomic_helper_connector_hdmi_check().
 	 */
-	struct {
-		/**
-		 * @broadcast_rgb: Connector property to pass the
-		 * Broadcast RGB selection value.
-		 */
-		enum drm_hdmi_broadcast_rgb broadcast_rgb;
-
-		/**
-		 * @infoframes: HDMI Infoframes matching that state
-		 */
-		struct {
-			/**
-			 * @avi: AVI Infoframes structure matching our
-			 * state.
-			 */
-			struct drm_connector_hdmi_infoframe avi;
-
-			/**
-			 * @hdr_drm: DRM (Dynamic Range and Mastering)
-			 * Infoframes structure matching our state.
-			 */
-			struct drm_connector_hdmi_infoframe hdr_drm;
-
-			/**
-			 * @spd: SPD Infoframes structure matching our
-			 * state.
-			 */
-			struct drm_connector_hdmi_infoframe spd;
-
-			/**
-			 * @vendor: HDMI Vendor Infoframes structure
-			 * matching our state.
-			 */
-			struct drm_connector_hdmi_infoframe hdmi;
-		} infoframes;
-
-		/**
-		 * @is_limited_range: Is the output supposed to use a limited
-		 * RGB Quantization Range or not?
-		 */
-		bool is_limited_range;
-
-		/**
-		 * @output_bpc: Bits per color channel to output.
-		 */
-		unsigned int output_bpc;
-
-		/**
-		 * @output_format: Pixel format to output in.
-		 */
-		enum hdmi_colorspace output_format;
-
-		/**
-		 * @tmds_char_rate: TMDS Character Rate, in Hz.
-		 */
-		unsigned long long tmds_char_rate;
-	} hdmi;
+	struct drm_connector_hdmi_state hdmi;
 };
 
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1654,10 +1660,55 @@ struct drm_cmdline_mode {
 	 * Did the mode have a preferred TV mode?
 	 */
 	bool tv_mode_specified;
 };
 
+/*
+ * struct drm_connector_hdmi - DRM Connector HDMI-related structure
+ */
+struct drm_connector_hdmi {
+#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
+	/**
+	 * @vendor: HDMI Controller Vendor Name
+	 */
+	unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
+
+#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
+	/**
+	 * @product: HDMI Controller Product Name
+	 */
+	unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
+
+	/**
+	 * @supported_formats: Bitmask of @hdmi_colorspace
+	 * supported by the controller.
+	 */
+	unsigned long supported_formats;
+
+	/**
+	 * @funcs: HDMI connector Control Functions
+	 */
+	const struct drm_connector_hdmi_funcs *funcs;
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
+		struct drm_connector_hdmi_infoframe audio;
+	} infoframes;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
  * Each connector may be connected to one or more CRTCs, or may be clonable by
  * another connector if they can share a CRTC.  Each connector also has a specific
@@ -2066,51 +2117,11 @@ struct drm_connector {
 	struct hdr_sink_metadata hdr_sink_metadata;
 
 	/**
 	 * @hdmi: HDMI-related variable and properties.
 	 */
-	struct {
-#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
-		/**
-		 * @vendor: HDMI Controller Vendor Name
-		 */
-		unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
-
-#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
-		/**
-		 * @product: HDMI Controller Product Name
-		 */
-		unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
-
-		/**
-		 * @supported_formats: Bitmask of @hdmi_colorspace
-		 * supported by the controller.
-		 */
-		unsigned long supported_formats;
-
-		/**
-		 * @funcs: HDMI connector Control Functions
-		 */
-		const struct drm_connector_hdmi_funcs *funcs;
-
-		/**
-		 * @infoframes: Current Infoframes output by the connector
-		 */
-		struct {
-			/**
-			 * @lock: Mutex protecting against concurrent access to
-			 * the infoframes, most notably between KMS and ALSA.
-			 */
-			struct mutex lock;
-
-			/**
-			 * @audio: Current Audio Infoframes structure. Protected
-			 * by @lock.
-			 */
-			struct drm_connector_hdmi_infoframe audio;
-		} infoframes;
-	} hdmi;
+	struct drm_connector_hdmi hdmi;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
 
 int drm_connector_init(struct drm_device *dev,
-- 
2.45.2

