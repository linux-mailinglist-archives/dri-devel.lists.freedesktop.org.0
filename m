Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A96445AE0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 21:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172B873863;
	Thu,  4 Nov 2021 20:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740CD73863
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 20:02:59 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id b17so6047738qvl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qBGN6pNTOmH3Nn9A6bIceXXDO7hMlrizpUzG+ErqGMM=;
 b=DajR758A65wm+OtuKKEuKeCKycEULvxrW1q337czWGUdfBBXmAu0IJc1R47Fo94RPN
 BYLjWhPfxrw0c4nAaYjdwT6ZuMKPb2nFZMVcb5hYnTT1dZtAbUIwV4La//SDqKN5FiAj
 B9iNFlxxDlifMwdM+KeKaMCBt7hJnSwMJQc+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qBGN6pNTOmH3Nn9A6bIceXXDO7hMlrizpUzG+ErqGMM=;
 b=bQnTME03+qiw3A/MX7ltWXYqbaqTB2l853C8E/iWLLPCNP2KILVGOnlPBw37RPl3qH
 YxLaeeSOCOn0K6mjfDqqcN0X0Uf9+QImWbCH3hF6ySMYBBc0YMOvCG5HpDGFbuFjw564
 6J6WmQkcSZ5DKbp8RQvVQSotsAlRRLwsImdGxACyZSwfTRc7/5nElIK9a1HCeKAUMSjx
 jFXdpDH4SatUXwUKVJxjXXirsef9Z5ALGjF1r478RKcykyx1Ya3OqmTnbqrhoBm2VpcU
 u5kIqY2KgPcZT9r5C88OXeKrw2hOy0Bt4Yaz/1RHBd/vakF1wcGf2TNctLi7mMzHPV95
 5DSA==
X-Gm-Message-State: AOAM530QO18pdFP3KsZ3ZSgJCUUmRDaLum2FtBWY+RHP7mO5eNoE7DBS
 na04uKBRplkK3Xby6dFl6mJb/g==
X-Google-Smtp-Source: ABdhPJwnoYqcuBq8wrw73qFdhJnOY8dyC90ldAowMd/yKzmoVUioZp3mGe9FHXjAIzaarUWpBUjywQ==
X-Received: by 2002:a05:6214:2aa3:: with SMTP id
 js3mr26399587qvb.49.1636056178515; 
 Thu, 04 Nov 2021 13:02:58 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:1118:14fe:72e3:f013])
 by smtp.gmail.com with ESMTPSA id j22sm4577411qko.121.2021.11.04.13.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 13:02:57 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Subject: [PATCH v5 1/3] drm: Move drm_color_lut_check implementation internal
 to intel_color
Date: Thu,  4 Nov 2021 16:02:50 -0400
Message-Id: <20211104200255.63499-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
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
Cc: pmenzel@molgen.mpg.de, David Airlie <airlied@linux.ie>,
 Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
The tests of LUT_EQUAL_CHANNELS and LUT_NON_DECREASING are currently
unique to i915 driver.
Freeing up the function name for the more generic LUT checks to folllow

Tested on Eldrid ChromeOS (TGL).

v2:
1. Convert the enum to #define.
2. Add INTEL_COLOR_ prefix.

v1:
Stuff the test function from DRM to intel driver.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_color_mgmt.c           | 43 ----------------------
 drivers/gpu/drm/i915/display/intel_color.c | 43 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.h | 16 ++++++++
 drivers/gpu/drm/i915/i915_pci.c            | 28 ++++++++------
 include/drm/drm_color_mgmt.h               | 27 --------------
 5 files changed, 71 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6c..16a07f84948f3 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -583,46 +583,3 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
-
-/**
- * drm_color_lut_check - check validity of lookup table
- * @lut: property blob containing LUT to check
- * @tests: bitmask of tests to run
- *
- * Helper to check whether a userspace-provided lookup table is valid and
- * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
- * the tests in &drm_color_lut_tests should be performed.
- *
- * Returns 0 on success, -EINVAL on failure.
- */
-int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
-{
-	const struct drm_color_lut *entry;
-	int i;
-
-	if (!lut || !tests)
-		return 0;
-
-	entry = lut->data;
-	for (i = 0; i < drm_color_lut_size(lut); i++) {
-		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
-			if (entry[i].red != entry[i].blue ||
-			    entry[i].red != entry[i].green) {
-				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
-				return -EINVAL;
-			}
-		}
-
-		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
-			if (entry[i].red < entry[i - 1].red ||
-			    entry[i].green < entry[i - 1].green ||
-			    entry[i].blue < entry[i - 1].blue) {
-				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
-				return -EINVAL;
-			}
-		}
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_color_lut_check);
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251ba..1469871d21ff9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1279,13 +1279,46 @@ static int check_lut_size(const struct drm_property_blob *lut, int expected)
 	return 0;
 }
 
+static int test_luts(const struct drm_property_blob *lut, u32 tests)
+{
+	const struct drm_color_lut *entry;
+	int i;
+
+	if (!lut || !tests)
+		return 0;
+
+	entry = lut->data;
+	for (i = 0; i < drm_color_lut_size(lut); i++) {
+		if (tests & INTEL_COLOR_LUT_EQUAL_CHANNELS) {
+			if (entry[i].red != entry[i].blue ||
+			    entry[i].red != entry[i].green) {
+				DRM_DEBUG_KMS(
+					"All LUT entries must have equal r/g/b\n");
+				return -EINVAL;
+			}
+		}
+
+		if (i > 0 && tests & INTEL_COLOR_LUT_NON_DECREASING) {
+			if (entry[i].red < entry[i - 1].red ||
+			    entry[i].green < entry[i - 1].green ||
+			    entry[i].blue < entry[i - 1].blue) {
+				DRM_DEBUG_KMS(
+					"LUT entries must never decrease.\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int check_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
 	int gamma_length, degamma_length;
-	u32 gamma_tests, degamma_tests;
+	u32 gamma_channels_tests, degamma_channels_tests;
 
 	/* Always allow legacy gamma LUT with no further checking. */
 	if (crtc_state_is_legacy_gamma(crtc_state))
@@ -1300,15 +1333,15 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
 
 	degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
 	gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
-	degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
-	gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
+	degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
+	gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
 
 	if (check_lut_size(degamma_lut, degamma_length) ||
 	    check_lut_size(gamma_lut, gamma_length))
 		return -EINVAL;
 
-	if (drm_color_lut_check(degamma_lut, degamma_tests) ||
-	    drm_color_lut_check(gamma_lut, gamma_tests))
+	if (test_luts(degamma_lut, degamma_channels_tests) ||
+	    test_luts(gamma_lut, gamma_channels_tests))
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 173727aaa24d2..29b3b5edf256f 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -7,6 +7,22 @@
 #define __INTEL_COLOR_H__
 
 #include <linux/types.h>
+#include <linux/bits.h>
+
+/**
+ * The test_luts() function takes a bitmask of the values here to
+ * determine which tests to apply to a userspace-provided LUT.
+ *
+ * @INTEL_COLOR_LUT_EQUAL_CHANNELS: Checks whether the entries of a LUT all
+ * have equal values for the red, green, and blue channels.  Intended for
+ * hardware that only accepts a single value per LUT entry and assumes that
+ * value applies to all three color components.
+ * 
+ * @INTEL_COLOR_LUT_NON_DECREASING: Checks whether the entries of a LUT are
+ * always flat or increasing (never decreasing).
+*/
+#define INTEL_COLOR_LUT_EQUAL_CHANNELS BIT(0)
+#define INTEL_COLOR_LUT_NON_DECREASING BIT(1)
 
 struct intel_crtc_state;
 struct intel_crtc;
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 5e8348f506b8d..d75be5b2d8149 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -29,6 +29,7 @@
 #include <drm/i915_pciids.h>
 
 #include "display/intel_fbdev.h"
+#include "display/intel_color.h"
 
 #include "i915_drv.h"
 #include "i915_perf.h"
@@ -132,23 +133,28 @@
 
 #define I9XX_COLORS \
 	.color = { .gamma_lut_size = 256 }
-#define I965_COLORS \
-	.color = { .gamma_lut_size = 129, \
-		   .gamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING, \
+#define I965_COLORS                                                            \
+	.color = {                                                             \
+		.gamma_lut_size = 129,                                         \
+		.gamma_lut_tests = INTEL_COLOR_LUT_NON_DECREASING,             \
 	}
 #define ILK_COLORS \
 	.color = { .gamma_lut_size = 1024 }
 #define IVB_COLORS \
 	.color = { .degamma_lut_size = 1024, .gamma_lut_size = 1024 }
-#define CHV_COLORS \
-	.color = { .degamma_lut_size = 65, .gamma_lut_size = 257, \
-		   .degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING, \
-		   .gamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING, \
+#define CHV_COLORS                                                             \
+	.color = {                                                             \
+		.degamma_lut_size = 65,                                        \
+		.gamma_lut_size = 257,                                         \
+		.degamma_lut_tests = INTEL_COLOR_LUT_NON_DECREASING,           \
+		.gamma_lut_tests = INTEL_COLOR_LUT_NON_DECREASING,             \
 	}
-#define GLK_COLORS \
-	.color = { .degamma_lut_size = 33, .gamma_lut_size = 1024, \
-		   .degamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING | \
-					DRM_COLOR_LUT_EQUAL_CHANNELS, \
+#define GLK_COLORS                                                             \
+	.color = {                                                             \
+		.degamma_lut_size = 33,                                        \
+		.gamma_lut_size = 1024,                                        \
+		.degamma_lut_tests = INTEL_COLOR_LUT_NON_DECREASING |          \
+				     INTEL_COLOR_LUT_EQUAL_CHANNELS,           \
 	}
 
 /* Keep in gen based order, and chronological order within a gen */
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c8..3537f3eeb3872 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -93,31 +93,4 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range);
 
-/**
- * enum drm_color_lut_tests - hw-specific LUT tests to perform
- *
- * The drm_color_lut_check() function takes a bitmask of the values here to
- * determine which tests to apply to a userspace-provided LUT.
- */
-enum drm_color_lut_tests {
-	/**
-	 * @DRM_COLOR_LUT_EQUAL_CHANNELS:
-	 *
-	 * Checks whether the entries of a LUT all have equal values for the
-	 * red, green, and blue channels.  Intended for hardware that only
-	 * accepts a single value per LUT entry and assumes that value applies
-	 * to all three color components.
-	 */
-	DRM_COLOR_LUT_EQUAL_CHANNELS = BIT(0),
-
-	/**
-	 * @DRM_COLOR_LUT_NON_DECREASING:
-	 *
-	 * Checks whether the entries of a LUT are always flat or increasing
-	 * (never decreasing).
-	 */
-	DRM_COLOR_LUT_NON_DECREASING = BIT(1),
-};
-
-int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
 #endif
-- 
2.34.0.rc0.344.g81b53c2807-goog

