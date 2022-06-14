Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62654AD87
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 11:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537B110F597;
	Tue, 14 Jun 2022 09:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAED10F597;
 Tue, 14 Jun 2022 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655199941; x=1686735941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Bf+GxrEygNaoZ9UaNvNVOa9olI714hFuy9KuPnaAew=;
 b=m2IU+k47uhMvniPBI23m85DAYjsgIM6+DgnrWcdlPhJxKe7GWl2269A7
 8Z95gZFwyp0OABxsirWxuwpSeAoGCMb7dBgSkWSiWzfnq1gL5vU1y3fzL
 11dEg5onYQDD930B1IXTFidLh8+lbUKnE8NC+khA8KZwyPTT6nq9wf5Z2
 cXdqcRcdGk934aYPqkIQXEHfSdNbPmjLfTx4ZbfhVoishHOpGF4Ga4DUE
 afdU5AYPWheMhi3KtzqkHoVUIxWSBHxPufk2Gx1gVG2aQ1CY2TT5QJ6xC
 1LUC0DZ1XnHwHMnhyrESDjqKlT2MMMO3AeALgDXAF6AXINubi8fIcIUAy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277349430"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="277349430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 02:45:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="726736436"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 02:45:39 -0700
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp/mst: Read the extended DPCD capabilities during system
 resume
Date: Tue, 14 Jun 2022 12:45:37 +0300
Message-Id: <20220614094537.885472-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The WD22TB4 Thunderbolt dock at least will revert its DP_MAX_LINK_RATE
from HBR3 to HBR2 after system suspend/resume if the DP_DP13_DPCD_REV
registers are not read subsequently also as required.

Fix this by reading DP_DP13_DPCD_REV registers as well, matching what is
done during connector detection. While at it also fix up the same call
in drm_dp_mst_dump_topology().

Cc: Lyude Paul <lyude@redhat.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5292
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 67b3b9697da7f..18f2b6075b780 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3860,9 +3860,7 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 	if (!mgr->mst_primary)
 		goto out_fail;
 
-	ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
-			       DP_RECEIVER_CAP_SIZE);
-	if (ret != DP_RECEIVER_CAP_SIZE) {
+	if (drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd) < 0) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
@@ -4911,8 +4909,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		u8 buf[DP_PAYLOAD_TABLE_SIZE];
 		int ret;
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
-		if (ret) {
+		if (drm_dp_read_dpcd_caps(mgr->aux, buf) < 0) {
 			seq_printf(m, "dpcd read failed\n");
 			goto out;
 		}
-- 
2.30.2

