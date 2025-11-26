Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26CC88D79
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65810E571;
	Wed, 26 Nov 2025 09:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yn96vGjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011012.outbound.protection.outlook.com
 [40.93.194.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7C110E569;
 Wed, 26 Nov 2025 09:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTXSxmVTGeQ4PvqGoFqsY9dbsbsC5omv6Km1PCndRbOkDek1mD5au3Rbgu+3bq3Dbw3rBt2HlDnaqvpT3Xubcno3Ki1f1eUSt4ZW3X7MxOXIzYz+//RsdgzeInaBwYM6WLGfVd4MUpBmDG6vvPFTq+t7yNj+G0YlInjFv7BiAv1S9aTsqj8pWd7naH/NxmtBp8aXtpymzxLz65NHJauvYbCfkSDMOHJIrWUCha8xz8JXIH7oCu8liZ2x+124eBx3KSlCcl3yRBfOMwS6FTsY7z8j2797zb95L+nXeKdPT6ERzgxXK3NysOjPgNfZSgaWfiYCjLz7iNg9AuSeVxowaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFF7eOm1OvS68eDYaLD1xTdopz0EA1/HlQbiAz6rSD8=;
 b=u4x44ws1hON3l163FTvIqQ0rEvx2UMx2TEhICENscbl4ug/rQYhSsWGbD88558oemwT0yyXPMNJG6ewwYNTgDZboZABinrJmc1pphQjv1jujCPAHOVu3Cmydj99yv/x+q+6OyvfRW9pfzw43heLcFs6T8z8YKEHeyyNG045iXLfhfRjkzfVgGYg9tIGjW9ivjTyN+eAxbWsNlIxzVbIn/DzGjtKHyQPML7/D+X0uSdyHokp9wIgERyS9mEW8amovgsGomLuYZZ8SvK4AFI+csfTOYE9MOJAP2Wxzp4vyH5LRRc/TaqYltHcporgDANysMP8dXsB5VfOAVHItTQEdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFF7eOm1OvS68eDYaLD1xTdopz0EA1/HlQbiAz6rSD8=;
 b=Yn96vGjcI9BErtJsAe8KviRQRpFDbqSYVhRdxeub3jYMebwRJ13IUGnn5FbZSpVwhIGj8ZwPy9+gh4GBwbkZs0eBgX2tv21gCVrGsi69H4R8Mx9S4EhwwzSBswOE5VNieo5gKjDe+6RchfZcmFxNddFbzNv0h9Cp/xbHp0xJ5Rw=
Received: from CH0P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::23)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 09:05:48 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::f3) by CH0P221CA0007.outlook.office365.com
 (2603:10b6:610:11c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 09:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:48 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:44 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Wed, 26 Nov 2025 17:05:16 +0800
Subject: [PATCH v3 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-5-cf1729c4cb3c@amd.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=4yVmtML6xBh6fXs6d+3/KBhZdGL63PCIBdv8F2bkbEA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLWi+S62r3rAAVOWGyRKZkUgODX/PbBaSyTs
 5vw4g4M7aWJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1gAKCRBfF7GWSinu
 howhEACEqMgcVfvwB5YPN6yXQxF+7LJ4NMtGAbhEZbkBBPUNeMQaOOsi8k7iWf0RgqaeyOeMxPQ
 GgvJqGKzy3EYtd1EcuRhonWbBv0uUbHmfVHXkfPjkkUrniSE4i4Opkd4J6YeP1FWFZ0jbSKcZOk
 ijZie/YSRd3zZ7XgDx8/HvrAc68JBQD19awD1rxowOyeQlACbsVuvVJFXZUG+LlkRv2Oh4aasPn
 QoNcuLU0ukPcI78a4RI11jgKxwGFq2lpbcPN/NNFbaaplQ1rx2JENV6t7wjHqrUH6fMiPF+w2Cz
 Lo8XuWGMevmFtMmGYXh7dFUpOeItrNmQD8vXeqtvxwbLQK08RXws8Fu7eMd2+my8qV39Sn0X5Pj
 D9a18kUUFrsS1345oLCXrBBaQ5qndegZdEPbqOz1Nlsi016G9Rc1zQKhy5bazDoX8GNQWkNyzbf
 DqjCPSyIGaF3Go9RpArm9xob3FEX8QCF8ozga+hW/6F/rungiCTQUUQGTif+Ji5uI9B6gvZxzSG
 Uj6bXBL83LP7ZgWaA0ESQNACUQmHjjIe2yrZJ3n9qjU1M+AgOEdCyf6mudh6KhrSKWj3+fwlzbG
 HebGrBtREXQHgszr7aede8Oro2AfFbbUre05NB4OckRa4UuadT3+5xYGvZIcbnC2VIHRw8JpoP2
 hxDP0w1XUbfkzfw==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: d15a7dc1-233a-46b0-d8e7-08de2ccafdd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlkZTBsQTRxdVdtUHVSbUJyUlBGc2Rnb015ZkFVTkVOekc5NHNWTkpZdlRL?=
 =?utf-8?B?dHE4QWt1L29ZT0c0Mm9nVitMS0creHVGUmhvRE5lNzdweGZCZkd3dVRhOEls?=
 =?utf-8?B?RzVoMno0eTJQdGkrd3c5aDRIeFk0SFhLajU4ZjBnaWxiQlJTVDcwMDEzVkN2?=
 =?utf-8?B?TzIyVnROSk1nRkYwQnd1MUZzdVlYV3VjRk5TREFFS0xPQ0JKODJza3JhdmFS?=
 =?utf-8?B?TkRUbzZpM3ZwODI5U2Q5K1Z2dFZpaXFTSy96VDc1clNyMTUzUlJYb01ocTJz?=
 =?utf-8?B?M2hvQzhtQTZXcDZYWVdlWk94MHlHRVVLNXhoQWRGZnFURHpGcUxyVWJxNUZC?=
 =?utf-8?B?WW1GYVkwdlhNOWhGNnhjN2k4UzczWnJPQ1FMWCtmRkNwQlFOOUZqT1paTGVU?=
 =?utf-8?B?bUU3SVdlWU45aEM1NzZKcFRXT205Ly9jTm9MYU5UREUyTVhHUmt0S2swYW5F?=
 =?utf-8?B?M3llcDF2QmVZbkZtc0V1Wkp5T1BZNXR5V2hSOWQvNERpWE4wbXJhc3RYcFp6?=
 =?utf-8?B?bXdiaFcrdU84REs4ZytYTmZPTmZ2ZUdqN0JaL1VqaHluOTRSZldNMFRlRkJo?=
 =?utf-8?B?anlVRU5OQjNnUmxJcWlqaVZMZGxESGlwZjM1Wk9Kemp1ci9VOVpjMFBxYmpk?=
 =?utf-8?B?c3BtdDZ3ZTMrdnl2dXZUL1JlaUdkKy9UREI3VEYxd3crUCttQUVYSkNwK1ZI?=
 =?utf-8?B?VXNKOWZhZ1c2Q01Bd0xoVXY0bnF3WkhKSG9BZERZT2U4WGhMT3UzZXZWdURi?=
 =?utf-8?B?c1IxWjBpRTl5NVlyRjdrdjM5QlAyc0F3M1lyeHhydU9pMmdvS24zYkl1bVJj?=
 =?utf-8?B?RWg2VnVvMWJ5ekt3MlE3cDhvQUhFd1dkalh6UzF2eUMzSExWTnIwa2hyY0ta?=
 =?utf-8?B?Ly9xNHJSUDJVWWNYdXg4SnFySlltdVFtaFlSSjRvZzFIbVVCdDN0ZEoxTCt3?=
 =?utf-8?B?ZjJUSVUrd1E3czVneUc5aW1STENuVVlENHEyWE9MYVBDNkg2cUhLM2wzSVhT?=
 =?utf-8?B?dUdCdWdreGNYOTF4MUovNUp6L2h5MmxJUGdXbXJSdW1zY3lSYWNobUlZbzgv?=
 =?utf-8?B?Vkt1SkcrV2h6cGVuQkQwUWY4MTRQOW5mSXE2USs4a2NiakZZUE1pcEo0S2s4?=
 =?utf-8?B?aHlCSG1DKy84NElqdUNXQTJiRE5PV0NPQmRpa0pFRTFwMjNoRFZlZHZLdEJn?=
 =?utf-8?B?MEZzTjdoank2OE9FU2JtRkh5WGQvRlNHUDlCYkszRlpoc1htZ2FNUFJkTWNz?=
 =?utf-8?B?NjhOSlpLOHlIR3lmSWw0OHdwWlVVbVB5YlgybzlWVjRMQ0tZbW9XN3dZalBC?=
 =?utf-8?B?dkNZK2J4UEh5R25kNmJHMVhlemtoZkNoSkFpeHB3TUMxRmVHczExclhXZ3o5?=
 =?utf-8?B?Q3ZPZWdZa085cjV5VW9zVlFMTmcvUmRqM1BLOXB4aUQrQ2dQd1d1YXphRUxw?=
 =?utf-8?B?ZDBxWGo0UDJueW8xZnpWV0JicFREU3MvbEJxM2FvWmk1RGk3RGM0NHovUXov?=
 =?utf-8?B?MkZWTW95SzN2UyszREc3UUVpay8rTHREUmZSVGxrK0NzakRNUmtqV1puU010?=
 =?utf-8?B?TU5CY3ZtVnMzdTh3NG5xaWZyd3pRYm5EblhBRzNBbkdSblJUN3h3SEc0aUNv?=
 =?utf-8?B?ZWdoV2Z3Wlg2cDhRMkNpbkpkV2NCQUVHd084bWNBMlAxVGhudmdFTlUzOVQz?=
 =?utf-8?B?aXN3bGdjNW5XL0puNHBQTzIwelZBQ205cUREYTlWQjZuYW91eHpLVUF5bU13?=
 =?utf-8?B?NVpGeGJmQWJpbTRzWlNXZ1pISmFJbVhpNFh0SlE2aFYvUW1IMVFXRHB1ejN0?=
 =?utf-8?B?aUl4Yk9sZVRxZit4a3NDWmF1dzd3VUFJT0xZalE2cHg0YTBpTVZPNERmY1Yr?=
 =?utf-8?B?ZUJvaklUMldxcFk2Vm5ydXN3N21uQklZRUN4K0hORFlVWm1OMllma2VDdVFN?=
 =?utf-8?B?NkZpYjVYbUFNbklUUXZ2Q08xeUF2NW9IMXl6SnA3a3RLdWxveWJpK05XREV3?=
 =?utf-8?B?dHVKeWo5K0k5TEc0d05XT01kdjZ4T2UzQVVvaFVOQWpNem1RK2VXVnNRSWFp?=
 =?utf-8?B?c21LV0dQNmVQd3NwL2MvV0RwUmtOOVVFd0JTSlZ5a3FjRWx4L1JsbVBES3gz?=
 =?utf-8?Q?0/Dc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:48.5987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d15a7dc1-233a-46b0-d8e7-08de2ccafdd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
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

Add documentation for the uma/carveout_options and uma/carveout
attributes in sysfs

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..cd6f044bea85 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -128,3 +128,29 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+UMA Carveout
+============
+
+Some versions of Atom ROM expose available options for the VRAM carveout sizes,
+and allow changes to the carveout size via the ATCS function code 0xA on supported
+BIOS implementations.
+
+For those platforms, users can use the following files under uma/ to set the
+carveout size, in a way similar to what Windows users can do in the "Tuning"
+tab in AMD Adrenalin.
+
+Note that for BIOS implementations that don't support this, these files will not
+be created at all.
+
+uma/carveout_options
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma/carveout_options
+
+uma/carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma/carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index c3b7b8c91919..d0930aaec18f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1247,6 +1247,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	return -ENOENT;
 }
 
+/**
+ * DOC: uma/carveout_options
+ *
+ * This is a read-only file that lists all available UMA allocation
+ * options and their corresponding indices. Example output::
+ *
+ *     $ cat uma/carveout_options
+ *     0: Minimum (512 MB)
+ *     1:  (1 GB)
+ *     2:  (2 GB)
+ *     3:  (4 GB)
+ *     4:  (6 GB)
+ *     5:  (8 GB)
+ *     6:  (12 GB)
+ *     7: Medium (16 GB)
+ *     8:  (24 GB)
+ *     9: High (32 GB)
+ */
 static ssize_t carveout_options_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
@@ -1277,6 +1295,17 @@ static ssize_t carveout_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(carveout_options);
 
+/**
+ * DOC: uma/carveout
+ *
+ * This file is both readable and writable. When read, it shows the
+ * index of the current setting. Writing a valid index to this file
+ * allows users to change the UMA carveout size to the selected option
+ * on the next boot.
+ *
+ * The available options and their corresponding indices can be read
+ * from the uma/carveout_options file.
+ */
 static ssize_t carveout_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)

-- 
2.43.0

