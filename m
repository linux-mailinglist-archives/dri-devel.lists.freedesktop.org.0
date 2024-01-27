Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B707A83EB81
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 07:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA1410E55C;
	Sat, 27 Jan 2024 06:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEF410E55C;
 Sat, 27 Jan 2024 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706338001; x=1737874001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aYDRSgaKsu91Ksbkz9dTbqiV0DGXxzfLUrPJ+gPF3Sk=;
 b=UvNiTh8lgSYosc+0deP13JY2h6oHEHL0wFhUsLXf85eXSHXKD+dbc83A
 8o55kNLGewRYnS9HgdXy9VjLQLl1goQ6yrOnUp/nn+wjRiXSy01aSVpGD
 sLCpJEaePmVC3JWJ637yaVIqK8/8D18mVFHDwmLvR0Vecg3oQ4/Bdi+mT
 U0DvenX3AhGNcL+cCobixHwJJNXc4Ba5HKpZbt3faCXhnuE8cZIbwJQRa
 RIb1ClJJivU3riNKEOPam5hGNtYuq3rJGe1P3quyi+/8wHb+daRgn8tzt
 6gp5QTxFR86geIQ0+U/KW7D1R0ZnLMZUqCwsMVhot2ExXjgD06E5j6rjX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24120170"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="24120170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 22:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="35636988"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 26 Jan 2024 22:46:39 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/display/dp: Check for MSTM_CAP before MSTM_CTRL write
Date: Sat, 27 Jan 2024 12:06:26 +0530
Message-Id: <20240127063627.1369883-1-arun.r.murthy@intel.com>
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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8ca01a6bf645..22d81732a978 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3666,10 +3666,11 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mgr->mst_primary = mstb;
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
-		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-					 DP_MST_EN |
-					 DP_UP_REQ_EN |
-					 DP_UPSTREAM_IS_SRC);
+		if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd))
+			ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
+						 DP_MST_EN |
+						 DP_UP_REQ_EN |
+						 DP_UPSTREAM_IS_SRC);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -3684,7 +3685,8 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mstb = mgr->mst_primary;
 		mgr->mst_primary = NULL;
 		/* this can fail if the device is gone */
-		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
+		if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd))
+			drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
@@ -3724,8 +3726,9 @@ drm_dp_mst_topology_mgr_invalidate_mstb(struct drm_dp_mst_branch *mstb)
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
@@ -3773,10 +3776,11 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 	}
 
-	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-				 DP_MST_EN |
-				 DP_UP_REQ_EN |
-				 DP_UPSTREAM_IS_SRC);
+	if (drm_dp_read_mst_cap(mgr->aux, mgr->dpcd))
+		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
+					 DP_MST_EN |
+					 DP_UP_REQ_EN |
+					 DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
 		goto out_fail;
-- 
2.25.1

