Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0CA4FFD3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBB110E77E;
	Wed,  5 Mar 2025 13:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiP6Rg+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E292A10E28B;
 Wed,  5 Mar 2025 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180460; x=1772716460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCBAHCB0mNMOkMRZ9sPqhw8bCyvXql6pVjqGTaPEsqM=;
 b=IiP6Rg+0KrTwJK7SetvvHQRaJojQENTtyhEqlFA5Mrn7aNrtwreDjZxA
 ocECQ/JdlvzlEwakgMPSpOFMfJItMMJ6sP1YT4pM70OsvSFJjKGTG4a/Z
 dyn2QE+0lWiTjizkV2O+YJbz869mgcANHOEZlVxSEC80OiZfSke2zEl2C
 ONX/2xcx3Nj04zccaPIA9WbAc0WDVQYbFmjHexBN6NmIMtDj7429r2Fxa
 bZGkmDr0oT6lf7IbEFKZSUoEdAhgUJb3Bp0KbFQ2l92hlMBR8rKnZAOAz
 obdfAAklNVd6TiX6+pdKKBVZCGQeI+bvFKOKZTOTz3VZGxxpveQMl7gm/ A==;
X-CSE-ConnectionGUID: eHh8GRniQnuoXdItqPua8A==
X-CSE-MsgGUID: YUNqudWyTEON+88FFoOALA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685401"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685401"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:20 -0800
X-CSE-ConnectionGUID: cot9VtlpQlSxWZ690wJhng==
X-CSE-MsgGUID: h8GPHri7SlOakDa2wL6/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701102"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:16 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 04/23] drm: Add Color lut range attributes
Date: Wed,  5 Mar 2025 18:55:49 +0530
Message-ID: <20250305132608.2379253-5-uma.shankar@intel.com>
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

This defines a new structure to define color lut ranges,
along with related macro definitions and enums. This will help
describe segmented lut ranges/PWL LUTs in the hardware.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/uapi/drm/drm_mode.h | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 2ac4285b2dff..9ba64d5b20c8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1112,6 +1112,70 @@ struct hdr_output_metadata {
 				  DRM_MODE_PAGE_FLIP_ASYNC | \
 				  DRM_MODE_PAGE_FLIP_TARGET)
 
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
+ *
+ * linearly interpolate between the points
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE BIT(0)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST
+ *
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST BIT(1)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING
+ *
+ * the curve must be non-decreasing
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING BIT(2)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE
+ *
+ *  the curve is reflected across origin for negative inputs
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE BIT(3)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL
+ *
+ * the same curve (red) is used for blue and green channels as well
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL BIT(4)
+
+/**
+ * struct drm_color_lut_range
+ *
+ * structure to advertise capability of a color hardware
+ * block that accepts LUT values.  It can represent LUTs with
+ * varied number of entries and distributions
+ * (Multi segmented, Logarithmic etc).
+ */
+
+struct drm_color_lut_range {
+	/* DRM_COLOROP_1D_LUT_MULTSEG_* */
+	__u32 flags;
+	/* number of points on the curve in the segment */
+	__u16 count;
+	/* input start/end values of the segment */
+	__s32 start, end;
+	/* normalization factor. Represents 1.0 in terms of smallest step size */
+	__u32 norm_factor;
+
+	/* precision of HW LUT*/
+	struct {
+		/* Integer precision */
+		__u16 intp;
+		/* Fractional precision */
+		__u16 fracp;
+	} precision;
+};
+
 /*
  * Request a page flip on the specified crtc.
  *
-- 
2.42.0

