Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E482EF71
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE1010E599;
	Tue, 16 Jan 2024 13:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6E10E55E;
 Tue, 16 Jan 2024 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410492; x=1736946492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXufi8yv5EDgszRFIWETWcGZbvK6vkGgyNxOgkONleg=;
 b=fCNd0qs2qh/CYVrQvtUHHNysWiAfzXqnHVkj1YkvbQ6T7Ule2uTYBFkI
 9HuiObiJm/JT2/2lC6Fl1fkTVNRFkoy2pDEu0CZaQf0FWNF69ykrXTfB/
 uFSsstVTRfPj9O61bH8albGqz4KE3WUAyrDwGuIrkRsQNtW3agV2pkekj
 doC6FORH8X60YnMPt9AYSJNQU2L6rBsOFJIyCvZQrjuHsJ94u4Is6r0F6
 Mu3NpBd0Gkr9XOqsKnYFB6b9xvralTW15uT9RXcJE3uZJ+pv9imZlwUCa
 bjH+McJPBe9a+4DG9IosLys2E1cCeRZPRbO3hq+4mhMpOunzqiqCb6KP9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6949465"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6949465"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="777047046"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777047046"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/dp_mst: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Tue, 16 Jan 2024 15:07:29 +0200
Message-Id: <50d510a6e13735cef10325742bf49b7f6955b970.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the device specific debug printer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8ca01a6bf645..fba6e37b051b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -1306,7 +1306,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_dbg_printer(mgr->dev, DRM_UT_DP,
+						       DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
@@ -1593,10 +1594,11 @@ topology_ref_type_to_str(enum drm_dp_mst_topology_ref_type type)
 }
 
 static void
-__dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *history,
+__dump_topology_ref_history(struct drm_device *drm,
+			    struct drm_dp_mst_topology_ref_history *history,
 			    void *ptr, const char *type_str)
 {
-	struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+	struct drm_printer p = drm_dbg_printer(drm, DRM_UT_DP, DBG_PREFIX);
 	char *buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 	int i;
 
@@ -1638,15 +1640,15 @@ __dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *history,
 static __always_inline void
 drm_dp_mst_dump_mstb_topology_history(struct drm_dp_mst_branch *mstb)
 {
-	__dump_topology_ref_history(&mstb->topology_ref_history, mstb,
-				    "MSTB");
+	__dump_topology_ref_history(mstb->mgr->dev, &mstb->topology_ref_history,
+				    mstb, "MSTB");
 }
 
 static __always_inline void
 drm_dp_mst_dump_port_topology_history(struct drm_dp_mst_port *port)
 {
-	__dump_topology_ref_history(&port->topology_ref_history, port,
-				    "Port");
+	__dump_topology_ref_history(port->mgr->dev, &port->topology_ref_history,
+				    port, "Port");
 }
 
 static __always_inline void
@@ -2824,7 +2826,9 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
 	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
 	if (ret) {
 		if (drm_debug_enabled(DRM_UT_DP)) {
-			struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+			struct drm_printer p = drm_dbg_printer(mgr->dev,
+							       DRM_UT_DP,
+							       DBG_PREFIX);
 
 			drm_printf(&p, "sideband msg failed to send\n");
 			drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
@@ -2869,7 +2873,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 	list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
 
 	if (drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+		struct drm_printer p = drm_dbg_printer(mgr->dev, DRM_UT_DP,
+						       DBG_PREFIX);
 
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
-- 
2.39.2

