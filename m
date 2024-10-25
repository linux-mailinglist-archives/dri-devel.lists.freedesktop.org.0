Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91B9B0BE8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838E510EB23;
	Fri, 25 Oct 2024 17:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3RroGwoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C01D10EB23;
 Fri, 25 Oct 2024 17:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p715fKSpjc/ec8DvQHD+O12eZfyrnef9YllVoH3cZy3Yop/nbL0OmyXBRgBDcsiRgL+um0Qy6kXNlUnxdlQpyEa3OBLgLcamypLrcVkf1LmXHKbjunuRu/WQE/zeFunlvO9q4EUbW+7GAIwYxRMQzo9UMir0Yk2objmfRdSP7gQRGO3dkX+LuCy5SR/x3afHVcLYmhB+J17U/drSD/7HvESnhQMGp2w14r/+br2X1yeYKUdBjm/w+WrdNqpdpcWHiBFOmY8nfnFVn13lkOsp+U57ZQCiu2B/yd+E6oKsfmNGdjGwKmPIHWND7y4tfeecNDgSmc5R3g/2SdNWQY2Vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeiJOZFwwP4FJILpSKu9b1qILvtjAOavn2Gdc6tL9B8=;
 b=HWG4fcsVAQ8NFP5/VxwPdhcLXpp7r/q9Ez/IRG/UMYJrgbLKBrhvgH81DklmQlM5XsHDI9Zo9Gdy+cLzqwKQeeLsDF826jiliwYBRzQaak4lEfiI9FlYjnOMVq0IGbreE/nOuJBJoJPxA+nnxTkidjg31iVqe2zrEfAuxt5TxApAAvrhvRJ7eEyHcLHvb+UbqVs7OE/jXSiVvXyeU+Lk9atEVBNSJtpY3qUwPjRFSB+EUjyWL/twOlFgvM7Do7mfhZYtWUu88dG97C9OxrnFXCSNHulCIzhFwPP9YsB0K1/biq7bcOh6/Y01jJhva6INe2RumtyMMRjGzDvfGbblkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeiJOZFwwP4FJILpSKu9b1qILvtjAOavn2Gdc6tL9B8=;
 b=3RroGwooDG1RhR9LZlZnqhYi/Zw2yzo0AUO/8rSIRj/NGm28TbIRY+p+Ttl4MEEyJTg9vKW8pXoF9iY+gsrhf/MGV9rl3wHef1RSWwMXIXuBMpI5W2sxow7yjBw703KgC5faZRFXBOW6H3vQyNnzOQv9M9S46BVMaQDWeO4UVC8=
Received: from SA9PR13CA0072.namprd13.prod.outlook.com (2603:10b6:806:23::17)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 17:41:46 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::ae) by SA9PR13CA0072.outlook.office365.com
 (2603:10b6:806:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.7 via Frontend
 Transport; Fri, 25 Oct 2024 17:41:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 17:41:46 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 12:41:44 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 2/5] drm/amdgpu: make drm-memory-* report resident memory
Date: Fri, 25 Oct 2024 13:41:10 -0400
Message-ID: <20241025174113.554-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025174113.554-1-Yunxiang.Li@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: 35edf74d-d83d-45a3-6b7a-08dcf51c4be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE9kNVlLVi9xQS9zUzV6eUEzMHcyMmppSTluK2VuOGdWYk02TWsyMGVrL3F4?=
 =?utf-8?B?SFRuTVZOWDkrMXJ4Ry9qRGVGNUZXWUU4UUs1elJIRGpDOUhXQStJTktUb1JE?=
 =?utf-8?B?N0lDVzJNU2tHWCtNK3JQRkMxTWZBa2Z6VnQxL01KUjNsdThpSHlzVEhCT255?=
 =?utf-8?B?NEJqRTV6czlvWFBMV2ZqL3NlVGpZN1M0R3E2U0Nwc292dTZrNkRITms3VUdG?=
 =?utf-8?B?QklvK211RC9pVUNjZUtyME5pSEdnZVZCVHpqM0p0aWg3WGhYb2d2UnNMQVlD?=
 =?utf-8?B?RlNTNkVWYXJEMlpkaFcwdDE1MDZ2Z2FIRmg5dTlFeHJBcGlTUGJsRlR3VnRs?=
 =?utf-8?B?dUZTSkZEMDZFaTNyaTMrVEtkSDhUaS9MeGlXOTlhMTBFOXNYNzk2Q3p6SG4x?=
 =?utf-8?B?dFdHUEZ0SVBrSWZHVnBIOVlienE4bTlwQTZNaDlMMTdyUENxT0NxSUtaT1U5?=
 =?utf-8?B?bU9kWnMyVm1yRlJIYjBPYVZaVTBiSk5uNHg4ajhPSTlBeVBYV0FBcWRRa0Zk?=
 =?utf-8?B?MU52T1FONE9iQ1pLZlVZWm5DTEJSdGR4a05DMG5LY2E2MmR6SEgweS9KbjAz?=
 =?utf-8?B?UmxlYnA0ZmgyOUJZa3Bhc2JUKzNiRTJzUEVRM0UyckJyU3JPUU1DS3hJaGdP?=
 =?utf-8?B?aHl0bWxyUDk4ZFVpcytYRTMyVW9aVU9Jb1FEZFRhQ3JNc0VTQTkzczFuT2NO?=
 =?utf-8?B?NnRycjBvUURQWDJIcXpqem5VZ1lFQVpieGpKalBIbTJ0YUZkTTBEVEVMQVZD?=
 =?utf-8?B?VmFyR3FoYk01Z1ZMRXMxajlxeFZPbExDWHhGdE5LY0tHS1l3SS9Ja2M4RndF?=
 =?utf-8?B?S1FjaU0rcmRab1BXV1g4b01QSmlycXVJN1E1Y01PWDI4aWdsSGMzVmdnSEox?=
 =?utf-8?B?aVB6Mk05NmN6WjBnV3NlLzB2QStvcVZtL1JkNCsxczZNNGFnVFJZalMvTHpY?=
 =?utf-8?B?dDBZWnFOcFEyWElBQ1NVS3lsUlNxRGNLdVVVcWpBQ01Pek1pWndVdURHbkpE?=
 =?utf-8?B?elkyeCttdGlmK2Z0MkRtM0ROMldrUGZlOVNTd1g4M2cycm9Fc3BVb3VxM3Mr?=
 =?utf-8?B?cXluQ29JcXJ0M2taMlRFdHdKUXNCMzh0cjNZSVQ4VFBiUTJ0Mzl1NUk4YnVF?=
 =?utf-8?B?MHRUN0JMZjcrcUFocG5WMnd2TUt1WXEyNnMxc090Y1pJWE1rRXpsZ1E0NTJS?=
 =?utf-8?B?SlMrY2RNTGIrSlE3VmpYa3JhbW5uZEFtb0lCOU8vejFDZjVqQTFPT1prc2hV?=
 =?utf-8?B?cEM4bkFPV0Era3lOU1FJRG5rU0lmRUpCR3lCNnZHbjRXMjBDSEdEMDBYajFa?=
 =?utf-8?B?WGFvR1UwdFZxdjVnVUg3ZkVsbDJUQ2piQXBlL3NkT2hUVm5tL1EzTU5ZL3Fw?=
 =?utf-8?B?b3dxcHV2TjRPQ2N0KzdYaXY2d1N1UGVhTjZFWTZXSUVKK1BBSzBINTBLenFy?=
 =?utf-8?B?Z1dQczQwQmxWbE5oQy9NeWgxUEpBSzNJN1VmT04zSWFoajFYdTJyWDYyV1Rv?=
 =?utf-8?B?TVNCVHVWQnFvV3lRRmh6L3hpSlRWZ3FtT0l5ZURiQUdjREdUck5YaC9PcjJx?=
 =?utf-8?B?UmJJL2RJYysrdWRtaG1jakMwU2Q1SzI4Tm5VdWV3N0M3elJ0YmNCVEZGbHU1?=
 =?utf-8?B?M0VCd2tiNG41dUlmdkhJTGd4SVFxQ205ZEtjbHlJQTVoUG5LMDJKZXU2ZlVi?=
 =?utf-8?B?a1hjNEIxOXNKdUJHT2FWT1lmODNrZnR6dmxGZDY5N2szeEVmMUx4bEVPOXl2?=
 =?utf-8?B?UWgxOG5Xb2NlYUtvbTBQSUFtYXR4cmVYUzNaS21iWE5hN2RTdVJaS0pZR2xG?=
 =?utf-8?B?ZXM2ZWxqdndWNWxzbThHUUNVS0wyTmRTQUFXNGZVaUVsaURVNnJKUzNSbTIr?=
 =?utf-8?B?YmhTSmdGajZzVm9vRGtpMGJwREtWRVIwazJjUWV1NnNsdXc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:46.0333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35edf74d-d83d-45a3-6b7a-08dcf51c4be7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104
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

The old behavior reports the resident memory usage for this key and the
documentation say so as well. However this was accidentally changed to
include buffers that was evicted.

Fixes: a2529f67e2ed ("drm/amdgpu: Use drm_print_memory_stats helper from fdinfo")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 7 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 1 -
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 00a4ab082459f..8281dd45faaa0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -33,6 +33,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
@@ -95,11 +96,11 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	/* Legacy amdgpu keys, alias to drm-resident-memory-: */
 	drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].total/1024UL);
+		   stats[TTM_PL_VRAM].drm.resident/1024UL);
 	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
-		   stats[TTM_PL_TT].total/1024UL);
+		   stats[TTM_PL_TT].drm.resident/1024UL);
 	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
-		   stats[TTM_PL_SYSTEM].total/1024UL);
+		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
 
 	/* Amdgpu specific memory accounting keys: */
 	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 045222b6bd049..2a53e72f3964f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1223,7 +1223,6 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 
 	/* DRM stats common fields: */
 
-	stats[type].total += size;
 	if (drm_gem_object_is_shared_for_memory_stats(obj))
 		stats[type].drm.shared += size;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 7260349917ef0..a5653f474f85c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -142,7 +142,6 @@ struct amdgpu_bo_vm {
 struct amdgpu_mem_stats {
 	struct drm_memory_stats drm;
 
-	uint64_t total;
 	uint64_t visible;
 	uint64_t evicted;
 	uint64_t evicted_visible;
-- 
2.34.1

