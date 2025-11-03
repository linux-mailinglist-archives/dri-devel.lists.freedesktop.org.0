Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A5C2A69B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEA610E372;
	Mon,  3 Nov 2025 07:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4UlAqZ8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24BC10E370;
 Mon,  3 Nov 2025 07:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/oXcp6WqdnbxfqZ3u+TicL/9JtiCeuVBvi7+x0XoFWSVQlBt62py81hunWo+vYGzyEc5Zn9awQh2LYkjhl6CKjCYm86YSzgteat8feTSq+bIokCI8RDrfYrm6j62dOYev7oEVBB1BqeDW01+bu+IUvcqhjERRhOmgTUZTds89rgel74ijB//1L//qJrV8XI+88TlxHlZ937zUHkoaxFtWqkDhom6PB03dKSPWn479imYqe3hexEY6JIAIAQjB5ccJioY6N1Nj5AgJPAFTn1rz8fpK9NOePiEm/zFVFSJhl9EZUXrdy4eAeSMMQQgW+jzQImjG9HavsY6WS02kvHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEaykcVm/FGMf5I1VgHANo9oJ3iKOXkWtPWqiPIDEwE=;
 b=UhM5EB4mMSJLol4H1oEGdDifS4+m1dSrSe6+HhQfgCzdTBeAVR7uai4wLWHUK63Gmd49HW/auVASThBO+d29nrhHWJvpyGMlUCfPnAb2Ebq7O6Nhv8lMUm+UxcvktVEFJ28NdsKBUOfD1NGAXcahs1YiyKw93nL9OmNf1w8hfqGtkFlb8wjAk51XQP+He9PadtNTBPexLjesF2eKIcEnTQhrYKgIbm45QCd+Y0gp4XON6y9a23Z0GmvD8PC9lCUYXOHE9PEH6sapRvEQAh6bCSo/iXrClUFC5/Bhem3ojGZFcjf6FV1OvbvQ8xj7AjH3BS0R4HBOsQF+P5XR4h7B2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEaykcVm/FGMf5I1VgHANo9oJ3iKOXkWtPWqiPIDEwE=;
 b=4UlAqZ8Mv6JQmS8DivNipsbSlRz2+bjht+FxkqnWulTRbNUbFLoqBGxkKo56b2GJRcZ8/UUB+EOqLlWzJh0nfT6fP+pyjB12RHpgyOfD0VrwmVfF8gbcRdudJgZGAek/bgYu0u24DXPINynHETky4W0QFZ7abEwXBQ7h8zkWC2w=
Received: from DS7PR05CA0018.namprd05.prod.outlook.com (2603:10b6:5:3b9::23)
 by IA1PR12MB8554.namprd12.prod.outlook.com (2603:10b6:208:450::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 07:54:03 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::2f) by DS7PR05CA0018.outlook.office365.com
 (2603:10b6:5:3b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 07:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:54:03 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:53:57 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 3 Nov 2025 15:51:04 +0800
Subject: [PATCH 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-1-17e2a72639c5@amd.com>
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Yo-Jung Leo Lin
 (AMD)" <Leo.Lin@amd.com>, <anson.tsao@amd.com>, <superm1@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=ZyzH78pozkjSK9YedX85yAZ8jZCBI2sgQzw1ZDTyub8=;
 b=owEBbAKT/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8LrtwPrzXwKL6qrNRBhVwz/uM56Yax4JaR/
 jyzltcR/16JAjIEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfCwAKCRBfF7GWSinu
 hjnKD/iCmATCQMV2GYYfJcR7hQbn0Yw8VQhbk4yC/Mo3g8PK5Jn7uE5L0H2MHgN+gu+wNDeWy0k
 MvvXo3nfPgR1swwvZTYAoleNlB0WVmQ0wT8HM+3SjmMOYmY3gYWJhQFeTTkgJcMEjo/d239aOsZ
 0s/TXzc529zwwCVY+ChqMjW91bH9YFEczwuVvX4z/njTM6Xboy5m8lHW/k0fI4QHfmhkEvSvxJu
 zwCLxcPtGTW+MKmdwmLzN2DYrUixyVgQLDJYgGL/zLQcxPTNZgrtllXqY6Mbr3ycajQQGUJHMQ/
 uPFFLRxNG4DEaCIRGRC5PyaG9kzw6KfFypnFfs6+Qd5toaVVip7hxePxcFfPcpcPIhJQHYs/U9k
 dnEQ9IOYSscXzlv9o+4Y3A7wR7qD2GB5DqYdQ5mBCXE06kuuMuNKDXtW8+YpLj2qlDax2fOusWC
 +gk6BjYVLpbop4JTmf7DkwF4ZB7W3VdsOcrT+m/ybJR5EXv8fX9Gc2bpsKQMRbl5fgqUgZC6jAz
 rjzn5o+at7QGqTsR5IzDuuV0SlB7C83WR8SNfubhZ3NxguWpY7b5cJo5Nfbp0THW+/nsB2IrOfc
 JCSt6tvjADqXsIku6w+Sk6nphOpT5kR3W5/zuIQN+r8Vs7Tui2h7FMVhEyIQ7ccjDKvhc2XyINn
 d+7y0Jag6tN71
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA1PR12MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f3f961-ac46-4cd6-207b-08de1aae2837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkR0amdwcC9uNnB1azVqcUFCZkZLTlNyNHV3ZER2SnFySU1SZk1JUGg1cEFF?=
 =?utf-8?B?UmJJUzcwd1BvZWU1ZC9YNzVoMkRya2JocUpySWhmVWFIV2RLQTF0dGNWYjZY?=
 =?utf-8?B?eWVCSUdqMk5vL0tVazd2b0tqSjZLKzZNN1FTTmpLanBncWMrWG9uMU1XZlFZ?=
 =?utf-8?B?MmhPK3dwOHRLU2ZhZm96dUkzSTM0UUZuNXRscWVLZk5WcUFFY0tZZWczQ0cz?=
 =?utf-8?B?elh1Zk5RWi9xbWtYSmlRN3lHRXhrSC9YS0x3NHZmTFVFaEY1MkhrVzFXektK?=
 =?utf-8?B?MFJSdTIwY2tkdFhNc3RLN25VQitiNTlMYXB2bjhreWZURkcwMGYxanpIdUdP?=
 =?utf-8?B?L3ZQWXlaUVNPWmt0WmhBRnpMdEdOOFlaUDhqNFdpYVQzZ1pIT2NSWXhmM29W?=
 =?utf-8?B?bDB4b09iNEJpNmlXWThhd0lUOWN2ZFB6M3dWWmM2bzIveWpVa0xJY3R3RXpo?=
 =?utf-8?B?cGc1Z3ptVllwOUJGQ0FYY2psb0tMaHBLVzA3UjdmeG5vbkYvdlRnejljU2U5?=
 =?utf-8?B?dDJERWxIOXNlemRUODFJK3Z0eS9ubmpoQjNIdklzdkVKczlKNnJhZFBVYy9F?=
 =?utf-8?B?K3lBVGhKb3lEK1RGblZLc2dvNVVFbStyN1pLVFZNSFVrU3ZkMXNQRUMzY1Fj?=
 =?utf-8?B?a08xWkZZc2RNclF3UE45M2hCY2RtSVd3N3BXZDY3RVoxbXVUQWl5OS9ubDRv?=
 =?utf-8?B?V1VLQ1NkUER0Q1c5R1hadUozM0svY21KYWlVRm1DN0VYMjQrVm8yZFA5Zk1P?=
 =?utf-8?B?QVI4WU9TbzZQbmNFWE9Za2JmTWEwMkFETFpjRTdoZjU1VHVOdmVROHY4L0hu?=
 =?utf-8?B?T1F0d0JBRzFMY2ZKbnBtYW1YTkdPcnA4TGFkaUhpNUhDZzh5d0E5OWxwbWNw?=
 =?utf-8?B?c2J2d3RJVmxKK3BsdGZQTld6aW1nVDFmTnhnZzMxQzNNNDdvSFF3K2wrelB6?=
 =?utf-8?B?SHU4QlhVblNZeFpja3ZRMHdsQWo5YWJhelBhOVBqQ2w1MDVydUZpeDRkejRQ?=
 =?utf-8?B?UmNuSVlrazNPTWZLVzVVbWhqUS9LaWd6Q3hSTGFweTQxc2wzcXhFZGh5SDNm?=
 =?utf-8?B?OGMrTVE2d08yVDRxUUMzOUhuU0FMRFZCVGFTcTFZRVB1ME5xUjk4ajh4c3pD?=
 =?utf-8?B?RVd0UE92ZEtseDZtc0tMeU1Ebys0MEgyYWcvQU9yTmo1cDhSR0xoakgxMU5h?=
 =?utf-8?B?T3hnWHpNMXdJMVRlbW5PMVI3ZmdObHF3SkpnakZrc3B6V1dOSll6aFFWMkM5?=
 =?utf-8?B?OVR4TGRRbEZyQnQ0YXFrUFN6L3JRODM2bm1nZGJrdy8wU3htWWN5dnNvVHZq?=
 =?utf-8?B?QTZpT3VzZXlJaTN6bGsrTzRWbkNvdERKbE94eEVWdTVKL1A5N3ZmbTFvSWNM?=
 =?utf-8?B?VXIxUWJLSmlZT1VpZHNYSU0zd2JpMW54bGY5WDlOYlpjbmhmYnBpYkVPOGRE?=
 =?utf-8?B?L09CZ3FDOFc4cW1EU1l1R1MrL242bURCbVdVN2w1ZzdpSEMrZjZTbTJvdWlk?=
 =?utf-8?B?eDhieWdJM29lQVFXTkZYWXZ0L09ndmNnUEpKVkVIT0VHbXVtK0hqMFZtcUw3?=
 =?utf-8?B?U1VoVUJ5ZDRFSldYY2F3dVFKZ3ZxNWtHWjErZ2hONGpXbzBuOW9LVGRMK2tL?=
 =?utf-8?B?VlFsMXZjVjFMc09UMXRHOVRyZ2JuSVRUajZyODE3MlhOazR1eWFvS2Yra2ZW?=
 =?utf-8?B?Q2pjWjVqeXNTbFBQL0JvMzZhTHluOStyM0RtblNqUmFvV3R5Ni8rS1JXSnhn?=
 =?utf-8?B?NGxZZHc0UmxuckMyTCs2TkZsTlJ1cjk2UUlRWVJrTVhJaU15NlNaS1F3OUoy?=
 =?utf-8?B?YzM2Tk1ha3lhZmV6WmcveTRQZitYUkNXMHNJMlFXVzBVOWEzTXVQdmJlUXJz?=
 =?utf-8?B?MFNMWHQ0VTdMMUNxK3QxdTR1SHJJTEUwTzVSRkplMU0vQnl6bG1NTXZNU3Iw?=
 =?utf-8?B?bGtWeWVZYWp0eHBQS0RGUmRlZ0Mzc0tLbjMyb2lkS0NTRm5jNjM5eHIweGxT?=
 =?utf-8?B?d0Z3Rm92YXZ0bkkwbWIrNFluSnpZVHFKTEpaOUM0b0J2d2hlclVpcmloZWt1?=
 =?utf-8?B?bVY4MWREU2M5WEM4VEFWaFNVRUhlbWhGM0dDNEZlQ0JCZ2ZMRlFTdjFDK0tT?=
 =?utf-8?Q?zCFQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:54:03.3720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f3f961-ac46-4cd6-207b-08de1aae2837
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8554
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

