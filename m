Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06246C78730
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2BB10E83B;
	Fri, 21 Nov 2025 10:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Xjo3bXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010031.outbound.protection.outlook.com
 [40.93.198.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A9B10E83B;
 Fri, 21 Nov 2025 10:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwIWZRbdgYa4ej9S0TGPDvkCQLCAoxnAyT7m8LYGtbsFszjHeIjcf5zIVzRGEbgEq11u3zJU3YJvdkUMbwsW9eArcB5qCZogDoJWpKe6h8A9TaZEboDk1nAuA50ymXnhkUnPPNDvn2sVddeNrlQHLBHxFDTyEEzR+aWbEsdD/i9nbG2LLNk0nRnkRtZJxcnAaIMpayAzGMNhVZrdgY7JQdlAG02o0ZVy9cnhLWxrxDJzgefcZPOK0zelePlhMhXL06eygMIOPWxnhZ/3ic6LNAzv5RcdRaqftP/VrQWX3izOV9DNVkoR0S6PNfe4OBzi9ea2Tnp+8xXuPIoHT4pAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VZGxIMLdPX5rD9SzZfZT5hyTdw+wzUXvlr2A/0DtZE=;
 b=aRCaz8CRuOfsMyZ6v8n0yJJE4NNBC0o6NqWoEAdcVwdnkzAM/0Hy+Ve5YdW4p+fBPn0nyhw3JkbJ2JlWtD3vR5r1OTHLDcy2qg7Id50l5ZjHVQPM6bVSXMg49V1gkA4gauCJrlojwYADXlqTsGw6VoDHF8M77josFRIrMb+1YwFEs57wdWAW1F+lmjdN5z1qB+Trk96hwzYkjohzzPVrJZX2pHrQFVlIoGOe1d1XXLg2xJS6Znq4sO1uh7voaghJLfjegZomphQHpL+6QP+gzXxS6JPhMmWGCk/TBeExsAUwN4PJ8LZybml/6sZEcjGuiOk0mJRTxZ2kzLEy2u/EVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VZGxIMLdPX5rD9SzZfZT5hyTdw+wzUXvlr2A/0DtZE=;
 b=5Xjo3bXBQtvUTMiLxH8AmffOnvZzNnOl31fgy6OOqZkUc+Jgcj2cKmYd9t1EhwMTk6y8rwCrtSZd/3N8sODynnMqFi0y7wbAfWks/f5GwwXo4W2BG9eJuaYkNY1plEn03Gu9l+YegoWGtJY8lyYvJIh8IEuJ6KIT4Ko54HjiXPE=
Received: from BL6PEPF00013E0C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:e) by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:18:16 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2a01:111:f403:c803::8) by BL6PEPF00013E0C.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 10:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:16 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:18:13 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 21/28] drm/amdgpu: allocate multiple move entities
Date: Fri, 21 Nov 2025 11:12:31 +0100
Message-ID: <20251121101315.3585-22-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f56d9b-0c22-4be5-c485-08de28e74916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XWhHXyAoe7ey/8/+CG9fkWulqGgwonYQ6jIDEnk1pS4zn5i9E78agDLk22a4?=
 =?us-ascii?Q?qZEv6oZQLSuLSWjsNwokoxzdS1839B6RccYrjJibDCTluRidP5iTNUgZdiKB?=
 =?us-ascii?Q?BcNtMyyPd5gGiHGh/sn0+5Vk51IMYyCob+dehgm81A6SMDkcOTdPP5LDCsab?=
 =?us-ascii?Q?MO3DR5jVnmXyNUeu7NxqEnHokABHuIMIk4nIJ3EEdiED3wlTayZM+ihr0Goj?=
 =?us-ascii?Q?xwVekDakyNnS/+8LXIME8QxP6oe77foicXFd3Li3Fvow2SOZt+8qEu6AUhHV?=
 =?us-ascii?Q?KzLdfiV2mVbvfWE16246smdiehdXCXaUDPL07Io8hkaTXUjA0v1/mWdjPniS?=
 =?us-ascii?Q?YdgAPM5JDdpB7igGsj+M07RhTfQoMOKMX5FfdNsdZJfYflBW7BobLIjG0t7X?=
 =?us-ascii?Q?UH7fnpgsKGxzAV9tFj5llO9jill3S0gv5U5Tu5SoWeKIBtzH1w8Rzh2yxFvT?=
 =?us-ascii?Q?QiKEw0t8UYuuA86PRqRs+5qsR+Dvtp72zfRlUOp5dcawFAgnGzMadq0rMpu0?=
 =?us-ascii?Q?c/DjAbzIO0Y07WZErTM+dQGMWW6tMiGxo3LNKvJZboZYpfi/tRvAAvwGvGta?=
 =?us-ascii?Q?oH9qNMshUKtXsTo4i9+6cSz3OJ0vbfoit/Uwm4FJ3ArZcHvowCgkO5Yiltxj?=
 =?us-ascii?Q?ziIhhPA9HJ3UJCs3gDql94EjHBmtFpn+fZN+lr6UqbQ4/+ilnvY4dlsb498H?=
 =?us-ascii?Q?WNZpqHIlijDbPruDeNs+rd/xk1y7we9emJNmmRf21+7+VGQh9p1vr3LjaB6a?=
 =?us-ascii?Q?UIxrZJ3ksOySJORmceQAif8xDkh5vsNzRuKnJ9HF5bUihrIEz6g8/KJiPoie?=
 =?us-ascii?Q?K4BGBIFmEH8N9e7ARYj15mDtBZOve5Q1a+KhGYcrPBYbtse+jQb81xrwTF3X?=
 =?us-ascii?Q?Tuu8rr+P9wIL72yIJVZJvKlAApQvjH4HSicKYZVHM895E79eRBfqshcjZ7rq?=
 =?us-ascii?Q?naGtAcLvl0KLXfDGZClSp9innUKReEaq0wfUgq039IJEazszts7PEGh3CW5e?=
 =?us-ascii?Q?uOX2Aa8vP+QeGt5Zh/Ob5Czc1D0BitgZMU4oGFh8snjQREbDuerhRxollEKk?=
 =?us-ascii?Q?sYQWTXf4iq55SdS7uZX/DWqHLvprafHwE/O7hYarQD92t+1Eo/MbWsagAhtm?=
 =?us-ascii?Q?UJK+xxymiE3eODcZaApaXLUxOT5zETcXkQF1I7naPkqE4Z174lbg4+2f4iG7?=
 =?us-ascii?Q?TCVBd8Q8ZuLAgi9vrJECeGHcpOtkSLJrLN6isXuMDu3rvCbdsq71Pj7hWG9E?=
 =?us-ascii?Q?H9591gp0UGRCiKYEmTO6jNdooHcuZ8AEJ68qpL0Coi0jo8K4T39hOJ0B3qIj?=
 =?us-ascii?Q?3Nq5AV8nNWgnrygAFWfO2CePhZshwSQ73gD9KDnV8os+x3VLvZUjWTTgC9ot?=
 =?us-ascii?Q?euRjKvi2g6meRikiAcW9ZENkc2tXx8rxTvaZRRa1+1ABwEnQ1M9/anC07yam?=
 =?us-ascii?Q?4bxVPJrcw70vB3XTy/2j2k82txZVyL5z3rNtt83H+ZqSszqkaI51Mi+tlYEX?=
 =?us-ascii?Q?5hHl2XhfWwkopARaoAmVImbrXKu4MtwsikjeG+kEam+jWW6xLggsYvXaZViz?=
 =?us-ascii?Q?GzY5yYkx/wmkvX4PutI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:16.1558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f56d9b-0c22-4be5-c485-08de28e74916
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B
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

No functional change for now, as we always use entity 0.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 45 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d7f041e43eca..438e8a3b7a06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -439,7 +439,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entity,
+				       &adev->mman.move_entities[0],
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -452,7 +452,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(adev, &adev->mman.move_entity,
+		r = amdgpu_fill_buffer(adev, &adev->mman.move_entities[0],
 				       abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2224,12 +2224,13 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	u32 used_windows, reserved_windows;
-	u32 num_clear_entities;
+	u32 num_clear_entities, num_move_entities;
 	uint64_t size;
 	int r, i, j;
 
 	num_clear_entities = adev->sdma.num_instances;
-	reserved_windows = 2 + num_clear_entities;
+	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
+	reserved_windows = 2 * num_move_entities + num_clear_entities;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
@@ -2251,20 +2252,25 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO eviction entity (%d)\n",
+			dev_err(adev->dev, "Failed setting up entity (%d)\n",
 				r);
 			return 0;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.move_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
-			goto error_free_entity;
+		adev->mman.num_move_entities = num_move_entities;
+		for (i = 0; i < num_move_entities; i++) {
+			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched,
+						  1, NULL);
+			if (r) {
+				dev_err(adev->dev,
+					"Failed setting up TTM BO move entities (%d)\n",
+					r);
+				for (j = 0; j < i; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.move_entities[j].base);
+				goto error_free_entity;
+			}
 		}
 
 		adev->mman.num_clear_entities = num_clear_entities;
@@ -2279,6 +2285,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 						  DRM_SCHED_PRIORITY_NORMAL, &sched,
 						  1, NULL);
 			if (r) {
+				for (j = 0; j < num_move_entities; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.move_entities[j].base);
 				for (j = 0; j < i; j++)
 					drm_sched_entity_destroy(
 						&adev->mman.clear_entities[j].base);
@@ -2290,15 +2299,17 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		/* Statically assign GART windows to each entity. */
 		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
 							     0, false, false);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
-							     used_windows, true, true);
+		for (i = 0; i < num_move_entities; i++)
+			used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entities[i],
+								     used_windows, true, true);
 		for (i = 0; i < num_clear_entities; i++)
 			used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entities[i],
 								     used_windows, false, true);
 		WARN_ON(used_windows != reserved_windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		for (i = 0; i < num_move_entities; i++)
+			drm_sched_entity_destroy(&adev->mman.move_entities[i].base);
 		for (i = 0; i < num_clear_entities; i++)
 			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
 		/* Drop all the old fences since re-creating the scheduler entities
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 250ef54a5550..eabc5a1549e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,9 +72,10 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_buffer_entity move_entity;
 	struct amdgpu_ttm_buffer_entity *clear_entities;
 	u32 num_clear_entities;
+	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 0cc1d2b35026..5dd65f05a1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -135,7 +135,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	u64 size;
 	int r;
 
-	entity = &adev->mman.move_entity;
+	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->lock);
 
-- 
2.43.0

