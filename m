Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76C843CDA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F41113B34;
	Wed, 31 Jan 2024 10:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1158113B14;
 Wed, 31 Jan 2024 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706697233; x=1738233233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/LvwFxrQNVCce+zkTCrQHdg7BYgjVpv+8lXG1cOAwg=;
 b=D+IijPV6em3fhZk1QfKMJWAJJFsy4vUkgcQWvJZn61I0LSUKNjig9PI+
 f4gSuPuy2kE49Lg0qkSgA32ePF2vly9KB94HP3drZ8u/I1W+5W7OPMUVx
 wf/czhO16avyG3RSF3Fnai64XPORJhICa3obFCLFx3+odB3SOFjc/9iHj
 wZwL6YM9WHNBKcQeWoW9ev/MxYCTzgHHjzzuWwuS2Dn23ED9spN7lhHXP
 MU7k8EUOdneqtw55euOvBEoNcczOdIvOgjosxZB1g/mdG6rEdv/FRAWOp
 lUFHw8hp2wGSl8KTb68gHRNX+8tUqUQvzIBKCV9CsBKTVEwEvgdFnjM7U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407278655"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="407278655"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="22747025"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 02:33:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCHv2 1/2] drm/display/dp: Check for MSTM_CAP before MSTM_CTRL
 write
Date: Wed, 31 Jan 2024 15:53:43 +0530
Message-Id: <20240131102344.1671929-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: jani.nikula@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With DP2.1, multistream packetization and the underneth MST protocol
will be required for SST. So check for MSTM_CAP to see if MST is really
required and skip the MSTM_CTRL write so that we ensure that only the
underneth protocol and the multistream packetization will be enabled and
sink will not be confused by a corresponding dpcd write.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 38 +++++++++++--------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8ca01a6bf645..c5b3e51ea0c9 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3666,12 +3666,14 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mgr->mst_primary = mstb;
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
-		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-					 DP_MST_EN |
-					 DP_UP_REQ_EN |
-					 DP_UPSTREAM_IS_SRC);
-		if (ret < 0)
-			goto out_unlock;
+		if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd)) {
+			ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
+						 DP_MST_EN |
+						 DP_UP_REQ_EN |
+						 DP_UPSTREAM_IS_SRC);
+			if (ret < 0)
+				goto out_unlock;
+		}
 
 		/* Write reset payload */
 		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
@@ -3684,7 +3686,8 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mstb = mgr->mst_primary;
 		mgr->mst_primary = NULL;
 		/* this can fail if the device is gone */
-		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
+		if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd))
+			drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
@@ -3724,8 +3727,9 @@ drm_dp_mst_topology_mgr_invalidate_mstb(struct drm_dp_mst_branch *mstb)
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr)
 {
 	mutex_lock(&mgr->lock);
-	drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-			   DP_MST_EN | DP_UPSTREAM_IS_SRC);
+	if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd))
+		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
+				   DP_MST_EN | DP_UPSTREAM_IS_SRC);
 	mutex_unlock(&mgr->lock);
 	flush_work(&mgr->up_req_work);
 	flush_work(&mgr->work);
@@ -3773,13 +3777,15 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 	}
 
-	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-				 DP_MST_EN |
-				 DP_UP_REQ_EN |
-				 DP_UPSTREAM_IS_SRC);
-	if (ret < 0) {
-		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
-		goto out_fail;
+	if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd)) {
+		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
+					 DP_MST_EN |
+					 DP_UP_REQ_EN |
+					 DP_UPSTREAM_IS_SRC);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
+			goto out_fail;
+		}
 	}
 
 	/* Some hubs forget their guids after they resume */
-- 
2.25.1

