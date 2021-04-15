Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BA35FF60
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F4B6E9C4;
	Thu, 15 Apr 2021 01:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D476E9A0;
 Thu, 15 Apr 2021 01:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdUiPy2xgqq1Mgt5Dd3VP+Zq+45+VbMlKujBbpcgmub+swTRarjaHIk9ua0Wq5FSVTnZMyusx6U/5PVn2xcJ/k8FN/PVvCucQwPGFbWfBbI9u3LSlir3/xHtoOk4upXERmK7NEG15yFaxSWQL19JUJXH89swd34Mu3cleWz1Tzr3oOxd20scszw3SBFMl4OeLiB8PHM2khGu2JQdZKmVLWtADhJPGVToSkqi6jQhQOT9WWZCvpSEbxWVLiwDsnZfOyKSkI6smJBypLQaPH/zaI2aENDkX+0wmBOFQeU78OskDjYdt28Yoi7L+GJAOIjaep9OQhO7hjj0ea9eCWwVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD1WKI2+oKQ/x35ndjOhtShRxKxKVXmWnWWGdvFjxFI=;
 b=HdsJILR+8vHnwrt291ehKytRnecVmlKQcLm0zifbeXwiN7fbksapJyyiFE3uVsMIgUUb55oIHPm0xrGl8sNJuLz3V0OV8/X9HPkqcNGMnQttNyG6VwSDqWQpDTztAPy9Nz0pgdVuNdz/J4JDp5cFneOuBXMT5WoQyPcl3S2xG26IUXiEKEzFcGiGROYru3UWkEFCUVPGt0NEZmJNkjezl1HKh+HP3kt5eRODEN0F2Qx5ae9l0mBYQQ5/D3QhFF2/aARJE/kSz0opn8j7dehxjWVzRPws0ZXHWRJTTY0G9NKJHUcsFxuhNFK/D5EDgW8bbadOyF9hp7BsjM0AGpwIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD1WKI2+oKQ/x35ndjOhtShRxKxKVXmWnWWGdvFjxFI=;
 b=aCUcac1DNzkTpT24fVLwB9ZjfTFpJC3xCyr0YYoN4I6fPxgpr/XJWOTuWUQwlvhTOBlo84C2l94GsTAiiT4Zxdpc1KUtt7vJW2NHfmzXApzlsckW8R7QdbQp1afw3vNNSFDOzVYm0ZVEWbr0qY5R7N1X3ABxXwhpNTQuBmI7qDM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/34] drm/amdkfd: support xgmi same hive mapping
Date: Wed, 14 Apr 2021 21:23:20 -0400
Message-Id: <20210415012337.1755-18-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94105e75-d44f-4c2f-e7c6-08d8ffad2750
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420804F3827BD3EE317F62DC924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E9udKLlAzGMbfDU3XrHLmGQVI5RbVUmH5FInAeON97utPHgYqkOPgoWP3U6dnrfqvGJNx6CFv1H44M2FhTmKl+P5KOQ34tAFevW9rS5qeJ75Pr7YAUyVKgRXFSCpiEoivKozdDmvJDalzZ+hGnsA4jQqB7nNysNieFVo7UxufRsxjxHaNy9g6dd34jq6oO0uMC442iN9y+1VSJZFTVYLtkImByJeLAHCB2B/qH88Gfe6jhIusS2TZghX6n58kd+HdlJQbQa+n4XrSxdu56MvkQeOGxk7JgaTGcSYTRn7mjpq2BaQTtXs/wmhs9+aR4AUiqeUPObywRu8mXQsi3gVZnlXTKpbVjHFi21ev5wsndnZOQdGsw3WG5Bdo1LBfv9AEJvmnNYmLe0vEzY0bWCeeCnkI4CvbOZhXFnvdTxbs6fXfiRYctAvzOdOU/7xfAj3ViteABgHMv4Fc5h3JqFCOUFu9KzOy9MiFEL9C2csRB2D43miFcCE+y5f22umdqoao+3qv1JmO2/sNK8fluGCBZftoVAhA/uG9jMTTHyXznTG1QrznyIO3yyOf96AqrRdr8WqvN+0M138Dqy/Kv6cXPGprsQSuT0jMHxPA2clPTwHSYhqKIUJBfEDYglCtIAaaSCvGsCCvg+f28SqXNxTYnURVWkmuZYLhCO4yc0Xz1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Ndv2YGmyrZ+WpWygONDo1WoGgUlNOnQe62vpTHg6qSgEBZwJYd8QT6Q++f8?=
 =?us-ascii?Q?cGPjkUI/WpmlUIzvk9fJ6WKS0QKc8MYXSdZwfpnb2r1jbH5L7nYBTTIBMV+t?=
 =?us-ascii?Q?EMPM68r0oGHT/pwkfbkOittcNfNCMMFFkkogQiWGJY7+FfLMvmda5ntvetGq?=
 =?us-ascii?Q?/BEa582t4J2649FS30jltGHSo+BawlycV7d25+CiqV/iRBToZq0LLtbGdvn2?=
 =?us-ascii?Q?sdCe7vLU+nlMSVfr5aU394bcSOI5RvPGNjmbbEf/YhkrbtlEg7A4B8cNLo+3?=
 =?us-ascii?Q?FQufvq32rfjkkdfcp4WQmRlj1nXUB/0EZoBu4EpYjZg2ITTHOG+fydP8vHR1?=
 =?us-ascii?Q?XkQCTLALFQLubV1G06REMZlNUS4N7LISZOycwdjrCVSET3moEMAkVhzkdNd8?=
 =?us-ascii?Q?l3KXCLc+035GAKxQAyBB11m/Kc7zcJqQmdEhj2H/z9niNhPkg3xW+g/Lxp4K?=
 =?us-ascii?Q?IvoZl2frxcS1l/pF+MAsATUnO8quY0ujIa909yGiJ8KLP5Bqpj87OPA0MppB?=
 =?us-ascii?Q?VlStis4N14j73C5YaSlcy4VEi6Sl6EeyLvRVya31qb+gf+MHrUgDG+K7WVuL?=
 =?us-ascii?Q?4N/6Vyf9Xsvm0VwS1vBsRpl/fOJYHIwd9lcgmTJdjLdvy11O39UK3beKZf/p?=
 =?us-ascii?Q?ecFp8/cG6Mv2jBCX4/EYciZpdy8OOqd9yiH+LLF6aHpYIxthhB6baEpl0cML?=
 =?us-ascii?Q?LJ/mDiUEeY67PDPTF7S41x3wJNe+aIaD5CX68zCbvAnyKzT0WS7C7HgZAkbH?=
 =?us-ascii?Q?9eGUGdaqt9dnJY8iiGIvf88HHaFkzXU17dyUYbGOyysvsTSOb8MpxEl9F7fW?=
 =?us-ascii?Q?btbtWi60gSojB5Li3RXlj8OTf40MswI7L2Tre6rDKfmYeXzemEuqs1N1T/dQ?=
 =?us-ascii?Q?z3GfxyMslfGNIC78LnZQqLxmF7k+s0UAc+zcoNVo+Q/DHw84ytlgRn8KQJPV?=
 =?us-ascii?Q?cOyiIvb8ZStchkwk7QiqTHWZcibzwKTwVFN16m9IBK75u3FYx6aOZcraEWTX?=
 =?us-ascii?Q?sctfIvkSDopKoirvZknO048GWzVk1MOoH67r2sLxeBEGK5zLuUPPBaOA+x2V?=
 =?us-ascii?Q?buJLdUUAl41INq/Stz8+KuH61bxSMcTBCk7g+gGO9EgYq6lxEI/gYNBrTRUW?=
 =?us-ascii?Q?9yMqSC6j8B8IDdlxPNkqrshxAzZrPds/slnPt8oQFL737DxcVizj6HoNnYV2?=
 =?us-ascii?Q?PViwWDS3xA8w/qJsP/pK668efRIwv/VX8Jp8DaZc9JcZFNh5BBhOdv7OdKi9?=
 =?us-ascii?Q?4sPHufbbVhlQttYXf1yV1w/eKwIk6GEZpAfSZ0QW6HqE2+7AGLsFdtth/308?=
 =?us-ascii?Q?88n8qFo+PvJrMlVljIw8D2Yl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94105e75-d44f-4c2f-e7c6-08d8ffad2750
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:02.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rhFiZ55UcdzZMgYJx6uBm7d2D5Kl9VNdCx6+EpK+BKFk+RmcrusxDp3oyTSuKu+aJp5TLyr1ukFP3lc9DHdkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

amdgpu_gmc_get_vm_pte use bo_va->is_xgmi same hive information to set
pte flags to update GPU mapping. Add local structure variable bo_va, and
update bo_va.is_xgmi, pass it to mapping->bo_va while mapping to GPU.

Assuming xgmi pstate is hi after boot.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 94 ++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b12eb00018d0..c874cf025743 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -27,6 +27,8 @@
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_mn.h"
+#include "amdgpu.h"
+#include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
@@ -859,35 +861,70 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 static uint64_t
 svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 {
+	struct amdgpu_device *bo_adev;
 	uint32_t flags = prange->flags;
-	uint32_t mapping_flags;
+	uint32_t mapping_flags = 0;
 	uint64_t pte_flags;
+	bool snoop = !prange->ttm_res;
+	bool coherent = flags & KFD_IOCTL_SVM_FLAG_COHERENT;
+
+	if (prange->svm_bo && prange->ttm_res)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+
+	switch (adev->asic_type) {
+	case CHIP_ARCTURUS:
+		if (prange->svm_bo && prange->ttm_res) {
+			if (bo_adev == adev) {
+				mapping_flags |= coherent ?
+					AMDGPU_VM_MTYPE_CC : AMDGPU_VM_MTYPE_RW;
+			} else {
+				mapping_flags |= AMDGPU_VM_MTYPE_UC;
+				if (amdgpu_xgmi_same_hive(adev, bo_adev))
+					snoop = true;
+			}
+		} else {
+			mapping_flags |= coherent ?
+				AMDGPU_VM_MTYPE_UC : AMDGPU_VM_MTYPE_NC;
+		}
+		break;
+	case CHIP_ALDEBARAN:
+		if (prange->svm_bo && prange->ttm_res) {
+			if (bo_adev == adev) {
+				mapping_flags |= coherent ?
+					AMDGPU_VM_MTYPE_CC : AMDGPU_VM_MTYPE_RW;
+				if (adev->gmc.xgmi.connected_to_cpu)
+					snoop = true;
+			} else {
+				mapping_flags |= AMDGPU_VM_MTYPE_UC;
+				if (amdgpu_xgmi_same_hive(adev, bo_adev))
+					snoop = true;
+			}
+		} else {
+			mapping_flags |= coherent ?
+				AMDGPU_VM_MTYPE_UC : AMDGPU_VM_MTYPE_NC;
+		}
+		break;
+	default:
+		mapping_flags |= coherent ?
+			AMDGPU_VM_MTYPE_UC : AMDGPU_VM_MTYPE_NC;
+	}
 
-	pte_flags = AMDGPU_PTE_VALID;
-	if (!prange->ttm_res)
-		pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
-
-	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
+	mapping_flags |= AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
 
 	if (flags & KFD_IOCTL_SVM_FLAG_GPU_RO)
 		mapping_flags &= ~AMDGPU_VM_PAGE_WRITEABLE;
 	if (flags & KFD_IOCTL_SVM_FLAG_GPU_EXEC)
 		mapping_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
-	if (flags & KFD_IOCTL_SVM_FLAG_COHERENT)
-		mapping_flags |= AMDGPU_VM_MTYPE_UC;
-	else
-		mapping_flags |= AMDGPU_VM_MTYPE_NC;
 
-	/* TODO: add CHIP_ARCTURUS new flags for vram mapping */
+	pte_flags = AMDGPU_PTE_VALID;
+	pte_flags |= prange->ttm_res ? 0 : AMDGPU_PTE_SYSTEM;
+	pte_flags |= snoop ? AMDGPU_PTE_SNOOPED : 0;
 
 	pte_flags |= amdgpu_gem_va_map_flags(adev, mapping_flags);
 
-	/* Apply ASIC specific mapping flags */
-	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
-
-	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d PTE flags 0x%llx\n",
+	pr_debug("svms 0x%p [0x%lx 0x%lx] vram %d PTE 0x%llx mapping 0x%x\n",
 		 prange->svms, prange->start, prange->last,
-		 prange->ttm_res ? 1:0, pte_flags);
+		 prange->ttm_res ? 1:0, pte_flags, mapping_flags);
 
 	return pte_flags;
 }
@@ -953,20 +990,26 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 static int
 svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, dma_addr_t *dma_addr,
-		     struct dma_fence **fence)
+		     struct amdgpu_device *bo_adev, struct dma_fence **fence)
 {
+	struct amdgpu_bo_va bo_va;
 	uint64_t pte_flags;
 	int r = 0;
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
 		 prange->last);
 
+	if (prange->svm_bo && prange->ttm_res) {
+		bo_va.is_xgmi = amdgpu_xgmi_same_hive(adev, bo_adev);
+		prange->mapping.bo_va = &bo_va;
+	}
+
 	prange->mapping.start = prange->start;
 	prange->mapping.last = prange->last;
 	prange->mapping.offset = prange->offset;
 	pte_flags = svm_range_get_pte_flags(adev, prange);
 
-	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+	r = amdgpu_vm_bo_update_mapping(adev, bo_adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
 					prange->mapping.offset,
@@ -989,6 +1032,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 out:
+	prange->mapping.bo_va = NULL;
 	return r;
 }
 
@@ -996,12 +1040,18 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 				 unsigned long *bitmap, bool wait)
 {
 	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
 	struct dma_fence *fence = NULL;
 	uint32_t gpuidx;
 	int r = 0;
 
+	if (prange->svm_bo && prange->ttm_res)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
 	p = container_of(prange->svms, struct kfd_process, svms);
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
@@ -1015,8 +1065,14 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 		if (IS_ERR(pdd))
 			return -EINVAL;
 
+		if (bo_adev && adev != bo_adev &&
+		    !amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			pr_debug("cannot map to device idx %d\n", gpuidx);
+			continue;
+		}
+
 		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
-					 prange->dma_addr[gpuidx],
+					 prange->dma_addr[gpuidx], bo_adev,
 					 wait ? &fence : NULL);
 		if (r)
 			break;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
