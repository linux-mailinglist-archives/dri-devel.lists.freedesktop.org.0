Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC78A777E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9565B112EAE;
	Tue, 16 Apr 2024 22:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm85RkDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678AE112EAE;
 Tue, 16 Apr 2024 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713305388; x=1744841388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcOTZvPluUWi3TlBWm1Rt6q+OAoeayjbbfJiJqcFrRg=;
 b=fm85RkDAT3hwoYlQqnTeBI3OeExOilzrXDzURGbPhA4st27vvG5Zou0A
 zw3PRKtw7w7siiXk6clDNjJlUwpbLc85MbYDqCS3FtC7Ji92y/wzyQjge
 c7wecxnIbfAJSREUWreD4nV767NpBIRsy5/rDIs3YZcMMSetKUQkIi+6h
 4NvkCxUwRH7Y9JiwiviGic8fJvFr7EdUE1jw5Yrw492UBjSQn5vGZOAYA
 b+aFAQ/DguxTfZ4Bm6Hd7s1x6XSQeoE4z2BUM62r5mTBTiG3YbA68qiVk
 gNEneAQzK+LAV7BlYlzudHlQwC9JJKDaGrspOx7gjeuosHIWVxDPyLqjc w==;
X-CSE-ConnectionGUID: UVMSU0VgR7iGElHFaqPCCA==
X-CSE-MsgGUID: p+6Odq6cQLu49BP4uAbZtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20165176"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="20165176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:48 -0700
X-CSE-ConnectionGUID: bcK/CPCKSxSiY4Pfsgg8Yg==
X-CSE-MsgGUID: jkaC6CYkSiOWF6qct3KZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="26965502"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:47 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 08/11] drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
Date: Wed, 17 Apr 2024 01:10:07 +0300
Message-ID: <20240416221010.376865-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240416221010.376865-1-imre.deak@intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
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

v2: Move drm_dp_mst_aux_for_parent() forward declaration to the next
    patch. (Ankit)

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
 include/drm/display/drm_dp_mst_helper.h       | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index c193be3577f7a..46b99d5fe0086 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2274,7 +2274,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
 	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
-	    port->port_num >= DP_MST_LOGICAL_PORT_0)
+	    drm_dp_mst_port_is_logical(port))
 		port->cached_edid = drm_edid_read_ddc(port->connector,
 						      &port->aux.ddc);
 
@@ -4219,7 +4219,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 	case DP_PEER_DEVICE_SST_SINK:
 		ret = connector_status_connected;
 		/* for logical ports - cache the EDID */
-		if (port->port_num >= DP_MST_LOGICAL_PORT_0 && !port->cached_edid)
+		if (drm_dp_mst_port_is_logical(port) && !port->cached_edid)
 			port->cached_edid = drm_edid_read_ddc(connector, &port->aux.ddc);
 		break;
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -5983,7 +5983,7 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
 		return false;
 
 	/* Virtual DP Sink (Internal Display Panel) */
-	if (port->port_num >= 8)
+	if (drm_dp_mst_port_is_logical(port))
 		return true;
 
 	/* DP-to-HDMI Protocol Converter */
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index cbcb49cb6a460..f00e32b0315d7 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -948,6 +948,12 @@ int __must_check drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *n
 void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
 void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
 
+static inline
+bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
+{
+	return port->port_num >= DP_MST_LOGICAL_PORT_0;
+}
+
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
 
 static inline struct drm_dp_mst_topology_state *
-- 
2.43.3

