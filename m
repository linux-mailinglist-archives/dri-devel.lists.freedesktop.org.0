Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F95350DB3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD746EC31;
	Thu,  1 Apr 2021 04:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5616EC2D;
 Thu,  1 Apr 2021 04:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhQ5l3mJZ0jPMt3SrvX4Y6h3HGylV96aEzYuTvoRsnk6kcLJApATIBd3V4drwnRxrsmUkLfMy3pgiKF8HzHvUcGla4jKZ9Wa7EyTLcBA/g2pjMSOscapn8rO2578RAkBhIBC/n8tom4+Co+2vtODQMS65nEThnMu+m5h8ziw7KgZ8uJ8SwXiIF8+ZL0xMngewKB2WBQmza62rgAJcQ5s1OdHoGBD1zuqKZQTevnHNC9hQv7T0ozDXF0CLOO66fDqZh5YMcsTgxOc9USlCKcPDq1qOhmZS4tr4lRL0/xFgK1NFt/0VmKKlFgpxzOh/0BZRreUClaJSlR9kfRS9/AwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTgZ+Y/5gnZd0Bp+uO64z8/Suqn9TxR/ZDy7n0PLfsE=;
 b=nS7PnWbfylP82DChwGEW6W3YI1oYrZL7Vxwq6EkpXMBBwbddMMapGKhYD1mrm6/ZL9WaPXq5oY7RODcJsTVgEnnbTorfMHrGt5XCWebGmXpOfJLkal5v9VlsKNRH/AU1dH11v49ACITw/jVYhEWX6jBknHj6LOMw867zP5u3+wBv3Jahxyxq0uDyNcNlV/I6A/nM4RZTFmF6+qBsz+yUdy3QkB6eYV3tej4F7nQsMHTZ3fCMJZp9B2E2mJdzNLtZQGtSEgOAKv3sJC9c/TNzvE8pdgt7B5PeipULhitRQThxbz5Qj/2/2y6BspIWDwSKXEvbjOjSTIA782VeNz3MwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTgZ+Y/5gnZd0Bp+uO64z8/Suqn9TxR/ZDy7n0PLfsE=;
 b=NjS0eD9KZ2ilW9xwCj6VFry/uHclcWcw9HyG1evACI22RIuxVgi0ETLL0KC3Bu53F15EDJuJEAxJ7oy0ycpeRArb2oP8XVSUX/swbTszqcnStLOnC4C44/IfLra3vfRKi+Tnsq/aXgMR62BVaUqeCFE40COnCGGCW8/gDEXSgjs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:51 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:51 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/34] drm/amdkfd: map svm range to GPUs
Date: Thu,  1 Apr 2021 00:22:03 -0400
Message-Id: <20210401042228.1423-10-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5963f01-0181-4d15-7e09-08d8f4c5cfb1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49161261FF86AED78827E6F9927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZhyNddX+uy7OSHP0xMUdSjBu22pKbvCnGsKezW4HERMOg3qzb5jTZrMdmiXzlc/88SXIWN7M6FDzoNEh4stdtt3oP8KFIGUSm9oZldFWpz9PGRzbHrlW3m7Kvqw4Ex0PFFOui+EurSqjDV7wGinQKxQyng7C10KKX82Ihb2Sc+BIH3zwLruID+NDtJR3OOBWMnYUUgdhSz4McBZfwe51hTVkg97FxHQz7qU/6BKBBvyf4FrADM7Uu54tgbmRB3b8yhphNu+q5QB0jTkJAvQ2i8jKvZQeOkxR1bK9lJHYAfqrMSz8NgkzjT1rQ3Q6Qr6XJp+Uox5PWCMMbTfc8QQAhtZLIl4AOcciYt0n0i6DDm58/wZD1g+HQsUNuuMgW0Z81awktgNkWwUtYG9Uyol3GluLnZKNXU9h7G2RXwbLxZ5PB1XwL8azB0ZLzvMOI45vEYPCQMXHCO1WvFXx6+WjzlOzdT7JvdbAkgw/P4neuTzcCFQYOGSqAN8p6N8JzIIebAKWlPD/2cujmIxd9Qi97IFAZFo6pNbL3k76TbbSMFmAqOluHqqgggRxVZzXJhBewvK2CrDfmWQVnLEpJrgAJJLooxKOsHIdeop6m8nv8GDXNWXGqQLphqfAjWBqKlnYdVyisfPv/3VkZ51KH23vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(30864003)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pjrb4dLDFbAkmXaF7JkD9+y4yAK9Iid1IIreJ5jYTMJxMRt4jk7fFTzkJC7D?=
 =?us-ascii?Q?OgEWvIZdlJbOXFh6TsqzZoR3KVemG8Xy7yM20CtJQiLktg/KE/TdgM5Es83j?=
 =?us-ascii?Q?hyNVM1OJinKpsR+7UyscHlqer2O+7tfnhbKehG3H3Zz+RXN+P3W/TGjY34AS?=
 =?us-ascii?Q?0Ji1mzBtXjjg+LNT1wlDMYbejNAgFUsQqobv0LOsXVPljM3fy3VNm7iNXui+?=
 =?us-ascii?Q?eQFcuv/iSR29tWMwbNGGITlo65SvNFjsUIKasEiXuJp6qX82q6bBakoEFpcx?=
 =?us-ascii?Q?2qW9YXVmdjd3ASf9R4/7joVTt5INWaCeJPlmWQstTlszqA2QFjAlDqqCGFAY?=
 =?us-ascii?Q?z16ivxsvlBblGpXW6m6lsQcG6HSmSu1PLB+8Z/jnVnz1usNyNXDK71LrKDCO?=
 =?us-ascii?Q?cvqmB9Q0bdCW0r9u7wUzsDUxVFKW8EwVeaH2nA5ysthtbAV4mDEnhbVE85nk?=
 =?us-ascii?Q?DoSyi+Dz4HDOu5aY8KVGsYlhJ1ZfasJRtLmqBzRloV//GfMGV/BbwSsZaY8M?=
 =?us-ascii?Q?r0U5Di0Togd548UigZKoAlJAiTwEOnyxEzDVE61eNhbSyyg4D/fUSign5RuB?=
 =?us-ascii?Q?L9xZuCITfCgLR6HjUR+YvbaV8XaawYQGzVySflILQ2OKYwXFT7xG3EV4p9Ev?=
 =?us-ascii?Q?ZxSVUW0sbEhpaDNp+M3nkuQetM4tX7y5t5Jt/JZKzx8wT3jf53CQCk/kWH8o?=
 =?us-ascii?Q?+CxY6hhwLgeOLjIs26UOubCO3z4MLrKtjPNeub9FDupFeeJ9mgc9xW8ZpLR+?=
 =?us-ascii?Q?SLz5MIH7Y1WwO9PDjYR7Yvs+YdcF7w0TMw+IgrdkD6hlunqyiI0sEvErIRoW?=
 =?us-ascii?Q?9e2MI9n8s6XNwp5R6xFipXe5opapMLV17KuD/n1d+yNG9LCP5iYhSVDZUkDJ?=
 =?us-ascii?Q?kPly9PMwP+ZQ/vfj4BZNs4XYEIOaGxpBq3tXGneYb4D9e0m/5s+si1oYplnQ?=
 =?us-ascii?Q?td5g6dmJvK5H9yw6alqA66rEVVRmElroeEUlr3RPAwG/vig/Dbczizrq16P5?=
 =?us-ascii?Q?pAQuLDEJTwUqVVmDiTKdd6OTo2FtbwkqISZB4gWcrSeSXUGQP2wlPEGM54Sl?=
 =?us-ascii?Q?R3gjCKS7lDWyEBGIrwexBbJWFp7abTsS5gknMkKkPa2yR92BqYpv97gXGvdD?=
 =?us-ascii?Q?Vv6DRDOGSxuZcu4D2uGxShE1yKvGjtayZrUFGoK0xZF7o5i3aGCCS0rA2TFb?=
 =?us-ascii?Q?WT1klpfl89b0/EJ6Bu4J+yWFstqOHz1/NPAG1hJ3Trn3LDpk24ToTFblB6s4?=
 =?us-ascii?Q?lxNbVWgl+JXKDntvDqJfA8Y2rAjyHFDDbz8oU6BXrU4LtjxAv+2+Rglx2uez?=
 =?us-ascii?Q?exH7hyPZlk+C/G7YJAvdLHal?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5963f01-0181-4d15-7e09-08d8f4c5cfb1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:50.7257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NI72yPSm5mL8DSCGxcecJHpCC3oQ/uZ4xacnTPDV/FOycmaxIIdZvCU/XxQqbxE0eBNw84PjsxZrD/A6ihQfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 478 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |   4 +
 2 files changed, 479 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ddb1e2a29881..4736fe996feb 100644
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
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages)
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
@@ -425,6 +607,250 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
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
+	prange->mapping.flags = pte_flags;
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
+int svm_range_reserve_bos(struct svm_validate_context *ctx)
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
+void svm_range_unreserve_bos(struct svm_validate_context *ctx)
+{
+	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+}
+
 /*
  * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
  *
@@ -453,9 +879,27 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -465,6 +909,13 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -474,12 +925,17 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -834,6 +1290,7 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	struct svm_range_list *svms;
 	struct svm_range *pchild;
 	struct kfd_process *p;
+	unsigned long s, l;
 	bool unmap_parent;
 
 	p = kfd_lookup_process_by_mm(mm);
@@ -844,12 +1301,27 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n", svms,
 		 prange, prange->start, prange->last, start, last);
 
+	svm_range_lock(prange);
+
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
 
+	svm_range_unlock(prange);
+
 	if (unmap_parent)
 		svm_range_add_list_work(svms, prange, mm, SVM_OP_UNMAP_RANGE);
 	else
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
