Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37B392A96C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 21:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8610E3E4;
	Mon,  8 Jul 2024 19:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye4hKGjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CF110E3E3;
 Mon,  8 Jul 2024 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720465225; x=1752001225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9bOQybnMAvgRea8a/jakUPDginmVJcCG/OGavAgDG8=;
 b=Ye4hKGjrA2FgJ3GsRkqOQnyLGJA0c0mZd+UYgIBZF2WZ1YXaA5RC+K6j
 FP0ODyTJg6mErZqgA6GLP0wtSMDqUs5nd1EzK6uTjxuW/HG5GK1fIUHUk
 nqB+3Ga6pKuU/cOmyDNUsmTahXfoB7+lTaqGA+Y0uP7Setv7wX/z0D8Hl
 7uJYxtNKTe/isnsFDTHA9s9SodpKq21k6FqauSkslh+3SXBQR65keTq+c
 wZWUnmZoRobVGXiIBLqgDHI8QxdcIg0oNnPitdqpD05IyCQ3kjIy/crpD
 imEMv4gjqh4G99b/7dR1DcgBlzhfqgNrGTywAJ+rSWG9silWsPStAmU/e g==;
X-CSE-ConnectionGUID: yQq0FF16TN2seLoNnLM55A==
X-CSE-MsgGUID: 3kE2hnnlTfatJxY9ZkUgsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17821056"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17821056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 12:00:25 -0700
X-CSE-ConnectionGUID: JkG8rzPnSXOCZ2iBZJb6Tw==
X-CSE-MsgGUID: 58a7rrf3TbeWRuzx0MD05Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="85140019"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 12:00:24 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 5/6] drm/dp: Add helper to dump an LTTPR PHY descriptor
Date: Mon,  8 Jul 2024 22:00:28 +0300
Message-ID: <20240708190029.271247-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240708190029.271247-1-imre.deak@intel.com>
References: <20240708190029.271247-1-imre.deak@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to dump the DPCD descriptor for an LTTPR PHY. This is based
on [1] and [2] moving the helper to DRM core as suggested by Ville.

[1] https://lore.kernel.org/all/20240703155937.1674856-5-imre.deak@intel.com
[2] https://lore.kernel.org/all/20240703155937.1674856-6-imre.deak@intel.com

Cc: dri-devel@lists.freedesktop.org
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 66 +++++++++++++++++++++----
 include/drm/display/drm_dp.h            |  4 ++
 include/drm/display/drm_dp_helper.h     |  2 +
 3 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index d4c34f3641400..6ee51003de3ce 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2328,6 +2328,31 @@ drm_dp_get_quirks(const struct drm_dp_dpcd_ident *ident, bool is_branch)
 #undef DEVICE_ID_ANY
 #undef DEVICE_ID
 
+static int drm_dp_read_ident(struct drm_dp_aux *aux, unsigned int offset,
+			     struct drm_dp_dpcd_ident *ident)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
+
+	return ret < 0 ? ret : 0;
+}
+
+static void drm_dp_dump_desc(struct drm_dp_aux *aux,
+			     const char *device_name, const struct drm_dp_desc *desc)
+{
+	const struct drm_dp_dpcd_ident *ident = &desc->ident;
+
+	drm_dbg_kms(aux->drm_dev,
+		    "%s: %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
+		    aux->name, device_name,
+		    (int)sizeof(ident->oui), ident->oui,
+		    (int)strnlen(ident->device_id, sizeof(ident->device_id)), ident->device_id,
+		    ident->hw_rev >> 4, ident->hw_rev & 0xf,
+		    ident->sw_major_rev, ident->sw_minor_rev,
+		    desc->quirks);
+}
+
 /**
  * drm_dp_read_desc - read sink/branch descriptor from DPCD
  * @aux: DisplayPort AUX channel
@@ -2344,27 +2369,48 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
 {
 	struct drm_dp_dpcd_ident *ident = &desc->ident;
 	unsigned int offset = is_branch ? DP_BRANCH_OUI : DP_SINK_OUI;
-	int ret, dev_id_len;
+	int ret;
 
-	ret = drm_dp_dpcd_read(aux, offset, ident, sizeof(*ident));
+	ret = drm_dp_read_ident(aux, offset, ident);
 	if (ret < 0)
 		return ret;
 
 	desc->quirks = drm_dp_get_quirks(ident, is_branch);
 
-	dev_id_len = strnlen(ident->device_id, sizeof(ident->device_id));
-
-	drm_dbg_kms(aux->drm_dev,
-		    "%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d quirks 0x%04x\n",
-		    aux->name, is_branch ? "branch" : "sink",
-		    (int)sizeof(ident->oui), ident->oui, dev_id_len,
-		    ident->device_id, ident->hw_rev >> 4, ident->hw_rev & 0xf,
-		    ident->sw_major_rev, ident->sw_minor_rev, desc->quirks);
+	drm_dp_dump_desc(aux, is_branch ? "DP branch" : "DP sink", desc);
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_read_desc);
 
+/**
+ * drm_dp_dump_lttpr_desc - read and dump the DPCD descriptor for an LTTPR PHY
+ * @aux: DisplayPort AUX channel
+ * @dp_phy: LTTPR PHY instance
+ *
+ * Read the DPCD LTTPR PHY descriptor for @dp_phy and print a debug message
+ * with its details to dmesg.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_dump_lttpr_desc(struct drm_dp_aux *aux, enum drm_dp_phy dp_phy)
+{
+	struct drm_dp_desc desc = {};
+	int ret;
+
+	if (drm_WARN_ON(aux->drm_dev, dp_phy < DP_PHY_LTTPR1 || dp_phy > DP_MAX_LTTPR_COUNT))
+		return -EINVAL;
+
+	ret = drm_dp_read_ident(aux, DP_OUI_PHY_REPEATER(dp_phy), &desc.ident);
+	if (ret < 0)
+		return ret;
+
+	drm_dp_dump_desc(aux, drm_dp_phy_name(dp_phy), &desc);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_dump_lttpr_desc);
+
 /**
  * drm_dp_dsc_sink_bpp_incr() - Get bits per pixel increment
  * @dsc_dpcd: DSC capabilities from DPCD
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 173548c6473a9..a6f8b098c56f1 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1543,6 +1543,10 @@ enum drm_dp_phy {
 #define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1	    0xf0039 /* 1.3 */
 #define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
 
+#define DP_OUI_PHY_REPEATER1				    0xf003d /* 1.3 */
+#define DP_OUI_PHY_REPEATER(dp_phy) \
+	DP_LTTPR_REG(dp_phy, DP_OUI_PHY_REPEATER1)
+
 #define __DP_FEC1_BASE					    0xf0290 /* 1.4 */
 #define __DP_FEC2_BASE					    0xf0298 /* 1.4 */
 #define DP_FEC_BASE(dp_phy) \
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ea03e1dd26ba7..bbb1cdc4fc68d 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -657,6 +657,8 @@ struct drm_dp_desc {
 int drm_dp_read_desc(struct drm_dp_aux *aux, struct drm_dp_desc *desc,
 		     bool is_branch);
 
+int drm_dp_dump_lttpr_desc(struct drm_dp_aux *aux, enum drm_dp_phy dp_phy);
+
 /**
  * enum drm_dp_quirk - Display Port sink/branch device specific quirks
  *
-- 
2.43.3

