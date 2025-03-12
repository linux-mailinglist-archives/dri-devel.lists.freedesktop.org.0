Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB6A5D6ED
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C7410E6EA;
	Wed, 12 Mar 2025 07:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRz8Xqib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1C210E6E8;
 Wed, 12 Mar 2025 07:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763550; x=1773299550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PgYrUvt4BVq0TsBspivs2rBPJRGxmfwaqa3DBz0tsAI=;
 b=jRz8XqibKj0VA3x3B/rQMNwHW6kR9Ji2sO9dP3zrJD0EiPoYwihY4qX3
 voEmo+VoJAvnU5WKs2ejBBQJjQKy/tF4Uyg0O+m4WsOxk3eLITWLDLnV2
 c2SovB7xDSQid3OVuC/o69OZZe0ZcK9mqn3LPEOLIyEtc7A0NixL8PJdQ
 8x8l0m6yrbDIatcp2aXv0quEBKXy4L3aSNVSi/401rU8MtFCKVTA7EjgT
 L6qoepJVQ9kFF40TEfdLhsq3SMZuuv2fqSIK7XLstvzXTRXOnn+BbixLp
 CLAmyw/eo5AMac/yQOWsjVMO1XfgAgjh7RcSWUubugzKzW03ovEh5KGk6 g==;
X-CSE-ConnectionGUID: GXCWd/X+TMiOn749D3Rebg==
X-CSE-MsgGUID: IysLlCyeQj2c34dpn+QLQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288701"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:29 -0700
X-CSE-ConnectionGUID: QdGabdLHQQa8qS5yUEp2kg==
X-CSE-MsgGUID: Usip2LmnQU6qpNWT4kBWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120365880"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:26 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 03/23] drm: Add Enhanced LUT precision structure
Date: Wed, 12 Mar 2025 12:54:05 +0530
Message-ID: <20250312072425.3099205-4-uma.shankar@intel.com>
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

Existing LUT precision structure is having only 16 bit
precision. This is not enough for upcoming enhanced hardwares
and advance usecases like HDR processing. Hence added a new
structure with 32 bit precision values.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 43 ++++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     | 13 ++++++++++
 include/uapi/drm/drm_mode.h      | 18 +++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..83dc850d3b54 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -630,3 +630,46 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 	return 0;
 }
 EXPORT_SYMBOL(drm_color_lut_check);
+
+/**
+ * drm_color_lut_32_check - check validity of extended lookup table
+ * @lut: property blob containing extended LUT to check
+ * @tests: bitmask of tests to run
+ *
+ * Helper to check whether a userspace-provided extended lookup table is valid and
+ * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
+ * the tests in &drm_color_lut_tests should be performed.
+ *
+ * Returns 0 on success, -EINVAL on failure.
+ */
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests)
+{
+	const struct drm_color_lut_32 *entry;
+	int i;
+
+	if (!lut || !tests)
+		return 0;
+
+	entry = lut->data;
+	for (i = 0; i < drm_color_lut_32_size(lut); i++) {
+		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
+			if (entry[i].red != entry[i].blue ||
+			    entry[i].red != entry[i].green) {
+				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
+				return -EINVAL;
+			}
+		}
+
+		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
+			if (entry[i].red < entry[i - 1].red ||
+			    entry[i].green < entry[i - 1].green ||
+			    entry[i].blue < entry[i - 1].blue) {
+				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_color_lut_32_check);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index ed81741036d7..882253a82bf1 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_lut_32_size - calculate the number of entries in the extended LUT
+ * @blob: blob containing the LUT
+ *
+ * Returns:
+ * The number of entries in the color LUT stored in @blob.
+ */
+static inline int drm_color_lut_32_size(const struct drm_property_blob *blob)
+{
+	return blob->length / sizeof(struct drm_color_lut_32);
+}
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -118,4 +130,5 @@ enum drm_color_lut_tests {
 };
 
 int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests);
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c47788dc84c8..2ac4285b2dff 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -872,6 +872,23 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_color_lut_32 - Represents high precision lut values
+ *
+ * Creating 32 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_32 {
+	/*
+	 * Data for high precision LUTs
+	 */
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
 /**
  * enum drm_colorop_type - Type of color operation
  *
@@ -879,6 +896,7 @@ struct drm_color_lut {
  * and defines a different set of properties. This enum defines all types and
  * gives a high-level description.
  */
+
 enum drm_colorop_type {
 	/**
 	 * @DRM_COLOROP_1D_CURVE:
-- 
2.42.0

