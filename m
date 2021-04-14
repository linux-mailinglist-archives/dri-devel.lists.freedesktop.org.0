Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353B35ED8E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991076E8E5;
	Wed, 14 Apr 2021 06:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A26E8D0;
 Wed, 14 Apr 2021 06:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6LNx7KrquNOsEfcC410Mv4/n7Cz/eJ0mGlZsQPIBsGDSI46T16l3/d8ITWUR9xIbiS9aEgN3JLrhDx6u1lZsdMFdpGezC5xn9aB9xStkoM+l1CcpM81Pgtr8va5yU/jHgLWCZvMLC3wBSNyP7+w0BI1kNCXZsPYvS9Zr0/dRChEgnmvHxx4aHUnBXa9CzzdFdnZYZDp/jSBpyhmb3131OyKGYujt9txFrpOU1msi/b/0bR9jAyiSC45nd2O/n26oonmaKtxpfsL4bMA/D86KlKiGPwizc60a+VGxI8OuRDrppF9vb6haOmZIw6EdhRMQGsSWGWfh+hV/DUCSA40yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4f6qiDMF3EvXZF3caFnVdL4tzzrONpDOHzq7h2Z3dM=;
 b=Kb6XsiUcE+9ugkP1TvuG9VG4h2eKRosHEIIMQEfWScaskUGsJMTs4hI4v41nB0PW/Ipk7vxhju1sLA8tfwYyDyq8HPj3LjmwD7krRXON51adDlIUPXH43qHmNV61upt+Ll/DHaYpW4LI+gPzJHLXaegfFJCQuq2GRLFhk8DuGfiMPJHoHbZX/uWMa5oWooH4UblezeuPqChk74HN0lKB+OQNMnXQWy5k8yuSrbxQUAn7rM1c4C5qV9h42/Nq+rgMm51CyR2tlAn+zYhEW2fzR/9+C76TpBpt+c88ddOkeSoz36tJwQXm7l2lHbVyBZXnd+mtaj2N3AQ2Roinds1Vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4f6qiDMF3EvXZF3caFnVdL4tzzrONpDOHzq7h2Z3dM=;
 b=RJUYOFxHNOlNYxz2YyShWG27lT+1UIxBPFN71o4pl2Zj2guuLP89ftMj8MECDOBEF5PdXlnazSMw+ISdUJyUGxWiCdOhpBD4bimmUF42b8ag1IutVGfV3GbcZzQEaaCIEh5xOK9tnWVFmJrOjBwjrLHNRXMD0MnTfPsis3lXpfc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:20 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/amdgpu: Simplify AQL queue mapping
Date: Wed, 14 Apr 2021 02:47:58 -0400
Message-Id: <20210414064804.29356-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e2b926-03a3-42cf-6f10-08d8ff114a01
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125295E61D914C28DF1F70F924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIA3pJ5uKKflpxayyStuISReRdeQ9sBI2Ziv+kMRRtFWuR6iChUoIVamqCfVURwUY0zdz1CUqljHsuvEIxHZLiGWMwroreirx5/RPtM6B7PDfMpmqUDv4TaFSIugThtNThtVGybYjP+TrclqE+2DlLrT8aaCRw1QWHARi0AzpAxx8kZYdQEglFJtnabSudfV8+RCVIluuENzbQ1HExII0caaECuxu4UBDN9Qjq1IyJomgl1E5MLwbNz+SNoB+6S3/ImVFT0Z4AiCxYVxqepxnVBUAq5gK4fK7UPVB1PfB4KdWukqGpM5O/Tz5iCAjmFu8bnzQrqTwIAzWEmaYvjaM+az3cyjMo3nSJ4lp7QRZiFDOwWJuiOJmZe3pTMFd0IDEs5xHyHMAjpnOy72McIjUte2g47IkZlD3jOA4+eEz1XimcUF4GyQo+Pj6nhu0oFHH1vJzzth7vv/5ShRONAR1Wi2zFQwpH4dxTypXSva/ANEMT0GVR29+rQ/s8LHNimROYzgtEtCYbQ1S4IFvjCDXlDWse0qfiQkAsCoib4AlyY5+PihbQYGp/Y5UesZGr4y+JYn0av9xIrxB077Pq5p/O/UTnfTdpec/zhTl3LoissevMFmbqd4kzW1IymxZkMxqIl4cGVaEmVMlZqXUtUK5M1ZsoTmD+4wFfoJEtPducc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PspmwOYmyqYs0vH0f8OQFWsj6pELUjE2lcrt+qy9FfZRKd+AHbf3U8aE/l58?=
 =?us-ascii?Q?xaVyhw+rh6eFiDsIsB8qt0BYM7GWtTlEmdzYa8WRi3j1A7ueSnh116rQQZSc?=
 =?us-ascii?Q?xG51PiS/ZUWwU1TmYXFKosEHynR9PN6SkyiPvFq48bIvEFWT1I3NIoSls/cU?=
 =?us-ascii?Q?8Mf7MbTKdRMPnZJfxVoQuGq1HIoTy0wvQamIoO0uPdv5DLmNc9RtHKkYI17o?=
 =?us-ascii?Q?3O+vGdwjVdcj/xMqm4j8yNBy+c11wjY315JRsgIllpnKvBFfu16vSNxzWNNv?=
 =?us-ascii?Q?+UbZ8J3VAfFpaL5mIQJicJfj9edXo5Kwce4Dq1qW0OH2PvzGbW3J0717Cuhc?=
 =?us-ascii?Q?Fk3wNmZdznjfF+IyYRRDgsfZ17btHDZaDIVeVPTX5/wDj/4i0t2DYdyWKSkM?=
 =?us-ascii?Q?C1QrRBP8ycG885eIBWfhjIjUm62PlmhZO5sBwWwN9+nbAMTMPRHAUDq6q1hA?=
 =?us-ascii?Q?cyG8fjOv5/TYeTjWIOXe9QFGHyxPzR5bQ5Cs1R2qdSJU5/iVKb425WgDRcvY?=
 =?us-ascii?Q?S7MtMtHPDOpOX7UHlu6qjPX2Z1tSbLM6co/ek09vxyRqQXX66e5Erqop4Jj2?=
 =?us-ascii?Q?z3t/jCfp6xlId0OdUMyxLrlgzCCvbVLsvnG7e9Z0lKLQ+fg3Fz6kvRoA5Pnw?=
 =?us-ascii?Q?yLcIlvXO8VssNVOWbMWayjbgYUJHm7AAnBKYoX5PVBcAB4c7SnWE/YWor6wA?=
 =?us-ascii?Q?wU3e1ibRjhkjXKHTjg8qDr15r7suKRes7CM9KxjvjPYWhrrGfGzTzNPYgqwl?=
 =?us-ascii?Q?hCBjXA6zBMYzhnPNBbgxH+3dM74bo1J4WdfMbqHgfj98kqWsHMbYptVmFwg1?=
 =?us-ascii?Q?swJjruVv8/csnJHPDqGSclCqZb3Sd8FdswMc3DQh/dKaZQ5nNJKb7iekOvbM?=
 =?us-ascii?Q?Nar/Xp+Y6HpXBqcsR0JFxRUe36V2qupVyYhFNkNlBrCRP5UtPbRniVuX4x9s?=
 =?us-ascii?Q?VnC7oCeDOG8cpcSwpeE+rAzp73Q1hTD3dG6lfahGDLqu9Sx1fXYPB90nZmCa?=
 =?us-ascii?Q?d4/Q5V4I7WZ2fPYCaxhbB0p117aYI8/6RiQGoSIKxWraKimyF2W+YOvTjzCb?=
 =?us-ascii?Q?OJcVWT1AiFa1t2A5DyMgYc9Y9F6WbJnTPxWSjilqGQRCggJTQNMSCxhqLgFv?=
 =?us-ascii?Q?/j63EUpZjX4Mj4uLmWVy9Y/dyk9jt0DjqyyPFBAFwBqMBdDMpifVjp7WCoLv?=
 =?us-ascii?Q?mFZm7DTT6EsN/3fVRUSkATFugWXbCTLSeI82AYaSqBMiNPIlO9+h3RmF1bZC?=
 =?us-ascii?Q?D8Cah6dYIj2Wo5yCE9tE58p/s+XsZGVHwVidippmupCYTg71ny+QJlmAQbKc?=
 =?us-ascii?Q?wQuVzg9phYtSTwS0gDwKggDO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e2b926-03a3-42cf-6f10-08d8ff114a01
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:19.5533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+dRdSQ7ZO/rqYYFWVaHWdDXZ2Ge20bs7qcznj3x8ZtUdQp+IlMAOnZOcGqYfPOxjWTBLfO0cyeFyT+opcuNKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do AQL queue double-mapping with a single attach call. That will make it
easier to create per-GPU BOs later, to be shared between the two BO VA
mappings on the same GPU.

Freeing the attachments is not necessary if map_to_gpu fails. These will be
cleaned up when the kdg_mem object is destroyed in
amdgpu_amdkfd_gpuvm_free_memory_of_gpu.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 103 ++++++++----------
 1 file changed, 48 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 40a296ca37b9..114fbf508707 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -484,70 +484,76 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
  * 4a.  Validate new page tables and directories
  */
 static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
-		struct amdgpu_vm *vm, bool is_aql,
-		struct kfd_mem_attachment **p_attachment)
+		struct amdgpu_vm *vm, bool is_aql)
 {
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	uint64_t va = mem->va;
-	struct kfd_mem_attachment *attachment;
-	struct amdgpu_bo *bo;
-	int ret;
+	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
+	struct amdgpu_bo *bo[2] = {NULL, NULL};
+	int i, ret;
 
 	if (!va) {
 		pr_err("Invalid VA when adding BO to VM\n");
 		return -EINVAL;
 	}
 
-	if (is_aql)
-		va += bo_size;
-
-	attachment = kzalloc(sizeof(*attachment), GFP_KERNEL);
-	if (!attachment)
-		return -ENOMEM;
+	for (i = 0; i <= is_aql; i++) {
+		attachment[i] = kzalloc(sizeof(*attachment[i]), GFP_KERNEL);
+		if (unlikely(!attachment[i])) {
+			ret = -ENOMEM;
+			goto unwind;
+		}
 
-	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
-			va + bo_size, vm);
+		pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
+			 va + bo_size, vm);
 
-	/* FIXME: For now all attachments use the same BO. This is incorrect
-	 * because one BO can only have one DMA mapping for one GPU. We need
-	 * one BO per GPU, e.g. a DMABuf import with dynamic attachment. This
-	 * will be addressed one BO-type at a time in subsequent patches.
-	 */
-	bo = mem->bo;
-	drm_gem_object_get(&bo->tbo.base);
+		/* FIXME: For now all attachments use the same BO. This is
+		 * incorrect because one BO can only have one DMA mapping
+		 * for one GPU. We need one BO per GPU, e.g. a DMABuf
+		 * import with dynamic attachment. This will be addressed
+		 * one BO-type at a time in subsequent patches.
+		 */
+		bo[i] = mem->bo;
+		drm_gem_object_get(&bo[i]->tbo.base);
 
-	/* Add BO to VM internal data structures*/
-	attachment->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
-	if (!attachment->bo_va) {
-		ret = -EINVAL;
-		pr_err("Failed to add BO object to VM. ret == %d\n",
-				ret);
-		goto err_vmadd;
-	}
+		/* Add BO to VM internal data structures */
+		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
+		if (unlikely(!attachment[i]->bo_va)) {
+			ret = -ENOMEM;
+			pr_err("Failed to add BO object to VM. ret == %d\n",
+			       ret);
+			goto unwind;
+		}
 
-	attachment->va = va;
-	attachment->pte_flags = get_pte_flags(adev, mem);
-	attachment->adev = adev;
-	list_add(&attachment->list, &mem->attachments);
+		attachment[i]->va = va;
+		attachment[i]->pte_flags = get_pte_flags(adev, mem);
+		attachment[i]->adev = adev;
+		list_add(&attachment[i]->list, &mem->attachments);
 
-	if (p_attachment)
-		*p_attachment = attachment;
+		va += bo_size;
+	}
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
 	if (unlikely(ret)) {
 		pr_err("validate_pt_pd_bos() failed\n");
-		goto err_alloc_pts;
+		goto unwind;
 	}
 
 	return 0;
 
-err_alloc_pts:
-	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
-	list_del(&attachment->list);
-err_vmadd:
-	drm_gem_object_put(&bo->tbo.base);
-	kfree(attachment);
+unwind:
+	for (; i >= 0; i--) {
+		if (!attachment[i])
+			continue;
+		if (attachment[i]->bo_va) {
+			amdgpu_vm_bo_rmv(adev, attachment[i]->bo_va);
+			list_del(&attachment[i]->list);
+		}
+		if (bo[i])
+			drm_gem_object_put(&bo[i]->tbo.base);
+		kfree(attachment[i]);
+	}
 	return ret;
 }
 
@@ -1414,8 +1420,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	uint32_t domain;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
-	struct kfd_mem_attachment *attachment = NULL;
-	struct kfd_mem_attachment *attachment_aql = NULL;
 	unsigned long bo_size;
 	bool is_invalid_userptr = false;
 
@@ -1465,15 +1469,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		is_invalid_userptr = true;
 
 	if (!kfd_mem_is_attached(avm, mem)) {
-		ret = kfd_mem_attach(adev, mem, avm, false, &attachment);
+		ret = kfd_mem_attach(adev, mem, avm, mem->aql_queue);
 		if (ret)
 			goto attach_failed;
-		if (mem->aql_queue) {
-			ret = kfd_mem_attach(adev, mem, avm, true,
-					     &attachment_aql);
-			if (ret)
-				goto attach_failed_aql;
-		}
 	} else {
 		ret = vm_validate_pt_pd_bos(avm);
 		if (unlikely(ret))
@@ -1528,11 +1526,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	goto out;
 
 map_bo_to_gpuvm_failed:
-	if (attachment_aql)
-		kfd_mem_detach(attachment_aql);
-attach_failed_aql:
-	if (attachment)
-		kfd_mem_detach(attachment);
 attach_failed:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
