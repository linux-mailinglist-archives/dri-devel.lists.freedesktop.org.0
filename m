Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2586B18D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051C310E6C1;
	Wed, 28 Feb 2024 14:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/d5jXh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD14010E6B2;
 Wed, 28 Feb 2024 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709130062; x=1740666062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5d+o6AveLfPDEtNEaODUT4IpiLyrgC/RqRd1WpkzX6I=;
 b=L/d5jXh4qitYM2+ZIwDYWbIvwOzVgmYZcp7wT3QSivlB41E2Y95dgd5R
 nCU82gE1uil9AK9URQRqoi01eLMgcvGeyjn513yZU3QsZQPz8SZoPRu2H
 7SuRvwDh+n9RSiDK/QYmHeK5WhR59+QknVo8tKWaQMXI7neXi3qMaYs0m
 3NWP7MxD98Xst3yuXxEHP0eouKuYtSKcFDkZx/rnpq50cqkLju4R7a5Ka
 UPQbGaoh7aeXGx9JwQXksXRjDbb3N9n4TqE7rbLuChOPLXyCN2Zl3g30T
 /ecq1xLT6J5SzaUtAS8Zlg9yOu4gQm+QLpZCnwCxhNbekTd2zliTC6V9a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14080516"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14080516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7488120"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Feb 2024 06:20:59 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v11 1/8] drm/dp: Add support to indicate if sink supports AS
 SDP
Date: Wed, 28 Feb 2024 19:44:05 +0530
Message-Id: <20240228141412.2761101-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240228141412.2761101-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240228141412.2761101-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add an API that indicates support for Adaptive Sync SDP in
the sink, which can be utilized by the rest of the DP programming.

--v1:
- Format commit message properly.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 25 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 9ac52cf5d4d8..f94c04db7187 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2913,6 +2913,31 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
+/**
+ * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
+ * @aux: DisplayPort AUX channel
+ * @dpcd: DisplayPort configuration data
+ *
+ * Returns true if adaptive sync sdp is supported, else returns false
+ */
+bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	u8 rx_feature;
+
+	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
+		return false;
+
+	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+			      &rx_feature) != 1) {
+		drm_dbg_dp(aux->drm_dev,
+			   "Failed to read DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1\n");
+		return false;
+	}
+
+	return (rx_feature & DP_ADAPTIVE_SYNC_SDP_SUPPORTED);
+}
+EXPORT_SYMBOL(drm_dp_as_sdp_supported);
+
 /**
  * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 0c1a4021e098..7c1aa3a703c8 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -101,6 +101,7 @@ struct drm_dp_vsc_sdp {
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
-- 
2.25.1

