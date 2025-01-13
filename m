Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051DA0B26F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955A310E258;
	Mon, 13 Jan 2025 09:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z4K97gU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C8F10E258
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUe2u4Uz6yhx/JfQsjy9ONsM+O6Lf4up1zF87QxcdpDbx+QZip29tFknyTWA7DgoFxdT3u7HsirQCDYdt4cwS18yghy73HhMT1nDbT58zxq2jTDRtSNuTJ3bYqU8ERZC0HTHdzfFdMxn797S+GDb+TLcBRNHpNIlThQrTfVCP4qisQa9Op794v9vbRefP1G8wsaQ9Vpg2lgPrvyAPQ1pqKc+t7NAYLxcXtpbx8dc83NaS3op8p1RNRtX5xTeH/vu79vXorekp2hwu2XrEhN9/zFhrXnRhlMXoqydznysIOTQA/LRcBWHQGDRy2uocDh3Li4ea9jI5gAVj9aUc5fZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNBEuaAbmmu8Wrsdan6/ytwonMXA/06Ny5iPc0d3XQE=;
 b=Oa8v9JSDkmpLw7e+2vdsQ7P1/HASNC2cMQQMxWVyAJVtxlj4YeiCfgXNW7nkXyeR33pAfBi5WhkA+KiJzm1BplWR3xK2fnN0CKTMk/XWRxCOJgckVDoaXlRIz/ODyR2hEWKFhuE4kHzCGiPJtAlWKmIpKXyyg51CUq2YSJFSZD7NlDJqYOa8/GDnHY0s9XcGT9to65gdYNP9nr0Z0mpNXddltfBLNLyLRJ/0uxTjvMcrAqMSMNLe9sJo29kkPZlA0Sv6GRrZSWpKKtjFJrM07xqOOEwj8JRIkBtSvHQU3YlSeyqz5ErzlTrIutz1vlG3PhEi7vP08UgPm+O2ao4UjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNBEuaAbmmu8Wrsdan6/ytwonMXA/06Ny5iPc0d3XQE=;
 b=Z4K97gU3CgM1a2iO8GXTeH2BvUB/yjvNm21sKxDiGXRrCxb45UFeTJGjwFTL8oRV4rmhEwVxsNyTzp0a6nR0e7nBQYN575e7HuuLo8GoV7eXvvA3GsO1QsxsmiLYLq1btV8kygjeUSf2GLCRjcg9U48wEjb1OpGRoFg4+qh2vl4=
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:11:09 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::58) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 09:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 09:11:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 03:11:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 03:11:08 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 03:11:05 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v4 1/2] drm/dp_mst: Fix drm RAD print
Date: Mon, 13 Jan 2025 17:10:59 +0800
Message-ID: <20250113091100.3314533-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250113091100.3314533-1-Wayne.Lin@amd.com>
References: <20250113091100.3314533-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SA3PR12MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2c5992-6e19-4223-a7a1-08dd33b237e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtKajU4eEJWc3IzQ0c5S2wwcElFbFNSUlBIUUNPZUxGdS9jZ25hQ3FCMk1j?=
 =?utf-8?B?elRaOVN1K0xJVFlTaXRseUZoenZWUGJwWDFMaVA0dmJoSTlJWStQUFBhblBD?=
 =?utf-8?B?NDdnZWovdmhLVXlQOUltZTEyMWl5R0ZCRGl3N3NlWmxRa25UV3dzT0FpVkZi?=
 =?utf-8?B?amovaEU0d1V1R3ROdDJpZ0xDN0pNTG4zRCtHRXlqbkRxc0NrQzBqaDZFRWpT?=
 =?utf-8?B?SmhOQkhKUUZLbTlLQThNQnNQblhxWVBENVJHL2tLemE1RmlSaHR6bC82MlNt?=
 =?utf-8?B?aHFxM1ZjdkRBQTI4dmEwRy92RWhWV3J6eE5RYjdiNDBxS1dVZ0pQSkZuWlhw?=
 =?utf-8?B?VGk0aFVmMVU5eEUwY2NnMFNRb3Y0UERYbFJzcERJU2RIYUErMzRtV0t6di9X?=
 =?utf-8?B?Yko2R1loSEJqb3IrcklxdTg0ZGV5cVB5aUtzWm1SclFkQjhJeTQxbWIrR3dw?=
 =?utf-8?B?dHFmVm5YVVBySmVqbkNHdjlNOEQ1akV5NFZEVURnYVdsMmRvUFQwOGhyQyta?=
 =?utf-8?B?VFZxdDA0TlRpbXhmUEpoU2xNbjkyNVdPbEREMWZFeHQxdGNDdmdRWFBId2pq?=
 =?utf-8?B?NHJIZDhDVWZkWkZHWFArazZuOVducUlrYVI1cHkrSzdneFN1U1IyRzByZ1ZG?=
 =?utf-8?B?MXNXRjR0eU90OWJPeThqWExIM0llUGxvbGRXZHlZSE1HQU15NmpETGlKS2RR?=
 =?utf-8?B?aXpmUUVYVTNqZ05WT2d4ZGdoQW03WDhvZnJyaGhNOUV2TGRPNkxjcm5YQU1n?=
 =?utf-8?B?cXNxS2d6UTdhdlhPL1h3dzhqZDJ4QmlIQ0o1UzhHdllhd214b05MQkI5OHFG?=
 =?utf-8?B?WFBxUXVuZU5HWTZteWM3WGdDSXNaVElTNGZ3b2VLM1VSakRLZFRRcHBWaWFI?=
 =?utf-8?B?Z0FEeXBpSlFTQ0dDRkp1NmFvNzlmeGhCL1h0UmV5Q2E3WUpiRCtMa0l6djRF?=
 =?utf-8?B?U0NhM3BCQTY3OCtOcHExajlVYkpwQXA1UmpHalZIMHo0K2d4WXlqQ04xTmRa?=
 =?utf-8?B?MEtZYjRGMjVBZXRtTUc2dTE5SzVkTTQ4OTRNNnNqZGFXTzlNSnhBak0vL1Q1?=
 =?utf-8?B?NEpRNzZPcEJ5b1FJMU1YSTg4UnlLZW93UUdaYTlKbVBNM1FjY2RqQWhGb3FP?=
 =?utf-8?B?UkJJSG9FM3A5WWRvZ0psT2YwREJ6VWV6aExQMElDcE5kbzUwWmc2Qi8yUG5s?=
 =?utf-8?B?dm5zM3pqMTdWWC9ZZytWVFZYM28rU1hyL0NFM243eDEwN2JMZEZBMG9xM1Uw?=
 =?utf-8?B?dDhHYnZWcENDVVZ1RUxFWnlKbXI3T3JpbG8rQUtwdXZ2bkNhTWh2Z01uc21x?=
 =?utf-8?B?VE80dklYeVB1Wmw3UmZEbXVnZ3FBWFBpUGhFT2Q2dVM1OUFTM1NxMTg2dTF6?=
 =?utf-8?B?NnJaVWt0b0RaejRTbHhIWDJBQk50U3NuS2xUOGRmc0NRNS9DZitlc01hUERh?=
 =?utf-8?B?elkzTUtCVklNcG9CY25FaXRJb0VNLzlST2FTNHFqS1o3ZXFnS2lmeWMwcVd0?=
 =?utf-8?B?UitoQTczQ3BaVXRZNmFIelZNWVg0d211UnpMeTMvSEpNTVhmQ2ZxenJvV3pK?=
 =?utf-8?B?QXJHWGw3bmR5Rkk2ZEFLYXRmUFFLS21LekhMaWs3S3JhRU5sOGtsMSs4VlhS?=
 =?utf-8?B?S2tDR3NmSEVkNWN4eFlJY2ZXUjN1S0Exa2YwTno2cStBR2lwZ1piYzNPSzlv?=
 =?utf-8?B?VkJYOFQyMDBEVW5CZHNaV0hvZ2pyWC9iTzhMWGxFNGlqT1pIdUJSa3JOR1RW?=
 =?utf-8?B?K2RvcUZmRUpESy80M2o0bDRpazcrMFRCbWcvY3F1UmJPWEhUeS8zWXVkeS9r?=
 =?utf-8?B?c29oaUdkVEZoTklLUUc1RFpyNGJnaGQ4aktFSFYvMUpFMmk5Y1B2ankwQ3Jz?=
 =?utf-8?B?anJZMVdpMmRVTnlsVUQyaXhKZVhLZ0ZmeDVJUmx6dThWaEs2VlhaUFlyUnd1?=
 =?utf-8?B?VlRmemtNUDlQNEtYYnlLRkNBQ0s0blNMYXBhZkgwdTBxbERxWmxoREcvd0RU?=
 =?utf-8?Q?qmSXxJdCt5kKBdeDtjLPl+LKbKf51k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:11:09.0558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2c5992-6e19-4223-a7a1-08dd33b237e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857
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
- If MST branch LCT is larger than 1, use nibble to store the up facing
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

V2:
- Document how RAD is constructed (Imre)

V3:
- Adjust the comment for rad[] so kdoc formats it properly (Lyude)

Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++++----
 include/drm/display/drm_dp_mst_helper.h       | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index f8cd094efa3c..271a00b81264 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -175,13 +175,13 @@ static int
 drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
 {
 	int i;
-	u8 unpacked_rad[16];
+	u8 unpacked_rad[16] = {};
 
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
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index a80ba457a858..6398a6b50bd1 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -222,6 +222,13 @@ struct drm_dp_mst_branch {
 	 */
 	struct list_head destroy_next;
 
+	/**
+	 * @rad: Relative Address of the MST branch.
+	 * For &drm_dp_mst_topology_mgr.mst_primary, it's rad[8] are all 0,
+	 * unset and unused. For MST branches connected after mst_primary,
+	 * in each element of rad[] the nibbles are ordered by the most
+	 * signifcant 4 bits first and the least significant 4 bits second.
+	 */
 	u8 rad[8];
 	u8 lct;
 	int num_ports;
-- 
2.37.3

