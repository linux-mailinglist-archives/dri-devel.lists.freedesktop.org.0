Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9A4C79D8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE7B10E5A5;
	Mon, 28 Feb 2022 20:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9459310E5A5;
 Mon, 28 Feb 2022 20:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646079159; x=1677615159;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9cnbgpAsySUJWgMlN0OHSrXFIPGJoJYPRJmKO6+heXI=;
 b=VNTK3j7ZoDwcQVt6cP5xnWlkoMf9YPagXCCwd1yYIwKdT1XNUAle6W8u
 5sImWbr37NzVysyibugyvSU1nhOxLYAm/K9nINtiYYwZ5UTU8sh7VSD/O
 DKElqWKfnp2EKJCn72035vYfPLM3yTRt5vXYdjd+FyCfI6Gjpn3b5kOMd
 wjxsSxIv9bh3QvizkT9EOTZYUBCBcLoTpjnyi2XI65CRJ0Yl0XzJRAIoF
 gaKpUTDkFHl9wZk5L6qLFsh1WpPFOR42h6nKbmHgj700eiYcPzQxYak5J
 HP6PAkQ2MZ0M9h2kZzHtjNWdVTbB192tPWlvKoPq2ssnRUrqYAx+KLxHf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339409846"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="339409846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 12:12:38 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="593345605"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 12:12:36 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add a DP1.2 compatible way to read LTTPR
 capabilities
Date: Mon, 28 Feb 2022 22:12:34 +0200
Message-Id: <20220228201234.1448613-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At least some DELL monitors (P2715Q) with DPCD_REV 1.2 return corrupted
DPCD register values when reading from the 0xF0000- LTTPR range with an
AUX transaction block size bigger than 1. The DP standard requires 0 to
be returned - as for any other reserved/invalid addresses - but these
monitors return the DPCD_REV register value repeated in each byte of the
read buffer. This will in turn corrupt the values returned by the LTTPRs
between the source and the monitor: LTTPRs must adjust the values they
read from the downstream DPRX, for instance left-shift/init the
downstream DP_PHY_REPEATER_CNT value. Since the value returned by the
monitor's DPRX is non-zero the adjusted values will be corrupt.

Reading the LTTPR registers one-by-one instead of reading all of them
with a single AUX transfer works around the issue.

According to the DP standard's 0xF0000 register description:
"LTTPR-related registers at DPCD Addresses F0000h through F02FFh are
valid only for DPCD r1.4 (or higher)." While it's unclear if DPCD r1.4
refers to the DPCD_REV or to the
LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV register (tickets filed
at the VESA site to clarify this haven't been addressed), one
possibility is that it's a restriction due to non-compliant monitors
described above. Disabling the non-transparent LTTPR mode for all such
monitors is not a viable solution: the transparent LTTPR mode has its
own issue causing link training failures and this would affect a lot of
monitors in use with DPCD_REV < 1.4. Instead this patch works around
the problem by reading the LTTPR common and PHY cap registers one-by-one
for any monitor with a DPCD_REV < 1.4.

The standard requires the DPCD capabilites to be read after the LTTPR
common capabilities are read, so re-read the DPCD capabilities after
the LTTPR common and PHY caps were read out.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4531
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c                   | 58 ++++++++++++-------
 .../drm/i915/display/intel_dp_link_training.c | 30 +++++++---
 include/drm/dp/drm_dp_helper.h                |  2 +
 3 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 703972ae14c64..f3950d42980f9 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -2390,9 +2390,36 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
+				  u8 *buf, int buf_size)
+{
+	/*
+	 * Some monitors with a DPCD_REV < 0x14 return corrupted values when
+	 * reading from the 0xF0000- range with a block size bigger than 1.
+	 */
+	int block_size = dpcd[DP_DPCD_REV] < 0x14 ? 1 : buf_size;
+	int offset = 0;
+	int ret;
+
+	while (offset < buf_size) {
+		ret = drm_dp_dpcd_read(aux,
+				       address + offset,
+				       &buf[offset], block_size);
+		if (ret < 0)
+			return ret;
+
+		WARN_ON(ret != block_size);
+
+		offset += block_size;
+	}
+
+	return 0;
+}
+
 /**
  * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
  * @aux: DisplayPort AUX channel
+ * @dpcd: DisplayPort configuration data
  * @caps: buffer to return the capability info in
  *
  * Read capabilities common to all LTTPRs.
@@ -2400,25 +2427,19 @@ EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
  * Returns 0 on success or a negative error code on failure.
  */
 int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
+				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 {
-	int ret;
-
-	ret = drm_dp_dpcd_read(aux,
-			       DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
-			       caps, DP_LTTPR_COMMON_CAP_SIZE);
-	if (ret < 0)
-		return ret;
-
-	WARN_ON(ret != DP_LTTPR_COMMON_CAP_SIZE);
-
-	return 0;
+	return drm_dp_read_lttpr_regs(aux, dpcd,
+				      DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV,
+				      caps, DP_LTTPR_COMMON_CAP_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_read_lttpr_common_caps);
 
 /**
  * drm_dp_read_lttpr_phy_caps - read the capabilities for a given LTTPR PHY
  * @aux: DisplayPort AUX channel
+ * @dpcd: DisplayPort configuration data
  * @dp_phy: LTTPR PHY to read the capabilities for
  * @caps: buffer to return the capability info in
  *
@@ -2427,20 +2448,13 @@ EXPORT_SYMBOL(drm_dp_read_lttpr_common_caps);
  * Returns 0 on success or a negative error code on failure.
  */
 int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
+			       const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			       enum drm_dp_phy dp_phy,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE])
 {
-	int ret;
-
-	ret = drm_dp_dpcd_read(aux,
-			       DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy),
-			       caps, DP_LTTPR_PHY_CAP_SIZE);
-	if (ret < 0)
-		return ret;
-
-	WARN_ON(ret != DP_LTTPR_PHY_CAP_SIZE);
-
-	return 0;
+	return drm_dp_read_lttpr_regs(aux, dpcd,
+				      DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy),
+				      caps, DP_LTTPR_PHY_CAP_SIZE);
 }
 EXPORT_SYMBOL(drm_dp_read_lttpr_phy_caps);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 5d98773efd1b3..fbee20a76cf44 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -55,6 +55,7 @@ static u8 *intel_dp_lttpr_phy_caps(struct intel_dp *intel_dp,
 }
 
 static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
+					 const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 					 enum drm_dp_phy dp_phy)
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
@@ -63,7 +64,7 @@ static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
 
 	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
 
-	if (drm_dp_read_lttpr_phy_caps(&intel_dp->aux, dp_phy, phy_caps) < 0) {
+	if (drm_dp_read_lttpr_phy_caps(&intel_dp->aux, dpcd, dp_phy, phy_caps) < 0) {
 		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
 			    "[ENCODER:%d:%s][%s] failed to read the PHY caps\n",
 			    encoder->base.base.id, encoder->base.name, phy_name);
@@ -77,10 +78,11 @@ static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
 		    phy_caps);
 }
 
-static bool intel_dp_read_lttpr_common_caps(struct intel_dp *intel_dp)
+static bool intel_dp_read_lttpr_common_caps(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
+	int ret;
 
 	if (intel_dp_is_edp(intel_dp))
 		return false;
@@ -92,8 +94,9 @@ static bool intel_dp_read_lttpr_common_caps(struct intel_dp *intel_dp)
 	if (DISPLAY_VER(i915) < 10 || IS_GEMINILAKE(i915))
 		return false;
 
-	if (drm_dp_read_lttpr_common_caps(&intel_dp->aux,
-					  intel_dp->lttpr_common_caps) < 0)
+	ret = drm_dp_read_lttpr_common_caps(&intel_dp->aux, dpcd,
+					    intel_dp->lttpr_common_caps);
+	if (ret < 0)
 		goto reset_caps;
 
 	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
@@ -122,14 +125,14 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	return drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) == 1;
 }
 
-static int intel_dp_init_lttpr(struct intel_dp *intel_dp)
+static int intel_dp_init_lttpr(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
 	int lttpr_count;
 	int i;
 
-	if (!intel_dp_read_lttpr_common_caps(intel_dp))
+	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
 
 	lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
@@ -168,7 +171,7 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp)
 	}
 
 	for (i = 0; i < lttpr_count; i++)
-		intel_dp_read_lttpr_phy_caps(intel_dp, DP_PHY_LTTPR(i));
+		intel_dp_read_lttpr_phy_caps(intel_dp, dpcd, DP_PHY_LTTPR(i));
 
 	return lttpr_count;
 }
@@ -193,9 +196,18 @@ static int intel_dp_init_lttpr(struct intel_dp *intel_dp)
  */
 int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp)
 {
-	int lttpr_count = intel_dp_init_lttpr(intel_dp);
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	int lttpr_count;
 
-	/* The DPTX shall read the DPRX caps after LTTPR detection. */
+	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
+		return -EIO;
+
+	lttpr_count = intel_dp_init_lttpr(intel_dp, dpcd);
+
+	/*
+	 * The DPTX shall read the DPRX caps after LTTPR detection, so re-read
+	 * it here.
+	 */
 	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd)) {
 		intel_dp_reset_lttpr_common_caps(intel_dp);
 		return -EIO;
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 51e02cf75277e..1eccd97419436 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -2148,8 +2148,10 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
 int drm_dp_read_sink_count(struct drm_dp_aux *aux);
 
 int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
+				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
+			       const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			       enum drm_dp_phy dp_phy,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
-- 
2.27.0

