Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25F364CFA6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB310E44F;
	Wed, 14 Dec 2022 18:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606D210E44F;
 Wed, 14 Dec 2022 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671043383; x=1702579383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIB+IG0nRJcAUz4HQIXON8xBXAnSiGfKuP+C3Av1YeQ=;
 b=GU07VcHScL4YyQEk8YjfAJM/spw5YnUs5722D2zBtQxLh7weHCkrKSw4
 rnT8eL/nYoRcEfylxX/v0UIfcRMzz/mFVICqAQcEvmsri77zIPI3TDLUB
 v7TU8azY3acCqTxTx29jwJvrvCuX68g3KEcB9SH1rlEqgKXPT52DlVl+9
 ftuICMH/jsdHhBRsYubwA5MczUJrO9TgvSewDZho25wo9YnGE+fZu/Nx0
 jkQLs4Up6540odpA/w9J79O4X19duGokusunjCgQNsPy+Vob0hM7o+tu9
 1ZumSfuGOzPHWoL0wB9YzU2uSiPLUC6UfI0syKWlBelVVJvNTBPdzkKnP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="320343547"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="320343547"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894424793"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="894424793"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:00 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/display/dp_mst: Fix down/up message handling after
 sink disconnect
Date: Wed, 14 Dec 2022 20:42:56 +0200
Message-Id: <20221214184258.2869417-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the sink gets disconnected during receiving a multi-packet DP MST AUX
down-reply/up-request sideband message, the state keeping track of which
packets have been received already is not reset. This results in a failed
sanity check for the subsequent message packet received after a sink is
reconnected (due to the pending message not yet completed with an
end-of-message-transfer packet), indicated by the

"sideband msg set header failed"

error.

Fix the above by resetting the up/down message reception state after a
disconnect event.

Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v3.17+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 51a46689cda70..90819fff2c9ba 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3641,6 +3641,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
+
+		memset(&mgr->down_rep_recv, 0, sizeof(mgr->down_rep_recv));
+		memset(&mgr->up_req_recv, 0, sizeof(mgr->up_req_recv));
 	}
 
 out_unlock:
-- 
2.37.1

