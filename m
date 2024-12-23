Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E39FA9D8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 05:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7910E307;
	Mon, 23 Dec 2024 04:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KjGGKW+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B310E307
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 04:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6CsqP8/yQnHBCowH/O/uALFicSLUpFhoq6P+Ts31an911dHzdgidzKkx3eg2F9J1tfsVCPTd8Ir/4pq9SYxmwrT17dRUt1SIly5ctFoVXzQff69y10zGToOQOdtXaX7fd7nq0ee0CgmCqxSw9oPHSXce9i5KIMhvv4vXhU+aUS1DyqzrwU7CusrTHXHsE2a7Tkx+07qm/0oTMtL35FWsU4fXX+Z+86JPPeeq2WzH4oP57VesfoKhPbgQIkZql/NJ4O/zNbUyLtSqxECR2svXGnOrhaJWkqY0fZXPqJm0yTDzop30iGM3pZyBoXHlhn6eGrPMjncyFg9idd8syVetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNo3dUdeYBS+4Tm7aeJBLT49XhrMlGTTyv5D2nQYUOc=;
 b=J3Wy0283VJocJrJtiRk6Aq4cVH/X5yjTd31z97/mtYuPiMZSrMobXXPQh5dNoXXhCLdissPW5CJDFpoV2myONChsJRVOUbaa+JhbabLah7z2Ulx4LWZkjlQotR7QLiot7vBUq5ygPBJyKSz0Z51IudaRW9UyblxzQGq7KdpyeNqbX51r8cq+UofDVlqfS7ro4ZjvdbQufknFp525ccr1dwjTvl9466njQ5y7dtGqxNL9IzgbiABWnnzcTe4SFKgJ308DLqHy6xDgYlewH82ujgn6Wcyb6RQe36Lrkj2+DQBsi7Px/YR/IwEqiI/kKgl0qtbVFJEJMBRD6Zis5PqHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNo3dUdeYBS+4Tm7aeJBLT49XhrMlGTTyv5D2nQYUOc=;
 b=KjGGKW+nsAb8ip4vIsDs39c1UTjoFAF/rflEA5OVRGkLXh7oRKk59rxF5EHrEv9SLVlXnr8L7U0j5cE8yJZJU+MCuTcBJ/tn+a7/hk0/Guv9gLlXqi1oPPuvqDAV/JZzMNiqWgnJ8vz9hbGW7r6rxzzfvE41m59vbdx5RaABMwk=
Received: from BYAPR02CA0069.namprd02.prod.outlook.com (2603:10b6:a03:54::46)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 04:07:56 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::ed) by BYAPR02CA0069.outlook.office365.com
 (2603:10b6:a03:54::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.17 via Frontend Transport; Mon,
 23 Dec 2024 04:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 04:07:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Dec
 2024 22:07:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Dec
 2024 22:07:53 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 22 Dec 2024 22:07:51 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v2 2/2] drm/dp_mst: Add helper to get port number at specific
 LCT from RAD
Date: Mon, 23 Dec 2024 12:07:26 +0800
Message-ID: <20241223040726.3985676-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20241223040726.3985676-1-Wayne.Lin@amd.com>
References: <20241223040726.3985676-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95948e-e290-4bb4-1d45-08dd23076127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elB2N29vcGx2Q09tK2FFTVgrVDVZcldRYmhWUGs0QUthOU16NWhyaXlTV2lZ?=
 =?utf-8?B?cmg5SmtOcEFrbmVvWnBTNEZoQ3R6bEEwUTNtcGh1QkxsdG5hRVZGa3RWMmY0?=
 =?utf-8?B?am01ZEd5cFpWMzc5RUo5Q2xhSWl4NXlQMkVyek8wTmk0QW9GVGpobWhWenl1?=
 =?utf-8?B?THlBcFY2M2pLUS8zU0VOUmJFTUpvbXJNbEVuQzZsbmQvY2hWK1hCVDZaTEUz?=
 =?utf-8?B?eVZBUVp2cGdEVTViZ3dhbDRVdjRXcDFCbVN0NWpPUzdWb01zcEVyV2VhcVFF?=
 =?utf-8?B?bzk2QzZKRWtFcEgzcTd4UHpEWUhuRUhidGNPQXNRZXY1eFE4eUJPRW14dHJu?=
 =?utf-8?B?UEViUWFydy9zU1JFUHRuYnlZd2p6Tk5XQVh6cDZZcmptYTU1aWVUMEdaQ0sv?=
 =?utf-8?B?ZnNITmVYVUZRM0M5TjlZQkhHMEdFbWhLZjFFUytzRGptK1ZobWRDMmhTQmNv?=
 =?utf-8?B?NGY3MXVqUE9MbjN3SXk4dWY3VS8vUUhEczNjeUVDQTVYUHVPcjBuamlOSHBY?=
 =?utf-8?B?S0QvT2xIaEd4RVZKUzlZcUdmc0xBWXVSOEh1SzFETXpjNkMydkxRZG1Ja0Vq?=
 =?utf-8?B?WGNuMytsZ2txZHpRT1N5SXNUZVcyY1hGZnJYVy9VU3c1cEJPVEpwSm9oQVFL?=
 =?utf-8?B?ZVhLTExWdmNldlo5bFRnTXFCQnlFY0VpNVBPek1pN2dnb29Scno2ZVZwVDRv?=
 =?utf-8?B?QjlqUjFBRTZvQmxUNTVDenExaER3bFQzSWQvK0ZHK3lrUUpSQlp1cy91TWRN?=
 =?utf-8?B?OXFuSElxUlBPQW5sTFlKNXh1TjVXalhGQkovaUIvTmo5ZzgvRGYvU2N1cjA4?=
 =?utf-8?B?Z2s0eERZREZSbkkrdXlzT3RvSFAvMDJlZ0o1aWVWZmlUd1dFNWxFZXVGT2tO?=
 =?utf-8?B?ejI1ajk1VnRudG1Ma2ZRRDBTNGtHeUZBUE9YMmdudkRWYUh2bkZOeDVkWlBW?=
 =?utf-8?B?am1SdHFaYkEyVEtEQVFnMDZPS29KcmRpc2xObHhhUGh3T2dzRjBlenlkdDQr?=
 =?utf-8?B?ZStLcXdadWVOK1FDQTFuYXFrMWVqaysxRWRRNHpIVW9ERkVpZEsxOXVLN1ZP?=
 =?utf-8?B?VFRPVUM4dE5oSWtwMGJJNkhkYnlzZXhKZ0tyNnlFSmt3MEFRT2tYUE9ndWlz?=
 =?utf-8?B?dzZCQWZ1ZGJnRHNIaUp6SFk1eTU4OTE2V0FBcEQwV0MwSi9jVDFyQlZJNmh6?=
 =?utf-8?B?RDBiMjVsNnBPVzlxZDlqYlVVa094ZUo0TVIyWGhGY1NaL0lyc00yZFFaV0hh?=
 =?utf-8?B?dm9CQmFQcDcxMWVydTJwWkNwamJlNG1naFByT1M2S2toc2RuNnB0RVhHVDNy?=
 =?utf-8?B?d3dpR2hxbUtlN2JSVHNBNTVLMG5jS0Z4UjZINjdZRXY1SWMweC9uekZ5Qjh6?=
 =?utf-8?B?UExPcTFWeUNPWnhUb2NqUlFQNTFvdEJCVndXQ3Q2RjJ6Q01FeHN0cnRpTXc1?=
 =?utf-8?B?RUlKZ0U3UnJCbjcvZ1Qwa09WZ0hQMjBVTkhmZXZ5eGlLWjNGSHc5UUpudTdk?=
 =?utf-8?B?MnpqbVZSUkJJTUo4MFMwaE8rd2VVVXBNTVhxc3VnTjlTeUhTbWZNZTVtdDg1?=
 =?utf-8?B?akdnMXNPbHA2dnBtMFIyWGw1OGwrdzlZT21HdU9tT2RBNm1XTFFOZ0dpRDJD?=
 =?utf-8?B?VWZWSUI4czB6T1d1SWFsOEwwWkVyU0t4ZzBBcXRmRGh4dlUrZ3QwRHl3Qm1R?=
 =?utf-8?B?YlRsQUdDRVZCY3J6TnNTK0dGeStvbVdGcDFOM2kwUnlqSWk5NmI5TGZ0OWkv?=
 =?utf-8?B?RTBsek1rZGU3aEdOTGtERTE0ekNIR0orcGZqbytFUEhDQWlKVklDaWd4RE44?=
 =?utf-8?B?Q1RFamxLSEFSdnprTmR6QUNNTkNiVFFhMnZvam9mNm45OVJER3MveWRKcWNB?=
 =?utf-8?B?Snl1bXBleFVmSWUzSyttRWFsTncyRDJ5YzY2alc2R3V1bFFibW05c3c3UzJQ?=
 =?utf-8?B?MVNTd0owK2lRV0x0ZmlKWjhlZ1hqL2FTTDBsMTZZMjRBcHRoZFBLQXRJRUZ5?=
 =?utf-8?Q?ZJcbivzaKRD5Je83AtgN1InBsui5TY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 04:07:55.5675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95948e-e290-4bb4-1d45-08dd23076127
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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

Add a helper drm_dp_mst_get_ufp_num_at_lct_from_rad() to extract the up
facing port number at specific link count from the RAD. Use the added
helper in drm_dp_mst_rad_to_str() & drm_dp_get_mst_branch_device() to
unify the implementation.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 30 +++++++++++++------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 271a00b81264..dd11040af22c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -171,18 +171,30 @@ static const char *drm_dp_mst_sideband_tx_state_str(int state)
 	return sideband_reason_str[state];
 }
 
+static inline u8
+drm_dp_mst_get_ufp_num_at_lct_from_rad(u8 lct, u8 *rad)
+{
+	int idx = (lct / 2) - 1;
+	int shift = (lct % 2) ? 0 : 4;
+	u8 ufp_num;
+
+	/* mst_primary, it's rad is unset*/
+	if (lct == 1)
+		return 0;
+
+	ufp_num = (rad[idx] >> shift) & 0xf;
+
+	return ufp_num;
+}
+
 static int
 drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
 {
 	int i;
 	u8 unpacked_rad[16] = {};
 
-	for (i = 1; i < lct; i++) {
-		if (i % 2)
-			unpacked_rad[i] = rad[(i - 1) / 2] >> 4;
-		else
-			unpacked_rad[i] = rad[(i - 1) / 2] & 0xF;
-	}
+	for (i = 0; i < lct; i++)
+		unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
 
 	/* TODO: Eventually add something to printk so we can format the rad
 	 * like this: 1.2.3
@@ -2544,9 +2556,9 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
 	if (!mstb)
 		goto out;
 
-	for (i = 0; i < lct - 1; i++) {
-		int shift = (i % 2) ? 0 : 4;
-		int port_num = (rad[i / 2] >> shift) & 0xf;
+	for (i = 1; i < lct; i++) {
+		int port_num =
+				drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
 
 		list_for_each_entry(port, &mstb->ports, next) {
 			if (port->port_num == port_num) {
-- 
2.37.3

