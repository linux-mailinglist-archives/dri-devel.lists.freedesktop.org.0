Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5639712F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4C6EA04;
	Tue,  1 Jun 2021 10:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899E56EA01;
 Tue,  1 Jun 2021 10:16:33 +0000 (UTC)
IronPort-SDR: aVoIKHINOk+fsgAa8gV3nLivGAe+/AnP9p7PwyI+Va7++OdkA0QCFaZxYUCFUaa+SqQM1Y9FYa
 ZgPYnoKR2BXA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550041"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550041"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:33 -0700
IronPort-SDR: 5orLAjv/frdVdZTfB/GgUZN94dVcWhCmhYzT52l/gAip4lEpXnP0WLePtsAXsOLEv/hGcQode5
 TovJbICK6U/A==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431376"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:31 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/21] drm: Add Plane Gamma Mode property
Date: Tue,  1 Jun 2021 16:22:13 +0530
Message-Id: <20210601105218.29185-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Plane Gamma Mode as a blob property. This is an enum property
with values as blob_id's and exposes the various gamma modes
supported and the lut ranges. Getting the blob id in userspace,
user can get the mode supported and also the range of gamma mode
supported with number of lut coefficients. It can then set one of
the modes using this enum property.

Lut values will be sent through a separate GAMMA_LUT blob property.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_color_mgmt.c  | 26 ++++++++++++++++++++++++++
 include/drm/drm_plane.h           | 14 ++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6af2afe362ff..6e3958491d10 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -612,6 +612,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == plane->gamma_mode_property) {
+		state->gamma_mode = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -685,6 +687,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 			state->degamma_lut->base.id : 0;
 	} else if (property == plane->ctm_property) {
 		*val = (state->ctm) ? state->ctm->base.id : 0;
+	} else if (property == plane->gamma_mode_property) {
+		*val = state->gamma_mode;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 5c3138497b9c..02367e691cf3 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -606,6 +606,13 @@ EXPORT_SYMBOL(drm_plane_create_color_properties);
  *	Blob property which allows a userspace to provide CTM coefficients
  *	to do color space conversion or any other enhancement by doing a
  *	matrix multiplication using the h/w CTM processing engine
+ *
+ * gamma_mode_property:
+ *     Blob property which advertizes the possible gamma modes and
+ *     lut ranges supported by the platform. This  allows userspace
+ *     to query and get the plane gamma color caps and choose the
+ *     appropriate gamma mode and create lut values accordingly
+ *
  */
 int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
@@ -634,6 +641,13 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 
 	plane->ctm_property = prop;
 
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
+				   "PLANE_GAMMA_MODE", num_values);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->gamma_mode_property = prop;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_mgmt_properties);
@@ -664,6 +678,16 @@ void drm_plane_attach_ctm_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_ctm_property);
 
+void drm_plane_attach_gamma_properties(struct drm_plane *plane)
+{
+	if (!plane->gamma_mode_property)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->gamma_mode_property, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_gamma_properties);
+
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
@@ -676,6 +700,8 @@ int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 
 	if (type == LUT_TYPE_DEGAMMA)
 		prop = plane->degamma_mode_property;
+	else
+		prop = plane->gamma_mode_property;
 
 	if (!prop)
 		return -EINVAL;
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 4557f59cf3cf..a7b7c8599702 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -260,6 +260,13 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *ctm;
 
+	/**
+	 * @gamma_mode: This is a blob_id and exposes the platform capabilities
+	 * wrt to various gamma modes and the respective lut ranges. This also
+	 * helps user select a gamma mode amongst the supported ones.
+	 */
+	u32 gamma_mode;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -791,6 +798,12 @@ struct drm_plane {
 	 * degamma LUT.
 	 */
 	struct drm_property *ctm_property;
+
+	/**
+	 * @gamma_mode_property: Optional Plane property to set the LUT
+	 * used to convert the framebuffer's colors to non-linear gamma.
+	 */
+	struct drm_property *gamma_mode_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -887,6 +900,7 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 					   int num_values);
 void drm_plane_attach_degamma_properties(struct drm_plane *plane);
 void drm_plane_attach_ctm_property(struct drm_plane *plane);
+void drm_plane_attach_gamma_properties(struct drm_plane *plane);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.26.2

