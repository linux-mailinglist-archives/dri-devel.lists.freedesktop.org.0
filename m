Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7841CCBC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 21:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2016E1FB;
	Wed, 29 Sep 2021 19:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2F16E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 19:40:34 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id n6so2158143qvp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF633gou+bl3sCpIJ8wv85xDA5ZlnT4KC1I1tt3b3Dw=;
 b=h7pT+4lZyr9pCDyJbrAsH5Y5h6S4YUyYmsnrKRK9b024dTy0SWgieLBPe6oHRIP57g
 tACIdjc8P5aqUla/jrS++A039Nb6t3lQlMoVATBxiYU0jBjn6EaANh/anNYlD+iClCLb
 HjDPAyteVgB2CXzeoP0en0yZysG0JqIQlh/QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PF633gou+bl3sCpIJ8wv85xDA5ZlnT4KC1I1tt3b3Dw=;
 b=DKjHuLMniIDVqAq6C4XftsuDyPIlnB/xKgvQvOsNVpZj4lcQ9LTzuc/vaVhEI0Fr07
 g0NeBbKBgtQMAgzSmE4wGgZ7A6iH3a1vpwg9BQ8QGp1ZD8rfp3NeGjQvriKyyYNI5+C1
 7J5hjjqWP2a8IHRXOG6W0NIiG0Tm1Aw+VY5aEao9rPAZUVzWqJKBX9JbD/tm8f+IkCoW
 +DvFMjTwcKqs4ngeEV4tRKvG/xcTg4HwNaUBIpkUtQNchkg/7NnqWtCNqRd+SyXk/mEU
 BzQFQwsfCaJOUDMLToO9Y6Ha9koAe/XvFNTt7YIxGKyU4YGwgHk3abmF+7VqLUjBe6rn
 QbGw==
X-Gm-Message-State: AOAM533jNz3COyufJu+sQkevIyOcoc/8EcSGQK30e/RfcXtOIed+WRTw
 nVNb0WARf7kq94m9LbcW/jubU9iYYCaZuw==
X-Google-Smtp-Source: ABdhPJz2jnoGe84xsN5bbYup7kT30gQg9aDhyQ18dDkvFdc4nX3/qf7bpM20C7AqYvDQ0SnkqJIDjA==
X-Received: by 2002:ad4:5554:: with SMTP id v20mr224403qvy.16.1632944432914;
 Wed, 29 Sep 2021 12:40:32 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:15c:6c:200:db75:cbbd:56c0:9891])
 by smtp.gmail.com with ESMTPSA id c4sm395064qkf.122.2021.09.29.12.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:40:32 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: seanpaul@chromium.org, Rodrigo.Siqueira@amd.com, anson.jacob@amd.com,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes props to drm_crtc to
 validate.
Date: Wed, 29 Sep 2021 15:39:25 -0400
Message-Id: <20210929194012.3433306-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
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

Fixes: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
Tested on Zork(amdgpu) and Jacuzzi(mediatek)

Signed-off-by: Mark Yacoub<markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 56 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_color_mgmt.c    |  2 ++
 include/drm/drm_atomic_helper.h     |  1 +
 include/drm/drm_crtc.h              | 11 ++++++
 4 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c0c6ec928200..265b9747250d1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -930,6 +930,58 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_check_planes);
 
+/**
+ * drm_atomic_helper_check_planes - validate state object for CRTC changes
+ * @state: the driver state object
+ *
+ * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
+ * state holds them.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_atomic_helper_check_crtc(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->gamma_lut) {
+			uint64_t supported_lut_size = crtc->gamma_lut_size;
+			uint32_t supported_legacy_lut_size = crtc->gamma_size;
+			uint32_t new_state_lut_size =
+				drm_color_lut_size(new_crtc_state->gamma_lut);
+
+			if (new_state_lut_size != supported_lut_size &&
+			    new_state_lut_size != supported_legacy_lut_size) {
+				DRM_DEBUG_DRIVER(
+					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
+					supported_lut_size,
+					supported_legacy_lut_size,
+					new_state_lut_size);
+				return -EINVAL;
+			}
+		}
+
+		if (new_crtc_state->degamma_lut) {
+			uint32_t new_state_lut_size =
+				drm_color_lut_size(new_crtc_state->degamma_lut);
+			uint64_t supported_lut_size = crtc->degamma_lut_size;
+
+			if (new_state_lut_size != supported_lut_size) {
+				DRM_DEBUG_DRIVER(
+					"Invalid Degamma LUT size. Should be %u but got %u.\n",
+					supported_lut_size, new_state_lut_size);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_check_crtc);
+
 /**
  * drm_atomic_helper_check - validate state object
  * @dev: DRM device
@@ -975,6 +1027,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_atomic_helper_check_crtc(state);
+	if (ret)
+		return ret;
+
 	if (state->legacy_cursor_update)
 		state->async_update = !drm_atomic_helper_async_check(dev, state);
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6c..72a1b628e7cdd 100644
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
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 4045e2507e11c..3eda13622ca1e 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -38,6 +38,7 @@ struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
 
+int drm_atomic_helper_check_crtc(struct drm_atomic_state *state);
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750af..c602be2cafca9 100644
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
2.33.0.685.g46640cef36-goog

