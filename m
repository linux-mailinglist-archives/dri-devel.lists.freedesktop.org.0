Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7679E21CB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8360B10EA60;
	Tue,  3 Dec 2024 15:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyY44Lqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A4A10EA60;
 Tue,  3 Dec 2024 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733239049; x=1764775049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ws80B7GwTSg0IfOuDKr6Q35GhuDc3x8/x7s8LwIWNes=;
 b=UyY44LqakD7lQKc+ah3WvAGjaMxi8gbSxmQD9VWjPkFuL9r91PgS1WAI
 pstfOPx3s+5VTq6Z59tmIrWOsvMupWsLDUP/32OpOvEzcPMECUxfYARZA
 MqC/R/BfHgZiIroVSHp6mMlDUcwEfdXYEtL7Dzouvk5+8wOSKb8XDkJFI
 MGSmbaMtVHbOfv0aUurkNEzmBFu28bYrXijigyKjRMCK9K8gioEvdqOYa
 Oyt5p1R8XZR5N+ZuJRObUJYAO2tTLCcO2BjWETq+qV1jSGMvu9AWWyURT
 kbSTbdMMSMoNEKWqvgumHypRIUfPGWWFABvtVFG+uFydFrv+D+au3eW0H g==;
X-CSE-ConnectionGUID: WN9tdDNbRumrTWTyZRQrbw==
X-CSE-MsgGUID: PfDh6QD3SZWAmour4lMQHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33708771"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33708771"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:28 -0800
X-CSE-ConnectionGUID: lbYoGE6xS/G4X6HTHfsVkA==
X-CSE-MsgGUID: qYS85CyzT/SyJUGXFc3y3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97526256"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 2/3] drm/dp: extract drm_dp_dpcd_write_payload()
Date: Tue,  3 Dec 2024 17:17:09 +0200
Message-Id: <f626715ba4e348546770750aa3e10fac73a5cbd7.1733238941.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733238940.git.jani.nikula@intel.com>
References: <cover.1733238940.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SST with 128b/132b channel coding needs this too. Extract to a separate
helper, independent of MST.

v2: Clean up kernel-doc a bit

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 57 +++++++++++++++++++
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 52 +----------------
 include/drm/display/drm_dp_helper.h           |  2 +
 3 files changed, 62 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index fdb55c462d64..55eca899ce18 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -792,6 +792,63 @@ static int read_payload_update_status(struct drm_dp_aux *aux)
 	return status;
 }
 
+/**
+ * drm_dp_dpcd_write_payload() - Write Virtual Channel information to payload table
+ * @aux: DisplayPort AUX channel
+ * @vcpid: Virtual Channel Payload ID
+ * @start_time_slot: Starting time slot
+ * @time_slot_count: Time slot count
+ *
+ * Write the Virtual Channel payload allocation table, checking the payload
+ * update status and retrying as necessary.
+ *
+ * Returns:
+ * 0 on success, negative error otherwise
+ */
+int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
+			      int vcpid, u8 start_time_slot, u8 time_slot_count)
+{
+	u8 payload_alloc[3], status;
+	int ret;
+	int retries = 0;
+
+	drm_dp_dpcd_writeb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
+			   DP_PAYLOAD_TABLE_UPDATED);
+
+	payload_alloc[0] = vcpid;
+	payload_alloc[1] = start_time_slot;
+	payload_alloc[2] = time_slot_count;
+
+	ret = drm_dp_dpcd_write(aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
+	if (ret != 3) {
+		drm_dbg_kms(aux->drm_dev, "failed to write payload allocation %d\n", ret);
+		goto fail;
+	}
+
+retry:
+	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
+	if (ret < 0) {
+		drm_dbg_kms(aux->drm_dev, "failed to read payload table status %d\n", ret);
+		goto fail;
+	}
+
+	if (!(status & DP_PAYLOAD_TABLE_UPDATED)) {
+		retries++;
+		if (retries < 20) {
+			usleep_range(10000, 20000);
+			goto retry;
+		}
+		drm_dbg_kms(aux->drm_dev, "status not set after read payload table status %d\n",
+			    status);
+		ret = -EINVAL;
+		goto fail;
+	}
+	ret = 0;
+fail:
+	return ret;
+}
+EXPORT_SYMBOL(drm_dp_dpcd_write_payload);
+
 /**
  * drm_dp_dpcd_poll_act_handled() - Poll for ACT handled status
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 32481628fa89..8da39b060f13 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -67,9 +67,6 @@ static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 
 static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
 
-static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
-				     int id, u8 start_slot, u8 num_slots);
-
 static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port,
 				 int offset, int size, u8 *bytes);
@@ -3266,7 +3263,7 @@ EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
 static int drm_dp_create_payload_at_dfp(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_dp_mst_atomic_payload *payload)
 {
-	return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,
+	return drm_dp_dpcd_write_payload(mgr->aux, payload->vcpi, payload->vc_start_slot,
 					 payload->time_slots);
 }
 
@@ -3297,7 +3294,7 @@ static void drm_dp_destroy_payload_at_remote_and_dfp(struct drm_dp_mst_topology_
 	}
 
 	if (payload->payload_allocation_status == DRM_DP_MST_PAYLOAD_ALLOCATION_DFP)
-		drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot, 0);
+		drm_dp_dpcd_write_payload(mgr->aux, payload->vcpi, payload->vc_start_slot, 0);
 }
 
 /**
@@ -3685,7 +3682,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			goto out_unlock;
 
 		/* Write reset payload */
-		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
+		drm_dp_dpcd_write_payload(mgr->aux, 0, 0, 0x3f);
 
 		drm_dp_mst_queue_probe_work(mgr);
 
@@ -4682,49 +4679,6 @@ void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_
 }
 EXPORT_SYMBOL(drm_dp_mst_update_slots);
 
-static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
-				     int id, u8 start_slot, u8 num_slots)
-{
-	u8 payload_alloc[3], status;
-	int ret;
-	int retries = 0;
-
-	drm_dp_dpcd_writeb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
-			   DP_PAYLOAD_TABLE_UPDATED);
-
-	payload_alloc[0] = id;
-	payload_alloc[1] = start_slot;
-	payload_alloc[2] = num_slots;
-
-	ret = drm_dp_dpcd_write(mgr->aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
-	if (ret != 3) {
-		drm_dbg_kms(mgr->dev, "failed to write payload allocation %d\n", ret);
-		goto fail;
-	}
-
-retry:
-	ret = drm_dp_dpcd_readb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
-	if (ret < 0) {
-		drm_dbg_kms(mgr->dev, "failed to read payload table status %d\n", ret);
-		goto fail;
-	}
-
-	if (!(status & DP_PAYLOAD_TABLE_UPDATED)) {
-		retries++;
-		if (retries < 20) {
-			usleep_range(10000, 20000);
-			goto retry;
-		}
-		drm_dbg_kms(mgr->dev, "status not set after read payload table status %d\n",
-			    status);
-		ret = -EINVAL;
-		goto fail;
-	}
-	ret = 0;
-fail:
-	return ret;
-}
-
 /**
  * drm_dp_check_act_status() - Polls for ACT handled status.
  * @mgr: manager to use
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 38eea21d1082..69793815aa82 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -567,6 +567,8 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 				     enum drm_dp_phy dp_phy,
 				     u8 link_status[DP_LINK_STATUS_SIZE]);
 
+int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
+			      int vcpid, u8 start_time_slot, u8 time_slot_count);
 int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
 
 bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
-- 
2.39.5

