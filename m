Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAF86CF97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7579010E4F4;
	Thu, 29 Feb 2024 16:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJNhq2dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A0410E3F1;
 Thu, 29 Feb 2024 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709225213; x=1740761213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5d+o6AveLfPDEtNEaODUT4IpiLyrgC/RqRd1WpkzX6I=;
 b=CJNhq2dtAGoa8KV4K2yZZN4B1RJaLhk7SaH7jcFFgjgq8HyMmpa4zHDw
 PqcPFOqaRQ6kfLt1zzZapOObrW0dbreEzITdjel5ntl83RV1NXlT0gxWv
 1+mz3hxhisCB7GRF6uFPooVd8Wq8gxF7P/EiWGeEBRTzsA1zWihv0a2id
 /uPjlD0jGr6w21p+qPpmSHbs3bmB1yZdWZbdaHLFACKEVt9nICCl+G/sr
 TwacXF1lcYu6WiS9u/+jzb3PSyR/LBCQzzW2EUsFjViUaI/RQYCepVYb5
 dH6E2wxCciw53Yd4mJlFxE2lReY0FfJsIjxiRPfN3IX1gCfQHsz6DMC86 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3877564"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3877564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 08:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7811539"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa010.jf.intel.com with ESMTP; 29 Feb 2024 08:46:45 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v14 1/9] drm/dp: Add support to indicate if sink supports AS
 SDP
Date: Thu, 29 Feb 2024 22:09:49 +0530
Message-Id: <20240229163957.2948182-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229163957.2948182-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240229163957.2948182-1-mitulkumar.ajitkumar.golani@intel.com>
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

