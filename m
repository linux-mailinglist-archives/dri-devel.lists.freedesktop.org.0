Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7DBB0AADD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 21:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2F10EA35;
	Fri, 18 Jul 2025 19:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vYG9yefk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1510E189;
 Fri, 18 Jul 2025 19:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ve1nx1EQ+r3RVRmvN0A2nMQ+t8/rR7Ow2jcnlul5GWtyaJNOIM6vj2BQ485mVqeESfdgY1OhEvbf25okL8sgbaVPqwCef5lc0oMIxRc5DRbq9FYSBWQYbLyjnjwG/v61X3sJlXog5B6Cgr9c8TZprvKGcT2sJKF152JEDWlcP39GPV3nzHLyYFrR16rC6BcFFLrvvIEAEvubt/DaGO+7745jpmonTX5sa2d0xcneTg2bs6Sl6k86Yvaiaw5lRZ810r3g8db0W4FKmTJ+8RN0l1fHUVHjN/+LERhPIsgq9McTrRF9yO0SAMcaqcTpKYHmbwjenJ1swWpwtqlvLBYFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XafOx6cUnXdEwU6ciMZv4qlfohG+vOqV4ahtBEWHNVs=;
 b=OJs5+wSQKl0z+OL5Z1vp9v1Pbm/OrestkYvoe1VwWc71mESxI3Z8cysdEBi0ViVzqPXhlkJ8XfVga1kpIckpKrcKlMNs7i1iq+MLI9gN2aLw8TDW6dv6QouEJKQPVHPcO28W+8TZXjA7NcALq5L3kY/BuT2VHltsCIwqK305J5nJGMH8ZTFNRGpZLVhXLlQMscszAVtXue3WqyZ1rdksrYsqUZN7/IOvrCkP3Cw5FofMGiOk10zb8zfWnZKtCYVoz/ihXMMPLu6gsXH1ZK63mjeeLS59nYeHmD6lf/ugXBqyLNN2Eb9oSUbCeO3bT/g3wkJMlOgMphjzuvybXzLHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XafOx6cUnXdEwU6ciMZv4qlfohG+vOqV4ahtBEWHNVs=;
 b=vYG9yefk6Y1tbge9jh8S6LmE1yuG/hho+Kd3ncUf4JjIQkLRaX1I8S4AYKG0aMN4LGNW8DdSh6/9AZHQ1/TDzS+f64GXq5ie3R7avq0Mi933jBql1Id0tESMdhKpxCsmBJn0N9YqnJacCEXvp4KVXHMgLHR6Dd5SOdd8X3VVpbo=
Received: from SA0PR11CA0021.namprd11.prod.outlook.com (2603:10b6:806:d3::26)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 19:57:54 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::30) by SA0PR11CA0021.outlook.office365.com
 (2603:10b6:806:d3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 19:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 19:57:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 14:57:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: update mmhub 4.1.0 client id mappings
Date: Fri, 18 Jul 2025 15:57:38 -0400
Message-ID: <20250718195738.2919761-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718195738.2919761-1-alexander.deucher@amd.com>
References: <20250718195738.2919761-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: c41fe65e-df50-414f-62eb-08ddc63562a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U26BdiAIqwFzwjMYOBnqMDzZ1Hbx/NMhdn+oEN6sTeCHC0Bmn1K58DAykw6n?=
 =?us-ascii?Q?yXNkvL20wBjvOx6MxmccyLDjaGUNYQNPWbUBE7Lszsl+Wlp1Ry8DAjwGp4Nb?=
 =?us-ascii?Q?Tmm4JF0i6isFcPkPBd+R8YlHE/OlPrubFIsuS9qESFKKPtKD/hpKcdCAG/cQ?=
 =?us-ascii?Q?rE48I98rV+fgguYovhDlCVWmIPYHRtue9Vtw4MrDHXYL2YCNYUgiZlRyizoN?=
 =?us-ascii?Q?+qb9yOMk7FpkMNpPe8g2yUpa60DRVHTmtcIJp4buAWhwEDhdDioxSiPRB0bD?=
 =?us-ascii?Q?XY54jdBhKTO5CZ/DUtzCW9T0PWTUEYdnjyAjcWl2VZK+eR7vx5arp3hZIm20?=
 =?us-ascii?Q?Ccv4lKpzvAq6LIvr4PwaZlTsOPXIW8mxKBKyOT31IboOvBdk5ZFH3SQzErFH?=
 =?us-ascii?Q?Y74127fQiP6gqZRRjMVUdzLat2jkCYBb1z4ed74NsHIASGyiwMi+b2zZoVnu?=
 =?us-ascii?Q?B3GaJRgNPTkpSISQDdTCL6EcPaKn9oVZpJuWfkx+2L/gMWYqlGwN+WIq+WmR?=
 =?us-ascii?Q?jci6y+tVX4f7sb9ZDJeu/3yr7b56wMTdZifSak53jHRykgbKRyTUA8m8Tq3d?=
 =?us-ascii?Q?X2jFuZOKZH8d36cQ0SGVfAy+qW23bwb/k0GVntAAqXF56rbx5r5+POp5xNhD?=
 =?us-ascii?Q?YHFy8+lQh1bBYVeCn+s1ZewTiUlUhh2gln0KlC+fNYGVjpU3ZtRk9w6DYGvb?=
 =?us-ascii?Q?OkF81o9MhgsjZW6hWX3wjEuKmaT34feZHGk8hAt3syZXh1okio7nDkO+MCbp?=
 =?us-ascii?Q?M4jxrqwY/wJBnqTxCsRV+Jq/0fozE8GXWs2XhIvpCWknqioDauAmCzFfl7C+?=
 =?us-ascii?Q?Eea1NGgQXyvDRZetznUKHV41oNgVgeRWUl7SjazgMq/Uir9FkEtVcTvQcoRZ?=
 =?us-ascii?Q?j/4somi+XmVbdoA2iFkVG7noi4TD8CM/BwSbYRA4nPSHtq3XUSsSZ/tdPgyy?=
 =?us-ascii?Q?LvRgRB7m3l0cmXmNB0LwJjcTrR98WaOYHlyaIdnf/y49M/7bD1DwVfZmn4YZ?=
 =?us-ascii?Q?vlLwJnj7JqAQcfXYUKT71h6c6GMp4VccZcv9rNv+xE0mhRCAyqvlATnOPQmW?=
 =?us-ascii?Q?jT/6ImHfDAQp2IscjVlCZU50w9+2pNVXfI3HEp/Mb+p5aTizAanPptVYN5Lp?=
 =?us-ascii?Q?fl8fGB5sYFhed//jW2pK2ZnNCs7e1eTKkwMhLfeAsqVKTfXZR/Xy2+HmwL7o?=
 =?us-ascii?Q?wHj20cnc2T5HTZXUeuoI0LiRwUaGskmGoyxAK2+pdd9wZo9lbpCEVH+Pt0VR?=
 =?us-ascii?Q?+xmfQ9CPL/bH8zzWPjZjvN22zLgYgcaNHHQmrZ/XDHC/CxGibq7dIbmBlq5T?=
 =?us-ascii?Q?QLTD3BCmJ1jvXjKYzoZ1RoSud9B9ylYcIJVPCVR4dlb7XbQ4GTTtvEyJ551S?=
 =?us-ascii?Q?ibwLp/Te/WIyFLefR7+PTraiZhGyT/nRJ2uegyv6pKnVjY0UaygJMUgjNv98?=
 =?us-ascii?Q?AvZA2crDS2soNExgC128M1KWwn4X9hf5rcdciUXOtYJq3BxNHvZqSbUlf/Gt?=
 =?us-ascii?Q?gNoYajpF1qqqBRMKALg9woO60OlmQ4K0IW4Y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 19:57:54.6082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41fe65e-df50-414f-62eb-08ddc63562a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247
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

Update the client id mapping so the correct clients
get printed when there is a mmhub page fault.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c | 34 +++++++++--------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
index f2ab5001b4924..951998454b257 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
@@ -37,39 +37,31 @@
 static const char *mmhub_client_ids_v4_1_0[][2] = {
 	[0][0] = "VMC",
 	[4][0] = "DCEDMC",
-	[5][0] = "DCEVGA",
 	[6][0] = "MP0",
 	[7][0] = "MP1",
 	[8][0] = "MPIO",
-	[16][0] = "HDP",
-	[17][0] = "LSDMA",
-	[18][0] = "JPEG",
-	[19][0] = "VCNU0",
-	[21][0] = "VSCH",
-	[22][0] = "VCNU1",
-	[23][0] = "VCN1",
-	[32+20][0] = "VCN0",
-	[2][1] = "DBGUNBIO",
+	[16][0] = "LSDMA",
+	[17][0] = "JPEG",
+	[19][0] = "VCNU",
+	[22][0] = "VSCH",
+	[23][0] = "HDP",
+	[32+23][0] = "VCNRD",
 	[3][1] = "DCEDWB",
 	[4][1] = "DCEDMC",
-	[5][1] = "DCEVGA",
 	[6][1] = "MP0",
 	[7][1] = "MP1",
 	[8][1] = "MPIO",
 	[10][1] = "DBGU0",
 	[11][1] = "DBGU1",
-	[12][1] = "DBGU2",
-	[13][1] = "DBGU3",
+	[12][1] = "DBGUNBIO",
 	[14][1] = "XDP",
 	[15][1] = "OSSSYS",
-	[16][1] = "HDP",
-	[17][1] = "LSDMA",
-	[18][1] = "JPEG",
-	[19][1] = "VCNU0",
-	[20][1] = "VCN0",
-	[21][1] = "VSCH",
-	[22][1] = "VCNU1",
-	[23][1] = "VCN1",
+	[16][1] = "LSDMA",
+	[17][1] = "JPEG",
+	[18][1] = "VCNWR",
+	[19][1] = "VCNU",
+	[22][1] = "VSCH",
+	[23][1] = "HDP",
 };
 
 static uint32_t mmhub_v4_1_0_get_invalidate_req(unsigned int vmid,
-- 
2.50.1

