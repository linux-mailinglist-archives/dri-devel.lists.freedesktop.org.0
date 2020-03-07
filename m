Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D682D17CCEF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE276E0F2;
	Sat,  7 Mar 2020 08:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BFB6E0EC;
 Sat,  7 Mar 2020 08:42:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2020 00:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,525,1574150400"; d="scan'208";a="230335215"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2020 00:42:02 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: emil.velikov@collabora.com, lyude@redhat.com, jani.nikula@linux.intel.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: [PATCH 4/5] drm: Add drm_dp_destroy_connector helper and use it
Date: Sat,  7 Mar 2020 14:00:22 +0530
Message-Id: <20200307083023.76498-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
amongst every driver and don't do anything other than cleaning up the
connector (drm_connector_unregister()/drm_connector_put()) except for
amdgpu_dm driver where some amdgpu_dm specific code in there which I
an not sure if it should stay or not.

Create and use a helper which calls driver's destroy_connector hook if
available otherwise does cleanup internally.

This is the step towards removing identical hooks from every driver.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Suggested-by: Emil Velikov <emil.velikov@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 53d10d6c91d9..8374cac74ccc 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4667,11 +4667,23 @@ static void drm_dp_tx_work(struct work_struct *work)
 	mutex_unlock(&mgr->qlock);
 }
 
+static inline void drm_dp_destroy_connector(struct drm_dp_mst_port *port)
+{
+	if (!port->connector)
+		return;
+
+	if (port->mgr->cbs->destroy_connector) {
+		port->mgr->cbs->destroy_connector(port->mgr, port->connector);
+	} else {
+		drm_connector_unregister(port->connector);
+		drm_connector_put(port->connector);
+	}
+}
+
 static inline void
 drm_dp_delayed_destroy_port(struct drm_dp_mst_port *port)
 {
-	if (port->connector)
-		port->mgr->cbs->destroy_connector(port->mgr, port->connector);
+	drm_dp_destroy_connector(port);
 
 	drm_dp_port_set_pdt(port, DP_PEER_DEVICE_NONE, port->mcs);
 	drm_dp_mst_put_port_malloc(port);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
