Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE59E2580
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E3F10EA84;
	Tue,  3 Dec 2024 16:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+udgN99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5D10EA83;
 Tue,  3 Dec 2024 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241710; x=1764777710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AmnQe6A3KxtcW8XP/QhfkCqFZwG4vY1KZmdy7VCDCSE=;
 b=A+udgN999fxFEAutII66qrlAxpUVHo6+cPQzJZdw+AqSzRK5iNris9Te
 BRADmyJDcO+skCD0NoeUyHTSQFcpmYJn1BiI+60hvgSMTtR4nFUAPMEnB
 9NMKwCihKthr9hgct5dEsDqz8HuEKOMAaiiiYb5AOWQa2GPuQXDlynxw7
 HnDTRanRqg7Alk6p/c03I3revc4nF8Ex0Wb0p4XRgq3GRO6t+XS9xOvNu
 LYPpNzQ0G1vF9vLR5qpazembV/YMZC4reCI0eR9H6uCIgPDdofJB0oqsB
 xOmjacJYtxQik1ceALLsD4ROpPjspM0Y1wI6yII+/T8h1YMIsPtpuBqbh Q==;
X-CSE-ConnectionGUID: rRF6FzJyTsSVA+TmCqxi5A==
X-CSE-MsgGUID: XsbU4qmFRg6A46sIojj1Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236041"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:50 -0800
X-CSE-ConnectionGUID: 5NXC7kwaRM6M5bMoCnsxVg==
X-CSE-MsgGUID: kNJWxcxaSvalCDKednLhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313031"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:45 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/7] drm/dp_mst: Fix resetting msg rx state after topology
 removal
Date: Tue,  3 Dec 2024 18:02:17 +0200
Message-ID: <20241203160223.2926014-2-imre.deak@intel.com>
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

If the MST topology is removed during the reception of an MST down reply
or MST up request sideband message, the
drm_dp_mst_topology_mgr::up_req_recv/down_rep_recv states could be reset
from one thread via drm_dp_mst_topology_mgr_set_mst(false), racing with
the reading/parsing of the message from another thread via
drm_dp_mst_handle_down_rep() or drm_dp_mst_handle_up_req(). The race is
possible since the reader/parser doesn't hold any lock while accessing
the reception state. This in turn can lead to a memory corruption in the
reader/parser as described by commit bd2fccac61b4 ("drm/dp_mst: Fix MST
sideband message body length check").

Fix the above by resetting the message reception state if needed before
reading/parsing a message. Another solution would be to hold the
drm_dp_mst_topology_mgr::lock for the whole duration of the message
reception/parsing in drm_dp_mst_handle_down_rep() and
drm_dp_mst_handle_up_req(), however this would require a bigger change.
Since the fix is also needed for stable, opting for the simpler solution
in this patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org>
Fixes: 1d082618bbf3 ("drm/display/dp_mst: Fix down/up message handling after sink disconnect")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13056
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 21 +++++++++++++++++--
 include/drm/display/drm_dp_mst_helper.h       |  7 +++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e6ee180815b20..1475aa95ab6b2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3700,8 +3700,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
-		memset(&mgr->down_rep_recv, 0, sizeof(mgr->down_rep_recv));
-		memset(&mgr->up_req_recv, 0, sizeof(mgr->up_req_recv));
+		mgr->reset_rx_state = true;
 	}
 
 out_unlock:
@@ -3859,6 +3858,11 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_resume);
 
+static void reset_msg_rx_state(struct drm_dp_sideband_msg_rx *msg)
+{
+	memset(msg, 0, sizeof(*msg));
+}
+
 static bool
 drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		      struct drm_dp_mst_branch **mstb)
@@ -4141,6 +4145,17 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	return 0;
 }
 
+static void update_msg_rx_state(struct drm_dp_mst_topology_mgr *mgr)
+{
+	mutex_lock(&mgr->lock);
+	if (mgr->reset_rx_state) {
+		mgr->reset_rx_state = false;
+		reset_msg_rx_state(&mgr->down_rep_recv);
+		reset_msg_rx_state(&mgr->up_req_recv);
+	}
+	mutex_unlock(&mgr->lock);
+}
+
 /**
  * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
  * @mgr: manager to notify irq for.
@@ -4175,6 +4190,8 @@ int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr, const u
 		*handled = true;
 	}
 
+	update_msg_rx_state(mgr);
+
 	if (esi[1] & DP_DOWN_REP_MSG_RDY) {
 		ret = drm_dp_mst_handle_down_rep(mgr);
 		*handled = true;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index f6a1cbb0f600f..a80ba457a858f 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -699,6 +699,13 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	bool payload_id_table_cleared : 1;
 
+	/**
+	 * @reset_rx_state: The down request's reply and up request message
+	 * receiver state must be reset, after the topology manager got
+	 * removed. Protected by @lock.
+	 */
+	bool reset_rx_state : 1;
+
 	/**
 	 * @payload_count: The number of currently active payloads in hardware. This value is only
 	 * intended to be used internally by MST helpers for payload tracking, and is only safe to
-- 
2.44.2

