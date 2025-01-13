Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5996A0B270
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C710E42F;
	Mon, 13 Jan 2025 09:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SOvRpLFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA4B10E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW5iBkZFcvJVFV/Tv4KSKtxzSXeMnoDUqNR2fQw4/oPSZR78DyEQZ13ZMtuSN5+d52Kf8BO88teyxlWL160BdLeZ0wpaO2BBGE9XsgqYhxy37qEKlM2byF6H+Sw7y/3NPahHie80Pyq6bLX//PYksbMuETnRdJczCgHylHCWjwz/TQDrwr0a8CuvOpzJls5sHUMkECu+JLCyp0mwSz0lkfKoqM6p55JrRoGz0unjYrAfJhzXhBVDCv4VpCBJMA95lVcIusG1pj+hZ7ZOF4R1yWkHIald6vV/zHp0CZfc9c3Ejh7aLG9rGj4FVTqyMgVwlLsuOOMB0RHVae5DqejidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0V835ecDdvxJ7eYVX5Hms+masuQ4g+vtnobLBzdFjoc=;
 b=RFhvjI0czMdc0fxx61S9VTjnNNebD9XSdJfnCLfOgzs73CSoKSkjZcRUHGYCCjm4UV+uX7ZXIL2EJZV9KjNWqmxlGYn1+y1/SX6fI5harndDolt9z4sPq2ziN23TsQJi6kQ8XCQQfe730ilQFyQ3bUupWb7uihph0yf7cGteMvtKG01brBtPpTAwcUT3LeizZ94s3qFReB2HBz3mmD0cIrCZr2iO7rVxsitgWXP0wIhl2HqqBKohHJS+8F5LF36lT7lx21UpreI+qNuNPFFNb42EVPIMeeW0ms4o5pnLX+e+R3WfT31Xz/NLhfoAsQ8Y7pYisitoWkIpZuEvNQBL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V835ecDdvxJ7eYVX5Hms+masuQ4g+vtnobLBzdFjoc=;
 b=SOvRpLFjpPtqwILebvuOPX5AFOBwmgjZS28fV8fhDQb+SFLV+SGlrsi9dB8Rr//LmHdy9fsEqhgGN3nB2mZZxb2pJPVKe1E19WqNpuxBqkWLqklvbRQo/aNOp7XCq8flNleFnvUHNDAUR0rSnVS3cycPcnPuXZelsyFO2t9lRBQ=
Received: from DM6PR14CA0042.namprd14.prod.outlook.com (2603:10b6:5:18f::19)
 by IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:11:12 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::c0) by DM6PR14CA0042.outlook.office365.com
 (2603:10b6:5:18f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Mon,
 13 Jan 2025 09:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 09:11:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 03:11:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 03:11:10 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 03:11:08 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <imre.deak@intel.com>,
 <ville.syrjala@linux.intel.com>, <hwentlan@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v4 2/2] drm/dp_mst: Add helper to get port number at specific
 LCT from RAD
Date: Mon, 13 Jan 2025 17:11:00 +0800
Message-ID: <20250113091100.3314533-3-Wayne.Lin@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|IA1PR12MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bc5a40-fe14-412f-29df-08dd33b2399f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFljY2EvRXkzLzVocndaWTQ1ZzZLZ3pGK2dpM1AwV0JGcmd1VU1vUHBYTmRm?=
 =?utf-8?B?QXRoYmU4SU55UjRueW9JSmVxclJ4eUVSQm9EVHVaUWp1ODJ0RnR2SHYvWWZh?=
 =?utf-8?B?ZVl1ZVdrV2tMdTF5cEpNVmdlYUZObWtwTktmb2dQZUJKejB3WFdsRnBsUkxG?=
 =?utf-8?B?WjkxT0Q5b0wxRFVRRlMyd2NwNVIxUDM2cFlTd1V1Rm52VUh3S2RBdDBxY0Nm?=
 =?utf-8?B?NWtBODBuQlFLUyt1L2lFeXlYYU5ENzJBYkdtcDFsTlVBQVlYSm9taXpaclJG?=
 =?utf-8?B?Q1E4dGxMeWVFc3B3bDZuU0hrOXZBWG1FR3RyRUwvUTdEY1BSQzhxYWFSSzh1?=
 =?utf-8?B?UUg0YWQrMFFTNmhkY3QwS3lrbzNZMHV6Vm5hcFRSaFFMVDVrZHJ3aGtFN3Y0?=
 =?utf-8?B?cGFQNm56Ris0NS9va0JoMUxMSndrVUlDT0hVYW5jcUhwOEtabFJRZ2xYQXN5?=
 =?utf-8?B?NXpZTzhkK2pLRUZNa1kvTXZPZzhsQ0JHZUtxTncrSUR0bzFGZWs1Y3BiTERa?=
 =?utf-8?B?YXRTWitxVDhMbmVWRHdEeVFzUkxrcmZFeERzSDhFNE1DdUdEQzltSitpVmRa?=
 =?utf-8?B?ZnhVSHpub2FEM0JnMFdlZkFiOFp5UDVCT0RoU3pIS0hzYVV0Vi85N3hwNkdZ?=
 =?utf-8?B?Mi9QdU44Y2NrRXdSMnJFYlNEUW5ndE1BNzJ5Q0VXZndDazRSMldRM3Q3TWw4?=
 =?utf-8?B?K0NocEJuMVgycHRWcS8zUGg5UjhqYiswemJOVzRGd2x0bkxGMlBBRDg2cDFr?=
 =?utf-8?B?a1JnTE5vTXJLaDMyQ3BvUTE5MFplZVljbkZYeUViTzFkOU1jemNyWWR6TGJw?=
 =?utf-8?B?VEZ2Zm1TYm1sd3FNY0lPUDZuQStycXljV0hyZWY4U2pGSmt2Z0Nna2pxdkFG?=
 =?utf-8?B?YVlMMU0vZzRkN2JPZzdnakt0MlF1QUhWMDFiOThwWlJMWTAvMWpybGlLWjVy?=
 =?utf-8?B?dVpBSS9GY0ZHdUttM0xHY080eVlwc3dTTGZMTGJSU3VHZ0dkUC9qcFBLMUhO?=
 =?utf-8?B?aXpLdDNxT1dKS2I0eDlCcGx1WlN1YTBKRTU5TXArRHlpV1ZKTVlpY0ZMZXJl?=
 =?utf-8?B?V2Z0UFNLWUNjWUdNUTRLYlB6dzhod0xNMGJKQ0tDbzFySkdZTkQ1QlI5ZTl3?=
 =?utf-8?B?NkU1MWFVN0pIa1k3K0RPTHJwK3dSNTBiK3NTeGpWbHJIUWRQQ1FwWjEzZG5r?=
 =?utf-8?B?N0NUT1ZnWjc0U0NaMHRXMHF3SjR0OFZsS2tZRXJBRURTZkNWeERnMmphZ0w4?=
 =?utf-8?B?WElLOWx4V2ZJSGVkZVR0bVpxOWgrTnV5L3RMYnY5cE5ad1h1SUt4bW45YWxT?=
 =?utf-8?B?U0U0bWJ0ZTlHUytRaGNvMkxjWkJFOGl0cEJJZW9RRUd2N0t0L09HWUZ2S3k3?=
 =?utf-8?B?bWRIZnR3RjdseTVKTjdoZXNEWkgvenA4RDlGOWdYdUNiS25COS91Q0lreUVJ?=
 =?utf-8?B?VlNiMURBQzZ5V0hNa002VGx4d3RGWnNwT294YTRrWlg1eTVDUzRndzc3SVhF?=
 =?utf-8?B?VE9MejV0dWpUL05sWmxvR3liY0N0M2Mvczh5QnFyaEdiWEs0RDZRaExSRWg1?=
 =?utf-8?B?dEd0UHd0RXkxTkZ5ZnZLWE5JTnhkTnpyZ01sRVRVc2NvVU9WMDg2a3dEYVJ5?=
 =?utf-8?B?UUdSajBiVGJPcFgxaFpjOGZySFVzOGRRZ241YXc5TCtUTDZ1L2pEOEpvRGxO?=
 =?utf-8?B?dG1MMHBBbTRpLzI2ZmZZV21xbGF2dzBDZlpKVyttN2h5dDBuOTNJcG13Y2ly?=
 =?utf-8?B?dGxnQXNPSFduYk9Rcmd1bUQyalVQMXZlMW5WNU1mQUJPNVA4TzlsRWxTWjdq?=
 =?utf-8?B?c3FFejlvTWNCNzZUMjhVSHhad1VCTUFBNE1VQ1ZoQ0FLMTFaWFI0TWpZdEVl?=
 =?utf-8?B?ekgySjU1MCtkOFE2c0tPSWdWNUlHaGdwUVR0V2tCL3M5OTMvUUVGMEtRMHI1?=
 =?utf-8?B?dStuN1JmclZGQzlQaUp1QkEvSWFDRTF1dENZdXJ3d1VPUVlJMlNyM3VVcnlJ?=
 =?utf-8?Q?yR+z4q1LtqfX6C+DKYv3Fzoy3FsWB4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:11:11.9312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bc5a40-fe14-412f-29df-08dd33b2399f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517
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

V3:
- Ajust parameter "rad" of drm_dp_mst_get_ufp_num_at_lct_from_rad() to
be constant (Kernel test robot)

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
index 271a00b81264..e79f4b76ec2b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -171,18 +171,30 @@ static const char *drm_dp_mst_sideband_tx_state_str(int state)
 	return sideband_reason_str[state];
 }
 
+static inline u8
+drm_dp_mst_get_ufp_num_at_lct_from_rad(u8 lct, const u8 *rad)
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

