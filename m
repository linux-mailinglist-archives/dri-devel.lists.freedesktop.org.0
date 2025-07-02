Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08EAF0EFC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B108B10E658;
	Wed,  2 Jul 2025 09:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqfqmU6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFBB10E661;
 Wed,  2 Jul 2025 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447270; x=1782983270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6s+gixbNs7AzZ0M+pslVBTr2ZNBEr5ZnsOtBH10btS8=;
 b=TqfqmU6B4Fqg5STCJ3mDQE8uxOyvCj6YUyGIZvrN9jhychVI//jCv0gx
 Erglz69kSw9NY3uUz9NrOx3s2EoqGdf/FKv69lyMSPgYf7MoxgpjjHghw
 rpM9clMn7fVAu7+I5F/wmnMumBTp5x6AgWVOR4AwJMfmihNdkHYkyOXxM
 SNfhmwPfGFE+um+Ux28miaWS0kpemDI0TBRWumwP/9b0Y1MlmZRiRNbbW
 P+klJWlaayvR/y46B3Eg9zCLX/OlnfEH68Uy4KmUlt6DGIRuaRW7fckZh
 G9NjphiqTLJlKCzaUbAmB1tNpYmi0lvrD6LQT/SpmrKS0MYFzOZk0yMDz Q==;
X-CSE-ConnectionGUID: FMqRWy3aQfW8tSof9cFEjQ==
X-CSE-MsgGUID: LXc5knVRSlyhlxJoaNJR7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426983"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426983"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:50 -0700
X-CSE-ConnectionGUID: GvwXAbyYS6Gq65y/jAVIMQ==
X-CSE-MsgGUID: MNEuhnx4RcKUxnJpcM9htA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536385"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:46 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 04/24] drm: Add 1D LUT multi-segmented color op
Date: Wed,  2 Jul 2025 14:49:16 +0530
Message-ID: <20250702091936.3004854-5-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add support for color ops that can be programmed
by 1 dimensional multi segmented Look Up Tables.

v2: Fixed the documentation for Multi segmented lut (Dmitry)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 drivers/gpu/drm/drm_colorop.c     |  1 +
 include/uapi/drm/drm_mode.h       | 10 ++++++++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3ab32fe7fe1c..71160a71f5a3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_1D_LUT_MULTSEG:
+		drm_printf(p, "\thw cap blob id=%d\n", state->hw_caps ? state->hw_caps->base.id : 0);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 81a8da09fbfe..c59f6671b73d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -723,6 +723,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
 		       sizeof(struct drm_color_lut_32);
 		break;
+	case DRM_COLOROP_1D_LUT_MULTSEG:
+		elem_size = sizeof(struct drm_color_lut_32);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 52c08d717944..97e9acbb0f2c 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -65,6 +65,7 @@
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
+	{ DRM_COLOROP_1D_LUT_MULTSEG, "1D LUT Multi Segmented" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 	{ DRM_COLOROP_3D_LUT, "3D LUT"},
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index dd223077f4e9..18e36cbe10f7 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -915,6 +915,16 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_LUT,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.42.0

