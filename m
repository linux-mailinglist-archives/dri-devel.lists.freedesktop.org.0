Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C52797139
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E313810E22C;
	Thu,  7 Sep 2023 09:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6759810E7A1;
 Thu,  7 Sep 2023 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078915; x=1725614915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+yRcJlYz9d8x375Hs9Xq5bxTBfNV3WpxcRbtgTyum4=;
 b=XBtKAdb6dCQ04DOfrNxA6GA/BYtxk7GyoKD5p5CQm7Ije+n2M0NHrWwd
 Gh4bZJldIrCceDYMqnTXasS2laDBwoujUjDHx8yVOb1okaj74nKFyCATZ
 GKB7VO5Wy90AddH0bv5cv/iSUQRT1sNDXUulboeQscZ7vs7gEFY6MBfYp
 qUGHmfdCv+rtqeH8miE1YqExUrLTdu5bsJ7J/rErKQsUCALQGu3JqSmAT
 CzJtRDbwnxILyrvGswafxM8F1qypTThJc4kCZouR+eclyWEtFdt0NBeiD
 AtOQHxLNrbeviFxGi7c6v1dSSByDkInieAqZ8Rs1jFAJwEUTJrkFM776k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443690235"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="443690235"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741958658"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="741958658"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/edid: split out drm_eld.h from drm_edid.h
Date: Thu,  7 Sep 2023 12:28:19 +0300
Message-Id: <f681c6c25b258cddc28c51fe582201802e4aada1.1694078430.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694078430.git.jani.nikula@intel.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_edid.[ch] files are starting to be a bit crowded, and with plans
to add more ELD related functionality, it's perhaps cleanest to split
the ELD code out to a header of its own.

Include drm_eld.h from drm_edid.h for starters, and leave it to
follow-up work to only include drm_eld.h where needed.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/drm-kms-helpers.rst |   3 +
 include/drm/drm_edid.h                | 149 +-----------------------
 include/drm/drm_eld.h                 | 159 ++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 148 deletions(-)
 create mode 100644 include/drm/drm_eld.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b8ab05e42dbb..f0f93aa62545 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -363,6 +363,9 @@ EDID Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_edid.c
    :export:
 
+.. kernel-doc:: include/drm/drm_eld.h
+   :internal:
+
 SCDC Helper Functions Reference
 ===============================
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 882d2638708e..1ff52f57ab9c 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -25,6 +25,7 @@
 
 #include <linux/types.h>
 #include <linux/hdmi.h>
+#include <drm/drm_eld.h> /* FIXME: remove this, include directly where needed */
 #include <drm/drm_mode.h>
 
 struct drm_device;
@@ -269,64 +270,6 @@ struct detailed_timing {
 #define DRM_EDID_DSC_MAX_SLICES			0xf
 #define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
 
-/* ELD Header Block */
-#define DRM_ELD_HEADER_BLOCK_SIZE	4
-
-#define DRM_ELD_VER			0
-# define DRM_ELD_VER_SHIFT		3
-# define DRM_ELD_VER_MASK		(0x1f << 3)
-# define DRM_ELD_VER_CEA861D		(2 << 3) /* supports 861D or below */
-# define DRM_ELD_VER_CANNED		(0x1f << 3)
-
-#define DRM_ELD_BASELINE_ELD_LEN	2	/* in dwords! */
-
-/* ELD Baseline Block for ELD_Ver == 2 */
-#define DRM_ELD_CEA_EDID_VER_MNL	4
-# define DRM_ELD_CEA_EDID_VER_SHIFT	5
-# define DRM_ELD_CEA_EDID_VER_MASK	(7 << 5)
-# define DRM_ELD_CEA_EDID_VER_NONE	(0 << 5)
-# define DRM_ELD_CEA_EDID_VER_CEA861	(1 << 5)
-# define DRM_ELD_CEA_EDID_VER_CEA861A	(2 << 5)
-# define DRM_ELD_CEA_EDID_VER_CEA861BCD	(3 << 5)
-# define DRM_ELD_MNL_SHIFT		0
-# define DRM_ELD_MNL_MASK		(0x1f << 0)
-
-#define DRM_ELD_SAD_COUNT_CONN_TYPE	5
-# define DRM_ELD_SAD_COUNT_SHIFT	4
-# define DRM_ELD_SAD_COUNT_MASK		(0xf << 4)
-# define DRM_ELD_CONN_TYPE_SHIFT	2
-# define DRM_ELD_CONN_TYPE_MASK		(3 << 2)
-# define DRM_ELD_CONN_TYPE_HDMI		(0 << 2)
-# define DRM_ELD_CONN_TYPE_DP		(1 << 2)
-# define DRM_ELD_SUPPORTS_AI		(1 << 1)
-# define DRM_ELD_SUPPORTS_HDCP		(1 << 0)
-
-#define DRM_ELD_AUD_SYNCH_DELAY		6	/* in units of 2 ms */
-# define DRM_ELD_AUD_SYNCH_DELAY_MAX	0xfa	/* 500 ms */
-
-#define DRM_ELD_SPEAKER			7
-# define DRM_ELD_SPEAKER_MASK		0x7f
-# define DRM_ELD_SPEAKER_RLRC		(1 << 6)
-# define DRM_ELD_SPEAKER_FLRC		(1 << 5)
-# define DRM_ELD_SPEAKER_RC		(1 << 4)
-# define DRM_ELD_SPEAKER_RLR		(1 << 3)
-# define DRM_ELD_SPEAKER_FC		(1 << 2)
-# define DRM_ELD_SPEAKER_LFE		(1 << 1)
-# define DRM_ELD_SPEAKER_FLR		(1 << 0)
-
-#define DRM_ELD_PORT_ID			8	/* offsets 8..15 inclusive */
-# define DRM_ELD_PORT_ID_LEN		8
-
-#define DRM_ELD_MANUFACTURER_NAME0	16
-#define DRM_ELD_MANUFACTURER_NAME1	17
-
-#define DRM_ELD_PRODUCT_CODE0		18
-#define DRM_ELD_PRODUCT_CODE1		19
-
-#define DRM_ELD_MONITOR_NAME_STRING	20	/* offsets 20..(20+mnl-1) inclusive */
-
-#define DRM_ELD_CEA_SAD(mnl, sad)	(20 + (mnl) + 3 * (sad))
-
 struct edid {
 	u8 header[8];
 	/* Vendor & product info */
@@ -409,96 +352,6 @@ drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
 				   const struct drm_display_mode *mode,
 				   enum hdmi_quantization_range rgb_quant_range);
 
-/**
- * drm_eld_mnl - Get ELD monitor name length in bytes.
- * @eld: pointer to an eld memory structure with mnl set
- */
-static inline int drm_eld_mnl(const uint8_t *eld)
-{
-	return (eld[DRM_ELD_CEA_EDID_VER_MNL] & DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;
-}
-
-/**
- * drm_eld_sad - Get ELD SAD structures.
- * @eld: pointer to an eld memory structure with sad_count set
- */
-static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
-{
-	unsigned int ver, mnl;
-
-	ver = (eld[DRM_ELD_VER] & DRM_ELD_VER_MASK) >> DRM_ELD_VER_SHIFT;
-	if (ver != 2 && ver != 31)
-		return NULL;
-
-	mnl = drm_eld_mnl(eld);
-	if (mnl > 16)
-		return NULL;
-
-	return eld + DRM_ELD_CEA_SAD(mnl, 0);
-}
-
-/**
- * drm_eld_sad_count - Get ELD SAD count.
- * @eld: pointer to an eld memory structure with sad_count set
- */
-static inline int drm_eld_sad_count(const uint8_t *eld)
-{
-	return (eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_SAD_COUNT_MASK) >>
-		DRM_ELD_SAD_COUNT_SHIFT;
-}
-
-/**
- * drm_eld_calc_baseline_block_size - Calculate baseline block size in bytes
- * @eld: pointer to an eld memory structure with mnl and sad_count set
- *
- * This is a helper for determining the payload size of the baseline block, in
- * bytes, for e.g. setting the Baseline_ELD_Len field in the ELD header block.
- */
-static inline int drm_eld_calc_baseline_block_size(const uint8_t *eld)
-{
-	return DRM_ELD_MONITOR_NAME_STRING - DRM_ELD_HEADER_BLOCK_SIZE +
-		drm_eld_mnl(eld) + drm_eld_sad_count(eld) * 3;
-}
-
-/**
- * drm_eld_size - Get ELD size in bytes
- * @eld: pointer to a complete eld memory structure
- *
- * The returned value does not include the vendor block. It's vendor specific,
- * and comprises of the remaining bytes in the ELD memory buffer after
- * drm_eld_size() bytes of header and baseline block.
- *
- * The returned value is guaranteed to be a multiple of 4.
- */
-static inline int drm_eld_size(const uint8_t *eld)
-{
-	return DRM_ELD_HEADER_BLOCK_SIZE + eld[DRM_ELD_BASELINE_ELD_LEN] * 4;
-}
-
-/**
- * drm_eld_get_spk_alloc - Get speaker allocation
- * @eld: pointer to an ELD memory structure
- *
- * The returned value is the speakers mask. User has to use %DRM_ELD_SPEAKER
- * field definitions to identify speakers.
- */
-static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld)
-{
-	return eld[DRM_ELD_SPEAKER] & DRM_ELD_SPEAKER_MASK;
-}
-
-/**
- * drm_eld_get_conn_type - Get device type hdmi/dp connected
- * @eld: pointer to an ELD memory structure
- *
- * The caller need to use %DRM_ELD_CONN_TYPE_HDMI or %DRM_ELD_CONN_TYPE_DP to
- * identify the display type connected.
- */
-static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
-{
-	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
-}
-
 /**
  * drm_edid_decode_mfg_id - Decode the manufacturer ID
  * @mfg_id: The manufacturer ID
diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h
new file mode 100644
index 000000000000..9bde89bd96ea
--- /dev/null
+++ b/include/drm/drm_eld.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __DRM_ELD_H__
+#define __DRM_ELD_H__
+
+#include <linux/types.h>
+
+/* ELD Header Block */
+#define DRM_ELD_HEADER_BLOCK_SIZE	4
+
+#define DRM_ELD_VER			0
+# define DRM_ELD_VER_SHIFT		3
+# define DRM_ELD_VER_MASK		(0x1f << 3)
+# define DRM_ELD_VER_CEA861D		(2 << 3) /* supports 861D or below */
+# define DRM_ELD_VER_CANNED		(0x1f << 3)
+
+#define DRM_ELD_BASELINE_ELD_LEN	2	/* in dwords! */
+
+/* ELD Baseline Block for ELD_Ver == 2 */
+#define DRM_ELD_CEA_EDID_VER_MNL	4
+# define DRM_ELD_CEA_EDID_VER_SHIFT	5
+# define DRM_ELD_CEA_EDID_VER_MASK	(7 << 5)
+# define DRM_ELD_CEA_EDID_VER_NONE	(0 << 5)
+# define DRM_ELD_CEA_EDID_VER_CEA861	(1 << 5)
+# define DRM_ELD_CEA_EDID_VER_CEA861A	(2 << 5)
+# define DRM_ELD_CEA_EDID_VER_CEA861BCD	(3 << 5)
+# define DRM_ELD_MNL_SHIFT		0
+# define DRM_ELD_MNL_MASK		(0x1f << 0)
+
+#define DRM_ELD_SAD_COUNT_CONN_TYPE	5
+# define DRM_ELD_SAD_COUNT_SHIFT	4
+# define DRM_ELD_SAD_COUNT_MASK		(0xf << 4)
+# define DRM_ELD_CONN_TYPE_SHIFT	2
+# define DRM_ELD_CONN_TYPE_MASK		(3 << 2)
+# define DRM_ELD_CONN_TYPE_HDMI		(0 << 2)
+# define DRM_ELD_CONN_TYPE_DP		(1 << 2)
+# define DRM_ELD_SUPPORTS_AI		(1 << 1)
+# define DRM_ELD_SUPPORTS_HDCP		(1 << 0)
+
+#define DRM_ELD_AUD_SYNCH_DELAY		6	/* in units of 2 ms */
+# define DRM_ELD_AUD_SYNCH_DELAY_MAX	0xfa	/* 500 ms */
+
+#define DRM_ELD_SPEAKER			7
+# define DRM_ELD_SPEAKER_MASK		0x7f
+# define DRM_ELD_SPEAKER_RLRC		(1 << 6)
+# define DRM_ELD_SPEAKER_FLRC		(1 << 5)
+# define DRM_ELD_SPEAKER_RC		(1 << 4)
+# define DRM_ELD_SPEAKER_RLR		(1 << 3)
+# define DRM_ELD_SPEAKER_FC		(1 << 2)
+# define DRM_ELD_SPEAKER_LFE		(1 << 1)
+# define DRM_ELD_SPEAKER_FLR		(1 << 0)
+
+#define DRM_ELD_PORT_ID			8	/* offsets 8..15 inclusive */
+# define DRM_ELD_PORT_ID_LEN		8
+
+#define DRM_ELD_MANUFACTURER_NAME0	16
+#define DRM_ELD_MANUFACTURER_NAME1	17
+
+#define DRM_ELD_PRODUCT_CODE0		18
+#define DRM_ELD_PRODUCT_CODE1		19
+
+#define DRM_ELD_MONITOR_NAME_STRING	20	/* offsets 20..(20+mnl-1) inclusive */
+
+#define DRM_ELD_CEA_SAD(mnl, sad)	(20 + (mnl) + 3 * (sad))
+
+/**
+ * drm_eld_mnl - Get ELD monitor name length in bytes.
+ * @eld: pointer to an eld memory structure with mnl set
+ */
+static inline int drm_eld_mnl(const uint8_t *eld)
+{
+	return (eld[DRM_ELD_CEA_EDID_VER_MNL] & DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;
+}
+
+/**
+ * drm_eld_sad - Get ELD SAD structures.
+ * @eld: pointer to an eld memory structure with sad_count set
+ */
+static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
+{
+	unsigned int ver, mnl;
+
+	ver = (eld[DRM_ELD_VER] & DRM_ELD_VER_MASK) >> DRM_ELD_VER_SHIFT;
+	if (ver != 2 && ver != 31)
+		return NULL;
+
+	mnl = drm_eld_mnl(eld);
+	if (mnl > 16)
+		return NULL;
+
+	return eld + DRM_ELD_CEA_SAD(mnl, 0);
+}
+
+/**
+ * drm_eld_sad_count - Get ELD SAD count.
+ * @eld: pointer to an eld memory structure with sad_count set
+ */
+static inline int drm_eld_sad_count(const uint8_t *eld)
+{
+	return (eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_SAD_COUNT_MASK) >>
+		DRM_ELD_SAD_COUNT_SHIFT;
+}
+
+/**
+ * drm_eld_calc_baseline_block_size - Calculate baseline block size in bytes
+ * @eld: pointer to an eld memory structure with mnl and sad_count set
+ *
+ * This is a helper for determining the payload size of the baseline block, in
+ * bytes, for e.g. setting the Baseline_ELD_Len field in the ELD header block.
+ */
+static inline int drm_eld_calc_baseline_block_size(const uint8_t *eld)
+{
+	return DRM_ELD_MONITOR_NAME_STRING - DRM_ELD_HEADER_BLOCK_SIZE +
+		drm_eld_mnl(eld) + drm_eld_sad_count(eld) * 3;
+}
+
+/**
+ * drm_eld_size - Get ELD size in bytes
+ * @eld: pointer to a complete eld memory structure
+ *
+ * The returned value does not include the vendor block. It's vendor specific,
+ * and comprises of the remaining bytes in the ELD memory buffer after
+ * drm_eld_size() bytes of header and baseline block.
+ *
+ * The returned value is guaranteed to be a multiple of 4.
+ */
+static inline int drm_eld_size(const uint8_t *eld)
+{
+	return DRM_ELD_HEADER_BLOCK_SIZE + eld[DRM_ELD_BASELINE_ELD_LEN] * 4;
+}
+
+/**
+ * drm_eld_get_spk_alloc - Get speaker allocation
+ * @eld: pointer to an ELD memory structure
+ *
+ * The returned value is the speakers mask. User has to use %DRM_ELD_SPEAKER
+ * field definitions to identify speakers.
+ */
+static inline u8 drm_eld_get_spk_alloc(const uint8_t *eld)
+{
+	return eld[DRM_ELD_SPEAKER] & DRM_ELD_SPEAKER_MASK;
+}
+
+/**
+ * drm_eld_get_conn_type - Get device type hdmi/dp connected
+ * @eld: pointer to an ELD memory structure
+ *
+ * The caller need to use %DRM_ELD_CONN_TYPE_HDMI or %DRM_ELD_CONN_TYPE_DP to
+ * identify the display type connected.
+ */
+static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
+{
+	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
+}
+
+#endif /* __DRM_ELD_H__ */
-- 
2.39.2

