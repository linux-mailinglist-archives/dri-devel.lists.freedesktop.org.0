Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21F28F08E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 13:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80A56EC63;
	Thu, 15 Oct 2020 11:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7816EC60;
 Thu, 15 Oct 2020 11:00:21 +0000 (UTC)
IronPort-SDR: 94Fk3dh2mOmMeku1dX4CoZK+4Q8n3jdfPaPweeyR3R702WvuAGSbTjsobIChFINylikxhf+gl9
 StdAK422CHAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="163686100"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="163686100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 04:00:21 -0700
IronPort-SDR: 8mwHoA2dxHmtPnLokHpMdEnTCVLt6E8JBpRrivljaR9lZbYUf77tF4UsQqCoMRAbM7WdFuUJ9z
 pJZvUSmz6m3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="356949711"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2020 04:00:19 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 09/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB block
Date: Thu, 15 Oct 2020 16:22:55 +0530
Message-Id: <20201015105259.27934-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch parses HFVSDB fields for DSC1.2 capabilities of an
HDMI2.1 sink. These fields are required by a source to understand the
DSC capability of the sink, to set appropriate PPS parameters,
before transmitting compressed data stream.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 19 +++++++++++++++++++
 include/drm/drm_connector.h | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8afb136e73f5..feee19657a7a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4889,10 +4889,29 @@ static void drm_parse_hdmi_21_additional_fields(struct drm_connector *connector,
 {
 	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
 	u8 max_frl_rate;
+	u8 dsc_max_frl_rate;
 
 	max_frl_rate = db[7] & DRM_EDID_MAX_FRL_RATE_MASK;
 	drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 			     &hdmi->max_frl_rate_per_lane);
+
+	hdmi->dsc_1p2 = db[11] & DRM_EDID_DSC_1P2;
+        hdmi->dsc_native_420 = db[11] & DRM_EDID_DSC_NATIVE_420;
+	hdmi->dsc_all_bpp = db[11] & DRM_EDID_DSC_ALL_BPP;
+
+	if (db[11] & DRM_EDID_DSC_16BPC)
+		hdmi->dsc_bpc_supported = 16;
+	else if (db[11] & DRM_EDID_DSC_12BPC)
+		hdmi->dsc_bpc_supported = 12;
+	else if (db[11] & DRM_EDID_DSC_10BPC)
+		hdmi->dsc_bpc_supported = 10;
+	else
+		hdmi->dsc_bpc_supported = 0;
+
+	dsc_max_frl_rate = db[12] & DRM_EDID_DSC_MAX_FRL_RATE;
+	drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi->dsc_max_lanes,
+			     &hdmi->dsc_max_frl_rate_per_lane);
+	hdmi->dsc_total_chunk_kbytes = db[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 }
 
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f351bf10c076..7100012f9c0f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -213,6 +213,38 @@ struct drm_hdmi_info {
 
 	/** @max_lanes: supported by sink */
 	u8 max_lanes;
+
+	/** @dsc_1p2: flag for dsc1.2 support by sink */
+	bool dsc_1p2;
+
+	/** @dsc_native_420: Does sink support DSC with 4:2:0 compression */
+	bool dsc_native_420;
+
+	/**
+	 * @dsc_all_bpp: Does sink support all bpp with 4:4:4: or 4:2:2
+	 * compressed formats
+	 */
+	bool dsc_all_bpp;
+
+	/**
+	 * @dsc_bpc_supported: compressed bpc supported by sink : 10, 12 or 16 bpc
+	 */
+	u8 dsc_bpc_supported;
+
+	/** @dsc_max_slices: maximum number of Horizontal slices supported by */
+	u8 dsc_max_slices;
+
+	/** @dsc_clk_per_slice : max pixel clock in MHz supported per slice */
+	u8 dsc_clk_per_slice;
+
+	/** @dsc_max_lanes : dsc max lanes supported for Fixed rate Link training */
+	u8 dsc_max_lanes;
+
+	/** @dsc_max_frl_rate_per_lane : maximum frl rate with DSC per lane */
+	u8 dsc_max_frl_rate_per_lane;
+
+	/** @dsc_total_chunk_kbytes: max size of chunks in KBs supported per line*/
+	u8 dsc_total_chunk_kbytes;
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
