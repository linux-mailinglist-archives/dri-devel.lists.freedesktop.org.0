Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E259D1439
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B748E10E517;
	Mon, 18 Nov 2024 15:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9z3Z/um";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D710E50C;
 Mon, 18 Nov 2024 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731942913; x=1763478913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SNtr0/1UvnN+H5Z3qBusgfxCUOPk+agIa4Ir9GUEOWw=;
 b=X9z3Z/umvSKAPjTrIOLdeBootwgzpipwk8070HgqlLzALOUVVo1E4his
 7SVXGeYZ/2AIVsNdX+smAherpTRRNFS6ZBEo2+QHmNl9QhYrTKTVWglBF
 wYgOB/jx03GOa8IeSzlTY0aQ/kd/RkI1FFI1O/XOJfaGE+0EXzP7ZHUqd
 hLThKbcChKywMX/z2U1EPMdarbotIcrmjQ4Od/BoAjpcU30d+04/U4f/P
 95vBjGx1HBYjgZbVIF/bh6L1oC1+gqnRQpJxK29XRkskrt/K6WZ2zAaMo
 8jldI/Fz7PxkWwdn+AfGqyKhbLVKYmO/gR3NEa/EKF/7Qcr6V4WxvCmwZ Q==;
X-CSE-ConnectionGUID: 3A5fx4T7RwK8GO0RV3BtOw==
X-CSE-MsgGUID: UiZtS/YSRXqJugUOvS/HbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32139262"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32139262"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:13 -0800
X-CSE-ConnectionGUID: whRcMqmMQvGl+fCZuK8R7Q==
X-CSE-MsgGUID: F17E2XShTV6kMzUNIOwFRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89040842"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH 2/3] drm/dp: extract drm_dp_dpcd_write_payload()
Date: Mon, 18 Nov 2024 17:14:53 +0200
Message-Id: <6ce384b33eb6cb1d78731ea2c0e4da2340835325.1731942780.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1731942780.git.jani.nikula@intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 56 +++++++++++++++++++
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 52 +----------------
 include/drm/display/drm_dp_helper.h           |  2 +
 3 files changed, 61 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b7e03bf02cd8..0c9230f3f994 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -792,6 +792,62 @@ static int read_payload_update_status(struct drm_dp_aux *aux)
 	return status;
 }
 
+/**
+ * drm_dp_dpcd_write_payload() - Write payload
+ * @aux: DisplayPort AUX channel
+ * @vcpid: Virtual Channel Payload ID
+ * @start_time_slot: Starting time slot
+ * @time_slot_count: Time slot count
+ *
+ * Write payload table, poll status.
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
  * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 2bdbc1eb282b..a426d13a7a36 100644
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
@@ -3263,7 +3260,7 @@ EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
 static int drm_dp_create_payload_at_dfp(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_dp_mst_atomic_payload *payload)
 {
-	return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,
+	return drm_dp_dpcd_write_payload(mgr->aux, payload->vcpi, payload->vc_start_slot,
 					 payload->time_slots);
 }
 
@@ -3294,7 +3291,7 @@ static void drm_dp_destroy_payload_at_remote_and_dfp(struct drm_dp_mst_topology_
 	}
 
 	if (payload->payload_allocation_status == DRM_DP_MST_PAYLOAD_ALLOCATION_DFP)
-		drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot, 0);
+		drm_dp_dpcd_write_payload(mgr->aux, payload->vcpi, payload->vc_start_slot, 0);
 }
 
 /**
@@ -3682,7 +3679,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			goto out_unlock;
 
 		/* Write reset payload */
-		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
+		drm_dp_dpcd_write_payload(mgr->aux, 0, 0, 0x3f);
 
 		drm_dp_mst_queue_probe_work(mgr);
 
@@ -4679,49 +4676,6 @@ void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_
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

