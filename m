Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4849FA9D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 05:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376E10E305;
	Mon, 23 Dec 2024 04:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oxvfkor/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2A610E305
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 04:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tblIvTSgbFQKqmokmRHNQJ5/IzQnUA1ove4XqMVxO/Tw3ybYG8eU1+CnF+kYGIBvM+iVIYt/hpsAd4FnyzPeHkY4QedG9hm4hwOwlmq1NxkJMs1lT74mYlnyZq2fMLJaeqmWrT/8JOqZW2TgZgRcEt/ze93p0Qw1mJrVfDx2Qwe5nmtG5if3C4EcWy1tJs4k/eimMlvSL59kSZxLs1mZNa5M+s6Lr9ngSWCIBfd6B3GgB/MBBQY7ffQHopu8b0Z+RX2ZQF2ZY4JpyhkZvK/At2e4jujoaBDUtIcxGB0v4eOhD2EfRtlAcD2XmELnOjh4ruUm0QuP4GKsuoj7jSVB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/R23bSjhIq9Jih2KvGNQlTFNHaoe9PrWK5xqQb3FWKQ=;
 b=arfs/fGRbQYYjGulqjxHVAOj47y6Fnda7iSXJ6Z9vYEiLbjTgCAQoO+oETl/iVO3ek9EBJ0IKLo/kH44fA23lY+0wb8v49u/WpYseAbDn0bSGBAdNhKV7Pb9B958SBUPIco5xo7eM3N4t5tdTRjMWgnZ2IibrpAEho2z4vO0ji59+zYFB5D5Nz69oI+AT1ru2dCNf45cN+BJSQB2DmnZDndbYGiSJazFvm71nwktgj1g7zm/DTDoRvveTGCwB6H4djmmURE9qk5cgrgiLjJ78uHNARxxYvgC1VEflD6+e1+O7bc44JMWy3F+yGiz/aN1aRBXLnoXro7suo90KvyzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/R23bSjhIq9Jih2KvGNQlTFNHaoe9PrWK5xqQb3FWKQ=;
 b=oxvfkor/6jE4N+1GWHWFdR9KuvNElGhdnFsCPUC7IRKis0RyLIcNc8zFx7HieCuRmLr72Q1CQ/caCVhLqluqV8BY0UWewO7wQ1AKFKEfrv4y7SbtfQlULNJvKc/aropP/tuG+rfzsPjv1e8aNheu3dVArsOGZyHkum4X+869tis=
Received: from DS7PR03CA0283.namprd03.prod.outlook.com (2603:10b6:5:3ad::18)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 04:07:51 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::16) by DS7PR03CA0283.outlook.office365.com
 (2603:10b6:5:3ad::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 04:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 04:07:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 22 Dec
 2024 22:07:34 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 22 Dec 2024 22:07:32 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v2 1/2] drm/dp_mst: Fix drm RAD print
Date: Mon, 23 Dec 2024 12:07:25 +0800
Message-ID: <20241223040726.3985676-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20241223040726.3985676-1-Wayne.Lin@amd.com>
References: <20241223040726.3985676-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f87ee9b-4e09-484a-670b-08dd23075ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1hidHgvbExmd3JrTXAxNjFOR1VHV1NxT3g1bWloY3AzUm9xdE56Z3ZvQ2VN?=
 =?utf-8?B?b0x6bW9HbStDTkJ5TkJpQzVKRVl3U0h1ckJ1Y1F0KzJiY3EwOXJSZW41UGxj?=
 =?utf-8?B?TTFDN0VlenpPVDlHTjN4b0RiL3JDQlBYU0ZDNkpGTi83U1lHSTZMQTExV0tG?=
 =?utf-8?B?bVhxcS9DK3BNSitET2hYNHpYU0w4a2NIckVpWnNuSml0bUJUa3hqeTJwU3pC?=
 =?utf-8?B?YWpMZWpUc3ZyeXJmWW5YckdkcE1CcGREZUJNYWdaZ1piNklVQVJYeWZoSDBC?=
 =?utf-8?B?Tzg3UTVxbmx2QkxnMVFKZlI5Snh1NjB4OVg4RDZ3RVFtUmVBZGFkMjhPb002?=
 =?utf-8?B?MDgxY0hHL3dMQ0lsUnp5MVdYYjRIT2hkME9lVElMVXd2K3RURmpnanF1S2xS?=
 =?utf-8?B?a3FrMkw0V1RTVmx1a01QS0JLM2poRmpLMFluZS9zSlVWQzQwTDJNakR1OE9Z?=
 =?utf-8?B?N01GRy9pbGQvckU5YnhBazc5dmQxN1huem5uRmJ4cVNPMk9UNFllQ3M2WlZy?=
 =?utf-8?B?aTdXM1dDM3RaRlV5NkVoTkNYbklRSFFpSG01aEVISHRSYm9yaFloNE1jaTFv?=
 =?utf-8?B?TkxyeWd1VzlZQkl6Z0syL1JaVUJtempVVm5RcTM0UlNBdFQ0SmI3dndxUTdI?=
 =?utf-8?B?aE5rSFNNZGlwenp4eGVpWlhYT0N3bllOYkhPWkhsdTMzRitJSnhRNGE1RXAx?=
 =?utf-8?B?cXFNeDNERjhEUzVYNU5qd09kVnBiZ2ROei9Bekg2RWU0N0FXT0d2bk4vZ1Nv?=
 =?utf-8?B?VHBGMXZTTTllNkk3T0hHNjRJSUNJRDNyTEVaaEJTM3VYWVRGaDFLTXA1QVVk?=
 =?utf-8?B?R2VKNW5KejVMR0RiUThtSmYyMGZFQU91cFgydkVVWW1IUXZqK2wvUnNYVnBM?=
 =?utf-8?B?Q0E4OE1FWjQ4NGVyNXl5RXRxMHI2TlQva3BGS0J3MTFqS1grU2M3UUY2ajU0?=
 =?utf-8?B?OGhMWmc4b0oxUkt4ckpQVzZGMEN4cHdkU29FNmVmZE9hV3pvcHNaeWFiNE9i?=
 =?utf-8?B?S1VlelcwNGRhZHlnTXY4YWpsQ3IxaDJ3ZjB6TW0yRWV5ZjJBWWl3aDlzTThl?=
 =?utf-8?B?ZnUwcWRLb2plWjdDYnloeDluV1B4NitVd0t2ZmJYMnBoeGpncFNtK2J0Mnpo?=
 =?utf-8?B?TFdRc2NodHVJeHdmV1JqdFQ3UTJmWldyZ0ZobFpJZG1OeWcrNVdTVDJQUDdv?=
 =?utf-8?B?aDVQNkNHZDlwUC9HZzZ4aFlDTmxrOGhEWHVocmVRaHhjR3FTbHdzSkNvd1Ni?=
 =?utf-8?B?MTZDOWNVdTh6MlZINEZlMURNN0E1bDYraUhYSXFVYXMrVm9WRGo2OVFZQWZZ?=
 =?utf-8?B?amFGU3lEMUVXMVdnMmd5ODAwZ216bkt2dm1aYU4yRW8wMWZtNGk3WWJhNkZx?=
 =?utf-8?B?d0pvQVVzbzlzeVhHV0hNM2prc2Ntb0lld0VndFg0ckh4a1pWZlBoZzlUK3kw?=
 =?utf-8?B?T1c0NVN5Q3BlSEQya2ZYdXBWM2xDK3l4UjROM1YvN3hKYlpKZUNnMXpYbnRV?=
 =?utf-8?B?bFowNnVQS1R6cDI0ekNHbnlPYmlrZ2wwVkxSemtBU0NPQWs0ZWUyd2gwR1ZM?=
 =?utf-8?B?NTRnSU1QenErT1lCMWUwVVR1b1M0WVpJKzQxdzl0QWNpTlNWcDVTMzVmQmpa?=
 =?utf-8?B?SDdlMHNOMFFjbGpObEN6cjJXV2Y0Q01nRG5NWXNQR0kvWFhjeWpjNEJ6STBF?=
 =?utf-8?B?VFhoMlI3M1RjSzFOdi9Zdzk0UlVHc1E3NkxvaFE5TVRHSTZPNWtHQm1wRjBj?=
 =?utf-8?B?OEpDeDNnUFowN1BxZk1IVDk0bHZ4Vkd2bGhnYmxjMUkwNUw1SUNVTWxETG9u?=
 =?utf-8?B?Yml5SGpqZEhvek9JV3dRRTlIbEZoL2pGRkN3R2R1bmtLaTM1S2ZGMmg0VURR?=
 =?utf-8?B?MUh6SHV3VWZiMXBFRWZXZUxodzNScWliaitxZzRrWDZWemJRL3FVMlJuWWs5?=
 =?utf-8?B?MWxIOEg0VnNCU3hwYmZGUmJ2ajVRSDlhS1RRU0prTVZUK1UyTThXQS9VRDRT?=
 =?utf-8?Q?6nvUT8aOiHR3kqJjN23p5waLmJbg4s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 04:07:51.4960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f87ee9b-4e09-484a-670b-08dd23075ea4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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

Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
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
index a80ba457a858..fdf9b8647592 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -222,6 +222,13 @@ struct drm_dp_mst_branch {
 	 */
 	struct list_head destroy_next;
 
+	/**
+	 * @rad: Relative Address of the MST branch.
+	 * For drm_dp_mst_topology_mgr::mst_primary, it's rad[8] are all 0,
+	 * unset and unused. For MST branches connected after mst_primary,
+	 * in each element of rad[] the nibbles are ordered by the most
+	 * signifcant 4 bits first and the least significant 4 bits second.
+	 */
 	u8 rad[8];
 	u8 lct;
 	int num_ports;
-- 
2.37.3

