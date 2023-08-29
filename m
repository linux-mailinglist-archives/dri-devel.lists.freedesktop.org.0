Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6978C8FF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8C610E3DB;
	Tue, 29 Aug 2023 15:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C6910E3C9;
 Tue, 29 Aug 2023 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324730; x=1724860730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ks/6Ptti4eurEareDUW5/GmLuij5qSCK1TgsQsJBBS8=;
 b=OAWLOmMqIDFyka4XRVrE8iL8a/5GyAI6u46J1MOxCH8mWZjUpO6pBh6I
 A37YoA9zPVXDRLbarW/Rkbq0vU8F9OuAeMMNS79WhSzXJGr2JIRJdfoZT
 IXLfwjDAKf8WvCPNHq71NWSr7FFNZQI5Fma6lzYaYV7kkP2G7LiBoQLAo
 2qpEgaOJYOH4W5u3q62EsHHEFM9tq7XtdGnH++MKLUpOPBECXKrPEo7R8
 YCTof6VmXGX864LAc3Gw6HDyQkVaqrj7RLXiZzw6whSQh83YPLx2FoP3F
 RGTGxJjiSAPPkOqkHB+HHjyidtJAmUHLDy9Gb6no16Z1SavcThbxjyw4E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769204"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769204"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554933"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554933"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:48 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 03/33] drm: Add plane get color pipeline property
Date: Tue, 29 Aug 2023 21:33:52 +0530
Message-ID: <20230829160422.1251087-4-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Each hardware plane can consist of multiple color hardware blocks.
These hardware blocks are defined by a color pipeline. In case,
hardware blocks can be re-arranged/muxed a distinct pipeline can
be defined to represent the same.

Introduce a new enum plane property "GET_COLOR_PIPELINE" to expose
the color pipelines that a particular plane supports. This enum
property has blob id's as values. With each blob id representing
a distinct color pipeline based on underlying HW capabilities and
their respective combinations. Add helpers to create and attach
the property to a plane.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 46 ++++++++++++++++++++++++++++++++
 include/drm/drm_plane.h          | 10 +++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index d021497841b8..026d057d1f1f 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -588,6 +588,52 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_plane_create_color_properties);
 
+/**
+ * drm_plane_create_get_color_pipeline_property - create property to expose color pipelines
+ * @dev: DRM device
+ * @plane: plane object
+ * @num_val: number of color pipelines supported
+ *
+ * create enum property to expose color pipelines to userspace. This enum
+ * property has blob id's as values. With each blob id representing
+ * a distinct color pipeline based on underlying HW capabilities and
+ * their respective combinations.
+ */
+int drm_plane_create_get_color_pipeline_property(struct drm_device *dev,
+						 struct drm_plane *plane,
+						 int num_val)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM |
+				   DRM_MODE_PROP_IMMUTABLE,
+				   "GET_COLOR_PIPELINE", num_val);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->get_color_pipeline_prop = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_get_color_pipeline_property);
+
+/**
+ * drm_plane_attach_get_color_pipeline_property - attach get color pipeline property to a plane
+ * @plane: plane object
+ *
+ * Attach "GET_COLOR_PIPELINE" property to a plane. The property will be visible to
+ * the userspace once we attach the property.
+ */
+void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane)
+{
+	if (!plane->get_color_pipeline_prop)
+		return;
+
+	drm_object_attach_property(&plane->base,
+				   plane->get_color_pipeline_prop, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_get_color_pipeline_property);
+
 /**
  * drm_color_lut_check - check validity of lookup table
  * @lut: property blob containing LUT to check
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 79d62856defb..256c97ead698 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -748,6 +748,12 @@ struct drm_plane {
 	 * scaling.
 	 */
 	struct drm_property *scaling_filter_property;
+
+	/**
+	 *  @get_color_pipeline_prop: Optional Plane property to get the color pipelines
+	 *  that the plane supports
+	 */
+	struct drm_property *get_color_pipeline_prop;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -945,5 +951,9 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_create_get_color_pipeline_property(struct drm_device *dev,
+						 struct drm_plane *plane,
+						 int num_val);
+void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane);
 
 #endif
-- 
2.38.1

