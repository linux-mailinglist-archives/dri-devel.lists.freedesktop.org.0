Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6030A70C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB64089DDD;
	Mon,  1 Feb 2021 12:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53C289DE1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:01:59 +0000 (UTC)
IronPort-SDR: knmR3ki9RXmfKVr/6cBF3mhczFWhq2OV9lOYC+rwmrPI9tQ6fqbfhG4J52EHTiU5uBvG8hORiG
 7FmgbBAescag==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178108176"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="178108176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:01:59 -0800
IronPort-SDR: gv0TYJFBjjz2oK9pFv4WMZSrGQ/4ADtxSMJXv0jV4rCkNeYMj3ru9sR0KUg6DQ7Q2zwH7nIsf2
 hS1BIsxqnybg==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="390880843"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:01:57 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Date: Mon,  1 Feb 2021 14:01:43 +0200
Message-Id: <20210201120145.350258-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201120145.350258-1-imre.deak@intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Caching EDIDs for physical ports prevents updating the EDID if a port
gets reconnected via a Connection Status Notification message, fix this.

Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index deb7995f42fa..309afe61afdd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2302,7 +2302,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	}
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
-	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
+	    port->port_num >= DP_MST_LOGICAL_PORT_0) {
 		port->cached_edid = drm_get_edid(port->connector,
 						 &port->aux.ddc);
 		drm_connector_set_tile_property(port->connector);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
