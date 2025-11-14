Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42338C5C0C3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A187F10EA0E;
	Fri, 14 Nov 2025 08:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JCMWodfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011039.outbound.protection.outlook.com
 [40.93.194.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B910EA09;
 Fri, 14 Nov 2025 08:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEG3sjF7iDb/2A+BfLxS01rgRShxh1Nkp/WZ4IcRXnWl0ItCStn5t2h00qxEjYjWO3/GiKl68RQG8EvtBIa4ENKf5fWPRRjJnkyxBr/ie72usCTAhXQV2RXFwa2eGFgMu/uGXcPkstt9MA0sboAx2Prm7B/Wxen7yzo5lhs7NqKD5Zs07vxNoaC2+zs5vJ88DKyytHan7hadeYRfIu3ND0W76crrOrbwAS5iB17dtl3xTKGHMuNMZ1h9/VoVCbN9ek9fV26Pw80S97R/oe1qSnXaROeZdGW4nxm72SVYXhgqHB2a8/GO/L/H8CZEKvRX9BGRhW7n1ZH89ABJVpYYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF+6BwHpwkmKS3nffxLA3f/TZjF60LHFgRVyKrWl3GA=;
 b=S95rJJjro24dxoUO7P+Pvvic1Pakzoed9SYLaia7CQx8g+RyqNYnhwPF/EliyPzY8lqAHCPVdcd7ja4N8VfjQ0rJaD9eL+XjjYRHo301IJGrEy6DOjz+me7Spw6LmEu65O1v0sjgRoOsdXKaXljxr6ox/QW5qO0ZrUQvyqVITRrdbHYU/RMg26VhahVA37zlpYzDIyWXfXfAF6jbcIkzDBFTR/UGEkZf7ZK4UkmLBPT1VeA6QOKwOSWLWDv3nhzIFuBFjIzf1hH/7wS0vqG+WgntV/1CezA0rK7cYsgNjR5whTEMBe+hSfduLbj6ivG2EOhaUcKnq2qi19AmtNKjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pF+6BwHpwkmKS3nffxLA3f/TZjF60LHFgRVyKrWl3GA=;
 b=JCMWodfHA7Gr90LSiyLXd5hNt68LYul9xwO8kRSBiz0IYCRFuxr1riiKdwp+EhVWATjfGraz7soWWbQTbAX7asjnvrSE4vS6TuaA51vgWx/NhDqEescivWoks4zqBBjbrvvgiwuFUFwYqtoqr/HSaeP2VT0RLUVrwUBGyyAgEO4=
Received: from SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18)
 by MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 08:43:20 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::49) by SN7PR18CA0026.outlook.office365.com
 (2603:10b6:806:f3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 08:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:19 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:16 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 14 Nov 2025 16:42:21 +0800
Subject: [PATCH v2 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-1-4f6bdd48030d@amd.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=koPlLxkZoikTjButzlcLUvVRVsDIIlEYzt+u5o/G4PU=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuuegtZgaXXswHHNz28u82M+L/U6DX8u8WvJa
 c0IBn9/RriJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrngAKCRBfF7GWSinu
 hnmNEACjYGBhr5C6e9wO6E2fK5eBeoGGuXzRxDFeOWLsDqwzpPFEbBZhBidDzaUNPuVCV/+PPyB
 QxXUYM3SObwFUIwqmMioz86ot679ldM8aauKCk31ZCoUzMZ+bGlzQ2GHCf+maVWbIrYPuWmg+Qf
 RhmX+plvPQaukKFTVwOyOzp30wt9+VCKcd2W1A3e+E2XSQfKJvc8/p28YasCUD7h/XjAhYq9/iN
 IOTQ3bEJXIi2ziRu6A5OShC0qOGB/xJyc2tvxaSK8qPq4z6iOWvNU06YgFV7TKxGU0qvbVwSwsl
 RR9wNR3/7DValAhAygt8Ih2An2RZ5PNgadNiaRJmWAMzTF+h1ISaZ2TFyLsmyKHJ8VAfMSDoplI
 FRocz+YXIVH4aexvHOc4Sim/VSsuV3gxPhn6U7diFglMnlRMNIXTeeGfFIupobGmcX4j1TIFXrk
 hMmB0ou3FVVGAifcyEKlVSlr5/cCGOv3vx/Z4AaV4TACCyB59N5rfzfFFNTqTBq9gMAWS4oyhQE
 lwmIpgwuTNM2Hp7BawhsTQLUnltyeELgd11NRd3llFPtLRqtsXb98cscPq48zxqgks/qBG5vjOp
 YqWCEQfeIBQwTpRvHjdxOJmZV1Z4e+UrcEEwL2FCC3JUXZMjATz+MVLEiFrrH2IEk+49229JTg4
 aLrzSJC+CpjdFKQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|MN2PR12MB4063:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4143c5-b7ea-45a9-fed2-08de2359dce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhDTC81MitVK3czMEdIU2dQYnlSd0xsQlo0REU2MEVBdlAybzZaNCtPVEU5?=
 =?utf-8?B?WEFqYk9IRkJmNm5TdU1VY1crWGtEMDBpcm5LQTZiMWJvcCsxVFl6UFgvbjl4?=
 =?utf-8?B?V1dtK28rZjZxUFR4TDh0OTM5elNqMXpoSjdBd0pjOHpEWFVzV1RZWUJPcTI3?=
 =?utf-8?B?RHd4RzVtVlRlZ0lpR003cVJzN29ObmtQemQyMFVkazVjcXVRQk5CbEZ2Z2VH?=
 =?utf-8?B?c3JsbFpYbmowUWczLzduSlBDZmhxVmFIZDZLS1hDUnZjREtndDNPODQzT285?=
 =?utf-8?B?cDhGY3lTMFRxMVJWdkttMjQrM0MzdFlGbmpLaFBSNmpqZC8wR2ZMb2N1S21F?=
 =?utf-8?B?dFZjd2l3YXU4QVNabjUrNDg4SGxrM0VBTS9NZitkMnJNUHhPUk84cnZIeGk0?=
 =?utf-8?B?S05KTlpMdGhGSTQ4aHRwSmxkL0NpTm5HMTlGR2FvVHpwWmJkNkJDZVdFak9W?=
 =?utf-8?B?VTU5bGpWeGN0Y3AvaXRFay9TeEZFbGlxZDF0VmIzeEYyVmtvTGd6WlVtQVF4?=
 =?utf-8?B?aGxNaHVjdWR4TmlEamQ1YnVacFdjQktVRVl6SkNKRXgxeWZGcHN6UUN3OWFG?=
 =?utf-8?B?YzNjcHRYZlVhQi9rM2RMTUg5VTR0K3NmNnpUdEFOQ3VZRlBIV2U3UlZWeW03?=
 =?utf-8?B?MytjOWhvdzRlUStzTjlDSXY1ZmFmR3IzTTdTQWhSOVVZcXIzaHd1UHlQNWNS?=
 =?utf-8?B?ak5NR0ptMDZsSnIza0creDBsajY3azJ3V0dvaFJxRHdxelY1OG9pVjN6STJU?=
 =?utf-8?B?UDFPK0xZTG40VGdJM1QySnB5YnkxV0h2RnNjcVNFTWkrbzdndmdpMktSS0k0?=
 =?utf-8?B?MlJ1OTFEd2pKcDdndk0yajAyR1pOOFUzOUsyVEYrQUNVTkpNYjNNTFk2cUlE?=
 =?utf-8?B?RTBRUlNhSUpyeGlQQjZZZktJN1Y2M0tGZXV6S1NkbkNRN0N3UkVVaEl1dnJ3?=
 =?utf-8?B?VGo4Ukk1d01qVnVQWU1mQXJ1VU91ZjhXKzJmTHVXVFV5QnJRM0R5aGxFQVpx?=
 =?utf-8?B?S3VjaEtXc0ZPWUcxUk5IUXoyK2pjSi95Ri9hb290RXRIdUNRcUNhOStGb0h0?=
 =?utf-8?B?OWNVdFdDKzVzYTlIL3ZNM3RveTJ6OFpNQmwxTisyR0tSbUxZWmEwakYvTDFw?=
 =?utf-8?B?YWFUdytuZWsvYmQzSjRReFRXWE10dVRXb1RaekZHc0JMcmV3ck0xK2pNL2hj?=
 =?utf-8?B?eE1WcG9TaHJIZExMMDhOdnBYZkJPbGdTREZBUlNtcy9TdWEwRlNkbUptNTV0?=
 =?utf-8?B?RGlOQWtITTVQNlhOcm5YcTVVRXJRSmdVZER3Y2Z1NnV5V2loQk5IeDcyczlm?=
 =?utf-8?B?dUE3MEd2bEJBU3RjOE5LRStDcUs1Qkxva29UaUh2a2ppYmRzMzYzdFdtVVp1?=
 =?utf-8?B?TlI0SjFHNWFaemx5dmZGU0c0QklMbU5XRHBnd1NwaW5QZ3lscVQ2ZFo0SERI?=
 =?utf-8?B?OW5YaVM3WnlOQ2praHZDWkJUcElNeFZLd1NrN3NWVURuN3IxT2lNbk94TjZC?=
 =?utf-8?B?WUxCUzd1ZjkvQzF0ZTZsR1M3Um00SHF5cXhVbG85QnVHZFZDUmFWd2xnb2Fq?=
 =?utf-8?B?TC94cFNERXh1SnRlMC9yS29FKy9paVFGTWRBbUxnY0hlU1BSSlBQWVJDTllF?=
 =?utf-8?B?YzFqRkdQQjVVNXNLK0lZRHBvYXBsVy9WTDg4V1FGVVlJaCtOb2JyYjhIUTM1?=
 =?utf-8?B?WCs5VXMyQUZhZDRxejUzKzI4ZUl3aDlhdHhpYm1aMVdaK2U5cWRYM1U3UVVx?=
 =?utf-8?B?enVoSkdrK05zeDl1YlgyS0JKZGxzZmlJTGZTejRFTUNaMDNHUTFVNlpQVlhH?=
 =?utf-8?B?Q2RkZlRLeENZRFRKQ242dU1uU2VhR3FRM0RlaDVxdmRTRXJWOS9HUlhZc1pL?=
 =?utf-8?B?ZHpsSzgwUVNOZllVcUNVOFpzR3dkdGVFMWhGdVFTKytRcFovTGt5ZUIybEcr?=
 =?utf-8?B?VG9QWnNSbWhpZWtIL2FxYmNpV3YwUjFvd3NrK3o3NG5tcVcxVlZQR1dEWWRk?=
 =?utf-8?B?ZUZXNzYzMklEQmE2N2xIeEpMS3NZWGpuTWQ4NzZUSWRRWUV0NWRvQ3BzTTQ5?=
 =?utf-8?B?MmN6L3o0N2JHRTBZYnJueDNFYXM4WW9LbkVPV1FZSXQ4RXZ6c1ZmNUJyT3FK?=
 =?utf-8?Q?GxMc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:19.7611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4143c5-b7ea-45a9-fed2-08de2359dce5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063
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

The capabilities of getting and setting VRAM carveout size are exposed
in the ATCS mask. Parse and store these capabilities for future use.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++++
 drivers/gpu/drm/amd/include/amd_acpi.h   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 6c62e27b9800..0743fd8620e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -116,7 +116,9 @@ struct amdgpu_atcs_functions {
 	bool pcie_perf_req;
 	bool pcie_dev_rdy;
 	bool pcie_bus_width;
+	bool get_uma_size;
 	bool power_shift_control;
+	bool set_uma_allocation_size;
 };
 
 struct amdgpu_atcs {
@@ -588,7 +590,9 @@ static void amdgpu_atcs_parse_functions(struct amdgpu_atcs_functions *f, u32 mas
 	f->pcie_perf_req = mask & ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORTED;
 	f->pcie_dev_rdy = mask & ATCS_PCIE_DEVICE_READY_NOTIFICATION_SUPPORTED;
 	f->pcie_bus_width = mask & ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED;
+	f->get_uma_size = mask & ACPI_ATCS_GET_UMA_SIZE_SUPPORTED;
 	f->power_shift_control = mask & ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED;
+	f->set_uma_allocation_size = mask & ACPI_ATCS_SET_UMA_ALLOCATION_SIZE_SUPPORTED;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
index 06badbf0c5b9..e582339e8e8e 100644
--- a/drivers/gpu/drm/amd/include/amd_acpi.h
+++ b/drivers/gpu/drm/amd/include/amd_acpi.h
@@ -427,7 +427,9 @@ struct atcs_pwr_shift_input {
 #       define ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORTED             (1 << 1)
 #       define ATCS_PCIE_DEVICE_READY_NOTIFICATION_SUPPORTED       (1 << 2)
 #       define ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED                   (1 << 3)
-#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED		   (1 << 7)
+#       define ACPI_ATCS_GET_UMA_SIZE_SUPPORTED                    (1 << 5)
+#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED              (1 << 7)
+#       define ACPI_ATCS_SET_UMA_ALLOCATION_SIZE_SUPPORTED         (1 << 9)
 #define ATCS_FUNCTION_GET_EXTERNAL_STATE                           0x1
 /* ARG0: ATCS_FUNCTION_GET_EXTERNAL_STATE
  * ARG1: none

-- 
2.43.0

