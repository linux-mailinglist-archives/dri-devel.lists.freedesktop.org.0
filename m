Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544229F6949
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D97910EBE5;
	Wed, 18 Dec 2024 15:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgHJvNoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E69510EBE2;
 Wed, 18 Dec 2024 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534144; x=1766070144;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kHKeJ6+L0SUQ1ATtE293JGNoa0JOxCN8Kpi9nCwIqxo=;
 b=UgHJvNoHIOPzLe/E4aNsAeNhFtHWmKB570x6kKlaZ9gu0q775bcXPgnZ
 BvZ40rEddD0diEHQEGgWPohTuHtv7sey/OQfnk+y0JXV/hCStsRiJyBao
 gi0XUTH5yzebR+tyE3nd+2sXD6bhEJ6te3zev0f0AGHOtqoOG3pLwmdGD
 hchYXziIUehtFYBTzTROJYeVbJ7aWkxtHtCjdm1qrvEv9lD8jdwqnxhy0
 ziRMnuk8BcCJOou5gVN9jeFXo7D+xnQIgpiaY/w4ZmCL9KGSEMPxQfah4
 LiZIXW1/3dNKlSL6r0vvJ5l4hJlwxSLpcoF96ySsVZeiYlcyPq16c7Cyi A==;
X-CSE-ConnectionGUID: gTfpOZx/S5CfRvo04/RndQ==
X-CSE-MsgGUID: 4ZdVWh50QqWkLGbRrfN2vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45502524"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45502524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:02:21 -0800
X-CSE-ConnectionGUID: QGHfKofGTYGwDQmK/Rf2Lw==
X-CSE-MsgGUID: Gvg5xT+vTrmg8lRo6Wjb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025466"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:02:19 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 18 Dec 2024 20:22:06 +0530
Subject: [PATCH v7 3/4] drm/crtc: Expose API to create drm crtc property
 for histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dpst-v7-3-81bfe7d08c2d@intel.com>
References: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
In-Reply-To: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: 20240705091333.328322-1-mohammed.thasleem@intel.com, 
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 15 ++++++++
 drivers/gpu/drm/drm_crtc.c                | 59 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    | 43 ++++++++++++++++++++++
 4 files changed, 131 insertions(+)

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
index 3488ff067c69bb820b36177c97bc9fe5d5cbfea1..1c91cce3dcd31ede1e9d771af00c7c4414000a2b 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -939,3 +939,62 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+/**
+ * drm_crtc_create_histogram_property: create histogram properties
+ *
+ * @crtc: pointer to the struct drm_crtc.
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
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "HISTOGRAM_CAPS", 0);
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
index 8b48a1974da3143c7de176e6fe3e01da9c8fc9d8..934cac2adb9889d2477e9601598796927bc016ea 100644
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
@@ -1323,5 +1365,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc);
 
 #endif /* __DRM_CRTC_H__ */

-- 
2.25.1

