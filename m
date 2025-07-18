Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A3B0AADC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 21:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3824C10EA36;
	Fri, 18 Jul 2025 19:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rDDMZBrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CC810EA37;
 Fri, 18 Jul 2025 19:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kie9Pz6o80BYZID7AZhQDxQM6R+9OV93IIQCxwLeTGBQnXLdSdTUPs/gBwStg672pW1+oQouRGERNl/Ao+3NyAmRmFp2Onu6F+1fHV46utWTbiZMDXvfRwhIg9IYcPmVb9YxdyRjSAUVEOWTEgcSPUlrp2tENp9I/TOZqNekOEBInfbXko4lOKQLFuGXpTHX/uqrUhQrVHtUeMVG97A151kHsjWjZkWw7W/78NSMEhSLUOoGL+ZGonOhh1nYGGY6Cw4gDBY2Wx5UYcLSOT6TvdShoXCBzJZnNlsavwDT0on7s5apoxNji5IkCb0pc6QviVbaSLs97y6GG1yf24IAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h/vvLTr3vp23UIWRG1caB1uXy4sSnpqNlISDykx+MA=;
 b=vaCdFmkzlW7nzSmTjNJDX9JOTNW2+qqWgKDoBFLjQSY01N4P7bOSO29MLi+K1xiJji7i5YEztIprX21lYiTPmJPebv+R3Qie169y2mHFGcj4QuVcuq+ACIEMVT3kTAird+vuXrNoy+dKk1W3AgXjmao/DiBDZ7MZRQDqOpv9LVHCbeJ9rz716lyLt0k6WQe/eKipECEeLTK8jgiderPKDJS6aN+/kXtWBlGaO45HeJ7h2uTIqeIDtS5dqcGi1r3SZtzb6p2c6GiWN5r3SQVI6EALhkjQ2jx2H/LIOOt5g2L6qPcxIkKTtDDcBhfvu8MrCHroQ5xYGfGEBaGzn8Cdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h/vvLTr3vp23UIWRG1caB1uXy4sSnpqNlISDykx+MA=;
 b=rDDMZBrcOar2PVbwqqu8xeya8MuE317GXTNUOo4fG7pyVgV4/+BygvXIxoFU1Y9KwWV5RZcbCYnLG8NauNXCAQYZvYRq0aTPfhziEyUWCh76Pjj3w5igSrbutATW5GAo3BKErxn3Pdif3U1ZFq8njnpw8h/s3IBlP2Mhhg/uH6c=
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 19:57:53 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::23) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 19:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 19:57:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 14:57:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: update mmhub 3.0.1 client id mappings
Date: Fri, 18 Jul 2025 15:57:36 -0400
Message-ID: <20250718195738.2919761-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: cd02fd57-ffd6-49aa-4846-08ddc6356110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1sEtXt4lYLd/swHh2N7MBXUhqH6zbjTYRpKEAemPoR0CDb4LLcBMoD448loj?=
 =?us-ascii?Q?4uWwGhhlCLjXRvKFLf5cX5tZlI43vyLVc6/1lFDbZwPTYiKSG381vCwU/piA?=
 =?us-ascii?Q?r87jiU6sFaeriWySAVKhqo077BP53WCfEy1AOTnjpgrklgvf49hVZAs3VBXN?=
 =?us-ascii?Q?Z3WihHPKzUpEvI3jrdhISD01o9zRnI5LyXpl1J/qFHajl8/4LTYsoXsoV6Hw?=
 =?us-ascii?Q?CYUlR12dYQN1yI3h6jw/ftbH4N2TF2EInOOyMyfhnrs8VtH5NxedcL2oUKg1?=
 =?us-ascii?Q?s8qsskrtUMsrqpZD8tiVygDEioIiOEgh6QRSAwD6fixCd2AjuLttQfrIXMQ4?=
 =?us-ascii?Q?LEZUa1nB9WZ4BaUFTg2zzxge5LEq8ZtYW4bNrOwBv17ni9620myNiS9bNkhW?=
 =?us-ascii?Q?9b8BVCA/t05LHaRYpgwio3SHXsK53AW8PQBHy5le+79sJYZ/ECPBnS8dQ1pW?=
 =?us-ascii?Q?c0mBYxt9V5eNurnbk0a4+RUg3l9hF4RItGlvTBW0/xydbEPWPV0QL6K+jgoY?=
 =?us-ascii?Q?bko3wepDWz8nnF457Hgu1WuNIAcFFaP5hwUNXpri8w0fFMrk/rnnzcsmfPFe?=
 =?us-ascii?Q?rb+pHEHDgQLwBPj/LBV4x6vvfEla6JcYzpmhCmFjOnLmtE+TjLfad/gvqjBc?=
 =?us-ascii?Q?TtQovj2tg985lghYE50R/st17EOLkjIHbkwoITxs2PehbGwT8o2RvVpFKnQx?=
 =?us-ascii?Q?tHlcV82zPUC3rV+kmuwhWNS4qzLdIe8YfE7IOXSFMbmxFQzl4KFak2TNHIHL?=
 =?us-ascii?Q?btT4fmvBR7gtsVBqszsaTh5hERi38Nd7KK6VyU+eC2t77TigpculJI87vvOc?=
 =?us-ascii?Q?ZDWCgz49mzyxBS0RRUBIdPmzAIaaFZFevIo5Jmi/TCEOrccNlZHNlsM56u8H?=
 =?us-ascii?Q?nhyASsJFfdqkeVm8KCXE86c3MaDfCB+UGdDbPgBHWkzDmjgTQ2VYDEiLDPAw?=
 =?us-ascii?Q?ros+G3K6m/gKJ5XCK2k2i4wbv9Lt219FTwKs5k19Td5EQxCnU+j0pLogf3S6?=
 =?us-ascii?Q?r/Mb4wNjUVLOZeTJWlCqIv4M41ftXVAWiy0pdyeGXbhv8sE1vBXtsHS3s3oi?=
 =?us-ascii?Q?ppi6WEKNqKM6Wjv4VLQYRGLmf+s3gnZKWsVmkKTO154qzd2N98tZ9gv8WDDR?=
 =?us-ascii?Q?5UVyukvZ4aUwSHt21AXv3H4mV9P6mpicQxz5tXdR3sTde04hAymYu7/29zgd?=
 =?us-ascii?Q?KJeGk05hPS4GJucUmZJodm51nFimv08MGCFnHjw/uqT2UTz2XBU9dr199asM?=
 =?us-ascii?Q?8CvbO/x6NwmW2QPZBG2vyBh8hcY9LOClyZu7ElzO0NdlzIMfYkevFK0Aq1S3?=
 =?us-ascii?Q?XCSR0oDQEwMtxM4m6uG8Zesfh2IV2jps59fbY63cmXIeLZ8HJyp4XaX8B4yG?=
 =?us-ascii?Q?k5urcS9sGdrfpXcRTKc+2lxkt2+8846fzrUVgkYtJkmQQTwfBmA7uorn2CHn?=
 =?us-ascii?Q?7OfBAakR+oYerEw5//+1ayTNpTmdfNcOPXNJftMk7GwpohMg7gNc47V20NOC?=
 =?us-ascii?Q?Xg/COgUn6adwoLeSbCBLG4OhHR+/Su/AhRtg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 19:57:51.9859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd02fd57-ffd6-49aa-4846-08ddc6356110
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396
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
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c | 57 +++++++++++++----------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
index 134c4ec108878..910337dc28d10 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
@@ -36,40 +36,47 @@
 
 static const char *mmhub_client_ids_v3_0_1[][2] = {
 	[0][0] = "VMC",
+	[1][0] = "ISPXT",
+	[2][0] = "ISPIXT",
 	[4][0] = "DCEDMC",
 	[5][0] = "DCEVGA",
 	[6][0] = "MP0",
 	[7][0] = "MP1",
-	[8][0] = "MPIO",
-	[16][0] = "HDP",
-	[17][0] = "LSDMA",
-	[18][0] = "JPEG",
-	[19][0] = "VCNU0",
-	[21][0] = "VSCH",
-	[22][0] = "VCNU1",
-	[23][0] = "VCN1",
-	[32+20][0] = "VCN0",
-	[2][1] = "DBGUNBIO",
+	[8][0] = "MPM",
+	[12][0] = "ISPTNR",
+	[14][0] = "ISPCRD0",
+	[15][0] = "ISPCRD1",
+	[16][0] = "ISPCRD2",
+	[22][0] = "HDP",
+	[23][0] = "LSDMA",
+	[24][0] = "JPEG",
+	[27][0] = "VSCH",
+	[28][0] = "VCNU",
+	[29][0] = "VCN",
+	[1][1] = "ISPXT",
+	[2][1] = "ISPIXT",
 	[3][1] = "DCEDWB",
 	[4][1] = "DCEDMC",
 	[5][1] = "DCEVGA",
 	[6][1] = "MP0",
 	[7][1] = "MP1",
-	[8][1] = "MPIO",
-	[10][1] = "DBGU0",
-	[11][1] = "DBGU1",
-	[12][1] = "DBGU2",
-	[13][1] = "DBGU3",
-	[14][1] = "XDP",
-	[15][1] = "OSSSYS",
-	[16][1] = "HDP",
-	[17][1] = "LSDMA",
-	[18][1] = "JPEG",
-	[19][1] = "VCNU0",
-	[20][1] = "VCN0",
-	[21][1] = "VSCH",
-	[22][1] = "VCNU1",
-	[23][1] = "VCN1",
+	[8][1] = "MPM",
+	[10][1] = "ISPMWR0",
+	[11][1] = "ISPMWR1",
+	[12][1] = "ISPTNR",
+	[13][1] = "ISPSWR",
+	[14][1] = "ISPCWR0",
+	[15][1] = "ISPCWR1",
+	[16][1] = "ISPCWR2",
+	[17][1] = "ISPCWR3",
+	[18][1] = "XDP",
+	[21][1] = "OSSSYS",
+	[22][1] = "HDP",
+	[23][1] = "LSDMA",
+	[24][1] = "JPEG",
+	[27][1] = "VSCH",
+	[28][1] = "VCNU",
+	[29][1] = "VCN",
 };
 
 static uint32_t mmhub_v3_0_1_get_invalidate_req(unsigned int vmid,
-- 
2.50.1

