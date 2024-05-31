Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C888D611E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1473910E5C3;
	Fri, 31 May 2024 12:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4csHLh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733B810E6C0;
 Fri, 31 May 2024 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717156846; x=1748692846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCvTamEUiYQc9a+wMgyTtN6DwHq2KNGJdIzIE48D8io=;
 b=G4csHLh7/BL/5zebJlVXBFcVv7oGjjU5fHafZxeg1pEdGVi0umRU/DLK
 pn3PACjafY8WEdTfhkEbK0fdT5yT7bAlvXHqALDzVn3pWL9cAZ0zFo00z
 htUZJUlmnDJtugtmWcLlXCfJDtUtDjQRdgh2L0fkr8qiW1c6GN8bx4Tcc
 2bLHazVrQHr6nSK5rOc53sJEIN6SPB9j7rPmTHJfv/PY6ZsdoS4d4Xwxl
 +7uDM+hM26X+GJsV4W9Y05X0S2R7BAdHl1LYJyieV1tDiZzD3Cm1BHqFV
 hTegyddxhA8bcQ697BObgMkSN6NGHK+H7Lr6GMJ5u0HSRnuAtyj4PkvoM w==;
X-CSE-ConnectionGUID: 1UTVbADhSKOldj38dakItA==
X-CSE-MsgGUID: ADrMmOjYSdq+8NzLn4wsqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31223858"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="31223858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:46 -0700
X-CSE-ConnectionGUID: pfdQyTQFQiyBNVDT7Vss0Q==
X-CSE-MsgGUID: lpyd/wUURg2sJJhCbBNAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36076197"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, jani.nikula@intel.com
Subject: [PATCH 1/3] drm/mst: switch to guid_t type for GUID
Date: Fri, 31 May 2024 15:00:31 +0300
Message-Id: <e2bdf7372c45cbf40ed7c91595cc384a766e19e1.1717156602.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717156601.git.jani.nikula@intel.com>
References: <cover.1717156601.git.jani.nikula@intel.com>
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

The kernel has a guid_t type for GUIDs. Switch to using it, but avoid
any functional changes here.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 67 +++++++++++--------
 include/drm/display/drm_dp_mst_helper.h       | 12 ++--
 3 files changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 516eb3968e26..65ebc01dc90f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2445,7 +2445,7 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 		}
 	}
 
-	memcpy(mgr->mst_primary->guid, guid, 16);
+	import_guid(&mgr->mst_primary->guid, guid);
 
 out_fail:
 	mutex_unlock(&mgr->lock);
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7f8e1cfbe19d..9b1f35b1a2da 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -89,7 +89,7 @@ static int drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 					   struct drm_dp_mst_branch *mstb,
 					   struct drm_dp_mst_port *port);
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
-				 u8 *guid);
+				 guid_t *guid);
 
 static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port);
 static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
@@ -801,7 +801,7 @@ static bool drm_dp_sideband_parse_link_address(const struct drm_dp_mst_topology_
 	int idx = 1;
 	int i;
 
-	memcpy(repmsg->u.link_addr.guid, &raw->msg[idx], 16);
+	import_guid(&repmsg->u.link_addr.guid, &raw->msg[idx]);
 	idx += 16;
 	repmsg->u.link_addr.nports = raw->msg[idx] & 0xf;
 	idx++;
@@ -829,7 +829,7 @@ static bool drm_dp_sideband_parse_link_address(const struct drm_dp_mst_topology_
 			idx++;
 			if (idx > raw->curlen)
 				goto fail_len;
-			memcpy(repmsg->u.link_addr.ports[i].peer_guid, &raw->msg[idx], 16);
+			import_guid(&repmsg->u.link_addr.ports[i].peer_guid, &raw->msg[idx]);
 			idx += 16;
 			if (idx > raw->curlen)
 				goto fail_len;
@@ -1029,7 +1029,7 @@ static bool drm_dp_sideband_parse_reply(const struct drm_dp_mst_topology_mgr *mg
 	msg->req_type = (raw->msg[0] & 0x7f);
 
 	if (msg->reply_type == DP_SIDEBAND_REPLY_NAK) {
-		memcpy(msg->u.nak.guid, &raw->msg[1], 16);
+		import_guid(&msg->u.nak.guid, &raw->msg[1]);
 		msg->u.nak.reason = raw->msg[17];
 		msg->u.nak.nak_data = raw->msg[18];
 		return false;
@@ -1078,7 +1078,7 @@ drm_dp_sideband_parse_connection_status_notify(const struct drm_dp_mst_topology_
 	if (idx > raw->curlen)
 		goto fail_len;
 
-	memcpy(msg->u.conn_stat.guid, &raw->msg[idx], 16);
+	import_guid(&msg->u.conn_stat.guid, &raw->msg[idx]);
 	idx += 16;
 	if (idx > raw->curlen)
 		goto fail_len;
@@ -1107,7 +1107,7 @@ static bool drm_dp_sideband_parse_resource_status_notify(const struct drm_dp_mst
 	if (idx > raw->curlen)
 		goto fail_len;
 
-	memcpy(msg->u.resource_stat.guid, &raw->msg[idx], 16);
+	import_guid(&msg->u.resource_stat.guid, &raw->msg[idx]);
 	idx += 16;
 	if (idx > raw->curlen)
 		goto fail_len;
@@ -2174,20 +2174,24 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
 				      offset, size, buffer);
 }
 
-static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
+static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 {
 	int ret = 0;
 
-	memcpy(mstb->guid, guid, 16);
+	guid_copy(&mstb->guid, guid);
+
+	if (!drm_dp_validate_guid(mstb->mgr, &mstb->guid)) {
+		u8 buf[UUID_SIZE];
+
+		export_guid(buf, &mstb->guid);
 
-	if (!drm_dp_validate_guid(mstb->mgr, mstb->guid)) {
 		if (mstb->port_parent) {
 			ret = drm_dp_send_dpcd_write(mstb->mgr,
 						     mstb->port_parent,
-						     DP_GUID, 16, mstb->guid);
+						     DP_GUID, sizeof(buf), buf);
 		} else {
 			ret = drm_dp_dpcd_write(mstb->mgr->aux,
-						DP_GUID, mstb->guid, 16);
+						DP_GUID, buf, sizeof(buf));
 		}
 	}
 
@@ -2570,9 +2574,9 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
 	return mstb;
 }
 
-static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
-	struct drm_dp_mst_branch *mstb,
-	const uint8_t *guid)
+static struct drm_dp_mst_branch *
+get_mst_branch_device_by_guid_helper(struct drm_dp_mst_branch *mstb,
+				     const guid_t *guid)
 {
 	struct drm_dp_mst_branch *found_mstb;
 	struct drm_dp_mst_port *port;
@@ -2580,10 +2584,9 @@ static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
 	if (!mstb)
 		return NULL;
 
-	if (memcmp(mstb->guid, guid, 16) == 0)
+	if (guid_equal(&mstb->guid, guid))
 		return mstb;
 
-
 	list_for_each_entry(port, &mstb->ports, next) {
 		found_mstb = get_mst_branch_device_by_guid_helper(port->mstb, guid);
 
@@ -2596,7 +2599,7 @@ static struct drm_dp_mst_branch *get_mst_branch_device_by_guid_helper(
 
 static struct drm_dp_mst_branch *
 drm_dp_get_mst_branch_device_by_guid(struct drm_dp_mst_topology_mgr *mgr,
-				     const uint8_t *guid)
+				     const guid_t *guid)
 {
 	struct drm_dp_mst_branch *mstb;
 	int ret;
@@ -2693,17 +2696,20 @@ static void drm_dp_mst_link_probe_work(struct work_struct *work)
 }
 
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
-				 u8 *guid)
+				 guid_t *guid)
 {
 	u64 salt;
+	u8 buf[UUID_SIZE];
 
-	if (memchr_inv(guid, 0, 16))
+	if (!guid_is_null(guid))
 		return true;
 
 	salt = get_jiffies_64();
 
-	memcpy(&guid[0], &salt, sizeof(u64));
-	memcpy(&guid[8], &salt, sizeof(u64));
+	memcpy(&buf[0], &salt, sizeof(u64));
+	memcpy(&buf[8], &salt, sizeof(u64));
+
+	import_guid(guid, buf);
 
 	return false;
 }
@@ -2943,7 +2949,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	drm_dbg_kms(mgr->dev, "link address reply: %d\n", reply->nports);
 	drm_dp_dump_link_address(mgr, reply);
 
-	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
+	ret = drm_dp_check_mstb_guid(mstb, &reply->guid);
 	if (ret) {
 		char buf[64];
 
@@ -3770,8 +3776,9 @@ EXPORT_SYMBOL(drm_dp_mst_topology_mgr_suspend);
 int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 				   bool sync)
 {
+	u8 buf[UUID_SIZE];
+	guid_t guid;
 	int ret;
-	u8 guid[16];
 
 	mutex_lock(&mgr->lock);
 	if (!mgr->mst_primary)
@@ -3792,13 +3799,15 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	/* Some hubs forget their guids after they resume */
-	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
-	if (ret != 16) {
+	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
-	ret = drm_dp_check_mstb_guid(mgr->mst_primary, guid);
+	import_guid(&guid, buf);
+
+	ret = drm_dp_check_mstb_guid(mgr->mst_primary, &guid);
 	if (ret) {
 		drm_dbg_kms(mgr->dev, "check mstb failed - undocked during suspend?\n");
 		goto out_fail;
@@ -3976,12 +3985,12 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
 	bool hotplug = false, dowork = false;
 
 	if (hdr->broadcast) {
-		const u8 *guid = NULL;
+		const guid_t *guid = NULL;
 
 		if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY)
-			guid = msg->u.conn_stat.guid;
+			guid = &msg->u.conn_stat.guid;
 		else if (msg->req_type == DP_RESOURCE_STATUS_NOTIFY)
-			guid = msg->u.resource_stat.guid;
+			guid = &msg->u.resource_stat.guid;
 
 		if (guid)
 			mstb = drm_dp_get_mst_branch_device_by_guid(mgr, guid);
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index cfe096389d94..dd466631f174 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -244,18 +244,18 @@ struct drm_dp_mst_branch {
 	bool link_address_sent;
 
 	/* global unique identifier to identify branch devices */
-	u8 guid[16];
+	guid_t guid;
 };
 
 
 struct drm_dp_nak_reply {
-	u8 guid[16];
+	guid_t guid;
 	u8 reason;
 	u8 nak_data;
 };
 
 struct drm_dp_link_address_ack_reply {
-	u8 guid[16];
+	guid_t guid;
 	u8 nports;
 	struct drm_dp_link_addr_reply_port {
 		bool input_port;
@@ -265,7 +265,7 @@ struct drm_dp_link_address_ack_reply {
 		bool ddps;
 		bool legacy_device_plug_status;
 		u8 dpcd_revision;
-		u8 peer_guid[16];
+		guid_t peer_guid;
 		u8 num_sdp_streams;
 		u8 num_sdp_stream_sinks;
 	} ports[16];
@@ -348,7 +348,7 @@ struct drm_dp_allocate_payload_ack_reply {
 };
 
 struct drm_dp_connection_status_notify {
-	u8 guid[16];
+	guid_t guid;
 	u8 port_number;
 	bool legacy_device_plug_status;
 	bool displayport_device_plug_status;
@@ -425,7 +425,7 @@ struct drm_dp_query_payload {
 
 struct drm_dp_resource_status_notify {
 	u8 port_number;
-	u8 guid[16];
+	guid_t guid;
 	u16 available_pbn;
 };
 
-- 
2.39.2

