Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439C9C23D2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 18:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C8010E25E;
	Fri,  8 Nov 2024 17:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SanpnK/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C5B10E25E;
 Fri,  8 Nov 2024 17:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8SVJENw5PPraU6cs1JVtyBezc0A65n0ElJk/oc/yDoJoVtCebDoVGuRaqZg8h2VZgUTxlDA1b7XG7sIw+nYIRuAVNb7w72ptJx+aL85Pw17RF4pWJLY0nWIfN1+7KTmsuN/IAruZsttMG7FTXrDaj87BT3kQjHb70DrdSslL8eVe5S5VCylDLYLtzBs42IqAsFGaftTNKaUP5IqoIJFfYojmYMBpNh3z1LQ4fbWyWOt2mZ2wY/gQ7E2A5Sf4zoy2Yyh1nxT+yqr7wBOnBJKDUUVoPnk8X6iPlY8/mamI7/yE7H6oR24jsmEmd4iDQ+c0mOl+PKkRq/jXb1boVbyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw3vmDO+gtpiMVzX/0YwGjvOEf8C9cQyNWAL3qpRrNM=;
 b=OWKfLpSBfbkvzxn5QADQvPSyOgGfkUZ8Hwkj3tnVVUWvU+q12LpnNKwsUfKqoiMadRb5KlEz3O0Kkl71m97HINKRXTJb+jL75Fxe98mdCar1rBnZLD9vVpC3N+AnsoU5Kx/h7DE7u7QFmXZznEfJqigigyZkEZcLPb2cJtLiY/YvkRRAg97KLcykLBbj+l/js16HF2/u6ShuRutin+MVK/linv8RrEyeq5UkfDqGbwfqS7svwxl0CMdpRnzU+a5V+Vkd1o+ZLiwk+ZdyPk5PEpSIHP2hQBIuaN3Pg4/BdYJxpJO+ATPI986Yj2fJ5DZKC4oP44LIMj4PPzdCulmH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw3vmDO+gtpiMVzX/0YwGjvOEf8C9cQyNWAL3qpRrNM=;
 b=SanpnK/BDb7jkSK3ApW0WbXHqqNMv0R4LcT31wB/vnfoPYv/okhQ7p0nx+BpU5OqrbblUIfaiEimJFl9hjJG0z9vBDpkOoO7mjnZHf8YwhTdMRlHRAclsQGyVsYsoUjV2bx7PxDulxwyHV9zfQqZZF6aAp3KrDL7MFDHCdFTaqQ=
Received: from BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16) by
 DS7PR12MB9526.namprd12.prod.outlook.com (2603:10b6:8:251::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.22; Fri, 8 Nov 2024 17:45:24 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::c5) by BYAPR01CA0003.outlook.office365.com
 (2603:10b6:a02:80::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 17:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 17:45:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 11:45:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 11:45:22 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 11:45:22 -0600
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v4 1/2] drm/display/dsc: Refactor DRM MST DSC Determination
 Policy
Date: Fri, 8 Nov 2024 12:41:58 -0500
Message-ID: <20241108174439.141418-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108174439.141418-1-Jerry.Zuo@amd.com>
References: <20241108174439.141418-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS7PR12MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1c0009-6353-4b06-5e72-08dd001d1f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PlkrM3N/S6oY8z+VuvOhfCD8SFpywbvo9eCt+0E3Y5SD8ZBcps3kSCL7lHYk?=
 =?us-ascii?Q?P2BWs+q411cY7e/zOBqEBNU2K3TzOvS4zOVWRfupqo+43/Urp76F26YV9M7e?=
 =?us-ascii?Q?BR6MtWmQXJn2EjMCkAcXrmx7lA8+HdxOA3hLhkHWlxxWC0UNTO+Yg5XRV1L1?=
 =?us-ascii?Q?hLgSdUMGHDbWC9+oPhyDWggcKrnmihJs3fCT21OozjhQIv0jJtNohgr+cuPM?=
 =?us-ascii?Q?TO0QPwUPc74xVjla2VhgfBHidb+Rehy6liUwtK5aFh6ZfPkCBNsfoUuc5uwE?=
 =?us-ascii?Q?cSRlJ1sA1V7M2S31GWu3S58Wp0vzzNA7piTBDuwMpdKKVM54vhGEPDg+fphp?=
 =?us-ascii?Q?u391ZcmlXgBL35Ern57cLES6bA1hkRWf3tbVJQUftqZFvA3SxbEnd6IKZHz8?=
 =?us-ascii?Q?bkDDKMEdAJJLwmBZ/izdN3+EC62Om6oE6CF5OExPIVUiprk9nQxa1VEbSrqZ?=
 =?us-ascii?Q?yCWzve3iuZszfqcsxnpDvX35+ss9mu0JxhEQiexygNPAF6tjUEpeBk8IkJfC?=
 =?us-ascii?Q?nZMykoMW5Py9PDx9hRzEyY57dNsSoawilxWzygfw471q0DWww5lHFW+o8dbj?=
 =?us-ascii?Q?URZqJ1SKLrwljkYHqmTktLWBPZkRTFW31agSpKhjj3CwTzthl8fD4XkuXnqL?=
 =?us-ascii?Q?jocwyCoo+c/T7r+9I4Ms9dWIYj86OFA3DmZi8o4sHUWzc3nFAvO3aTLte3qY?=
 =?us-ascii?Q?pUstzrirR5VBU/TfG4gJwID77ADFd1UxQGh6fETGoxLv2UeyixyMgq3sWfBP?=
 =?us-ascii?Q?bJpkfBLwx4kudPMBZ9Xve4upJHhySudHa4I/JYNwy+i/B8CfaxMRrVhgh2jg?=
 =?us-ascii?Q?2DIUmV7xY9RJJzhlhuvWeVqZ4w0Pl0GkFWNc5haEiXraIRRetdHCWr0/2qRy?=
 =?us-ascii?Q?ltpzq/znYZ2HAPf/Q+5XHoOUhZY3zECBIUooLYxixJ19QV98WwUpgsJr4Zzg?=
 =?us-ascii?Q?aFzaVg7G5nlYuqYOs85KRLREhCIYmAHBDZIrO5mF/ILbYqf2bcBGVdcf3jNK?=
 =?us-ascii?Q?hfyWFbJDb+JZJLP4qAdicnm6R+LRKON+Mg7EfQcfkgkuS903bji3GZ+jHi9w?=
 =?us-ascii?Q?z77G0QUHhBI9AuOd2kQyvRSE4IbPx7iKyBIqZ/Q/1N7ZG/93WSWKYHHZs+25?=
 =?us-ascii?Q?egIAzTNChdZoGwR9NvUvHXYGW75lYd50s+/lsnnkr6GruM+xaiMt4H4rdww0?=
 =?us-ascii?Q?xhwZb1N2paFbjgS9QrFVPgj59NrJC8FE+uvdV1R3cavn3+wlWSoHJSufGVo6?=
 =?us-ascii?Q?CEWIvhNFBff4BLYBd3dTu+LFARgSPEhIUHjTG1ekbjlAHzafedPsqXrJryNv?=
 =?us-ascii?Q?mnllNQ6qm7SLXvvUs2IldLlYEZOaGxAJvvMQq1Uo7EUGEJhM0wOty7/kliXN?=
 =?us-ascii?Q?bnD1h9z8XOWf2hUPTAmdxXyhxWlQXnpIlc2Q/yTM07WHpbCaOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 17:45:23.6596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1c0009-6353-4b06-5e72-08dd001d1f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9526
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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 241 ++++++++----------
 include/drm/display/drm_dp_mst_helper.h       |   3 +
 2 files changed, 107 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ac90118b9e7a..fc4633bb21f6 100644
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
@@ -6079,115 +6030,131 @@ EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
  */
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
-	struct drm_dp_mst_port *immediate_upstream_port;
-	struct drm_dp_aux *immediate_upstream_aux;
-	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = {};
+	struct drm_dp_mst_topology_mgr *mgr;
+	struct drm_dp_mst_port *immediate_upstream_port = NULL;
+	struct drm_dp_mst_port *fec_port = NULL;
+	struct drm_dp_mst_port *dsc_port = NULL;
+	struct drm_dp_aux *upstream_aux;
+	bool end_has_dpcd;
+	u8 endpoint_dsc = 0;
 	u8 upstream_dsc;
-	u8 endpoint_fec;
-	u8 endpoint_dsc;
+	u8 fec_cap;
 
 	if (!port)
 		return NULL;
 
-	if (port->parent->port_parent)
-		immediate_upstream_port = port->parent->port_parent;
-	else
-		immediate_upstream_port = NULL;
+	mgr = port->mgr;
+	end_has_dpcd = (port->dpcd_rev > 0);
 
-	fec_port = immediate_upstream_port;
-	while (fec_port) {
-		/*
-		 * Each physical link (i.e. not a virtual port) between the
-		 * output and the primary device must support FEC
-		 */
-		if (!drm_dp_mst_is_virtual_dpcd(fec_port) &&
-		    !fec_port->fec_capable)
-			return NULL;
+	port->dsc_aux = NULL;
+	port->passthrough_aux = NULL;
 
-		fec_port = fec_port->parent->port_parent;
+	/* Policy start */
+	if (!drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
+		drm_err(mgr->dev,
+			"MST_DSC Can't determine dsc aux for port %p which is not connected to end device\n",
+			port);
+		return NULL;
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
+	if (port->parent->port_parent)
+		immediate_upstream_port = port->parent->port_parent;
+
+	if (end_has_dpcd) {
+		drm_info(mgr->dev, "MST_DSC check port %p for dsc decompression capability\n", port);
+		if (drm_dp_dpcd_read(&port->aux, DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1) {
+			drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from endpoint port\n");
+			goto out_dsc_fail;
 		}
+	}
 
-		/* Virtual DPCD decompression with DP-to-DP peer device */
-		return &immediate_upstream_port->aux;
+	if (immediate_upstream_port) {
+		upstream_aux = &immediate_upstream_port->aux;
+		drm_info(mgr->dev, "MST_DSC check immediate_upstream_port %p for dsc passthrough capability\n",
+				    immediate_upstream_port);
+	} else {
+		upstream_aux = mgr->aux;
+		drm_info(mgr->dev, "MST_DSC check root aux for dsc passthrough capability\n");
 	}
 
-	/* Virtual DPCD decompression with DP-to-HDMI or Virtual DP Sink */
-	if (drm_dp_mst_is_virtual_dpcd(port))
-		return &port->aux;
+	if (drm_dp_dpcd_read(upstream_aux, DP_DSC_SUPPORT, &upstream_dsc, 1) != 1) {
+		drm_err(mgr->dev, "MST_DSC Can't retrieve dsc caps from upstream port\n");
+		goto out_dsc_fail;
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
+	/* Consider passthrough as the first option for dsc_aux/passthrough_aux */
+	if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED &&
+			upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED) {
+		dsc_port = port;
+		port->dsc_aux = &port->aux;
+		port->passthrough_aux = upstream_aux;
+		drm_info(mgr->dev, "MST_DSC dsc passthrough to endpoint\n");
+	}
 
-	if (drm_dp_read_desc(immediate_upstream_aux, &desc, true))
-		return NULL;
+	if (!dsc_port) {
+		if (!immediate_upstream_port) {
+			/* Topology with 1 mstb only */
+			if (upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
+				port->dsc_aux = mgr->aux;
 
-	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
-		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
+			if (!port->dsc_aux) {
+				drm_err(mgr->dev, "MST_DSC dsc decompression not support at root branch\n");
+				goto out_dsc_fail;
+			}
 
-		if (drm_dp_dpcd_read(immediate_upstream_aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
-			return NULL;
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
 
-		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
-			return NULL;
+			drm_info(mgr->dev, "MST_DSC topology with multiple mstbs, dsc decompression at immediate_upstream_port %p\n",
+					    dsc_port);
+		}
+	}
+
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

