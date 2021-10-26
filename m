Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A357E43BA9E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536326E85A;
	Tue, 26 Oct 2021 19:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873C46E857
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:21:12 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id br18so154877qkb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8l3VXy8DfMS2re8oRBKClgrojkd1478/Llqn/FVBus=;
 b=KwXAe+xeOgE5d4u9hptdO8m+7QZ1gvTFm/rGAM7sI+kNwGVDUiNvBTcKlhmNGGsl+T
 lf5r8sjLPBh5f8dm+vUEsCSRpnE07NV5cybo8wNWsd5VJmsEHSLvDxC6MP7jMn81UTwf
 ZUBoxe1ahJUP0lkSJ9DHj9QYXj98UOIOiKFnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8l3VXy8DfMS2re8oRBKClgrojkd1478/Llqn/FVBus=;
 b=fNe/mX47dzkCkTXd3NLqNYx/5W9TwbhxT8ynjJ5wiYs8vf7Nc9MPwiuxlkvTvuQFTe
 CCMEoM9qFiwUoNW8mLWHH0hOrqU80s8qNG0pCLA7kDae4N+TqHNsf099Ds+JLKeyCSTQ
 j9P5OrNxGGc8Piu9kv/zUb9jsHsnlV7sY33UoVw0L4enhDQnKZF8ELXOHoTrMtYbMIa+
 IaTieBWo4qgz1DFmvP+kSc8cko5UvEp+MkHfXtEhnUg3rkGfSYSb42QfmAPVxkvuwtSV
 WHCV+OLcwPRLZyAvQEM5e5mmNvxyfzVPO0u+rcUBQpYpEFjCWlMTtVDZEXrIu5c7vWMm
 Op4w==
X-Gm-Message-State: AOAM530bfso3Wgg5JMAND8NxtWnu2ooLkVQmpqMGi/6jcZgzyn7oAdEK
 iwXi1Mdoqgy0EMx+wQuj1OsIRg==
X-Google-Smtp-Source: ABdhPJypFqmc1LY9Rw04SsDCrE2uIA77X2hMYvYoHc2Bvvc/os6aU1L+A17Kqnn41p1hOUFY6u6QKA==
X-Received: by 2002:a05:620a:4721:: with SMTP id
 bs33mr2573944qkb.0.1635276071577; 
 Tue, 26 Oct 2021 12:21:11 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6c5e:8134:a5e1:b63b])
 by smtp.gmail.com with ESMTPSA id c13sm2284643qtc.42.2021.10.26.12.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:21:11 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] drm: Add Gamma and Degamma LUT sizes props to drm_crtc
 to validate.
Date: Tue, 26 Oct 2021 15:21:01 -0400
Message-Id: <20211026192104.1860504-2-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026192104.1860504-1-markyacoub@chromium.org>
References: <20211026192104.1860504-1-markyacoub@chromium.org>
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
1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
or Degamma props in the new CRTC state, allowing any invalid size to
be passed on.
2. Each driver has its own LUT size, which could also be different for
legacy users.

[How]
1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
assigned by the driver when it's initializing its color and CTM
management.
2. Create drm_atomic_helper_check_crtc which is called by
drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
they match the sizes in the new CRTC state.
3. As the LUT size check now happens in drm_atomic_helper_check, remove
the lut check in intel_color.c

Resolves: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
Tested on Zork(amdgpu) and Jacuzzi(mediatek), volteer(TGL)

v2:
1. Remove the rename to a parent commit.
2. Create a drm drm_check_lut_size instead of intel only function.

v1:
1. Fix typos
2. Remove the LUT size check from intel driver
3. Rename old LUT check to indicate it's a channel change

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c        | 56 ++++++++++++++++++++++
 drivers/gpu/drm/drm_color_mgmt.c           |  2 +
 drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++-------
 include/drm/drm_atomic_helper.h            |  1 +
 include/drm/drm_color_mgmt.h               | 13 +++++
 include/drm/drm_crtc.h                     | 11 +++++
 6 files changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5e..c565b3516cce9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -929,6 +929,58 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_planes);
 
+/**
+ * drm_atomic_helper_check_crtcs - validate state object for CRTC changes
+ * @state: the driver state object
+ *
+ * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
+ * state holds them.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->color_mgmt_changed &&
+		    new_crtc_state->gamma_lut) {
+			if (drm_check_lut_size(new_crtc_state->gamma_lut,
+					       crtc->gamma_lut_size) ||
+			    drm_check_lut_size(new_crtc_state->gamma_lut,
+					       crtc->gamma_size)) {
+				drm_dbg_state(
+					state->dev,
+					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
+					crtc->gamma_lut_size, crtc->gamma_size,
+					drm_color_lut_size(
+						new_crtc_state->gamma_lut));
+				return -EINVAL;
+			}
+		}
+
+		if (new_crtc_state->color_mgmt_changed &&
+		    new_crtc_state->degamma_lut) {
+			if (drm_check_lut_size(new_crtc_state->degamma_lut,
+					       crtc->degamma_lut_size)) {
+				drm_dbg_state(
+					state->dev,
+					"Invalid DeGamma LUT size. Should be %u but got %u.\n",
+					crtc->degamma_lut_size,
+					drm_color_lut_size(
+						new_crtc_state->degamma_lut));
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_crtcs);
+
 /**
  * drm_atomic_helper_check - validate state object
  * @dev: DRM device
@@ -974,6 +1026,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_atomic_helper_check_crtcs(state);
+	if (ret)
+		return ret;
+
 	if (state->legacy_cursor_update)
 		state->async_update = !drm_atomic_helper_async_check(dev, state);
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 6f4e04746d90f..6bb59645a75bc 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (degamma_lut_size) {
+		crtc->degamma_lut_size = degamma_lut_size;
 		drm_object_attach_property(&crtc->base,
 					   config->degamma_lut_property, 0);
 		drm_object_attach_property(&crtc->base,
@@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   config->ctm_property, 0);
 
 	if (gamma_lut_size) {
+		crtc->gamma_lut_size = gamma_lut_size;
 		drm_object_attach_property(&crtc->base,
 					   config->gamma_lut_property, 0);
 		drm_object_attach_property(&crtc->base,
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4bb1bc76c4de9..888886d2936f8 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1262,23 +1262,6 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
 	return 0;
 }
 
-static int check_lut_size(const struct drm_property_blob *lut, int expected)
-{
-	int len;
-
-	if (!lut)
-		return 0;
-
-	len = drm_color_lut_size(lut);
-	if (len != expected) {
-		DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
-			      len, expected);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int check_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
@@ -1303,9 +1286,25 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
 	degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
 	gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
 
-	if (check_lut_size(degamma_lut, degamma_length) ||
-	    check_lut_size(gamma_lut, gamma_length))
-		return -EINVAL;
+	if (degamma_lut) {
+		if (drm_check_lut_size(degamma_lut, degamma_length)) {
+			drm_dbg_state(
+				&dev_priv->drm,
+				"Invalid DeGamma LUT size. Should be %u but got %u.\n",
+				degamma_length,
+				drm_color_lut_size(degamma_lut));
+			return -EINVAL;
+		}
+	}
+	if (gamma_lut) {
+		if (drm_check_lut_size(gamma_lut, degamma_length)) {
+			drm_dbg_state(
+				&dev_priv->drm,
+				"Invalid Gamma LUT size. Should be %u but got %u.\n",
+				degamma_length, drm_color_lut_size(gamma_lut));
+			return -EINVAL;
+		}
+	}
 
 	if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
 	    drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11c..a22d32a7a8719 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -38,6 +38,7 @@ struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
 
+int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state);
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index cb1bf361ad3e3..c214812d1b7a5 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -74,6 +74,19 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_check_lut_size - Checks if LUT size matches the driver expected size.
+ * @lut: blob containing the LUT
+ * @expected_size: driver expected LUT size
+ *
+ * Returns -EINVAL on mismatch, 0 on match.
+ */
+static inline int drm_check_lut_size(const struct drm_property_blob *lut,
+				     uint64_t expected_size)
+{
+	return drm_color_lut_size(lut) != expected_size ? -EINVAL : 0;
+}
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 2deb15d7e1610..cabd3ef1a6e32 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1072,6 +1072,17 @@ struct drm_crtc {
 	/** @funcs: CRTC control functions */
 	const struct drm_crtc_funcs *funcs;
 
+	/**
+	 * @degamma_lut_size: Size of degamma LUT.
+	 */
+	uint32_t degamma_lut_size;
+
+	/**
+	 * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
+	 * X, which doesn't support large lut sizes.
+	 */
+	uint32_t gamma_lut_size;
+
 	/**
 	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
 	 * by calling drm_mode_crtc_set_gamma_size().
-- 
2.33.0.1079.g6e70778dc9-goog

