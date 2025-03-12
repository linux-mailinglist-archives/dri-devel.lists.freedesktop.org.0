Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDFA5D6EB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1E010E6E7;
	Wed, 12 Mar 2025 07:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoZ3dzem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE410E6E2;
 Wed, 12 Mar 2025 07:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763546; x=1773299546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2vxI7aeDgxPx2FVwh5QS50h3r+Asg5zYKNmTO18OquU=;
 b=JoZ3dzemG6utxtA/Q0lQNqanDEMvWLjAxzcVP7r4fEk9LeuFsmE1CvTb
 WRp7S6cua3qh/3aa06p3O9rpLz6PXiulyC3AnpKuvjVO/KAgueeI7ECWy
 7jKk84KIwzPHCL8agRTledoGVIPDL8Pbi66phvAWc9GhtS6rk2e1ywuS+
 7wCmdxoRXD9WT/pcn9IhFy9QuuLj0uBLXH28WYSgQlA7vKBrTKV/ozxwR
 rQEAzBrFBFB1k8oNcnHbuAECqKtVcsbsK2FAlOZy4MH8znzaB42sVUZv6
 hEuhxpAnlBJ8sN1iTH6heeeZD7h8oPMPJ2Uzkuh4AihlbADZ6DzCHO0c9 A==;
X-CSE-ConnectionGUID: DbaEQGIrStyfVN56B0Ef0g==
X-CSE-MsgGUID: BZr4R0mcSZ+mVz1SZ3906Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288695"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:26 -0700
X-CSE-ConnectionGUID: 5zrTa+tYReGEmpbmEKUfsw==
X-CSE-MsgGUID: YyjJ9dBkSsqfDRTPMcI1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120365722"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:22 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 02/23] drm: Add support for 3x3 CTM
Date: Wed, 12 Mar 2025 12:54:04 +0530
Message-ID: <20250312072425.3099205-3-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add support for 3x3 Color Transformation Matrices in Color Pipeline.

v2: Updated the documentation for 3x3 CTM colorop (Dmitry)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 10 ++++++++++
 include/uapi/drm/drm_mode.h       |  8 ++++++++
 5 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index fabf09b88900..ab7d2ed9ee8c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_CTM_3X3:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5fbfd921a55b..3dd932647702 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -708,6 +708,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_CTM_3X3:
+		size = sizeof(struct drm_color_ctm);
+		break;
 	case DRM_COLOROP_3D_LUT:
 		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
 		       sizeof(struct drm_color_lut);
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5245d6a4da39..7aa572f74193 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -362,6 +362,35 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_ctm_3x3_init - Initialize a DRM_COLOROP_CTM_3X3
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @allow_bypass: true if BYPASS property should be created, false if bypass of
+ *                this colorop is not possible
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane, bool allow_bypass)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X3, allow_bypass);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_ctm_3x3_init);
+
 /**
  * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 953eea079708..1cd8ce81224e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -156,6 +156,14 @@ struct drm_colorop_state {
 	 * |G| = |4  5  6  7 | x | G |
 	 * |B|   |8  9  10 12|   | B |
 	 *
+	 * For 3x3 matrix (DRM_COLOROP_CTM_3X3), the blob is of type struct drm_color_ctm
+	 * which represents the Conversion matrix in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 * out   matrix    in
+	 * |R|   |0 1 2|   |R|
+	 * |G| = |3 4 5| x |G|
+	 * |B|   |6 7 8|   |B|
+	 *
 	 * For 3D LUTs (DRM_COLOROP_3D_LUT), the blob is a 3D array of
 	 * struct drm_color_lut with dimension length of "lut_size".
 	 * The LUT elements are traversed like so:
@@ -376,6 +384,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size,
 				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
 				  bool allow_bypass);
+int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 316c643e0dea..c47788dc84c8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -905,6 +905,14 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_CTM_3X4,
 
+	/**
+	 * @DRM_COLOROP_CTM_3X3:
+	 *
+	 * A 3x3 matrix. Its values are specified via the
+	 * &drm_color_ctm struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X3,
+
 	/**
 	 * @DRM_COLOROP_MULTIPLIER:
 	 *
-- 
2.42.0

