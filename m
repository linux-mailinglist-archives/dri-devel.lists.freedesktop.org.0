Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB39A4FFDA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114A10E78F;
	Wed,  5 Mar 2025 13:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erJccKBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056B910E78A;
 Wed,  5 Mar 2025 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180473; x=1772716473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7y/P/qYlxhtAJY2+tFTZ3xTIhCff5/bP4CyhkTecTE=;
 b=erJccKBy8gWiNqkgnUizJ7OMmCl4Nhz30t9LnIPllEA2xytJ/CEy/Qd4
 4AhlLGyorMXm9zqPXrpBaafWBNDzfQlkvBgJThlobAs22PI/GUDxFS/In
 DzCNXzSoLeuzL9OI999xAL2FCIfdqRAQu3bRcpNMSZFDz84Wwx7HQTtTF
 10Zu3cftnG9GB3j96qYuqDeT3Cve+S8fTuP5IBLXB4xWQPQRqI3GJoy12
 33nXT+rtN6ChRRWNA7yeONKx+I75bI93pC1WpJJVZVKWM9Y41goBgWJLc
 EI43urhCS6hmCocDfzTUKMOyExzJSVpHJetgrIWjlJ+x9dN2yf5WS+g1+ g==;
X-CSE-ConnectionGUID: 8t5sZV5/QGKyXf109FKaOg==
X-CSE-MsgGUID: 7BQvlp9MQOuRQx2qC6m1Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685446"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:33 -0800
X-CSE-ConnectionGUID: v0eXULCIRj6GffelCtHmkw==
X-CSE-MsgGUID: /ug0TERpQIm4Kc7pLrt5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701117"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:29 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 07/23] drm: Define helper to initialize segmented 1D LUT
Date: Wed,  5 Mar 2025 18:55:52 +0530
Message-ID: <20250305132608.2379253-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 68 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  4 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7aa572f74193..e57da344032c 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -89,6 +89,48 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
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
+static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
+				    struct drm_plane *plane,
+				    const struct drm_color_lut_range *ranges,
+				    size_t length)
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
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 			    struct drm_plane *plane, enum drm_colorop_type type,
@@ -342,6 +384,32 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 }
 EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
+int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+					  struct drm_plane *plane,
+					  const struct drm_color_lut_range *ranges,
+					  size_t length, bool allow_bypass)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT_MULTSEG, allow_bypass);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_lutcaps_init(colorop, plane, ranges, length);
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
+EXPORT_SYMBOL(drm_colorop_curve_1d_lut_multseg_init);
+
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 731bd1484c34..4f5a6b567c2c 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -403,6 +403,10 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  bool allow_bypass);
 int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+					  struct drm_plane *plane,
+					  const struct drm_color_lut_range *ranges,
+					  size_t length, bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-- 
2.42.0

