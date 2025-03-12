Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C79A5D6F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA0E10E6E8;
	Wed, 12 Mar 2025 07:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CM2Op1Jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B597B10E6EF;
 Wed, 12 Mar 2025 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763563; x=1773299563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7y/P/qYlxhtAJY2+tFTZ3xTIhCff5/bP4CyhkTecTE=;
 b=CM2Op1JhkIYFbkwUn614TErhUtXy2xT8Dn/92EMOY8ZmKsJgmXU0YvsS
 5cnLE0udtRAQa06qpDckfi8H7Q10pcA2oxwevb09/wHXXsKe3LobCKZUq
 Ha8dGhZ7WVK7upMWHrCC6qMU12+Clulv7ygDidYGTkYYiXK4vlPDZi7Th
 7ZXpd42KME/KGDwTob/0d+5hYthatDbHzJ4E5MKMXdpp6vy596E+4YUMD
 hM7+jvApm1DbDK2pI6V0KYnJ5fp0S/n2LONMzn1/j26h8PvK0A+PwuKPC
 S38dN0Ok6MXQ6zEj6WwBRQKPjJ5aK+PAeC8QilcUMh1gZLNMe3CvZxR4R w==;
X-CSE-ConnectionGUID: op7bCeDtRzWX9Um+F2jUtg==
X-CSE-MsgGUID: 6BRaj1gdR9uzwz6leJfUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288741"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:43 -0700
X-CSE-ConnectionGUID: vpl4O5dsSiqj3OG1WLh/hA==
X-CSE-MsgGUID: XH5mahAySjuPr4aCSrq1Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120366186"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:40 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 07/23] drm: Define helper to initialize segmented 1D LUT
Date: Wed, 12 Mar 2025 12:54:09 +0530
Message-ID: <20250312072425.3099205-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

