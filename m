Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B947435FF57
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727D6E9B6;
	Thu, 15 Apr 2021 01:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2F76E99D;
 Thu, 15 Apr 2021 01:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUB62ywH6pafBDDDD3V9BXm8KkwouTxobAEJ0nMBzJ4QyqJQXZEUPApcaWL5tx/nqX+e3urjpkmjl+bMaU9qOPQobb+a5r4rIFar0qiTml6yVXyu37hW/JaZLvUEYWIVwZuFdh+PSs0+OxvBhFRAyzVKWyGpDhq2tGMcKFUBsq+O+F69Bdgt35T+t0wml2SC+Cz7qEYq9sDd8b3xT5AqvOqH/84ldtBmv0gEjuBDW9YvYpQR4vM7SBIPWwLQ8mDPoB3JktrHDNbrM3gotuQAvLqiu9x0b8eQwZsOrGNKcFFqziolZi2WTe2RUaS82UFUU2o2rQOuop5HLehesIOYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw1j6doPlnzMG3tM8HYtLz+U5dr5RVOJNiXBvKs0y7Y=;
 b=UM8fD3dCaQPhqTxyC+Lgu9VWLbkXIuSifNIds17sdWwd2AvdMswPOn7J4w5r8F+RRkobTgxg4aOG8vMu1iTfsUN2SFBG1qYDm82ofc0elBS6Djb4ck3Rp0kPULzDOhGrYZ4plghzuB9IemsIxJdQ9XRlwRMEB7pKG0/OvHA5qlhU4PSc3nwL3ByR+ALgP4XO0ymtcndB1LATWhTfQi8kLxUGpBea1L/MqMxC570FVvNV5oczCKpWkL+0ajLIjv+a2WMfGG9AgBfKwYDlIjpfrP0cCJC+FJvQ/9bHME0OYny+78P8rWvlTjq53Li+35WkA7kajFsXvlqfPtzUqw8tCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw1j6doPlnzMG3tM8HYtLz+U5dr5RVOJNiXBvKs0y7Y=;
 b=2ZWhoYBx6YJLz+dfSLhqfaq5qiDbf/odN90r1qiBCiIcs14cyawe0GsaNj/uqSBfrfFeUVCS6W4kOHm7BWL2qBaEI3hdZuy7TgxJWMywg6U4U+6a0D60wfO4rmfncOkeg+jI9yQRl28lytlTWqImV8Ya43FZQapOhVKMw3+zeDg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/34] drm/amdkfd: HMM migrate ram to vram
Date: Wed, 14 Apr 2021 21:23:22 -0400
Message-Id: <20210415012337.1755-20-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f38ab3c-36dc-4512-3709-08d8ffad27d0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42088D8B08297DE6B8A83139924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXMZn8+iMIzKDIU/DD9Xe1FGlSUwkgWerfyRGtM+T4lbFHyNGraIQ6jaAEwTzP87lhL9YvhFWgbd3nAe6xKGPwAWr9U7dMArFty/7MTXfISbq7PGmA/0JBjmdjHb8RfEeyoz97TJmdHX8OyPQAMdc+uYC4mdN7WNBEcNImbOJsRSO5X0EGViRwTQogn1WlbT0Y5IwK9uzSyl0rUBXUT0E7bpRunPVYRd9yUUDvEnEG0hRgiHbVV+kF19LXLcXy+E31BflKVJm7M5OEkop0bvK5I9eDijrRnP7Ywx0mVbz5jt/C29V6/76T/A4RKBICXFhlod6tplYKa9rI5F2h/lVXuNyGCnWQFkcraz68crvs87zWMpB+cz208Wb7IU+54hU0O6wqP9kphKl3jCbsXuqYUBbFFdhDUxaJFGOwf+rm8lBXUz6xDj82wkVfEJQ5z+Z+KsF4rGkwRcvSN/+PhRavNx5wZ0VC2aZ6GnYHhegcYVPSST+N6UliyZJlaTf4clfPSlFyaWC5HbVECZI/ITp3tSThbKxyDgTq+vGhl/xXKpwY8EFvZKrLHDsnGRnH6uQ5s/V4r0Gm2E7d7JTwN/4pAG2kj7MRJTNRuBLdb9937agbunwDocjIP1mnmj4S78FM/IxiOXHMMSug7rO8cIQG2OsK9BhtzIldpC+ZJJFuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(30864003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vwSeKS2iJso1YKoAq9VkAfdl1JN8RkicvDrcmhXUxingDB8LsADA1TOjXzY7?=
 =?us-ascii?Q?R3xTB8Of0zIUlFUHEiz9FfTNDozqLXrmZbTMq42TaFItlzu9ZWclFlG/RtWW?=
 =?us-ascii?Q?rjsQmskIXfZ7vtnKxJbnwZECJSk89+9X1mfzMW8zkJaK1xgRryRBIQSANhWn?=
 =?us-ascii?Q?nezFfciqYTE3ubITpSGYT577HKP4os9j5XRbTrLBFVlksgzHaDFNIfc++obu?=
 =?us-ascii?Q?ofIR+iewn9TuL119B4QBKzx3mLEDU+45rEiYT37Tm3Ve+TAiRYN6bhVJwwoj?=
 =?us-ascii?Q?Glz3tGL25zRlAY1BD4o7bmLtp7AF3hy2bEyk5hLCbjVnRSuhog2nYSKYOePv?=
 =?us-ascii?Q?agpZoRCIMDRVIoa/wLXQqBIG6zZElEL34nrds0on0AQEIfK0tLWuL6pZlAiI?=
 =?us-ascii?Q?JtVPYXXKRgfC3Iwed7WXnvyEhHVGG5Sx3PXZbquKI+whr+4pfHDpm6/llCaZ?=
 =?us-ascii?Q?PoOfDph/eqlWP2a+gSAvZ9dzRSerULHClAttVO83mbT3TN1Ebkh/Z1JRbHdv?=
 =?us-ascii?Q?TDxBDJ0L7GAaHkpuNcSCD9KOUtYB0o0uRCChy/ZGO/fKz3rWnzngPvDo4xKx?=
 =?us-ascii?Q?d2SOp0tfn/Ux4aAeG4P4R6mT9iuw0heVxXzqlPGVlWVkl1minAZkj/TppXEF?=
 =?us-ascii?Q?1LHaEwHpVJMb7KdL/DrSjgfRah+urwDM/0+Mjiv5hAvUFzi4LfqCn/4sgWpa?=
 =?us-ascii?Q?J7y42UugizQMuiXGGCgsYS6tUtdAW4GoPLaq/omVVUDzhxTIJnyE+Vsq1hho?=
 =?us-ascii?Q?yImx4rkDlD85D8cm3kAkkeKu4NeeNZd1JtTxF0CwcsR6vXzvtet/rSw7K4Xh?=
 =?us-ascii?Q?8Rta2ihEUr4L7YvZaO+Z8oKyZbEmFNiPeuKLYyXun4yBhUQlrZtXbham022i?=
 =?us-ascii?Q?vmPX7selXbBD7Kg0AEJcKa+VjDonl0pXNxQ1LgCICLVKrKpBXA96QqhpcWsg?=
 =?us-ascii?Q?zhJpQE0TgsBdNox15UXX+LJFM94zhmV/AOSibk9mP2nbaH6NDarTqk19YM/8?=
 =?us-ascii?Q?ndZTLL8j4qGImM0wvib8cRwSoCCBrHQcJkZ2Xdt9l31OzL6IYlmS+TnHbhcK?=
 =?us-ascii?Q?tWqERMP4QumFEeWWzmqhefpFaLlDE9H52WwiQLcPZnE9/uj/Aj0NCOaXZQDl?=
 =?us-ascii?Q?ApyLfPMK94HG12Y9vsRuDPL5hwkWbwwbjCchCGBt0JaRTchC5sYa9D8BMu0D?=
 =?us-ascii?Q?LPRamkLkxyw5cP70z9NVHC6/KH9dDBLBJlAoQOMGT0gE+XE3lroZqiH/NZRn?=
 =?us-ascii?Q?g11KOWMuRzkVoMQPePPH6Y3VGMtX32wgD2QxKqHfsq+oSLuffm7RHBqNb61L?=
 =?us-ascii?Q?6Is5i7jWaapck3QEkPP1QFaV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f38ab3c-36dc-4512-3709-08d8ffad27d0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:03.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaghQGshkQuFjR1H6/FXz5b6E1fxNEao8SXw2WFXR9XG/O8IXxnahC5pCe9MR3c4eDEWewQQDACZrorJQ+cPBQ==
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

Register svm range with same address and size but perferred_location
is changed from CPU to GPU or from GPU to CPU, trigger migration the svm
range from ram to vram or from vram to ram.

If svm range prefetch location is GPU with flags
KFD_IOCTL_SVM_FLAG_HOST_ACCESS, validate the svm range on ram first,
then migrate it from ram to vram.

After migrating to vram is done, CPU access will have cpu page fault,
page fault handler migrate it back to ram and resume cpu access.

Migration steps:

1. migrate_vma_pages get svm range ram pages, notify the
interval is invalidated and unmap from CPU page table, HMM interval
notifier callback evict process queues
2. Allocate new pages in vram using TTM
3. Use svm copy memory to sdma copy data from ram to vram
4. migrate_vma_pages copy ram pages structure to vram pages structure
5. migrate_vma_finalize put ram pages to free ram pages and memory
6. Restore work wait for migration is finished, then update GPUs page
table mapping to new vram pages, resume process queues

If migrate_vma_setup failed to collect all ram pages of range, retry 3
times until success to start migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 305 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 201 ++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   7 +
 4 files changed, 502 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9971c210cb4c..745f69fca7ef 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -205,6 +205,311 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 	return r;
 }
 
+static uint64_t
+svm_migrate_node_physical_addr(struct amdgpu_device *adev,
+			       struct drm_mm_node **mm_node, uint64_t *offset)
+{
+	struct drm_mm_node *node = *mm_node;
+	uint64_t pos = *offset;
+
+	if (node->start == AMDGPU_BO_INVALID_OFFSET) {
+		pr_debug("drm node is not validated\n");
+		return 0;
+	}
+
+	pr_debug("vram node start 0x%llx npages 0x%llx\n", node->start,
+		 node->size);
+
+	if (pos >= node->size) {
+		do  {
+			pos -= node->size;
+			node++;
+		} while (pos >= node->size);
+
+		*mm_node = node;
+		*offset = pos;
+	}
+
+	return (node->start + pos) << PAGE_SHIFT;
+}
+
+unsigned long
+svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+{
+	return (addr + adev->kfd.dev->pgmap.range.start) >> PAGE_SHIFT;
+}
+
+static void
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+{
+	struct page *page;
+
+	page = pfn_to_page(pfn);
+	page->zone_device_data = prange;
+	get_page(page);
+	lock_page(page);
+}
+
+static void
+svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
+{
+	struct page *page;
+
+	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	unlock_page(page);
+	put_page(page);
+}
+
+
+static int
+svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
+			 struct migrate_vma *migrate, struct dma_fence **mfence,
+			 dma_addr_t *scratch)
+{
+	uint64_t npages = migrate->cpages;
+	struct device *dev = adev->dev;
+	struct drm_mm_node *node;
+	dma_addr_t *src;
+	uint64_t *dst;
+	uint64_t vram_addr;
+	uint64_t offset;
+	uint64_t i, j;
+	int r = -ENOMEM;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	src = scratch;
+	dst = (uint64_t *)(scratch + npages);
+
+	r = svm_range_vram_node_new(adev, prange, true);
+	if (r) {
+		pr_debug("failed %d get 0x%llx pages from vram\n", r, npages);
+		goto out;
+	}
+
+	node = prange->ttm_res->mm_node;
+	offset = prange->offset;
+	vram_addr = svm_migrate_node_physical_addr(adev, &node, &offset);
+	if (!vram_addr) {
+		WARN_ONCE(1, "vram node address is 0\n");
+		r = -ENOMEM;
+		goto out;
+	}
+
+	for (i = j = 0; i < npages; i++) {
+		struct page *spage;
+
+		dst[i] = vram_addr + (j << PAGE_SHIFT);
+		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+		svm_migrate_get_vram_page(prange, migrate->dst[i]);
+
+		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+
+		if (migrate->src[i] & MIGRATE_PFN_VALID) {
+			spage = migrate_pfn_to_page(migrate->src[i]);
+			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
+					      DMA_TO_DEVICE);
+			r = dma_mapping_error(dev, src[i]);
+			if (r) {
+				pr_debug("failed %d dma_map_page\n", r);
+				goto out_free_vram_pages;
+			}
+		} else {
+			if (j) {
+				r = svm_migrate_copy_memory_gart(
+						adev, src + i - j,
+						dst + i - j, j,
+						FROM_RAM_TO_VRAM,
+						mfence);
+				if (r)
+					goto out_free_vram_pages;
+				offset += j;
+				vram_addr = (node->start + offset) << PAGE_SHIFT;
+				j = 0;
+			} else {
+				offset++;
+				vram_addr += PAGE_SIZE;
+			}
+			if (offset >= node->size) {
+				node++;
+				pr_debug("next node size 0x%llx\n", node->size);
+				vram_addr = node->start << PAGE_SHIFT;
+				offset = 0;
+			}
+			continue;
+		}
+
+		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
+			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
+
+		if (j + offset >= node->size - 1 && i < npages - 1) {
+			r = svm_migrate_copy_memory_gart(adev, src + i - j,
+							 dst + i - j, j + 1,
+							 FROM_RAM_TO_VRAM,
+							 mfence);
+			if (r)
+				goto out_free_vram_pages;
+
+			node++;
+			pr_debug("next node size 0x%llx\n", node->size);
+			vram_addr = node->start << PAGE_SHIFT;
+			offset = 0;
+			j = 0;
+		} else {
+			j++;
+		}
+	}
+
+	r = svm_migrate_copy_memory_gart(adev, src + i - j, dst + i - j, j,
+					 FROM_RAM_TO_VRAM, mfence);
+
+out_free_vram_pages:
+	if (r) {
+		pr_debug("failed %d to copy memory to vram\n", r);
+		while (i--) {
+			svm_migrate_put_vram_page(adev, dst[i]);
+			migrate->dst[i] = 0;
+		}
+	}
+
+out:
+	return r;
+}
+
+static int
+svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
+			struct vm_area_struct *vma, uint64_t start,
+			uint64_t end)
+{
+	uint64_t npages = (end - start) >> PAGE_SHIFT;
+	struct dma_fence *mfence = NULL;
+	struct migrate_vma migrate;
+	dma_addr_t *scratch;
+	size_t size;
+	void *buf;
+	int r = -ENOMEM;
+	int retry = 0;
+
+	memset(&migrate, 0, sizeof(migrate));
+	migrate.vma = vma;
+	migrate.start = start;
+	migrate.end = end;
+	migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
+	migrate.pgmap_owner = adev;
+
+	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
+	size *= npages;
+	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
+	if (!buf)
+		goto out;
+
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+	scratch = (dma_addr_t *)(migrate.dst + npages);
+
+retry:
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->start, prange->last);
+		goto out_free;
+	}
+	if (migrate.cpages != npages) {
+		pr_debug("collect 0x%lx/0x%llx pages, retry\n", migrate.cpages,
+			 npages);
+		migrate_vma_finalize(&migrate);
+		if (retry++ >= 3) {
+			r = -ENOMEM;
+			pr_debug("failed %d migrate svms 0x%p [0x%lx 0x%lx]\n",
+				 r, prange->svms, prange->start, prange->last);
+			goto out_free;
+		}
+
+		goto retry;
+	}
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_vram(adev, prange, &migrate, &mfence,
+					 scratch);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	}
+
+	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
+	svm_range_free_dma_mappings(prange);
+
+out_free:
+	kvfree(buf);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_ram_to_vram - migrate svm range from system to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
+{
+	unsigned long addr, start, end;
+	struct vm_area_struct *vma;
+	struct amdgpu_device *adev;
+	struct mm_struct *mm;
+	int r = 0;
+
+	if (prange->actual_loc == best_loc) {
+		pr_debug("svms 0x%p [0x%lx 0x%lx] already on best_loc 0x%x\n",
+			 prange->svms, prange->start, prange->last, best_loc);
+		return 0;
+	}
+
+	adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n", best_loc);
+		return -ENODEV;
+	}
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx] to gpu 0x%x\n", prange->svms,
+		 prange->start, prange->last, best_loc);
+
+	/* FIXME: workaround for page locking bug with invalid pages */
+	svm_range_prefault(prange, mm);
+
+	start = prange->start << PAGE_SHIFT;
+	end = (prange->last + 1) << PAGE_SHIFT;
+
+	mm = current->mm;
+
+	for (addr = start; addr < end;) {
+		unsigned long next;
+
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start)
+			break;
+
+		next = min(vma->vm_end, end);
+		r = svm_migrate_vma_to_vram(adev, prange, vma, addr, next);
+		if (r) {
+			pr_debug("failed to migrate\n");
+			break;
+		}
+		addr = next;
+	}
+
+	if (!r)
+		prange->actual_loc = best_loc;
+
+	return r;
+}
+
 static void svm_migrate_page_free(struct page *page)
 {
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index df84e4143e25..d9cee0f6285a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -38,6 +38,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
+int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c874cf025743..cfcfef0ff109 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -31,6 +31,7 @@
 #include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
+#include "kfd_migrate.h"
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
@@ -177,8 +178,8 @@ svm_range_dma_map(struct svm_range *prange, unsigned long *bitmap,
 	return r;
 }
 
-static void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
-				unsigned long offset, unsigned long npages)
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages)
 {
 	enum dma_data_direction dir = DMA_BIDIRECTIONAL;
 	int i;
@@ -195,7 +196,7 @@ static void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 	}
 }
 
-static void svm_range_free_dma_mappings(struct svm_range *prange)
+void svm_range_free_dma_mappings(struct svm_range *prange)
 {
 	struct kfd_process_device *pdd;
 	dma_addr_t *dma_addr;
@@ -230,6 +231,7 @@ static void svm_range_free(struct svm_range *prange)
 	svm_range_vram_node_free(prange);
 	svm_range_free_dma_mappings(prange);
 	mutex_destroy(&prange->lock);
+	mutex_destroy(&prange->migrate_mutex);
 	kfree(prange);
 }
 
@@ -266,6 +268,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
 	atomic_set(&prange->invalid, 0);
+	mutex_init(&prange->migrate_mutex);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -1238,6 +1241,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 			pr_debug("failed %d to dma map range\n", r);
 			goto unreserve_out;
 		}
+
+		prange->validated_once = true;
 	}
 
 	svm_range_lock(prange);
@@ -1329,21 +1334,28 @@ static void svm_range_restore_work(struct work_struct *work)
 			 prange->svms, prange, prange->start, prange->last,
 			 invalid);
 
+		/*
+		 * If range is migrating, wait for migration is done.
+		 */
+		mutex_lock(&prange->migrate_mutex);
+
 		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
 					       false, true);
-		if (r) {
+		if (r)
 			pr_debug("failed %d to map 0x%lx to gpus\n", r,
 				 prange->start);
-			goto unlock_out;
-		}
+
+		mutex_unlock(&prange->migrate_mutex);
+		if (r)
+			goto out_reschedule;
 
 		if (atomic_cmpxchg(&prange->invalid, invalid, 0) != invalid)
-			goto unlock_out;
+			goto out_reschedule;
 	}
 
 	if (atomic_cmpxchg(&svms->evicted_ranges, evicted_ranges, 0) !=
 	    evicted_ranges)
-		goto unlock_out;
+		goto out_reschedule;
 
 	evicted_ranges = 0;
 
@@ -1357,7 +1369,7 @@ static void svm_range_restore_work(struct work_struct *work)
 
 	pr_debug("restore svm ranges successfully\n");
 
-unlock_out:
+out_reschedule:
 	mutex_unlock(&svms->lock);
 	mmap_write_unlock(mm);
 	mutex_unlock(&process_info->lock);
@@ -1649,6 +1661,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 		list_del_init(&prange->deferred_list);
 		spin_unlock(&svms->deferred_list_lock);
 
+		mutex_lock(&prange->migrate_mutex);
 		while (!list_empty(&prange->child_list)) {
 			struct svm_range *pchild;
 
@@ -1659,6 +1672,7 @@ static void svm_range_deferred_list_work(struct work_struct *work)
 			list_del_init(&pchild->child_list);
 			svm_range_handle_list_op(svms, pchild);
 		}
+		mutex_unlock(&prange->migrate_mutex);
 
 		svm_range_handle_list_op(svms, prange);
 		mutex_unlock(&svms->lock);
@@ -1957,6 +1971,151 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 	return 0;
 }
 
+/* svm_range_best_location - decide the best actual location
+ * @prange: svm range structure
+ *
+ * For xnack off:
+ * If range map to single GPU, the best acutal location is prefetch loc, which
+ * can be CPU or GPU.
+ *
+ * If range map to multiple GPUs, only if mGPU connection on xgmi same hive,
+ * the best actual location could be prefetch_loc GPU. If mGPU connection on
+ * PCIe, the best actual location is always CPU, because GPU cannot access vram
+ * of other GPUs, assuming PCIe small bar (large bar support is not upstream).
+ *
+ * For xnack on:
+ * The best actual location is prefetch location. If mGPU connection on xgmi
+ * same hive, range map to multiple GPUs. Otherwise, the range only map to
+ * actual location GPU. Other GPU access vm fault will trigger migration.
+ *
+ * Context: Process context
+ *
+ * Return:
+ * 0 for CPU or GPU id
+ */
+static uint32_t svm_range_best_location(struct svm_range *prange)
+{
+	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
+	uint32_t best_loc = prange->prefetch_loc;
+	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
+	struct amdgpu_device *adev;
+	struct kfd_process *p;
+	uint32_t gpuidx;
+
+	p = container_of(prange->svms, struct kfd_process, svms);
+
+	/* xnack on */
+	if (p->xnack_enabled)
+		goto out;
+
+	/* xnack off */
+	if (!best_loc || best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED)
+		goto out;
+
+	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
+		  MAX_GPU_INSTANCE);
+
+	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to get device by idx 0x%x\n", gpuidx);
+			continue;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
+
+		if (adev == bo_adev)
+			continue;
+
+		if (!amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			best_loc = 0;
+			break;
+		}
+	}
+
+out:
+	pr_debug("xnack %d svms 0x%p [0x%lx 0x%lx] best loc 0x%x\n",
+		 p->xnack_enabled, &p->svms, prange->start, prange->last,
+		 best_loc);
+
+	return best_loc;
+}
+
+/* FIXME: This is a workaround for page locking bug when some pages are
+ * invalid during migration to VRAM
+ */
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm)
+{
+	struct hmm_range *hmm_range;
+	int r;
+
+	if (prange->validated_once)
+		return;
+
+	r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+				       prange->start << PAGE_SHIFT,
+				       prange->npages, &hmm_range,
+				       false, true);
+	if (!r) {
+		amdgpu_hmm_range_get_pages_done(hmm_range);
+		prange->validated_once = true;
+	}
+}
+
+/* svm_range_trigger_migration - start page migration if prefetch loc changed
+ * @mm: current process mm_struct
+ * @prange: svm range structure
+ * @migrated: output, true if migration is triggered
+ *
+ * If range perfetch_loc is GPU, actual loc is cpu 0, then migrate the range
+ * from ram to vram.
+ * If range prefetch_loc is cpu 0, actual loc is GPU, then migrate the range
+ * from vram to ram.
+ *
+ * If GPU vm fault retry is not enabled, migration interact with MMU notifier
+ * and restore work:
+ * 1. migrate_vma_setup invalidate pages, MMU notifier callback svm_range_evict
+ *    stops all queues, schedule restore work
+ * 2. svm_range_restore_work wait for migration is done by
+ *    a. svm_range_validate_vram takes prange->migrate_mutex
+ *    b. svm_range_validate_ram HMM get pages wait for CPU fault handle returns
+ * 3. restore work update mappings of GPU, resume all queues.
+ *
+ * Context: Process context
+ *
+ * Return:
+ * 0 - OK, otherwise - error code of migration
+ */
+static int
+svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
+			    bool *migrated)
+{
+	uint32_t best_loc;
+	int r = 0;
+
+	*migrated = false;
+	best_loc = svm_range_best_location(prange);
+
+	if (best_loc == KFD_IOCTL_SVM_LOCATION_UNDEFINED ||
+	    best_loc == prange->actual_loc)
+		return 0;
+
+	if (best_loc && !prange->actual_loc &&
+	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS))
+		return 0;
+
+	if (best_loc) {
+		pr_debug("migrate from ram to vram\n");
+		r = svm_migrate_ram_to_vram(prange, best_loc);
+
+		if (!r)
+			*migrated = true;
+	}
+
+	return r;
+}
+
 static int
 svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -2027,13 +2186,29 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	 * case because the rollback wouldn't be guaranteed to work either.
 	 */
 	list_for_each_entry(prange, &update_list, update_list) {
+		bool migrated;
+
+		mutex_lock(&prange->migrate_mutex);
+
+		r = svm_range_trigger_migration(mm, prange, &migrated);
+		if (r)
+			goto out_unlock_range;
+
+		if (migrated) {
+			pr_debug("restore_work will update mappings of GPUs\n");
+			mutex_unlock(&prange->migrate_mutex);
+			continue;
+		}
+
 		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
 					       true, true);
-		if (r) {
-			pr_debug("failed %d to map 0x%lx to gpus\n", r,
-				 prange->start);
+		if (r)
+			pr_debug("failed %d to map svm range\n", r);
+
+out_unlock_range:
+		mutex_unlock(&prange->migrate_mutex);
+		if (r)
 			break;
-		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 0aab88c71855..34214a44b099 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -56,6 +56,7 @@ struct svm_work_list_item {
  * struct svm_range - shared virtual memory range
  *
  * @svms:       list of svm ranges, structure defined in kfd_process
+ * @migrate_mutex: to serialize range migration, validation and mapping update
  * @start:      range start address in pages
  * @last:       range last address in pages
  * @it_node:    node [start, last] stored in interval tree, start, last are page
@@ -92,6 +93,7 @@ struct svm_work_list_item {
  */
 struct svm_range {
 	struct svm_range_list		*svms;
+	struct mutex			migrate_mutex;
 	unsigned long			start;
 	unsigned long			last;
 	struct interval_tree_node	it_node;
@@ -120,6 +122,7 @@ struct svm_range {
 	struct list_head		child_list;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
+	bool				validated_once;
 };
 
 static inline void svm_range_lock(struct svm_range *prange)
@@ -144,5 +147,9 @@ struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
+			 unsigned long offset, unsigned long npages);
+void svm_range_free_dma_mappings(struct svm_range *prange);
+void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
