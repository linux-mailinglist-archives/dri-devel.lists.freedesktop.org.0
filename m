Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79F79F507
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736F910E172;
	Wed, 13 Sep 2023 22:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DDA10E138;
 Wed, 13 Sep 2023 22:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644321; x=1726180321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eXrneEpc97PZFtDGNV1R/9GNaaYpi/PTXhkFAYrbo3k=;
 b=XY4FkIRvJqBv+EkcgUruyG7+HYYIezE15hxBL/NsZY2cN7xhT585Kv8D
 0wapMT32V4+zPMpcn4sRXu/JwfO16hrPR4gYA9BUvukyYK718MzR51sEg
 hQAizR/4ZElnT7o8VFWc2a/tlZss9v6xSY7F98BbBeC8reqb7DKCXXapS
 +OYA1i9xfjSTJ1WmdKxe4oE4mJkS9BueSxNTSw5XyA3gfHoDZLZbsNxjY
 qXN/HiQq7CyuVrdWKFaxu+NwcQAS+m19WJg7vHn4E5V0f5MJ5/coeyKTK
 WOLqtao1HzlKigoeYA8Kj12YYbNuG4tFDBRODWnHDI1/yQsgeB0LwB6e7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442828861"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442828861"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991138898"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="991138898"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:31:59 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/dp_mst: Sanitize error return during payload addition
Date: Thu, 14 Sep 2023 01:32:16 +0300
Message-Id: <20230913223218.540365-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230913223218.540365-1-imre.deak@intel.com>
References: <20230913223218.540365-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return an error during payload addition if the payload port isn't
found. This shouldn't change the behavior since only the i915 driver
checks the return value, printing an error message in case of a failure.

While at it simplify the control flow.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 5f90860d49c34..dbec9cf004594 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3308,8 +3308,7 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_dp_mst_atomic_payload *payload)
 {
 	struct drm_dp_mst_port *port;
-	int ret = 0;
-	bool allocate = true;
+	int ret;
 
 	/* Update mst mgr info */
 	if (mgr->payload_count == 0)
@@ -3320,29 +3319,28 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->payload_count++;
 	mgr->next_start_slot += payload->time_slots;
 
+	payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL;
+
 	/* Allocate payload to immediate downstream facing port */
 	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
 	if (!port) {
 		drm_dbg_kms(mgr->dev,
 			    "VCPI %d for port %p not in topology, not creating a payload to remote\n",
 			    payload->vcpi, payload->port);
-		allocate = false;
+		return -EIO;
 	}
 
-	if (allocate) {
-		ret = drm_dp_create_payload_at_dfp(mgr, payload);
-		if (ret < 0)
-			drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
-				 payload->port, ret);
-
+	ret = drm_dp_create_payload_at_dfp(mgr, payload);
+	if (ret < 0) {
+		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
+			 payload->port, ret);
+		goto put_port;
 	}
 
-	payload->payload_allocation_status =
-		(!allocate || ret < 0) ? DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
-								DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
+	payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
 
-	if (port)
-		drm_dp_mst_topology_put_port(port);
+put_port:
+	drm_dp_mst_topology_put_port(port);
 
 	return ret;
 }
-- 
2.37.2

