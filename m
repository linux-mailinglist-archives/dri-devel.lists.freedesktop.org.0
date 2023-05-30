Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B171598F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D231410E391;
	Tue, 30 May 2023 09:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BE810E38F;
 Tue, 30 May 2023 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437772; x=1716973772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R7K+WwXA2rTEHfMTnC4KoOSgQcKsGAZb1Yq7iU4LnDs=;
 b=NnxiqVyfWZIRFKDlJoZVEpjE+Q4VWvf48ERy9t+pV44/6roQEUq88ioM
 RSKc/yAT+GDWKfx16Tz1OGxSCm5v4vM3/QAn8Kkazrs0NU+sVzaqt4wA9
 zB/I/Aw8vAg+lUprChkF4VQQhc5TbI/tTR9khdTHGG4WzCl/hcKf6wh3Y
 Q5EMsgjCtXPY6TgotagCaqzYeWcfMbEYovuYJmLxa+d/2S17KOmm4YNo9
 m+6G/Qwa9EZnzTedA4cTdbe6MiDTpqbxD68DjyET0D6a6ToZQN6LeQZw7
 5QDeg+yF3lwKIornA2jikO1OxAF7pzq6+ZVibUMdgPlMLpP5CHFQxd0YL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872657"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875278"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875278"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/display/dp_mst: convert to struct drm_edid
Date: Tue, 30 May 2023 12:08:24 +0300
Message-Id: <9c32e5c241934093fc4144eed4c01155e1f03af1.1685437501.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the topology manager to use struct drm_edid, add
drm_dp_mst_edid_read() that returns drm_edid, and rewrite the old
drm_dp_mst_get_edid() to use it.

Note that the old drm_get_edid() ended up calling
drm_connector_update_edid_property(). This responsibility is now
deferred to drivers, which all do it anyway after calling
drm_dp_mst_edid_read() or drm_dp_mst_get_edid().

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 53 +++++++++++++++----
 include/drm/display/drm_dp_mst_helper.h       |  9 +++-
 2 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a2b8732db0c8..be71be95b706 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -1823,7 +1823,7 @@ static void drm_dp_destroy_port(struct kref *kref)
 		return;
 	}
 
-	kfree(port->cached_edid);
+	drm_edid_free(port->cached_edid);
 
 	/*
 	 * we can't destroy the connector here, as we might be holding the
@@ -2272,8 +2272,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
 	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
 	    port->port_num >= DP_MST_LOGICAL_PORT_0)
-		port->cached_edid = drm_get_edid(port->connector,
-						 &port->aux.ddc);
+		port->cached_edid = drm_edid_read_ddc(port->connector,
+						      &port->aux.ddc);
 
 	drm_connector_register(port->connector);
 	return;
@@ -4133,7 +4133,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		ret = connector_status_connected;
 		/* for logical ports - cache the EDID */
 		if (port->port_num >= DP_MST_LOGICAL_PORT_0 && !port->cached_edid)
-			port->cached_edid = drm_get_edid(connector, &port->aux.ddc);
+			port->cached_edid = drm_edid_read_ddc(connector, &port->aux.ddc);
 		break;
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
 		if (port->ldps)
@@ -4147,7 +4147,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_dp_mst_detect_port);
 
 /**
- * drm_dp_mst_get_edid() - get EDID for an MST port
+ * drm_dp_mst_edid_read() - get EDID for an MST port
  * @connector: toplevel connector to get EDID for
  * @mgr: manager for this port
  * @port: unverified pointer to a port.
@@ -4156,9 +4156,11 @@ EXPORT_SYMBOL(drm_dp_mst_detect_port);
  * It validates the pointer still exists so the caller doesn't require a
  * reference.
  */
-struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port)
+const struct drm_edid *drm_dp_mst_edid_read(struct drm_connector *connector,
+					    struct drm_dp_mst_topology_mgr *mgr,
+					    struct drm_dp_mst_port *port)
 {
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid;
 
 	/* we need to search for the port in the mgr in case it's gone */
 	port = drm_dp_mst_topology_get_port_validated(mgr, port);
@@ -4166,12 +4168,41 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 		return NULL;
 
 	if (port->cached_edid)
-		edid = drm_edid_duplicate(port->cached_edid);
-	else {
-		edid = drm_get_edid(connector, &port->aux.ddc);
-	}
+		drm_edid = drm_edid_dup(port->cached_edid);
+	else
+		drm_edid = drm_edid_read_ddc(connector, &port->aux.ddc);
 
 	drm_dp_mst_topology_put_port(port);
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_dp_mst_edid_read);
+
+/**
+ * drm_dp_mst_get_edid() - get EDID for an MST port
+ * @connector: toplevel connector to get EDID for
+ * @mgr: manager for this port
+ * @port: unverified pointer to a port.
+ *
+ * This function is deprecated; please use drm_dp_mst_edid_read() instead.
+ *
+ * This returns an EDID for the port connected to a connector,
+ * It validates the pointer still exists so the caller doesn't require a
+ * reference.
+ */
+struct edid *drm_dp_mst_get_edid(struct drm_connector *connector,
+				 struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_port *port)
+{
+	const struct drm_edid *drm_edid;
+	struct edid *edid;
+
+	drm_edid = drm_dp_mst_edid_read(connector, mgr, port);
+
+	edid = drm_edid_duplicate(drm_edid_raw(drm_edid));
+
+	drm_edid_free(drm_edid);
+
 	return edid;
 }
 EXPORT_SYMBOL(drm_dp_mst_get_edid);
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 5be96a158ab2..f962e97880b4 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -138,7 +138,7 @@ struct drm_dp_mst_port {
 	 * @cached_edid: for DP logical ports - make tiling work by ensuring
 	 * that the EDID for all connectors is read immediately.
 	 */
-	struct edid *cached_edid;
+	const struct drm_edid *cached_edid;
 
 	/**
 	 * @fec_capable: bool indicating if FEC can be supported up to that
@@ -819,7 +819,12 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		       struct drm_dp_mst_topology_mgr *mgr,
 		       struct drm_dp_mst_port *port);
 
-struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
+const struct drm_edid *drm_dp_mst_edid_read(struct drm_connector *connector,
+					    struct drm_dp_mst_topology_mgr *mgr,
+					    struct drm_dp_mst_port *port);
+struct edid *drm_dp_mst_get_edid(struct drm_connector *connector,
+				 struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_port *port);
 
 int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
 			     int link_rate, int link_lane_count);
-- 
2.39.2

