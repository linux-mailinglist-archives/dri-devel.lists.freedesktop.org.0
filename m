Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0327354A64
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF866E1F4;
	Tue,  6 Apr 2021 01:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0346E1F4;
 Tue,  6 Apr 2021 01:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSNAqSmYbTnDKMi0Z7oW5liYSA+0ntcn2+1GV+K3Pk1tb+nDYxO7OjP3xZCydImhYUMDgNBoe1duryiLAVqO8BAEyPBBiG0JK8wRI7fC6YFH/bHYwLdV4rKmTvnVqBS3UchKcTau41qeheN17UXpdehoP1kP/6dOHn/uZj7PY79hklbdyO6tv9+K31Lmi+AeKyaHGYK8nZBzNEg9CzsSW0rnpM8cQy3C1mnF1oJpFVE00sALJxITI8RPEWR3Z8f0yutI/MghYk0VZWXiP/xF4PeZbRwI/0iPMgoWPPjmJd+htJGdIvtmSIN15swYRbG8a0jYjwUT2JG8+4XGr8Gn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4aB44M0vTdm6L9iB7iS4CLnpTGrI8TsqLheJqp4n3Q=;
 b=lqq2YiPVw5bWvR72Cs8MSF1uW+BwfucDgr0ENitUlR4x1WYE5eUJsyhalX8TCcAARGEEUHZED5g9gvK8+DjDR+U2iDLaydFBe3th0DIomPvz5QWnDNdg0WIedYTRu+sx51yvl5deVAKYDBEvPMxJodvRo40wqb8Iy0nObjWw9z+GYSMo5NpM9hZ/PUYMszJlVtGVmAHhq2Q+6kMqsdDv2c2uI00eiQez5Egmp18U4VYlK6hSDHozWMVpyQPZdZD7ML9WO6TpQ4vf8HaXwt7LYP350fvB/KLMa+JZlSLl0e/jto32eg+8kKtVzv3uCmHbd474Wb2RBseMa9rv0JWY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4aB44M0vTdm6L9iB7iS4CLnpTGrI8TsqLheJqp4n3Q=;
 b=0im3RNNlO0TT+2O7fQGwHkSVMeGnfszw8gjK0v2aHBx6ohHzmVfYLFKYIOaI082+a0ra1smHcOZCxX0dz5FTN9Lys/nbrGF++iWJ6/GsWS8YDk5Gr50b/ZCHJvApC2nvjF+nuf22t8wxRjn6H/BXeAjf8kUaxEhG+6P4XQkTQi0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/34] drm/amdkfd: map svm range to GPUs
Date: Mon,  5 Apr 2021 21:46:05 -0400
Message-Id: <20210406014629.25141-11-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72937821-b54e-4c4a-8e1f-08d8f89ddd96
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37734C7E64BA25F66DBF01AA92769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulIkHBrZ3Tn4yhRleRvJj19keiGyRXRDovzBuN8bbVWvoZGJCIfLFlsxI+WxIHgfAdc/SP2kwLeKNZqM1jLs+7w8coWYrahJY02m1YWqkEGAXYTbXAQ1Rl8jmZDR6xL4t/UWxmlmIE51Tqiubondum7zx9v3SiiF6xcSoY9ku+msk9hhd4cXYTkpOz2gaHnjuE5pDmAXTjd6aAmbNibVqzwbQO6b2jU2dyt/YT3HFB9caH89knbHIsfecZ8TOUymdoR6SSVlB2pVuXMwVKhmIyEB6E3qRZElP18BTBvN2gMGAXjDeZeHlsN5DRgZOPuYMGlITmUa3/6rRAjHldbPHmNQJ08vxZ8sdR9MRqkxiLfQ/HDMuQ1Wq2UnB/8Oog51z3LN4Uw6R6EFURThImO5o8kQUuPOXqFipNE4OzGlT+99mCbQaWNGIPNLfyFYKyV9jg7BOQtTZR8AjQ/Qc1mvbi+T64JvC6F8O9SpxTrEcVp5NIYbPf9Dl+NfFRNk54rZfcTf830vd0E9pTsOKpxJgUvBQeLxPNB6tlOTkDkMN9r6AaeKulw2oMaxUmr5YjK+6Lcqc2Aw27tb8O3UNJckyDsfl8KkoXszKV2WaO+5XREsaQ2VfO/tiiNP3XVXum6K+Hnof9D4oSFTpIsOiprQ9q2hc24wBTCyQqdy1ChV6i+5JXbluiqXl2JMsLfTfXq7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(30864003)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(54906003)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P/TNXKbm7iBIJ5Qm/4bKrPu/XpOnKxZSf+Ui41Qwxn9dMJ9yD/VCqCS74XP8?=
 =?us-ascii?Q?k+OPDt9oCI4I3d7+G6CcUkIVIx4YTURnoyBqDUE3azI62eSDoPys+4GAS/aG?=
 =?us-ascii?Q?NQ08Csomr2r1f7uqkE0oMEljLSAp7MR8AtpzSnbOEDrc6W8d1Q+00gSh95bD?=
 =?us-ascii?Q?iV6rhlJLgSs4cjbH/apRq0ZFp+A220jK0AXxGB5f/5T9vRqO0bWDp+2BKBpE?=
 =?us-ascii?Q?zVq2igYrEr1DXqCgg6jKEQeA6HlMLBtWg1cRGsCxlOUpci8kSOzb/iBA6L/u?=
 =?us-ascii?Q?W3Fs/YaG8401yJz1IHre4CqCqJCftydSHAGKB7hY9pVASVpXb0k03HkA4ri+?=
 =?us-ascii?Q?iHauK82eLE8sgg3Qvb9cWwo1WEfJnLomfQUVG/HcPBut3oxbNL892XEzEJ73?=
 =?us-ascii?Q?iXNeKpXeCDZ5VtYU1f6DE38zDqUiSv5mbDglfPC4+20DQYgILQaFFnN851cH?=
 =?us-ascii?Q?QCq5Zaascu4et37sZDXhYP0e5MlsyseI5eKTjam32IfiteX0W2rP4K8CYb/j?=
 =?us-ascii?Q?as1OOetOGf2ywWPIfpSYHdyWt9szsii5nYFeR4bWPYEQCQd7gt2tz6vjfj9q?=
 =?us-ascii?Q?C7R8JYYDfeC0NxHq+rkut6n3K+RKdP9jA7J7KOaAVAjUNUKWH2BnC0LVQNpd?=
 =?us-ascii?Q?oiFyPoYzAUL1JekLzjAEqggOtnRYJzlAmVxE7k7xaOhSOrWhIFwjP+fxLqDy?=
 =?us-ascii?Q?bJ3yMpact9NAwIWoRmz2mIY3niM6YoMBobSUxOxFlzKOK6rqO8s8J/x9ukP5?=
 =?us-ascii?Q?lhFNbcsfnQduiw1+d9bWnKkJPyHz3W7fk2QQFAImdpy6F+ICmNlwnohEGLRJ?=
 =?us-ascii?Q?sgqbrAM7EPZLFLlMNuLdg5RORO5FnQnw93a71RIo731X9fVzX0AWb+Kpg740?=
 =?us-ascii?Q?BmLgxA2sHVrwG2UauQUf7Br7foSmu+V5azVkLGo8E9kw/SWFB9SYKLgm3p29?=
 =?us-ascii?Q?h2JNQiW1VZCrQOJGfyi248QC31ZV7kQA6+FDGPzxu4/7ybLKd743mPI9IeOf?=
 =?us-ascii?Q?ONJBxJInkk67sIGksUUl27313MoYGd3MXT/Kvzcw+1Y427YarnuSiUQEad1e?=
 =?us-ascii?Q?u54AWfUkDYSaxpyb+75hnJ8f6Maop5k/S6sPANWu/Rucy8KzbLwZYLDyEqfL?=
 =?us-ascii?Q?4iGRsHMEQ8cJwA7klm0XOkKPXQJ7kq1ktjLgx9RpFv459e8jK61bM6b31TdE?=
 =?us-ascii?Q?v17lgodyzwfXTl8Yvs/s2aP7Y6JuZoxviPBqbK5gStcu+vUwlf6MjoBEGenU?=
 =?us-ascii?Q?ItttkdgIx0MeuHNCBJA3bVtd7WNPBgck/tTiVOSHLRYNVpBKWG9L2S2f0jid?=
 =?us-ascii?Q?I57WYnGfvTL3sLhr7Rbylbo0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72937821-b54e-4c4a-8e1f-08d8f89ddd96
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:58.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmYtaq+fzYBGkn25t8NGxK5eERC31bByzBK8s2lVCuc8tc609q+2t2oge93KumSNmvfSfB1jEL9BBe6tIqF6aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use amdgpu_vm_bo_update_mapping to update GPU page table to map or unmap
svm range system memory pages address to GPUs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 473 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   4 +
 2 files changed, 474 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 9eaff28bdc13..d951af42feed 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -98,11 +98,123 @@ static void svm_range_remove_notifier(struct svm_range *prange)
 		mmu_interval_notifier_remove(&prange->notifier);
 }
 
+static int
+svm_range_dma_map_dev(struct device *dev, dma_addr_t **dma_addr,
+		      unsigned long *hmm_pfns, uint64_t npages)
+{
+	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
+	dma_addr_t *addr = *dma_addr;
+	struct page *page;
+	int i, r;
+
+	if (!addr) {
+		addr = kvmalloc_array(npages, sizeof(*addr),
+				      GFP_KERNEL | __GFP_ZERO);
+		if (!addr)
+			return -ENOMEM;
+		*dma_addr = addr;
+	}
+
+	for (i = 0; i < npages; i++) {
+		if (WARN_ONCE(addr[i] && !dma_mapping_error(dev, addr[i]),
+			      "leaking dma mapping\n"))
+			dma_unmap_page(dev, addr[i], PAGE_SIZE, dir);
+
+		page = hmm_pfn_to_page(hmm_pfns[i]);
+		addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+		r = dma_mapping_error(dev, addr[i]);
+		if (r) {
+			pr_debug("failed %d dma_map_page\n", r);
+			return r;
+		}
+		pr_debug("dma mapping 0x%llx for page addr 0x%lx\n",
+			 addr[i] >> PAGE_SHIFT, page_to_pfn(page));
+	}
+	return 0;
+}
+
+static int
+svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
+		  unsigned long *hmm_pfns)
+{
+	struct kfd_process *p;
+	uint32_t gpuidx;
+	int r;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		struct kfd_process_device *pdd;
+		struct amdgpu_device *adev;
+
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		r = svm_range_dma_map_dev(adev->dev, &prange->dma_addr[gpuidx],
+					  hmm_pfns, prange->npages);
+		if (r)
+			break;
+	}
+
+	return r;
+}
+
+static void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+				unsigned long offset, unsigned long npages)
+{
+	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
+	int i;
+
+	if (!dma_addr)
+		return;
+
+	for (i = offset; i < offset + npages; i++) {
+		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
+			continue;
+		pr_debug("dma unmapping 0x%llx\n", dma_addr[i] >> PAGE_SHIFT);
+		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
+		dma_addr[i] = 0;
+	}
+}
+
+static void svm_range_free_dma_mappings(struct svm_range *prange)
+{
+	struct kfd_process_device *pdd;
+	dma_addr_t *dma_addr;
+	struct device *dev;
+	struct kfd_process *p;
+	uint32_t gpuidx;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for (gpuidx = 0; gpuidx < MAX_GPU_INSTANCE; gpuidx++) {
+		dma_addr = prange->dma_addr[gpuidx];
+		if (!dma_addr)
+			continue;
+
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			continue;
+		}
+		dev = &pdd->dev->pdev->dev;
+		svm_range_dma_unmap(dev, dma_addr, 0, prange->npages);
+		kvfree(dma_addr);
+		prange->dma_addr[gpuidx] = NULL;
+	}
+}
+
 static void svm_range_free(struct svm_range *prange)
 {
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	svm_range_free_dma_mappings(prange);
 	mutex_destroy(&prange->lock);
 	kfree(prange);
 }
@@ -148,6 +260,15 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	return prange;
 }
 
+static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
+{
+	struct ttm_operation_ctx ctx = { false, false };
+
+	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
+
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+}
+
 static int
 svm_range_check_attr(struct kfd_process *p,
 		     uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -290,6 +411,61 @@ svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
 		old->granularity == new->granularity);
 }
 
+static int
+svm_range_split_array(void *ppnew, void *ppold, size_t size,
+		      uint64_t old_start, uint64_t old_n,
+		      uint64_t new_start, uint64_t new_n)
+{
+	unsigned char *new, *old, *pold;
+	uint64_t d;
+
+	if (!ppold)
+		return 0;
+	pold = *(unsigned char **)ppold;
+	if (!pold)
+		return 0;
+
+	new = kvmalloc_array(new_n, size, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	d = (new_start - old_start) * size;
+	memcpy(new, pold + d, new_n * size);
+
+	old = kvmalloc_array(old_n, size, GFP_KERNEL);
+	if (!old) {
+		kvfree(new);
+		return -ENOMEM;
+	}
+
+	d = (new_start == old_start) ? new_n * size : 0;
+	memcpy(old, pold + d, old_n * size);
+
+	kvfree(pold);
+	*(void **)ppold = old;
+	*(void **)ppnew = new;
+
+	return 0;
+}
+
+static int
+svm_range_split_pages(struct svm_range *new, struct svm_range *old,
+		      uint64_t start, uint64_t last)
+{
+	uint64_t npages = last - start + 1;
+	int i, r;
+
+	for (i = 0; i < MAX_GPU_INSTANCE; i++) {
+		r = svm_range_split_array(&new->dma_addr[i], &old->dma_addr[i],
+					  sizeof(*old->dma_addr[i]), old->start,
+					  npages, new->start, new->npages);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 /**
  * svm_range_split_adjust - split range and adjust
  *
@@ -298,7 +474,7 @@ svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy attributes in old range to new
+ * Copy system memory dma_addr in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -309,6 +485,8 @@ static int
 svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 		      uint64_t start, uint64_t last)
 {
+	int r;
+
 	pr_debug("svms 0x%p new 0x%lx old [0x%lx 0x%lx] => [0x%llx 0x%llx]\n",
 		 new->svms, new->start, old->start, old->last, start, last);
 
@@ -318,6 +496,10 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 		return -EINVAL;
 	}
 
+	r = svm_range_split_pages(new, old, start, last);
+	if (r)
+		return r;
+
 	old->npages = last - start + 1;
 	old->start = start;
 	old->last = last;
@@ -426,6 +608,249 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 	list_add_tail(&pchild->child_list, &prange->child_list);
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
+			 uint64_t start, uint64_t last,
+			 struct dma_fence **fence)
+{
+	uint64_t init_pte_value = 0;
+
+	pr_debug("[0x%llx 0x%llx]\n", start, last);
+
+	return amdgpu_vm_bo_update_mapping(adev, adev, vm, false, true, NULL,
+					   start, last, init_pte_value, 0,
+					   NULL, NULL, fence);
+}
+
+static int
+svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
+			  unsigned long last)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	struct kfd_process_device *pdd;
+	struct dma_fence *fence = NULL;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	uint32_t gpuidx;
+	int r = 0;
+
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		r = svm_range_unmap_from_gpu(adev, pdd->vm, start, last,
+					     &fence);
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
+		amdgpu_amdkfd_flush_gpu_tlb_pasid((struct kgd_dev *)adev,
+						  p->pasid);
+	}
+
+	return r;
+}
+
+static int
+svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		     struct svm_range *prange, dma_addr_t *dma_addr,
+		     struct dma_fence **fence)
+{
+	uint64_t pte_flags;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	prange->mapping.start = prange->start;
+	prange->mapping.last = prange->last;
+	prange->mapping.offset = 0;
+	pte_flags = svm_range_get_pte_flags(adev, prange);
+
+	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+					prange->mapping.start,
+					prange->mapping.last, pte_flags,
+					prange->mapping.offset, NULL,
+					dma_addr, &vm->last_update);
+	if (r) {
+		pr_debug("failed %d to map to gpu 0x%lx\n", r, prange->start);
+		goto out;
+	}
+
+	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r) {
+		pr_debug("failed %d to update directories 0x%lx\n", r,
+			 prange->start);
+		goto out;
+	}
+
+	if (fence)
+		*fence = dma_fence_get(vm->last_update);
+
+out:
+	return r;
+}
+
+static int svm_range_map_to_gpus(struct svm_range *prange,
+				 unsigned long *bitmap, bool wait)
+{
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	struct dma_fence *fence = NULL;
+	uint32_t gpuidx;
+	int r = 0;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		pdd = kfd_bind_process_to_device(pdd->dev, p);
+		if (IS_ERR(pdd))
+			return -EINVAL;
+
+		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
+					 prange->dma_addr[gpuidx],
+					 wait ? &fence : NULL);
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
+struct svm_validate_context {
+	struct kfd_process *process;
+	struct svm_range *prange;
+	bool intr;
+	unsigned long bitmap[MAX_GPU_INSTANCE];
+	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE+1];
+	struct list_head validate_list;
+	struct ww_acquire_ctx ticket;
+};
+
+static int svm_range_reserve_bos(struct svm_validate_context *ctx)
+{
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *adev;
+	struct amdgpu_vm *vm;
+	uint32_t gpuidx;
+	int r;
+
+	INIT_LIST_HEAD(&ctx->validate_list);
+	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			return -EINVAL;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+		vm = pdd->vm;
+
+		ctx->tv[gpuidx].bo = &vm->root.base.bo->tbo;
+		ctx->tv[gpuidx].num_shared = 4;
+		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
+	}
+
+	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
+				   ctx->intr, NULL);
+	if (r) {
+		pr_debug("failed %d to reserve bo\n", r);
+		return r;
+	}
+
+	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to find device idx %d\n", gpuidx);
+			r = -EINVAL;
+			goto unreserve_out;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		r = amdgpu_vm_validate_pt_bos(adev, pdd->vm,
+					      svm_range_bo_validate, NULL);
+		if (r) {
+			pr_debug("failed %d validate pt bos\n", r);
+			goto unreserve_out;
+		}
+	}
+
+	return 0;
+
+unreserve_out:
+	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	return r;
+}
+
+static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
+{
+	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+}
+
 /*
  * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
  *
@@ -454,9 +879,27 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 				      struct svm_range *prange,
 				      uint32_t gpuidx, bool intr, bool wait)
 {
+	struct svm_validate_context ctx;
 	struct hmm_range *hmm_range;
 	int r = 0;
 
+	ctx.process = container_of(prange->svms, struct kfd_process, svms);
+	ctx.prange = prange;
+	ctx.intr = intr;
+
+	if (gpuidx < MAX_GPU_INSTANCE) {
+		bitmap_zero(ctx.bitmap, MAX_GPU_INSTANCE);
+		bitmap_set(ctx.bitmap, gpuidx, 1);
+	} else {
+		bitmap_or(ctx.bitmap, prange->bitmap_access,
+			  prange->bitmap_aip, MAX_GPU_INSTANCE);
+	}
+
+	if (bitmap_empty(ctx.bitmap, MAX_GPU_INSTANCE))
+		return 0;
+
+	svm_range_reserve_bos(&ctx);
+
 	if (!prange->actual_loc) {
 		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
 					       prange->start << PAGE_SHIFT,
@@ -466,6 +909,13 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			pr_debug("failed %d to get svm range pages\n", r);
 			goto unreserve_out;
 		}
+
+		r = svm_range_dma_map(prange, ctx.bitmap,
+				      hmm_range->hmm_pfns);
+		if (r) {
+			pr_debug("failed %d to dma map range\n", r);
+			goto unreserve_out;
+		}
 	}
 
 	svm_range_lock(prange);
@@ -475,12 +925,17 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			goto unlock_out;
 		}
 	}
+	if (!list_empty(&prange->child_list)) {
+		r = -EAGAIN;
+		goto unlock_out;
+	}
 
-	/* TODO: map to GPU */
+	r = svm_range_map_to_gpus(prange, ctx.bitmap, wait);
 
 unlock_out:
 	svm_range_unlock(prange);
 unreserve_out:
+	svm_range_unreserve_bos(&ctx);
 
 	return r;
 }
@@ -835,6 +1290,7 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	struct svm_range_list *svms;
 	struct svm_range *pchild;
 	struct kfd_process *p;
+	unsigned long s, l;
 	bool unmap_parent;
 
 	p = kfd_lookup_process_by_mm(mm);
@@ -847,8 +1303,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 
 	unmap_parent = start <= prange->start && last >= prange->last;
 
-	list_for_each_entry(pchild, &prange->child_list, child_list)
+	list_for_each_entry(pchild, &prange->child_list, child_list) {
+		mutex_lock_nested(&pchild->lock, 1);
+		s = max(start, pchild->start);
+		l = min(last, pchild->last);
+		if (l >= s)
+			svm_range_unmap_from_gpus(pchild, s, l);
 		svm_range_unmap_split(mm, prange, pchild, start, last);
+		mutex_unlock(&pchild->lock);
+	}
+	s = max(start, prange->start);
+	l = min(last, prange->last);
+	if (l >= s)
+		svm_range_unmap_from_gpus(prange, s, l);
 	svm_range_unmap_split(mm, prange, prange, start, last);
 
 	if (unmap_parent)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index aa4430f3fa08..1d89401f16b4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -56,7 +56,9 @@ struct svm_work_list_item {
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
+ * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
+ * @dma_addr:   dma mapping address on each GPU for system memory physical page
  * @lock:       protect prange start, last, child_list, svm_bo_list
  * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -84,7 +86,9 @@ struct svm_range {
 	struct list_head		update_list;
 	struct list_head		remove_list;
 	struct list_head		insert_list;
+	struct amdgpu_bo_va_mapping	mapping;
 	uint64_t			npages;
+	dma_addr_t			*dma_addr[MAX_GPU_INSTANCE];
 	struct mutex                    lock;
 	unsigned int                    saved_flags;
 	uint32_t			flags;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
