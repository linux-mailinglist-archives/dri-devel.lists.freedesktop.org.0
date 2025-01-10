Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21FA0855F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B7810EF78;
	Fri, 10 Jan 2025 02:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iRi57Go2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256E310EF78
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co67eNniETeXTrSyixPBG4mF+urpWCJ2ZBCIXaQNr0aN0S6469nck+qLWC/NQ1j9dnUqATx0fMFjnOMWrqNPCPMDQR9UtzZWECupuZPPERiC7nzkCkGwR6XZ7Eywc4Ci2vQsTkzPaNFYRPfkgcMYwGFYTm0mrBr86Cw0cmHlN+I79nz2FUPOQuFhWet4sdWq73+dAwYXXYfb84mAuQQYOBQ/tiaxkysrm/zLCZAhDSsXrRi/O677yMhx4SKnW3j/UGC2B8y8Z5dOIiMzth3hhheUgllQOXjryF5as/a0VXZvXb1Pj9/mgnAZOV1LLeIHS4js+EmRBJ6gmcJaRVRPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNBEuaAbmmu8Wrsdan6/ytwonMXA/06Ny5iPc0d3XQE=;
 b=trkngFWUclJFzzXUDE0X5uPGl/lPjBkUxjm8BdUGyeYl58l+pBMwPPxUyH9RvVD2yoDGq+HtOaN0BEJkCpYUM7K4x+z6rPZQIOeB8TsSStMMa1eAma4StUqFuBk2cehDCrHriIjmuMwgdyJEgWXOvf7Z2q5KqxaRA4aeB/NgJXQ9b2Ae5qhekqh0y1nFEAn1d940QoO2bLTM/plBf4n9OeipEF8UmJYReQ4T15o2IBdpxgboMaNzZMAZTJzNVvEZjAWSZYVGNMjtm/73zBX3S2OZeiJxCf+Ae5hzEms8jWXkgbM7zdo2HOiQu/CF3pNRXpjI/ECMPtE0WZaVFhXKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNBEuaAbmmu8Wrsdan6/ytwonMXA/06Ny5iPc0d3XQE=;
 b=iRi57Go22vdbRMlVhlb6NXlbu2SM6tD8Y2ZLmTyRrC0OKUh5yMQHXEBTGG2rZjqBPSTtMPgsrer4Z8+B5Yw9NhF5fsK/sbwYJkGQR/Fq6h7Xic7EsNSvIsLWOVp4gcqnD7bvpKaMFVWqbq4DSOzhc5XJuZdq9Sbhx1gjDHZ8bCw=
Received: from DS7PR03CA0320.namprd03.prod.outlook.com (2603:10b6:8:2b::15) by
 IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 02:36:57 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::34) by DS7PR03CA0320.outlook.office365.com
 (2603:10b6:8:2b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 02:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 02:36:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 20:36:56 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 20:36:53 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, Wayne Lin <Wayne.Lin@amd.com>, "Harry
 Wentland" <hwentlan@amd.com>
Subject: [Patch v3 1/2] drm/dp_mst: Fix drm RAD print
Date: Fri, 10 Jan 2025 10:36:17 +0800
Message-ID: <20250110023618.66401-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250110023618.66401-1-Wayne.Lin@amd.com>
References: <20250110023618.66401-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a50b19-b853-4b7f-4950-08dd311fa6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BIazFPdHkxT3gwUWZTcXlIVzdNaFZ5YXdGNUY1UCs0UVJBWWtlVGxGNElr?=
 =?utf-8?B?c2IzQ2EyZjVQQ0Y3QmJXWm1meUU3Z1BFc0hYbUhLN092WENyWXYrMEZKYytv?=
 =?utf-8?B?Uk9vZksvTFU2eE9uVUVLOEZDNjdnTG5XOC9NSkJ4S05kZE1POVZUWk40OXRv?=
 =?utf-8?B?cnlVTXhGUU9SSXJxaEtaaHdPSHp6b2pTZFN5N2p1S3Y2eTRRR1BHbDZQeHMv?=
 =?utf-8?B?bW1lU1ZxUnA5Y1o2U00xSXJ6MW5kNmZJTGRLTlRwN1laSGx3dUR0aUE0TzRk?=
 =?utf-8?B?WUduQWozSFhsOUo1a1l4QjBWUG5lVDIrNzFxQVR4RUI2TWZLNVV6bWtVUzds?=
 =?utf-8?B?REtqSUR1bFdmUEZUUHA1MlRSTHZSQTRDN0RiR25vcXNlUUQ1c3U4VFR4MVBV?=
 =?utf-8?B?dngzM1g4Z085bUdmRmZieGdoclpUbFF1N3Q1WGU2Nm5WOUp4N3g3b0R5M1Z2?=
 =?utf-8?B?RkZWc0pMUHFSekVUZGdMRTgyRHY0TTlPcU1heGx0ejdnNFM3cFE3MENacDBF?=
 =?utf-8?B?NzFTTUY5RDhJVWUwODVYdVhFdHdlRXMxQWxaOW44eS9mZ3Y1QXY0S01McHY1?=
 =?utf-8?B?VU1UKzRWanl4YVlOM0g2QU1hMFpHVmowLyt2cklsSHhXQ0UxUDFrNEY3MzZk?=
 =?utf-8?B?TGZMN01PQkJKZTFBSWNUNURwTUt0OXk0QUVRR2pPelhlNCtsZXdyQTNDV3Nj?=
 =?utf-8?B?RU1wNWZSR1dla1RNN00zYnl4clNwd1hwOTY4MklBNG1CN1VZTU5YV2xVZG5u?=
 =?utf-8?B?OWd5SUkwNEtOMitFSmZodUpqb09LTlZhZU8zblRIdVZWOXNEZGx1RXBRTUVE?=
 =?utf-8?B?dU1TSmQ1NEQwUzE0RVIxa25aTWNQMEo4VkM1cmoya0V2aVk2TU9USlgwUWE3?=
 =?utf-8?B?WVAzUi9aUzliZWRkUTByKzZxL1AxenhCc2dTRWFSSmNBelFDbjhyallaMXcr?=
 =?utf-8?B?VEpKc3RraTdUQ2dKVUlpejZac3htZWMwWVQ4UzZoc3JLa2huTU5kM3BGQlAz?=
 =?utf-8?B?M2hNSXEwL3VHMnFaNG9JMHRMYWJUTVdrRzI0RjgxNStmZmJQbUlOTWVkMStu?=
 =?utf-8?B?ZlZOQkxRdVNsMkpCVDhpekpMWkJoeVpFc2FMZGZ5dDRsekVjRlBaRFJrNUR3?=
 =?utf-8?B?TE96eTNmbm0xd1M5MnZlYmRSQWJnL3Z4VXNoWmhvc2hmNDhkR2NPalVOS0k3?=
 =?utf-8?B?Z1JoRDVYNHdjbGRBemhXc2kzOUhEY0xtMHRpYXFWM0VuNUtoaGFtKzMyeTVn?=
 =?utf-8?B?a0lkUXRNQTN3SWFDUlB1RHVVTmZaeXFvOC92NjcveEkrQW40RE9xNmFDTUdC?=
 =?utf-8?B?dVhCREh2ak1IVnFSdnJKRUpMVDZXRVljQTRFZmo3UE9FdVJzMUloNVZGYlBv?=
 =?utf-8?B?NnJGRVMxcDd6VzFDenVYU1FrNzI1b2NWUHo5SVNCTGIvdEVCRERqOStRcFJw?=
 =?utf-8?B?OE4vOGY3L3lCU3ZjajJMZzhKK0dRWHBSclg0YjVxcXF1UmNURGI4QzR3YVBw?=
 =?utf-8?B?NjdVTUgydHUySjZGMDY2QkgzZEZxR0Y3U21jUEdLMEtkZ0dScWx3RnVKWC9t?=
 =?utf-8?B?aTRYOVI3NE9XUEQvU21iWDV0QWY0djZGY1ZHQWNsSkR4UWtsaXVqSmRSVkx3?=
 =?utf-8?B?MU1mSkpkZ3JsMHNyc2xISE9Sc3ljZnJFWUduSFFmM1lZRGp5OTBPbDZIREtM?=
 =?utf-8?B?dmNXaHIzQnJ5UjQ0bUtJTVI3Z2dzRnZ5Q3FjY3I0TUJjanE2Q3AxU2RLUnlr?=
 =?utf-8?B?RU02RzZpVUpqZWd2dUthRHNzSjJwd0Naa3hmcUlobE1pWmVFQTEvNTE3ZUtk?=
 =?utf-8?B?VTRiLzZOSmYwVTNndGRGdURkU3N6NzRYK1psVytNWnZXM0Nubkl4aFFsVG45?=
 =?utf-8?B?dUdXRjgvNXpGRFdBUFNlUWs1YmVjQ1BpTTQra1lIK3gzVkhRVnlVdUlaL0N6?=
 =?utf-8?B?Y1RNVzFRTlJQSVZOUjhrVkhOWTJ4VEw5bTVVRjU4bFErTE80azUzaVU4Sm5m?=
 =?utf-8?Q?VCcgYs5jDzYYEvl9SuJTOwBDaEqPlo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 02:36:56.9151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a50b19-b853-4b7f-4950-08dd311fa6e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255
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

