Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08AA0855E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AE210EF7E;
	Fri, 10 Jan 2025 02:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gqw/Swlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DABA10EF78
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dbfj8lZ57lfd/0wPVDeob0fH7z1uCh8XOGMuHxgo3a43k/jtdx6096T2oTQd5sw0tPmb4uxaWe3jJeFKMu9YMgFBXXpluEjCKGsaxWm8TwyQNMTumG3vd160dIoZOfEcPRM0GNEJ9EdhjuDnzBrAqAprIM7BsvqriHPVnGQOK3bUmLJT281hKvooD7M1ba1METL6BNVGvrS5Wi3agudrxFNCSAJDjfFI+u2ih1eFPlZUdtfkf13RKMSWysqGFFgZVrBFd9oIABjFQljZePLzF0sc49XCGVxRBAyb4mJKECCKpjhkyNLPmMH/Nqk8K8+2HM63tlx8/qAQK2j+ZnF5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97H6PzSnR86yqWSMiaeVW6M4BKmzR39NMex1olEyNdA=;
 b=QGfzkXcKVlKsT4wpacrCw/E29J7fl0QeObFs/tXLCnfMBcvT9mWIeYJxuGwEYFSpfvtcre/ghmH1souvguujTb2tfhOTK17y8i6zq0lO2eyFnR8Lho/wNGJSjWmiygDkxiRsYm2L/K1y/CtEfXKP+mo5C1Pi137i8/90QIpUU9Zyw6bAwxnbpGaZ86dY2zdIONNFd/g3Nze/412mVFf2vkQodMR4QG43pQXnIwHE9ApUxP28/DP0bm2sZ58EcVEmmykJHlrAyzkh4fHhjkfPDDf9sEE/vIYpeX93d9Y1Kad07qAz5oxTPK06/lEJPbcsdyEQ2hN0uxJgNr6XBf9a8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97H6PzSnR86yqWSMiaeVW6M4BKmzR39NMex1olEyNdA=;
 b=Gqw/SwlhQhT8XMesPnbVMNm7S8MA3YxBBMKvIKZDTXpbrpgfYeu7O+9tt4gvVDgrZTOMurEgMHFDXJXynmmH/kUmJLTd6AGtcRykWYc02S0NFGOKLhQzT2b07e+a/eOyGNSvR3Wh6tlFK3nDlr8O/6172X7BfFpEjRSjkm01mM4=
Received: from DM6PR11CA0022.namprd11.prod.outlook.com (2603:10b6:5:190::35)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Fri, 10 Jan
 2025 02:37:00 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::26) by DM6PR11CA0022.outlook.office365.com
 (2603:10b6:5:190::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 02:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 02:37:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 20:36:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 20:36:59 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 20:36:56 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, Wayne Lin <Wayne.Lin@amd.com>, "Harry
 Wentland" <hwentlan@amd.com>
Subject: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at specific
 LCT from RAD
Date: Fri, 10 Jan 2025 10:36:18 +0800
Message-ID: <20250110023618.66401-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250110023618.66401-1-Wayne.Lin@amd.com>
References: <20250110023618.66401-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 0083a16a-86e4-45d4-9541-08dd311fa8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHJwM1lUdytqTmdoNG1VaWFvZldlb205Ky9hQTZ5NHc3SmRiZCttS0syY1NL?=
 =?utf-8?B?UGNyNmlHY2NRbEx2bmoxRUxLVWVhNTJwc1ZaL1luVmVjTXgrNEZROURqZGNF?=
 =?utf-8?B?dUJDRmx3Y0YrR3k5TUsxU0puYmpLMlh2QmkyOHJwK0FtWEpTaTF3NDVNUGhT?=
 =?utf-8?B?dkhqSzRXMDNzT0xtblVWV3BUZmVqb3dBY2FmYkV5VU15NGNoeEtjVGNkcFQ1?=
 =?utf-8?B?dGxxTW56VHlndllXY0tGWC84V2NSVW82RUlwczNqeTd6S2NwTEZiK1hsOVVh?=
 =?utf-8?B?UXVTRXJ0azBEZjhxUTNwQU1VZmZzK3o5Y05rN2NJb2F5WmRVQWMxQ2p3SmRl?=
 =?utf-8?B?Q2w1c1lUKzlyb1h1VFdYODltaWQwSFJ6QjQ5ZW9CM284WXYrTDViNXkxM2lD?=
 =?utf-8?B?VFlHeW1NaWNCNGkvMmZJWFRwQTdZWG5ldnF5b2hiaFlDRHFqN2xWZFhKZkRU?=
 =?utf-8?B?TXMrbGxxUnBwS04xTGJNUUZTNk1qbGQreFhZdDNZWHl6MkF1alF1TFJJWVNl?=
 =?utf-8?B?WUtWRCtTQklFd3liNFZGaFhaU2F3QndOdjZMK0poS3dDa1M2S2VlNUxlNXl6?=
 =?utf-8?B?WnNEdUxRTHE1NUR0QURmdzlub3BPa3ZyQ2tnMnlSb2dLZjR4NEVkVzdrU2V5?=
 =?utf-8?B?SXlhSW9iQ3BHbzN4bVpUNE1yenVlZkdLc0pPNit5QVB3QXFBQ28rSlpldW1T?=
 =?utf-8?B?RGROOFRwSy9qYkNCWW9PWHBZR0hpVUovTUxqNlhISUVlY21SZ2NLKzdQdTFM?=
 =?utf-8?B?OEFKS2xuVThMQmpKcHhGR3gvT2EwYVdEelJvNEo5NFIrc2lkbzBONm5xL3Rv?=
 =?utf-8?B?WENhVmUweXlMWmxCeDRJS1VzNlVGYkkwVlZvV0hzZGZOMW5HY2tpMWlHUkhG?=
 =?utf-8?B?SERQc2RnZ1JJR25kZDFEWFNSVURaZjgyRlFpR0Z3dDk4WmFPbWFUcFpvbisr?=
 =?utf-8?B?cDBZZFc1UmdRc0pvZmhmK0l2WEhVRFI0VG9vdkcvK1dZMk13eUU0OStzck1K?=
 =?utf-8?B?WnloVGduUFdPeDkzVlphWWs4aTlDOERPNlNzNWlzektnWm00ZmtLbUNKOEIv?=
 =?utf-8?B?VllhVElzUktURU55TFdlbXdacnlzL3hLbTgrM1E5eVhySU40RHZQWmR5ajhC?=
 =?utf-8?B?VFhCSFBiUXcvS09ITVZjNGI2YmtZNFVpR2dOeHJwN2NiWkFMR0FHNk5ET1cz?=
 =?utf-8?B?TE1lMUxraFpMOENmM3pYRjRqdWtzMXg0Z21Qdk1jSzF3TlQ2TW9IaVVPeS9a?=
 =?utf-8?B?VzFzU2FWcmhseEJ6aEp0ZThEck5ETUREQWhFTVloSVBxS2lSbWRsNlluTkxG?=
 =?utf-8?B?ZTlZUU5JWjVFbjRMTlN6RnFmYlc5ditTSVZxMEVrYzRlTlNKcU1YK0daNjhP?=
 =?utf-8?B?NUZVVGZVZGhoM2Y5RkdQcTNSMVl0c3FOUExPcHNQYlJNSGhZYzdoakNnNFkr?=
 =?utf-8?B?aHByTWxxOWpiYzJuaytueklwRTV3dEV4TVRYN090TVg2a2RuNk56OU1Ldlhq?=
 =?utf-8?B?TWtXYWR6Zy9ib01oNElrdnI4L3FXOEY5UUd3WjhIQTl3QTFrbGdxQkNzYmEy?=
 =?utf-8?B?eUNxOWo4VXRBY0RyaS9FejlsZGpXOTBzZStmWHhncDhyK2tXVUhLeDRSQmxM?=
 =?utf-8?B?UTdZa3JEMmNVQlFJZ1pKNnRLTDNiVWE5ZlF3cUVZdnhnZk1JWVlpbEZhYkE3?=
 =?utf-8?B?bGlyN3o0NVdadnk3U2N0ZUJUK09udkhjVmRSSWJKc09kRTNXN3oxNkVIRFl6?=
 =?utf-8?B?bk44YkdPWjVHdTVOWWF5WmVQMHFScmFIUW9KdkE1aDNkSm9FQ3ZOOXlyTC9G?=
 =?utf-8?B?RUZVN3VuV3d4aGtVQjF0R2lYYzZMaGNuK093ZEhNUHVxK1VidFR2empNVzUz?=
 =?utf-8?B?TVN2SVhjS25UOHAvdjV2TnJRZzh2dHMvQ1czS2Rza1NnMzhhaDJkdnhZaEtG?=
 =?utf-8?B?S0VhcmVIUStja3ByUnJXYXRHWjMzY0JTSllDdXp3NWkrcnZucHdUQ2lvYWVu?=
 =?utf-8?Q?554ikRkdg9t1HI/zcVwpBNo8D1sX1Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 02:37:00.3667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0083a16a-86e4-45d4-9541-08dd311fa8f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
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

V2:
- Adjust the code format (Lyude)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 271a00b81264..0b9bb3a426a4 100644
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
@@ -2544,9 +2556,8 @@ static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_
 	if (!mstb)
 		goto out;
 
-	for (i = 0; i < lct - 1; i++) {
-		int shift = (i % 2) ? 0 : 4;
-		int port_num = (rad[i / 2] >> shift) & 0xf;
+	for (i = 1; i < lct; i++) {
+		int port_num = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
 
 		list_for_each_entry(port, &mstb->ports, next) {
 			if (port->port_num == port_num) {
-- 
2.37.3

