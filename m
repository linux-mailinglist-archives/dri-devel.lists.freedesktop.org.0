Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD3C961E1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17D310E302;
	Mon,  1 Dec 2025 08:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3GygTi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AA210E2FA;
 Mon,  1 Dec 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577739; x=1796113739;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=p2Sbk2HbFLhFIwul3DsS5FO3OjVhsEq5FVlOQD1Tneo=;
 b=l3GygTi6yZiPJir530LfpNjpexiFkrDhBWXh0+ZuhCJaL83OfAJn0a8b
 hnDlEqLAPCMP6xTNVe5Jaj3vYjnfTcPtEr6JBQYP/0cOwh7AjlvUI+863
 /DPt8u6G36lbug7H3hRXcQIkDSk0zEcyxAhGQxtVRLt+8meQgJn4Y86qL
 NyOyZzxHUjAQoEWT6Mj4ZRphumhoF5GnbEGGNPxJWih82HPRsKWg3MVDc
 QEihnCMqfode6juGmMFXzHPcfhoY2uV7CJeYz9z2ysM2n9HxAi73eFrFK
 s3cGQgVmwyxzTvEmGiRNmy2f8sg5f5bbQTTjw4YsUGu96j5Scv+2fufjD w==;
X-CSE-ConnectionGUID: kqyymxrhQgy77DL5qhJgxA==
X-CSE-MsgGUID: Q0YpRwjVS262Sba2rr7UrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578329"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:28:58 -0800
X-CSE-ConnectionGUID: 8zEd+eVBTUi8Hb5nfuqIFg==
X-CSE-MsgGUID: DjMyNWQvT7iVPA6Lw96J4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352627"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:28:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:46 +0530
Subject: [PATCH v9 04/20] drm/colorop: Export function to create pipeline
 element histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-4-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
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

Create properties associated for histogram and then export function to
initialize the color pipeline element histogram. The properties include
histogram capabilities, enable and data.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 18 +++++++++
 drivers/gpu/drm/drm_colorop.c     | 84 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 55 +++++++++++++++++++++++++
 3 files changed, 157 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f2ba8e4c2bf2317880eed9d17f7ba3b113f2c057..3505c00dfc5168de3476fb94bced123f9c886cb2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -778,6 +778,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 					   struct drm_property *property,
 					   uint64_t val)
 {
+	u32 ret = 0;
+	bool replaced = false;
+
 	if (property == colorop->bypass_property) {
 		state->bypass = val;
 	} else if (property == colorop->lut1d_interpolation_property) {
@@ -788,6 +791,15 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->multiplier = val;
 	} else if (property == colorop->lut3d_interpolation_property) {
 		colorop->lut3d_interpolation = val;
+	} else if (property == colorop->histogram_enable_property) {
+		ret = drm_property_replace_blob_from_id(colorop->dev,
+							&state->histogram_enable,
+							val,
+							-1,
+							sizeof(struct drm_histogram_config),
+							&replaced);
+		state->histogram_updated |= replaced;
+		return ret;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -823,6 +835,12 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->lut3d_interpolation;
 	else if (property == colorop->data_property)
 		*val = (state->data) ? state->data->base.id : 0;
+	else if (property == colorop->histogram_caps_property)
+		*val = (state->histogram_caps) ? state->histogram_caps->base.id : 0;
+	else if (property == colorop->histogram_enable_property)
+		*val = (state->histogram_enable) ? state->histogram_enable->base.id : 0;
+	else if (property == colorop->histogram_data_property)
+		*val = (state->histogram_data) ? state->histogram_data->base.id : 0;
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 96eaaa078281a48dad057e06900b112ebb032631..e3e22db3b911e79979488b1493e72cd9a11ed418 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -461,6 +461,90 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 }
 EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
 
+/**
+ * drm_crtc_colorop_histogram_init: create histogram properties
+ *
+ * @colorop: pointer to the color pipeline
+ * @crtc: pointer to the struct drm_crtc.
+ * @caps: pointer to the struct drm_histogram_caps, holds the
+ *	  histogram hardware capabilities.
+ * @flags: colorop pipeline flags defined in drm_colorop.h
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
+ * DATA.
+ * User can use this histogram data to enhance the image or in shaders.
+ *
+ * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ * Property HISTOGRAM_ENABLE is a blob pointing to the struct
+ * drm_histogram_config
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ * Property DATA is a blob pointing to the struct drm_histogram
+ * Description of the structure is in include/uapi/drm/drm_mode.h
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_crtc_colorop_histogram_init(struct drm_colorop *colorop,
+				    struct drm_crtc *crtc,
+				    struct drm_histogram_caps *caps,
+				    uint32_t flags)
+{
+	struct drm_property *prop;
+	struct drm_property_blob *blob;
+	struct drm_histogram_caps *blob_data;
+	int ret;
+
+	ret = drm_crtc_colorop_init(crtc->dev, colorop, crtc,
+				    DRM_COLOROP_HISTOGRAM, flags);
+	if (ret)
+		return ret;
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
+	/* histogram capabilities */
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "HISTOGRAM_CAPS", blob->base.id);
+	if (!prop)
+		return -ENOMEM;
+	colorop->histogram_caps_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->histogram_caps_property,
+				   0);
+
+	/* histogram enable */
+	prop = drm_property_create(crtc->dev, DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_BLOB, "HISTOGRAM_ENABLE", 0);
+	if (!prop)
+		return -ENOMEM;
+	colorop->histogram_enable_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->histogram_enable_property,
+				   0);
+
+	/* histogram data/bins */
+	ret = drm_colorop_create_data_prop(crtc->dev, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_colorop_histogram_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 33cb6a2446dacf612d5f4dc35674e7518dfa9c58..4d905c13274c13d8d50e1c9e45a87feec72f82ae 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -185,6 +185,37 @@ struct drm_colorop_state {
 	 */
 	struct drm_property_blob *data;
 
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
+	/**
+	 * @histogram_updated:
+	 *
+	 * Flag to say that the histogram data is updated by the KMD.
+	 */
+	bool histogram_updated;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -348,6 +379,26 @@ struct drm_colorop {
 	 */
 	struct drm_property *lut3d_interpolation_property;
 
+	/**
+	 * @histogram_caps_property: Optional CRTC property for getting the
+	 * histogram hardware capability.
+	 */
+	struct drm_property *histogram_caps_property;
+
+	/**
+	 * @histogram_enable_property:
+	 *
+	 * property to enable hardware histogram
+	 */
+	struct drm_property *histogram_enable_property;
+
+	/**
+	 * @histogram_data_property
+	 *
+	 * Read only property for histogram data
+	 */
+	struct drm_property *histogram_data_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -408,6 +459,10 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags);
+int drm_crtc_colorop_histogram_init(struct drm_colorop *colorop,
+				    struct drm_crtc *crtc,
+				    struct drm_histogram_caps *caps,
+				    uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);

-- 
2.25.1

