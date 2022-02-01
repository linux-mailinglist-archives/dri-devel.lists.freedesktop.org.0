Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC54A57CE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6416F10E5B4;
	Tue,  1 Feb 2022 07:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CF310E5AB;
 Tue,  1 Feb 2022 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643700875; x=1675236875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gzgd3P5OR1e40ytnVaGQrai3loWBkxN5Dhr36b+bTFs=;
 b=cH63XnghGTCXps2VNwxkknLVbZOmbshvOrMNIAzwGGv5WHMAGfO2Zpqc
 P/lAbnVeRx1oeTbcslheO+otl7VHvvm048U6Wi6zLHUBAo0TfwzaD6NMc
 bkh89Flcnp5ykGPWA2cKUGxevjvboqr5/tBkH5FLXMCjUfJoIrgf3Faor
 cEt/OMQDkKUUZtp9RAziV9pwRMtPKcgy11F19f/aUV1vKSK/sM73n4JB6
 B27knhbnoFDTWinVTzpBOjfj4Bm02L1ZTA3fMMHJTtMiKAhs2ep/6oRHE
 r9aS+0uZ2aVJ6NBxDhxUiuk1QUNlBwFyyVVDWB9Cg3cdDelUCATdBXEXI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245227829"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245227829"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698315966"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:30 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/edid: Add helper to get max FRL rate for an HDMI
 sink
Date: Tue,  1 Feb 2022 12:50:28 +0530
Message-Id: <20220201072030.1466446-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
References: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
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

Add the helpers for getting the max FRL rate with and without DSC
for an HDMI sink.

v2: Fix the subject line and documentation of the helpers (Jani).
Split the helper definitions and usage into separate patches. (Jani).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index eb61a1a92dc0..c209fd6b24a2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6176,3 +6176,41 @@ void drm_update_tile_info(struct drm_connector *connector,
 		connector->tile_group = NULL;
 	}
 }
+
+/**
+ * drm_hdmi_sink_max_frl - get the max frl rate, if supported
+ * @connector - connector with HDMI sink
+ *
+ * RETURNS:
+ * max frl rate supported by the HDMI sink, 0 if FRL not supported
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
+ * drm_hdmi_sink_dsc_max_frl - get the max frl rate from HDMI sink with
+ * DSC1.2 compression.
+ * @connector - connector with HDMI sink
+ *
+ * RETURNS:
+ * max frl rate supported by the HDMI sink with DSC1.2, 0 if FRL not supported
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

