Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF144A20DEC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53D10E6BA;
	Tue, 28 Jan 2025 16:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DufCS8Zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0E10E6BA;
 Tue, 28 Jan 2025 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080366; x=1769616366;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=seDN0GzqUP6FkyB7tbmdsMMDdtEOQ0gVOWmlPyltSKw=;
 b=DufCS8Zh+207awgmeH0B+mfFuWQcpT80xmhwvPripI3Usw+9pk4zG0CK
 ToZO3Sbfm4MQoGGUNn96Ef1l/FAFFqcmuxenHOW8Wq6B5v+/4/vYq5Q1e
 m6kDBs/RS/rlm66bG9xIoxHSr63q0JTVKBc41e8qHNpFZPQZCvMzGuyBh
 IkFpeRnjB3nCDsKjk3pxzwavsmNNvfj/rnTYspBgrFchiYokC6jrztMJg
 gK+e8WW+rbBqdP+ytPmj1C4Wlp/Eb7yLXitCy3PgJRH7AgBBFvma5xu2h
 mvY/wbTVHWqGx+07OFga6+10hYr7DG9dDkRUvU3NwdUtr/kKa39HXfBE4 Q==;
X-CSE-ConnectionGUID: M/GN0HjvQcKmmqzNJI4Iew==
X-CSE-MsgGUID: TARWuCPVRJulkZ+gP7FEEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745018"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:05 -0800
X-CSE-ConnectionGUID: CkcBz0phTFegqv+yIr91SQ==
X-CSE-MsgGUID: andAbKGNTZ22WMpRIGpRow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976917"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:03 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:10 +0530
Subject: [PATCH v8 04/14] drm/crtc: Expose API to create drm crtc property
 for IET LUT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-4-871b94d777f8@intel.com>
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

Add drm-crtc property for IET 1DLUT and for the properties added add
corresponding get/set_property.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 13 ++++++++
 drivers/gpu/drm/drm_crtc.c                | 54 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    | 36 +++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index dfe6293f7a42d034da3de593094019ca15014a02..ceab90cec57cc580afcf334e275982827e9b0e0d 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -149,6 +149,10 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->histogram_enable);
 	if (state->histogram_data)
 		drm_property_blob_get(state->histogram_data);
+	if (state->iet_lut_caps)
+		drm_property_blob_get(state->iet_lut_caps);
+	if (state->iet_lut)
+		drm_property_blob_get(state->iet_lut);
 	state->mode_changed = false;
 	state->active_changed = false;
 	state->planes_changed = false;
@@ -164,6 +168,7 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	state->self_refresh_active = false;
 
 	state->histogram_updated = false;
+	state->iet_lut_updated = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
@@ -229,6 +234,10 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 		drm_property_blob_put(state->histogram_enable);
 	if (state->histogram_data)
 		drm_property_blob_put(state->histogram_data);
+	if (state->iet_lut_caps)
+		drm_property_blob_put(state->iet_lut_caps);
+	if (state->iet_lut)
+		drm_property_blob_put(state->iet_lut);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 459d30898196c94392a7f916b1fa9ca3a334eea8..f31d24d80cc082b38c611b12f36f281fa7404869 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -424,6 +424,15 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 							&replaced);
 		state->histogram_updated |= replaced;
 		return ret;
+	} else if (property == crtc->iet_lut_property) {
+		ret = drm_property_replace_blob_from_id(dev,
+							&state->iet_lut,
+							val,
+							-1,
+							sizeof(struct drm_iet_1dlut_sample),
+							&replaced);
+		state->iet_lut_updated |= replaced;
+		return ret;
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
 	} else if (crtc->funcs->atomic_set_property) {
@@ -467,6 +476,10 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->histogram_enable) ? state->histogram_enable->base.id : 0;
 	else if (property == crtc->histogram_data_property)
 		*val = (state->histogram_data) ? state->histogram_data->base.id : 0;
+	else if (property == crtc->iet_lut_caps_property)
+		*val = (state->iet_lut_caps) ? state->iet_lut_caps->base.id : 0;
+	else if (property == crtc->iet_lut_property)
+		*val = (state->iet_lut) ? state->iet_lut->base.id : 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
 	else if (crtc->funcs->atomic_get_property)
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index d10b29aff725e40bdb93e6bd0828347db40fa3e8..850d98d7f9c8965c7a5e9ac5505e355042041449 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -1032,3 +1032,57 @@ int drm_crtc_create_histogram_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_histogram_property);
+
+/**
+ * drm_crtc_create_iet_lut_property
+ *
+ * @crtc: pointer to the struct drm_crtc.
+ * @caps: pointer to the struct drm_iet_caps, holds the
+ *	  image enhancement LUT hardware capabilities.
+ *
+ * This 1DLUT is used by the hardware to enahance the image. Hardware
+ * interpolates this LUT value to generate the enhanced output image.
+ *
+ * The blob property IET_LUT_CAPS points to the struct drm_iet_lut_caps
+ * The blob property IET_LUT points to the struct drm_iet_1dlut_sample
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_create_iet_lut_property(struct drm_crtc *crtc,
+				     struct drm_iet_caps *caps)
+{
+	struct drm_property *prop;
+	struct drm_iet_caps *blob_data;
+	struct drm_property_blob *blob;
+
+	blob = drm_property_create_blob(crtc->dev,
+					sizeof(struct drm_iet_caps),
+					NULL);
+	if (IS_ERR(blob))
+		return -1;
+	blob_data = blob->data;
+	blob_data->iet_mode = caps->iet_mode;
+	blob_data->nr_iet_sample_formats = caps->nr_iet_sample_formats;
+	blob_data->nr_iet_lut_entries = caps->nr_iet_lut_entries;
+	blob_data->iet_sample_format = caps->iet_sample_format;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IET_LUT_CAPS", blob->base.id);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->iet_lut_caps_property = prop;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_BLOB, "IET_LUT", 0);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->iet_lut_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_iet_lut_property);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 2da803749bdf03c07268be4e075793ef4e4eb99a..bc85ab16d5c817773a1d8b415eb256d08c13c709 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -300,6 +300,29 @@ struct drm_crtc_state {
 	struct drm_property_blob *histogram_data;
 	bool histogram_updated;
 
+	/**
+	 * @iet_lut_caps:
+	 *
+	 * The blob points to the structure drm_iet_lut_caps.
+	 * For more info on the elements of the struct drm_iet_lut_caps
+	 * see include/uapi/drm/drm_mode.h
+	 */
+	struct drm_property_blob *iet_lut_caps;
+	/**
+	 * @iet_lut:
+	 *
+	 * The blob points to the struct drm_lut_sample
+	 * For more information on the elements of struct drm_lut_sample
+	 * see include/uapi/drm/drm_mode.h
+	 */
+	struct drm_property_blob *iet_lut;
+	/**
+	 * @iet_lut_updates:
+	 *
+	 * Convey that the image enhanced data has been updated by the user
+	 */
+	bool iet_lut_updated;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1130,6 +1153,17 @@ struct drm_crtc {
 	 */
 	struct drm_property *histogram_data_property;
 
+	/**
+	 * @iet_lut_caps_property: Optional CRTC property for getting the
+	 * iet LUT hardware capability.
+	 */
+	struct drm_property *iet_lut_caps_property;
+	/**
+	 * @iet_lut_proeprty: Optional CRTC property for writing the
+	 * image enhanced LUT
+	 */
+	struct drm_property *iet_lut_property;
+
 	/**
 	 * @state:
 	 *
@@ -1368,4 +1402,6 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
 int drm_crtc_create_histogram_property(struct drm_crtc *crtc,
 				       struct drm_histogram_caps *caps);
+int drm_crtc_create_iet_lut_property(struct drm_crtc *crtc,
+				     struct drm_iet_caps *caps);
 #endif /* __DRM_CRTC_H__ */

-- 
2.25.1

