Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F929B0BE9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A7A10EB54;
	Fri, 25 Oct 2024 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O7AaimC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022810EB23;
 Fri, 25 Oct 2024 17:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDfIeO+34A9an+jN5VvbyShlfFg1nzOS37WSmcgqragXzNuXHnkKj9BdmtHpmUrjmNCCOSWi4B24taBJ+ADJ3BjSmoQS2bNgNzm+2LVOqlomYhh7CBdCq0am0EBTBxSFl2iOmftS26ACphRAhKpXXNYdvCJb7zBmpl+F7NutsoQ+HefuCgnuog0N1zmLfM55Gp2Z4Hma1MXx3GaejPb+AyVmSqZLnEPOn0CQHXm9kSApmAqjl+VfUUht+DIBDT88CmnhnsCkayxMNHNmYENL5EE1W/b7j9FJqNtwUg20BlyPkeXFfNQKDXK+8mEhF0QDiSKdVWZDNbfw5J2gBmFfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gKl9nP6ACrxTQ4vYZkwmjQG1BpaKQ7tKT6RQDOa/PQ=;
 b=QZVdG/L+kXjF3Q7IG82CO7DjE54JrE3LXmHcNBC7KCRCVRH4nqRpTP6/NS9Wm/1+FbcJJqVuDygfh7JSjmSHGNrk+aim8CUE/IHOACYTJ4D+0hRlgghxCH7/BIN5yVXKBqYikmuoyiiZxNYSXIFD9IyM1ZkAXJdE2BRzZ/KQPYhaV4JxRbxJP9wZ0+epvI8Mxx1lWuQ7vDgOHEcGoT1fTvJKdN4tTw+YntVy24jfOU4mNwSVhupODayFXrpuix7ULooMTqh+FTb/+PtkNJYhCq1gAX094gLYnUHNoVZxXupFmu3+ZaRNO6E/lTOXe2yMT74fKm6ND8u5mcrHe4u5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gKl9nP6ACrxTQ4vYZkwmjQG1BpaKQ7tKT6RQDOa/PQ=;
 b=O7AaimC4KaQGAQ9CkSJElVdSLJRaxS4k8SSS52Vps9YpUnyy+eXa3kvFEj6nO7B/M5vdXn3K3FFyFax38Gg+Hy7q9daoGgUw7gtjh4kMGx9oIrdZgUEvGzp+AoK/OJEpQLlJbFPUYLKkaTok7LAzYKKVBFIF/vrv+A6BR/oPGlU=
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 17:41:47 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::fc) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
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
 2024 12:41:45 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v6 3/5] drm/amdgpu: stop tracking visible memory stats
Date: Fri, 25 Oct 2024 13:41:11 -0400
Message-ID: <20241025174113.554-4-Yunxiang.Li@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 435ab7b0-ad1d-4438-ddcf-08dcf51c4c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0dyOWxKMWRjdldYVCtieTI3eVdldXF0MHZBYjFObDFNR1U2WTE1ZDdVSStt?=
 =?utf-8?B?Z1VvRnZqYnZNejc5SlI4ejVZQlZZVlkyMDV4Qmx5ZFhUMThVZUl3SnBLNllh?=
 =?utf-8?B?M1JUYkZBZGVCdm5MZTVKbXZnVDBIV21FeFNUSHBvaUdOV3A2cFgxTDBBMC9s?=
 =?utf-8?B?L2orM3RHcjNFRFRtdFE3RGJtdmhhUmdMc0dLVXo0Qk9Gd0lXaEVIVXBrMlBQ?=
 =?utf-8?B?L1Vwek16cmNKUU5ROUxzQ2trTUlYbURtenZmS2hGMm5OcWhyclFOVGVVVjFS?=
 =?utf-8?B?Zy9HSitPVnd2WVRtSGVBd1lFKzNDOTZJL3FIbTBieUVrSk5TYW5hOFhXZkJo?=
 =?utf-8?B?TWo5MWVzcDRXSUoyZkU2ZEVWRTA0eEpqQ2UxNHBYNW9OMk5sdHJUU1J5dnJw?=
 =?utf-8?B?bVpBcXZHS2lFL2Ira0pQMTZQZU8zR1BYdjZ2cEdDcnhtZVVTT0xpdTlMOHAy?=
 =?utf-8?B?aDZINDFzb2sreVIxbGt3MVd6WTNiUGlybFc5Z2hsdTF0T3Jid3U5eCtpRExs?=
 =?utf-8?B?d0JlNE9uaVhyTE4rbWZhaDR3K0VCN25FYnYvQURER2l5K0hHOXpQNVNtNlBm?=
 =?utf-8?B?UHd5dEVxbUJpQi9XdGQ5aXJPZVZ2eldWZ1BIbUZDNHhIY0gzNmJ6SVlPS09U?=
 =?utf-8?B?L2xxc1UyZ3JKKzdWbTVaQ1lnYW8rR3NJTHBWWDh3S1NjQm9lU201WHIyK1JP?=
 =?utf-8?B?OElsVGhaN2grN2hvNWNjOVZBbFhiVGxTOTVHSWVtd3h3eVJZUnIwaElwcTlH?=
 =?utf-8?B?T1REelB2VDZvQ24xNFhoRURYZytDZ29INkpuV2VkZFFYSGIwQ3paemV5OEZG?=
 =?utf-8?B?czlvb0NhbzJ0c0tHeGEwNXVaOUNncDlCNUJOcGhoSk8wcUlRSlp3NU1ERDBI?=
 =?utf-8?B?dTV5dGVXZTJYSUo2R3JQRTZ4a0pxc1IzRVptSHFFOGdFYm1nV0RvYkZzMXdE?=
 =?utf-8?B?M3dFbXErTkJ1NlRyWk1MY3V4Y3plcFA3ekNJRVZaNlN5RkhGK2hwQUZUTTQy?=
 =?utf-8?B?amVJamY4TG5PZEdLd0YwRS9kRERacUswb1pHTFg4QjZ0SG5aNjhPRGhRVmFi?=
 =?utf-8?B?SkYxdnYzb2U2N24xeGJxbUlCS0FnV0lNVFpDYXREZ2hNOS9JYmt0aUpsWHJX?=
 =?utf-8?B?dlhVVkYvcjVYVHpkbTZpV2Rkd3l2blp1eWVoeUZlTVpHem51WFZGcGdhL2F2?=
 =?utf-8?B?V1h2bHhLNXZpTmVrT28xd0VOalYvdW1ETEwvbWVQREJoVFlIbENnckpHTjVh?=
 =?utf-8?B?YVNsc3o2QTc2RzhTNTRvbENSTWd0TFNjdTM1ZEZGazhpSUhLUGNEc3h0WW5I?=
 =?utf-8?B?dUpSZlFOQ1ZuOERsSUExVkxOcDFuR3I1NzFxeWNBaXduaTBKOEVJV1hVMHM5?=
 =?utf-8?B?WHFWRDRLWktZNGo1V3RNYlR2SkZZRmJtOW9pQkJvMVRDOE9xZnNXeGN0RU5h?=
 =?utf-8?B?S0I1c1Bnemxhc3pzSkJiNzJ6ejE5azROaUxhTHZDZ2hRVUYzdVJNSnY4eXBK?=
 =?utf-8?B?Y2V2cnFzeDNLd3FKRjEzVGs2VzF1NXcwbW1aMldvT0wxOUFNTnhGNWVkRVpN?=
 =?utf-8?B?ZVorZDZXeXZoR0c4YWxtV2puL1ZKamNMa2NSKzV4SHdkcDlBV1kzY0JXWFVv?=
 =?utf-8?B?cDNFdElKS0dZNUlwWTV2VW92clZOQ2Z1aERHWkNnWWNYMURSRFVab1VnUzF0?=
 =?utf-8?B?N1lqcDlOTzE2QmdPWG04NmRqQjdCMUNFRlFXSzhTV01janFzQzQ3SFFpRlFz?=
 =?utf-8?B?SGZxSFlWVGovL3dZcVlEczg2N05UOHNEcWp5TU5obTBmSU52azh4WHgyRkov?=
 =?utf-8?B?TEU3a1ZaQ3NGU0tnVlFxMkMyaTlPNFNjSWxEWDdJK3BpTVRoUWFPUzEwTkxp?=
 =?utf-8?B?bUs4WS91ZUJXaXY3UWUyVzdtWmpIWEhlRk5QSGl2WmNwZWc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 17:41:46.5802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 435ab7b0-ad1d-4438-ddcf-08dcf51c4c3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
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

Since on modern systems all of vram can be made visible anyways, to
simplify the new implementation, drops tracking how much memory is
visible for now. If this is really needed we can add it back on top of
the new implementation.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 10 ----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     | 11 ++++++++++-
 4 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 8281dd45faaa0..7a9573958d87c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -103,16 +103,10 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
 
 	/* Amdgpu specific memory accounting keys: */
-	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].visible/1024UL);
 	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
 		   stats[TTM_PL_VRAM].evicted/1024UL);
-	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].evicted_visible/1024UL);
 	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
 		   stats[TTM_PL_VRAM].requested/1024UL);
-	drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].requested_visible/1024UL);
 	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
 		   stats[TTM_PL_TT].requested/1024UL);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2a53e72f3964f..2436b7c9ad12b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -40,6 +40,7 @@
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_vram_mgr.h"
+#include "amdgpu_vm.h"
 
 /**
  * DOC: amdgpu_object
@@ -1235,23 +1236,14 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 			stats[type].drm.active += size;
 		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
 			stats[type].drm.purgeable += size;
-
-		if (type == TTM_PL_VRAM && amdgpu_res_cpu_visible(adev, res))
-			stats[type].visible += size;
 	}
 
 	/* amdgpu specific stats: */
 
 	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
 		stats[TTM_PL_VRAM].requested += size;
-		if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-			stats[TTM_PL_VRAM].requested_visible += size;
-
-		if (type != TTM_PL_VRAM) {
+		if (type != TTM_PL_VRAM)
 			stats[TTM_PL_VRAM].evicted += size;
-			if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-				stats[TTM_PL_VRAM].evicted_visible += size;
-		}
 	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
 		stats[TTM_PL_TT].requested += size;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index a5653f474f85c..be6769852ece4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -139,16 +139,6 @@ struct amdgpu_bo_vm {
 	struct amdgpu_vm_bo_base        entries[];
 };
 
-struct amdgpu_mem_stats {
-	struct drm_memory_stats drm;
-
-	uint64_t visible;
-	uint64_t evicted;
-	uint64_t evicted_visible;
-	uint64_t requested;
-	uint64_t requested_visible;
-};
-
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
 {
 	return container_of(tbo, struct amdgpu_bo, tbo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 428f7379bd759..6a1b344e15e1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -42,7 +42,6 @@ struct amdgpu_bo_va;
 struct amdgpu_job;
 struct amdgpu_bo_list_entry;
 struct amdgpu_bo_vm;
-struct amdgpu_mem_stats;
 
 /*
  * GPUVM handling
@@ -322,6 +321,16 @@ struct amdgpu_vm_fault_info {
 	unsigned int	vmhub;
 };
 
+struct amdgpu_mem_stats {
+	struct drm_memory_stats drm;
+
+	/* buffers that requested this placement */
+	uint64_t requested;
+	/* buffers that requested this placement
+	 * but are currently evicted */
+	uint64_t evicted;
+};
+
 struct amdgpu_vm {
 	/* tree of virtual addresses mapped */
 	struct rb_root_cached	va;
-- 
2.34.1

