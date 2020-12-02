Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D242A2CBFB1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FED6EA4D;
	Wed,  2 Dec 2020 14:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC6A6EA3F;
 Wed,  2 Dec 2020 14:31:19 +0000 (UTC)
IronPort-SDR: 8YP40LitXnhIzqwO+dYL3+6zkUAYcyCZ0PEAnHolVe45YUTY1bG4sVqEmbrpkDIMysZGFu6Lvn
 jqs6SewyRpHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257733807"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="257733807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:30:34 -0800
IronPort-SDR: 0+xU007dvebIsiQrw/eTQFQ4m5RCcbFdqOAVkaB47wJrcRglQGIRyKgFxswsDN2NDR5wByzPAr
 BgHK9WjEqdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="373191407"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga007.jf.intel.com with ESMTP; 02 Dec 2020 06:30:31 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
Date: Wed,  2 Dec 2020 19:53:54 +0530
Message-Id: <20201202142405.14951-3-ankit.k.nautiyal@intel.com>
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

From: Swati Sharma <swati2.sharma@intel.com>

This patch parses MAX_FRL field to get the MAX rate in Gbps that
the HDMI 2.1 panel can support in FRL mode. Source need this
field to determine the optimal rate between the source and sink
during FRL training.

v2: Fixed minor bugs, and removed extra wrapper function (Uma Shankar)

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 44 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  6 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74f5a3197214..e657c321d9e4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4851,6 +4851,41 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 		info->rgb_quant_range_selectable = true;
 }
 
+static
+void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8 *max_rate_per_lane)
+{
+	switch (max_frl_rate) {
+	case 1:
+		*max_lanes = 3;
+		*max_rate_per_lane = 3;
+		break;
+	case 2:
+		*max_lanes = 3;
+		*max_rate_per_lane = 6;
+		break;
+	case 3:
+		*max_lanes = 4;
+		*max_rate_per_lane = 6;
+		break;
+	case 4:
+		*max_lanes = 4;
+		*max_rate_per_lane = 8;
+		break;
+	case 5:
+		*max_lanes = 4;
+		*max_rate_per_lane = 10;
+		break;
+	case 6:
+		*max_lanes = 4;
+		*max_rate_per_lane = 12;
+		break;
+	case 0:
+	default:
+		*max_lanes = 0;
+		*max_rate_per_lane = 0;
+	}
+}
+
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 					       const u8 *db)
 {
@@ -4904,6 +4939,15 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 		}
 	}
 
+	if (hf_vsdb[7]) {
+		u8 max_frl_rate;
+
+		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
+		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
+				&hdmi->max_frl_rate_per_lane);
+	}
+
 	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fcdc58d8b88b..1a3b4776b458 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -207,6 +207,12 @@ struct drm_hdmi_info {
 
 	/** @y420_dc_modes: bitmap of deep color support index */
 	u8 y420_dc_modes;
+
+	/** @max_frl_rate_per_lane: support fixed rate link */
+	u8 max_frl_rate_per_lane;
+
+	/** @max_lanes: supported by sink */
+	u8 max_lanes;
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
