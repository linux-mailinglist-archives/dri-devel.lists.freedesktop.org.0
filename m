Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE7F150526
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9464B6E2DC;
	Mon,  3 Feb 2020 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80F76E2CA;
 Mon,  3 Feb 2020 11:20:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 03:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; d="scan'208";a="263381118"
Received: from unknown (HELO helsinki.fi.intel.com) ([10.237.66.150])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2020 03:20:23 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/dp: Add checking of YCBCR420 Pass-through to
 YCBCR420 outputs.
Date: Mon,  3 Feb 2020 13:20:22 +0200
Message-Id: <20200203112022.105392-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
	"../kernel_patch/dp_dongle_01/0001-drm-Add-a-detailed-DP-HDMI-branch-info-on-debugfs.patch"@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a DP downstream uses a DP to HDMI active converter, the active
converter needs to support YCbCr420 Pass-through to enable DP YCbCr 4:2:0
outputs.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4dede6253f8..824ed8096426 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2298,6 +2298,22 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	return 0;
 }
 
+static bool
+intel_dp_downstream_is_hdmi_detailed_cap_info(struct intel_dp *intel_dp)
+{
+	int type = intel_dp->downstream_ports[0] & DP_DS_PORT_TYPE_MASK;
+	bool detailed_cap_info = intel_dp->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
+				 DP_DETAILED_CAP_INFO_AVAILABLE;
+
+	return type == DP_DS_PORT_TYPE_HDMI && detailed_cap_info;
+}
+
+static bool
+intel_dp_downstream_supports_ycbcr_420_passthru(struct intel_dp *intel_dp)
+{
+	return intel_dp->downstream_ports[3] & DP_DS_YCBCR420_PASSTHRU_SUPPORT;
+}
+
 static int
 intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
 			 struct drm_connector *connector,
@@ -2314,6 +2330,16 @@ intel_dp_ycbcr420_config(struct intel_dp *intel_dp,
 	    !connector->ycbcr_420_allowed)
 		return 0;
 
+	/*
+	 * When a DP downstream uses a DP to HDMI active converter,
+	 * the active converter needs to support YCbCr420 Pass-through.
+	 */
+	if (drm_dp_is_branch(intel_dp->dpcd)) {
+		if (intel_dp_downstream_is_hdmi_detailed_cap_info(intel_dp) &&
+		    !intel_dp_downstream_supports_ycbcr_420_passthru(intel_dp))
+			return 0;
+	}
+
 	crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
 
 	/* YCBCR 420 output conversion needs a scaler */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
