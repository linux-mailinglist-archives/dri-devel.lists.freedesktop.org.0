Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79EC75E88
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 19:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5122F10E7BF;
	Thu, 20 Nov 2025 18:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QHmPBKBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9628610E7BE;
 Thu, 20 Nov 2025 18:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZvBh99Tburvyw0y/2K46u3xTEpbMQzg8zGME8PqcFpyXRMZCtbuFG6kkchCyteGxiyk4g8JFih0A5eLZ9Z2oeyG56F57+si8UwuDkYA6JadkEgd6B5ecU3l6jwDpjxxHyw6rG14GsB3Acm3qWNHcZGfsXOb7VEclZEjPIGelFTPG0V2hqi+DFoOK3JLmhwZfF1qO6p5fvvI1qOVH+CMhdnj4T4tYGss2PUM2CH01acifc95rOVjsHI1EYUOl/8cDHHu0JFZlnChOyJIhin9xnDcM4GWcARwlO7TpK9AD5ibyJljW1xLKTcSwrSzb2Kbevt+zeCZbe5pZ4aZltgHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFiopEr3UAurwZ6rI7JySP9LjWDkSuqqVOLhigIZ7us=;
 b=s8HkKDlJP43EujBIJvhMHy+Yzo8offXAgj8lp6IndlLzDrZ7fXRGBdmFGo17B6fkVrFaacEI9J19M0qYd1wFtCN4imCpabJ5K/k2QM2S/B3cxhZAnaRjNSOP1znlGfq8418dWNlWJZf2ui4tg93h3ctpdzu80gmDF3JHyRTRNNfI4v+d07+gV11p12s8v2OZVLZXL1duKZCPlhi9lZHrVbXcUKAe6xlg1ixZrNReoTt4Gtd6hcyvInartz9Pb61nGNpFrfmWuWXSCH+DkYikj6Y/SrMubiVRQ81UcgugSGhnf+pOQ1UEDweeLhvxvkCxbT/YYu8n/I0Vj/ewfd8EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFiopEr3UAurwZ6rI7JySP9LjWDkSuqqVOLhigIZ7us=;
 b=QHmPBKBt1Z4ZcgtaNoGS54MmkzIZIHyU3SDfsGYjufqbTDKxr0wBVlh8RCfG22NnLBcZmVblJCdn07jybxoysoNvaHxkveFtwPEIbWqyh3hum6hMyBgC6XTL8SpzRIz6X8ElxlD+YqP9NUQWvu7Gsry9CzrQ+97m9xw0rDRagas=
Received: from BYAPR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:e0::45)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 18:21:57 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::f6) by BYAPR05CA0104.outlook.office365.com
 (2603:10b6:a03:e0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Thu,
 20 Nov 2025 18:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 18:21:57 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 10:21:54 -0800
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Austin Zheng
 <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/26] drm/amd/display: Permit DC_FP_START/END only in non-FP
 compilation units
Date: Thu, 20 Nov 2025 11:03:16 -0700
Message-ID: <20251120181527.317107-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120181527.317107-1-alex.hung@amd.com>
References: <20251120181527.317107-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: b39934e4-42b1-4e1f-e7f8-08de2861b0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3JGSnJXMG5Pd0JEeFpxLzRHUGhuT2FvdkVOU2xUbGZndjBZZDVhWTlZaE9Z?=
 =?utf-8?B?Y3RHU05RMGZTYmlkUGlUbWx4bDVBYWRiVk1obkh4MnIrRVFxWnYrUEZvQWRV?=
 =?utf-8?B?WUFndmoyZG03Tm9MNlBVWXhMQ3JXUnpmYkEwV253aEFPNFFMTzBjdnJXc2hX?=
 =?utf-8?B?MEVmTlhDTUorU0xKcnd1cnlkbnJQdlJ0L0xMNmRpQWZ3NVlhdlliekNNb2lK?=
 =?utf-8?B?WitmVmRyVEpoTitZK09mMURxNlNnT2NSa3RsUG03RVBONnpOWVJ2RVVVRlho?=
 =?utf-8?B?K2JWbG1PTFJWcXZpOXhJVFFKUUZHV2RwL3NYMm8zVlNoVWo4ZVZtRllPdllh?=
 =?utf-8?B?WGtUZXlEYkFYendJemZnYkpvSER5Y05VaXVDQVFkeFZkc25qUUZWKy9UV09I?=
 =?utf-8?B?c2s3Vm50QjBwcmF4KzFHMzBDenlsRy9uV2JiU0oySjhySHJ0YlBNS0dlc1NS?=
 =?utf-8?B?NUpMMUZlSEl2UkhRT3E3R3RXSnQ3NXdyQTJZZXpNVDFKMmpLMDk0N2RhUlY0?=
 =?utf-8?B?cXRaZ1JPamxBR2hVc1BmaklTMm5zSUZvblNuZFN6MHhZZ2p2Ti9QMGVUV3Nw?=
 =?utf-8?B?UnJHRE12QUtwN3BBeEdNbms1cjF6aGZOZUJXbTVRWm9NMnBQVDVORCs2eGJU?=
 =?utf-8?B?QjlkM0JjVVpOTGtCbk40QWhUK3l1REdTVWoyTmI4Z2t5R1JMOVdPOEJQcE1B?=
 =?utf-8?B?VmQyNjBFUnJxblM5Y0R3c2k1bGViUG02T0hvRmdZdDFkbHdYc0grYzJuQmho?=
 =?utf-8?B?SWREWkFSc25PSHNLd1pGNEQ3YUZuTWVVK1liWndVQ3NPaldKT3FrUHpQVG4x?=
 =?utf-8?B?RjUrVmJlQkFOLzQra3VlUmVGdzdZL1Zkd1lEWm5ZbHV1djlCbERXY08rUTY4?=
 =?utf-8?B?ZDZCM3VUUVRmZE9CSlRmSDNCTzN4NnRLbS9NOGJjZGRWd0diOGZqZEIvZ2l1?=
 =?utf-8?B?b1JNYkQ0bU0rUlU0K1YxRkszczMrTXRmZDZyZUxqTXpWU3FHU3phMG9iL2pl?=
 =?utf-8?B?R0ZZRmY4aE5LRlZQL0NsT1lJVE9TTTlGdkoySElqWityNlhKaThFREpXS2R3?=
 =?utf-8?B?WWdtMmR0L0pMRHVDTDBMQzgrMlNLK0h5SW9paGFVMldnUG9ET2M3bDAxbW1R?=
 =?utf-8?B?TVJHdUFicnNuL0NDS0VPaDMwRUlnOGdBcFV3eU9LYWptTlRwV0QzMlRjaENZ?=
 =?utf-8?B?WU1CUWJHbmh4ejdVSFdsUmVFalFpRWg2WUVneElwTVBzbVQvalVBRVoxZmx3?=
 =?utf-8?B?aWhXcGIyNVJGNHY3Y3ZWR3VrekhnMVIzSXZwTGJmVS9DVE5UcEw5algyUUtS?=
 =?utf-8?B?RW1saXF0bXZvT0ZUWkdqenZIaFBCemlBaUNZc3FYQjFscVlWU0RuOXpPQkx1?=
 =?utf-8?B?ZEJueXd0ZTMyeEtoQkZqNW9pTG5MSUxwbC9QWmJwRGtWR01vNTBsOU9rMEZT?=
 =?utf-8?B?ZFBnNVhIM1NYWEZrYVZBZWhWT0xaa0J4ZXAwcDZRWWxCeFNPQ09ZQUo4UU5m?=
 =?utf-8?B?TkY2MjVwWlVkVjZJVSs0bkpQMjh0bmpuNGtPb1ZuSnZaM2VWS0tXNXpoWXY0?=
 =?utf-8?B?S2NJa29ZaGJyM3FtajdmU1g1dlpEbVZLbGMyeEZNNktzbHFyc2VJeFQ1b3lS?=
 =?utf-8?B?UDhodmpBbHZPMzFHTi9Ka3V3Zk1maFhaVU40U0prVVc4N2lMSjZjSlY2d0FQ?=
 =?utf-8?B?QTFISmRpL1NmZ0JhenJZRVhqSURTWTUyblVSaW05UXhqK3ZpTk5hY3RwZUp1?=
 =?utf-8?B?eE9oK0dOZ1R5UzRYUUhPaXg3bE5SbFAxelExcmFXWVF1WW90MENaL1VzM2dV?=
 =?utf-8?B?aVhOQnQrOTMrQm94SWNVeFpmbTlsSWhYNmRDa21rSnZKeVc5MHZ2K0ljYzRs?=
 =?utf-8?B?RTVza3RQTWxlNFJWOS9razRVZTN1a2VaNVh2TTZoS0JEdmRQaFFkeTYvV2lj?=
 =?utf-8?B?a2h4N0xWbnlUWDVhQ051aGpyTjdlanRpRmk5bXVUN0ZCNjdqWUpzc2ZOanV2?=
 =?utf-8?B?M044NSt5MnJua3VKMmFDcSsvT1VEVkhKRlRsUFdvR3BjeVpJT3pFcGcvVXI0?=
 =?utf-8?B?UFVWejlnbVR1OUJDU2w0YTlrWTlsQmlEc1RneTBGTXU2MDQ1cnhpUzc2clc0?=
 =?utf-8?Q?Jgr8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:21:57.2435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39934e4-42b1-4e1f-e7f8-08de2861b0a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614
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

From: Ard Biesheuvel <ardb@kernel.org>

[WHAT]
Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
when building source files that are permitted to use floating point,
in the implementation of DC_FP_START/END so that those are only usable
in non-FP code. This is a requirement of the generic kernel mode FPU
API, as some architectures (i.e., arm64) cannot safely enable FP codegen
in arbitrary code.

Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h | 8 ++++++++
 drivers/gpu/drm/amd/display/dc/os_types.h      | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
index b8275b397920..4e921632bc4e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
@@ -31,4 +31,12 @@ void dc_assert_fp_enabled(void);
 void dc_fpu_begin(const char *function_name, const int line);
 void dc_fpu_end(const char *function_name, const int line);
 
+#ifndef _LINUX_FPU_COMPILATION_UNIT
+#define DC_FP_START()	dc_fpu_begin(__func__, __LINE__)
+#define DC_FP_END()	dc_fpu_end(__func__, __LINE__)
+#else
+#define DC_FP_START()	BUILD_BUG()
+#define DC_FP_END()	BUILD_BUG()
+#endif
+
 #endif /* __DC_FPU_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 782316348941..6af831710489 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -55,8 +55,6 @@
 
 #if defined(CONFIG_DRM_AMD_DC_FP)
 #include "amdgpu_dm/dc_fpu.h"
-#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
-#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
 #endif /* CONFIG_DRM_AMD_DC_FP */
 
 /*
-- 
2.43.0

