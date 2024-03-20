Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D429E88185A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B950C10E786;
	Wed, 20 Mar 2024 20:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEH/s+oR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B61310E6B7;
 Wed, 20 Mar 2024 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710965492; x=1742501492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u6/zZaAncZkZuQotY8O+E0nbKRmqLKTh+sHfaWuORDE=;
 b=nEH/s+oR9RdgA4Rrcth9bABvZoCLpQVSrDrHkMsS6FlAtFZpTOmboZQz
 PVQUhcnIkWvBkqhE2WUtO2B43H461BUMSFPiCQTTjtpGwf0lhPwe984W/
 8gMCjTmeT1yyOlCZtKd+klBHrCT5cvK9giPfEnlAKC8H2LHfdwMPdVBgP
 60+EEfM5EOUZqykbXpSBcquAK5q8nFyYkt+Da8EsxfEMulfNCLLUZA90j
 AAuzp9P7oH2g9aXssLrYZU07DF00B5CHhWf9694jVKhS9S9pXhy9Bz6ht
 Sn5AxZlrw4miYkQRrHR14WhMR7Jxt3ptw3dFq3aIb0rn7Rl06dmGJNlXW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31352341"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31352341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14246519"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:31 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
Date: Wed, 20 Mar 2024 22:11:48 +0200
Message-ID: <20240320201152.3487892-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240320201152.3487892-1-imre.deak@intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
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

Factor out a function to check if an MST port is logical, used by a
follow-up i915 patch in the patchset.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
 include/drm/display/drm_dp_mst_helper.h       | 7 +++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 03d5282094262..6bd471a2266ce 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2274,7 +2274,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
 	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
-	    port->port_num >= DP_MST_LOGICAL_PORT_0)
+	    drm_dp_mst_port_is_logical(port))
 		port->cached_edid = drm_edid_read_ddc(port->connector,
 						      &port->aux.ddc);
 
@@ -4213,7 +4213,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 	case DP_PEER_DEVICE_SST_SINK:
 		ret = connector_status_connected;
 		/* for logical ports - cache the EDID */
-		if (port->port_num >= DP_MST_LOGICAL_PORT_0 && !port->cached_edid)
+		if (drm_dp_mst_port_is_logical(port) && !port->cached_edid)
 			port->cached_edid = drm_edid_read_ddc(connector, &port->aux.ddc);
 		break;
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -5977,7 +5977,7 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
 		return false;
 
 	/* Virtual DP Sink (Internal Display Panel) */
-	if (port->port_num >= 8)
+	if (drm_dp_mst_port_is_logical(port))
 		return true;
 
 	/* DP-to-HDMI Protocol Converter */
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 3ae88a383a41f..c12f18b744d01 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -927,6 +927,13 @@ int __must_check drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *n
 void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
 void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
 
+static inline
+bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
+{
+	return port->port_num >= DP_MST_LOGICAL_PORT_0;
+}
+
+struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port);
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
 
 static inline struct drm_dp_mst_topology_state *
-- 
2.43.3

