Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB0CB82E2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6D10E52C;
	Fri, 12 Dec 2025 07:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YqVjiPCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1310E52C;
 Fri, 12 Dec 2025 07:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFQDvPYvU5xyp0oaIfrBfvIRlpeZ02egMUNb0d0pbIMWyj9+XlKVQhfT7R7b3QeGglZYcu7ya9eHAZ6BuYXFTPY1zK30981S4xvwcOIQ+/32tFHtfpHjZoeBkfpD36h6L+EckDmvtpIuZGnq6AGywVFBGb3AAPgqiBd8pFWWvFy6L63RYQJ6RK5rXGDXxuP/xsRtgtRuHQQVcYoTD/G+t3Z5w6qqRpT8eC+WHnf2yDZT/nXfAGskw9IQJ05TTICrca0WiJnrbbO0gl1JokPVnY33AKLG6o/ur1oVxo4Po6Vpt0BP+ZEYJ+puu3WY69E4Cr3vaX3HLFQzuIKqcAfyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=OAh2GRM3y6jLlrJhqGmVo9mFl+QZSS2kUPd5PgCgdZWXysnCMfaVTIGoOfiz92RcVU8zgRxIozRSGvJnCOyWtlCnXiS7f6dvow57wB0biLEki+GGS5T46mt9vQvPjckIu9ntru05YXHMSr3++p6hr8ATZVXLi/Fkqhu8T0oPmb3o6rDY3YGkP8C8uMkclKBc0m1BD0qwGZO2KtT/SYZYsQtWW3vkvx061eYZr2QYLzVhFCVINtKQ818n/Op8bL66iSLKHnRy8QEoG0Sw5wgjspZbSwf3xy7gakeyGlMomWV4iJcC4y9IgM3ku8lIT52qe67Rj/YIJhZ2/80rLTTTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=YqVjiPCBWqoyU+xphRT/RzkF3jX1g4Zc31IzlrgJPWmC9j/04nM4I58RTsaaTWfD0UzAZ2ukUIw0QDra0dYlH58RozCaQ7uRil6A3BO4yk+4LwOCgOp3+gVQr35Gcbt2pctPSyOiWBgBXXH4wDGkZJvab8qclCv2Vx/SJnBgqI0=
Received: from BL1PR13CA0369.namprd13.prod.outlook.com (2603:10b6:208:2c0::14)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 07:59:38 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::62) by BL1PR13CA0369.outlook.office365.com
 (2603:10b6:208:2c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Fri,
 12 Dec 2025 07:59:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 07:59:38 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:34 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 12 Dec 2025 15:59:13 +0800
Subject: [PATCH v6 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-1-50c02fd180c9@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
In-Reply-To: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
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
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8tgEKElY3K608E6bcq8FTY2LjKGDVJMg8a7E
 pizCeqLQBaJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLYAAKCRBfF7GWSinu
 hhsrD/4r8yWuYFG6QfsLLX6xDhMRcdq7m2mzlV+W3nxg/C4T+n7HkKRjjl73DZshKrBhBK6wyY3
 +cL2Lzzqmy9T6R9S/2xy32R4Qy2xsSRGW06NxLgiy9IgnS5NXaXW/HLPlDp7EFTfTw2ESgTBLn/
 ID4frAJ4lOCJUJ2LTTAUhZaU8JoZTJHJU+iogVOQL6gyBMK/Vv0ME1X9J5DZB1Bze76FPXvRhAs
 Zjl5gi+Hq3jjiYob0wsadlK560THYXe7COS8tcVKMIccWgjjMEyAvEr4g8QtsHqHM7/R6V/7LOh
 eUE/Ge4REmbrMcfV/sOPy34OfnB9M1JUppVzDq9Gtfu8JtPpF15zuvuAdRsK+YAwhdDCrXuu0sd
 OzvV3fNN9eYqgnoD9nZWrjjYOfAqkq2g/DhcOiwD6ZudLki17aaYeGYRjMRKESkyOL5Q7qH3hpK
 1Veh3NB6slG2H5TW+p5rVarMGMSN7MrLFAQ1XgIdVrv3B/R2LPoKu39G9Q2R3x/vHYoFTV+CMpz
 1bESrpToVwpAnVAn73UKcvpz5YIkIUbiDI2RwcESdrhpin2+6EQR0AqWgAYroyJsOFATPVLwe88
 AaW6KrX2bOtGg6v2uxIssgYsUT3H0zY4EP5srp/VXHDGmoLBe20eGultk+eI7xsmZvXRzfADDmP
 2f7eNWK/M4tkoPQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdbd531-11e3-41fb-15e0-08de395465df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWgxNnVMRDVaVWNlZmg5YkltRmFkZ3JCR3dJY3JTRHhIQ2VmVVhjM0cvMVpE?=
 =?utf-8?B?bGlHRldMa0dOQnpZMmphTW1uR0RPQTVIUGNvMjBLVEJUanV5VTZ4cWJ0RlBh?=
 =?utf-8?B?NWx2MURoaXhvWEtYT05iZXluVTRQY1RXL2ZUNGRCd0UvQjkxb1FvWjdTaVNz?=
 =?utf-8?B?L01FZUh0aWF6MUZmWWpTUWt4V0JrbG10TWZWeGo0RmtwVU5nVmJvM3ZGWlVD?=
 =?utf-8?B?TjlXWnpUZ2oyK3JxYmROY2lBeTJrdWZkeDgvVzRFVzEwY2FINm54SE5Ya2Vh?=
 =?utf-8?B?azR1d2VpQ1RSVjFDSnlUb3FrK1dqTUhBRHJ2bzdvQnVyVFdlVjBiNll3OFhn?=
 =?utf-8?B?cTlqOTdYbWFaMUFhLzYybThTN24wTzRxS1F5VkpsWTNzVjFERkNFazRFSDRD?=
 =?utf-8?B?TzJoTTBQT1Foc0YvK1I2eVltVXZWNlZJbWxqRG1zdGdqeVR3dDJvOW1JbHhI?=
 =?utf-8?B?NnRnY0dZTG56L3dqYUdMTmFKWE9YUXE4cHk1bVFEbkNJb2NFZzM3RC9HeG9x?=
 =?utf-8?B?ZWQ5RnpGOTllVGtGTXBHa3Z4akVGSjFMa1ZySDB4QXRhZ04wbUZEVmxKUHNa?=
 =?utf-8?B?aERTZURKOEg0YlFmVHNjNm04YVlzTEZXbllGMnBzZFFxY0lCTEhSTURmMFlP?=
 =?utf-8?B?dW9mbWdaWEtDVXhhdDVyYzFGTE8zMnJ3WS9sK1pnalZMQVJUNWFkbk11NEhW?=
 =?utf-8?B?T3J4eWRtM2dyTnNkaGpDT3JEOXVvL0NkU2lkWUtEZDc4bXY3ZmFMTEFlOG1T?=
 =?utf-8?B?aXRXTWtZcytERFlyenBXN1pUeG9SdmE4WVNmblZmWS94ZENIbHoyT3gxeWRC?=
 =?utf-8?B?Mys5YTJ4Y1I5Ti9naTdkQ0NBVXAzRXdZQml1Q1I3MWxYL1pzWG4zWkloNUhV?=
 =?utf-8?B?T056YXhMTDNYcjZZZmZvUXBpN1FVdDdhRHlLUVV3eGtVcDZQWkdmZ1Yxa21O?=
 =?utf-8?B?TERINjhtMVVleWZsYTRESGVpK2JlSVZWWlNnUDMyTnF2a3F3Z1RLaURtRDMr?=
 =?utf-8?B?TzJMY084YjRGZ2pHQStUdzVURVRNa1MrSGdBRkFOY1RUUkw0ZkRsU05ZMXcw?=
 =?utf-8?B?cm1RVE82UkxoMWQ5bC9UaTJmeEZvRy8yR1NtRkRUcG9DN3FxN0dSUmk0cnNr?=
 =?utf-8?B?OVdzVWdKY1UyL0M0YU9meklIc091TzFmV05MWmoxam5maFYvYTBwMmV4bzdl?=
 =?utf-8?B?MXdkaFZaTGJxRXFxeWhqQ3dxQ0tkOHlhSDhBellxOHhERTBKakwvcDlxdE9O?=
 =?utf-8?B?dFBuazBpcm85TGhKVHVrR3lDNS8ybmJOVyswUm5peldUTVVVajNuLzBDdzFH?=
 =?utf-8?B?TkVQVWFTaEpCRzVKdHpoK0F4Z2w1TE1Zb0VmeFZqUHNzbFd0Y1J6Wk01dGYr?=
 =?utf-8?B?bi9UZUorQTNYZDlsdGpNOGQrenlVRmN1RHFoNFZCajhsaTdZNENCMmxaTWl5?=
 =?utf-8?B?a3cyVGRJOEd3VnpTanEwZXFBWEM5WElnYkc4cDQzZUoydTBYanlEUGtGQks0?=
 =?utf-8?B?NFdpWUxWNjBPYm1iUmhKUHpTaG11b1UreTRkSGx5RTA5OE1sWXdsQWNFaUNi?=
 =?utf-8?B?UDh3dDNPMGdWcG5rMlA4c2U1OGp3eXNUdHZEZzZ4aWl3R09sWW5ubks2eStz?=
 =?utf-8?B?bzBIRGxKMGpFL1kzOHpYckdFMVQvUGtJQkNmbitEVVRJdzdZaUVGeER5b3o1?=
 =?utf-8?B?cFdlYTAwNkFad21NbjVVTGVkbHlGZkozb2JrMVZHd3QxcHNHZ0tNNkFENWEz?=
 =?utf-8?B?UVk1Sk9rQW9KUWhNVFJRWVdkcThJbS9lbUJaWkV1aDZoemZjdmVwQ1RxRzVt?=
 =?utf-8?B?RFo4RUEybFBmUExWM3hwNlJmTkV0RVBPRzVMQWwzaDQ4V29NN1VGTFczWGxj?=
 =?utf-8?B?eG1pZUthaEY1VzM3bDdlVFhaRFlqbEV3WjhGSjZnc3ZoWDRlemFXRnZFLytC?=
 =?utf-8?B?MGdiQms2ZGJLYzZXd3ZaeGdxazg3andqY0hvM1JPUlpoTi8rdUpkbXI5M3Rx?=
 =?utf-8?B?VGpxMVZRb3FMUVJteWovdnZNQm9aZ0NWTlNSblhtbVk5VUFQNGkwekhTMnVz?=
 =?utf-8?B?dTR5RlkxUmVvMmVZMnQwYmlDV0ozbnhqNFVnZjFzZHF6aS8rcDdjZkRqOVBX?=
 =?utf-8?Q?OvUY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:38.1906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdbd531-11e3-41fb-15e0-08de395465df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766
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

