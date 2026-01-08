Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8BBD01E5E
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1F10E6D2;
	Thu,  8 Jan 2026 09:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUXy12zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1310E6D1;
 Thu,  8 Jan 2026 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865503; x=1799401503;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=c1395ejJbihpYFk0A/GtcNVJ+bLcmV1S/6CH42VrOkg=;
 b=dUXy12zrYoCUg6J2duWSvcUhyLei4nvbP6BaEO61wB2bj1A23ZzaTp2n
 JQjApXtM/MyVXv4NrNovPow0Z0djrsxH+71BPgpfwwT76bA0urkQ/eiEX
 EdPbjteuHzWo1DS6u1s5QWkab2D1D+ODz5OI+cK8DfMCqWoAyxPGRdeqD
 8EKIq5b1B6CpjT1npfksoXO/a/SLMLAJUpQ5yZIAeavZPhD+MKKXYecDl
 qIPJ/nc1hHt6WlH7JXKP6w3eofpbWlz8n/HCxZQrd08y1kDrhqnI1YZkG
 vXtgQrB3USGGN/CT19/sQyD2Ce7DPgv8zfMJjNzYKKjtIRf11JWnj2ajT g==;
X-CSE-ConnectionGUID: FEn7FomuQTOk7yXiKDf+5w==
X-CSE-MsgGUID: b+Obu16PQoaNh2fG2TB41w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876498"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:03 -0800
X-CSE-ConnectionGUID: lMhTT77nT9+/2pZr9nkFPA==
X-CSE-MsgGUID: JEjZi/b/Ri+rVUZV7TOe3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208231964"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:44:57 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:22 +0530
Subject: [PATCH [RFC] v3 1/7] drm/atomic/plane: Add plane property for
 async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-1-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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
index 7320db4b8489f10e24ed772094c77e2172951633..4a2da81abd713127d5157e84f2cae2f8b34a4dd6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -593,6 +593,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == plane->async_flip_property) {
+		state->async_flip = val;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -672,6 +674,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 			state->fb_damage_clips->base.id : 0;
 	} else if (property == plane->scaling_filter_property) {
 		*val = state->scaling_filter;
+	} else if (property == plane->async_flip_property) {
+		*val = state->async_flip;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val);
 	} else if (property == plane->hotspot_x_property) {
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index bed2562bf911b27ab81957f332b2a3cd5f847e43..ca51c87267662c11cee5f28276b2b941e1a87973 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1879,3 +1879,34 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
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
index 703ef4d1bbbcf084c43aa5e127d28691878061c4..ed8342c9a6258ee97ad930092a48ac3a34e62fc9 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -268,6 +268,12 @@ struct drm_plane_state {
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
@@ -815,6 +821,11 @@ struct drm_plane {
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
@@ -1021,6 +1032,7 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);
+int drm_plane_create_async_flip_property(struct drm_plane *plane);
 
 int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 					     const struct drm_prop_enum_list *pipelines,

-- 
2.25.1

