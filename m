Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F19E2588
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D0C10EA90;
	Tue,  3 Dec 2024 16:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfBb+XyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554810EA86;
 Tue,  3 Dec 2024 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241716; x=1764777716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pVJrzV+3fT+++tYPAwmhx4Gkj6+Ai35G9THmqwowsrI=;
 b=ZfBb+XyN5CI+Heuc3yod+pMyf4Fxm5KVk3MuQMqVe6l9olTC6mtpdcVG
 00V5HZNkfB3vFHGaZai/Hzk/hMDQ1NpJ0bU+H41PdVa2wzMP0D2aoa4+Q
 hAJbr2QUgB/vJP1HPHvZQskeHm/HQD8C2RCzLmmcf0PFN0WJ1w4FOROtn
 62Pcx2qrFvfJrw6u+MVLTm509HYh5hW/57fhnziVOevm0PVhcNYCYqCuH
 nxxf4I0CTwyY14l6OpOTkXhwwVV0Zsi4WSewL4g8fmmGhTYxeFp/ZIzCE
 YsT+DyogAODlnGayIGevRjM4dmcFXl4ZNQCrLL1+ukcd/R+SZiXBZsL0e Q==;
X-CSE-ConnectionGUID: KAiVvfrRSYOyF2+b3gfRrg==
X-CSE-MsgGUID: ylSuyLTWT3yDjryntjDYqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236059"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:56 -0800
X-CSE-ConnectionGUID: AzcKO9bcQ9uC5bxzd1m59g==
X-CSE-MsgGUID: 3JMpsdsgQwOVftWDsoaSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313056"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:48 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH 3/7] drm/dp_mst: Simplify error path in
 drm_dp_mst_handle_down_rep()
Date: Tue,  3 Dec 2024 18:02:19 +0200
Message-ID: <20241203160223.2926014-4-imre.deak@intel.com>
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

Simplify the error return path in drm_dp_mst_handle_down_rep(),
preparing for the next patch.

While at it use reset_msg_rx_state() instead of open-coding it.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index bcf3a33123be1..6ec8680998d5a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4013,9 +4013,6 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 			    txmsg->reply.u.nak.nak_data);
 	}
 
-	memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
-	drm_dp_mst_topology_put_mstb(mstb);
-
 	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
 	list_del(&txmsg->next);
@@ -4023,10 +4020,8 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 
 	wake_up_all(&mgr->tx_waitq);
 
-	return 0;
-
 out_clear_reply:
-	memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
+	reset_msg_rx_state(msg);
 out:
 	if (mstb)
 		drm_dp_mst_topology_put_mstb(mstb);
-- 
2.44.2

