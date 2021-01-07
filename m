Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA002EC8A3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585126E42C;
	Thu,  7 Jan 2021 03:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153696E40F;
 Thu,  7 Jan 2021 03:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLCXR+CvQhk3LgtG01rJpMr2spdmjM4g7nUpcwf8asbgUrHo8FdczAa440SaPXd7BFdoCmjK36rJzihMn3zjWbm2/CQ0LOVgIXbtNZeu4cTKFj7drL7wghuK5+V7m8xPZexDlG0+9o7g1WVdNyWZgeMx7+y1/RC5Ayx9QOwzbn7QQbjoo3GzQRUuGNRxjAF2PYFJlvMjlDLQVFm7pDgLgdxtwSyETc5Y9+l3TIZ+IkLozpJ9ecpKustx+z4BANfVK1pi3PbRmR26/Q5ahu/6djPotR/QmISWcUSpRqltMinDWZwC45duKe3M3rKMrE1SSJn8goc8Q6+J/ma1C/pKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZcfIpQKJ+hYUVoNSsn54sxdZTAf3j5Mq0xxGRgsK/g=;
 b=ZkXxOVKKsYO1F8znrxbERgQymDh+U2wSDrRkKNJyScafSkvWo7ZbVffNQL0Af1ORWqeXABRRHp3bTso9fr+dvWQuwu6dXlN8NMStNCduwt0ajwDVY+J8X8B72O3TmcGqr5dtSDtmZnLPFBBfQFQQ/MISfm79duBxzrZ/N5Sd4pQMuHgIZOEJOITgYlF22eG7M8CnePTYda9E2PA912be2mDbNwlk6lLcRxwebmZ+vrFaui0W69PJft7xC/XFHfvAI9KJqkBbL3Mp0pdGcsUz90sOAIh7SwOOzrHUWH/QZsyRD8QvgWDKsm5SeCg5okU3RsHl/tPfnIgKpq2v5+k9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZcfIpQKJ+hYUVoNSsn54sxdZTAf3j5Mq0xxGRgsK/g=;
 b=tRKzdoQrBe2STtwu9xH0UxpNcvqJZeOZeLW/6PTvRjPCLkbDexK2jf4uQW0/Zpes8Vt4Ex6Bo8TC94jq5thg+HxeQPaqt7ujLed3fhV+F4UFGj5K69JtbqLjVIWQl7k0AN7ZPbV9sJ77PDB3uO6wC97yNHJrew883It38zws/Ng=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:55 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:55 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/35] drm/amdkfd: map svm range to GPUs
Date: Wed,  6 Jan 2021 22:01:05 -0500
Message-Id: <20210107030127.20393-14-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: edafc596-481e-40fb-047b-08d8b2b8bb37
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999CDBAF122C5642E11249192AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SbRMS+6JhzEtHWzhtpNVTM/05nzLDKBn0ohG7iWjj2q7GtnMW5IKws6FHG83XY+m3tZHPSTH541SxitzR7rZ07xtewS5kic8LHAT2dEnu9ESqXFWNctiqA7y66boB8e+cHs1SddTdul2PFQuls+r1hVmvCnzNYNiKw/Fgr+js88rhceF7zXlUCtCbOB3zqQPFnL0HuwEvgWChUsZ0CJ58xsrJ9BTqnET7C847IbDzG0lO52o6gtSnKWdvhYYTAKjUqMAbmvEy7XmBRViH6d8y8AXZm79dMX15k8LSzGZ2NJXlsMsPX2G1sBGs4eEDPCBgBS49oeVDZb/nQEYATUH9NQag3NDhvaJ4+Hvpe4DJGvHZMbm1z4rPRpudJtLI1yK8ty1aBHt+oykAAoEeivI5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?icRG+LqpSCDQh30Ss3VHfEzIyCWRCEzUQCVC/A0fzeW+ZEVYrTnOSL5hwCKi?=
 =?us-ascii?Q?3349+10wHp2yO7okVfm+8icMKDHtpAViymfd3OhiwnqL4g6z4MNvIpkBnNb5?=
 =?us-ascii?Q?guORquspZkYoDMS1+nwNOKVUp7Cr4e+uD3Bb3Y6zVrp8EPTSKqKFTmSq77gv?=
 =?us-ascii?Q?T/NNNQZXCLpzN7FWpTVtxdvYYvazfWLVq8WwH9ywgWhj9GjVJLLPksqi64l5?=
 =?us-ascii?Q?Wvo1Xr1r7q201kN5QENEg6N9+bTlUyepL2UqjSanIFGkKdcbIX1EByPzCEtz?=
 =?us-ascii?Q?OQs1+k3sLNygoFC6TercKcTEL9zJS2g3fwFrxCXJVm9y7jsmAU6WLQkMmvTO?=
 =?us-ascii?Q?e5zTVEdT++sSJXCPMYoFeqHA6OUXUu9xo5K1WYoSyqODFmUOZUbeDT/LN1Dv?=
 =?us-ascii?Q?7K7W5+ZzmFfBvbyy6PTUvFtKiFFAQgQaf3FfLqayHKLqfHjjfli7ZVt/02V0?=
 =?us-ascii?Q?f5K5AIi7Dp6UpASS7piAVybRfCStzJpRcpKcAN0s+AAtl2e/RgHqcI27rQOx?=
 =?us-ascii?Q?sgwFdezBFXsaNxYYc29qMnz45+8ENWMDJK6XgJT8fe+dMr/DxrGhBNDG9xi7?=
 =?us-ascii?Q?TO8NlFyFo50ZB5RWotcYHUcSfqyiCFzXZ6j3Na2iV2nAQKD+lH6u/LJ7C3hA?=
 =?us-ascii?Q?yUy4MjdBTVSeDEqy7yJeKCwqbng961qlI4wMAPqSXHpntf+cBZMNSEFY5kLY?=
 =?us-ascii?Q?pdnz/TOHzzaqr4rHiOk1uK59/daZnyNUwSE5fk2SMUklIH2191NbaAzUc58x?=
 =?us-ascii?Q?VKYqXUczbbEYs4FvybdS47Dn2KivPv0JdWrB7mwyIiixqsz/zif05UsgxsD2?=
 =?us-ascii?Q?/4Msmu1pkhjFprP6c7uvIzOM5Ra2rvvzkvvohpRXdFBDsC1M6I8usaoT1ads?=
 =?us-ascii?Q?jdMDpOdVaj8PvlwtvEMC3HNAGGXkmDx6zw3mFPrMfFaYwGQZC7AGcWOZSBVB?=
 =?us-ascii?Q?jwe8nfiGj4M7ebLi6wKFEYorQwCHT1R68bOTsRQ2UdiWdb3tms6DK5iXq6aE?=
 =?us-ascii?Q?k5nG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:55.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: edafc596-481e-40fb-047b-08d8b2b8bb37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMk0ioAOFduvXYFOb85VAEMgoGjwZ4WebdwjFblc5tD+qHxJoOPaFJABhD2RJkC4YlQZqGXwW+6ufv3ENo9PLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Use amdgpu_vm_bo_update_mapping to update GPU page table to map or unmap
svm range system memory pages address to GPUs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 232 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   2 +
 2 files changed, 233 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 55500ec4972f..3c4a036609c4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -534,6 +534,229 @@ svm_range_split_add_front(struct svm_range *prange, struct svm_range *new,
 	return 0;
 }
 
+static uint64_t
+svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
+{
+	uint32_t flags = prange->flags;
+	uint32_t mapping_flags;
+	uint64_t pte_flags;
+
+	pte_flags = AMDGPU_PTE_VALID;
+	pte_flags |= AMDGPU_PTE_SYSTEM | AMDGPU_PTE_SNOOPED;
+
+	mapping_flags = AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE;
+
+	if (flags & KFD_IOCTL_SVM_FLAG_GPU_RO)
+		mapping_flags &= ~AMDGPU_VM_PAGE_WRITEABLE;
+	if (flags & KFD_IOCTL_SVM_FLAG_GPU_EXEC)
+		mapping_flags |= AMDGPU_VM_PAGE_EXECUTABLE;
+	if (flags & KFD_IOCTL_SVM_FLAG_COHERENT)
+		mapping_flags |= AMDGPU_VM_MTYPE_UC;
+	else
+		mapping_flags |= AMDGPU_VM_MTYPE_NC;
+
+	/* TODO: add CHIP_ARCTURUS new flags for vram mapping */
+
+	pte_flags |= amdgpu_gem_va_map_flags(adev, mapping_flags);
+
+	/* Apply ASIC specific mapping flags */
+	amdgpu_gmc_get_vm_pte(adev, &prange->mapping, &pte_flags);
+
+	pr_debug("PTE flags 0x%llx\n", pte_flags);
+
+	return pte_flags;
+}
+
+static int
+svm_range_unmap_from_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+			 struct svm_range *prange, struct dma_fence **fence)
+{
+	uint64_t init_pte_value = 0;
+	uint64_t start;
+	uint64_t last;
+
+	start = prange->it_node.start;
+	last = prange->it_node.last;
+
+	pr_debug("svms 0x%p [0x%llx 0x%llx]\n", prange->svms, start, last);
+
+	return amdgpu_vm_bo_update_mapping(adev, adev, vm, false, true, NULL,
+					   start, last, init_pte_value, 0,
+					   NULL, NULL, fence);
+}
+
+static int
+svm_range_unmap_from_gpus(struct svm_range *prange)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_process_device *pdd;
+	struct dma_fence *fence = NULL;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	struct kfd_dev *dev;
+	uint32_t gpuidx;
+	int r = 0;
+
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
+		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
+		if (r) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+
+		pdd = kfd_bind_process_to_device(dev, p);
+		if (IS_ERR(pdd))
+			return -EINVAL;
+
+		adev = (struct amdgpu_device *)dev->kgd;
+
+		r = svm_range_unmap_from_gpu(adev, pdd->vm, prange, &fence);
+		if (r)
+			break;
+
+		if (fence) {
+			r = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+			fence = NULL;
+			if (r)
+				break;
+		}
+
+		amdgpu_amdkfd_flush_gpu_tlb_pasid((struct kgd_dev *)adev,
+						  p->pasid);
+	}
+
+	return r;
+}
+
+static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
+{
+	struct ttm_operation_ctx ctx = { false, false };
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
+
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+}
+
+static int
+svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		     struct svm_range *prange, bool reserve_vm,
+		     struct dma_fence **fence)
+{
+	struct amdgpu_bo *root;
+	dma_addr_t *pages_addr;
+	uint64_t pte_flags;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last);
+
+	if (reserve_vm) {
+		root = amdgpu_bo_ref(vm->root.base.bo);
+		r = amdgpu_bo_reserve(root, true);
+		if (r) {
+			pr_debug("failed %d to reserve root bo\n", r);
+			amdgpu_bo_unref(&root);
+			goto out;
+		}
+		r = amdgpu_vm_validate_pt_bos(adev, vm, svm_range_bo_validate,
+					      NULL);
+		if (r) {
+			pr_debug("failed %d validate pt bos\n", r);
+			goto unreserve_out;
+		}
+	}
+
+	prange->mapping.start = prange->it_node.start;
+	prange->mapping.last = prange->it_node.last;
+	prange->mapping.offset = 0;
+	pte_flags = svm_range_get_pte_flags(adev, prange);
+	prange->mapping.flags = pte_flags;
+	pages_addr = prange->pages_addr;
+
+	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+					prange->mapping.start,
+					prange->mapping.last, pte_flags,
+					prange->mapping.offset, NULL,
+					pages_addr, &vm->last_update);
+	if (r) {
+		pr_debug("failed %d to map to gpu 0x%lx\n", r,
+			 prange->it_node.start);
+		goto unreserve_out;
+	}
+
+
+	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r) {
+		pr_debug("failed %d to update directories 0x%lx\n", r,
+			 prange->it_node.start);
+		goto unreserve_out;
+	}
+
+	if (fence)
+		*fence = dma_fence_get(vm->last_update);
+
+unreserve_out:
+	if (reserve_vm) {
+		amdgpu_bo_unreserve(root);
+		amdgpu_bo_unref(&root);
+	}
+
+out:
+	return r;
+}
+
+static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	struct kfd_dev *dev;
+	struct dma_fence *fence = NULL;
+	uint32_t gpuidx;
+	int r = 0;
+
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
+		if (r) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+
+		pdd = kfd_bind_process_to_device(dev, p);
+		if (IS_ERR(pdd))
+			return -EINVAL;
+		adev = (struct amdgpu_device *)dev->kgd;
+
+		r = svm_range_map_to_gpu(adev, pdd->vm, prange, reserve_vm,
+					 &fence);
+		if (r)
+			break;
+
+		if (fence) {
+			r = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+			fence = NULL;
+			if (r) {
+				pr_debug("failed %d to dma fence wait\n", r);
+				break;
+			}
+		}
+	}
+
+	return r;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -750,6 +973,7 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, unsigned long start,
 	 */
 	list_for_each_entry_safe(prange, tmp, &update_list, update_list) {
 		list_del(&prange->list);
+		svm_range_unmap_from_gpus(prange);
 		mutex_lock(&svms->free_list_lock);
 		list_add_tail(&prange->remove_list, &svms->free_list);
 		mutex_unlock(&svms->free_list_lock);
@@ -991,8 +1215,14 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		}
 
 		r = svm_range_validate(mm, prange);
-		if (r)
+		if (r) {
 			pr_debug("failed %d to validate svm range\n", r);
+			goto out_unlock;
+		}
+
+		r = svm_range_map_to_gpus(prange, true);
+		if (r)
+			pr_debug("failed %d to map svm range\n", r);
 
 out_unlock:
 		if (r) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 4d394f72eefc..fb68b5ee54f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -42,6 +42,7 @@
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
  * @hmm_range:  hmm range structure used by hmm_range_fault to get system pages
+ * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -63,6 +64,7 @@ struct svm_range {
 	struct list_head		update_list;
 	struct list_head		remove_list;
 	struct hmm_range		*hmm_range;
+	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
 	dma_addr_t			*pages_addr;
 	uint32_t			flags;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
