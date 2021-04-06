Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08E6354A79
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C406E53C;
	Tue,  6 Apr 2021 01:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206466E245;
 Tue,  6 Apr 2021 01:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip3p8HqP0oTMl+Q0KDYR2HAdKt5EKKCg+zlEGFxbDVGG922Bc4iAny68uRqooYF3JVJLgAM4qHb3fNza83I0IrRiPGEyryX/bZ4LN4E3wmciLOYdxZUcxqQJ7fNTdxhrW6lpvFVbw3/LauGsCck2EiGF1f2/O/U1EWOhf1+Wyjq+6cjXVcGwcYaAKS/8wFl5CoC+pG5jdz4JJORfPyIjGHmewIup4iG0otU/6Hy5tlK7yQWxmOyQs3le4uSsvXq0v1qOht9zgZiBsm58Ip+p+yQjVLwGwaUtkLvb/r1Z9K1zkybiqoHMYDgkHf+14/UqM/gzD8lon7A0oGELr19uog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/SLCQItJtX+utOGoNRRPIc/9u3SmQEVYteXzPtXuHc=;
 b=lnRGwutz0+pEz+pHHttIPKeCKdVaD96xH/08AYfrUtpX2TEzRMXQb/gilfwBM7yl/kjqQcNzlHMyHjZ2SiojT6yhdkejMpNEQvQVH+CiF3HhxJPqFLDp/72VSi0CHRHjynPKfqCrmW46pTFBOkbumjA1YwVzoGfp1SMEd/o0io55Ma9MfFxOBaCkRNQCf/unz8jkNbpRlzuBIlhIP+sQZX039sDyD7ZaF8MAvyQcC3QPCnxfjZ6YsHGoChJrKyI1o/pI2ixX53/TvgWKAgWRxBb8XNTI58bjNVFcDqlamfjyue7XSIWHdvrgiiwFV635mxn9HGaty3UTKe3buOc3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/SLCQItJtX+utOGoNRRPIc/9u3SmQEVYteXzPtXuHc=;
 b=T/DvY7cS3N1fehL/iyZTGHRlq8EvzInV5Q2+A2lOWoQE+/wCjyuzy7qWXTDkpPxo1merZdQb2Sj2CngOkzOc5c1LtMukdEshOT5eXNwk1fKpLS/3QbD4if8lV3RHmaCnNAEZmA71rYM8YVT92/4gkzbEE6cyeTF1fPlSZyzhQKk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/34] drm/amdkfd: support xgmi same hive mapping
Date: Mon,  5 Apr 2021 21:46:12 -0400
Message-Id: <20210406014629.25141-18-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 370476c8-61a2-4a3c-00e8-08d8f89de076
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37925829103C479501E3483892769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxcRbH/knjBDB0nqovb5GJxo33eWH0u7jhhD65EY0/gmFXYFAiErWSg9/2VNOPvsQo+SkzUdjYeCrneGA9ku8HSNswfognQyNGAUfCV+Uxne9svpmvAhmQM+gizxbyMRJWftI16VDPKL1F4n6CMP9CT0I3X7tXjWqaeKa4Ps+5DyPsbRh7mvNTIQdvJ/dE2nFruZQ9k5htrjNQVueejGZOLxf8yPr77zCZXDlgSiezXp9Q3MBSu3erjFCWC+EuqS6g12I96EJzW7/WRkx4VI4+RBOSZr6nOmOrWTcUiSTCoPqCaTuk7dOzoGWWORrBP7SwsZ+hmDzfRu0wzEcubarS5gKZH422b5l4f1EvzYDJCe8cI20SRqWD69Yb7pceDXGkEb6/V5aB5dPdk8mVNwALXHbWOtfc6VuKnxXV4FEzgNhm1DOMBkiywGsC3/z/w9tY7Vxz1mT+DpMEu6A2UggV0t0HP8DbxrV2HDye6hP4KcTEDx/6Mc1q4Xvd1KYVo0uRunquIRz+yy+XJR6F0W69oBePJZzoE2SdrVuzQqBWKDWjUTGJa3vkrnuCrgNIVyXQy0kPhWcuac3mkz848DD3iqxwsl7A8p/UFN8ycy8kyNFpDA6fjz3FCDd5Qq8RgXxYjjHIC243u/ZnnmF53QlKNEY/XeTvH965EkzZ6apgp05O74SbazkHo0X3VXusfm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E1E7Z3AC5vhosAG3w82zk3P+oYvWQfReDIwmvMZ8bo1V5Cn1rOIoQ11UA1Hz?=
 =?us-ascii?Q?rMiHylOrdPMEuz4GWZ90FrqbblgHwaufxAV/YynyrsNCUg27OhIEE8EovGEk?=
 =?us-ascii?Q?KSivLipelTsnSf33CVRq+B3ZlNnDDyoU6e3bsE42pw4Pn+xHHUovZaPJ41ji?=
 =?us-ascii?Q?K8VWV/cZgeC8VbhjOq3BVZHKC5Y6vlPzCESzZQV4nOVE/vTyzH8fGgW7T+IC?=
 =?us-ascii?Q?+Us/JvgxHAfW8U73Yqwdoi5U+H+Dh949j2jgXX1dIgCtg6I9lENzi6X5MI8m?=
 =?us-ascii?Q?hian5p/9K4qCNwu9nen+WJrhhG7MTw+T7SH7r+FzSkZ44j0FO0D2OqpaJ+ik?=
 =?us-ascii?Q?8g4lXNaMqoePh+ILZ8abdNyQt7qDJOMBHk2UjKPfe7BSGj6BP6H6GpqvXe+g?=
 =?us-ascii?Q?cbA5s7aw6MbyOrwza/lHYjubtd7lJNkRFO23pQ4SwB7PpNtt2y6/meWpYM6d?=
 =?us-ascii?Q?KnMf4Uh7wb4NpEs+9KijdvkTIyIZ9726UPbe6HuqEBQ/QbMaCum+2O7/alkN?=
 =?us-ascii?Q?MqJzd9U9HE2FTFBQr2s1M2h0mtWgkx7MugWQsRKrYI6GwCXEfIy1zF/ZdT5X?=
 =?us-ascii?Q?9qRkh0vz7DLPtHrEw2Q5BGTpgxJoFpz40NspnqopcIdVzd+Bfa8TN1vQ+VPr?=
 =?us-ascii?Q?RFDHe+TZQc0CMu7C3rPUiCsdBhqL4FiW5Bcn78jCw3zXNXCMjOPAHsmD5+M4?=
 =?us-ascii?Q?kDslknRN3emOUcko1LCVyOv9UTvtdNOcTDHwyGJVhIsWomgUEmXLhPaJt6cp?=
 =?us-ascii?Q?ei8mbPMTxVdZD3baHuZsvXXF1rgS2aiAkxZy8iCfwLGnPbk8uk9nx55EorJq?=
 =?us-ascii?Q?WiQ8fEoxWsDn5GE/NAQn6hxzIXUl4tfGbEGXLDsVDeXZLq8SpcP5AhhZqX5Q?=
 =?us-ascii?Q?x/WGJxHMB7LFfyuB1yJV5ONOXIZqpZT1cdso6G6fDdSMceKX+eRca44JSeCR?=
 =?us-ascii?Q?wqaa2hfWtm3NW73Q7fJbZ/db8RpNwGU0WFtivuJq9fG2UBhZfIcy6/V+oylH?=
 =?us-ascii?Q?1t03+sg8pCYtHRN976Q1nWErOCkMRN5iUMAm/JZp396xpZrqd5xIIfw5jx5u?=
 =?us-ascii?Q?7pkGfvqHA81AWHQOAWO3ILn8wILyhXFX+M+t3kyZTBAd7+aLwwB5/PZHd/hs?=
 =?us-ascii?Q?6+xhEtdkcCcDuQE3lF2yfX7w30d1ZIXNa6t1cWV8zZ6JbO7t5aVuqwqFCtdz?=
 =?us-ascii?Q?VVPRS3CB9eJiZhqXTLxmQ/4mADzsf9AtWXWyiYtKBX4dEEued6JzLvlb00KX?=
 =?us-ascii?Q?n3QsLnkFxwmDTxuHx2G+vz/hJwXOWB0Fnt9lzwrPEGB8eHnd6u+taOKDFlah?=
 =?us-ascii?Q?kW5EwAo9VESq+X+5y2MtAGxY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370476c8-61a2-4a3c-00e8-08d8f89de076
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:03.4041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohju8VOK0qnUOD/Ve1iljEwi8p4U9pNyBZMBudYQW8PXZ9mCX2OjnGsxCoFXJ2NjK08oAwBUDZWqmQnsqAjllQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 97 ++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f21988eaf322..d903e003ac9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -26,6 +26,8 @@
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_mn.h"
+#include "amdgpu.h"
+#include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
@@ -860,35 +862,73 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
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
+				mapping_flags |= AMDGPU_VM_MTYPE_RW;
+				if (adev->gmc.xgmi.connected_to_cpu)
+					snoop = true;
+			} else {
+				mapping_flags |= AMDGPU_VM_MTYPE_NC;
+				if (amdgpu_xgmi_same_hive(adev, bo_adev))
+					snoop = true;
+			}
+		} else {
+			if (adev->gmc.xgmi.connected_to_cpu)
+				/* system memory uses NC on A+A */
+				mapping_flags |= AMDGPU_VM_MTYPE_NC;
+			else
+				mapping_flags |= coherent ?
+					AMDGPU_VM_MTYPE_UC : AMDGPU_VM_MTYPE_NC;
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
@@ -954,20 +994,26 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
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
@@ -990,6 +1036,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 out:
+	prange->mapping.bo_va = NULL;
 	return r;
 }
 
@@ -997,12 +1044,18 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
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
@@ -1016,8 +1069,14 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
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
