Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC859830CE3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8579B10E7D3;
	Wed, 17 Jan 2024 18:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0532910E7D2;
 Wed, 17 Jan 2024 18:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrShskKtkFMOA988MD5/L9YS7DO97WuY7O6G7n5unubvqJdz9DL6FaJn9ieCOFiYfGogwjVgiD3r3fJyKv6VfiFPZR73ucI+1aQkprrpZRDoUmCNIqiFJAzXElki2HMOVgp9/mr4JCFIzstU4RYFwAbe1TnKBQ4T+RkpBYxAndpgwv6vUL0bMa9OlQsRgxjI8uY0twimJLXxsMx8m8yahEBzM0b3X1d4zsy6F53sFb2zi1JqAIglqW19VfnYQ0+AMq71atGno5Las/yL0+JhX9n337baCECzWfurNXTy3oatW+V1sLKlC0gD4TjcAuZZLcOWn7FMus6eZXm7qll7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJeu1+MHgDOUz1vgUQ9hlUpREKJ+teczytM2qNiTZDw=;
 b=lWQe1nl2Mt8iyv19sAL2tDAU1lBHdG2GoxwfPTp+gulDJfgL/i2OT1ksRvsaxLs9rQjH5Ln5osrOXp+G5zioeLH5GA0g1qKgWtYMiKe4Bfyq/mnhblLXbaHJOZ1mhcc5wCEF1wLMQI3lpkGO45+qwnVvzoES/coCgWkOObpLmLvPn+sPFQwbjL/6M44d9vBDupmgavAXBeaQD7x1pJ9GXYmhS/aJyNffNXIHBUbgoX+ytcyRe1WXUN/3TzIHLPLzICVC7UMOvNCpCeKDbpuNq3OsFHAoSjq2NGO3LcGouQQZfKMHO69IMaNByHGaucawQZmvQB8UyY+VmExvp2rC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJeu1+MHgDOUz1vgUQ9hlUpREKJ+teczytM2qNiTZDw=;
 b=fy69DOODtXMmgaGiYU7K2U8JSJRwXU6kUDHpvAnKbEOcpZvg8H2CSe+Asrkytf4CCFVrVuUql6Il2ADSZja6YMDByRV++anp2vlOAOqPDOBNWfRW5P4sbUFwZhUBUOiYaPUTcL8V7xuCe9clWjTv6Vx2N9r4nBCkHYWxm7oSkqs=
Received: from BL0PR01CA0011.prod.exchangelabs.com (2603:10b6:208:71::24) by
 CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 18:44:26 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::15) by BL0PR01CA0011.outlook.office365.com
 (2603:10b6:208:71::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Wed, 17 Jan 2024 18:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 18:44:26 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 12:44:23 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
Date: Wed, 17 Jan 2024 19:41:41 +0100
Message-ID: <20240117184329.479554-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2bb92a-c644-4a99-d6f5-08dc178c54ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MeTb38hhNribkeDk/Gn2yb6HDPW7iWPwQZUnVJ4Mya/6LJrIan5T6VZp/cQ2fkg4IVACyRQ1s0KMkNVevQ4IpnnF0/X3h82yvApOtPeZUH+ilf33H+/CUUjD9BMnASNTOUqQF9DEJoTp0fN4aj6HfOQ8HRQiuwNNFYDq1QTH85g1Hh2Zim5qm7zq9/iMKfKHLnMQbyJZXbICB9WZ4I0Jg/byUb46uSQdgc9TGV8lOG0Tzvqmn7JfkRuQCl5URNgI1Wagro1E9thcLdLEBz+SCZsBCTs2dbSgygrHixXTm4PxaSjEV00oFK/ImO2GG+j+JBVV9OguGZk2yjJcFR2PyKpRuKymOjbGzn84aSxXM98jfFOUJWQuUxwDVOUKFMnVkrG+0lrc6+3Acn0BAClbnMIal1wssFjG89EyG0Xm5gTiEkKHwn6ZmQLqwAq25TIFhkwZwR1n8AqksWSJP5Rhbjb/44S2JV0GfKvu1QL+in/sPuZ+O24ONsLqGcavEEFkNl+E4H6lhDRjeKRPAJVVmT+76R0bl6tV5aMgbnmBL4EaEmhPRNtIt9nbdfg0WgIzbO5QbZBx0lgzSvhximlUQt6lU0LCIycy7NukOj0Q5SS25XJ3AgOhnuK/gYAQmn+LzzzfwC4AOFKtZXNNGeYIMMzDeFafsMNA5+TMvu2X5YUtg+zMhDgCyBcPxgj/COY7xjolzeSfBfTdqPl8rKnIZgZNccij9g6Ra5WOPSeul+7OkY2O/KMeDkpiSst4pz5REwhGBe7u2lg9xK5rmGerKS9l00hpa/xVf+4breXHMlEcZHXj1MAJum8BHspwQnQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(40470700004)(46966006)(36840700001)(41300700001)(5660300002)(8676002)(8936002)(2906002)(70206006)(70586007)(316002)(110136005)(40480700001)(40460700003)(966005)(478600001)(47076005)(336012)(426003)(26005)(1076003)(2616005)(6666004)(7696005)(16526019)(4326008)(36756003)(356005)(82740400003)(921011)(83380400001)(86362001)(36860700001)(81166007)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 18:44:26.7123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2bb92a-c644-4a99-d6f5-08dc178c54ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it possible to understand the dependencies between jobs.
Possible usage of this trace:
* stuttering issues like Mesa !9189
* incorrect synchronization: I don't have a link for this one, but having
  these events was very useful to debug a virtio-gpu / native-context /
  radeonsi sync issue

I have prototype code using this in UMR, as can be see here:
   https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37

The 'reason' param currently uses __func__ but I didn't add a macro for
this because it'd be interesting to use more descriptive names for each
use of amdgpu_fence_sync.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c          |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         | 11 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h         |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c     |  4 ++--
 7 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d17b2452cb1f..fde98e48c84b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -491,7 +491,7 @@ static int vm_update_pds(struct amdgpu_vm *vm, struct amdgpu_sync *sync)
 	if (ret)
 		return ret;
 
-	return amdgpu_sync_fence(sync, vm->last_update);
+	return amdgpu_sync_fence(sync, vm->last_update, __func__);
 }
 
 static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
@@ -1251,7 +1251,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
 
 	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
 
-	amdgpu_sync_fence(sync, bo_va->last_pt_update);
+	amdgpu_sync_fence(sync, bo_va->last_pt_update, __func__);
 }
 
 static int update_gpuvm_pte(struct kgd_mem *mem,
@@ -1273,7 +1273,7 @@ static int update_gpuvm_pte(struct kgd_mem *mem,
 		return ret;
 	}
 
-	return amdgpu_sync_fence(sync, bo_va->last_pt_update);
+	return amdgpu_sync_fence(sync, bo_va->last_pt_update, __func__);
 }
 
 static int map_bo_to_gpuvm(struct kgd_mem *mem,
@@ -2910,7 +2910,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		}
 		dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
 					DMA_RESV_USAGE_KERNEL, fence) {
-			ret = amdgpu_sync_fence(&sync_obj, fence);
+			ret = amdgpu_sync_fence(&sync_obj, fence, __func__);
 			if (ret) {
 				pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
 				goto validate_map_fail;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 6adeddfb3d56..6830892383c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -423,7 +423,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
 			dma_fence_put(old);
 		}
 
-		r = amdgpu_sync_fence(&p->sync, fence);
+		r = amdgpu_sync_fence(&p->sync, fence, __func__);
 		dma_fence_put(fence);
 		if (r)
 			return r;
@@ -445,7 +445,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
-	r = amdgpu_sync_fence(&p->sync, fence);
+	r = amdgpu_sync_fence(&p->sync, fence, __func__);
 	dma_fence_put(fence);
 	return r;
 }
@@ -1101,7 +1101,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update);
+	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update, __func__);
 	if (r)
 		return r;
 
@@ -1112,7 +1112,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update, __func__);
 		if (r)
 			return r;
 	}
@@ -1131,7 +1131,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update, __func__);
 		if (r)
 			return r;
 	}
@@ -1144,7 +1144,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&p->sync, vm->last_update);
+	r = amdgpu_sync_fence(&p->sync, vm->last_update, __func__);
 	if (r)
 		return r;
 
@@ -1225,7 +1225,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 			continue;
 		}
 
-		r = amdgpu_sync_fence(&p->gang_leader->explicit_sync, fence);
+		r = amdgpu_sync_fence(&p->gang_leader->explicit_sync, fence, __func__);
 		dma_fence_put(fence);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index ddd0891da116..96f68e025d8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -309,7 +309,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 	/* Good we can use this VMID. Remember this submission as
 	* user of the VMID.
 	*/
-	r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished);
+	r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished, __func__);
 	if (r)
 		return r;
 
@@ -369,8 +369,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 		/* Good, we can use this VMID. Remember this submission as
 		 * user of the VMID.
 		 */
-		r = amdgpu_sync_fence(&(*id)->active,
-				      &job->base.s_fence->finished);
+		r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished, __func__);
 		if (r)
 			return r;
 
@@ -421,8 +420,7 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
 			id = idle;
 
 			/* Remember this submission as user of the VMID */
-			r = amdgpu_sync_fence(&id->active,
-					      &job->base.s_fence->finished);
+			r = amdgpu_sync_fence(&id->active, &job->base.s_fence->finished, __func__);
 			if (r)
 				goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index da48b6da0107..0f85370f69fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1219,14 +1219,14 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 		DRM_ERROR("failed to do vm_bo_update on meta data\n");
 		goto error_del_bo_va;
 	}
-	amdgpu_sync_fence(&sync, bo_va->last_pt_update);
+	amdgpu_sync_fence(&sync, bo_va->last_pt_update, __func__);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 	if (r) {
 		DRM_ERROR("failed to update pdes on meta data\n");
 		goto error_del_bo_va;
 	}
-	amdgpu_sync_fence(&sync, vm->last_update);
+	amdgpu_sync_fence(&sync, vm->last_update, __func__);
 
 	amdgpu_sync_wait(&sync, false);
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 1b013a44ca99..b6538f73eee9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -30,6 +30,7 @@
  */
 
 #include <linux/dma-fence-chain.h>
+#include <trace/events/dma_fence.h>
 
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
@@ -149,10 +150,12 @@ static bool amdgpu_sync_add_later(struct amdgpu_sync *sync, struct dma_fence *f)
  *
  * @sync: sync object to add fence to
  * @f: fence to sync to
+ * @reason: why do we sync to this fence
  *
  * Add the fence to the sync object.
  */
-int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
+int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f,
+		      const char *reason)
 {
 	struct amdgpu_sync_entry *e;
 
@@ -166,6 +169,8 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
 	if (!e)
 		return -ENOMEM;
 
+	trace_dma_fence_sync_to(f, reason);
+
 	hash_add(sync->fences, &e->node, f->context);
 	e->fence = dma_fence_get(f);
 	return 0;
@@ -249,7 +254,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 			struct dma_fence *tmp = dma_fence_chain_contained(f);
 
 			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
-				r = amdgpu_sync_fence(sync, f);
+				r = amdgpu_sync_fence(sync, f, __func__);
 				dma_fence_put(f);
 				if (r)
 					return r;
@@ -358,7 +363,7 @@ int amdgpu_sync_clone(struct amdgpu_sync *source, struct amdgpu_sync *clone)
 	hash_for_each_safe(source->fences, i, tmp, e, node) {
 		f = e->fence;
 		if (!dma_fence_is_signaled(f)) {
-			r = amdgpu_sync_fence(clone, f);
+			r = amdgpu_sync_fence(clone, f, __func__);
 			if (r)
 				return r;
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
index cf1e9e858efd..0c58d6120053 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -47,7 +47,8 @@ struct amdgpu_sync {
 };
 
 void amdgpu_sync_create(struct amdgpu_sync *sync);
-int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
+int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f,
+		      const char *reason);
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index bfbf59326ee1..5e30b371b956 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -117,13 +117,13 @@ static int map_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		goto error_del_bo_va;
 
-	amdgpu_sync_fence(&sync, (*bo_va)->last_pt_update);
+	amdgpu_sync_fence(&sync, (*bo_va)->last_pt_update, __func__);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 	if (r)
 		goto error_del_bo_va;
 
-	amdgpu_sync_fence(&sync, vm->last_update);
+	amdgpu_sync_fence(&sync, vm->last_update, __func__);
 
 	amdgpu_sync_wait(&sync, false);
 	drm_exec_fini(&exec);
-- 
2.40.1

