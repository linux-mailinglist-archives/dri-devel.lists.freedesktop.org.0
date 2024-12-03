Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562D9E1314
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 07:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120410E8F9;
	Tue,  3 Dec 2024 06:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4TemgqJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB110E8F9;
 Tue,  3 Dec 2024 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733205906; x=1764741906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8TmlOCmYxLclAM4csd6rCckzO79yZGFCfPpBMOc8WpQ=;
 b=d4TemgqJ/avopXvDsOmjhJt2nP6PPqZFlip5sR2JUHSUG6Li5msrA5pI
 3bDGTtOG98yRbXEbAu7Osny14x7oKYoiCl0+wE7ZlCIESI7mGTR9rOClg
 ur7tLLjMfQKW5RFnYDprpAEThhDUcW38NYykqWA+UpZwqMwCgst1/N06a
 W8FuKUKH5nGMN4UUJ91SQVYf/mtKc57Tc+zTR0PgaGCBnQSGRAnD2XRVW
 tm15N/0TCAd55kflEexjVf67TNdGEvcrStPrXRR3Urrf2MGk/6BWdIwdE
 XFu1/ONRFVODMXePy3zMbYKC9nK45pS+km/JwZc5UZQ7IYKtSqOgawFZm w==;
X-CSE-ConnectionGUID: 9Jj2nCh6TUaTTUSnkgfgGA==
X-CSE-MsgGUID: OjO4UZjQS92QmMHCamGcVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37058843"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37058843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:05:06 -0800
X-CSE-ConnectionGUID: lRMEcfjoS+Cig+0UauvP0w==
X-CSE-MsgGUID: fUvrGVysT2GOYQcVEI9fdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="124163831"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 22:05:05 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 02/10] drm/crtc: Expose API to create drm crtc property for
 histogram
Date: Tue,  3 Dec 2024 11:25:12 +0530
Message-Id: <20241203055520.1704661-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203055520.1704661-1-arun.r.murthy@intel.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
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
 drivers/gpu/drm/drm_atomic_state_helper.c |  6 +++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 17 +++++++++++++
 drivers/gpu/drm/drm_crtc.c                | 30 +++++++++++++++++++++++
 include/drm/drm_crtc.h                    |  1 +
 4 files changed, 54 insertions(+)

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
index 370dc676e3aa..367f87afea92 100644
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
+							sizeof(struct drm_histogram),
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
index 3488ff067c69..ec169a5b35a2 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -939,3 +939,33 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
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
index 3984cfa00cbf..d1b9fae5592d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1371,5 +1371,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+int drm_crtc_create_histogram_property(struct drm_crtc *crtc);
 
 #endif /* __DRM_CRTC_H__ */
-- 
2.25.1

