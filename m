Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D850EBCC342
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0410A10EB7F;
	Fri, 10 Oct 2025 08:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGVTdqc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5210EB7C;
 Fri, 10 Oct 2025 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760085945; x=1791621945;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=DCN9LBOJc82ZkbzthuTzYWxioqMfP7/aWEfQvM46CFc=;
 b=KGVTdqc3j62OEw8SmZ+rQ/E1hILTFIKvfF38626Hca2OK3lumjmO2USk
 p+pel8YCGmt9tzPOaIzBrP34BVt3d8cUmRC7deRgysb1q/0K0SwjiY4CR
 rgVcJTrWCwi0SZT/A9FpLdyxMNlkr954qMi4ZnJ4bHFoYegl/U2EHYQl4
 ivxanAHs2yQOkayYuHL8X3VdZMSlt7YH4zy8P+mjcHMfun1srkgAji9pn
 jPpNiOqvttaDtOJ5g9ryvHc9ViGKGQJk7Ksj+v5MF2prpRnoVBl3FwJub
 dqmruGQdi8S3PYjK3X8K/q0QD1eNbZ8qBmzrbDfn4IIB/rkHrsd9pQ5v6 Q==;
X-CSE-ConnectionGUID: WVVV08NpShuZPz5X3VenHg==
X-CSE-MsgGUID: 4jABjMynR0iYdSyeVd5VUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62460666"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62460666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:45:42 -0700
X-CSE-ConnectionGUID: GIu3DfpAQX2dcDnemV/h4w==
X-CSE-MsgGUID: EmfwbwlpSY2jsr12u0AqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185181453"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 01:45:37 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Oct 2025 14:15:58 +0530
Subject: [PATCH RFC v2 1/2] drm/atomic/plane: Add plane property for async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-async-v2-1-50c6b7a9b654@intel.com>
References: <20251010-async-v2-0-50c6b7a9b654@intel.com>
In-Reply-To: <20251010-async-v2-0-50c6b7a9b654@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 jani.nikula@intel.com, ville.syrjala@intel.com, uma.shankar@intel.com, 
 xaver.hugl@kde.org, andrealmeid@igalia.com, naveen1.kumar@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
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

Add a new property for enabling/disabling async flip on a plane for
atomic path. Certain vendors have support for async flip on more than
one plane and with the present implementation using the flag, async flip
can be enabled on only one plane.
Adding a plane property for async flip enables driver to allow async
flip on multiple planes in atomic path.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_plane.c       | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_plane.h           | 12 ++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e25878c953b9b41539c8566d55c6d9..7773e0057302fccb57df8067f417b23a9cb9fcde 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -550,6 +550,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == plane->async_flip_property) {
+		state->async_flip = val;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -627,6 +629,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 			state->fb_damage_clips->base.id : 0;
 	} else if (property == plane->scaling_filter_property) {
 		*val = state->scaling_filter;
+	} else if (property == plane->async_flip_property) {
+		*val = state->async_flip;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val);
 	} else if (property == plane->hotspot_x_property) {
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 38f82391bfda578d532499585066dd85ff573910..da486defed87eeb01dd9ad5f3d791900286f9f34 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1820,3 +1820,34 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_add_size_hints_property);
+
+/**
+ * drm_plane_create_async_flip_property - create asynchronous flip property
+ *
+ * @plane: drm plane
+ *
+ * Create a property to enable/disable asynchronous flip on the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_create_async_flip_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_bool(plane->dev, DRM_MODE_PROP_IMMUTABLE,
+					"async_flip");
+
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, false);
+
+	plane->async_flip_property = prop;
+
+	if (plane->state)
+		plane->state->async_flip = false;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_async_flip_property);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 01479dd94e76a8389a0c9e9d6744400aa2291064..b649c57437a8303be094e652ed5be7a735f6f5e0 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -260,6 +260,12 @@ struct drm_plane_state {
 	 * flow.
 	 */
 	bool color_mgmt_changed : 1;
+
+	/**
+	 * @async_flip: Indicate that the present plane is asynchronous flip
+	 * mode.
+	 */
+	bool async_flip;
 };
 
 static inline struct drm_rect
@@ -799,6 +805,11 @@ struct drm_plane {
 	 */
 	struct drm_property *hotspot_y_property;
 
+	/**
+	 * @async_flip_property: property to set asynchronous flip on the plane
+	 */
+	struct drm_property *async_flip_property;
+
 	/**
 	 * @kmsg_panic: Used to register a panic notifier for this plane
 	 */
@@ -1005,5 +1016,6 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);
+int drm_plane_create_async_flip_property(struct drm_plane *plane);
 
 #endif

-- 
2.25.1

