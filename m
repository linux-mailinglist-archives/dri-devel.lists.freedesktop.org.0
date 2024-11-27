Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B59DA518
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0F710E16E;
	Wed, 27 Nov 2024 09:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IaejP9le";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8620B10E16E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 09:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpfrHAuZEQlg1b6OsSzQib7iu99N8UX5jWTHe3Q3lSFsLmOnM0OHb0+2DT4yCfHRNbOG0GQYC77FAiT55l0G82nNnfWvDl0Y5HzjjPBNgDZZOKKpJ92mvbEXLSVrLnogaXzYLLzcPnG2tLMYP0k8L0VQFDag+GP/ILciD/jgPu1vuRRNGqRPNsuovJ0jfwAnt0lqDlc4rhm1TInvB24RNB9fYJxBbxqQCNiduCZJCvbZTBpXosVgqWWZakWn4wlI0njw1tgY/FNzWcbBa0X+51zk+QPyIchCk8Fbm++JSjiiuSKNCHxQPA3yKyDxWUQH/NbtQC+aDsTupdo5v36Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zp5i8jwRkhn9dG9uLHEAIkKwaO0u1wK9BvRSZc2fhA=;
 b=q7tJiW5ljpckWE7NeB9J//Z2XSf1/riBKNEOFnQaZ5/Y8DH/VVlKu1VVfEF27K31nZrdMBIiNh08LYV13yGuWGt5RXj6VHTELeEaSEgkIYJuJz8AiYcuTt8JmSsQzd2WM7pkGY+C453nfYErap+7p4qoTsCQ106PVJalXjBOaQhTO4KFlBaVwZq2CXGmP2LOZ88YWXLWKOxpguwAkLF1iOh0QQDb4tQCP+MiVOQmA1rVrN/KYA+QNfOrH3B88ONWotV7LfQKhnKo3/acem4MtGiXxkoknUIFTxDBJUvk6r+XoAvD7NVHOJjx8HZJ2eltgjrO9FEzmCNxLE5iubaHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zp5i8jwRkhn9dG9uLHEAIkKwaO0u1wK9BvRSZc2fhA=;
 b=IaejP9leskxyxJ1/qja1hAux1K58mbQSaCwoKx/ElPlgR/Y9l/LY8RoB/k06m6QQHfY0QAyzIu5zqwKS9YNHePVmM0vqbCLeAXHLnY//pt4RPRN1R5B+XnhUKgT6QTB/7qYYr0ZGwxP6oNK/6OOfLg8yVQqjiiMGq74I6vHFZCY=
Received: from MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::27)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 09:49:52 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::b5) by MN0P220CA0023.outlook.office365.com
 (2603:10b6:208:52e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 09:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Wed, 27 Nov 2024 09:49:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 03:49:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 03:49:50 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Nov 2024 03:49:47 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>, Imre Deak
 <imre.deak@intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Harry Wentland <hwentlan@amd.com>
Subject: [PATCH] drm/dp_mst: Fix drm RAD print
Date: Wed, 27 Nov 2024 17:49:38 +0800
Message-ID: <20241127094938.3640463-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcca2c9-b2c5-4299-3086-08dd0ec8d692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjFQcmF1RllmdWxSOTJNWDJ2amt1SmpEbXJqOGg0SjBRWStNejFLOHM1Y05L?=
 =?utf-8?B?RVE0WkVNVjN1VDBBOTZST1ROR1ZNRVpaNVZSaXB4WEt0OTBOenppT2lhRHFM?=
 =?utf-8?B?WHhSWk9lcG5Gb0V3T2xRWUtwZHAraUpFb3VsVDIreG9nQkxSQ3hDcEpHK1Nx?=
 =?utf-8?B?NnJNNmwwZlZ3eWc2emV2VVV0OHdFcDhIN3Y3aHVqWDBvOEQ1Y0d1R1YzQkw3?=
 =?utf-8?B?ZC9LdHJ2RGxnNUE3ZHg5ZHdqSXNOVExpa05PVkdaVVlJWEFhSzQ3TGFWZ0Ry?=
 =?utf-8?B?WlRCUWtPNFo5YVV5ZCtWUHBmSWRqTUVQZVJWeUR1UmQrcUxRbXJ3blRlYzlV?=
 =?utf-8?B?bGkzL1Nuekd1d2ZLZWEwbjJmQ2NXOW1rMnRhMHZXTTUwOTBuNmVxcjRBT1Zp?=
 =?utf-8?B?RVIxR1Q1MGRYaUhSdE5JWWM0WXRYdUVZSkhMTGJiZ0l0bmpxaG1jbEtDM21y?=
 =?utf-8?B?L0JwQ2ZUSVdZbVFiYU9wb2p2dmVSRFZiQTRHTVdGYTRSNGlOQnJ6bUFYcTBi?=
 =?utf-8?B?bk93ZTNjREQweG1jSld4M0tYR0phemVGbFJ4a3MySEJGNytTaEt5TVhZK2FF?=
 =?utf-8?B?S0tsUUZsaDgranRVOVJGMmEvejZ4R2VnTFVvNjBCYkQxWFQwaEZ3T3BWK1NP?=
 =?utf-8?B?TFJmeVVBb0JjbU1zakZPclF0eVVYWldZWWpXdTFhYWxKRStZTlA2cEt4T0VE?=
 =?utf-8?B?VXJBNW16cVNqNTRHbDJwUDJKV3NYZEx3T2Fncm90Y3R4VmVjN2lBMkJXd1VU?=
 =?utf-8?B?M1ZZdktTZGFiaStXckM1bUx6RDV6eU9DSkdaRURna25HRFIwcmcvaTNFT09Q?=
 =?utf-8?B?UnRzM3dPMGZhNzNzTWNhenJtYmk0NXhzaTdQRkRtZHNRYUNHUUdVc1FsQ3M2?=
 =?utf-8?B?UHNDd29FTzJvSUIzb3lSdyt4UXJHdXgvN1B6SFdiUGJzNW4yOEFPMTVYb2Qr?=
 =?utf-8?B?RTlDcHQ1WG5qWlFiYmtWVEcyNVZEVCtzaVlTVU05OXBYbnNXSHQzNWhjYzRq?=
 =?utf-8?B?bFhnbUR6TlFWUU1rdW9iMk5OL1NBSEtvaFRsZ0NWVEViektzZTl5bjd0WmFE?=
 =?utf-8?B?d2NHc3FJM0MzWXZKVWc0Q2ZJOGpUeWRWRDY0Y1VpaUlJNjVGSDVIZ24wZzI2?=
 =?utf-8?B?aW1JcHZuMDlwcXFqTHQ2Z2lCMEFEbi9OY0I0ajU1T1FTaWJmY2ROd0NuQzB4?=
 =?utf-8?B?ZXczZW9WQ2FMaEN0bTlvVE5nSzBlbUxNT3J3bmlRaWk1QWtsd0VqZUFKazQ3?=
 =?utf-8?B?WnlsMlJMdVQ2WXd6aWc5WWpyd2FURHdWK3lBZ0kzOFlmSmRxM2VKZGhzNUdQ?=
 =?utf-8?B?eUdGd1ZZLzdQblBTZk1qaFVSdzdmWUxDUEN4Ky80S3h5bG12d1puTGRTTXJK?=
 =?utf-8?B?aEdYRE1wa3JtM09OeG91cit6THZQcGY0Q0RyR2RtWjhwMXR1QjZzT1FUNjJ4?=
 =?utf-8?B?Y1JyZlpIVWRySW1TVlBFY1Z6USsrbVp0MkJsOGNaQkMzYXgxQjFrenlEQ0hr?=
 =?utf-8?B?cTZBTEhsd3FGUFVuR0dDTEhjaGpYd0lyd2FNYVpod2RDQTl3MUd6aXI0bm9v?=
 =?utf-8?B?eGI1dHhuUDkyMmhSdFFoUG45eDEzZ3AxZDV3K00ydDRra0hldm85cy8vLzls?=
 =?utf-8?B?WXpmSXZwdWVoQjMzNkJrWm1yOUxZcTZGZktsRFVwSkJMRThXb0dsZm83dVJF?=
 =?utf-8?B?aWR2Q3dkMEM4emxEZS8xNWcwYnduVzdRRFRGdVhiM3ZscDdSTytUdjB6cDN0?=
 =?utf-8?B?YzcwdE5ORmdtU01lY05rSlY3dU9zWU8xNWRMcVpnUENlVHc0NjM5VzhNM255?=
 =?utf-8?B?ckl4MkVYSVdXVlI3VzZ4bUloYzV0OTIwNVU2SENCTmNrTzRHbmo0WTJxbG9Y?=
 =?utf-8?B?bFRoTG1SYmdRUXVXMHIzTEpWN0dpa3l4NmFTcXAreVZaY3B0VDJaemVWWWxv?=
 =?utf-8?Q?Ok9FpFCd2NVh4HmlRPGsKk09E6/BGgzf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 09:49:51.2006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcca2c9-b2c5-4299-3086-08dd0ec8d692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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

[Why]
The RAD of sideband message printed today is incorrect.
For RAD stored within MST branch
- If MST branch LCT is 1, it's RAD array is untouched and remained as 0.
- If MST branch LCT is larger than 1, usd nibble to store the up facing
  port number in cascaded sequence as illustrated below:

  u8 RAD[0] = (LCT_2_UFP << 4) | LCT_3_UFP
     RAD[1] = (LCT_4_UFP << 4) | LCT_5_UFP
     ...

In drm_dp_mst_rad_to_str(), it wrongly to use BIT_MASK(4) to fetch the port
number of one nibble.

[How]
Adjust the code by:
- RAD array items are valuable only for LCT >= 1.
- Use 0xF as the mask to replace BIT_MASK(4)

Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f7c6b60629c2..152c60f1e80f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -179,13 +179,13 @@ static int
 drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
 {
 	int i;
-	u8 unpacked_rad[16];
+	u8 unpacked_rad[16] = {0};
 
-	for (i = 0; i < lct; i++) {
+	for (i = 1; i < lct; i++) {
 		if (i % 2)
-			unpacked_rad[i] = rad[i / 2] >> 4;
+			unpacked_rad[i] = rad[(i - 1) / 2] >> 4;
 		else
-			unpacked_rad[i] = rad[i / 2] & BIT_MASK(4);
+			unpacked_rad[i] = rad[(i - 1) / 2] & 0xF;
 	}
 
 	/* TODO: Eventually add something to printk so we can format the rad
-- 
2.37.3

