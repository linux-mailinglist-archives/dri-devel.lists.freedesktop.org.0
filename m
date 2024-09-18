Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668B97C17A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 23:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9785110E656;
	Wed, 18 Sep 2024 21:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OkBbL1zZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077510E64B;
 Wed, 18 Sep 2024 21:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Deo5dbLAF7PBy+IoHZg9cCQmTDVltX0Eb2x8I66kRax1OrvYHYCCzHgFWuzraoxb+/cwKh8772xnN+TUU9xIo1pDqlhAMYLH2BpdvOJhZorl7JmvCF1ZBMxTZViMPgQbZzuKVBVRCIY+mdwWunv4ctBuR2KaRz1gY17mngvjUPxzmSHWzLQzKLyi3QdXAIF7UE65FFVO+7wFENoiyGyTX/j83cDrShRbRQcCvC1o8bDUq+nSb5bGbZwogHX4J/K/5iI9kEKb3X6R6xE84DV9QlgBBryV3C6AnkE/tjQT1pjgldmYWr2birBRFRtwJ+CgDliJADhg5XP/fr5XErOugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj6o+E/7soH4P9TmjO3lsydetwUvXpTVWLPGVSsFZfM=;
 b=Fiep5F2Pvl+Zvk6RO8X2LGo/Vs2DVnd/yCNs5tvmZpM5vDnuVdIxeKo4dsT047XnvxY5griLb9HKGqNUbYtuROw7FlY8RPKi6SL/eSpFsTME2+ishBIZzEBheajWmqTPZ5sm8yTAJqklabD4DruWaexvo/VJZJVz3rSxs4yo5QME8SsgZpldTyI7IYGtxa/+1SNNlpZzXhMLE1MrSuXBkBeeR/C/xrGTYZSfkkCUsorSiaI4u41s8b7sHVVJzF9uc9s+ihvZXHjPZozaS+FU1jVuAeRojcJyBMD/cI0531vzTkZikPEPSB/ViPxbZhGAQx2NS2BnfFs+8gvB8yV5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj6o+E/7soH4P9TmjO3lsydetwUvXpTVWLPGVSsFZfM=;
 b=OkBbL1zZ5sTMfw57iDKJLKQtjyvunRfdfgFv6vV0zbngHdDbCVAgoeeXPR2Jhdh923WonXdLLb84J38e7EPN16/I84SpaOtF8iv2L9zsM89NF4sMMm9G7w6LA3MIidOeel1nwghYAOKCyTnW+nptz4QsCZLSobBzNZrGB7pv4rI=
Received: from SN6PR01CA0006.prod.exchangelabs.com (2603:10b6:805:b6::19) by
 CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.24; Wed, 18 Sep 2024 21:39:15 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::1a) by SN6PR01CA0006.outlook.office365.com
 (2603:10b6:805:b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 21:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 21:39:15 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 16:39:13 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Hung <alex.hung@amd.com>, Alexander Deucher
 <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: <kernel-dev@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v7 04/10] drm/amd/display: remove redundant freesync parser
 for DP
Date: Wed, 18 Sep 2024 16:38:39 -0500
Message-ID: <20240918213845.158293-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: f32f8fa2-5747-41b0-622e-08dcd82a57d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ZBzD3j+GBrZctnkpeBUhu1sgpIMzI9jN5NHS4mztlZpKvqfu7c/sY5y6j1R?=
 =?us-ascii?Q?jf+NA3GiYo1VeNd+/Q5SxtQXwT37cHaQORdsFCbqB3FJlvSdvPl4l4bbjyEa?=
 =?us-ascii?Q?OLt6mz3BY6A+uFA272Hu52+VGfl+lQMHiu6/EnzBP5hB5qDYsSV53PSzotKO?=
 =?us-ascii?Q?Zqe2JZ9ZLuWiTPNvV8I1IJK28BWgTLc9AHLBpSPrvXMj9SMERmSbNKsanUeZ?=
 =?us-ascii?Q?+HEdhX2nh0kCHGvegldTV1QXWwn3mamOVXBKFcX+RKhOsSo/eQezcJn9rcrJ?=
 =?us-ascii?Q?EfRHg6wdvcPufoE1EnQMH7s0pXcqb8A3R4VUFr5npNjopKc7mO9H8ji1Yng1?=
 =?us-ascii?Q?C/hwIM2qs02IaJdVORIV21vY+ZGjww933BlXqDELnk1v35aR4nWNWKhHv18S?=
 =?us-ascii?Q?5nFlgAGp0gPNGb+KYyckPAT1cBdm/Bt/2DLIjxsR+Q5J691m+H3+0Tolm86P?=
 =?us-ascii?Q?PA1ezA+RCfSj1MbtJefFDoC/1cRNsJevmHLfAkW5OUznqKUVWBcLo6qmuRjU?=
 =?us-ascii?Q?Hsx9zFzxh+AvgbrugmFE1+WaoLOoLoPN0jAuPX8FBpn4JNNpD7qqsBRkEga5?=
 =?us-ascii?Q?PKx+0T1XZbF2J5oCSfZ+sskkJRSURYZlZm5SuPWS2KcBJYddCmDD5YP2fiYv?=
 =?us-ascii?Q?zY1aXVw7wF+a3D74WNNlRDrJwMI5VS+4DCloaUf1BvryrPEmt/q7+wwECkQJ?=
 =?us-ascii?Q?VtuvC8ye83qtvHg6PJswtGFZscBzcv0B5RrFNg7Dkjc3sf0bquhb+CdLMQgL?=
 =?us-ascii?Q?m8XxqnS8wzvKBygG8OsLzT+kvyfjzOKz1nMYyKNbscnz5Glfez3Yf5EFDIp1?=
 =?us-ascii?Q?qh2TyAoQcVEFcHVoXkAaTH1v1oGVWSxXQJUOZeKDeeOa2kceLnW4xz06pIHd?=
 =?us-ascii?Q?3KlfuOex6FieZBWhBBVU145EjVZieDcHKHTt0rBiHav+kHQPhczZS3GoQPqt?=
 =?us-ascii?Q?Q7aNivUFwKkdOfdcoPIU/aXBPlqB/6gbso4lQ/HO19o+UlZmUj+7/iIgXiN+?=
 =?us-ascii?Q?5pEUBYq0praNNG5v7FIjRDKNMv8CD+GlR0nN9ZOorE6FR6gcJAt/L18vhKqj?=
 =?us-ascii?Q?D/DFPiYAizv3ft0Se1VLLCxFwUgoNSti7LGFLjTrvFhMwyjy1rT+sOe8ExBS?=
 =?us-ascii?Q?Ykol/U85cUua7j4dZ6LMs77KuD4kw1higGh1CK4G5JqXv7ScCq5VuXsIPhXU?=
 =?us-ascii?Q?nH2GvHrmtS7dNQOIFxOL8Gqn6pAyNiwUHt65lUv7QGAfFjPG0KhjfxidAR6K?=
 =?us-ascii?Q?d82l8P83jcbShOd9r+W/v9qunZHG8Hat4cXrH2m5YVxraCDmtd6VBQ0EF3I7?=
 =?us-ascii?Q?TUkmxLX7oRloQNPilxutZkb8KyQCOW+5lnDTFlJM3yo81tLreokVQzk0XO8x?=
 =?us-ascii?Q?vbNRIdnHGszgdFAzzUHO0MxnloGvkyuQMkvHbzmrw+So4HMfdICr3/d0y+vF?=
 =?us-ascii?Q?gt7/0RCfUA869xPGUVw0ggLIt8vhG+2j?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:39:15.2461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f32f8fa2-5747-41b0-622e-08dcd82a57d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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

From: Melissa Wen <mwen@igalia.com>

When updating connector under drm_edid infrastructure, many calculations
and validations are already done and become redundant inside AMD driver.
Remove those driver-specific code in favor of the DRM common code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 74 +------------------
 1 file changed, 4 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index efc1609ff26f..bd8fb9968c7c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12064,9 +12064,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	const struct detailed_timing *timing;
-	const struct detailed_non_pixel *data;
-	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
@@ -12093,8 +12090,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
-		connector->display_info.monitor_range.min_vfreq = 0;
-		connector->display_info.monitor_range.max_vfreq = 0;
 		freesync_capable = false;
 
 		goto update;
@@ -12114,67 +12109,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
-		bool edid_check_required = false;
-
-		if (amdgpu_dm_connector->dc_link &&
-		    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
-			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
-				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
-				if (amdgpu_dm_connector->max_vfreq -
-				    amdgpu_dm_connector->min_vfreq > 10)
-					freesync_capable = true;
-			} else {
-				edid_check_required = edid->version > 1 ||
-						      (edid->version == 1 &&
-						       edid->revision > 1);
-			}
-		}
-
-		if (edid_check_required) {
-			for (i = 0; i < 4; i++) {
-
-				timing	= &edid->detailed_timings[i];
-				data	= &timing->data.other_data;
-				range	= &data->data.range;
-				/*
-				 * Check if monitor has continuous frequency mode
-				 */
-				if (data->type != EDID_DETAIL_MONITOR_RANGE)
-					continue;
-				/*
-				 * Check for flag range limits only. If flag == 1 then
-				 * no additional timing information provided.
-				 * Default GTF, GTF Secondary curve and CVT are not
-				 * supported
-				 */
-				if (range->flags != 1)
-					continue;
-
-				connector->display_info.monitor_range.min_vfreq = range->min_vfreq;
-				connector->display_info.monitor_range.max_vfreq = range->max_vfreq;
-
-				if (edid->revision >= 4) {
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
-						connector->display_info.monitor_range.min_vfreq += 255;
-					if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
-						connector->display_info.monitor_range.max_vfreq += 255;
-				}
-
-				amdgpu_dm_connector->min_vfreq =
-					connector->display_info.monitor_range.min_vfreq;
-				amdgpu_dm_connector->max_vfreq =
-					connector->display_info.monitor_range.max_vfreq;
-
-				break;
-			}
-
-			if (amdgpu_dm_connector->max_vfreq -
-			    amdgpu_dm_connector->min_vfreq > 10) {
-
-				freesync_capable = true;
-			}
-		}
+		amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
+		amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+		if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
+			freesync_capable = true;
 		parse_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 
 		if (vsdb_info.replay_mode) {
@@ -12182,13 +12120,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
-
 	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
-			timing  = &edid->detailed_timings[i];
-			data    = &timing->data.other_data;
-
 			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
 			amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
 			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
-- 
2.34.1

