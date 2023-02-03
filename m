Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DE688CE5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 03:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FFF10E706;
	Fri,  3 Feb 2023 02:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0894C10E706
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 02:08:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2844897wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 18:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXSQiHpGfYdrvyEEoaiuEk5XU3y8E6/bAvCTVd55IDs=;
 b=kz9a3PAmEeNVyhP4kYtwEz/+GaE3eOz3HXcap506ZRyLp31zr0yALUi2lgVzN9/5vP
 E4m6oR7Z+yswj6oDkBOEzQammzQI5TknZXNILwUp9tdAvOwQBE+qBoxx2EQL8hHyeyLk
 +emjRMXHUKBdjJkI/mt7/cL6yuHPYoVKmmikqQbNwqpcCv9+XLH32wstaB0zfpOZEXpN
 P57iu2szZwXLXWBYw7zRFpepnjmgEccExD0Pjn2R9mRC9Rg7dV64l9TKQXxvxUwCOA/z
 0VPvxUJ4aCwrAdtEXCORfBd0pwTKzV0AHJ9he4rVjCWU4pI1L3fOu2G22WrzvM7/lPLu
 d1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXSQiHpGfYdrvyEEoaiuEk5XU3y8E6/bAvCTVd55IDs=;
 b=0e50bfR0VsTkX/5VRn5wIHYMBbtOLw5HMHRyg/FXg7Rqrf7dHxOiIL98BE2vSriIWN
 Bfyj7cfxcYtpS2eTjOJ8cWVOCDbx4Xv+2mZdowh3RNlTKAB76V4HcsMSScr/YsandK7Y
 ce9x7X8dEI1IOrhlVEYN9aOFz1LQuyaVXPgNge1gu4QypsMQgV+VViJKyWUyzYCrIv+N
 ka4sLINAi4KvY4wM3pXLOty31stQpPDqfcr7HJAnuAjVQoHZuxjzVhhd3UVapbJpo8FK
 ppywpkrdfORN5kbJ1I7IpDSyKajLLuhM9F1Mi0cmqvKGG6zz9VVL9ccqb5Oti0zU6XYI
 uPUw==
X-Gm-Message-State: AO0yUKXPCmZKCOVK+ma3Q9O8zEqXvTb2a4vU9Qi0pl3i/2Z744meiPZ6
 hAeBP5SbscHJ8AzsjVBgpvlLF0AuOdnToHVd
X-Google-Smtp-Source: AK7set998dFbtbpFHS4Ar29rP70bL+nn/SkoQM+/oU3bzy8rcRLcEtNF6fwDpbobsC7Y9WrTn9BBNQ==
X-Received: by 2002:a05:600c:35d5:b0:3dc:443e:3a8b with SMTP id
 r21-20020a05600c35d500b003dc443e3a8bmr8070730wmq.16.1675390078485; 
 Thu, 02 Feb 2023 18:07:58 -0800 (PST)
Received: from localhost.localdomain
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm1297327wmo.21.2023.02.02.18.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 18:07:58 -0800 (PST)
From: Joshua Ashton <joshua@froggi.es>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Date: Fri,  3 Feb 2023 02:07:44 +0000
Message-Id: <20230203020744.30745-3-joshua@froggi.es>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203020744.30745-1-joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace has no way of controlling or knowing the pixel encoding
currently, so there is no way for it to ever get the right values here.

When we do add pixel_encoding control from userspace,we can pick the
right value for the colorimetry packet based on the
pixel_encoding + the colorspace.

Let's deprecate these values, and have one BT.2020 colorspace entry
that userspace can use.

Note: _CYCC was effectively 'removed' by this change, but that was not
possible to be taken advantage of anyway, as there is currently no
pixel_encoding control so it would not be possible to output
linear YCbCr.

Signed-off-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
 drivers/gpu/drm/drm_connector.c           | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
 include/drm/drm_connector.h               | 19 ++++++++++---------
 4 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 0264abe55278..c85860600395 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
 #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
 #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
 #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
+#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
 #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
 #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
 
@@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] = {
 	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
 	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
 	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
-	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
-	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
-	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
+	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] = HDMI_COLORIMETRY_BT2020,
+	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] = HDMI_COLORIMETRY_BT2020,
+	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
 };
 
 #undef C
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 61c29ce74b03..58699ab15a6a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
 	/* Colorimetry based on IEC 61966-2-5 */
 	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
 	/* Added as part of Additional Colorimetry Extension in 861.G */
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
@@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
 	/* Colorimetry based on SMPTE RP 431-2 */
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
+	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
 	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
 	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
 	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
@@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
 	/* Colorimetry based on IEC 61966-2-5 [33] */
 	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c9be61d2348e..1aa5dedeec7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	case DRM_MODE_COLORIMETRY_OPYCC_601:
 		vsc->colorimetry = DP_COLORIMETRY_OPYCC_601;
 		break;
-	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
-		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
+	case DRM_MODE_COLORIMETRY_BT2020:
+		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
+			? DP_COLORIMETRY_BT2020_RGB
+			: DP_COLORIMETRY_BT2020_YCC;
 		break;
 	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
 	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
@@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 	switch (conn_state->colorspace) {
 	case DRM_MODE_COLORIMETRY_SYCC_601:
 	case DRM_MODE_COLORIMETRY_OPYCC_601:
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
+	case DRM_MODE_COLORIMETRY_BT2020:
 		return true;
 	default:
 		break;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index eb4cc9076e16..42a3cf43168c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
  *   opYCC601 colorimetry format
  * @DRM_MODE_COLORIMETRY_OPRGB:
  *   opRGB colorimetry format
- * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
- *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
- * @DRM_MODE_COLORIMETRY_BT2020_RGB:
- *   ITU-R BT.2020 R' G' B' colorimetry format
- * @DRM_MODE_COLORIMETRY_BT2020_YCC:
- *   ITU-R BT.2020 Y' C'b C'r colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
+ * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
+ * @DRM_MODE_COLORIMETRY_BT2020:
+ *   ITU-R BT.2020 [R' G' B'] or
+ * 	 ITU-R BT.2020 [Y' C'b C'r] or
+ *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
+ *   colorimetry format
  * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
  *   DCI-P3 (SMPTE RP 431-2) colorimetry format
  * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
@@ -420,9 +421,9 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_SYCC_601,
 	DRM_MODE_COLORIMETRY_OPYCC_601,
 	DRM_MODE_COLORIMETRY_OPRGB,
-	DRM_MODE_COLORIMETRY_BT2020_CYCC,
-	DRM_MODE_COLORIMETRY_BT2020_RGB,
-	DRM_MODE_COLORIMETRY_BT2020_YCC,
+	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
+	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
+	DRM_MODE_COLORIMETRY_BT2020,
 	/* Additional Colorimetry extension added as part of CTA 861.G */
 	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
 	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
-- 
2.39.1

