Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30CC96CFC
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091810E399;
	Mon,  1 Dec 2025 11:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XYs1fVkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACD210E398;
 Mon,  1 Dec 2025 11:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7RWsQxeHLhGnS4HZ0qv+9cGFU5YvcoDxkherJYyN1ZMD6k7Ufqg0uxDsDeIBnxnzbuU1zIC6cVdAvh2auqFCSIbdGEoOoBksRuSaEK+F5446rAMhA+XTQN/oNdLLQunk/ldXAWiG7QiMCjAzbI/om/Ma1iRrqwZHhYQLH2Jz+45O/kHXl1iT71V0uGaDJ/4nkOkKXDzHCRc7i4Qi6pLG+ixpi0JbxXccJAuSUcNaMYMbdBZXwpUULPnY6O/Rtu56JAcWDIv/Fpaz3R+WTRQnYQzjaTA6CgSc3bVr60ZXn0JhoGIGGhKNMj2yuj5rbc7Cc/1BKrO8ourY2m0vLk7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=E6QUbMVhRjLIuO016vzH8TZ8c9t0Lw6N1QO/SEXrAbaKEn2xXhaS0acNZRf7Pq+2THE/+fAyVRTiORKBavGjr/yHUBzx/1Y5EhRvIYH9/vwf4UiKwuRg7ZKtQYN0jpzeorOIPO3T4IQyfk4P1ZDPy7KvqGvSQtJisWRMpuVLQZWxHBbiXsuGesirP23J/M8YTxqxTpMDSYT4SNNpc09RROl1HndKTYPq0k76o2yLYv/n7Z272ZUteS5y7vQbkpO5xSrlLtpDvbwDo0f1uIvlZjXFOXqdffb2+iyLK2OHVSNQWywmWsK9bT5cu7Q6/toFqd8MQprTCBpM4hZDa59eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=XYs1fVkbdPceJYocuNwBQaQCesM5x0KQ40NT30fV5Nzduj4Hj2TBbtVe7AD6zJaU4yRz16BwXrZQpWExTeeGYzIIYngY7FRfKPNObqIHlF55YBtLTrqeHWt85zU5/dvz37djkZm0mjwCAmPjoHPKqHza+eegx1c24tK2WzvzPiU=
Received: from MN2PR20CA0024.namprd20.prod.outlook.com (2603:10b6:208:e8::37)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:13 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::2f) by MN2PR20CA0024.outlook.office365.com
 (2603:10b6:208:e8::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 11:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:12 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:08 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 1 Dec 2025 19:08:09 +0800
Subject: [PATCH v4 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-1-9e151363b5ab@amd.com>
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
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
 h=from:subject:message-id; bh=WNO0Wy5K5wTMtZyFMxcPyYSImLbwFKtO7i9+gf4yqe8=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpLXdOVTGFW1JI0fjoasxRDNMzevDURAuIkp0Jo
 54Q97HXYeCJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaS13TgAKCRBfF7GWSinu
 huWgD/4kG7qHmYZLjlyAQgWtGJtg/wLufGo+zXuZE1xub1B89Jv48EsJbbg83nlyrNV6yFl+Uwj
 I227I0jJPN6g897v19+Axlhyish5kJI9Mc8vt0irz9nqthomou8VQXyrF9A3NBsT0KgIsuGvVHz
 IBOp/BSWNG5HcJp1GjIVK7Zd/ImeTk2uOQ6sWt4vEIruugScXpS78cVqefDmcXfY998ZvIUDLp+
 Jwgj8Nr5xLWuz0iTpULUeBRg1B6zGjPh51/qx/csk5qp6IwfCJ8wnNJwuyydrmh//QQXQNX6SjB
 uqK1es7EdLMbHqYja/slw1mulNY4vrm+FUnlSJWbF3imc6i5YYAI4O6hv2TZLc6b5ObPHQnJDze
 936ghsyfrJYPHKncnqxmZrvUfH+G/Yz8NSHH/OUDvpI/4T1IpzaUlYSA9xqGyN83Cu6ldXbyhKp
 UHFWOgtkAKbMLOAl9ALmQpcB8Zw+xRjpM/wpT8JhcOSfGLBZH5F2ZJsCAzMzFRlsz9fqHk1YShZ
 uIw4Ln8dkW+XCSt21d979PbUMvujB+Y5DviqoqQeQvGpMG214IzC9/F6NYi+fHJ3ssaiIWPyStH
 sKPUWRQE/hOoFcAfF0BO+uL3v7boZKgQPzDUmuO0QLnGD4X2BjqJt/q+q6ag8bBad4AEf6sVgn8
 osubztp7TKtzKiA==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c732c5-e5a4-442b-8276-08de30ca0ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVFlYnN2dE01QVdidU01NS9yczhEKzZqTW9NSTQrOGoxeTBHWDRJcTNRZmVz?=
 =?utf-8?B?ZHorelozTnpLTzVmTFFObXVLNk1xcnpyakJMbWtCNG5mS1F3V2JuMGl6NC9E?=
 =?utf-8?B?azJ3OVlwQ2gyZnBzcDRDTnFjdVhNMjdxbWg1UVpzMGllSTBSZ1FpSWZwUTIz?=
 =?utf-8?B?NGxhM3FmdDc4Si90OW04U1l1ZFU1cWFlRGEzSXNvVThnMEpNei8yaFZ1cmhM?=
 =?utf-8?B?U2pMSDNpMERGTlQvcXY4aDJXZHdYUno4MC84bDRaeXNISE90eWk2MXUvSnE5?=
 =?utf-8?B?OG1VVUFuZTZDN05UY09NZ0VOQnJRV01NNkliL1E0VDYvZ1VZMGZPRVNOWENn?=
 =?utf-8?B?NTlVcjlpb280bjNZc2VqM0ZLeWxUKzZLaTdoaTMwZUlhbVZjMGROMjRIN0pR?=
 =?utf-8?B?YnJBUUdYajJlTWdadzd6TTJYb2JHemEya2Z1dUloTEJ1cGVDcXF5b0trUDFv?=
 =?utf-8?B?VncySEdzU1dqcC9NanF0ZzgzMFAxbjE0ZzM4eE1nRFQxQWk3QkdCRUJrTFk3?=
 =?utf-8?B?OEoyYkNJNCs0YlpHaWlDdzJDeFZIcGxvRnhWY2c5cmtXQmNVc1h5RlNOcGZp?=
 =?utf-8?B?ZkwzSFBha200MWN4U1lxL0JIejhReU1lVnlPQjR6dmo0ZW0zU0Z4amlWb2lt?=
 =?utf-8?B?NzVKZGkzUFRLUXZCbG5VUEt2NkhDSHYyNkV6a21ldnJ3dGFnbHVjMjZvZFNr?=
 =?utf-8?B?VmtmanN3MFlwMXMybXR6YTZvZW5lNzlkQlgrR3ltdjlwdUx2THRSMmNhQmxO?=
 =?utf-8?B?ZSsvUzRXTVN4cWUxRHoyZERXS29CYTI0S0Zvbmp5Vk16NTdFVWZia1BMblhq?=
 =?utf-8?B?NzMyM1BkdzVDaC9TU1Z3NDZzVWJrdUl0MDRwZ01uWDBQYnN2UndXMDEzc3dQ?=
 =?utf-8?B?ZVIrOXlIU21BZmxCZWszTTdHZ21LUTk4MkNnanprKytrd1MzbDYxZmsybSto?=
 =?utf-8?B?SnhLNFB1Q0dNVjQxK2tKM1p5Y3UvVVhoMnk0TUwwNE1kODhsZlRKWWY0Tm5o?=
 =?utf-8?B?TXR2UXpHSGRCeGM2eHIyZmU0Qi9XS1YrR09ZWDVvNVZxaTU0WDFHWDBNZTQ4?=
 =?utf-8?B?cnBxTnM2QlhxZ3EvaUZrWVpqR21EYTM4bVFYQUZlRGFzdHQycTVNSkloMTJU?=
 =?utf-8?B?dVJ6dUFrUHZRQ1pQaWx5QmZYZHFiblRkRE94N25TWDFQYkw3ZVc2WHJ1OXJW?=
 =?utf-8?B?emdhNFRvU0h5c0JZdTZFN01sSDQ4bVFONEpzV1o3N2x0Q2doTVowTDdjNHMv?=
 =?utf-8?B?c0RHWWRZS0VEakJzQmdHVlZVaUZ6RFE2aVdDQ1Q3aWhRckhoMi93c1p5bXpl?=
 =?utf-8?B?MWU4dzlrUGFXY0M1Y2JLelFjRnpSRjZqRXQ4U2ZjTm9nQlE1dVVncnV4WjR2?=
 =?utf-8?B?eldyWEMrOFBjdjdJeDNvSWRZNXhlOVFPVElVWnFnL0dKV3VsUkZYT0VCa01H?=
 =?utf-8?B?Y2lyU3FCZ0dSdEY5QjZ5OUhCMVkzdUFSdVNKUmhWWnNiQzNpQzVKL2p1dnU0?=
 =?utf-8?B?YlhGTXRidkM4UmRkTHhGb0wwYWVHcWdmbm5pSWlTUmV0djVTL1dOejN1QlYw?=
 =?utf-8?B?bEdpdWxZNmVIcUtsR0IxOWczUTVsQUhtZkdNMU9PTldCbmpBK1NMbXliaXBv?=
 =?utf-8?B?bVZic1Y3V2t0cGJOdUk1NTZ0R2VlM0x5OVIveUh0YUkwVkpuc1FoTFEvZzJQ?=
 =?utf-8?B?U1lWVytKd2RzcDNUV2laRWNibHNYUTRua3pKZ1dvcHptMXhDeTNVTGw2YXdV?=
 =?utf-8?B?b3lrekhNRUxLT2dmNzkvSG16NzRRYW9DWllHSkZiWEJZbndHY1dJR1FPMWpW?=
 =?utf-8?B?a2ZIamhNV3FpVlJCSmUxNlloSmhkQ1ljWjhZbnB3RG1wdk4rMVBJRlV1QzRy?=
 =?utf-8?B?VmcxSW9kbVpLelRXUEZNM1VRQkR2MHljZ3YrSVB1S0xJSGthWE45YXlHSWNW?=
 =?utf-8?B?QmpDSFRCTnVLYXVpR1JKQ3RNY0QvZkxPRlJWRHM5ZzVXRnFDYmtEYXRpclE1?=
 =?utf-8?B?OUlzVWFGNTdZM0pOMnZ6RkVXbzluNmZMaGNWOGdDTmhLOHZua3RkSHF4NlBC?=
 =?utf-8?B?aWZPWVdMMmF2eElGUHdkM1o2TlJ3M0x1ZEIxTFhEUlNHMmZYWjRLVVltdVJu?=
 =?utf-8?Q?JxGo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:12.4008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c732c5-e5a4-442b-8276-08de30ca0ee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
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
index d31460a9e958..610449d73a6c 100644
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
@@ -587,7 +589,9 @@ static void amdgpu_atcs_parse_functions(struct amdgpu_atcs_functions *f, u32 mas
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

