Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACDB27762
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1D910E9D8;
	Fri, 15 Aug 2025 03:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tqSaN982";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E6510E9D8;
 Fri, 15 Aug 2025 03:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWgYd/z6+uwaHfgArQAMgouDD2mJLMQUco0YTKgaZJcv4p723AM04CRwnvhYQYhAs8Trf9GQXvtBwOMdmU8BMxv//ps/2zdLgZF61IGNG5E+nYuFpQUhnDZNZFx+paJofecZiFtA9Z0PhDCcpq2n8LDXqC+5jTseC6F+BhIQ1qQ5nWXEw6b3P2g84tHl5xaSYIX4f/jylApNEb3XDGa1EycFT2Xtlhg/y33MYVdhQuekHPxgE2LkHzBPSAQpuxx6a0qQx7cqVmH3Vwu7DkI0syqAIw/wkt85ROZ3sVWzeWId5xa9VwrN/ezzDgTLJIuDbkCh2NiR/CkY4zBSdR7Prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJgeYztOPhxCpS3bc+l9ulZPcdNpIpPcBVm57mmtUx0=;
 b=liW6/FQ/QRP2xXE2Phhbxsg/izF/KnVlOXGeyrWnQAkFPkpJow62trm/lJa6WRn6kL6QgsHZF5MbY6AjRMw4KISjsNXpkqLvRVjKe/ArtLHFe4qvpbBRm4CkB3DuonnDYa4YybIO7hPGiUFGl6SzYFl0CgZdJipjd3SHueDa3u2JTBJ6M61l8k2p6pYevOPcMsexGjgVaHZJ9nlPq9mg6Ud2TyFD2NLgznElRbFazJPNSWC57rjmFw2pyO1yHPYy3PXP7yZVWP0998Xa5gU3DpRHVI4hyEGG2ZUj1Kd8L7M7CLD2dAHPL8u2/ogLfkKsMdD1MM9Z0hqKcTCCZzWfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJgeYztOPhxCpS3bc+l9ulZPcdNpIpPcBVm57mmtUx0=;
 b=tqSaN982mK5GYeVJJ7TGoXBrAtdxhW0t90dLe3nQL/OokKjnHBuTUazeQnJnvVEXOlx5Fo6deT4MJCpNeoCiclBsJXgBqeJUrCnb/m133xzidRqk/PLUBNCYSsmHcWA18jScVZz8RAqJLQrE1yyRk4yONwsIwdvNcWQ17YmhW4k=
Received: from BN9PR03CA0466.namprd03.prod.outlook.com (2603:10b6:408:139::21)
 by PH8PR12MB6820.namprd12.prod.outlook.com (2603:10b6:510:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 03:57:26 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::29) by BN9PR03CA0466.outlook.office365.com
 (2603:10b6:408:139::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:57:25 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:57:22 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 24/47] drm/amd/display: Add bypass COLOR PIPELINE
Date: Thu, 14 Aug 2025 21:50:13 -0600
Message-ID: <20250815035047.3319284-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c0bff9-1d84-459c-9a2a-08dddbafd882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cxdQ3JU1XcbdBBpGlX4dX0e8a0K0gY37yeAYrqTZ3LnNwelC4RSeU2+JGmFH?=
 =?us-ascii?Q?z0yyQKfHv1psLnpC0uh9OAsr0HURH76IobPMlaXpAu2jMl8FDAnfOPeSJN2W?=
 =?us-ascii?Q?bqQxMrNJeCc34fKrgNJjIMOfLyvp9VYQ4PkZkoBDnzuFVGsTKB7WfEeUYl0I?=
 =?us-ascii?Q?gYc4QmuTtCo3J2bu4ebBS+/c/SPfrX62IVfFSWVqRkuwIceXNPQ1g7Ximped?=
 =?us-ascii?Q?2Y8/U09PgXSOPUObCgHvaHWx29NL10AmxE2l1FWdfhihY+6lNnkfP4Us6Gfd?=
 =?us-ascii?Q?d5W4n94VnBSZILLJNIU762Toj7socHsV9me56N7Fz8nRTd6kIKktQK5d7DeE?=
 =?us-ascii?Q?G3zsSsti6NFCT2YNwSQT4NZFy19aK0Z6RxDdOhOH8kqDtbveDG+15K24poYi?=
 =?us-ascii?Q?ItXO5FRFCanNHDXtGUlnOi5eiGp/kFElSWHs/L2a9pxiJ0O+qd49jX3r476h?=
 =?us-ascii?Q?9OHIeUi9HFxPJH/Kg6XqL7keG0kWp9x+GW3C6IqafP/HCMVoNejpUZvdx0X4?=
 =?us-ascii?Q?UBmuRKdHlZk4WtfvQ6QyDVHWbh2gev+eUWF66TAClswHG+nC3U/olQ8ZtvFo?=
 =?us-ascii?Q?SpuBM9uti7BxTNe/tV1KjszuKeMDim1bwzKTh54f9m3ZnT0AvtjowY0FDEsA?=
 =?us-ascii?Q?4dQz6s7QqPbfXz8jKE/GRJZSBAiM02i+CWQSARWj5fjxDPtarhGtRLEs4xSx?=
 =?us-ascii?Q?2aKhXjlw2LqzEHHo8UCN6D9FvWa9UoZRTRHgXJFzNK9xTS1K9D5YVncuJDFy?=
 =?us-ascii?Q?NooyxlaU/mJB+8H23kRyDeTs6wxN6w+XES6FqrI/affsQowv5VXSMQIIgjUG?=
 =?us-ascii?Q?02L1qzDoCg+ByKknnqXnIfbbaFJAW2WNsl5hLlSUzLnP8pTbjNVyQ1XNRnnU?=
 =?us-ascii?Q?a7EcYl5p0pYdPIKKfqOvE3onDD38sbdf6wtQQW3nWSrgugzaExnZnWD8pazM?=
 =?us-ascii?Q?ioFbWfqrIG7JAGSFtfICJCtEv6fFyfWf00rT27M9JRFRdDfWsIwrXNjVd4e/?=
 =?us-ascii?Q?CT036ad6O53K7ehRP6gmYHQx/+xy4KsvOaxrwlEwl3D0XZ4bDxdvYw37y64K?=
 =?us-ascii?Q?is5GFeNxb43jteh4HJOfsLxJ8a9MNxKKCjDmnGs7uGWZT5QmXHwsxirf670+?=
 =?us-ascii?Q?UBqLbunSD82ruF8qx7bt05opqiSwivrj2YKku77ebQWvSmgMFpSwqkWCUUKa?=
 =?us-ascii?Q?KvZhXLi6+1j6iPIy4XNy6RcxcwilP+pR/S3wanr12NTVPUQXeSpPTj6YkVBT?=
 =?us-ascii?Q?uxLWfuwf11T7XfzxPQgX1i0ByOjNRFU4xAjMhh0Sgn2JN7MoaU+nwSbz3/43?=
 =?us-ascii?Q?3S2Psk1wLQtVGEG66sxickp0FMRk1AdGxUR3oTcvx/fGnJ/BBv2XDn4n6wJr?=
 =?us-ascii?Q?pKCCmgxhbt5U1CS5BAIkd8trqLPvs/mv/GwMgCbtkOO7eH5k0C9M0zSs8FRN?=
 =?us-ascii?Q?fER4bdGQ3Ug+vpLJK8xW9/zIteoSQOuR7YG3nPskff4ffgA8J7xBLZKc57AM?=
 =?us-ascii?Q?Ib/ir3fmNAb/GRY5NNSgYtAuTAUBdLoAvO95?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:57:25.4252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c0bff9-1d84-459c-9a2a-08dddbafd882
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
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

From: Harry Wentland <harry.wentland@amd.com>

Add the default Bypass pipeline and ensure it passes the
kms_colorop test plane-XR30-XR30-bypass.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v10:
 - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index eef51652ca35..7070e58856cb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1782,6 +1782,21 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 
 	return 0;
 }
+#else
+
+#define MAX_COLOR_PIPELINES 5
+
+static int
+dm_plane_init_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	return 0;
+}
 #endif
 
 static const struct drm_plane_funcs dm_plane_funcs = {
@@ -1890,7 +1905,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#else
+	res = dm_plane_init_colorops(plane);
+	if (res)
+		return res;
 #endif
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.43.0

