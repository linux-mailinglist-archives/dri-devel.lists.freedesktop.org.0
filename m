Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847639BF122
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509FB10E726;
	Wed,  6 Nov 2024 15:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mAiu11XR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068310E720;
 Wed,  6 Nov 2024 15:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5LIgn84qP/j04CVsKPQFgzq4Ra55zonuiWiqVbUsltq/TMW8n1Dc4I424f8n88Szbn3ORx59o22UdzyBED2Se2w2JimNUYtcXvBwI17VL99baGDtdbCAXiEIjiKV7X0yMHYK9f69fnWOlamtm0Lh+BLEr/tWa2JGr5w5PKuC29kac/Hj63x4c7cT7wXvbv6JKrqpFRZKKVBRvqTnymofaTsu6NNa7jFiQZiEh2sO7ONvGhgScdyWzHeYpVMQRV+xI87k2cYlYr51dzirAXDzH4Vb7tnhSaFQqkOrDk6srSEvwjzEM3QPmHR7+Kh2AwCTfhR18PTJ3sZbW4SMQMQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryqbUZCRYf7D3iMN8XFhJbroMdAdT9I7DY85lcjCTxE=;
 b=HdcTYwpmxSKlPVOnfmEzbYZt6Ej1wAe8on+E/AWZU31fsWOd9o4Q1lAlNkOdvzCk0OkFtat8Qvfi0eA5lbaQ63grooLR/gItOy+iGf6uYOwy4FDVnJuSXfC6HAnfe3daKmDBsh9oFpdO8IgL6oHxLJeq9pkK5Fwv5mtyL2aLoU8lm9C6fZRWgM0umHtcYqISCLdEj0+HvtF0ozh4QeIWsvfdmkeDVz5/bqVEh8fS2OFnzscXkn8RH53bPG4G1/P0ewwQ7PVsyQ1garPx2LJeT/vgoNbV3JknSftOggbn/usbadPH0UectPpWzA6cyKlKBzx4GQp9SOuKwEUzBkQcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryqbUZCRYf7D3iMN8XFhJbroMdAdT9I7DY85lcjCTxE=;
 b=mAiu11XRt/eRcLzXFm62uMo7v58Knwt2dNKu5sQSRb2PByE2SD+/fG8vkonj+uioJsXbdPPMCjJlnX9LEIIaZX5+vCEAH5yCMnJiyeFLCkQXcRa8Ba1eHGNUjgX388f2WMCzxhZ1ZQ0VlGSzP/7YnXwVUmyR8H2APWbl9KpzuhE=
Received: from BY3PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:39b::27)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:05:05 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::27) by BY3PR05CA0052.outlook.office365.com
 (2603:10b6:a03:39b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.17 via Frontend
 Transport; Wed, 6 Nov 2024 15:05:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:05:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:04:59 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 09:04:58 -0600
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v3 1/2] drm/display/dsc: Refactor DRM MST DSC Determination
 Policy
Date: Wed, 6 Nov 2024 10:03:12 -0500
Message-ID: <20241106150444.424579-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106150444.424579-1-Jerry.Zuo@amd.com>
References: <20241106150444.424579-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 182e431b-0494-43cf-4c4a-08dcfe7465ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZcVA7TDhi28bSkkNz1mPfXNi9bSAc1pSF6KsPLiQo/Ii0NuBDfINlZkNrgLw?=
 =?us-ascii?Q?JOHo43IUUV5Vt734xOgLO7cK8DckPDgjuyadpMZFYBX6CtWrbuyJydcnNI87?=
 =?us-ascii?Q?hFP9xslugL9nKJW84T2uk0DEupvUN1Pd49772iOwIsm+i5tMUpXxSKwkog6f?=
 =?us-ascii?Q?5vYgP8iAWeJ6vr/a5Ikt9crq0Tt653GPSqhapj6NObHPTkY/00MDIy+zJ5KP?=
 =?us-ascii?Q?6uWP01EmqHvzbYrJFayfji/dBDsnviRhaAqceMoqVO32bzp2npzXdML+YRs3?=
 =?us-ascii?Q?N3ouslhFo0mQWKISCHCNPgkYVlQDDymHb25YWchuYj/AUdXtAVZkDezN/UhX?=
 =?us-ascii?Q?8jo0mIy0p3TllGnDn6LMIB6a6LT7HnUoVygE7mkCSBJ3EEl96M96mFgSgqxo?=
 =?us-ascii?Q?rSqWtE17xjCuiVgwF57SrW4KuYinCr4PUCSxd2FFju79emweB3jB3IHAUTkX?=
 =?us-ascii?Q?PbluREocNlI7SluA0hOKuoPQ7LEcmhyFLZL27UykxiIQGFwCwUd1dp3Ke0FM?=
 =?us-ascii?Q?WnyM3yXq4kbuMHauEdw7tSLZi4werA3jkzqXfuLfpSE1/JEcS+Wyrp7j2QR9?=
 =?us-ascii?Q?Y9GCp3aRSmuqvr/8yEt/aIbidc3251wasJTphsuCotUzS6UTrFVMRufbDDDa?=
 =?us-ascii?Q?2Pb/wVA5yfaLOQ0MTEk9aSDKEcLsA5LGGHej33UPt+COJKi/4oUg4iuelBu7?=
 =?us-ascii?Q?TXTuHgU3+3Gl089BGl2Xu2ZJo4pUvLsdCrucuHaIoJJczCjLNYCxeqlDQlCz?=
 =?us-ascii?Q?1J+Y9o707H6aGecw/gXAmS/nqAVPY9ri4Y91wD/uGOuqOuSMx6tVrouPYHfW?=
 =?us-ascii?Q?+r4MIGENbivhop789M+JT4MsAOlmChxS6Bh5MbLEStMVAPTGYR5umxMDYAfM?=
 =?us-ascii?Q?RL8txTINxbITxsvA3RgH2DPlhqYq0tNnBSfw7DSNFEd3FlmXDu7a6WiXDvae?=
 =?us-ascii?Q?vRS8p9uFppzsz8QSCQu0Rbka//Y22gexeZNEfT34A4oDLJObPDiuamvIOmBy?=
 =?us-ascii?Q?ueFjBCpP6fO9+kHspuqYpBk65pfaMmWeznSM1NDGUSIbhphMtQ02ZwMb6Xdt?=
 =?us-ascii?Q?17sfkHWEnOHd1c52y0RjN8CPbUbJn/gHqtJMPcAe4l2aA7E9U3Vxq14lEVhM?=
 =?us-ascii?Q?z79BosdOCCBiD51w4JZ8jv2zrhGTNHb01kpCHJza3mb2JAymdpDAv+7JqKAd?=
 =?us-ascii?Q?fWLRc0UdueupJBTWNulQfNLA2vFarpfVisMPP1DZBMb0Mo7l++VogP2/2d2R?=
 =?us-ascii?Q?4Yd0U1oLFX9O3vAv0Ghs97FIKDQ4CLw5/JcVhxSPGWgu2HYj7XOdFKzZNiz1?=
 =?us-ascii?Q?QbQDtkcVulqXgcLPk+44IgrNR/LhnipZBZjPqre1azPT9HNjiMRiAoPbPoAv?=
 =?us-ascii?Q?4EN//XUXKEKsEEu+COytFX36ApSxZWHFSRIvYq61SZzsPbxxZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:05:05.3566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182e431b-0494-43cf-4c4a-08dcfe7465ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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

[why]
How we determine the dsc_aux used for dsc decompression in
drm_dp_mst_dsc_aux_for_port() today has defects:

1. The method how we determine a connected peer device is virtual or not
   in drm_dp_mst_is_virtual_dpcd() is not always correct. There are DP1.4 products
   in the market which don't fully comply with DP spec to enumerate virtual peer device.
   That leads to existing logic defects. For example:

   -  Some 1.4 mst hubs with hdmi output port don't enumerate virtual dpcd/peer device.
      When probing the hub, its topology is constructed with a branch device only, with
      peer device type set as DP-to-Legacy converter for its HDMI output port.
      Under this condition, drm_dp_mst_is_virtual_dpcd() will still determine it's connected
      with a virtual peer device with virtual dpcd. And results in the section for
      analyzing DP-to-DP peer device case of drm_dp_mst_dsc_aux_for_port(). That's logically
      incorrect.

2. Existing routine is designed based on analyzing different connected peer device types, such
   as dp-dp, dp-hdmi peer device, and virtual sink. Such categorization is redundant and unnecessary.
   The key info of determining where to do dsc decompression relies on the dsc capability from dpcd
   only. No matter the mst branch device enumerates virtual dpcd or not, if it's supporting dsc, it
   must declare it's dsc capability at somewhere within its responded topology.

Therefore, we would like to refactor the logic how we determine the dsc aux.

[how]
1. dsc_aux should be determined by the topology connection status and dpcd capability info only.
   In this way, dsc aux could be determined in a more generic way,
   instead of enumerating and analyzing on different connected peer device types.

2. Synaptics quirk DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD analyzing is no longer needed
   as long as we determine dsc aux generically by dpcd info.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 238 ++++++++----------
 include/drm/display/drm_dp_mst_helper.h       |   3 +
 2 files changed, 104 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ac90118b9e7a..a4551c17a07f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2258,6 +2258,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
 		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
+	port->dsc_aux = NULL;
+	port->passthrough_aux = NULL;
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
 
@@ -5994,57 +5996,6 @@ static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
 	i2c_del_adapter(&port->aux.ddc);
 }
 
-/**
- * drm_dp_mst_is_virtual_dpcd() - Is the given port a virtual DP Peer Device
- * @port: The port to check
- *
- * A single physical MST hub object can be represented in the topology
- * by multiple branches, with virtual ports between those branches.
- *
- * As of DP1.4, An MST hub with internal (virtual) ports must expose
- * certain DPCD registers over those ports. See sections 2.6.1.1.1
- * and 2.6.1.1.2 of Display Port specification v1.4 for details.
- *
- * May acquire mgr->lock
- *
- * Returns:
- * true if the port is a virtual DP peer device, false otherwise
- */
-static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
-{
-	struct drm_dp_mst_port *downstream_port;
-
-	if (!port || port->dpcd_rev < DP_DPCD_REV_14)
-		return false;
-
-	/* Virtual DP Sink (Internal Display Panel) */
-	if (drm_dp_mst_port_is_logical(port))
-		return true;
-
-	/* DP-to-HDMI Protocol Converter */
-	if (port->pdt == DP_PEER_DEVICE_DP_LEGACY_CONV &&
-	    !port->mcs &&
-	    port->ldps)
-		return true;
-
-	/* DP-to-DP */
-	mutex_lock(&port->mgr->lock);
-	if (port->pdt == DP_PEER_DEVICE_MST_BRANCHING &&
-	    port->mstb &&
-	    port->mstb->num_ports == 2) {
-		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
-			if (downstream_port->pdt == DP_PEER_DEVICE_SST_SINK &&
-			    !downstream_port->input) {
-				mutex_unlock(&port->mgr->lock);
-				return true;
-			}
-		}
-	}
-	mutex_unlock(&port->mgr->lock);
-
-	return false;
-}
-
 /**
  * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
  * @port: MST port whose parent's AUX device is returned
@@ -6079,115 +6030,128 @@ EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
  */
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
-	struct drm_dp_mst_port *immediate_upstream_port;
-	struct drm_dp_aux *immediate_upstream_aux;
-	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = {};
+	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
+	struct drm_dp_mst_port *immediate_upstream_port = NULL;
+	struct drm_dp_mst_port *fec_port = NULL;
+	struct drm_dp_mst_port *dsc_port = NULL;
+	struct drm_dp_aux *upstream_aux;
+	bool end_has_dpcd = (port->dpcd_rev > 0);
+	u8 endpoint_dsc = 0;
 	u8 upstream_dsc;
-	u8 endpoint_fec;
-	u8 endpoint_dsc;
+	u8 fec_cap;
 
 	if (!port)
 		return NULL;
 
+	port->dsc_aux = NULL;
+	port->passthrough_aux = NULL;
+
+	/* Policy start */
+	if (!drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
+		drm_err(mgr->dev,
+			"MST_DSC Can't determine dsc aux for port %p which is not connected to end device\n",
+			port);
+		return NULL;
+	}
+
 	if (port->parent->port_parent)
 		immediate_upstream_port = port->parent->port_parent;
-	else
-		immediate_upstream_port = NULL;
-
-	fec_port = immediate_upstream_port;
-	while (fec_port) {
-		/*
-		 * Each physical link (i.e. not a virtual port) between the
-		 * output and the primary device must support FEC
-		 */
-		if (!drm_dp_mst_is_virtual_dpcd(fec_port) &&
-		    !fec_port->fec_capable)
-			return NULL;
 
-		fec_port = fec_port->parent->port_parent;
+	if (end_has_dpcd) {
+		drm_info(mgr->dev, "MST_DSC check port %p for dsc decompression capability\n", port);
+		if (drm_dp_dpcd_read(&port->aux, DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1) {
+			drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from endpoint port\n");
+			goto out_dsc_fail;
+		}
 	}
 
-	/* DP-to-DP peer device */
-	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
-			return NULL;
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
-			return NULL;
-		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
-			return NULL;
-
-		/* Enpoint decompression with DP-to-DP peer device */
-		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
-		    (endpoint_fec & DP_FEC_CAPABLE) &&
-		    (upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED)) {
-			port->passthrough_aux = &immediate_upstream_port->aux;
-			return &port->aux;
-		}
+	if (immediate_upstream_port) {
+		upstream_aux = &immediate_upstream_port->aux;
+		drm_info(mgr->dev, "MST_DSC check immediate_upstream_port %p for dsc passthrough capability\n",
+				    immediate_upstream_port);
+	} else {
+		upstream_aux = mgr->aux;
+		drm_info(mgr->dev, "MST_DSC check root aux for dsc passthrough capability\n");
+	}
 
-		/* Virtual DPCD decompression with DP-to-DP peer device */
-		return &immediate_upstream_port->aux;
+	if (drm_dp_dpcd_read(upstream_aux, DP_DSC_SUPPORT, &upstream_dsc, 1) != 1) {
+		drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from upstream port\n");
+		goto out_dsc_fail;
 	}
 
-	/* Virtual DPCD decompression with DP-to-HDMI or Virtual DP Sink */
-	if (drm_dp_mst_is_virtual_dpcd(port))
-		return &port->aux;
+	/* Consider passthrough as the first option for dsc_aux/passthrough_aux */
+	if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED &&
+			upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED) {
+		dsc_port = port;
+		port->dsc_aux = &port->aux;
+		port->passthrough_aux = upstream_aux;
+		drm_info(mgr->dev, "MST_DSC dsc passthrough to endpoint\n");
+	}
 
-	/*
-	 * Synaptics quirk
-	 * Applies to ports for which:
-	 * - Physical aux has Synaptics OUI
-	 * - DPv1.4 or higher
-	 * - Port is on primary branch device
-	 * - Not a VGA adapter (DP_DWN_STRM_PORT_TYPE_ANALOG)
-	 */
-	if (immediate_upstream_port)
-		immediate_upstream_aux = &immediate_upstream_port->aux;
-	else
-		immediate_upstream_aux = port->mgr->aux;
+	if (!dsc_port) {
+		if (!immediate_upstream_port) {
+			/* Topology with 1 mstb only */
+			if (upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
+				port->dsc_aux = mgr->aux;
 
-	if (drm_dp_read_desc(immediate_upstream_aux, &desc, true))
-		return NULL;
+			if (!port->dsc_aux) {
+				drm_err(mgr->dev, "MST_DSC dsc decompression not support at root branch\n");
+				goto out_dsc_fail;
+			}
 
-	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
-		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
+			drm_info(mgr->dev, "MST_DSC topology with 1 mstb only, dsc decompression at root branch\n");
+		} else {
+			/* Topology with multiple mstbs */
+			dsc_port = immediate_upstream_port;
+			endpoint_dsc = upstream_dsc;
+
+			if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
+				port->dsc_aux = &dsc_port->aux;
+			else {
+				drm_err(mgr->dev,
+					"MST_DSC dsc decompression not support at immediate_upstream_port %p\n",
+					dsc_port);
+				goto out_dsc_fail;
+			}
 
-		if (drm_dp_dpcd_read(immediate_upstream_aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
-			return NULL;
+			drm_info(mgr->dev, "MST_DSC topology with multiple mstbs, dsc decompression at immediate_upstream_port %p\n",
+					    dsc_port);
+		}
+	}
 
-		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
-			return NULL;
+	/* Check the virtual channel from source till dsc port link support FEC */
+	fec_port = dsc_port;
+	while (fec_port) {
+		/*
+		 * Each link between the output and the source
+		 * must support FEC. Note that virtual dpcd fec is identical
+		 * to the fec capability of it's MST BU's DPRx
+		 */
+		if (!fec_port->fec_capable) {
+			/* read fec cap one more time in case fec not capable return from enum path result */
+			if ((drm_dp_dpcd_read(&fec_port->aux, DP_FEC_CAPABILITY, &fec_cap, 1) != 1) ||
+					!(fec_cap & DP_FEC_CAPABLE)) {
+				drm_err(mgr->dev, "MST_DSC Failed to retrieve fec caps at port %p\n", fec_port);
+				goto out_dsc_fail;
+			}
+			fec_port->fec_capable = true;
+		}
 
-		if (drm_dp_read_dpcd_caps(immediate_upstream_aux, dpcd_ext) < 0)
-			return NULL;
+		fec_port = fec_port->parent->port_parent;
+	}
 
-		if (dpcd_ext[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
-		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
-		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
-		     != DP_DWN_STRM_PORT_TYPE_ANALOG)))
-			return immediate_upstream_aux;
+	/* Ensure fec between source and the connected DPRx */
+	if ((drm_dp_dpcd_read(mgr->aux, DP_FEC_CAPABILITY, &fec_cap, 1) != 1) ||
+			!(fec_cap & DP_FEC_CAPABLE)) {
+		drm_err(mgr->dev, "MST_DSC fec not supported between source and the connected DPRx\n");
+		goto out_dsc_fail;
 	}
 
-	/*
-	 * The check below verifies if the MST sink
-	 * connected to the GPU is capable of DSC -
-	 * therefore the endpoint needs to be
-	 * both DSC and FEC capable.
-	 */
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
-		return NULL;
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
-		return NULL;
-	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
-	   (endpoint_fec & DP_FEC_CAPABLE))
-		return &port->aux;
+	return port->dsc_aux;
 
+out_dsc_fail:
+	port->dsc_aux = NULL;
+	port->passthrough_aux = NULL;
 	return NULL;
 }
 EXPORT_SYMBOL(drm_dp_mst_dsc_aux_for_port);
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index f6a1cbb0f600..672e8f6b5655 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -80,6 +80,8 @@ struct drm_dp_mst_branch;
  * @next: link to next port on this branch device
  * @aux: i2c aux transport to talk to device connected to this port, protected
  * by &drm_dp_mst_topology_mgr.base.lock.
+ * @dsc_aux: aux to which DSC decompression request should be sent,
+ * only set if DSC decompression is possible.
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
@@ -135,6 +137,7 @@ struct drm_dp_mst_port {
 	 */
 	struct drm_dp_mst_branch *mstb;
 	struct drm_dp_aux aux; /* i2c bus for this port? */
+	struct drm_dp_aux *dsc_aux;
 	struct drm_dp_aux *passthrough_aux;
 	struct drm_dp_mst_branch *parent;
 
-- 
2.43.0

