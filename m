Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C617F741B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F40410E1E8;
	Fri, 24 Nov 2023 12:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2DD10E7E3;
 Fri, 24 Nov 2023 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829866; x=1732365866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXufi8yv5EDgszRFIWETWcGZbvK6vkGgyNxOgkONleg=;
 b=WegjLEar33BXJPhBdoXhwKNKCbCuIpwv3/OdCs0lSxOS/J6pZ0Z56GMs
 h8PVYJzJCMzPXU9IVxEFLjMwDFooSvEhXKwSMYofwEnNASPa3DLG058Hj
 GaM9/B/hJxB/1jGwy9sG5vm7wJ8+KXgU1s5iOPYqVwjLSD3aoSZYPJpfU
 mPiA7NM8UvMzwMGyNsAcrCUlfWf2aC7zLZd0fFFr60L4jnJvTcJdgN0+Z
 pTk6Vj8mugQVJW/7hSWaxozU1+u5XL5bT4NHg/AX0+iTShSrtCGuYgLd+
 +2jJWJt4Nyj9slnFLvaRKn7ZdLThcc0DXUx93TNWA0YbYLKrwNXJr1yGI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626959"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478626959"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833688000"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833688000"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/dp_mst: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Fri, 24 Nov 2023 14:43:58 +0200
Message-Id: <c0c48b30f83fb916d85b339ec42e61d2388d9f69.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
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

