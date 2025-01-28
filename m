Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2583A20DEB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7FA10E6C4;
	Tue, 28 Jan 2025 16:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RORGxcXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BFF10E6A8;
 Tue, 28 Jan 2025 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080363; x=1769616363;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jdyoIsZnmolIT/eXOYhdQ7bf4YcpfOxAKAvdt+cKmqE=;
 b=RORGxcXcKULXY43gQHJQI8hpvcNJN648MdwkBocXugvFZujzlilL5SUM
 0QJdryD4RHaroLrLXb86aFlo+9u8r1vzP868TySFG4wAZZew5rMk9U73x
 +YA68Cr57KaM3OczSS0QW2bp3gZCxv4y7kaNKGsgG/FLd6dsrdHRGRsLQ
 fFzkFok0P/92GMmbyJcx103fawKr8tWXwtTjc2bvQTz8rfWH6P76E0xmn
 vB858Rv5KFyRbOmx8ecTE49mzRUaLMQjDBOr6rncaFveY8WOksx0HqAm4
 JNmqRzmCq77AYiZdhk9oC1llTCENUB2z0w/SyPRxX9NxZEmlwj/AHQA4A g==;
X-CSE-ConnectionGUID: SOYW1x5RQuOvYDj/WmwIjA==
X-CSE-MsgGUID: 4tsQkhvLQsKJXuHQefhMOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745011"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745011"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:03 -0800
X-CSE-ConnectionGUID: LSj8ut0lRVCk217+1FxfZg==
X-CSE-MsgGUID: 7v9H/ccoTjm5xC2GVabssA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976908"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:00 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:09 +0530
Subject: [PATCH v8 03/14] drm/crtc: Expose API to create drm crtc property
 for histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-3-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Add drm-crtc property for histogram and for the properties added add
the corresponding get/set_property.

v8: Rebased

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 15 +++++++
 drivers/gpu/drm/drm_crtc.c                | 73 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    | 44 +++++++++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb109533d2596e899a57b571fa0995824f..dfe6293f7a42d034da3de593094019ca15014a02 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -143,6 +143,12 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->ctm);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
+	if (state->histogram_caps)
+		drm_property_blob_get(state->histogram_caps);
+	if (state->histogram_enable)
+		drm_property_blob_get(state->histogram_enable);
+	if (state->histogram_data)
+		drm_property_blob_get(state->histogram_data);
 	state->mode_changed = false;
 	state->active_changed = false;
 	state->planes_changed = false;
@@ -156,6 +162,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	/* Self refresh should be canceled when a new update is available */
 	state->active = drm_atomic_crtc_effectively_active(state);
 	state->self_refresh_active = false;
+
+	state->histogram_updated = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
@@ -215,6 +223,12 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->gamma_lut);
+	if (state->histogram_caps)
+		drm_property_blob_put(state->histogram_caps);
+	if (state->histogram_enable)
+		drm_property_blob_put(state->histogram_enable);
+	if (state->histogram_data)
+		drm_property_blob_put(state->histogram_data);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 370dc676e3aa543c9827b50df20df78f02b738c9..459d30898196c94392a7f916b1fa9ca3a334eea8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -415,6 +415,15 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 			return -EFAULT;
 
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
+	} else if (property == crtc->histogram_enable_property) {
+		ret = drm_property_replace_blob_from_id(dev,
+							&state->histogram_enable,
+							val,
+							-1,
+							sizeof(struct drm_histogram_config),
+							&replaced);
+		state->histogram_updated |= replaced;
+		return ret;
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
 	} else if (crtc->funcs->atomic_set_property) {
@@ -452,6 +461,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
+	else if (property == crtc->histogram_caps_property)
+		*val = (state->histogram_caps) ? state->histogram_caps->base.id : 0;
+	else if (property == crtc->histogram_enable_property)
+		*val = (state->histogram_enable) ? state->histogram_enable->base.id : 0;
+	else if (property == crtc->histogram_data_property)
+		*val = (state->histogram_data) ? state->histogram_data->base.id : 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
 	else if (crtc->funcs->atomic_get_property)
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003db2a1b43441434839e26f61d79b4e..d10b29aff725e40bdb93e6bd0828347db40fa3e8 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -959,3 +959,76 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
 	return hweight32(crtc_state->encoder_mask) > 1;
 }
 EXPORT_SYMBOL(drm_crtc_in_clone_mode);
+
+/**
+ * drm_crtc_create_histogram_property: create histogram properties
+ *
+ * @crtc: pointer to the struct drm_crtc.
+ * @caps: pointer to the struct drm_histogram_caps, holds the
+ *	  histogram hardware capabilities.
+ *
+ * The property HISTOGRAM_CAPS exposes the hardware capability for
+ * histogram which includes the histogram mode, number of bins etc
+ * The property HISTOGRAM_ENABLE allows user to enable/disable the
+ * histogram feature and also configure the hardware.
+ * Upon KMD enabling by writing to the hardware registers, histogram
+ * is generated. Histogram is composed of 'n' bins with each bin
+ * being an integer(pixel count).
+ * An event HISTOGRAM will be sent to the user. User upon receiving this
+ * event can read the hardware generated histogram using crtc property
+ * HISTOGRAM_DATA.
+ * User can use this histogram data to enhance the image or in shaders.
+ *
+ * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ * Property HISTOGRAM_ENABLE is a blob pointing to the struct
+ * drm_histogram_config
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ * Property HISTOGRAM_DATA is a blob pointing to the struct drm_histogram
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc,
+				       struct drm_histogram_caps *caps)
+{
+	struct drm_property *prop;
+	struct drm_property_blob *blob;
+	struct drm_histogram_caps *blob_data;
+
+	blob = drm_property_create_blob(crtc->dev,
+					sizeof(struct drm_histogram_caps),
+				NULL);
+	if (IS_ERR(blob))
+		return -1;
+	blob_data = blob->data;
+	blob_data->histogram_mode = caps->histogram_mode;
+	blob_data->bins_count = caps->bins_count;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "HISTOGRAM_CAPS", blob->base.id);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->histogram_caps_property = prop;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_BLOB, "HISTOGRAM_ENABLE", 0);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->histogram_enable_property = prop;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "HISTOGRAM_DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->histogram_data_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_histogram_property);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2a748cf40ebf45b37158acda439d9..2da803749bdf03c07268be4e075793ef4e4eb99a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,32 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @histogram_caps:
+	 *
+	 * The blob points to the structure drm_histogram_caps.
+	 * For more info on the elements of the struct drm_histogram_caps
+	 * see include/uapi/drm/drm_mode.h
+	 */
+	struct drm_property_blob *histogram_caps;
+	/**
+	 * @histogram_enable:
+	 *
+	 * The blob points to the structure drm_histogram_config.
+	 * For more information on the elements of struct drm_histogram_config
+	 * see include/uapi/drm/drm_mode.h
+	 */
+	struct drm_property_blob *histogram_enable;
+	/**
+	 * @histogram_data:
+	 *
+	 * The blob points to the structure drm_histogram.
+	 * For more information on the elements of struct drm_histogram
+	 * see include/uapi/drm/drm_mode.h
+	 */
+	struct drm_property_blob *histogram_data;
+	bool histogram_updated;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1088,6 +1114,22 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @histogram_caps_property: Optional CRTC property for getting the
+	 * histogram hardware capability.
+	 */
+	struct drm_property *histogram_caps_property;
+	/**
+	 * @histogram_enable_property: Optional CRTC property for enabling or
+	 * disabling global histogram.
+	 */
+	struct drm_property *histogram_enable_property;
+	/**
+	 * @histogram_data_proeprty: Optional CRTC property for getting the
+	 * histogram blob data.
+	 */
+	struct drm_property *histogram_data_property;
+
 	/**
 	 * @state:
 	 *
@@ -1324,4 +1366,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc,
+				       struct drm_histogram_caps *caps);
 #endif /* __DRM_CRTC_H__ */

-- 
2.25.1

