Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D89BF11D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C94A10E700;
	Wed,  6 Nov 2024 15:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gn5ZkNoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA78510E707;
 Wed,  6 Nov 2024 15:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx/cooZb9OFkCpOiYrQeM3CZ5bnNxb/R+xJasIlnXt4kHqRdVIwXpOGjleo/oBUaTI+l4z7u/ZMe1+XQtmZ9oEb9oCvZzHHbgwwEiDW/2NMoVTzC8LZeoc5tm8tPjRIneKt4OHw7xWwX7mnkPOdqVYB7Ys6s21eEQx8E8VuE14MizHVF6HWGvDsrnz42kyjBiUTrkf0xGInK0XWLFud/yu/8zQwLWbPsh3qWVyo2Jy8s7LLoKKBoDAC/3wVRASwiF/vhjevnOTAWs0FpNQ8d3HTdD36ZNlRBFclqrUIK25I0w+ThS4d8EBi8lpXmRCJrQCaIOmKGrX0EnjvsAbxD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4JYsPRNnfYVKmQXKyYoGauZ2NLvhRns2M2ehfxc5zA=;
 b=NR4KS6r1E6ULAPy5ZiDuPBXNAPoFbHck7r12v0tzrjqSncWjw3Eg9iydnybjeCIheDpJYx2YHUrCDaWcbTmmyk4/aBjfNTAASdcwVqwbRLHTWy1V6nqyJiTO+4amMNUGZX2+eMVWBXcnn27a+A63w3lS7AZTS9Euf0nbXi0eF5hlDuXk4P50x04IEytnqeB2uG0ZyV32XWT8/L08P1FYcvu/iCbLgHt/jFOljjmPz72MW0/PRe9HZnoVNTgX/O9s+YHHI/t9o0Cwp5BTr0V6yF23NgK029oUgxNtxnY63XZGCc/43pkxXLRY/i3JnMMLDk/LXqNmrqJRDAzUSaQz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4JYsPRNnfYVKmQXKyYoGauZ2NLvhRns2M2ehfxc5zA=;
 b=gn5ZkNoHNs6KNNAZpnudo7z+md5zUbIztesp4cb4dLIpQ4yLijwWeVAF+uE8TtI6/EwFLBFOMmbEFVSK5mkLLDAHtN2Iung8t2Ex6QMFhSgnp4XfDGOctkfwuUtSIaYOypP1Za9oX6XuvX3oBfuwqeT2FFlO5+KDs4zPMivajPs=
Received: from CY5PR13CA0061.namprd13.prod.outlook.com (2603:10b6:930:a::23)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:05:01 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:a:cafe::97) by CY5PR13CA0061.outlook.office365.com
 (2603:10b6:930:a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 15:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:05:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:04:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 09:04:59 -0600
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 09:04:59 -0600
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v3 2/2] drm/display/dsc: MST DSC Interface Change
Date: Wed, 6 Nov 2024 10:03:13 -0500
Message-ID: <20241106150444.424579-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106150444.424579-1-Jerry.Zuo@amd.com>
References: <20241106150444.424579-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: c1955e51-6509-482d-510b-08dcfe7462e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sM88s/zw/iRrt1buxMFU1tbLqUxqnr6djrmnFLBlsqGdWnW7TXk2Y3FzutYx?=
 =?us-ascii?Q?zjOhFy58Hmku9SeNoykvRVD3mc/13BDzxljOrxJNLXhsTtnGZvlPwT6Wt+cT?=
 =?us-ascii?Q?EPnsnj7/nENERpQHZyXYJRiybQWjFJC1wyPgyzkSFt7X+vQWu3PBcPWqr7No?=
 =?us-ascii?Q?JwWa6nOcn/C01C/34TSh9/9WJFtQDJwoHfR0uevEtlfz6mT3OIEesRz+Qkjc?=
 =?us-ascii?Q?mqEcXBVE+ASKzAdOYr/cJIzp1gSC+Rda8+XIi4K+bJhAwlM6ebXfOkHLT30X?=
 =?us-ascii?Q?DlYDpAJsBOmHOU0MyzeiXe3Z6FcOtkKDyqJpE5BjtekYWbYeiE7RpsOldMEq?=
 =?us-ascii?Q?VmBzAsqJuz6M6E9cOO07oBriXZcMNc6Zv1J78wG4WLmbpsmY4kaiK4IRdnzI?=
 =?us-ascii?Q?LMMai4iJ2a08J6QoscJStbrX4VS+SfYSgqjITke8OPqfoqs2lahaoR0zWjHv?=
 =?us-ascii?Q?r0amAXO2SWtfyAx60wkDEOLaUdbTwbLS2nEr3qoTYRwOUvBkNyk6/vxXHA8v?=
 =?us-ascii?Q?AGbWnEl63TUxpI3YeKC6SklVsmgrGRMngtlQCUbFeRa1XAnZVhwvnPkyLoxp?=
 =?us-ascii?Q?0Tyob5e/Y8qda5YCTet8fZf1NZa1TE2Vpns+po4Y0mL8HT2bj1LbQ4+U8Oqg?=
 =?us-ascii?Q?yr9WsiZESSVzoPqX3oc1XeRs1VAYFd1YuX/nxfl21DW++nJ25bb2nIrqd1kC?=
 =?us-ascii?Q?zWJ9D/haKod49o8qwtt4EGyGP7rVu2JUj+IvHZRNkmBTgL6CCZVullgQXjJl?=
 =?us-ascii?Q?YneVUimRwZ4UnU1Nvsejp9JTmfVpy/I3bi2Zk/w5H3gpKBCdY6nz7YQ+E7Pm?=
 =?us-ascii?Q?hVHr7pqYXbZSseg1mbAzpisaEsutE568c3MaQuxPfmbJ+RWgvOk5ghGGZKip?=
 =?us-ascii?Q?qKgYRktltiIlDCbEp3b9b/OcK26AiMfMSOn+kHPCI1SvZnoaZkMqy79GZJrY?=
 =?us-ascii?Q?OxA3E7t8/IIDRM02C1uboHYhTc9cxiI6UO2xjgr+TuK1UAZJcZi4Sg5jw1Ye?=
 =?us-ascii?Q?KpRSkcjBzp+A3mdfNd1kkWYWECsyyBhJXczv+13CMRiVkhF2jyp67nbEEF3v?=
 =?us-ascii?Q?Lg+SE43NwuN2F76e6WGcmnWUa60sS+DlTZJ/KqASIcFR2HKvjjAPAM5VTUnM?=
 =?us-ascii?Q?cIClRBHivzdJ6Eu+q/3dP1wOuuavLkflPmBl20hEV9xWR/tZmw2Q5KJws52A?=
 =?us-ascii?Q?D81XyAE0BvcRPX5iWK3733bC6yBc/3d2vTJYDNmAZsJ94m8ZDXk1oNMSz5q2?=
 =?us-ascii?Q?aQXR/6fNzOGkAuP2baJoiLozOgxyVRI1go5Lyh/+PyOmDn2/YpwTvDZRyGBf?=
 =?us-ascii?Q?i2+QYsyLzIxqs+B2IyAVTaIb3gF0oCZVuB2yQr4cWYDKzfGhxiwkExX2Bgbu?=
 =?us-ascii?Q?MIrTopKhkGAvTBgM0wYFgq7K2Sp3Q/FJmY8T/Vay/Mr9QshqWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:05:00.6578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1955e51-6509-482d-510b-08dcfe7462e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305
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
Starting from dp2 where dsc passthrough is introduced, it is required to identify
the dsc passthrough aux, apart from dsc decompression aux. Existing drm_dp_mst_port function
that returns dsc_aux alone is not sufficient.

[how]
1. Interface change in drm_dp_mst_dsc_aux_for_port, and dependency changes for each vendor.
2. Rename passthrough_aux with dsc_passthrough_aux to align with the name of dsc_aux.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 20 +++++------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 28 +++++++--------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 34 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 include/drm/display/drm_dp_mst_helper.h       |  6 ++--
 7 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 6a97bb2d9160..6388cae166b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1370,7 +1370,7 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
 			 * enable DSC on the sink device or on MST branch
 			 * its connected to.
 			 */
-			if (aconnector->dsc_aux) {
+			if (aconnector->mst_output_port->dsc_aux) {
 				is_fec_supported = true;
 				is_dsc_supported = true;
 			}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b0fea0856866..94ff77c8fd15 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -820,20 +820,20 @@ bool dm_helpers_dp_write_dsc_enable(
 	uint8_t ret = 0;
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		if (!aconnector->dsc_aux)
+		if (!aconnector->mst_output_port->dsc_aux)
 			return false;
 
 		// apply w/a to synaptics
 		if (needs_dsc_aux_workaround(aconnector->dc_link) &&
 		    (aconnector->mst_downstream_port_present.byte & 0x7) != 0x3)
 			return write_dsc_enable_synaptics_non_virtual_dpcd_mst(
-				aconnector->dsc_aux, stream, enable_dsc);
+				aconnector->mst_output_port->dsc_aux, stream, enable_dsc);
 
 		port = aconnector->mst_output_port;
 
 		if (enable) {
-			if (port->passthrough_aux) {
-				ret = drm_dp_dpcd_write(port->passthrough_aux,
+			if (port->dsc_passthrough_aux) {
+				ret = drm_dp_dpcd_write(port->dsc_passthrough_aux,
 							DP_DSC_ENABLE,
 							&enable_passthrough, 1);
 				drm_dbg_dp(dev,
@@ -841,24 +841,24 @@ bool dm_helpers_dp_write_dsc_enable(
 					   ret);
 			}
 
-			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
+			ret = drm_dp_dpcd_write(aconnector->mst_output_port->dsc_aux,
 						DP_DSC_ENABLE, &enable_dsc, 1);
 			drm_dbg_dp(dev,
 				   "MST_DSC Sent DSC decoding enable to %s port, ret = %u\n",
-				   (port->passthrough_aux) ? "remote RX" :
+				   (port->dsc_passthrough_aux) ? "remote RX" :
 				   "virtual dpcd",
 				   ret);
 		} else {
-			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
+			ret = drm_dp_dpcd_write(aconnector->mst_output_port->dsc_aux,
 						DP_DSC_ENABLE, &enable_dsc, 1);
 			drm_dbg_dp(dev,
 				   "MST_DSC Sent DSC decoding disable to %s port, ret = %u\n",
-				   (port->passthrough_aux) ? "remote RX" :
+				   (port->dsc_passthrough_aux) ? "remote RX" :
 				   "virtual dpcd",
 				   ret);
 
-			if (port->passthrough_aux) {
-				ret = drm_dp_dpcd_write(port->passthrough_aux,
+			if (port->dsc_passthrough_aux) {
+				ret = drm_dp_dpcd_write(port->dsc_passthrough_aux,
 							DP_DSC_ENABLE,
 							&enable_passthrough, 1);
 				drm_dbg_dp(dev,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6e4359490613..a73b14fac07f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -183,8 +183,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->drm_edid = NULL;
-		aconnector->dsc_aux = NULL;
-		port->passthrough_aux = NULL;
+		aconnector->mst_output_port->dsc_aux = NULL;
+		aconnector->mst_output_port->dsc_passthrough_aux = NULL;
 	}
 
 	aconnector->mst_status = MST_STATUS_DEFAULT;
@@ -237,7 +237,7 @@ static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnecto
 	u8 dsc_branch_dec_caps_raw[3] = { 0 };	// DSC branch decoder caps 0xA0 ~ 0xA2
 	u8 *dsc_branch_dec_caps = NULL;
 
-	aconnector->dsc_aux = drm_dp_mst_dsc_aux_for_port(port);
+	drm_dp_mst_dsc_aux_for_port(port);
 
 	/*
 	 * drm_dp_mst_dsc_aux_for_port() will return NULL for certain configs
@@ -250,19 +250,19 @@ static bool validate_dsc_caps_on_connector(struct amdgpu_dm_connector *aconnecto
 	 */
 	if (!aconnector->dsc_aux && !port->parent->port_parent &&
 	    needs_dsc_aux_workaround(aconnector->dc_link))
-		aconnector->dsc_aux = &aconnector->mst_root->dm_dp_aux.aux;
+		aconnector->mst_output_port->dsc_aux = &aconnector->mst_root->dm_dp_aux.aux;
 
 	/* synaptics cascaded MST hub case */
 	if (is_synaptics_cascaded_panamera(aconnector->dc_link, port))
-		aconnector->dsc_aux = port->mgr->aux;
+		aconnector->mst_output_port->dsc_aux = port->mgr->aux;
 
-	if (!aconnector->dsc_aux)
+	if (!aconnector->mst_output_port->dsc_aux)
 		return false;
 
-	if (drm_dp_dpcd_read(aconnector->dsc_aux, DP_DSC_SUPPORT, dsc_caps, 16) < 0)
+	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux, DP_DSC_SUPPORT, dsc_caps, 16) < 0)
 		return false;
 
-	if (drm_dp_dpcd_read(aconnector->dsc_aux,
+	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux,
 			DP_DSC_BRANCH_OVERALL_THROUGHPUT_0, dsc_branch_dec_caps_raw, 3) == 3)
 		dsc_branch_dec_caps = dsc_branch_dec_caps_raw;
 
@@ -279,10 +279,10 @@ static bool retrieve_downstream_port_device(struct amdgpu_dm_connector *aconnect
 {
 	union dp_downstream_port_present ds_port_present;
 
-	if (!aconnector->dsc_aux)
+	if (!aconnector->mst_output_port->dsc_aux)
 		return false;
 
-	if (drm_dp_dpcd_read(aconnector->dsc_aux, DP_DOWNSTREAMPORT_PRESENT, &ds_port_present, 1) < 0) {
+	if (drm_dp_dpcd_read(aconnector->mst_output_port->dsc_aux, DP_DOWNSTREAMPORT_PRESENT, &ds_port_present, 1) < 0) {
 		DRM_INFO("Failed to read downstream_port_present 0x05 from DFP of branch device\n");
 		return false;
 	}
@@ -505,8 +505,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->drm_edid = NULL;
-		aconnector->dsc_aux = NULL;
-		port->passthrough_aux = NULL;
+		aconnector->mst_output_port->dsc_aux = NULL;
+		aconnector->mst_output_port->dsc_passthrough_aux = NULL;
 
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,
@@ -1802,13 +1802,13 @@ enum dc_status dm_dp_mst_is_port_support_mode(
 	}
 
 	/*DSC necessary case*/
-	if (!aconnector->dsc_aux)
+	if (!aconnector->mst_output_port->dsc_aux)
 		return DC_FAIL_BANDWIDTH_VALIDATE;
 
 	if (is_dsc_common_config_possible(stream, &bw_range)) {
 
 		/*capable of dsc passthough. dsc bitstream along the entire path*/
-		if (aconnector->mst_output_port->passthrough_aux) {
+		if (aconnector->mst_output_port->dsc_passthrough_aux) {
 			if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
 				DRM_DEBUG_DRIVER("MST_DSC dsc passthrough and decode at endpoint"
 						 "Max dsc compression bw can't fit into end-to-end bw\n");
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a4551c17a07f..483b623961e7 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2259,7 +2259,7 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
 		    port->aux.name, connector->kdev->kobj.name);
 	drm_dp_aux_unregister_devnode(&port->aux);
 	port->dsc_aux = NULL;
-	port->passthrough_aux = NULL;
+	port->dsc_passthrough_aux = NULL;
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
 
@@ -5447,7 +5447,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 		if (!crtc)
 			continue;
 
-		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
+		drm_dp_mst_dsc_aux_for_port(pos->port);
+		if (!pos->port->dsc_aux)
 			continue;
 
 		crtc_state = drm_atomic_get_crtc_state(mst_state->base.state, crtc);
@@ -6019,16 +6020,13 @@ EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
  * Depending on the situation, DSC may be enabled via the endpoint aux,
  * the immediately upstream aux, or the connector's physical aux.
  *
- * This is both the correct aux to read DSC_CAPABILITY and the
- * correct aux to write DSC_ENABLED.
- *
- * This operation can be expensive (up to four aux reads), so
- * the caller should cache the return.
- *
  * Returns:
- * NULL if DSC cannot be enabled on this port, otherwise the aux device
+ * port->dsc_aux - point for dsc decompression
+ *   null if dsc decompression point not found
+ * port->dsc_passthrough_aux - point for dsc passthrough
+ *   null no dsc passthrough support found
  */
-struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
+void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
 	struct drm_dp_mst_port *immediate_upstream_port = NULL;
@@ -6041,17 +6039,17 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	u8 fec_cap;
 
 	if (!port)
-		return NULL;
+		return;
 
 	port->dsc_aux = NULL;
-	port->passthrough_aux = NULL;
+	port->dsc_passthrough_aux = NULL;
 
 	/* Policy start */
 	if (!drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		drm_err(mgr->dev,
 			"MST_DSC Can't determine dsc aux for port %p which is not connected to end device\n",
 			port);
-		return NULL;
+		return;
 	}
 
 	if (port->parent->port_parent)
@@ -6079,12 +6077,12 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 		goto out_dsc_fail;
 	}
 
-	/* Consider passthrough as the first option for dsc_aux/passthrough_aux */
+	/* Consider passthrough as the first option for dsc_aux/dsc_passthrough_aux */
 	if (endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED &&
 			upstream_dsc & DP_DSC_PASSTHROUGH_IS_SUPPORTED) {
 		dsc_port = port;
 		port->dsc_aux = &port->aux;
-		port->passthrough_aux = upstream_aux;
+		port->dsc_passthrough_aux = upstream_aux;
 		drm_info(mgr->dev, "MST_DSC dsc passthrough to endpoint\n");
 	}
 
@@ -6147,11 +6145,11 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 		goto out_dsc_fail;
 	}
 
-	return port->dsc_aux;
+	return;
 
 out_dsc_fail:
 	port->dsc_aux = NULL;
-	port->passthrough_aux = NULL;
-	return NULL;
+	port->dsc_passthrough_aux = NULL;
+	return;
 }
 EXPORT_SYMBOL(drm_dp_mst_dsc_aux_for_port);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fbb096be02ad..139586a75c70 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3262,7 +3262,7 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct drm_dp_aux *aux = connector->port ?
-				 connector->port->passthrough_aux : NULL;
+				 connector->port->dsc_passthrough_aux : NULL;
 
 	if (!aux)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7be8fb047b6c..e4e137b1df9f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1721,7 +1721,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 	intel_dp_init_modeset_retry_work(intel_connector);
 
-	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
+	drm_dp_mst_dsc_aux_for_port(port);
+	intel_connector->dp.dsc_decompression_aux = port->dsc_aux;
 	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 	intel_connector->dp.dsc_hblank_expansion_quirk =
 		detect_dsc_hblank_expansion_quirk(intel_connector);
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 672e8f6b5655..630ecf872e68 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -82,7 +82,7 @@ struct drm_dp_mst_branch;
  * by &drm_dp_mst_topology_mgr.base.lock.
  * @dsc_aux: aux to which DSC decompression request should be sent,
  * only set if DSC decompression is possible.
- * @passthrough_aux: parent aux to which DSC pass-through requests should be
+ * @dsc_passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
  * @connector: DRM connector this port is connected to. Protected by
@@ -138,7 +138,7 @@ struct drm_dp_mst_port {
 	struct drm_dp_mst_branch *mstb;
 	struct drm_dp_aux aux; /* i2c bus for this port? */
 	struct drm_dp_aux *dsc_aux;
-	struct drm_dp_aux *passthrough_aux;
+	struct drm_dp_aux *dsc_passthrough_aux;
 	struct drm_dp_mst_branch *parent;
 
 	struct drm_connector *connector;
@@ -959,7 +959,7 @@ bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
 }
 
 struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port);
-struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
+void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
 
 static inline struct drm_dp_mst_topology_state *
 to_drm_dp_mst_topology_state(struct drm_private_state *state)
-- 
2.43.0

