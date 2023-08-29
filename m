Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5EC78C8FC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B2D10E3D7;
	Tue, 29 Aug 2023 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6AC10E3D6;
 Tue, 29 Aug 2023 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324732; x=1724860732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gMnns/I+M8dtpSyv33inv7RJyJ4Y6bB3ZfRrxD5OPS4=;
 b=PtHqgsD/xTcPr1EQyfht3XR+XWm4OkwvyEoAG3q+oQUpZEqSjgtPn8qZ
 kJxffWqA/hxR1lv7L1wbvuSxINtubg8dbUa6ZIGjiY+5vNY4OiF9OLBwC
 NoroUsLhKQYtuC/WtVVu8J76wjkG2f6JyZMSmQbuzh+MVFDyIUNV3xT7w
 yqFfBysKeroTTAKHDU0mN/nZpvYQdNJYHzxF+IJLzjJ4vP4pLHQUS7wJ1
 rNHKgB4jIwu+AZ6N5yQFJdDaxlT2FmraMjN+9tnzyHDY16Eyct3yJtloa
 EzsBcNlj2vQG/CbA/Zwm36MNqqBxyOv63zOHLHUzD0Qqgg9u0WSt4/EJv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769215"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769215"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554953"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554953"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:50 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 04/33] drm: Add helper to add color pipeline
Date: Tue, 29 Aug 2023 21:33:53 +0530
Message-ID: <20230829160422.1251087-5-uma.shankar@intel.com>
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

Create a helper function to add a color pipeline for a plane.
Color pipeline is an array of struct drm_color_op which represent
a possible logical combination of color operations. Color
operations can be re-arranged, substracted or added to create
distinct color pipelines to accurately describe the Hardware blocks
present in the display engine.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 42 ++++++++++++++++++++++++++++++++
 include/drm/drm_plane.h          |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 026d057d1f1f..43d0187faa98 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -634,6 +634,48 @@ void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_get_color_pipeline_property);
 
+/**
+ * drm_plane_add_color_pipeline - helper to add a color pipeline
+ * @plane: plane object
+ * @name: name of the color pipeline
+ * @color_pipeline: an array of 'struct drm_color_op' to represent a color pipeline
+ * @len: size of the color pipeline
+ *
+ * This helper can be used to add a distinct color pipeline to a plane. A driver
+ * can provide a meaningful name to the pipeline as it desires.
+ */
+int drm_plane_add_color_pipeline(struct drm_plane *plane, char *name,
+				 struct drm_color_op *color_pipeline,
+				 size_t len)
+{
+	int ret;
+	struct drm_property *prop;
+	struct drm_property_blob *blob;
+	u32 id = 0;
+
+	prop = plane->get_color_pipeline_prop;
+
+	if (color_pipeline && !len)
+		return -EINVAL;
+
+	if (color_pipeline) {
+		blob = drm_property_create_blob(plane->dev, len, color_pipeline);
+		if (IS_ERR(blob))
+			return PTR_ERR(blob);
+
+		id = blob->base.id;
+	};
+
+	ret = drm_property_add_enum(prop, id, name);
+	if (ret) {
+		if (blob)
+			drm_property_blob_put(blob);
+		return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_add_color_pipeline);
+
 /**
  * drm_color_lut_check - check validity of lookup table
  * @lut: property blob containing LUT to check
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 256c97ead698..ffd7887c2acf 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -955,5 +955,8 @@ int drm_plane_create_get_color_pipeline_property(struct drm_device *dev,
 						 struct drm_plane *plane,
 						 int num_val);
 void drm_plane_attach_get_color_pipeline_property(struct drm_plane *plane);
+int drm_plane_add_color_pipeline(struct drm_plane *plane, char *name,
+				 struct drm_color_op *color_pipeline,
+				 size_t len);
 
 #endif
-- 
2.38.1

