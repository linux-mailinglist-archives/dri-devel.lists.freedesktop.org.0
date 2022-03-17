Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116E4DCB84
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0010E613;
	Thu, 17 Mar 2022 16:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DE010E1E3;
 Thu, 17 Mar 2022 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647534805; x=1679070805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Qvh/Z1KihmzgQfzG86ZfP2QXch1N2ItqC5CXFB6IRg=;
 b=ZBllG+tb+iw8IgQCPUucjrh1U2h5lWPNRKwYy+7apda3eT6AH2sZ2MQP
 sY+u1plU+TmG8OA0PAUUkBRXVMbLQcxrk7xzZlTu8ydh+ICWR9aikFGR7
 /sLcM5Z1CTWCmhWVcyvMefqKrZL7RWhivwFHa0dNY0aIOOn9XAgRj2HNr
 H/DyBd4UsCUsUQ056wRReuQ4fsSsxUwP2/IiaW1+6E33r1LGEQSaQXHNC
 /8b0xqzTbSHeug0JsLcz3IaZweWyr+Y9EqjQ5jqDypPRBz7mxU9iHyNAD
 yz71TjL/9hiGO9FnZvQuedsnfyNVMFzE+E0SAFean5MiLvI5SlSZ+h2Xr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237522806"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237522806"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 09:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="558002922"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga008.jf.intel.com with ESMTP; 17 Mar 2022 09:33:18 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Add missing DP DSC extended capability definitions.
Date: Thu, 17 Mar 2022 18:33:52 +0200
Message-Id: <20220317163353.4152-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
References: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, Stanislav.Lisovskiy@intel.com,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding DP DSC register definitions, we might need for further
DSC implementation, supporting MST and DP branch pass-through mode.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c    | 25 +++++++++++++++++++++++++
 include/drm/dp/drm_dp_helper.h | 11 ++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 703972ae14c6..fe9c72055638 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -2312,6 +2312,31 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
 
+/**
+  * drm_dp_dsc_sink_bpp_increment_div - Get the bits per pixel precision
+  * which DP DSC sink device supports.
+  */
+u8 drm_dp_dsc_sink_bpp_increment_div(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+{
+	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
+
+	switch (bpp_increment_dpcd) {
+	case DP_DSC_BITS_PER_PIXEL_1_16:
+		return 16;
+	case DP_DSC_BITS_PER_PIXEL_1_8:
+		return 8;
+	case DP_DSC_BITS_PER_PIXEL_1_4:
+		return 4;
+	case DP_DSC_BITS_PER_PIXEL_1_2:
+		return 2;
+	case DP_DSC_BITS_PER_PIXEL_1_1:
+		return 1;
+	}
+
+	return 0;
+}
+
+
 /**
  * drm_dp_dsc_sink_line_buf_depth() - Get the line buffer depth in bits
  * @dsc_dpcd: DSC capabilities from DPCD
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 51e02cf75277..e4c9f4438ccb 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -246,6 +246,9 @@ struct drm_panel;
 
 #define DP_DSC_SUPPORT                      0x060   /* DP 1.4 */
 # define DP_DSC_DECOMPRESSION_IS_SUPPORTED  (1 << 0)
+# define DP_DSC_PASS_THROUGH_IS_SUPPORTED   (1 << 1)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP    (1 << 2)
+# define DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP  (1 << 3)
 
 #define DP_DSC_REV                          0x061
 # define DP_DSC_MAJOR_MASK                  (0xf << 0)
@@ -284,12 +287,15 @@ struct drm_panel;
 
 #define DP_DSC_BLK_PREDICTION_SUPPORT       0x066
 # define DP_DSC_BLK_PREDICTION_IS_SUPPORTED (1 << 0)
+# define DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT (1 << 1)
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_LOW       0x067   /* eDP 1.4 */
 
 #define DP_DSC_MAX_BITS_PER_PIXEL_HI        0x068   /* eDP 1.4 */
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK  (0x3 << 0)
 # define DP_DSC_MAX_BITS_PER_PIXEL_HI_SHIFT 8
+# define DP_DSC_MAX_BPP_DELTA_VERSION_MASK  0x06
+# define DP_DSC_MAX_BPP_DELTA_AVAILABILITY  0x08
 
 #define DP_DSC_DEC_COLOR_FORMAT_CAP         0x069
 # define DP_DSC_RGB                         (1 << 0)
@@ -351,11 +357,13 @@ struct drm_panel;
 # define DP_DSC_24_PER_DP_DSC_SINK          (1 << 2)
 
 #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
+# define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
+# define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
 # define DP_DSC_BITS_PER_PIXEL_1_16         0x0
 # define DP_DSC_BITS_PER_PIXEL_1_8          0x1
 # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
 # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
-# define DP_DSC_BITS_PER_PIXEL_1            0x4
+# define DP_DSC_BITS_PER_PIXEL_1_1          0x4
 
 #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
 # define DP_PSR_IS_SUPPORTED                1
@@ -1825,6 +1833,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
 					 u8 dsc_bpc[3]);
+u8 drm_dp_dsc_sink_bpp_increment_div(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-- 
2.24.1.485.gad05a3d8e5

