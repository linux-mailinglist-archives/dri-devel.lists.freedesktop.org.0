Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44352786FF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BCE6ECBB;
	Fri, 25 Sep 2020 12:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D49E6ECB7;
 Fri, 25 Sep 2020 12:21:04 +0000 (UTC)
IronPort-SDR: TKhyLo3PPXauUAbDDmh2+UqKwivSeSmIQIIaGyd2cyFzbhcTLn0kwmUnQL+G+SDNtdkAKFeHd4
 MEX94ZX38WDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="149163866"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="149163866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:21:04 -0700
IronPort-SDR: g4kIww3VJVbx2OTPx4GhJo8k3lqhO3BqvsUJgsTixHej9BvINCKz9dJgLwMOoPXxPX7w43ScPU
 CJKRWRFCXaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="383460370"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by orsmga001.jf.intel.com with ESMTP; 25 Sep 2020 05:21:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 2/7] drm/edid: Parse MAX_FRL field from HFVSDB block
Date: Fri, 25 Sep 2020 17:43:35 +0530
Message-Id: <20200925121340.29497-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
References: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
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

From: Swati Sharma <swati2.sharma@intel.com>

This patch parses MAX_FRL field to get the MAX rate in Gbps that
the HDMI 2.1 panel can support in FRL mode. Source need this
field to determine the optimal rate between the source and sink
during FRL training.

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 50 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  6 +++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 631125b46e04..d468ac91abb6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4849,6 +4849,51 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 		info->rgb_quant_range_selectable = true;
 }
 
+static void drm_parse_hdmi_21_additional_fields(struct drm_connector *connector,
+						const u8 *db)
+{
+     /* hf_vsdb 7:14 support needs to be added */
+
+    u8 max_frl_rate_per_lane;
+    struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
+
+    max_frl_rate_per_lane = (db[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+
+    switch(max_frl_rate_per_lane) {
+    case 0:
+	    hdmi->max_lane = 0;
+	    hdmi->max_frl_rate_per_lane = 0;
+	    break;
+    case 1:
+	    hdmi->max_lane = 3;
+	    hdmi->max_frl_rate_per_lane = 3;
+	    break;
+    case 2:
+	    hdmi->max_lane = 3;
+	    hdmi->max_frl_rate_per_lane = 6;
+	    break;
+    case 3:
+	    hdmi->max_lane = 4;
+	    hdmi->max_frl_rate_per_lane = 6;
+	    break;
+    case 4:
+	    hdmi->max_lane = 4;
+	    hdmi->max_frl_rate_per_lane = 8;
+	    break;
+    case 5:
+	    hdmi->max_lane = 4;
+	    hdmi->max_frl_rate_per_lane = 10;
+	    break;
+    case 6:
+	    hdmi->max_lane = 4;
+	    hdmi->max_frl_rate_per_lane = 12;
+	    break;
+    default:
+	    DRM_DEBUG_KMS("max frl rate per lane 0x%x, reserved\n", max_frl_rate_per_lane);
+	    break;
+    }
+}
+
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 					       const u8 *db)
 {
@@ -4902,6 +4947,11 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 		}
 	}
 
+	if (hf_vsdb[7]) {
+		    DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
+		    drm_parse_hdmi_21_additional_fields(connector, hf_vsdb);
+	}
+
 	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 928136556174..aa6ae9c17ca4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -207,6 +207,12 @@ struct drm_hdmi_info {
 
 	/** @y420_dc_modes: bitmap of deep color support index */
 	u8 y420_dc_modes;
+
+	/** @max_frl_rate_per_lane: support fixed rate link */
+	u8 max_frl_rate_per_lane;
+
+	/** @max_lane: supported by sink */
+	u8 max_lane;
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
