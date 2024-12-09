Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A69E9BC4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431010E4D6;
	Mon,  9 Dec 2024 16:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gK/HDLqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1410E4D0;
 Mon,  9 Dec 2024 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762092; x=1765298092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvArGNUJQYx7oxR56kg5utzmlEmpPrBQKM8fjIzNdeM=;
 b=gK/HDLqIRRqIjZ1MEdxoCtlhSt+xYqPLd5UqxLVZCIOzi4FhtY5Jy8lj
 YumEx2u0KsqpitN6E/K8tPvFLekkjzBCoA3vd/slY15ckCoJveQwIaso7
 qqcjAYwLi5/vP32DYS1WuzTkBmMdmnfjFqvG0Twt2xUuP/0ugXZXpfqJt
 qqVup88KP1YWkn6TDuDhmN9u1UT79OcnEPkPxexeHMtbfYIhrKAB/SiEd
 PtuKR1aDI06eivzMBddGisDwrom0O/oFi3s3BFVRyhWoc6LpoA6Gv9BKA
 511g+1QTWld0jWDdrfx9cPaAsME/lvPMlGaTqlG+E/7i/8zUBX1mO+6nr w==;
X-CSE-ConnectionGUID: TV6d9JzyTKqnkbUjP3PUGg==
X-CSE-MsgGUID: 49SO10jUTT+Egx5DfXW5pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551606"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:34:51 -0800
X-CSE-ConnectionGUID: GJSG02tMQpSsBdjPulwU6w==
X-CSE-MsgGUID: 1/ZHwZwDS9+BsQxlqgP1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371662"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:34:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 02/10] drm/crtc: Expose API to create drm crtc property for
 histogram
Date: Mon,  9 Dec 2024 21:54:56 +0530
Message-Id: <20241209162504.2146697-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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

Add drm-crtc property for histogram and for the properties added add
corresponding get/set_property.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  6 ++
 drivers/gpu/drm/drm_atomic_uapi.c         | 17 +++++
 drivers/gpu/drm/drm_crtc.c                | 84 +++++++++++++++++++++++
 include/drm/drm_crtc.h                    |  1 +
 4 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb1095..3b2b58e36a6d 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -143,6 +143,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->ctm);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
+	if (state->histogram_data)
+		drm_property_blob_get(state->histogram_data);
 	state->mode_changed = false;
 	state->active_changed = false;
 	state->planes_changed = false;
@@ -156,6 +158,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	/* Self refresh should be canceled when a new update is available */
 	state->active = drm_atomic_crtc_effectively_active(state);
 	state->self_refresh_active = false;
+
+	state->histogram_iet_updated = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
@@ -215,6 +219,8 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->gamma_lut);
+	if (state->histogram_data)
+		drm_property_blob_put(state->histogram_data);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 370dc676e3aa..b3c13c0fafae 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -415,6 +415,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 			return -EFAULT;
 
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
+	} else if (property == crtc->histogram_enable_property) {
+		state->histogram_enable = val;
+	} else if (property == crtc->histogram_iet_property) {
+		ret = drm_property_replace_blob_from_id(dev,
+							&state->histogram_iet,
+							val,
+							-1,
+							sizeof(struct drm_iet),
+							&replaced);
+		state->histogram_iet_updated |= replaced;
+		return ret;
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
 	} else if (crtc->funcs->atomic_set_property) {
@@ -452,6 +463,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
+	else if (property == crtc->histogram_enable_property)
+		*val = state->histogram_enable;
+	else if (property == crtc->histogram_data_property)
+		*val = (state->histogram_data) ? state->histogram_data->base.id : 0;
+	else if (property == crtc->histogram_iet_property)
+		*val = (state->histogram_iet) ? state->histogram_iet->base.id : 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
 	else if (crtc->funcs->atomic_get_property)
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 3488ff067c69..8fedf6684eb3 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -939,3 +939,87 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+/**
+ * drm_crtc_create_histogram_property: create histogram properties
+ *
+ * @crtc: pointer tot he struct drm_crtc.
+ *
+ * The property HISTOGRAM_ENABLE allows user to enable/disable the
+ * histogram feature in the hardware. Upon KMD enabling by writing to the
+ * hardware registers, a histogram is generated. Histogram is composed of
+ * 'n' bins with each bin being an integer(pixel count).
+ * An event HISTOGRAM will be sent to the user. User upon recieving this
+ * event user can read the hardware generated histogram using crtc property
+ * HISTOGRAM_DATA. User can use this histogram data, apply various
+ * equilization techniques to come up with a pixel factor. This pixel
+ * factor is an array of integer with 'n+1' elements. This is fed back to
+ * the KMD by crtc property HISTOGRAM_IET. KMD will write this IET data
+ * back to the hardware to see the enhancement/equilization done to the
+ * images on that pipe.
+ * The crtc property HISTOGRAM_DATA and HISTOGRAM_IET is of type blob.
+ *
+ * For crtc property HISTOGRAM_DATA,
+ * the blob data pointer will be the address of the struct drm_histogram.
+ * struct drm_histogram {
+ *         u64 data_ptr;
+ *         u32 nr_elements;
+ * }
+ * Histogram is composed of @nr_elements of bins with each bin being an
+ * integer value, referred to as pixel_count.
+ * The element @data_ptr holds the address of histogam.
+ * Sample:
+ * Historgram[0] = 2050717
+ * Historgram[1] = 244619
+ * Historgram[2] = 173368
+ * ....
+ * Historgram[31] = 21631
+ *
+ * For crtc_property HISTOGRAM_IET,
+ * the blob data pointer will be the address of the struct drm_iet.
+ *  struct drm_iet {
+ *         u64 data_ptr;
+ *         u32 nr_elements;
+ * }
+ * ImageEnhancemenT(IET) is composed of @nr_elements of bins with each bin
+ * being an integer value, referred to as pixel factor.
+ * The element @data_ptr holds the addess of pixel factor.
+ * Sample:
+ * Pixel Factor[0] = 1023
+ * Pixel Factor[1] = 695
+ * Pixel Factor[2] = 1023
+ * ....
+ * Pixel Factor[32] = 512
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_bool(crtc->dev, DRM_MODE_PROP_ATOMIC,
+					"HISTOGRAM_ENABLE");
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
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_BLOB, "HISTOGRAM_IET", 0);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&crtc->base, prop, 0);
+	crtc->histogram_iet_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_histogram_property);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index f0f4a73e2e31..c3807e371160 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1374,5 +1374,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc);
 
 #endif /* __DRM_CRTC_H__ */
-- 
2.25.1

