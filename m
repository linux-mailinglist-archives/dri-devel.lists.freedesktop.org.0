Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5E877D3A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8401210EC04;
	Mon, 11 Mar 2024 09:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCWYBk20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9010EBF0;
 Mon, 11 Mar 2024 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710150559; x=1741686559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1gkmcbdpSYaeMUb+nYUgWOGSjgTM/8RZrUdlnntgJvs=;
 b=QCWYBk20FdLkkM0C7+67qb+72iqbtOU2Txt88leGvzBTYr5gkGG/dE4x
 JTrI4aZDolZOrsOOJLc4PYTNqw+PpG2/zF/fVC3ElNWZHohsp8NcYThyv
 1rrq5VT074ly8Ntzw/OhR8a8aqedw6rud5t37JBhkKcS7uwKEW/hB340k
 QLZjsq98HNU9ACGjVzWmeh3UnbHbBIlPoLvTjIRPWcOJgwwsVfR8pnYHg
 /NR/UTQEu1mnLWsk04J+dHMGz5/bqmE4DLmepCPrf8pXrkYNdoTeS0QC5
 mqDSL5go5ajTaLToRffqo/oI8bUDS9sPvU74LC9nuceTAKqvWesRKG40x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8619205"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8619205"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11198010"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2024 02:49:17 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v17 1/9] drm/dp: Add support to indicate if sink supports AS
 SDP
Date: Mon, 11 Mar 2024 15:12:30 +0530
Message-Id: <20240311094238.3320888-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
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
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 25 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 266826eac4a7..f2fabb673aa4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2948,6 +2948,31 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
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
index a62fcd051d4d..7df19acdc790 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -101,6 +101,7 @@ struct drm_dp_vsc_sdp {
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
-- 
2.25.1

