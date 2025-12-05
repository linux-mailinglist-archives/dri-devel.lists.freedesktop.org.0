Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A5CA642E
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 07:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C5E10E00B;
	Fri,  5 Dec 2025 06:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h7N68dE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013034.outbound.protection.outlook.com
 [40.93.196.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFDD10E00B;
 Fri,  5 Dec 2025 06:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+59hXR6DbQhNcRrzZ+Vg3DAQNaMIw1MTZnoGV12tSvZoSXu6T/QFjW96kbnM4pQQn2bt5FmLhVw4enlTcDBKWIY8i0kEZVNF0Fv1b9RDgFKcauzE+qngIoPCmhN+ZRDlv0h8IJOZ9y86sqifQH0RgGXNxnc7Bov+W3LXmS86sXsPchTdikvgJiz6ovdMAsIYAa0G7RG8tcUm3/fyyzB466yujnYdDdYBiz8v/3/7gkmMni+8YdfLNaOjOHNynK/XFtBCJUSE2Ug07MPsnTEtql/6hLbHYAru6LcStapG/h4X1GAo6fpOU4AIG6Sr6HR/ElMxQSq4jpPVZvlGSfG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=xs2o23J3qv+KvbZb0w7sbrkX/+6pgsdY/+sHnkt9wv055bqAboSVwBVqXkSzJvqjTDh6qRrAFId600A9SrGqVt3cT/gbwRiJ1vD0KgztKytfw1ANuCfH6wExrokdE9L0Td4dfLItYNUGF9MkSb054MFXRp+4Rle3xtH5LVHaoB4JMH46iyFD5du2oll77xKMY+P5ELewSTY6eJBkNqhu4O2j1SFiR+nDHvJjJTcLsbCBC9QoLKZXsLRH9zDEMCcV2VEhx4MBxIX4z0jXuuQjapoIdBocMtitX+LO2YTbMKRTdIF28OtJ6pEAeLcdQEsR0qeJ4ZiOaQwiro0WvQ3ZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=h7N68dE2xJ/FjTlK4HhxdP4IAU5+1Zew2Yr5LcYEhxHoo7WpcjhOtlpW2yajHSdMVOA9e3OYIfB6jKACEYb47Ow26tiLJll4Sc0Gqu9UvQqKtuUguwP1ZjZ+ePGS6IVanw7M540m1dp7XnIvm/uabm4zg+6Y+jqLVjRDAYaQpy8=
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 06:52:08 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::2f) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 06:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:52:08 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 00:52:03 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 5 Dec 2025 14:50:54 +0800
Subject: [PATCH v5 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-vram-carveout-tuning-for-upstream-v5-1-1e87cf3b57be@amd.com>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
In-Reply-To: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
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
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpMoEC6IiA1v5BJuVnpkxvv0mk2AtgM1jenDB2g
 TrVd0JMn26JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTKBAgAKCRBfF7GWSinu
 hgT7D/0YwGDyJXol+QfnJ0gJvANqxls5hDC9nTrdQY6E6NLmBwUM+tD508iAuwFjXvhhVMPihGS
 o5W1HPK+wGquy11CH7kJ2g4RlYUKa5edTCNsNwVUO2tATirG0PLClt5J1n5odv6B88GKSY80fXq
 uLrcqdlh2eHmstZU4Alh4yu6oBZmiBzf+ehodIfZLPjSVOZpIWn4ZUoRUCW7LjBHVRfEz+PFEez
 7PbIYwh7/meDx9YvI/b1sH89CPac5fpuOzUv1atLFiCsuUi+mSYH6IQLQXNp1k8CuaSODckfzoJ
 ey1rUtgAvGq2OsuiDHP194RNqCc1cCx0UkSNQgChcqdHTNgEsL8ymaWh70prd/7zHKekm7KqiNv
 ND3RNFr742PnlFuqgE+PO1Li+BULzVblsRpxqXDfMAyMbB316fENKZs/sysi/I39a3cn8M6vF8e
 Vg0IJEPix0Hq2RC4SDeoq/ekVucDxho0ngcTL3hJksEiTS7vkxVS1ggUW344WMKjHYZAWrGyjKt
 FC5qY1SUvmbKlg60QlTfh2XbR1JucyT2Ca3JwEYPGNUPllOt2dfXUNFB5WcfeGizEuJVnPVkaNh
 kSqJaiZ0zo0CDYatcaerbJsOBIygHocSkYQOL8gkOAH/Dsjyr4dAL6APbE3EQSwAGhUCfPf37bW
 gYFQrfOWxSLEwrQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: cc685576-573f-48dc-1917-08de33caceef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm1FS3RtZXh6R3pYZlNwcU1iVyt1VGlFYXBtZUpHQUU3M1piU3lSbTJXT3dI?=
 =?utf-8?B?Mzh5MEQyK0F0NWdqQndtN3UxS0diWDFTalp4cE00QTZibi9SMXROVlgweTc3?=
 =?utf-8?B?eS9ES3ZLb3JMU1NSbXQxS3czVU9EV0lNVnJnWGprbmZXSEZYSTJwUFFWbHZE?=
 =?utf-8?B?ZUoyVDM0WDNaWHpaK2FBSThMMldrQ3c1VGY3M2FRZXZCTEpQL0FBY2lBajlY?=
 =?utf-8?B?aW1vZTNSQjhEYWJvTzNSaXQ2RXJobjd4djYxUzkrNEVBbFBPUlM2dmhsWEdE?=
 =?utf-8?B?UlBFR2U5VThhMkgvMVdFbmlGRzF5cG5IVHQybXJzOENhZFBwUUJxRzZjZy9r?=
 =?utf-8?B?ajFMYlNaZjFhV1JqaW44aGRQa0hEUVVNMmt0ODBrZlluYTZYaVR0VTlzUGJN?=
 =?utf-8?B?VjMrSzFkU1ZzSW50bFIwMGlpL05WWXFaY3V6Y1ZmRUhHM3BZZjZtTzNjZ0RR?=
 =?utf-8?B?YkR4SmFaK0lvb2FRZEVGQUZyMGM0aDBoWUpmYWZ4dzJ4YkhRQlhQckRzRXFS?=
 =?utf-8?B?NktBU2RibWU1SWl0bXdQVXhoUVEyNEd3L014Z1V1UUd2bDllS2pja2pyQzFj?=
 =?utf-8?B?c0VzdWw3L2JUelZEMDJHdFhPM0w0dG5OWkhZUm5DQUZXdU5qRjlQOHBDUlpF?=
 =?utf-8?B?dzVtenMvNXY2TkpWV1JlYjFJVFN1TDB5a1FRLy9uOFBGbjBxbFpMMTQyS0pC?=
 =?utf-8?B?cFVyVHR1RDFUUDg1QnVjd1N3dmRNQ2xMQ3cyS3FwQlJPcndDTWRKNURJbXpY?=
 =?utf-8?B?TjQxaWljekRmZEdyT241elAvZ2ovV2N6cEVUN3c1ak1rdHlQODZLTy9vdEJH?=
 =?utf-8?B?RmgxTWRFTHVHSTBSNjFQcUk2K0R6UTNoOHhSdjFuSHllV2VtTlV5TXZweHJJ?=
 =?utf-8?B?c2I2RUNVWHY4eDBET1lSb3AwbVluK0RuVHRrRm02RWhwYXgxbGUyY3NRQ012?=
 =?utf-8?B?NkM4RUludWZEOVE1MUtVaVd2STQxUTR2RnBmUjlhVEp2aU9aUlNyUEQ3eWcz?=
 =?utf-8?B?SjFMeGV0N091WWFHK28xcjJUQ1ZLUXhOTVFVTk9hd2Z0d1B5Ti84RTFxbnpv?=
 =?utf-8?B?ZnV1aUd1cllJZDUzU1ltdHp5bTNDcHczODVYazdCcDhXclpXNyt0cjVlR05E?=
 =?utf-8?B?YXhBcmFjdVdLUVV4QThoY1lLa1loSmNpR1NJd1NVa3JKM2xoWFFWcmxjT0Ev?=
 =?utf-8?B?UWZxWm01MlIzYkt2UFB2RlVCbzlxR0p3a3BkRWs4OGxpV1JuYmdhYmdSWnE0?=
 =?utf-8?B?NG9OV3lLWjhpK0lkTUtiekVCU2lsUkVDQWtKNVhQSlFSRDVxeVZlNWdGQTd4?=
 =?utf-8?B?L01CU1o1M01MRk1wdmFsdW9xRkVaYmNxU3kwOExmQm9xTExFbEFLWlEwOTU5?=
 =?utf-8?B?aFhKV2hub1Q2UEg2T1ZpZHM5ZU16Q0NqdHlsWXlGa3FISm05a3lLS3V3T1lh?=
 =?utf-8?B?Ujh0NjVPT0tDVWNaZllpb09KNTIyeUxmMHF1VEVUZE5ObmJNYU9jZndlK0Z0?=
 =?utf-8?B?cTViVE9wVVpKZmYwMEJVQzhOSFlwY1ZFdUthbVpiNmFTWkxpUnBmK1hmUmo1?=
 =?utf-8?B?Q29aTk5qM0t0azdxT0o2c3JCQ01ZaSthaVJMd1BEcjBDa2tBbzBGaTArTSsr?=
 =?utf-8?B?dWYreEc3VzJkcUFRcWRvVUQ5a3gzb0JoemlzZ2FtWTBEZDRtR3ZLcStWc010?=
 =?utf-8?B?bVZxZkhRdHZjUmIyZkJ2NzYxdXBDcUZqY2g0ZXhNT2Uzc0hLNEY1T3NDc2cv?=
 =?utf-8?B?V1NkenllUncxVG82eUJiaVAxaUtSY1MwbXNvTzA3c0xITmI0NnpUenJiOGx5?=
 =?utf-8?B?cG9lODYrMUJCWXVobU9vdkc4WkhoQjlLaVcyVWRGZXhMcDlKSDBCVXRKSG5x?=
 =?utf-8?B?d2FTb1o5N0RuOG1xNFo3WW9FZHBOV090dkFCR1UyL1N0TC9taTRaV1g0bUNF?=
 =?utf-8?B?cjhVZDFYeUhWdWNoRVhpYUxFOTFxZVVYM2hzQndNamk2NGNjTEc0OG84QmZR?=
 =?utf-8?B?dmMvWWRaeXBvdG04Z05qbC9WQ0Z3UzZwL2ZwbnZxbmFCUjhteS9BbUFiQ1hr?=
 =?utf-8?B?RzdaL3pmMW1vZkJ2KzBGQWtob3hVcWNEUWRnQ3B1RGRSSU1DMkd3RWs3Qm92?=
 =?utf-8?Q?gAek=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:52:08.0562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc685576-573f-48dc-1917-08de33caceef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15
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

