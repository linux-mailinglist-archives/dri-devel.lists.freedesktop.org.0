Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46670A57098
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 19:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605310E6B0;
	Fri,  7 Mar 2025 18:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jp3H5PjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626A10E69D;
 Fri,  7 Mar 2025 18:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372316; x=1772908316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xAPoOl5E6d6FFqkDAmVH1nYHQECWj7e0x4LjKlRP2os=;
 b=jp3H5PjSpbzu6XetAUezK6UHEtNbuwX98Ss+LY+BMxxzcFTrk2rHs6sV
 TNb4OvoF6AYeULG/D3e4vTA/wOtiTaralXKYFk8WbwamC51Iwli5cq2Yg
 vnAI61hGcJo6AEodGbY4TamPw5leEYhPbqtWJTYZxE7GlCY1VAoxsB3jJ
 0L0gsBDBsORWCb6hB6OSaMj0YyrGQrUFdzFDOySzMTxpc++fD/oj+9D0F
 t9h3UHcfGj/S1qRagOi82j+0U5cgOdyy7sKE+Z5Bo/YSOburMG9t0gRqG
 HjAajm14ffoc6LusgwLoyBF55FmDERGZxLJhanU3k+kczNbqUB2X3junx w==;
X-CSE-ConnectionGUID: wehW+klIQ82r0/xQPXheHQ==
X-CSE-MsgGUID: OkJakdSdSp2UD3nk2sl75A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53068599"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53068599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:31:55 -0800
X-CSE-ConnectionGUID: CSVWqhpaSY+g8/AVtpBBYw==
X-CSE-MsgGUID: IerteWPUQVm6CrmeYL8Tow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119336588"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:31:54 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Wayne Lin <Wayne.Lin@amd.com>, Lyude Paul <lyude@redhat.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/dp_mst: Fix locking when skipping CSN before topology
 probing
Date: Fri,  7 Mar 2025 20:31:52 +0200
Message-ID: <20250307183152.3822170-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

The handling of the MST Connection Status Notify message is skipped if
the probing of the topology is still pending. Acquiring the
drm_dp_mst_topology_mgr::probe_lock for this in
drm_dp_mst_handle_up_req() is problematic: the task/work this function
is called from is also responsible for handling MST down-request replies
(in drm_dp_mst_handle_down_rep()). Thus drm_dp_mst_link_probe_work() -
holding already probe_lock - could be blocked waiting for an MST
down-request reply while drm_dp_mst_handle_up_req() is waiting for
probe_lock while processing a CSN message. This leads to the probe
work's down-request message timing out.

A scenario similar to the above leading to a down-request timeout is
handling a CSN message in drm_dp_mst_handle_conn_stat(), holding the
probe_lock and sending down-request messages while a second CSN message
sent by the sink subsequently is handled by drm_dp_mst_handle_up_req().

Fix the above by moving the logic to skip the CSN handling to
drm_dp_mst_process_up_req(). This function is called from a work
(separate from the task/work handling new up/down messages), already
holding probe_lock. This solves the above timeout issue, since handling
of down-request replies won't be blocked by probe_lock.

Fixes: ddf983488c3e ("drm/dp_mst: Skip CSN if topology probing is not done yet")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # v6.6+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8b68bb3fbffb0..3a1f1ffc7b552 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4036,6 +4036,22 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	return 0;
 }
 
+static bool primary_mstb_probing_is_done(struct drm_dp_mst_topology_mgr *mgr)
+{
+	bool probing_done = false;
+
+	mutex_lock(&mgr->lock);
+
+	if (mgr->mst_primary && drm_dp_mst_topology_try_get_mstb(mgr->mst_primary)) {
+		probing_done = mgr->mst_primary->link_address_sent;
+		drm_dp_mst_topology_put_mstb(mgr->mst_primary);
+	}
+
+	mutex_unlock(&mgr->lock);
+
+	return probing_done;
+}
+
 static inline bool
 drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 			  struct drm_dp_pending_up_req *up_req)
@@ -4066,8 +4082,12 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* TODO: Add missing handler for DP_RESOURCE_STATUS_NOTIFY events */
 	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
-		dowork = drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
-		hotplug = true;
+		if (!primary_mstb_probing_is_done(mgr)) {
+			drm_dbg_kms(mgr->dev, "Got CSN before finish topology probing. Skip it.\n");
+		} else {
+			dowork = drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
+			hotplug = true;
+		}
 	}
 
 	drm_dp_mst_topology_put_mstb(mstb);
@@ -4149,10 +4169,11 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_send_up_ack_reply(mgr, mst_primary, up_req->msg.req_type,
 				 false);
 
+	drm_dp_mst_topology_put_mstb(mst_primary);
+
 	if (up_req->msg.req_type == DP_CONNECTION_STATUS_NOTIFY) {
 		const struct drm_dp_connection_status_notify *conn_stat =
 			&up_req->msg.u.conn_stat;
-		bool handle_csn;
 
 		drm_dbg_kms(mgr->dev, "Got CSN: pn: %d ldps:%d ddps: %d mcs: %d ip: %d pdt: %d\n",
 			    conn_stat->port_number,
@@ -4161,16 +4182,6 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 			    conn_stat->message_capability_status,
 			    conn_stat->input_port,
 			    conn_stat->peer_device_type);
-
-		mutex_lock(&mgr->probe_lock);
-		handle_csn = mst_primary->link_address_sent;
-		mutex_unlock(&mgr->probe_lock);
-
-		if (!handle_csn) {
-			drm_dbg_kms(mgr->dev, "Got CSN before finish topology probing. Skip it.");
-			kfree(up_req);
-			goto out_put_primary;
-		}
 	} else if (up_req->msg.req_type == DP_RESOURCE_STATUS_NOTIFY) {
 		const struct drm_dp_resource_status_notify *res_stat =
 			&up_req->msg.u.resource_stat;
@@ -4185,9 +4196,6 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	list_add_tail(&up_req->next, &mgr->up_req_list);
 	mutex_unlock(&mgr->up_req_lock);
 	queue_work(system_long_wq, &mgr->up_req_work);
-
-out_put_primary:
-	drm_dp_mst_topology_put_mstb(mst_primary);
 out_clear_reply:
 	reset_msg_rx_state(&mgr->up_req_recv);
 	return ret;
-- 
2.44.2

