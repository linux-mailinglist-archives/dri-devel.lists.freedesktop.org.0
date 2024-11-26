Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFE9D9838
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034910E87E;
	Tue, 26 Nov 2024 13:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1kPZxHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F0F10E406;
 Tue, 26 Nov 2024 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627191; x=1764163191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyW9d0XI4ewu6YVUVmB93Ujsw7mQpzheeGQaqfYD8c4=;
 b=J1kPZxHlVlTcBuifqvAvrM1DICTLARkZ+nIiLzYhCgDByNmOBksIwSkL
 VjEkR1JP+wwgXyHC5b4A7EeUaV5dyhyxbG6g8V3uv4Rp5xEBqaT+pIv6b
 uCKZXVLSCBWEufv5fNFNMqKB3lK4ZrSSpi0lp+0flcPhL2JRvZpTIdgWT
 LbnJZzki9P2g7JdZad6liFN6K5AMF8qS8TsIImRXlTvFZZzc0pVH1oLGZ
 by/I4z62OOzs7kmSQ2/1bfbkqtLTRCnhm+n7VfSuQWWNYdLLD3FZulpmO
 zygrwMPHKT9Nfz611aiRq5GSsP5/CE44E/g609esNttpOVfrD5PNi6B84 w==;
X-CSE-ConnectionGUID: pIU9Gvf8Tbq3fusk9MDGjg==
X-CSE-MsgGUID: D5Jnp1ASROeVbAFL+bAoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170085"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170085"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:19:41 -0800
X-CSE-ConnectionGUID: S+S/TxmISUmo8/GxWYRUGQ==
X-CSE-MsgGUID: GzkUMzNeTq+6K2tQLX5s9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874559"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:19:36 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 02/25] drm: Add support for 3x3 CTM
Date: Tue, 26 Nov 2024 18:57:07 +0530
Message-ID: <20241126132730.1192571-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  2 ++
 include/uapi/drm/drm_mode.h       |  8 ++++++++
 5 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3161e2ab4efc..8a75f4a0637a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -802,6 +802,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_CTM_3X3:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d6c71135f290..ba68358c0ffe 100644
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
 		index = state->lut_3d_mode_index;
 		if (index >= (state->lut_3d_modes->length / sizeof(struct drm_mode_3dlut_mode)))
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index fd1cd934df48..a427cfc5bbbc 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -315,6 +315,35 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_ctm_3x3 - Initialize a DRM_COLOROP_CTM_3X3
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
index bf5117f30c80..56b51fafebdf 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -377,6 +377,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size,
 				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
 				  bool allow_bypass);
+int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 290c2e32f692..a4a7ab689631 100644
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

