Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A63970DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4B16E145;
	Tue,  1 Jun 2021 10:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699C6E10C;
 Tue,  1 Jun 2021 10:05:57 +0000 (UTC)
IronPort-SDR: 489OmspNXUE3zW91DZO/M7pD+jgdyzpL9IBlWTSlRqUnpPQBnvTQhTf9gfo2ff4LQpUUXJrI2Z
 KqgaHX8kZgxw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197717"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197717"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:45 -0700
IronPort-SDR: PtDIQbeqtu0bSVmnBKiKN0F+wDHhYIv/eBAn7D7IHjwgaG/OfBI426FaE5K9vL055kuTiRpAvz
 HpmIheEvGYTw==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245154"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:41 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm: Add gamma mode property
Date: Tue,  1 Jun 2021 16:11:27 +0530
Message-Id: <20210601104135.29020-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601104135.29020-1-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a gamma mode property to enable various kind of
gamma modes supported by platforms like: Interpolated, Split,
Multi Segmented, Logarithmic etc. Userspace can get this property
and should be able to get the platform capabilities wrt various
gamma modes possible and the possible ranges.

It can select one of the modes exposed as blob_id as an
enum and set the respective mode.

It can then create the LUT and send it to driver using
already available GAMMA_LUT property as blob.

Note: This is based on design by Ville and is being carried forward
based on his original idea.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  5 +++
 drivers/gpu/drm/drm_color_mgmt.c  | 75 +++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h      |  8 ++++
 include/drm/drm_crtc.h            | 14 ++++++
 include/uapi/drm/drm_mode.h       | 43 ++++++++++++++++++
 5 files changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 438e9585b225..a5470a0ebbe6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -471,6 +471,9 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == crtc->gamma_mode_property) {
+		state->gamma_mode = val;
+		state->color_mgmt_changed |= true;
 	} else if (property == config->prop_out_fence_ptr) {
 		s32 __user *fence_ptr = u64_to_user_ptr(val);
 
@@ -510,6 +513,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->mode_blob) ? state->mode_blob->base.id : 0;
 	else if (property == config->prop_vrr_enabled)
 		*val = state->vrr_enabled;
+	else if (property == crtc->gamma_mode_property)
+		*val = state->gamma_mode;
 	else if (property == config->degamma_lut_property)
 		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
 	else if (property == config->ctm_property)
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..766d0fd14daa 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -187,6 +187,81 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
+void drm_crtc_attach_gamma_mode_property(struct drm_crtc *crtc)
+{
+	if (!crtc->gamma_mode_property)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   crtc->gamma_mode_property, 0);
+}
+EXPORT_SYMBOL(drm_crtc_attach_gamma_mode_property);
+
+int drm_color_create_gamma_mode_property(struct drm_crtc *crtc,
+					 int num_values)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(crtc->dev,
+				   DRM_MODE_PROP_ENUM,
+				   "GAMMA_MODE", num_values);
+	if (!prop)
+		return -ENOMEM;
+
+	crtc->gamma_mode_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_color_create_gamma_mode_property);
+
+int drm_color_add_gamma_mode_range(struct drm_crtc *crtc,
+				   const char *name,
+				   const struct drm_color_lut_range *ranges,
+				   size_t length)
+{
+	struct drm_property_blob *blob;
+	struct drm_property *prop;
+	int num_ranges = length / sizeof(ranges[0]);
+	int i, ret, num_types_0;
+
+	prop = crtc->gamma_mode_property;
+	if (!prop)
+		return -EINVAL;
+
+	if (length == 0 && name)
+		return drm_property_add_enum(prop, 0, name);
+
+	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
+		return -EINVAL;
+
+	num_types_0 = hweight8(ranges[0].flags & (DRM_MODE_LUT_GAMMA |
+			       DRM_MODE_LUT_DEGAMMA));
+	if (num_types_0 == 0)
+		return -EINVAL;
+
+	for (i = 1; i < num_ranges; i++) {
+		int num_types = hweight8(ranges[i].flags & (DRM_MODE_LUT_GAMMA |
+					 DRM_MODE_LUT_DEGAMMA));
+
+		/* either all ranges have DEGAMMA|GAMMA or none have it */
+		if (num_types_0 != num_types)
+			return -EINVAL;
+	}
+
+	blob = drm_property_create_blob(crtc->dev, length, ranges);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	ret = drm_property_add_enum(prop, blob->base.id, name);
+	if (ret) {
+		drm_property_blob_put(blob);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_color_add_gamma_mode_range);
+
 /**
  * drm_mode_crtc_set_gamma_size - set the gamma table size
  * @crtc: CRTC to set the gamma table size for
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..db68f42f6d12 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -74,6 +74,14 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+int drm_color_create_gamma_mode_property(struct drm_crtc *crtc,
+					 int num_values);
+void drm_crtc_attach_gamma_mode_property(struct drm_crtc *crtc);
+int drm_color_add_gamma_mode_range(struct drm_crtc *crtc,
+				   const char *name,
+				   const struct drm_color_lut_range *ranges,
+				   size_t length);
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750a..b1eead03ebe8 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -262,6 +262,13 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *mode_blob;
 
+	/**
+	 * @gamma_mode: This is a blob_id and exposes the platform capabilities
+	 * wrt to various gamma modes and the respective lut ranges. This also
+	 * helps user select a gamma mode amongst the supported ones.
+	 */
+	u32 gamma_mode;
+
 	/**
 	 * @degamma_lut:
 	 *
@@ -1096,6 +1103,13 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @gamma_mode_property: Optional CRTC property to enumerate and
+	 * select the mode of the crtc gamma/degmama LUTs. This also exposes
+	 * the lut ranges of the various supported gamma modes to userspace.
+	 */
+	struct drm_property *gamma_mode_property;
+
 	/**
 	 * @state:
 	 *
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 9b6722d45f36..d7758d351936 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -819,6 +819,49 @@ struct hdr_output_metadata {
 	};
 };
 
+/*
+ * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
+ * can be used for either purpose, but not simultaneously. To expose
+ * modes that support gamma and degamma simultaneously the gamma mode
+ * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
+ * ranges.
+ */
+/* LUT is for gamma (after CTM) */
+#define DRM_MODE_LUT_GAMMA BIT(0)
+/* LUT is for degamma (before CTM) */
+#define DRM_MODE_LUT_DEGAMMA BIT(1)
+/* linearly interpolate between the points */
+#define DRM_MODE_LUT_INTERPOLATE BIT(2)
+/*
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_MODE_LUT_REUSE_LAST BIT(3)
+/* the curve must be non-decreasing */
+#define DRM_MODE_LUT_NON_DECREASING BIT(4)
+/* the curve is reflected across origin for negative inputs */
+#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
+/* the same curve (red) is used for blue and green channels as well */
+#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
+
+struct drm_color_lut_range {
+	/* DRM_MODE_LUT_* */
+	__u32 flags;
+	/* number of points on the curve */
+	__u16 count;
+	/* input/output bits per component */
+	__u8 input_bpc, output_bpc;
+	/* input start/end values */
+	__s32 start, end;
+	/* output min/max values */
+	__s32 min, max;
+};
+
+enum lut_type {
+	LUT_TYPE_DEGAMMA = 0,
+	LUT_TYPE_GAMMA = 1,
+};
+
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
-- 
2.26.2

