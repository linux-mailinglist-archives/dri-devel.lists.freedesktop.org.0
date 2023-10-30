Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E77DBD13
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8310E30F;
	Mon, 30 Oct 2023 15:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBEE10E30A;
 Mon, 30 Oct 2023 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698681507; x=1730217507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gek8SoA3y+Bov3soiICekHbjTqbQ7Yj0955rYGk2gsE=;
 b=j9frC26Hn58hP7456fx+RS5JnALPTIoPmLM0m5PV3ICIftGwx88/7r9a
 uMwtQzGJjSTcDIGDsm4HLym7dgIspZDAijsxwFYtwURp0h3AV7CUK4kvz
 Pfrd3zYNFu9c5PpwyJkFJ/snHoNkSkG039BdqIFqOI8ayHXu4XRrzp99O
 iv8vuv4PWLc/iQyIV8XfXJaoJFGs6Yf3GDz6gVpS4xvTpFt260EH0GxgS
 KIOfiasw5thu40fFnVHOmn/WUrEFNHrB1VzzH8cB/4e5l5eyeY+6IPsCP
 GMGy9PMrzA0sNLp/i/GvmaI9p6vFKD/HvlKt48ChSKw1z1OGrO8SWohzp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="974402"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="974402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789493955"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="789493955"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:58:23 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 06/30] drm/dp_mst: Allow DSC in any Synaptics last branch
 device
Date: Mon, 30 Oct 2023 17:58:19 +0200
Message-Id: <20231030155843.2251023-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030155843.2251023-1-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Synaptics MST branch devices support DSC decompression on all their
output ports, provided that they are last branch devices (with their
output ports connected to the sinks). The Thinkpad 40B0 TBT dock for
instance has two such branch devices, a secondary one connected to one
of the output ports of the primary; hence the decompression needs to be
enabled in both branch devices to enable decompression for all the
sinks.

Based on the above add support for enabling decompression in last
Synaptics branch devices.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 5972c93615f18..cc0a8fe84d290 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5994,6 +5994,7 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
+	struct drm_dp_aux *immediate_upstream_aux;
 	struct drm_dp_mst_port *fec_port;
 	struct drm_dp_desc desc = {};
 	u8 endpoint_fec;
@@ -6058,21 +6059,25 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	 * - Port is on primary branch device
 	 * - Not a VGA adapter (DP_DWN_STRM_PORT_TYPE_ANALOG)
 	 */
-	if (drm_dp_read_desc(port->mgr->aux, &desc, true))
+	if (immediate_upstream_port)
+		immediate_upstream_aux = &immediate_upstream_port->aux;
+	else
+		immediate_upstream_aux = port->mgr->aux;
+
+	if (drm_dp_read_desc(immediate_upstream_aux, &desc, true))
 		return NULL;
 
-	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
-	    port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
-	    port->parent == port->mgr->mst_primary) {
+	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
 		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_read_dpcd_caps(port->mgr->aux, dpcd_ext) < 0)
+		if (drm_dp_read_dpcd_caps(immediate_upstream_aux, dpcd_ext) < 0)
 			return NULL;
 
-		if ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
+		if (dpcd_ext[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
+		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
 		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
-		     != DP_DWN_STRM_PORT_TYPE_ANALOG))
-			return port->mgr->aux;
+		     != DP_DWN_STRM_PORT_TYPE_ANALOG)))
+			return immediate_upstream_aux;
 	}
 
 	/*
-- 
2.39.2

