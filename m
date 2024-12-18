Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE09F694B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207AA10EBE6;
	Wed, 18 Dec 2024 15:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxTnyLB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6732510EBE3;
 Wed, 18 Dec 2024 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534145; x=1766070145;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YzcOrORemTWljx6yoyxJmSSzHCvGCQ8iB2rLyGvkJ4c=;
 b=hxTnyLB9A9KtbWj+bXgyZKMaxLGtxOP2WxfdqKtTfTXvVpy+m/uXJPvs
 bsKnOEam0376zwNrDr+nteFyaBd4rdEiwR/+Dhv8GYpN4Kokf/K6ag7ve
 rlBQQ8d4I13infUb+BkrUEIVPEL6wkFfIxuG4f/LIQA1kwetS0P7rAxrB
 wjJfEbHQL46+V//RKC+rAiFEFdL7WRTynNQw3zj/dLp6FOz/RfgM9QrZ7
 +D4/rVbleKR4mYQG8L582C5YZsWaXSeTfinyHp5xW8/V5Fd6M0aRN1OrE
 6SNGWB2blLFWeLEw2hJiZkDFgzSWUufyi7jjiJxDq75iBauUNqeztdbmO g==;
X-CSE-ConnectionGUID: yk2+K/aqQX2ZZVmYP0naDA==
X-CSE-MsgGUID: vuuYZ/DgQgiSpg03SO2ZHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45502534"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45502534"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:02:24 -0800
X-CSE-ConnectionGUID: 4lqRXPT4Qxex6Mqfza3MSw==
X-CSE-MsgGUID: nkhNPfm/S0SeWmSHNDEzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025518"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:02:21 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 18 Dec 2024 20:22:07 +0530
Subject: [PATCH v7 4/4] drm/crtc: Expose API to create drm crtc property
 for IET LUT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dpst-v7-4-81bfe7d08c2d@intel.com>
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

Add drm-crtc property for IET 1DLUT and for the properties added add
corresponding get/set_property.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 13 +++++++++++
 drivers/gpu/drm/drm_crtc.c                | 38 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    | 34 +++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

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
index 1c91cce3dcd31ede1e9d771af00c7c4414000a2b..d8487603a61df7338713b42e92e455c7946cf03b 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -998,3 +998,41 @@ int drm_crtc_create_histogram_property(struct drm_crtc *crtc)
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_histogram_property);
+
+/**
+ * drm_crtc_create_iet_lut_property
+ *
+ * @crtc: pointer to the struct drm_crtc.
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
+int drm_crtc_create_iet_lut_property(struct drm_crtc *crtc)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IET_LUT_CAPS", 0);
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
index 934cac2adb9889d2477e9601598796927bc016ea..73c867feee95d41c279f0831b3571827ad93d471 100644
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

-- 
2.25.1

