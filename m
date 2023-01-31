Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C96830D4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 16:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B8B10E387;
	Tue, 31 Jan 2023 15:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F75210E380;
 Tue, 31 Jan 2023 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177569; x=1706713569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xb02vIQIgXwqReykZnFavPw9RCMa3+WLedoxNY6Xnwk=;
 b=h5NOeGxsH5OqWwquaBp0yrBBQdrSVJ/Ro4SG9uCOA2XX/VTAo0bYIudk
 Bha7w2v5H6zuMj/N1a6pDdP5oe7Ga+t4KO82uuEUE2TgdqpatRAv7Y5pm
 Agyt7MA5biKMEG9Qk+LoUbCzAGLPDqVOmphxYw29agCgT8gLSY72VYSgY
 HVZMzMbiUmK0HC86rMfRFd6QlH8Loersn5zt67YEfBC4SxefxyFVNbEvG
 aotAn+kRJfUkiQj9Hwx4D/Nss5YhiCwf1sK5HX3hX5Kh+pduAh25mTqSj
 I5rmcn6T6JhO6tdUSUSYrMkir0tlobRKzyTjZW/47ECbsZyJcpXUjt4nZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308205582"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308205582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="807155335"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="807155335"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:06:07 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/17] drm/display/dp_mst: Add helpers to query for payload
 allocation errors
Date: Tue, 31 Jan 2023 17:05:42 +0200
Message-Id: <20230131150548.1614458-12-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230131150548.1614458-1-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a way for drivers to query if allocating time slots for any payloads
in a given MST topology failed. This is needed by a follow-up i915 patch
verifying the SW vs. HW state of the MST topology.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 35 ++++++++++++++++---
 include/drm/display/drm_dp_mst_helper.h       |  3 ++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e57dd16955d52..f2081f3fad0da 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3306,15 +3306,14 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_dp_mst_atomic_payload *payload)
 {
 	struct drm_dp_mst_port *port;
-	int ret;
+	int ret = 0;
 
 	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
 	if (!port) {
 		drm_dbg_kms(mgr->dev,
 			    "VCPI %d for port %p not in topology, not creating a payload\n",
 			    payload->vcpi, payload->port);
-		payload->vc_start_slot = -1;
-		return 0;
+		goto alloc_fail;
 	}
 
 	if (mgr->payload_count == 0)
@@ -3327,14 +3326,21 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 	if (ret < 0) {
 		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
 			 payload->port, ret);
-		payload->vc_start_slot = -1;
-		return ret;
+		goto alloc_fail;
 	}
 
+	payload->alloc_failed = false;
+
 	mgr->payload_count++;
 	mgr->next_start_slot += payload->time_slots;
 
 	return 0;
+
+alloc_fail:
+	payload->vc_start_slot = -1;
+	payload->alloc_failed = true;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_add_payload_part1);
 
@@ -3423,6 +3429,25 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 }
 EXPORT_SYMBOL(drm_dp_add_payload_part2);
 
+/**
+ * drm_dp_mst_has_payload_alloc_errors - Query for payload allocation errors
+ * @mst_state: The MST atomic state
+ *
+ * Returns %true if the allocation of any of the payloads in @mst_state
+ * failed, %false otherwise.
+ */
+bool drm_dp_mst_has_payload_alloc_errors(const struct drm_dp_mst_topology_state *mst_state)
+{
+	struct drm_dp_mst_atomic_payload *pos;
+
+	list_for_each_entry(pos, &mst_state->payloads, next)
+		if (pos->alloc_failed)
+			return true;
+
+	return false;
+}
+EXPORT_SYMBOL(drm_dp_mst_has_payload_alloc_errors);
+
 static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port,
 				 int offset, int size, u8 *bytes)
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 44c6710ebf315..53b251b264e89 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -568,6 +568,8 @@ struct drm_dp_mst_atomic_payload {
 	bool delete : 1;
 	/** @dsc_enabled: Whether or not this payload has DSC enabled */
 	bool dsc_enabled : 1;
+	/** @alloc_failed: Whether or not allocating this payload failed */
+	bool alloc_failed : 1;
 
 	/** @next: The list node for this payload */
 	struct list_head next;
@@ -843,6 +845,7 @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
 			   struct drm_dp_mst_topology_state *mst_state,
 			   const struct drm_dp_mst_atomic_payload *old_payload,
 			   struct drm_dp_mst_atomic_payload *new_payload);
+bool drm_dp_mst_has_payload_alloc_errors(const struct drm_dp_mst_topology_state *mst_state);
 
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.37.1

