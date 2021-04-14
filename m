Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3D35ED7B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC186E8C2;
	Wed, 14 Apr 2021 06:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19426E8C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwXCNcyhBGCtSfkxO5/TCbG+zn/QiCnm7NXCovp+ePFnSbO5j8ogqcerqJdaucuNHJEAOrGSZB3Aj/ZCvcgZJWvhprLVpwzyjY+YDyGOGAD5WBzEFrBM+5JYZa2YRpoV3Ld6r6LaKj0tZyC5u+vLYDKxpw2aR7RJxcSj0NimoK/oX/MgPf2b0xyjspTDDH10qTs/un1/IdRTiZEb8olnk/1P0aBwxP4gta3/vW2FrYAh21CnvUtROADglGZqukXVv94I0tjcfTBbgcSX9u2WYVoJpsYDzzprulBxC3wI6ZcSbAgVcV2arNcYBhOHIGt1jV3rN1U5YNd2AOdxAy6AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4f6qiDMF3EvXZF3caFnVdL4tzzrONpDOHzq7h2Z3dM=;
 b=gah2OkSe1GEG27Y+qkXADW/ASeloE/uIx6Gm1YhUJkckw9KtVk4d6+PJs72gaFrBSHco0CrLUCxakQQWDLwLG1iQsUEUes6pi+8uKSCVefpKVDiAgCxoDM2OlLiZGVd1mXYfq/fEYmhf8m4YTA//LYyHTIKMQ9Nl1ZwkQdMRM/Ki5VVAbD/WLSwz9NCaLwkK4AdlTNSCuSEpZgc3RFQHvvHNAkqhfqivTQ/+WO9RGwt/W7bNFsM1faasO2I0V+wMM3N6swRlneAiwS7dwtETcdEX6ISlpmcY20SJ9ok9vyTfemnXRBm7rTtpGCX9YCQJNPY7/eAvUe0zbAoQwt/t4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4f6qiDMF3EvXZF3caFnVdL4tzzrONpDOHzq7h2Z3dM=;
 b=1b8g2BUo2eDF1xbDPgbeH6uzsJAhUMrpPZTyiDy2KmQlQH/vTZ89izqFwWC/AZ08EvffWqoumhT3AQhtpp8bj8+R5GgHhQj8bgEb1vb7Qffwu6H+K+7Fd9y4tcgpxGr1RmbdMj5pipyoefCERJb5IQixbtApUw8cm5kCTkrHhmw=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:46:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/amdgpu: Simplify AQL queue mapping
Date: Wed, 14 Apr 2021 02:46:15 -0400
Message-Id: <20210414064621.29273-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06985e79-7024-4a8f-4a20-08d8ff111477
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB412574B47E38186268E62287924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMAr7EYtA6UaAkIgbCjSWVo7uyZdRGQGVDMWoaHU8GvZ+XWLo1skKE9lO9abLVdRNQ7FMmlOg+TneNVb+dluf6EFQEPbm5J8m5CLcgKTiSaT6KDeF9x+ehQbsFLFgsz3s2qJRTI7jomcs3NSZHGpwD1iJRB4YzeQ/NjQImg9FTeQCe/+OVjmKwV0CD+9WtywVMscaQc7M9rWtNXEt2LsaYkxOJR7sNnySV9gaMJjIU8v/DkI6TdNQxu7X5G3t2Wr4ne22ZS/WKPv5oovAnVHRgdmit1VBLo33iVF344O+kyADI2RXu083sMfMvUjhVbYhoHv6bGmGkJXNzqWcCT2v+KDLImXs4t2LHCr1SYhuba5xCm1QWcTPhh4O2AdVwDF2Rj7iHvCKp7t6J3tbUUwYdOsdZe019jPwzKYNXf65WGsoBO1sEfWRCT4N6AKpjt1b7K+MFEXaHM3nMgbVemYKZlqCqqdpNa5MRPmPOmAJNIqjbvSa1Ot5oO4DA2CTok4v/7JqLL8f2dBW+NnX3pDVQcIajQLBcbQW+1U0Wqcr+LEBOQE9H/oU2ALK5ljtEu4RDNMeTqBo6z9e4Tja1T+W16Z8iQqegZbYpzY+6+bsVWENb6GY+Ww6wo7qImnRUWXrsfYGeBTuEVgQZq36jeM0G1Vwd2P9Q6DBR1o3Uz1Tig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(5660300002)(478600001)(6666004)(316002)(186003)(16526019)(66946007)(8676002)(83380400001)(4326008)(6486002)(2906002)(66556008)(52116002)(38350700002)(8936002)(86362001)(7696005)(26005)(66476007)(36756003)(956004)(1076003)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bOeP5WztcsTMndz6DDaa+DFLa+bpHBrSgjAPRuRH25q8F4ld1+iNb+CRneBh?=
 =?us-ascii?Q?r4UB5DKq/AZuKR6mFfnrNRhikGks4RSlIj61+zHMSRcHgIrkfJX2JzD8DM8V?=
 =?us-ascii?Q?+QKqcG/xH0+BBLd5BS3ZW/L4Nf4o669Vaqlz+GyWuNYsHcq+4e/+wqPnvM8s?=
 =?us-ascii?Q?PH/KwVIvIBa04GkkgLkt5aI6dGiOvAzN6+eH5d8ilHDnzg2HbH3E4bUS8E0d?=
 =?us-ascii?Q?yAZ7mDJOCLMMbKAfhUQptCVmrMPQIS2XZleo++lU6wsZYwiXlzI2rD2iD++p?=
 =?us-ascii?Q?+q30CxEzZY9ENczeUUpaww45+X4ZVbzi9Qv9XCTmCAMuUfASF/k0taUL+XBQ?=
 =?us-ascii?Q?602V8KsqwtaU0gEfG1p1TfLYr2S+2mR/qVLuhSeKXL0uvyJGS1KVxGSPAUlh?=
 =?us-ascii?Q?+NVtL1algGr1NGotVqgQprh6nKDcF2YSyA8LEHaufmeh6gIyB6BjH7dYZDeg?=
 =?us-ascii?Q?k36ehMVF+02Bd5qAqJoW/prVsK1MzonOw3Ed3R/T0QYDMPZcIb2IAKKaRqjh?=
 =?us-ascii?Q?l2LYgnwwWu09EV7vp8n8qrcgRHLUCa7Vy6LZKWRprmdTuWT5vxPBKgpfU9fC?=
 =?us-ascii?Q?hEp8flyj/TWzmbqqKKxtkDhqxnc9yTfdbj/UTiOdE/pY5pajnWwkH1Rd7rYk?=
 =?us-ascii?Q?porYQ9Efck3ZeZXl57RipheUIU2WwoQhgN5PqxbNt2B2OKwC16v8VK/gXZan?=
 =?us-ascii?Q?qJQV4q8JD08zLbJHr2r9a/ilLvi8S6o7fXf37KrGKYZiXhP8DmKHoxr5PHjg?=
 =?us-ascii?Q?8S7VeTbFzQhQ/qDTvFNxxMWI4N5NsR+U2oHYgut0+7Xzt2rSHw3q8CxXkA61?=
 =?us-ascii?Q?rk243TeHdDnp7jUO1jiiT2n5yZ0ROfx2t1it/Lxfxx/o9WPyyIQ8FrWhEDV7?=
 =?us-ascii?Q?t66RLITaE09rQulPDbGPW7kbjD+lXLIr6N0eJcFhhuBu2PTOCUnE2Xosi0W4?=
 =?us-ascii?Q?ewLbOjJi7VEwFQx4dUlYgoBo/d+COE75WxFbohKDYytjaPyISL0FJl+ZdHsd?=
 =?us-ascii?Q?R7QU+19tJ2mhEJS/lq+4QaBPF5b2EvPtpWVqIyccu+6SWYiWr+H60wMq8lrj?=
 =?us-ascii?Q?6q/3yv6n2QKB4ErZ23BIxKJm4YRRb0BffDBHGXbxUgtRAkKY5SEvCEeShZ88?=
 =?us-ascii?Q?2uo8AbPOuYWWsInundcYnP7jwVyCYuLUoyJ65RlkJ1lDCZemv9v+42lY9yCU?=
 =?us-ascii?Q?u6z1nHo89GCloabxxXc4M+VHOGuHJENV/NU36AKwr2q6B++QgZAblU3H+wDO?=
 =?us-ascii?Q?/lGFTvsvKFubfcPa717j6YwqjJAamhxa2S0aZgS42/i2g9NwUAbmJMsjO2uC?=
 =?us-ascii?Q?ZHFxuDc9aOcjaRt0XcVf+ODl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06985e79-7024-4a8f-4a20-08d8ff111477
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:49.6889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5Yapaky+EbBNH8D6LDGaP3J8AJN+Q5w+x/PzJ9vqN9+VEM4GE/QPhnVQ9RGijXt6bPq3VO3BbDs5uGSFmmEVA==
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
