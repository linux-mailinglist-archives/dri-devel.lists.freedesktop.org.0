Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0143BA9B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121AC6E855;
	Tue, 26 Oct 2021 19:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87976E859
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:21:08 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id g17so240545qtk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=127m+2Fwn/io7KvRr/KOS7xqYguoXNnwDnCZDuDXMls=;
 b=RjhlVtWGRH4NjzWs8qEsffk9kM4I6eskC3WyXwXekquU/6FsHhbHoDWqRQ38FJhFj3
 OVKmUSkhG6dYmEXVnhONtOqwcfox1NOnxhpB5SyqTHS8vqpmAtEDeKS6Yv22i/k1TPDq
 Opcyro3k6lKG+TnIb7/tD9lpHOawtLLtfNAr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=127m+2Fwn/io7KvRr/KOS7xqYguoXNnwDnCZDuDXMls=;
 b=zyZVWfyNvXr6yrzD7/RiJ5dio7dzh1bgg3LPmRVA0QxDwxUJv4g+gLrSvt+wI9s+df
 olZtKrwtE68JWkq4dig0qw34JeWu74OnCg5/xbIaPH+oXCddhxuYuR/QPfmtFQGY5fwg
 bUs9teiKvXirlVLW36/3sP9pDFIPpvDh4uDcdA16iXYdhATacWzn4tgfuKJ/uBK3itYu
 ID0nmUlCnzMt0qBKYld5nMSaudfvwGFFM35dqavx4bUzbYJWJA0GDYTHlMOWsXMsOpMi
 reEeuCrfBBABZwbrJsx7MMgbHwLrbGvANw+XHcLgoUUCVpOaqExYzI4dh3423IJMKmIH
 +frA==
X-Gm-Message-State: AOAM532pcQDmp6dFBQpzQVFIveBscW/KmmG5RNmyA2mUz1B7FN06wmh0
 W16HgAYzEBUzB5WsNG72cT4giA==
X-Google-Smtp-Source: ABdhPJxIvSKMXHMgOqR+0IzuDBjRv51mc+McEVmOd74PDkMDAluxSEORKPdsy6BHd6I0NnJCw5RNHQ==
X-Received: by 2002:ac8:7087:: with SMTP id y7mr3457600qto.112.1635276067936; 
 Tue, 26 Oct 2021 12:21:07 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6c5e:8134:a5e1:b63b])
 by smtp.gmail.com with ESMTPSA id c13sm2284643qtc.42.2021.10.26.12.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:21:07 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm: Rename lut check functions to lut channel checks
Date: Tue, 26 Oct 2021 15:21:00 -0400
Message-Id: <20211026192104.1860504-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
This function and enum do not do generic checking on the luts but they
test color channels in the LUTs.
Keeping the name explicit as more generic LUT checks will follow.

Tested on Eldrid ChromeOS (TGL).

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_color_mgmt.c           | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_color.c | 10 +++++-----
 include/drm/drm_color_mgmt.h               |  7 ++++---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6c..6f4e04746d90f 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -585,17 +585,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 EXPORT_SYMBOL(drm_plane_create_color_properties);
 
 /**
- * drm_color_lut_check - check validity of lookup table
+ * drm_color_lut_channels_check - check validity of the channels in the lookup table
  * @lut: property blob containing LUT to check
  * @tests: bitmask of tests to run
  *
- * Helper to check whether a userspace-provided lookup table is valid and
- * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
- * the tests in &drm_color_lut_tests should be performed.
+ * Helper to check whether each color channel of userspace-provided lookup table is valid and
+ * satisfies hardware requirements. Drivers pass a bitmask indicating which of in
+ * &drm_color_lut_channels_tests should be performed.
  *
  * Returns 0 on success, -EINVAL on failure.
  */
-int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
+int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
 {
 	const struct drm_color_lut *entry;
 	int i;
@@ -625,4 +625,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_color_lut_check);
+EXPORT_SYMBOL(drm_color_lut_channels_check);
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251ba..4bb1bc76c4de9 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
 	int gamma_length, degamma_length;
-	u32 gamma_tests, degamma_tests;
+	u32 gamma_channels_tests, degamma_channels_tests;
 
 	/* Always allow legacy gamma LUT with no further checking. */
 	if (crtc_state_is_legacy_gamma(crtc_state))
@@ -1300,15 +1300,15 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
 
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
+	if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
+	    drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
 		return -EINVAL;
 
 	return 0;
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c8..cb1bf361ad3e3 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 				      enum drm_color_range default_range);
 
 /**
- * enum drm_color_lut_tests - hw-specific LUT tests to perform
+ * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
  *
  * The drm_color_lut_check() function takes a bitmask of the values here to
  * determine which tests to apply to a userspace-provided LUT.
  */
-enum drm_color_lut_tests {
+enum drm_color_lut_channels_tests {
 	/**
 	 * @DRM_COLOR_LUT_EQUAL_CHANNELS:
 	 *
@@ -119,5 +119,6 @@ enum drm_color_lut_tests {
 	DRM_COLOR_LUT_NON_DECREASING = BIT(1),
 };
 
-int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
+int drm_color_lut_channels_check(const struct drm_property_blob *lut,
+				 u32 tests);
 #endif
-- 
2.33.0.1079.g6e70778dc9-goog

