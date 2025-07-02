Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4948AF0EF7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646A210E114;
	Wed,  2 Jul 2025 09:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPJKyfgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC15710E642;
 Wed,  2 Jul 2025 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447262; x=1782983262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zqoeQawrlgYmODrJNtML6H/BHcoShnYiZNMKCbGoElE=;
 b=JPJKyfgcYqfqs0cL5unrJ0yAZbZKBBTY42y3agLJiHsvFI0Vrm0tjrPY
 V9UkokF6Z27iL1Wsvmaz7VKOl+jOyWFc/YXMHOzMwlASZF3T2TrPkda3p
 1KC5x/RKcCva3XLXKSGdWEKSK/85YKl4CjW9F7NVNGvKei8gIdSRloUY+
 NIdeSYiOQ+LiunnBC5KJIMQZf+uUMGegTNOKyIaNoTrg9+De1Mnz+pqyA
 tZnT9LPx0AJbnu58lY9VngcIfMAbOj78DQr7XAb8BOIyHIwb3URV5i6KF
 /R0Z9fA6e0gxsswqV/+Y56E1ikeaF2a52rx8E/okCNJAZOA5BmxqllqEt A==;
X-CSE-ConnectionGUID: nfUREGV3Qc2YLdeuqhDVEg==
X-CSE-MsgGUID: ivgjctGeT968u2DA9tdojg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426958"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:42 -0700
X-CSE-ConnectionGUID: 5XiL/upeTceSAD+C8Ab9iw==
X-CSE-MsgGUID: FHt1PhDyTHSeLJoBneq2Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536343"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:39 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 02/24] drm: Add Color lut range attributes
Date: Wed,  2 Jul 2025 14:49:14 +0530
Message-ID: <20250702091936.3004854-3-uma.shankar@intel.com>
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

This defines a new structure to define color lut ranges,
along with related macro definitions and enums. This will help
describe segmented lut ranges/PWL LUTs in the hardware.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/uapi/drm/drm_mode.h | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ce14e7cf9651..dd223077f4e9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1127,6 +1127,70 @@ struct hdr_output_metadata {
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

