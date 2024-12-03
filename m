Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9C9E258C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480610EA93;
	Tue,  3 Dec 2024 16:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlznYMp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988710EA89;
 Tue,  3 Dec 2024 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241717; x=1764777717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A74KTfY+mEe9gVrvLZ4scN0ny9GIeaQa49dD6JwJEms=;
 b=BlznYMp4SQ/iuL0mnc/weYbGI0eJ/b8FMImyZ335T3HcRtxnnfJnBsZS
 HnW66VdxiacSsBExgisnVQgHqGlELl4o1R/xWdA9YmMeuB4sWfv3iM6jC
 VJ6ebPw2rat7+PIvWqHfCIwZKHC6njs1UF4aN2jHJSSvaZr0B7PNZOQdL
 JRy2p7hZfD+ly81a9iWPPcC2SYFwUSRfUrtLfG7dXxLzsX2/rNqjj/Uhb
 Wf7ImPXZ9bgqRceZMPPrA/P7X41nypuXODjA8RTYPqnzLCgZ0NRb9/dc2
 qtrky6hdUivgMIgzAyDGM7XAbpXSibQwfkTcQkKqxtGI+/SmDJ9RwEc9Z g==;
X-CSE-ConnectionGUID: iUiAGvh1TCySiz6svo461Q==
X-CSE-MsgGUID: 4aQkQEZzQoG0xsbd8dWcxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236073"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:57 -0800
X-CSE-ConnectionGUID: pgyIqJ5wQheNKiVqlCVd3Q==
X-CSE-MsgGUID: bC7janoNRseTvRALDU7ikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313094"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:53 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH 6/7] drm/dp_mst: Reset message rx state after OOM in
 drm_dp_mst_handle_up_req()
Date: Tue,  3 Dec 2024 18:02:22 +0200
Message-ID: <20241203160223.2926014-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241203160223.2926014-1-imre.deak@intel.com>
References: <20241203160223.2926014-1-imre.deak@intel.com>
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

After an out-of-memory error the reception state should be reset, so
that the next attempt receiving a message doesn't fail (due to getting a
start-of-message packet, while the reception state has already the
start-of-message flag set).

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index df37fde82d27c..d6452a15daf6a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4107,6 +4107,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_pending_up_req *up_req;
 	struct drm_dp_mst_branch *mst_primary;
+	int ret = 0;
 
 	if (!drm_dp_get_one_sb_msg(mgr, true, NULL))
 		goto out_clear_reply;
@@ -4115,8 +4116,10 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 		return 0;
 
 	up_req = kzalloc(sizeof(*up_req), GFP_KERNEL);
-	if (!up_req)
-		return -ENOMEM;
+	if (!up_req) {
+		ret = -ENOMEM;
+		goto out_clear_reply;
+	}
 
 	INIT_LIST_HEAD(&up_req->next);
 
@@ -4182,7 +4185,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	drm_dp_mst_topology_put_mstb(mst_primary);
 out_clear_reply:
 	memset(&mgr->up_req_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
-	return 0;
+	return ret;
 }
 
 static void update_msg_rx_state(struct drm_dp_mst_topology_mgr *mgr)
-- 
2.44.2

