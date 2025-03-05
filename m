Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A81A4FFCE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0F510E774;
	Wed,  5 Mar 2025 13:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnErVkC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F3210E774;
 Wed,  5 Mar 2025 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180452; x=1772716452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rBTtm5oYRc6ht6IB0U16i1BGPgDb5CAiTvee4LkRwDw=;
 b=gnErVkC1gNPULXgFZBV+vrONfjFJwUQreFTb7na7XwbufoeBgfEqs6pL
 D90NCDHBOvfIGc2EP1VO0DWnGv0yfSodPHFjj9YVuYiZa3mJpznOMKKhp
 NsgZ7fubDUkNE1R3sNwUtVcQtWLfB+C4H+2mS+2jkJDEfHfP7HuEb8804
 FUyKoEP2Fy1MQoYbRicMshKg3beUsXDo7MwE+6ZEeI7XCrf/XjEx2YQqc
 3toP25FGdd+jlDfiWMw0snrgLlQ6F5mgOR0wZmyHt5Ve/j5ZYgJB0qBEJ
 ckPQnY59nv5C04dhEuM3uDCFOT1wxkM/Uv+Z2/RH0sm3PtZdmEcd8R3g+ A==;
X-CSE-ConnectionGUID: nH+mPjvuSzCNpbJYtczftw==
X-CSE-MsgGUID: 6DU3emE1Tpm6apgaSIuThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685380"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:11 -0800
X-CSE-ConnectionGUID: UKexvSkjTsSZrtWqvwB1MQ==
X-CSE-MsgGUID: LVaiaR9hRMuORJ2lZSwn6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701096"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:07 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 02/23] drm: Add support for 3x3 CTM
Date: Wed,  5 Mar 2025 18:55:47 +0530
Message-ID: <20250305132608.2379253-3-uma.shankar@intel.com>
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
index 195c7bfbae5f..8258558ff334 100644
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

