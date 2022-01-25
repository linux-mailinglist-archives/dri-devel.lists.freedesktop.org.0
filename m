Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241B49B9A6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBA10E282;
	Tue, 25 Jan 2022 17:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3B10E282;
 Tue, 25 Jan 2022 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643130456; x=1674666456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BlOQpdfhlUGrpR7FcPdJTtZxLW3DD4M5a2lrzKND/Bo=;
 b=ccAdszJDLzncA9jQs5Oq3M92AOy+royEaBi8u70GDf0qzccq7jV+3PN7
 mP4GiZESq9uloDNfJd+NEvBsT1+hSNQ4cTq3aM+n6rBnQqcfFT73HK/Kb
 K+3uTZEY9wLMeTHh+9Es2WpDAAFUFwRHDMSvvCttTeuUBeRpxWObXPXaS
 Fa71qEOqtEkWx64HcWZX8kTBIfNoRNGpCWPjWito0WQpAGAAd7YhQ942D
 aBkvVjxyF02bTLxtGe1tYQnn9i1ek15QJUyDnvK2M64mqveZdQreUGTtl
 xQsvPV4QZMcR6HmAzPxb+gvitVMtru+21aU1wNd2uvJB8N1d/iQTfHIm6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226330236"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="226330236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="534810004"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/dp: add 128b/132b link status helpers from DP 2.0 E11
Date: Tue, 25 Jan 2022 19:03:40 +0200
Message-Id: <31343359d276c6adad1d4407ee3d3605c3aeada2.1643130139.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643130139.git.jani.nikula@intel.com>
References: <cover.1643130139.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP 2.0 errata redefines link training. There are some new status
bits, and some of the old ones need to be checked independently. Add
helpers to do this.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c    | 63 ++++++++++++++++++++++++++++++++++
 include/drm/dp/drm_dp_helper.h | 19 +++++++---
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 52c6da510142..a20b0f8f24b8 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -144,6 +144,69 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
 }
 EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
 
+/* DP 2.0 errata for 128b/132b */
+bool drm_dp_128b132b_lane_channel_eq_done(const u8 link_status[DP_LINK_STATUS_SIZE],
+					  int lane_count)
+{
+	u8 lane_align, lane_status;
+	int lane;
+
+	lane_align = dp_link_status(link_status, DP_LANE_ALIGN_STATUS_UPDATED);
+	if (!(lane_align & DP_INTERLANE_ALIGN_DONE))
+		return false;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = dp_get_lane_status(link_status, lane);
+		if (!(lane_status & DP_LANE_CHANNEL_EQ_DONE))
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_lane_channel_eq_done);
+
+/* DP 2.0 errata for 128b/132b */
+bool drm_dp_128b132b_lane_symbol_locked(const u8 link_status[DP_LINK_STATUS_SIZE],
+					int lane_count)
+{
+	u8 lane_status;
+	int lane;
+
+	for (lane = 0; lane < lane_count; lane++) {
+		lane_status = dp_get_lane_status(link_status, lane);
+		if (!(lane_status & DP_LANE_SYMBOL_LOCKED))
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_lane_symbol_locked);
+
+/* DP 2.0 errata for 128b/132b */
+bool drm_dp_128b132b_eq_interlane_align_done(const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	u8 status = dp_link_status(link_status, DP_LANE_ALIGN_STATUS_UPDATED);
+
+	return status & DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_eq_interlane_align_done);
+
+/* DP 2.0 errata for 128b/132b */
+bool drm_dp_128b132b_cds_interlane_align_done(const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	u8 status = dp_link_status(link_status, DP_LANE_ALIGN_STATUS_UPDATED);
+
+	return status & DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_cds_interlane_align_done);
+
+/* DP 2.0 errata for 128b/132b */
+bool drm_dp_128b132b_link_training_failed(const u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	u8 status = dp_link_status(link_status, DP_LANE_ALIGN_STATUS_UPDATED);
+
+	return status & DP_128B132B_LT_FAILED;
+}
+EXPORT_SYMBOL(drm_dp_128b132b_link_training_failed);
+
 u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
 					 unsigned int lane)
 {
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index aa73dfc817ff..c499d735b992 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -738,11 +738,13 @@ struct drm_panel;
 			    DP_LANE_CHANNEL_EQ_DONE |	\
 			    DP_LANE_SYMBOL_LOCKED)
 
-#define DP_LANE_ALIGN_STATUS_UPDATED	    0x204
-
-#define DP_INTERLANE_ALIGN_DONE		    (1 << 0)
-#define DP_DOWNSTREAM_PORT_STATUS_CHANGED   (1 << 6)
-#define DP_LINK_STATUS_UPDATED		    (1 << 7)
+#define DP_LANE_ALIGN_STATUS_UPDATED                    0x204
+#define  DP_INTERLANE_ALIGN_DONE                        (1 << 0)
+#define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 E11 */
+#define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 E11 */
+#define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 E11 */
+#define  DP_DOWNSTREAM_PORT_STATUS_CHANGED              (1 << 6)
+#define  DP_LINK_STATUS_UPDATED                         (1 << 7)
 
 #define DP_SINK_STATUS			    0x205
 # define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
@@ -1551,6 +1553,13 @@ void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
 					      const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 
 int drm_dp_128b132b_read_aux_rd_interval(struct drm_dp_aux *aux);
+bool drm_dp_128b132b_lane_channel_eq_done(const u8 link_status[DP_LINK_STATUS_SIZE],
+					  int lane_count);
+bool drm_dp_128b132b_lane_symbol_locked(const u8 link_status[DP_LINK_STATUS_SIZE],
+					int lane_count);
+bool drm_dp_128b132b_eq_interlane_align_done(const u8 link_status[DP_LINK_STATUS_SIZE]);
+bool drm_dp_128b132b_cds_interlane_align_done(const u8 link_status[DP_LINK_STATUS_SIZE]);
+bool drm_dp_128b132b_link_training_failed(const u8 link_status[DP_LINK_STATUS_SIZE]);
 
 u8 drm_dp_link_rate_to_bw_code(int link_rate);
 int drm_dp_bw_code_to_link_rate(u8 link_bw);
-- 
2.30.2

