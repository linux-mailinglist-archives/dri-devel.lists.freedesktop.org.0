Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09D30A711
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0D289FE6;
	Mon,  1 Feb 2021 12:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3310A89FE6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:02:06 +0000 (UTC)
IronPort-SDR: CEX86Y9dOgoBLt+CN2ppkz4BcVLP86DmbtMUA8bIdaNOj8AnkKkUsoxbzSq9j7mEch3jPu2ove
 lSMq9JbdOOxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178108193"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="178108193"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:02:06 -0800
IronPort-SDR: OnnGcMac/+IUnQuljWEghNpBhwSPHtOwwOo+E13V1C0DTdqSS+ThUK/Y/lW3MUPjpiSv2pJfEe
 n0CiPn2jhLYg==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="390880874"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:02:03 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/dp_mst: Use DP_MST_LOGICAL_PORT_0 instead of magic
 number
Date: Mon,  1 Feb 2021 14:01:45 +0200
Message-Id: <20210201120145.350258-4-imre.deak@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the macro defined for the first logical port instead of the
corresponding magic number.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 43a40660136c..0a54506c2773 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4232,9 +4232,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 	case DP_PEER_DEVICE_SST_SINK:
 		ret = connector_status_connected;
 		/* for logical ports - cache the EDID */
-		if (port->port_num >= 8 && !port->cached_edid) {
+		if (port->port_num >= DP_MST_LOGICAL_PORT_0 && !port->cached_edid)
 			port->cached_edid = drm_get_edid(connector, &port->aux.ddc);
-		}
 		break;
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
 		if (port->ldps)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
