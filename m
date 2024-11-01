Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E29B9A33
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355C10EA0C;
	Fri,  1 Nov 2024 21:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0XXDCu5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B810EA0B;
 Fri,  1 Nov 2024 21:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkuMH1IkezBte+b6Mx22DHEfLFPj9OnzNehGEFdj5emLl90lSOzYtokWmDs+Lw9HNCaGbRl2Zwe7Keob/oEe9DEl1bM4vUtWPzNaWfYD9jPZysUJ9TPIqtRzt1vVkKuR77EMvwJO/FaMnuY5cYhlkn5N2uNtRE+20v1n9Dw/Py9piYFBkyoxlIa5YVhTbFNL8tIkyAKKVV4gHgepwcRDxqORvfV7QuwK8ugpNTs68L482CU5NPqGCt7Pepy+eumeT9xqqNmJOdw+qrR1TOPiHOyUgc3OI5WMlqDm4z0rD6GJgpZxMX2eAFEMwX+Hx+ZTCNgLs6c/rdUr8FGlb1DPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2z21Hi2qWYtxRK9sYER/PAOxJYqAgew+zLxAx2gjYE=;
 b=tQ8ItKbAl3D+ixaq290AfMpuXkV+uumvhQ9g882EfKD4uyqkcht3FEWcv174L+410K3u/kNLvcG61PyxX3u8ESbWRQP1es2xCFlAHUAHk+dpm/S7yXCH/qLp3+CbnAa+txJhTZUZiR9TsksD2TtcoxrXd56zdacOKWOZlyGNPVg99Du4dMtBuT5HTC87uCMlobLFKBy53mTZDSjfjFEbnIOxa9n/ET3mCC1Ck6Ue6jabIDB6+TqXhDLHB9rK+zqAsNZfFr8S5B8a5SWdKLs8CfoHslu3hGRkOdkWnOxrWj7tQVZY8Hu1nLhANUnu3si/gMOUmv0rrmpBu7JQkjuGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2z21Hi2qWYtxRK9sYER/PAOxJYqAgew+zLxAx2gjYE=;
 b=0XXDCu5yIvQ5bbdsmq62zaoNsydL5y8DV/3BVtB9W2L1q1quFGHChOg3IS+pogy0EILXToxUcIAjc/osd0QbCuRnIK5gd/RRAArdvQmTr6Zqk0jsSgI93MRMUqGR5zzvAHGB6ViZRfR4gcItPfcuPkJ3WqxOI4SPdkUW5XBZK2w=
Received: from BY5PR16CA0008.namprd16.prod.outlook.com (2603:10b6:a03:1a0::21)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.25; Fri, 1 Nov
 2024 21:26:03 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::f2) by BY5PR16CA0008.outlook.office365.com
 (2603:10b6:a03:1a0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Fri, 1 Nov 2024 21:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 21:26:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 16:26:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 16:26:02 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Nov 2024 16:26:01 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <lyude@redhat.com>,
 <jani.nikula@intel.com>, <imre.deak@intel.com>, <simona@ffwll.ch>,
 <wayne.lin@amd.com>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v2 2/2] drm/display/dsc: MST DSC Interface Change
Date: Fri, 1 Nov 2024 17:24:17 -0400
Message-ID: <20241101212546.4060-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241101212546.4060-1-Jerry.Zuo@amd.com>
References: <20241101212546.4060-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 54851fd8-09e4-4100-203b-08dcfabbc9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mqUpm0vda65oiQzsEdirzckTCBZDhrhTcp3C/Ez56VEzorjb26TEpNBy5Zdt?=
 =?us-ascii?Q?3aOpp7fOEYcR/233egfijciELlY1uJ7Dv0WoOpg4Y61+/50AJmCqSKd+A8HN?=
 =?us-ascii?Q?Mxz/Gv34G1RLqcLT9jcjXLBFBwk7CKAwVBSIpp6siSa1UwYQa3lqiWPXUuXW?=
 =?us-ascii?Q?0JakGhFQ81pwbZciGZby74OLRXlFsZBGf13bFfjsVdBYPnSxWB77zsfOm4F9?=
 =?us-ascii?Q?ma0o9xJ78DLiI37jRjMihf5fZP6h6WnQRJz/xLNTip4fNpErL5xZyF16mNQd?=
 =?us-ascii?Q?v46FTfnEmXxWk/QywxPzx5UElfCjkd/dtG48LtqVg0NI2GIn8yx+vehU5ESe?=
 =?us-ascii?Q?TDxV+FjGORc2QYlB2sCM2AEQTRT9D7BHFH/0yMjdwntcJ5pO83b2Y/Or8azg?=
 =?us-ascii?Q?/JwZXyg59JLJIWnCF/AqEZuK6EuZUpAvvJ5Q4S/NSTpPOhMIlgGJUZqn6asM?=
 =?us-ascii?Q?1LWWCSnOK46GPIBD7DJTDLizoUxUJqEkOAvCAaHpLna3jNZlFX/Ay6fupAC6?=
 =?us-ascii?Q?bK2JtR48yHFXKgSCTq29DDUS1GTjdhzx4cxSUdy3fQCMmycWqzae0S9LNXkM?=
 =?us-ascii?Q?CP9lxD3FcOiRaQA8lqP7hjAazUKvlNEQVerS/Wh9PstN+udwaCn106eDNFWx?=
 =?us-ascii?Q?ngJPubQHVF8N//4Nch60agKT7EevIgKFS3fFMQg8vs1StLG8Z9nw+GqEhaIK?=
 =?us-ascii?Q?LJFdUCERGUmeFHbXfwuwmCiX8aveBXo4H9e85qiGp+37btUoDyo23YNbu9TS?=
 =?us-ascii?Q?wdvEkdbUt2lju9s0vhqcUbQwktSKU24Ljmf1bsNZOBimuPFdXXoncVwokend?=
 =?us-ascii?Q?mSoMZXPuVabs2eBQwH1pHb7vodRJhRHBTi/s8Bi7N62Xtj2wQXKqedSS80yK?=
 =?us-ascii?Q?qf1ad6hXaxMzsGvqVU4sKen5J8JTw0mJH+9ad4ExmmpgO4qIbH3959DUObqo?=
 =?us-ascii?Q?8s7+qwuwEoEkW4noJSm45xWZEr6NhpOhZTAjbjJ+PFlDbVjNMxnX/4sBwYfT?=
 =?us-ascii?Q?r/WLn8mMXPmh9qrs+V7cGxY/RoMg9aqHHblleTBUGv0PA0uZKbgKmyASyIS0?=
 =?us-ascii?Q?Ox4BigbdJgLWodsjAEyLCf1e+oKVZVTxYZGWVebB4Ig42meS/VOM0zdpy5So?=
 =?us-ascii?Q?7Wcycc8LCJ4P7Y1VB5egBm4TYPY/9PVJPLgW5coeXLZLioYlxsl/p4NgfMuI?=
 =?us-ascii?Q?+xgfU4FlFr2twA2gMzSpp1/hNphaFpSb9oTSQX/Kok2BgYw8yD+OHg+30Yt3?=
 =?us-ascii?Q?ojqFkpN0qexcM1V9BcK5sUNTIKodG+/5098bJ1W76vcMx/nevrtzsF2xnLkP?=
 =?us-ascii?Q?L8x8p3x9gAUmq25Gq6mVEqdZa99wPavX48ZJFEAdo9xqvG8JwrNW9u3kfR0N?=
 =?us-ascii?Q?n7+IEclSS0vmyAOqbfN9spBOEaCj2qjp4Z2gYRPod0CvbX04YA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 21:26:03.0811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54851fd8-09e4-4100-203b-08dcfabbc9de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436
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
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 30 ++++++++--------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 34 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 include/drm/display/drm_dp_mst_helper.h       |  6 ++--
 7 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index db56b0aa5454..0da703f4ccac 100644
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
index 069e0195e50a..2e5e490f9027 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -810,20 +810,20 @@ bool dm_helpers_dp_write_dsc_enable(
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
@@ -831,24 +831,24 @@ bool dm_helpers_dp_write_dsc_enable(
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
index a08e8a0b696c..5d2653e1a5f6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -183,8 +183,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
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
@@ -501,8 +501,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
-		aconnector->dsc_aux = NULL;
-		port->passthrough_aux = NULL;
+		aconnector->mst_output_port->dsc_aux = NULL;
+		aconnector->mst_output_port->dsc_passthrough_aux = NULL;
 
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,
@@ -1302,7 +1302,7 @@ static bool is_dsc_need_re_compute(
 			continue;
 
 		aconnector = (struct amdgpu_dm_connector *) stream->dm_stream_context;
-		if (!aconnector || !aconnector->dsc_aux)
+		if (!aconnector || !aconnector->mst_output_port->dsc_aux)
 			continue;
 
 		stream_on_link[new_stream_on_link_num] = aconnector;
@@ -1787,13 +1787,13 @@ enum dc_status dm_dp_mst_is_port_support_mode(
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
index 90fa73575feb..4520456a6680 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3228,7 +3228,7 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct drm_dp_aux *aux = connector->port ?
-				 connector->port->passthrough_aux : NULL;
+				 connector->port->dsc_passthrough_aux : NULL;
 
 	if (!aux)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 15541932b809..73cb1c673525 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1699,7 +1699,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
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

