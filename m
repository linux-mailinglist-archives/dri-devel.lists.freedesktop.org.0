Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D5331E10
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 05:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084566E479;
	Tue,  9 Mar 2021 04:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7C6E466;
 Tue,  9 Mar 2021 04:48:43 +0000 (UTC)
IronPort-SDR: 0//sxCUmggdQjToAITNIJ3S4DI1pNw1msGiaykUfravhCK8IxxCv3cSG0i+Q0w+Lw2J58Bg0If
 roPHRS1jgVnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184796076"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="184796076"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:48:43 -0800
IronPort-SDR: +6J33o/Grsnx8rboGahwPeg5w5K6YrmwslxsjKGMXEhklEIsBr3nD7NXZAC/9L03BjHdpZW5As
 UUOIzqVEyTiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="376369247"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 20:48:41 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/dp_helper: Define options for FRL training for
 HDMI2.1 PCON
Date: Tue,  9 Mar 2021 10:09:13 +0530
Message-Id: <20210309043915.1921-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
References: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
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
Cc: airlied@linux.ie, uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the FRL training mode (Concurrent, Sequential) and
training type (Normal, Extended) are not defined properly and
are passed as bool values in drm_helpers for pcon
configuration for FRL training.

This patch:
-Add register masks for Sequential and Normal FRL training options.
-Fixes the drm_helpers for FRL Training configuration to use the
 appropriate masks.
-Modifies the calls to the above drm_helpers in i915/intel_dp as per
 the above change.

v2: Re-used the register masks for these options, instead of enum. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c         | 24 ++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c | 10 ++++------
 include/drm/drm_dp_helper.h             |  6 ++++--
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index eedbb48815b7..cb2f53e56685 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -2635,14 +2635,16 @@ EXPORT_SYMBOL(drm_dp_pcon_is_frl_ready);
  * drm_dp_pcon_frl_configure_1() - Set HDMI LINK Configuration-Step1
  * @aux: DisplayPort AUX channel
  * @max_frl_gbps: maximum frl bw to be configured between PCON and HDMI sink
- * @concurrent_mode: true if concurrent mode or operation is required,
- * false otherwise.
+ * @frl_mode: FRL Training mode, it can be either Concurrent or Sequential.
+ * In Concurrent Mode, the FRL link bring up can be done along with
+ * DP Link training. In Sequential mode, the FRL link bring up is done prior to
+ * the DP Link training.
  *
  * Returns 0 if success, else returns negative error code.
  */
 
 int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
-				bool concurrent_mode)
+				u8 frl_mode)
 {
 	int ret;
 	u8 buf;
@@ -2651,7 +2653,7 @@ int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
 	if (ret < 0)
 		return ret;
 
-	if (concurrent_mode)
+	if (frl_mode == DP_PCON_ENABLE_CONCURRENT_LINK)
 		buf |= DP_PCON_ENABLE_CONCURRENT_LINK;
 	else
 		buf &= ~DP_PCON_ENABLE_CONCURRENT_LINK;
@@ -2694,21 +2696,23 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
  * drm_dp_pcon_frl_configure_2() - Set HDMI Link configuration Step-2
  * @aux: DisplayPort AUX channel
  * @max_frl_mask : Max FRL BW to be tried by the PCON with HDMI Sink
- * @extended_train_mode : true for Extended Mode, false for Normal Mode.
- * In Normal mode, the PCON tries each frl bw from the max_frl_mask starting
- * from min, and stops when link training is successful. In Extended mode, all
- * frl bw selected in the mask are trained by the PCON.
+ * @frl_type : FRL training type, can be Extended, or Normal.
+ * In Normal FRL training, the PCON tries each frl bw from the max_frl_mask
+ * starting from min, and stops when link training is successful. In Extended
+ * FRL training, all frl bw selected in the mask are trained by the PCON.
  *
  * Returns 0 if success, else returns negative error code.
  */
 int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
-				bool extended_train_mode)
+				u8 frl_type)
 {
 	int ret;
 	u8 buf = max_frl_mask;
 
-	if (extended_train_mode)
+	if (frl_type == DP_PCON_FRL_LINK_TRAIN_EXTENDED)
 		buf |= DP_PCON_FRL_LINK_TRAIN_EXTENDED;
+	else
+		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
 	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4f89e0de5dde..85ec74ae952e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2557,10 +2557,6 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 
 static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
 {
-#define PCON_EXTENDED_TRAIN_MODE (1 > 0)
-#define PCON_CONCURRENT_MODE (1 > 0)
-#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
-#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE
 #define TIMEOUT_FRL_READY_MS 500
 #define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
 
@@ -2594,10 +2590,12 @@ static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
 		return -ETIMEDOUT;
 
 	max_frl_bw_mask = intel_dp_pcon_set_frl_mask(max_frl_bw);
-	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw, PCON_SEQUENTIAL_MODE);
+	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw,
+					  DP_PCON_ENABLE_SEQUENTIAL_LINK);
 	if (ret < 0)
 		return ret;
-	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask, PCON_NORMAL_TRAIN_MODE);
+	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask,
+					  DP_PCON_FRL_LINK_TRAIN_NORMAL);
 	if (ret < 0)
 		return ret;
 	ret = drm_dp_pcon_frl_enable(&intel_dp->aux);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index edffd1dcca3e..f1c7e09728d4 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1171,6 +1171,7 @@ struct drm_device;
 # define DP_PCON_ENABLE_MAX_BW_48GBPS	       6
 # define DP_PCON_ENABLE_SOURCE_CTL_MODE       (1 << 3)
 # define DP_PCON_ENABLE_CONCURRENT_LINK       (1 << 4)
+# define DP_PCON_ENABLE_SEQUENTIAL_LINK       (0 << 4)
 # define DP_PCON_ENABLE_LINK_FRL_MODE         (1 << 5)
 # define DP_PCON_ENABLE_HPD_READY	      (1 << 6)
 # define DP_PCON_ENABLE_HDMI_LINK             (1 << 7)
@@ -1185,6 +1186,7 @@ struct drm_device;
 # define DP_PCON_FRL_BW_MASK_40GBPS           (1 << 4)
 # define DP_PCON_FRL_BW_MASK_48GBPS           (1 << 5)
 # define DP_PCON_FRL_LINK_TRAIN_EXTENDED      (1 << 6)
+# define DP_PCON_FRL_LINK_TRAIN_NORMAL        (0 << 6)
 
 /* PCON HDMI LINK STATUS */
 #define DP_PCON_HDMI_TX_LINK_STATUS           0x303B
@@ -2149,9 +2151,9 @@ int drm_dp_get_pcon_max_frl_bw(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_ready_hpd);
 bool drm_dp_pcon_is_frl_ready(struct drm_dp_aux *aux);
 int drm_dp_pcon_frl_configure_1(struct drm_dp_aux *aux, int max_frl_gbps,
-				bool concurrent_mode);
+				u8 frl_mode);
 int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
-				bool extended_train_mode);
+				u8 frl_type);
 int drm_dp_pcon_reset_frl_config(struct drm_dp_aux *aux);
 int drm_dp_pcon_frl_enable(struct drm_dp_aux *aux);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
