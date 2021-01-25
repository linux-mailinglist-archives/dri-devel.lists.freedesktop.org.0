Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D76302902
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 18:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0260D89A76;
	Mon, 25 Jan 2021 17:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39189A74;
 Mon, 25 Jan 2021 17:36:41 +0000 (UTC)
IronPort-SDR: QUSBVoUcBPUo/dvQ2EJKfHLs5xGkkhpy+kKc8ONhwD+RVRvcnkVV9xWgxbALmShfihtJKB2gJX
 kLDBXMvQ5nVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198548760"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="198548760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 09:36:40 -0800
IronPort-SDR: vgcu1GNmi57TdNrpab78XpsZHoQXiP78L00DoQXG1C45CXV+L2z6cbKQAiOjkujaGF5IKLZDP+
 X88HhnAZcleg==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="368762489"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 09:36:38 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp/mst: Export drm_dp_get_vc_payload_bw()
Date: Mon, 25 Jan 2021 19:36:35 +0200
Message-Id: <20210125173636.1733812-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Ville Syrjala <ville.syrjala@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function will be needed by the next patch where the driver
calculates the BW based on driver specific parameters, so export it.

At the same time sanitize the function params, passing the more natural
link rate instead of the encoding of the same rate.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjala <ville.syrjala@intel.com>
Cc: <stable@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++++++++++------
 include/drm/drm_dp_mst_helper.h       |  1 +
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 475939138b21..dc96cbf78cc6 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3629,14 +3629,26 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
 	return 0;
 }
 
-static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
+/**
+ * drm_dp_get_vc_payload_bw - get the VC payload BW for an MST link
+ * @rate: link rate in 10kbits/s units
+ * @lane_count: lane count
+ *
+ * Calculate the toal bandwidth of a MultiStream Transport link. The returned
+ * value is in units of PBNs/(timeslots/1 MTP). This value can be used to
+ * convert the number of PBNs required for a given stream to the number of
+ * timeslots this stream requires in each MTP.
+ */
+int drm_dp_get_vc_payload_bw(int link_rate, int link_lane_count)
 {
-	if (dp_link_bw == 0 || dp_link_count == 0)
-		DRM_DEBUG_KMS("invalid link bandwidth in DPCD: %x (link count: %d)\n",
-			      dp_link_bw, dp_link_count);
+	if (link_rate == 0 || link_lane_count == 0)
+		DRM_DEBUG_KMS("invalid link rate/lane count: (%d / %d)\n",
+			      link_rate, link_lane_count);
 
-	return dp_link_bw * dp_link_count / 2;
+	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
+	return link_rate * link_lane_count / 54000;
 }
+EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
 
 /**
  * drm_dp_read_mst_cap() - check whether or not a sink supports MST
@@ -3692,7 +3704,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			goto out_unlock;
 		}
 
-		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr->dpcd[1],
+		mgr->pbn_div = drm_dp_get_vc_payload_bw(drm_dp_bw_code_to_link_rate(mgr->dpcd[1]),
 							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
 		if (mgr->pbn_div == 0) {
 			ret = -EINVAL;
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index f5e92fe9151c..bd1c39907b92 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -783,6 +783,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+int drm_dp_get_vc_payload_bw(int link_rate, int link_lane_count);
 
 int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
