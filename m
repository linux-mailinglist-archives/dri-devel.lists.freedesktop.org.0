Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF113676D6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921DF6EA21;
	Thu, 22 Apr 2021 01:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DF06E135;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWA//eHX+eZukdUUR04e4BRZwreZU2jrX/CAYl1zpp/FkxCzkACg5LqCq7xC7Ow4Yojh1uDkf8IpBCl8iuziJWUlzwiKT1i89SqzjMvKQk3aPIOZz+Nw0urgYR/2Uysn5pKJaHeiqGqdyf4jm0+KHF2H/L4AZdasi93r+lASKqTd11cS2UaGquLoePkUruZ+1ffRAg3+Q9XxGjBb0SKjreQiJkB11BazP0YmvYMNtJBV0GY7ZvfZrQ5glW8L2PdQ9L5UauEydmmtF8auBqvPWweVTFZpys92xDtmkKD6jRfNX8tqK66SoCS3cw7LFym77W3bLfUruWlFVsdSp5w43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+aNnSE7j41FV5zInva4P9RYXfntrXBFV/m7CzWUFBw=;
 b=iQATpMCuWev6vpT9NibAqMHAhY98YpTtfN563NATJf6ymEQ7juircTQkEySE4JShTlIx+5yUiFp0xKVuHThsknQsg/2GMcWy7CuCLU17dNEplyKzcBBPgLUptQDykbvZbKbCJCwCQUS7s7af6KKAu9xNQKxP0Z8VUuUu7aacNKaE6K2JJfbxlyaGB2lWhnMlQCTrN/fdsivfRb0Ds6eXmK+baZ/zj4jlfLVSxtCHk/N3dPO1L3U5kd9xUkqlGRiYYlOqqfdy3SWJy6UkUVYxX0UMZbplREWrrr5XFrET1oBQX8BnuMVYzgMR4KAWx/+WnJH3A22XjtQSMLcnBNnzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+aNnSE7j41FV5zInva4P9RYXfntrXBFV/m7CzWUFBw=;
 b=T4a5mGYe6ZXF7U2lt4Hupwceui2aP5nMK37jizrl3UyERahcuZCm2Osqz00afmryZ9c5H5gBUCTs6ZD+euR4Kx2de12y+LvIJv5wrIJbacSl3+NdgZ3/FZrSeCF1EWm3A/xHUN5gG6iN8+HHGlza913AcEFOeIZZs/MnIFDuK6E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:16 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/10] drm/amdgpu: Simplify AQL queue mapping
Date: Wed, 21 Apr 2021 21:30:52 -0400
Message-Id: <20210422013058.6305-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9a9e45f-eebd-4c6d-9bde-08d9052e52bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438C7CB02DFFCFE16426E5A92469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/hG2PlrbaaxRB2ivcaRg7qh5a5vN0iQPRds9v8mOBwk9Uh+JquxkmbOI7v7M8oXq8QQ+gQIIbbnZ0DwxMT1zPYJTlPMfNxH1J47O+V0Skrxz2lIQN2oWuHvZRD65GCsN/CV4PxKSSoN5lQIIuNFXQslcxpomfIquXn4PNiDUIHfxqjnB1exUWffO9aM6lGAteNeYuZ0tPfDblq7VM6EeQQswr6S8LVwNs/uukbQYVxmm2DF82lRGS0nhnj5U4+6kJAMnXwLjVQ30pPwvRDrI9NJHkhR3zJc88gGoyXssyouD4SQ2UcopdaADKxkCR8RPJZHTyy/E9/Eov0s3xJuYEkFcoSSRcp1mWCJBk/ljZlmchtGjgE0uHpnOkRiGZjMIUIy1tBERcq+JEqmGkPcjPKtqS6pt5oqjuVw9ieWyAAcxdYYaBAgcGorILKUTiTQ+0NwnluRUzgJvklrdv3YIbcVoL3/lmGfDSe08jVzGO1oVqHQE64c4KVrxeNrmE7nSbtBgG8z1Ru1inwWce/5GDlFNsV6xtwFgT+UEsHcYWZcB/A/4fw7mHHgd8Fe7Vgky4H0c15BzLQCwENuiGxvi7Dqeo0MY/NElGdydorb4lT46oXzyLPo53s5khom9yzAnLBoZzB6uM5xaixZXkR/enw7cpJLvAjigv3Pko/xOO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bY8Kc9rodm0m+J1sHZVqmvUybZnmw1ZSU8thXT1sO8MfuA0p2CWmgR1CrDZg?=
 =?us-ascii?Q?svjqWwGX0P6dU9OwBDJFeXoKwmAMR9wJutEgkSgmLF6uTCpqs85t3oEdccsF?=
 =?us-ascii?Q?sfsRl7JpfVIiODRy84OWmU3gOUY0s5/V5RNPLSmCTrrQoKdxHtX5Wj3Zaws7?=
 =?us-ascii?Q?mjguei0N6DUihwzefYQd4Uxn4LnBo4317XRm1ZhahHzgqjIUlE4Rgj1l6LF1?=
 =?us-ascii?Q?eG3bgC33s4HD/lUaipHK90uu/EUhqUYkTgRUwt/9NOwdAMBPnhg7L9s3wyXa?=
 =?us-ascii?Q?cqidVQIbol0EZWyNJADs/snD3b5ZxbRt8KJP5XvAGilTYjzqAKKGBYAMJbiv?=
 =?us-ascii?Q?o2FPtoEUBf04La3GLmtv8QaGE5dCyUED3XEozyevClvSEYIxDLrB7x/ch2IY?=
 =?us-ascii?Q?bdq+VFOdYCGAHdnTzTFCSTteOe7Q9SiFgNC/zW3vw9MLphipFK3rQQKTRZpg?=
 =?us-ascii?Q?GZocbxUPwCxekM7kLU5HjGmyTZ5vURgpGyQwl3NCSudTtotPhJnF6YE7fI09?=
 =?us-ascii?Q?fMnCx0EPAOn9Xvb+wEtTyoySY24r5maxWMdo05SouVcVJYtRz+XHDWaelDfe?=
 =?us-ascii?Q?CosuwiBKWRh8pHgJM39SzOBUJBUt1b4LyrBBrmQO1JakiodVm5pMsxdafR5F?=
 =?us-ascii?Q?wT3Zk+xxV3siiYUKDGnhdyos0dkQkDufrL8QlaEl5lHKw4xBGrRzdocd+8jk?=
 =?us-ascii?Q?LyDUepNvT8ifAAVUXvVtoAxdMqtVMHaOICShWVF0ExlZVEpzLxztJQONqfgj?=
 =?us-ascii?Q?CCGtRs8dcUgM4nDkug3Gk7Si/carrZHbUZt2PzYgielerWq4VW3wvzc7UxpB?=
 =?us-ascii?Q?pDlWXHcSFElkjWW/IvF0iuQCyBhLud6GbnaoZzivokQPGCMuYG2o0I07zcQw?=
 =?us-ascii?Q?xnH5jPK2Co7GaZPSgOUVtyY4dOOBKGtZRB2ZwyL9Hmf7ZDDUYZOHt2gLoVbB?=
 =?us-ascii?Q?SCu+rM5lh5eIMrGdx/E8Od4PFw+HVaIKWAHCp0VgS7OxlUvNZw0n0zYHi3jT?=
 =?us-ascii?Q?5gP3YNy//cU0XEEcV6WuIFhL73OxSxXfVVE9Zz6qsGdGS/uh0stkRVQ/k4P+?=
 =?us-ascii?Q?fpElSzTsoMhtq/gjcfSI5PPleyeCE04vRQA/JVHSUA7mPiMcbm6TuDuOufTm?=
 =?us-ascii?Q?z+UMYv5mDKE941UiBRdnnhKGGlrBv7YWtXR6znv4+5FQdUc1QsWYWHNDi9iN?=
 =?us-ascii?Q?dFouEHMtF1CSjvzIAXfM7QSrH5tLdIaEyZ2Ms0vFDPB2uHwj6D8vCBG6Au2/?=
 =?us-ascii?Q?PN5u6HAs1g7WWpCaSdANULQvtl6r+g8sexm7UxQYeu24h4wMA7Ubx0CjNM4E?=
 =?us-ascii?Q?TyRbT/cPpXGjgz2bsy/GNxXL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a9e45f-eebd-4c6d-9bde-08d9052e52bd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:16.5881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/cEdNRS59xVwpVqnJd3DUKeVyz7AJGLNmk+JKn1mWCGguFbKd1ffO4bis41zz9tQwb/3WAZEfzyIF9Q6WWRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
index 34c9a2d0028e..fbd7e786b54e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -486,70 +486,76 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
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
 
@@ -1382,8 +1388,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	uint32_t domain;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
-	struct kfd_mem_attachment *attachment = NULL;
-	struct kfd_mem_attachment *attachment_aql = NULL;
 	unsigned long bo_size;
 	bool is_invalid_userptr = false;
 
@@ -1433,15 +1437,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
@@ -1496,11 +1494,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
