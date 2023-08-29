Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7F78C8FD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5364D10E3D1;
	Tue, 29 Aug 2023 15:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F9110E3CF;
 Tue, 29 Aug 2023 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324728; x=1724860728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Qp097ctCLHkcAcTxQXD4sQQnKT9TKGccAFF/oQntIc=;
 b=VKh2Gq920WrdQx4BUzgud5bkjU7gdoLPxez7T97kn8JGK3Y1DhPvNvDk
 nHtY9l3h69kiH7sDu8a/z4mVO4Wi2MxeNCmM6QZ9Xbdv/qgCcDLxapFKu
 9JSvAVODJ9UcI9Pnz97+roHjOuXU1+Ji2TlYcAaE41uXLBuf8FENMbP+u
 m1kVFRWbiOR7Cf9wB79hem2120dKgwESgUbpgo4LqF8nw/p0gkD0ToJCE
 4MZ8wwRcWF+RrF0YQrjSRZX7w1IJyG23baZ/SjqnfBMor5xngU5ACf8le
 B6UDx9jWG0BUE1dIMtriqgl9FP6h+ehPMfzw7VOVsKBudDGMi/718ZILg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769188"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769188"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554912"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554912"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:46 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 02/33] drm: Add color operation structure
Date: Tue, 29 Aug 2023 21:33:51 +0530
Message-ID: <20230829160422.1251087-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Each Color Hardware block will be represented uniquely
in the color pipeline. Define the structure to represent
the same.

These color operations will form the building blocks of
a color pipeline which best represents the underlying
Hardware. Color operations can be re-arranged, substracted
or added to create distinct color pipelines to accurately
describe the Hardware blocks present in the display engine.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/uapi/drm/drm_mode.h | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ea1b639bcb28..882479f41745 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -943,6 +943,78 @@ struct hdr_output_metadata {
 	};
 };
 
+/**
+ * enum color_op_block
+ *
+ * Enums to identify hardware color blocks.
+ *
+ * @DRM_CB_PRE_CSC: LUT before the CTM unit
+ * @DRM_CB_CSC: CTM hardware supporting 3x3 matrix
+ * @DRM_CB_POST_CSC: LUT after the CTM unit
+ * @DRM_CB_3D_LUT: LUT hardware with coefficients for all
+ *                 color components
+ * @DRM_CB_PRIVATE: Vendor specific hardware unit. Vendor
+ *                  can expose a custom hardware by defining a
+ *                  color operation block with this name as
+ *                  identifier
+ */
+enum color_op_block {
+	DRM_CB_INVAL = -1,
+
+	DRM_CB_PRE_CSC = 0,
+	DRM_CB_CSC,
+	DRM_CB_POST_CSC,
+	DRM_CB_3D_LUT,
+
+	/* Any new generic hardware block can be updated here */
+
+	/*
+	 * PRIVATE is kept at 255 to make it future proof and leave
+	 * scope for any new addition
+	 */
+	DRM_CB_PRIVATE = 255,
+	DRM_CB_MAX = DRM_CB_PRIVATE,
+};
+
+/**
+ * enum color_op_type
+ *
+ * These enums are to identify the mathematical operation that
+ * a hardware block is capable of.
+ * @CURVE_1D: It represents a one dimensional lookup table
+ * @CURVE_3D: Represents lut value for each color component for 3d lut capable hardware
+ * @MATRIX: It represents co-efficients for a CSC/CTM matrix hardware
+ * @FIXED_FUNCTION: To enable and program any custom fixed function hardware unit
+ */
+enum color_op_type {
+	CURVE_1D,
+	CURVE_3D,
+	MATRIX,
+	FIXED_FUNCTION,
+};
+
+/**
+ * @struct drm_color_op
+ *
+ * This structure is used to represent the capability of
+ * individual color hardware blocks.
+ *
+ * @name: a standardized enum to identify the color hardware block
+ * @type: The type of mathematical operation it can perform
+ * @blob_id: Id pointing to a blob containing information about
+ *          the hardware block which advertizes its capabilities
+ *          to the userspace. It can be an optional field depending
+ *          on the members "name" and "type".
+ * @private_flags: This can be used to provide vendor specific hints
+ *                 to user space
+ */
+struct drm_color_op {
+	enum color_op_block name;
+	enum color_op_type type;
+	__u32 blob_id;
+	__u32 private_flags;
+};
+
 /**
  * DRM_MODE_PAGE_FLIP_EVENT
  *
-- 
2.38.1

