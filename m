Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB1A312F67
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 11:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793486E862;
	Mon,  8 Feb 2021 10:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88016E862
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 10:48:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 598FC64EC3;
 Mon,  8 Feb 2021 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612781301;
 bh=iYgDUkQIrJ1qqSDyi3foq9yAocPe+jn0Y6oA3ur6jr4=;
 h=Subject:To:Cc:From:Date:From;
 b=UptyZzqMO9ahjUmNNAY+fs+SprghHAzCYqs6hKZrCgS4FI3Fa6dmWd3Qm1KMlOBnG
 XSDEeQBApc+p3JnUFK0uo6a2V8XN+LWyQBtl8HVDZb+8ecl9DFPqUmWgY9gOfbmBlQ
 2+752W2/x+yv+ExPiwyUwvgE0hsh51QqjtalfSvc=
Subject: Patch "drm/dp/mst: Export drm_dp_get_vc_payload_bw()" has been added
 to the 5.10-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 imre.deak@intel.com, jani.nikula@intel.com, lyude@redhat.com,
 ville.syrjala@intel.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 08 Feb 2021 11:47:42 +0100
Message-ID: <1612781262215@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/dp/mst: Export drm_dp_get_vc_payload_bw()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp-mst-export-drm_dp_get_vc_payload_bw.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 83404d581471775f37f85e5261ec0d09407d8bed Mon Sep 17 00:00:00 2001
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 25 Jan 2021 19:36:35 +0200
Subject: drm/dp/mst: Export drm_dp_get_vc_payload_bw()

From: Imre Deak <imre.deak@intel.com>

commit 83404d581471775f37f85e5261ec0d09407d8bed upstream.

This function will be needed by the next patch where the driver
calculates the BW based on driver specific parameters, so export it.

At the same time sanitize the function params, passing the more natural
link rate instead of the encoding of the same rate.

v2:
- Fix function documentation. (Lyude)

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjala <ville.syrjala@intel.com>
Cc: <stable@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210125173636.1733812-1-imre.deak@intel.com
(cherry picked from commit a321fc2b4e60fc1b39517d26c8104351636a6062)
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c |   24 ++++++++++++++++++------
 include/drm/drm_dp_mst_helper.h       |    1 +
 2 files changed, 19 insertions(+), 6 deletions(-)

--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3629,14 +3629,26 @@ static int drm_dp_send_up_ack_reply(stru
 	return 0;
 }
 
-static int drm_dp_get_vc_payload_bw(u8 dp_link_bw, u8  dp_link_count)
+/**
+ * drm_dp_get_vc_payload_bw - get the VC payload BW for an MST link
+ * @link_rate: link rate in 10kbits/s units
+ * @link_lane_count: lane count
+ *
+ * Calculate the total bandwidth of a MultiStream Transport link. The returned
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
@@ -3692,7 +3704,7 @@ int drm_dp_mst_topology_mgr_set_mst(stru
 			goto out_unlock;
 		}
 
-		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr->dpcd[1],
+		mgr->pbn_div = drm_dp_get_vc_payload_bw(drm_dp_bw_code_to_link_rate(mgr->dpcd[1]),
 							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
 		if (mgr->pbn_div == 0) {
 			ret = -EINVAL;
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -783,6 +783,7 @@ drm_dp_mst_detect_port(struct drm_connec
 
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+int drm_dp_get_vc_payload_bw(int link_rate, int link_lane_count);
 
 int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
 


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-5.10/drm-i915-power-up-combo-phy-lanes-for-for-hdmi-as-well.patch
queue-5.10/drm-dp-mst-export-drm_dp_get_vc_payload_bw.patch
queue-5.10/drm-i915-extract-intel_ddi_power_up_lanes.patch
queue-5.10/drm-i915-fix-the-mst-pbn-divider-calculation.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
