Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F6AF0EFF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B891810E5F6;
	Wed,  2 Jul 2025 09:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5w6a77r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF8810E5F6;
 Wed,  2 Jul 2025 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447274; x=1782983274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0rxAP9mm1+h9vUFKtr0w7gfajttCmj7yzUM5qFiXQE=;
 b=T5w6a77rUQgBJI2Ql9qWftyHQT3tRjqFThJicLLbr1+U6fvQA36mPSZz
 rv9Ol+KVjnYa+3R3LW2jUnpzB7Zq5DZ+J21tZIHL7mFnjlt0TvFnfrdR2
 KIYkEW3+GRgDtBWfewqvVGeHIG4pXD7AZgNUgoSyFiYsxMu7HFrTMc9iP
 10AMGNdXTcFnfs+ZVyuZKUMKhzTYKcq6Hdf038iOsuGFUGIK1wWAuBtVv
 JpsdjFeBMTJezcroC1/OOAurRkFuOWb+GBxEsbcv+TCJ6N6DTLaOFnml/
 Dy50kafbY/seOpiWCzsnYVOTwo+ZJ9FYcIGDqcthsaG360sOIfXieI3FI g==;
X-CSE-ConnectionGUID: XpAqpKTQSiK/QXuezW1QYg==
X-CSE-MsgGUID: XuCoKfhQTyuX8BIwAuudkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426993"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:54 -0700
X-CSE-ConnectionGUID: c3qwQf/dQTeI5hcWC0eGvw==
X-CSE-MsgGUID: 7qyOhDGdRaioVXbSRfvolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536429"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:50 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 05/24] drm: Define helper to initialize segmented 1D LUT
Date: Wed,  2 Jul 2025 14:49:17 +0530
Message-ID: <20250702091936.3004854-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

This adds helper functions to create 1D multi-segmented Lut
color block capabilities. It exposes the hardware block as segments
which are converted to blob and passed in the property.
This also adds helper to initialize 1D segmented LUT.

v2: Squashed the 1d lut helpers (Dmitry)
v3: Change name space to drm_plane_*

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 68 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  4 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 97e9acbb0f2c..6e17f51c24be 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -90,6 +90,48 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 };
 
 /* Init Helpers */
+static int drm_create_colorop_capability_prop(struct drm_device *dev,
+					      struct drm_colorop *colorop,
+					      struct drm_property_blob *blob)
+{
+	struct drm_property *prop = NULL;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+				   DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE,
+				   "HW_CAPS", 1);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->hw_caps_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->hw_caps_property,
+				   blob->base.id);
+
+	return 0;
+}
+
+static int drm_plane_colorop_lutcaps_init(struct drm_colorop *colorop,
+					  struct drm_plane *plane,
+					  const struct drm_color_lut_range *ranges,
+					  size_t length)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property_blob *blob;
+
+	/* Create Color Caps property for multi-segmented 1D LUT */
+	if (colorop->type != DRM_COLOROP_1D_LUT_MULTSEG)
+		return -EINVAL;
+
+	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
+		return -EINVAL;
+
+	blob = drm_property_create_blob(plane->dev, length, ranges);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	return drm_create_colorop_capability_prop(dev, colorop, blob);
+}
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
@@ -337,6 +379,32 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 }
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
+int drm_plane_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+						struct drm_plane *plane,
+						const struct drm_color_lut_range *ranges,
+						size_t length, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT_MULTSEG, flags);
+	if (ret)
+		return ret;
+
+	ret = drm_plane_colorop_lutcaps_init(colorop, plane, ranges, length);
+	if (ret)
+		return ret;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_multseg_init);
+
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane, uint32_t flags)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 46099e81bbfa..44b4dfd69db7 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -393,6 +393,10 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size,
 					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
 					uint32_t flags);
+int drm_plane_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+						struct drm_plane *plane,
+						const struct drm_color_lut_range *ranges,
+						size_t length, uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-- 
2.42.0

