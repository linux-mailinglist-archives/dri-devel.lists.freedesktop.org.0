Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC93B0AADF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 21:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E558410EA3A;
	Fri, 18 Jul 2025 19:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c7UR3i3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8D210EA36;
 Fri, 18 Jul 2025 19:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+qpociugig0nsCogO+DIm5yFmbRVITAJdvG9D7n2rtOxnpTMDd27i26XCc7Ecs1vo1vlmhN8EC8484JANhNfaBMwPCGYTjOoz65Pv/dk/ZTz4Bzl/8pk7rWo4+fBVoieYll1wOZvGJYZ2d3Ku3jzIaaLiKjqXh0J0oQfp8dUKvVMuh6kst2vGWXK9AaGF1vqrg2ejObpw/3GqVszGe5hqFWYjQTxd3D0+y38W8rLScTtru0+7MJ6D3IsMmMv/5R88cqihb2TyzJJUsZMEZz5lr96dZXfl6CPYAZD9j4JCS7/x83iM+KC6pIiKGbhULVX7yO/yJB9H8swRfZhwGa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzYqkxjY2OeSDxIid0aBVe/745Qu1zlmzhno9o+hVlI=;
 b=nPxv0H13WR8hcOcDOBfv/9y5pVygTViKm0+KG0SJnjnSgsD/3K77RgjcWqCgXAYZ3DH+DETiAZuBt4S+EJtfP7UgDdqJLbjdUukw1HImoQz6UlvhgtFWePJ3Mo4Vrm+OkIOT2Rs8Fx/YoormL/zBleY5lDULEdnwPCCL6SHqr8sAO8G3zqpjfjB8Z/JXd2d1L8pAmnkC8UjegSUZr9R4NXyUDS+1S3QpvZpVC7sJVI18ALwDaHfIrqvG/IYn7azvWRY54grKlNWC0YMwvc3vQSICPU8uIlSKt9a0uiA1DsgslE8VfnpWnxT6wkjfj+AB7ZFwSr4ISaxoKFNmC9rxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzYqkxjY2OeSDxIid0aBVe/745Qu1zlmzhno9o+hVlI=;
 b=c7UR3i3gYDLs5oQf9ICgR08h0zJz6qmkPa/ky3wP7jCAoj7FGzLPTkBI39asybBqGgqVV3OzHkKr141B8VmRmZsX8B/UhUXrPNGiMoLyZrGJb5U/la48laWeO4hIPqjHCL6W+asA9IEVOI6By+oGSakh/i9jAMYMqwLsxpoAoWk=
Received: from SA0PR11CA0021.namprd11.prod.outlook.com (2603:10b6:806:d3::26)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 18 Jul
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
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 19:57:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 14:57:51 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: update mmhub 3.3 client id mappings
Date: Fri, 18 Jul 2025 15:57:37 -0400
Message-ID: <20250718195738.2919761-2-alexander.deucher@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9e7f51-d15b-488a-8040-08ddc635620a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rx0G7cIl5xAHXpnppRy66A6NLzvFKmhhvoy4Ehxjm6fR/DgiZNsvn3DQY3Ag?=
 =?us-ascii?Q?EZKwwu3sRejRivzoOQVXIzw26SG77JxTgDqeJ5OetN1CvTQPtf6pGXuLUEsM?=
 =?us-ascii?Q?6tr/3fNW7hfoxCZ4+px4mO04jY3c4TQ3mxH+LbedE1ArGAM1FrA39ki/M0tn?=
 =?us-ascii?Q?Me6s3/JhNOL/VF/IY0gfwc8CF/7dvYoKqgNf0WITc3YBkIvssgJin+WUVcWe?=
 =?us-ascii?Q?bTQ5/t8gcOEdc4ZexGZME1eF/Ynbk7booJYWqJ66K3TN9uRbU7LjeEpjyrJY?=
 =?us-ascii?Q?252aoKa681b+7r1CLSP5eCSfXgGbLbKGIEeQO/VwXk0WdL+TovD1rdL10r/5?=
 =?us-ascii?Q?cwLpi0IRi21sXLHNaHbNFA8kJvQUzGSa/9vJZpMM5fhvuqwkypTCSZVBaEAT?=
 =?us-ascii?Q?Zda+cw04GuZDxaCzbht2kNRE7Zj9j8s6IZC06uOZEzhrIBbPTAg63zFPEmTJ?=
 =?us-ascii?Q?STrftj9wIeJKPtfGAmafWJSbArg+QaY4Ap6yuifuZOiAB14U6Tm4COtcxmAT?=
 =?us-ascii?Q?h1vsxJp9rmD04O2MWguUuK9gj6Pjt3V8FeUBE6cCFhiDs+O0vWZYuLSKfAlg?=
 =?us-ascii?Q?duoVWf1I5VULW5Y1sMIEch0yxoMyTojwCCUdCf6+uyKPXFSPoQjWTT0pog0t?=
 =?us-ascii?Q?136sr5DvD/YQcIvSIRalq9SWKkQm1UN7mNCKxiDCGwHicLaMiS6Yt3OxjX/K?=
 =?us-ascii?Q?F9PfCEiZP520Uto4S4fOzL6Rk/VQ7ovzCikmI0/N0SE50LQCmjE7Vn1Z2Z89?=
 =?us-ascii?Q?NdwazPH+FhiGYHg3iMGUNoM6P9bRPyr4f+Ap8ylSsStKZmohe2weG3EUCSX6?=
 =?us-ascii?Q?GUtnAxFzF3RKLUTAKrqFJGWvdvS+12XBkS8TxLcALz0kt2toZcl55UxCki2+?=
 =?us-ascii?Q?FvmllVjPw5fxGaOklNMJ/CYF23hQvNrpVHCJTi7PxicDMvxx0+3fCqP5NGF9?=
 =?us-ascii?Q?ToimHVPYqnoM+llzjrI02vSOr5xnrNswC7iZru7OWB02reNYjhV05QAR7uAT?=
 =?us-ascii?Q?GNXCn/7ir1wedbiN6gB1BNSFRGXN+4ww8CGRg4h3+t076oJdKxToUmY/ello?=
 =?us-ascii?Q?mfQS6400Rq4wlk0XQcDWNxlZsve5CgStiwmQlrg87enCJRfuE1zeP8431RCU?=
 =?us-ascii?Q?wLnSZgq6rzjezx2IcqcLwJpaKxJEi/iPh0WeYlOygVSGUG4ejSiJiui+wqTA?=
 =?us-ascii?Q?VNS4tiDRJbATzMUzzowCZ5U7/9nguABOALukBZghRyLM2r06Jx1XnBB7XWwx?=
 =?us-ascii?Q?nvborXMjfFg3ppGNt3KQOSubhhd5hJIhwcUL5yKV8zATTCnTDhaBa0x8+2LT?=
 =?us-ascii?Q?5p/EBZ7ZYmgJpfuOAK5SBV5jQaA99jEv0UNXIAC93HjtMLjUbD8IBJFw+O7b?=
 =?us-ascii?Q?n207o1ETMR9z0DWh0Z3zvZXRLy1KgUnxOgYwFeTRYwj34oBzHS0zP/K/GkQy?=
 =?us-ascii?Q?1ynwMIv68cepupl7wnp6CBbzK8V1gy1lm0E3WxV6k4Mmb8PTZbthttOJzYN7?=
 =?us-ascii?Q?8LiZAuMtwO1I5l947eZOiRIRVykDQMag03T7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 19:57:53.6242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9e7f51-d15b-488a-8040-08ddc635620a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
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
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c | 104 +++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
index bc3d6c2fc87a4..9ae811d9a9dd5 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c
@@ -40,30 +40,128 @@
 
 static const char *mmhub_client_ids_v3_3[][2] = {
 	[0][0] = "VMC",
+	[1][0] = "ISPXT",
+	[2][0] = "ISPIXT",
 	[4][0] = "DCEDMC",
 	[6][0] = "MP0",
 	[7][0] = "MP1",
 	[8][0] = "MPM",
+	[9][0] = "ISPPDPRD",
+	[10][0] = "ISPCSTATRD",
+	[11][0] = "ISPBYRPRD",
+	[12][0] = "ISPRGBPRD",
+	[13][0] = "ISPMCFPRD",
+	[14][0] = "ISPMCFPRD1",
+	[15][0] = "ISPYUVPRD",
+	[16][0] = "ISPMCSCRD",
+	[17][0] = "ISPGDCRD",
+	[18][0] = "ISPMERD",
+	[22][0] = "ISPXT1",
+	[23][0] = "ISPIXT1",
 	[24][0] = "HDP",
 	[25][0] = "LSDMA",
 	[26][0] = "JPEG",
 	[27][0] = "VPE",
+	[28][0] = "VSCH",
 	[29][0] = "VCNU",
 	[30][0] = "VCN",
+	[1][1] = "ISPXT",
+	[2][1] = "ISPIXT",
 	[3][1] = "DCEDWB",
 	[4][1] = "DCEDMC",
 	[6][1] = "MP0",
 	[7][1] = "MP1",
 	[8][1] = "MPM",
+	[9][1] = "ISPPDPWR",
+	[10][1] = "ISPCSTATWR",
+	[11][1] = "ISPBYRPWR",
+	[12][1] = "ISPRGBPWR",
+	[13][1] = "ISPMCFPWR",
+	[14][1] = "ISPMCFPWR1",
+	[15][1] = "ISPYUVPWR",
+	[16][1] = "ISPMCSCWR",
+	[17][1] = "ISPGDCWR",
+	[18][1] = "ISPMEWR",
+	[20][1] = "ISPMWR2",
+	[21][1] = "OSSSYS",
+	[22][1] = "ISPXT1",
+	[23][1] = "ISPIXT1",
 	[21][1] = "OSSSYS",
 	[24][1] = "HDP",
 	[25][1] = "LSDMA",
 	[26][1] = "JPEG",
 	[27][1] = "VPE",
+	[28][1] = "VSCH",
 	[29][1] = "VCNU",
 	[30][1] = "VCN",
 };
 
+static const char *mmhub_client_ids_v3_3_1[][2] = {
+	[0][0] = "VMC",
+	[4][0] = "DCEDMC",
+	[6][0] = "MP0",
+	[7][0] = "MP1",
+	[8][0] = "MPM",
+	[24][0] = "HDP",
+	[25][0] = "LSDMA",
+	[26][0] = "JPEG0",
+	[27][0] = "VPE0",
+	[28][0] = "VSCH",
+	[29][0] = "VCNU0",
+	[30][0] = "VCN0",
+	[32+1][0] = "ISPXT",
+	[32+2][0] = "ISPIXT",
+	[32+9][0] = "ISPPDPRD",
+	[32+10][0] = "ISPCSTATRD",
+	[32+11][0] = "ISPBYRPRD",
+	[32+12][0] = "ISPRGBPRD",
+	[32+13][0] = "ISPMCFPRD",
+	[32+14][0] = "ISPMCFPRD1",
+	[32+15][0] = "ISPYUVPRD",
+	[32+16][0] = "ISPMCSCRD",
+	[32+17][0] = "ISPGDCRD",
+	[32+18][0] = "ISPMERD",
+	[32+22][0] = "ISPXT1",
+	[32+23][0] = "ISPIXT1",
+	[32+26][0] = "JPEG1",
+	[32+27][0] = "VPE1",
+	[32+29][0] = "VCNU1",
+	[32+30][0] = "VCN1",
+	[3][1] = "DCEDWB",
+	[4][1] = "DCEDMC",
+	[6][1] = "MP0",
+	[7][1] = "MP1",
+	[8][1] = "MPM",
+	[21][1] = "OSSSYS",
+	[24][1] = "HDP",
+	[25][1] = "LSDMA",
+	[26][1] = "JPEG0",
+	[27][1] = "VPE0",
+	[28][1] = "VSCH",
+	[29][1] = "VCNU0",
+	[30][1] = "VCN0",
+	[32+1][1] = "ISPXT",
+	[32+2][1] = "ISPIXT",
+	[32+9][1] = "ISPPDPWR",
+	[32+10][1] = "ISPCSTATWR",
+	[32+11][1] = "ISPBYRPWR",
+	[32+12][1] = "ISPRGBPWR",
+	[32+13][1] = "ISPMCFPWR",
+	[32+14][1] = "ISPMCFPWR1",
+	[32+15][1] = "ISPYUVPWR",
+	[32+16][1] = "ISPMCSCWR",
+	[32+17][1] = "ISPGDCWR",
+	[32+18][1] = "ISPMEWR",
+	[32+19][1] = "ISPMWR1",
+	[32+20][1] = "ISPMWR2",
+	[32+22][1] = "ISPXT1",
+	[32+23][1] = "ISPIXT1",
+	[32+26][1] = "JPEG1",
+	[32+27][1] = "VPE1",
+	[32+29][1] = "VCNU1",
+	[32+30][1] = "VCN1",
+};
+
 static uint32_t mmhub_v3_3_get_invalidate_req(unsigned int vmid,
 						uint32_t flush_type)
 {
@@ -102,12 +200,16 @@ mmhub_v3_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
 
 	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 3, 0):
-	case IP_VERSION(3, 3, 1):
 	case IP_VERSION(3, 3, 2):
 		mmhub_cid = cid < ARRAY_SIZE(mmhub_client_ids_v3_3) ?
 			    mmhub_client_ids_v3_3[cid][rw] :
 			    cid == 0x140 ? "UMSCH" : NULL;
 		break;
+	case IP_VERSION(3, 3, 1):
+		mmhub_cid = cid < ARRAY_SIZE(mmhub_client_ids_v3_3_1) ?
+			    mmhub_client_ids_v3_3_1[cid][rw] :
+			    cid == 0x140 ? "UMSCH" : NULL;
+		break;
 	default:
 		mmhub_cid = NULL;
 		break;
-- 
2.50.1

