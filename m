Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBD7EA46C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B0410E411;
	Mon, 13 Nov 2023 20:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9941C10E410;
 Mon, 13 Nov 2023 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699906275; x=1731442275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JRsCBbkvD1Y84ofNkeetVXUr8bjqrGeMKeJ8ALre8Y=;
 b=R7CwpoH4djwJYtoOsr0UQUDvg4mKkdE6kmYAcMbqyFIRJSAEsQNTBTCa
 DlZoDVG1ugxUTjuUS5S9Uu/V6M0tlMv+/17myIvLTh13gEHRVG21Oz9Ih
 mezqx1SkdnDS7L3ij+h7udY0+NfcSp4unOhwfNB4tUVSYKgwpPSzjvcPT
 WhMKitlKFDEUMiwVAnZywfuSBTjZsmUWUf4CYAg4aFMMxawS7kLvVV48K
 jOFXyhnY2JhUjD8YkBzq5nw2XszTyd6x/89HLLtyYmWrqYzfWaJgU3EA5
 GL14leofCMRuporFBZJtjf3Vwtkz/HW05yKu4ZAeY/jdix9DWVilIccAe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3553666"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3553666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937829890"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937829890"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:11:13 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/dp_mst: Fix PBN divider calculation for UHBR rates
Date: Mon, 13 Nov 2023 22:11:10 +0200
Message-Id: <20231113201110.510724-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113201110.510724-1-imre.deak@intel.com>
References: <20231113201110.510724-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current way of calculating the pbn_div value, the link BW per each
MTP slot, worked only for DP 1.4 link rates. Fix things up for UHBR
rates calculating with the correct channel coding efficiency based on
the link rate.

On UHBR the resulting pbn_div value is not an integer (vs. DP 1.4 where
the value is always an integer), so ideally a scaled value containing
the fractional part should be returned, so that the PBN -> MTP slot
count (aka TU size) conversion can be done with less error. For now
return a rounded-down value - which can result in +1 excess MTP slot
getting allocated on UHBR links.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 15 +++++++++++++--
 include/drm/display/drm_dp_helper.h           | 13 +++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 4d72c9a32026e..940a9fc0d0244 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3582,12 +3582,23 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
 int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count)
 {
+	int ret;
+
 	if (link_rate == 0 || link_lane_count == 0)
 		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
 			    link_rate, link_lane_count);
 
-	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
-	return link_rate * link_lane_count / 54000;
+	/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
+	/*
+	 * TODO: Return the value with a higher precision, allowing a better
+	 * slots per MTP allocation granularity. With the current returned
+	 * value +1 slot/MTP can get allocated on UHBR links.
+	 */
+	ret = mul_u32_u32(link_rate * link_lane_count,
+			  drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate))) /
+	      (1000000ULL * 8 * 5400);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index caee29d28463c..18ff6af0b5a31 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -251,6 +251,19 @@ drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
 	return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
 }
 
+/**
+ * drm_dp_is_uhbr_rate - Determine if a link rate is UHBR
+ * @link_rate: link rate in 10kbits/s units
+ *
+ * Determine if the provided link rate is an UHBR rate.
+ *
+ * Returns: %True if @link_rate is an UHBR rate.
+ */
+static inline bool drm_dp_is_uhbr_rate(int link_rate)
+{
+	return link_rate >= 1000000;
+}
+
 /*
  * DisplayPort AUX channel
  */
-- 
2.39.2

