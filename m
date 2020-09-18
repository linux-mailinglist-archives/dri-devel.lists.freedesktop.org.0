Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13726FBB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F06E156;
	Fri, 18 Sep 2020 11:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A58E6E156
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 11:40:23 +0000 (UTC)
IronPort-SDR: yL1z3qV3pQpUhHmsK1QOcTwsTtzbkqzVuR5HcjYSTodZ0p/JTqYu7WYGV43s5Dlq8798DS9K8y
 x2lJ1GEmFXhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147657271"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147657271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:40:22 -0700
IronPort-SDR: Ufx8WAyu52x7b6o6GHMePeYSlfPQeptn8/49quqftyRKVmXbItS1MO0hE462f/OUK7f+Bkg5E5
 yMZOWGQ9mHVQ==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="332579689"
Received: from bjfitton-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.83.18])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:40:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dp: add a number of DP 2.0 DPCD definitions
Date: Fri, 18 Sep 2020 14:40:17 +0300
Message-Id: <20200918114017.30198-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200918114017.30198-1-jani.nikula@intel.com>
References: <20200918114017.30198-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for future with DP 2.0 DPCD definitions, with a couple of
related drive-by cleanups. No functional changes.

v2: Send the version that actually builds.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_dp_helper.h | 52 ++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 388083b4716b..e144b4b9d79a 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -125,6 +125,7 @@ struct drm_device;
 
 #define DP_MAX_DOWNSPREAD                   0x003
 # define DP_MAX_DOWNSPREAD_0_5		    (1 << 0)
+# define DP_STREAM_REGENERATION_STATUS_CAP  (1 << 1) /* 2.0 */
 # define DP_NO_AUX_HANDSHAKE_LINK_TRAINING  (1 << 6)
 # define DP_TPS4_SUPPORTED                  (1 << 7)
 
@@ -142,6 +143,7 @@ struct drm_device;
 
 #define DP_MAIN_LINK_CHANNEL_CODING         0x006
 # define DP_CAP_ANSI_8B10B		    (1 << 0)
+# define DP_CAP_ANSI_128B132B               (1 << 1) /* 2.0 */
 
 #define DP_DOWN_STREAM_PORT_COUNT	    0x007
 # define DP_PORT_COUNT_MASK		    0x0f
@@ -185,8 +187,14 @@ struct drm_device;
 #define DP_FAUX_CAP			    0x020   /* 1.2 */
 # define DP_FAUX_CAP_1			    (1 << 0)
 
+#define DP_SINK_VIDEO_FALLBACK_FORMATS      0x020   /* 2.0 */
+# define DP_FALLBACK_1024x768_60HZ_24BPP    (1 << 0)
+# define DP_FALLBACK_1280x720_60HZ_24BPP    (1 << 1)
+# define DP_FALLBACK_1920x1080_60HZ_24BPP   (1 << 2)
+
 #define DP_MSTM_CAP			    0x021   /* 1.2 */
 # define DP_MST_CAP			    (1 << 0)
+# define DP_SINGLE_STREAM_SIDEBAND_MSG      (1 << 1) /* 2.0 */
 
 #define DP_NUMBER_OF_AUDIO_ENDPOINTS	    0x022   /* 1.2 */
 
@@ -434,6 +442,9 @@ struct drm_device;
 # define DP_LINK_BW_2_7			    0x0a
 # define DP_LINK_BW_5_4			    0x14    /* 1.2 */
 # define DP_LINK_BW_8_1			    0x1e    /* 1.4 */
+# define DP_LINK_BW_10                      0x01    /* 2.0 128b/132b Link Layer */
+# define DP_LINK_BW_13_5                    0x04    /* 2.0 128b/132b Link Layer */
+# define DP_LINK_BW_20                      0x02    /* 2.0 128b/132b Link Layer */
 
 #define DP_LANE_COUNT_SET	            0x101
 # define DP_LANE_COUNT_MASK		    0x0f
@@ -485,12 +496,15 @@ struct drm_device;
 # define DP_TRAIN_PRE_EMPHASIS_SHIFT	    3
 # define DP_TRAIN_MAX_PRE_EMPHASIS_REACHED  (1 << 5)
 
+# define DP_TX_FFE_PRESET_VALUE_MASK        (0xf << 0) /* 2.0 128b/132b Link Layer */
+
 #define DP_DOWNSPREAD_CTRL		    0x107
 # define DP_SPREAD_AMP_0_5		    (1 << 4)
 # define DP_MSA_TIMING_PAR_IGNORE_EN	    (1 << 7) /* eDP */
 
 #define DP_MAIN_LINK_CHANNEL_CODING_SET	    0x108
 # define DP_SET_ANSI_8B10B		    (1 << 0)
+# define DP_SET_ANSI_128B132B               (1 << 1)
 
 #define DP_I2C_SPEED_CONTROL_STATUS	    0x109   /* DPI */
 /* bitmask as for DP_I2C_SPEED_CAP */
@@ -509,8 +523,19 @@ struct drm_device;
 # define DP_LINK_QUAL_PATTERN_ERROR_RATE    2
 # define DP_LINK_QUAL_PATTERN_PRBS7	    3
 # define DP_LINK_QUAL_PATTERN_80BIT_CUSTOM  4
-# define DP_LINK_QUAL_PATTERN_HBR2_EYE      5
-# define DP_LINK_QUAL_PATTERN_MASK	    7
+# define DP_LINK_QUAL_PATTERN_CP2520_PAT_1  5
+# define DP_LINK_QUAL_PATTERN_CP2520_PAT_2  6
+# define DP_LINK_QUAL_PATTERN_CP2520_PAT_3  7
+/* DP 2.0 UHBR10, UHBR13.5, UHBR20 */
+# define DP_LINK_QUAL_PATTERN_128B132B_TPS1 0x08
+# define DP_LINK_QUAL_PATTERN_128B132B_TPS2 0x10
+# define DP_LINK_QUAL_PATTERN_PRSBS9        0x18
+# define DP_LINK_QUAL_PATTERN_PRSBS11       0x20
+# define DP_LINK_QUAL_PATTERN_PRSBS15       0x28
+# define DP_LINK_QUAL_PATTERN_PRSBS23       0x30
+# define DP_LINK_QUAL_PATTERN_PRSBS31       0x38
+# define DP_LINK_QUAL_PATTERN_CUSTOM        0x40
+# define DP_LINK_QUAL_PATTERN_SQUARE        0x48
 
 #define DP_TRAINING_LANE0_1_SET2	    0x10f
 #define DP_TRAINING_LANE2_3_SET2	    0x110
@@ -613,9 +638,9 @@ struct drm_device;
 #define DP_LINK_STATUS_UPDATED		    (1 << 7)
 
 #define DP_SINK_STATUS			    0x205
-
-#define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
-#define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
+# define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
+# define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
+# define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
 
 #define DP_ADJUST_REQUEST_LANE0_1	    0x206
 #define DP_ADJUST_REQUEST_LANE2_3	    0x207
@@ -628,6 +653,12 @@ struct drm_device;
 # define DP_ADJUST_PRE_EMPHASIS_LANE1_MASK   0xc0
 # define DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT  6
 
+/* DP 2.0 128b/132b Link Layer */
+# define DP_ADJUST_TX_FFE_PRESET_LANE0_MASK  (0xf << 0)
+# define DP_ADJUST_TX_FFE_PRESET_LANE0_SHIFT 0
+# define DP_ADJUST_TX_FFE_PRESET_LANE1_MASK  (0xf << 4)
+# define DP_ADJUST_TX_FFE_PRESET_LANE1_SHIFT 4
+
 #define DP_ADJUST_REQUEST_POST_CURSOR2      0x20c
 # define DP_ADJUST_POST_CURSOR2_LANE0_MASK  0x03
 # define DP_ADJUST_POST_CURSOR2_LANE0_SHIFT 0
@@ -945,9 +976,8 @@ struct drm_device;
 #define DP_LANE_ALIGN_STATUS_UPDATED_ESI       0x200e /* status same as 0x204 */
 #define DP_SINK_STATUS_ESI                     0x200f /* status same as 0x205 */
 
-/* Extended Receiver Capability */
+/* Extended Receiver Capability: See DP_DPCD_REV for definitions */
 #define DP_DP13_DPCD_REV                    0x2200
-#define DP_DP13_MAX_LINK_RATE               0x2201
 
 #define DP_DPRX_FEATURE_ENUMERATION_LIST    0x2210  /* DP 1.3 */
 # define DP_GTC_CAP					(1 << 0)  /* DP 1.3 */
@@ -959,6 +989,14 @@ struct drm_device;
 # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
 # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
 
+#define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
+# define DP_UHBR10                             (1 << 0)
+# define DP_UHBR20                             (1 << 1)
+# define DP_UHBR13_5                           (1 << 2)
+
+#define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
+# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
+
 /* Protocol Converter Extension */
 /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
 #define DP_CEC_TUNNELING_CAPABILITY            0x3000
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
