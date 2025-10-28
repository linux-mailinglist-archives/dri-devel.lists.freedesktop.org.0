Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E2C1494E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03EB10E3BB;
	Tue, 28 Oct 2025 12:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbWwV7a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CE610E3BB;
 Tue, 28 Oct 2025 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654047; x=1793190047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bEW+aaQ0zBXhENQpThhl8woJUvPUYDM3KRYMEV2+vWU=;
 b=kbWwV7a0GLQzKaVZkOv/cbiOLSlGNCwrcrYkmRLAP+yNvxrZnR9rb6QN
 kHvD0eISVHB+PJrrecoLIN1VeYGfhiv9adNyGSWfVwp6nYQCcpSfC6WH2
 9wKdMd0ogpiSyIxOqQ/dWoEyNz+e+CGrgfA7Bgj4wDaLHFHbGQF1ITQxN
 qv+nUOxmd3EP306k7RlddaEQRTxqepTtQsIT0bJno3lNUraRu8royRNn7
 mqUlEzKOnaFzLm5zZZumMB6atSgy220+t7QwZW+A8/xYfqvUWI5+b50Or
 G2p7iTUSWZ947JmaRZQp3NtErSPVUwX1VIq4JOodtTv3zljq0QfEMK4vp A==;
X-CSE-ConnectionGUID: uNNUx11CSsK+5W1OWNAFOw==
X-CSE-MsgGUID: qWoGgZkdT9OEtsvMy2mE0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75198262"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75198262"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:20:46 -0700
X-CSE-ConnectionGUID: QjjcBYQlS9qPYuiBd6aoBw==
X-CSE-MsgGUID: fZpACHWzRUGAhyLOEtWTiw==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:20:44 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: nemesa.garg@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Adarsh G M <Adarsh.g.m@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RESEND 01/10] drm/drm_crtc: Introduce sharpness strength property
Date: Tue, 28 Oct 2025 17:37:37 +0530
Message-ID: <20251028120747.3027332-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
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

From: Nemesa Garg <nemesa.garg@intel.com>

Introduce a new crtc property "SHARPNESS_STRENGTH" that allows
the user to set the intensity so as to get the sharpness effect.
The value of this property can be set from 0-255.
It is useful in scenario when the output is blurry and user
want to sharpen the pixels. User can increase/decrease the
sharpness level depending on the content displayed.

v2: Rename crtc property variable [Arun]
    Add modeset detail in uapi doc[Uma]
v3: Fix build issue
v4: Modify the subject line[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Tested-by: Adarsh G M <Adarsh.g.m@intel.com>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h            | 18 ++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..b2cb5ae5a139 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == crtc->sharpness_strength_property) {
+		state->sharpness_strength = val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
+	else if (property == crtc->sharpness_strength_property)
+		*val = state->sharpness_strength;
 	else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003d..a7797d260f1e 100644
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
+ *	0: Sharpness feature is disabled(default value).
+ *
+ *	1: Minimum sharpness.
+ *
+ *	255: Maximum sharpness.
+ *
+ *	User can gradually increase or decrease the sharpness level and can
+ *	set the optimum value depending on content.
+ *	This value will be passed to kernel through the UAPI.
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
index 2d2a0bd526cf..66278ffeebd6 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -317,6 +317,17 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @sharpness_strength:
+	 *
+	 * Used by the user to set the sharpness intensity.
+	 * The value ranges from 0-255.
+	 * Default value is 0 which disable the sharpness feature.
+	 * Any value greater than 0 enables sharpening with the
+	 * specified strength.
+	 */
+	u8 sharpness_strength;
+
 	/**
 	 * @event:
 	 *
@@ -1088,6 +1099,12 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @sharpness_strength_property: property to apply
+	 * the intensity of the sharpness requested.
+	 */
+	struct drm_property *sharpness_strength_property;
+
 	/**
 	 * @state:
 	 *
@@ -1324,4 +1341,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
+int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
-- 
2.45.2

