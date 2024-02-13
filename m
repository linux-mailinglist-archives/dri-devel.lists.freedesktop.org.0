Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9D852928
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918FF10E8D0;
	Tue, 13 Feb 2024 06:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EvtOehBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5806110E8CE;
 Tue, 13 Feb 2024 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806487; x=1739342487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oB1Os/PM8Qqd1aXgMEWLlGkqyJHRiZh3qNxqyr3VYnI=;
 b=EvtOehBjYEstOizbAwYGU0WyRF5K6JUFaKeSZfvgvt4vTCjxltkzfngt
 uXcSsPgpLig8Xv3zv7dsAQoHyK/COCYdKO2oDpmAxSS82v77+g0xoMZVX
 cjQRuwKVO9jkBroofpa7tX1R2l9+MG3vXlY69RX9J5mmKzwtJ8aeZBAfH
 wijRedkfPBMM44znzoGW6zbYU+ahr6WhSKmyaUp4Uq1dD1NtGp0xfnHzu
 fJXpKD2XWKz/VqSQVXM1gp86igw9ajQsjMhQcvHUKPKE8o2BBo4sXXM1v
 nj6S7Crhq90/ha+7mhWZ7S1qnkJZZzrlF3zTva/78+ZxG7+28vwH4kmql g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947842"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450290"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:20 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 08/28] drm: Add Color lut range attributes
Date: Tue, 13 Feb 2024 12:18:15 +0530
Message-ID: <20240213064835.139464-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
 include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index af67f32e0087..376498715d0e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1014,6 +1014,64 @@ struct hdr_output_metadata {
 				  DRM_MODE_PAGE_FLIP_ASYNC | \
 				  DRM_MODE_PAGE_FLIP_TARGET)
 
+/**
+ * DRM_MODE_LUT_INTERPOLATE
+ *
+ * linearly interpolate between the points
+ */
+#define DRM_MODE_LUT_INTERPOLATE BIT(0)
+
+/**
+ * DRM_MODE_LUT_REUSE_LAST
+ *
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_MODE_LUT_REUSE_LAST BIT(1)
+
+/**
+ * DRM_MODE_LUT_NON_DECREASING
+ *
+ * the curve must be non-decreasing
+ */
+#define DRM_MODE_LUT_NON_DECREASING BIT(2)
+
+/**
+ * DRM_MODE_LUT_REFLECT_NEGATIVE
+ *
+ *  the curve is reflected across origin for negative inputs
+ */
+#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(3)
+
+/**
+ * DRM_MODE_LUT_SINGLE_CHANNEL
+ *
+ * the same curve (red) is used for blue and green channels as well
+ */
+#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(4)
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
+	/* DRM_MODE_LUT_* */
+	__u32 flags;
+	/* number of points on the curve */
+	__u16 count;
+	/* input/output bits per component */
+	__u8 input_bpc, output_bpc;
+	/* input start/end values */
+	__s32 start, end;
+	/* output min/max values */
+	__s32 min, max;
+};
+
 /*
  * Request a page flip on the specified crtc.
  *
-- 
2.42.0

