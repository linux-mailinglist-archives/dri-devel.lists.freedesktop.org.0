Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D294B49AF79
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3987610EED8;
	Tue, 25 Jan 2022 09:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56BF10EEF3;
 Tue, 25 Jan 2022 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643101941; x=1674637941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20Dy+Cod31MYR/zJV9wtDFBhZU+1b0D0uQWNfLXW37o=;
 b=FS4+RTgqTDGpFBdVNeMqbYTlTCMV9tYLDlHy1ucj3IO3aDkZDSHlgdfM
 Rbfbo2DBakotuQIu5G13jKBBDN727V+BvaMN/T7t/lGIBgP78USao7RAY
 HvRBvfz+42sTJ0MBp6TuwPjfGf86abQ0DemSRbJPtQmxO/b48i8Ytspnr
 qO2seCKlP3sJV+8rX1Lq1G9Lt9X0FbmmB1EI1Bv3qDKiNSYUhrR8HtDAF
 iH90CiYxrUFdNAmF7ZjDvkrIxOjch5LxRChdgtog/TfdS1Y4xbucdmrjw
 sdW47lhVVUeaBP7ll52bPEjrVsLcV1xvJAeUFAqO/SSOtBB+NPQTaj2Ot A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246042331"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246042331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="695768104"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:18 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/drm_edid: Add helper to get max FRL rate for an HDMI
 sink
Date: Tue, 25 Jan 2022 14:28:00 +0530
Message-Id: <20220125085801.1025521-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the common function for getting the max FRL rate for an HDMI sink,
from intel_dp.c to drm/drm_edid.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c              | 38 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 19 ++++---------
 include/drm/drm_edid.h                  |  2 ++
 3 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index eb61a1a92dc0..75b538b4c87f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6176,3 +6176,41 @@ void drm_update_tile_info(struct drm_connector *connector,
 		connector->tile_group = NULL;
 	}
 }
+
+/**
+ * drm_hdmi_sink_max_frl - get the max frl rate from HDMI2.1 sink
+ * @connector - connector with HDMI2.1 sink
+ *
+ * RETURNS:
+ * max frl rate supported by the HDMI2.1 sink, 0 if FRL not supported
+ */
+int drm_hdmi_sink_max_frl(struct drm_connector *connector)
+{
+	int max_lanes = connector->display_info.hdmi.max_lanes;
+	int rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
+
+	return max_lanes * rate_per_lane;
+}
+EXPORT_SYMBOL(drm_hdmi_sink_max_frl);
+
+/**
+ * drm_hdmi_sink_dsc_max_frl - get the max frl rate from HDMI2.1 sink
+ * with DSC1.2 compression.
+ * @connector - connector with HDMI2.1 sink
+ *
+ * RETURNS:
+ * max frl rate supported by the HDMI2.1 sink with DSC1.2, 0 if FRL not supported
+ */
+int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector)
+{
+	int max_dsc_lanes, dsc_rate_per_lane;
+
+	if (!connector->display_info.hdmi.dsc_cap.v_1p2)
+		return 0;
+
+	max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
+	dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
+
+	return max_dsc_lanes * dsc_rate_per_lane;
+}
+EXPORT_SYMBOL(drm_hdmi_sink_dsc_max_frl);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4d4579a301f6..f7fe7de7e553 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2190,22 +2190,13 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct drm_connector *connector = &intel_connector->base;
-	int max_frl_rate;
-	int max_lanes, rate_per_lane;
-	int max_dsc_lanes, dsc_rate_per_lane;
+	int max_frl = drm_hdmi_sink_max_frl(connector);
+	int dsc_max_frl = drm_hdmi_sink_dsc_max_frl(connector);
 
-	max_lanes = connector->display_info.hdmi.max_lanes;
-	rate_per_lane = connector->display_info.hdmi.max_frl_rate_per_lane;
-	max_frl_rate = max_lanes * rate_per_lane;
+	if (dsc_max_frl)
+		return min(max_frl, dsc_max_frl);
 
-	if (connector->display_info.hdmi.dsc_cap.v_1p2) {
-		max_dsc_lanes = connector->display_info.hdmi.dsc_cap.max_lanes;
-		dsc_rate_per_lane = connector->display_info.hdmi.dsc_cap.max_frl_rate_per_lane;
-		if (max_dsc_lanes && dsc_rate_per_lane)
-			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
-	}
-
-	return max_frl_rate;
+	return max_frl;
 }
 
 static bool
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 18f6c700f6d0..5003e1254c44 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -592,6 +592,8 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
 				  int ext_id, int *ext_index);
+int drm_hdmi_sink_max_frl(struct drm_connector *connector);
+int drm_hdmi_sink_dsc_max_frl(struct drm_connector *connector);
 
 
 #endif /* __DRM_EDID_H__ */
-- 
2.25.1

