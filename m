Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8E35FF5E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BF76E9BB;
	Thu, 15 Apr 2021 01:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD96E9A8;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2rldpmERLOKvXgZSsapQT2mSZOlZ2zrv8rRnTMrN1sB8a081XzXe+thvGm/Z77xSyxi+y2bx9bUVsHENvg68e41BrRLZztwLw5p8DbBb/OQO281NcRvi+A08ZLDMJqZFGi5GW1T4WylXIV4EONghuFtyUuYbVaNqelIDO4G7z5SzScHzDtMgbbK40ZW4Q0euCFRRWPUiQWDOKGZghaxjKYyI32JKe4boDoZM9b8J3/yd06NO4M9w4KrxBkHBb3+VpiUgGOaVgi6kKMUOE38vTIH8sMYr4RzeOWo/Ag1v2VtV8UgGpKS3j2merno1T52+WR+JB0nvE453Z2Mf249OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+CNd3zLNWYfIEdNNvpZ4Hp+XtTrBEnZIBgXoZ+sWzM=;
 b=oYumMyfUA2FyoCMowVAJgB679oWTo9ZKsVeCYNgXRB0xiVY6t5T6N4/rv6UKAfp2Lh29l0G0OT82dG7dQre0NorVMnH6N2Xb5stVBPCgZxBblpDA//3oAEdHPZFp0dK759S8SXCGh6yIUqpQXod3LBZln739H/4njT3Ycvkhq/vKM65qa534amN3BZsvTLtFYoF3JnTOI886KMamqkoNu34JtIlkFPsvWBhoa0/NYgMrfz0EaeIK8NucOoTwwlpnpi1oUs+XKtaiH16pPBf9KZ6mNgAbm6NiIGNIXivcNDA5VS5Ivvzn2Ah5hnBhcCfFfZQSYaVzEHS4ZOqV0UjWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+CNd3zLNWYfIEdNNvpZ4Hp+XtTrBEnZIBgXoZ+sWzM=;
 b=SOSiS46MocAynZrTo6qmtjrKqGBuFeAk9/AiMYEk+QHul5Z4Nlsp8wEue5R6KoFIeI0YC9xlagYTwwnUCl4JUHJjBGtA5lqaB0UVvif3lwZCHc+ijzwldrK3XGf5/sf0FCGZX26gw/sJAY9FRFX1d8JKAQj3bjGOaLrZiIlZiR8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:00 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/34] drm/amdkfd: map svm range to GPUs
Date: Wed, 14 Apr 2021 21:23:13 -0400
Message-Id: <20210415012337.1755-11-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc7299c5-1cca-4783-9b6a-08d8ffad256a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479721F11318821898BB4F35924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fq3sCnmzgxlFdE4WH8zAf72AQTDcImfZu206ePT8Vnd72eDSwxYunXWHc8x4o9tRWaBEC7OK6sOGyodPg+bvmxd/C7n03zCEFydTKkeSySajDh27M1+NJBbD7iY7sLV5JFWqMxwRcoQa3v/J8z3r7zj6dE3COYGekj4nyaG0VDspSyRl4k9Jp8IatKHJ+g+rzC+j493ghvqEbZ7NXb4t05Eu0zl1Ikp9WsEMgh6rcD1G9vsP9yZY+hWRypVGN6ba2Et82XU+VcgHa2WMraF9jm19KH7DK8wZEE2k378U8xMdfv7XtE8/US5B1JCNCxXfh5olQ+qK3pyVp2DOvBX06fQLORXfHV3RtjH8lEd6PqTNBzLXYQoOK7vKdxUntQfvSsqYG6WK7I5yToangoGIZ0QCg1fFwUQ9eFT9OP3/3Q8IzIFtk1M+9+2XQzdcw6XMwk7XfG/HO9JHUgj3AHQYTazmRJDRyQ7u2Mn6qw4y5tetv9iFSwv62ue167kKojukZEwXJnQE9YKF3pE/SqnOwBgIrg9SjJPjZXn2WcToRMeURO2WsQtZ0Mi7DRCllW2zMItsXUcw8hRulQQklvnhuNXF8hlUQWGYUYWFXUwd3IwuhN490OwVsjWEXAakTHlT+CEK15Fdhl/C/h793Djzmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(54906003)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(30864003)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gs0jgmnqylp/1uYvAkGPjgsRVzmW2gDwwhYM+/dQyRFbIGQYTwpU8yVAFo+C?=
 =?us-ascii?Q?yVBivIjqPC29xzDfFrPKNfwMnn8wu7koxT2UyRR5dSnU2ZPCa+Bzgk/w8Hcq?=
 =?us-ascii?Q?nGxhXIqUCY3qrO9mIK99JASt4cBxYLxW8QnzgNp1kTLtjT6qQnNkjDdXCdsC?=
 =?us-ascii?Q?78h5uvTgKfs70FvWvoT7QNAk+Dio7WS0Gtu5an5bTbrFOXd8A6AlbzaX1wiS?=
 =?us-ascii?Q?DvUJeo2cm7NeABb2Ot7GgUe5btqf/YBwQGSID7BuEaCMdiBEvmCqlrBzKMIt?=
 =?us-ascii?Q?TGq2uGXhqDf7VY/RBW1/5VDxj61RVdjSO0n7rZ3d0WeTOV63e8gwp7WWxhbn?=
 =?us-ascii?Q?PRgZnHODZRxXnO3SCaVH5XwkWeFfw+yZ7f635rO7FGHKOH6MIMJTL/bXxgDE?=
 =?us-ascii?Q?NQFSlQ2kZn4XgPmpKlylY/ul97kYl8ac7MSNUnK0MHi4YT3FuQub8nWJ0+TS?=
 =?us-ascii?Q?RxCOAGKAnggXNOGN4lIZMyWUTZ9JsqmhaVOOebxVVd3XHat7+mJSpgET+Yal?=
 =?us-ascii?Q?g7TMAg50NDLkchPOXGF7gIXqYBe9N4RA+M1wwj6oKsQwK/Sw7BTdBaF3BGRi?=
 =?us-ascii?Q?ZcQGwTBXUVXbxvV5H4rdir1+NW/xLlYtIEClwYroCdhpnpLXtW7xcXgZ9c0j?=
 =?us-ascii?Q?F/H1EqG+Lc1etIGFyehyEUmY8/wFnPTQB7w6frm7v0EqbHgPXZ2PuPhxQTPw?=
 =?us-ascii?Q?ySUOzQHMycPdufRakLj9hS2B/9KO6uzWTVIoQIhnTtKTUKbEVWfJ2qcKzcXF?=
 =?us-ascii?Q?uBWxWBB0sXX6xcp9HjC6BlyKxQ3IAP5zaS+zSmz5HN00lxHwTl3hOgqBSZkq?=
 =?us-ascii?Q?L/I6AHs3qTNF+XsJSzsUGUt4IMXrIOZA7klLh0brE6U5VwffnbuMFLWrRBPs?=
 =?us-ascii?Q?xnOLoQWOFhxbHwpDKsiK5F3QoevWvt4wJJLWSAARz+vKB+PbAGrUGxST+TAQ?=
 =?us-ascii?Q?34t3HNufuFF1MxC6ZlXifAJdwm0/QUvlnG32CEFMjlmNINrsoxicrBwmIqmi?=
 =?us-ascii?Q?YzQ8+oI2sLsMfy8ftPwyWL1MsbmvPqwtdmkRD0McXTIF2VJhFc5SvGhw1APV?=
 =?us-ascii?Q?gLJUmGMCLQBfkYkZfHXUhA8QmQKhNHGKhvsEWNZ/qlc0Vn6BxM3W7D0h8AUi?=
 =?us-ascii?Q?GxDLOgiqS1krjpbyjknt0bBVskwgVpp7JKxw/BflUO7aS7uSO+WTktUMB+7H?=
 =?us-ascii?Q?hnX9AuI05Tkv4g5iF0M5amNnkmFgj+NYdWLRyOaluf1uwCv7dYLAtkfAoSLZ?=
 =?us-ascii?Q?Gep8mXuB/uixk1k9oGqH+AJ0QGQX4f+lylPNDlmE309gGsweVVN0eqcDWMWk?=
 =?us-ascii?Q?+i/G6waSfCU3BWhgql7gQWA4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7299c5-1cca-4783-9b6a-08d8ffad256a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:59.6876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp9FbhjHXq2NTorECd8guBrjGugcKEwP02dtQ90kzn51DllAaOjPUg1gAnaFrtNAVNJHCAhlHZvrLxhj7GV5Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
index c4decfbb2427..55ca39fe46a8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -99,11 +99,123 @@ static void svm_range_remove_notifier(struct svm_range *prange)
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
@@ -149,6 +261,15 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
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
@@ -291,6 +412,61 @@ svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
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
@@ -299,7 +475,7 @@ svm_range_is_same_attrs(struct svm_range *old, struct svm_range *new)
  * @start: the old range adjust to start address in pages
  * @last: the old range adjust to last address in pages
  *
- * Copy attributes in old range to new
+ * Copy system memory dma_addr in old range to new
  * range from new_start up to size new->npages, the remaining old range is from
  * start to last
  *
@@ -310,6 +486,8 @@ static int
 svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 		      uint64_t start, uint64_t last)
 {
+	int r;
+
 	pr_debug("svms 0x%p new 0x%lx old [0x%lx 0x%lx] => [0x%llx 0x%llx]\n",
 		 new->svms, new->start, old->start, old->last, start, last);
 
@@ -319,6 +497,10 @@ svm_range_split_adjust(struct svm_range *new, struct svm_range *old,
 		return -EINVAL;
 	}
 
+	r = svm_range_split_pages(new, old, start, last);
+	if (r)
+		return r;
+
 	old->npages = last - start + 1;
 	old->start = start;
 	old->last = last;
@@ -425,6 +607,249 @@ svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
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
@@ -453,9 +878,27 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -465,6 +908,13 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -474,12 +924,17 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -834,6 +1289,7 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	struct svm_range_list *svms;
 	struct svm_range *pchild;
 	struct kfd_process *p;
+	unsigned long s, l;
 	bool unmap_parent;
 
 	p = kfd_lookup_process_by_mm(mm);
@@ -846,8 +1302,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 
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
index 173e93e138a9..5949890bf48c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -57,7 +57,9 @@ struct svm_work_list_item {
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
+ * @mapping:    bo_va mapping structure to create and update GPU page table
  * @npages:     number of pages
+ * @dma_addr:   dma mapping address on each GPU for system memory physical page
  * @lock:       protect prange start, last, child_list, svm_bo_list
  * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -85,7 +87,9 @@ struct svm_range {
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
