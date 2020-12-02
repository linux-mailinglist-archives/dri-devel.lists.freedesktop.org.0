Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D802CBFAF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91596EA49;
	Wed,  2 Dec 2020 14:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214656EA3F;
 Wed,  2 Dec 2020 14:31:20 +0000 (UTC)
IronPort-SDR: ED/AJ5c/SBsTkLIgw9SabygZTkSRhI2ujlCF5h1ZceQzGCLB8xQ/ZhpWoX/Sdpl9b7P/JIPcMq
 XnwufABxEoyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257733815"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="257733815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:30:37 -0800
IronPort-SDR: /Z/4/JDmp2G1OLV6DVlOiYUdkr2wfO3ZnSwus7/2Hzk82Ac155HGllbQBJCgbwvUUmmXQ233Tc
 6IQC5skRzrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="373191432"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga007.jf.intel.com with ESMTP; 02 Dec 2020 06:30:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB block
Date: Wed,  2 Dec 2020 19:53:55 +0530
Message-Id: <20201202142405.14951-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
References: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch parses HFVSDB fields for DSC1.2 capabilities of an
HDMI2.1 sink. These fields are required by a source to understand the
DSC capability of the sink, to set appropriate PPS parameters,
before transmitting compressed data stream.

v2: Addressed following issues as suggested by Uma Shankar:
-Added a new struct for hdmi dsc cap
-Fixed bugs in macros usage.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 59 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h | 43 +++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e657c321d9e4..ca368df2e5ac 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4941,11 +4941,70 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 
 	if (hf_vsdb[7]) {
 		u8 max_frl_rate;
+		u8 dsc_max_frl_rate;
+		u8 dsc_max_slices;
+		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 
 		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
 		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				&hdmi->max_frl_rate_per_lane);
+		hdmi_dsc->v_1p2 = hf_vsdb[11] & DRM_EDID_DSC_1P2;
+
+		if (hdmi_dsc->v_1p2) {
+			hdmi_dsc->native_420 = hf_vsdb[11] & DRM_EDID_DSC_NATIVE_420;
+			hdmi_dsc->all_bpp = hf_vsdb[11] & DRM_EDID_DSC_ALL_BPP;
+
+			if (hf_vsdb[11] & DRM_EDID_DSC_16BPC)
+				hdmi_dsc->bpc_supported = 16;
+			else if (hf_vsdb[11] & DRM_EDID_DSC_12BPC)
+				hdmi_dsc->bpc_supported = 12;
+			else if (hf_vsdb[11] & DRM_EDID_DSC_10BPC)
+				hdmi_dsc->bpc_supported = 10;
+			else
+				hdmi_dsc->bpc_supported = 0;
+
+			dsc_max_frl_rate = (hf_vsdb[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
+			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
+					&hdmi_dsc->max_frl_rate_per_lane);
+			hdmi_dsc->total_chunk_kbytes = hf_vsdb[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
+
+			dsc_max_slices = hf_vsdb[12] & DRM_EDID_DSC_MAX_SLICES;
+			switch (dsc_max_slices) {
+			case 1:
+				hdmi_dsc->max_slices = 1;
+				hdmi_dsc->clk_per_slice = 340;
+				break;
+			case 2:
+				hdmi_dsc->max_slices = 2;
+				hdmi_dsc->clk_per_slice = 340;
+				break;
+			case 3:
+				hdmi_dsc->max_slices = 4;
+				hdmi_dsc->clk_per_slice = 340;
+				break;
+			case 4:
+				hdmi_dsc->max_slices = 8;
+				hdmi_dsc->clk_per_slice = 340;
+				break;
+			case 5:
+				hdmi_dsc->max_slices = 8;
+				hdmi_dsc->clk_per_slice = 400;
+				break;
+			case 6:
+				hdmi_dsc->max_slices = 12;
+				hdmi_dsc->clk_per_slice = 400;
+				break;
+			case 7:
+				hdmi_dsc->max_slices = 16;
+				hdmi_dsc->clk_per_slice = 400;
+				break;
+			case 0:
+			default:
+				hdmi_dsc->max_slices = 0;
+				hdmi_dsc->clk_per_slice = 0;
+			}
+		}
 	}
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1a3b4776b458..1922b278ffad 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -175,6 +175,46 @@ struct drm_scdc {
 	struct drm_scrambling scrambling;
 };
 
+/**
+ * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
+ *
+ * Describes the DSC support provided by HDMI 2.1 sink.
+ * The information is fetched fom additional HFVSDB blocks defined
+ * for HDMI 2.1.
+ */
+struct drm_hdmi_dsc_cap {
+	/** @v_1p2: flag for dsc1.2 version support by sink */
+	bool v_1p2;
+
+	/** @native_420: Does sink support DSC with 4:2:0 compression */
+	bool native_420;
+
+	/**
+	 * @all_bpp: Does sink support all bpp with 4:4:4: or 4:2:2
+	 * compressed formats
+	 */
+	bool all_bpp;
+
+	/**
+	 * @bpc_supported: compressed bpc supported by sink : 10, 12 or 16 bpc
+	 */
+	u8 bpc_supported;
+
+	/** @max_slices: maximum number of Horizontal slices supported by */
+	u8 max_slices;
+
+	/** @clk_per_slice : max pixel clock in MHz supported per slice */
+	int clk_per_slice;
+
+	/** @max_lanes : dsc max lanes supported for Fixed rate Link training */
+	u8 max_lanes;
+
+	/** @max_frl_rate_per_lane : maximum frl rate with DSC per lane */
+	u8 max_frl_rate_per_lane;
+
+	/** @total_chunk_kbytes: max size of chunks in KBs supported per line*/
+	u8 total_chunk_kbytes;
+};
 
 /**
  * struct drm_hdmi_info - runtime information about the connected HDMI sink
@@ -213,6 +253,9 @@ struct drm_hdmi_info {
 
 	/** @max_lanes: supported by sink */
 	u8 max_lanes;
+
+	/** @dsc_cap: DSC capabilities of the sink */
+	struct drm_hdmi_dsc_cap dsc_cap;
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
