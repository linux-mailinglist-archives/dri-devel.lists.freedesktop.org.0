Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7FA3BD9E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 12:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5510E2C4;
	Wed, 19 Feb 2025 11:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPx+NNQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19F10E299;
 Wed, 19 Feb 2025 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739966378; x=1771502378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r+bSPgEAqQkw09u+pZbKTJIBq8DyFSni9EyT5EaJgsw=;
 b=EPx+NNQotiFTUFeT+VTxdOKOFwarEBz8kC+Yar8DEhBn6RN73vYqq39k
 EFvqtk58J/5tTdcqcKxE+FD71UNNtRle/1ymQD1DCdZRkrjOUOTY17aIa
 8sTZm8SYs4VcO4osRvmLHtMTwmwTDGvGIn9SRAzo+Lu9BTEzqHdT0Ki13
 fbmuH2YStFGlQdZ/O+e+0tPRBsvumGBfmu2vouAbcmJ9FP3EMCCQYNAqQ
 Sj2Z2OFp293B46V7s07e+Dh/otZ/fTDWb6lLja2YlRi0FEtnO0yMxO+J/
 E3AWaJ/RX509CYqokyoO8ClJ/E0VkZV0sgiDoihM5K4ZPN96OI3tiHRiT g==;
X-CSE-ConnectionGUID: uDVOHxZcSzmJbudd/JlNQw==
X-CSE-MsgGUID: vVl/5vo1Q5u9ldBq9KMqUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52103060"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="52103060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:59:37 -0800
X-CSE-ConnectionGUID: FSNeUKGrRamFaQA0ad7w+Q==
X-CSE-MsgGUID: bcnXI5V/TKqk+j9w/mRvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114544913"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 03:59:35 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/6] drm: Introduce sharpness strength property
Date: Wed, 19 Feb 2025 17:23:54 +0530
Message-Id: <20250219115359.2320992-2-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

Introduces the new crtc property "SHARPNESS_STRENGTH" that allows
the user to set the intensity so as to get the sharpness effect.
The value of this property can be set from 0-255.
It is useful in scenario when the output is blurry and user
want to sharpen the pixels. User can increase/decrease the
sharpness level depending on the content displayed.

v2: Rename crtc property variable [Arun]
    Add modeset detail in uapi doc[Uma]
v3: Fix build issue

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h            | 17 +++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2765ba90ad8f..65eea6362fc0 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -418,6 +418,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == crtc->sharpness_strength_property) {
+		state->sharpness_strength = val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -455,6 +457,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
+	else if (property == crtc->sharpness_strength_property)
+		*val = state->sharpness_strength;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003d..1b7ce99cea5e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
  * 		Driver's default scaling filter
  * 	Nearest Neighbor:
  * 		Nearest Neighbor scaling filter
+ * SHARPNESS_STRENGTH:
+ *	Atomic property for setting the sharpness strength/intensity by userspace.
+ *
+ *	The value of this property is set as an integer value ranging
+ *	from 0 - 255 where:
+ *
+ *	0 means feature is disabled.
+ *
+ *	1 means minimum sharpness.
+ *
+ *	255 means maximum sharpness.
+ *
+ *	User can gradually increase or decrease the sharpness level and can
+ *	set the optimum value depending on content and this value will be
+ *	passed to kernel through the Uapi.
+ *	The setting of this property does not require modeset.
+ *	The sharpness effect takes place post blending on the final composed output.
+ *	If the feature is disabled, the content remains same without any sharpening effect
+ *	and when this feature is applied, it enhances the clarity of the content.
  */
 
 __printf(6, 0)
@@ -940,6 +959,22 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
 
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *prop =
+		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0, 255);
+
+	if (!prop)
+		return -ENOMEM;
+
+	crtc->sharpness_strength_property = prop;
+	drm_object_attach_property(&crtc->base, prop, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
+
 /**
  * drm_crtc_in_clone_mode - check if the given CRTC state is in clone mode
  *
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2..ffcfe5c50dab 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -317,6 +317,16 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @sharpness_strength
+	 *
+	 * Used by the user to set the sharpness intensity.
+	 * The value ranges from 0-255.
+	 * Any value greater than 0 means enabling the featuring
+	 * along with setting the value for sharpness.
+	 */
+	u8 sharpness_strength;
+
 	/**
 	 * @event:
 	 *
@@ -1088,6 +1098,12 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @sharpness_strength_prop: property to apply
+	 * the intensity of the sharpness requested.
+	 */
+	struct drm_property *sharpness_strength_property;
+
 	/**
 	 * @state:
 	 *
@@ -1324,4 +1340,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
-- 
2.25.1

