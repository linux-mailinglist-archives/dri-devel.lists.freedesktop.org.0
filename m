Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0F78C905
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923C810E3CC;
	Tue, 29 Aug 2023 15:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7E10E3D6;
 Tue, 29 Aug 2023 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324736; x=1724860736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pECIUcai/xvs+H32dYiF4qVFleTcHmcDoMYY+bCO1Ms=;
 b=OUyiUBue4U7upQ0taJnlfpRCRKQsN1xaqCXV1i3B2zFdKhyHDDsy4E8K
 k3LP0lb+/OFYrQLykOMNxLuhUR2OJq2xjTcWM8m1NG3E7Zz6t6SK6sOaC
 VvRR5ZERWCVMdjeVy+Mojq/S3FGO9hpCAjlyoLf00kZfSOxCNaMB//aSG
 BiSOAEmKyNmhQVnYo+oKYHYllW0IXfY6NqvJbP8d2VsQi4U5wjbCVzPaC
 kXvl6yEpJuelCGhFkS/hBVunbtBIPKdWmO0aSKmAc47vUAXpmAiGSY1MI
 KcwUvaVHjfDm0K10Wg8reKpZ8KsEeloQlpfdGMmwcnCDlRhaXDkySQsO5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769232"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769232"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554983"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554983"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:54 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 06/33] drm: Add set colorpipeline property
Date: Tue, 29 Aug 2023 21:33:55 +0530
Message-ID: <20230829160422.1251087-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new plane blob property "SET_COLOR_PIPELINE" using
which the user can select a color pipeline and send data
for corresponding hardware blocks.

Once the user space decides on a color pipeline, it can
set the pipeline and corresponding data for the hardware
blocks within the pipeline.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 12 +++++++++
 drivers/gpu/drm/drm_color_mgmt.c  | 42 +++++++++++++++++++++++++++++++
 include/drm/drm_plane.h           | 22 ++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c08ae..a2d3393d21a2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -590,6 +590,15 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == plane->set_color_pipeline_prop) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->set_color_pipeline_data,
+					val,
+					-1,
+					sizeof(struct drm_color_pipeline),
+					&replaced);
+		state->color_mgmt_changed |= replaced;
+		return ret;
 	} else if (plane->funcs->atomic_set_property) {
 		return plane->funcs->atomic_set_property(plane, state,
 				property, val);
@@ -651,6 +660,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 			state->fb_damage_clips->base.id : 0;
 	} else if (property == plane->scaling_filter_property) {
 		*val = state->scaling_filter;
+	} else if (property == plane->set_color_pipeline_prop) {
+		*val = (state->set_color_pipeline_data) ?
+			state->set_color_pipeline_data->base.id : 0;
 	} else if (plane->funcs->atomic_get_property) {
 		return plane->funcs->atomic_get_property(plane, state, property, val);
 	} else {
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 43d0187faa98..3ef58da94556 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -634,6 +634,48 @@ void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_get_color_pipeline_property);
 
+/**
+ * drm_plane_create_set_color_pipeline_property - create property to set color pipeline
+ * @dev: DRM device
+ * @plane: plane object
+ *
+ * create blob property using which the user space can set up a plane color pipeline.
+ * Userspace can send data for one or multiple hardware blocks in the pipeline.
+ */
+int drm_plane_create_set_color_pipeline_property(struct drm_device *dev,
+						 struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+				   "SET_COLOR_PIPELINE", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->set_color_pipeline_prop = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_set_color_pipeline_property);
+
+/**
+ * drm_plane_attach_set_color_pipeline_property - attach set color pipeline property to a plane
+ * @plane: plane object
+ *
+ * Attach "SET_COLOR_PIPELINE" property to a plane. The property will be visible to
+ * the userspace once we attach the property. The default value is set to 0 indicating
+ * no colorpipeline which essentially disables all the color HW blocks in the pipeline.
+ */
+void drm_plane_attach_set_color_pipeline_property(struct drm_plane *plane)
+{
+	if (!plane->set_color_pipeline_prop)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->set_color_pipeline_prop, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_set_color_pipeline_property);
+
 /**
  * drm_plane_add_color_pipeline - helper to add a color pipeline
  * @plane: plane object
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index ffd7887c2acf..fcd589cb38f2 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -237,6 +237,20 @@ struct drm_plane_state {
 
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
+
+	/**
+	 * @set_color_pipeline_data:
+	 *
+	 * Stores information about the current selected color pipeline
+	 */
+	struct drm_property_blob *set_color_pipeline_data;
+
+	/**
+	 * @color_mgmt_changed: Plane color pipeline state has changed
+	 * Used by the atomic helpers and
+	 * drivers to steer the atomic commit control flow.
+	 */
+	u8 color_mgmt_changed : 1;
 };
 
 static inline struct drm_rect
@@ -754,6 +768,11 @@ struct drm_plane {
 	 *  that the plane supports
 	 */
 	struct drm_property *get_color_pipeline_prop;
+
+	/**
+	 *  @set_color_pipeline_prop: Optional Plane property to set the color pipeline
+	 */
+	struct drm_property *set_color_pipeline_prop;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -955,6 +974,9 @@ int drm_plane_create_get_color_pipeline_property(struct drm_device *dev,
 						 struct drm_plane *plane,
 						 int num_val);
 void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane);
+int drm_plane_create_set_color_pipeline_property(struct drm_device *dev,
+						 struct drm_plane *plane);
+void drm_plane_attach_set_color_pipeline_property(struct drm_plane *plane);
 int drm_plane_add_color_pipeline(struct drm_plane *plane, char *name,
 				 struct drm_color_op *color_pipeline,
 				 size_t len);
-- 
2.38.1

