Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BD350DBD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FCE89856;
	Thu,  1 Apr 2021 04:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366776EC40;
 Thu,  1 Apr 2021 04:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkzEP9B69hs33t4dKSrrdBgTA6SEwG+3NXGL7OM0z83DmB6tu64iNc3uyMiUJUvQyfv3r1Y/yYhr8hviM0GZF5xFJ48Le9R6O9sOoliB9KPQIzLANwMmSWAkkLcIFdiwWpainX+d3ixbdsLUXukX0a0QB8htuKBkK9xqMS2oJd2swpHzysvebRgfemUmE/ww2r+WKTP8aRN3WXE6uByw/BbK8SvIiKlXjUc9KpymAd3WyyMDb7BzZau7vcF1vmXIrX/0jI9QI3Op0Lr63Dm7hLXId1s18WaQzzYVG035dlzV6BsMqpS97Wb3bA85gWUSiTMP+m9se7+UEaTdo+zTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRmMZuRo5uHkVf5tJW+lMUaN3uZE9Is1ISXb9KuIhlY=;
 b=TAjfyOvcf8nxfiidCYV0bmpOLiAMTmuIqFX8sY7Z9ynL+3udw0vhhg/ZpeApN4PuPGc+lYYFU93f/sPri+bVyDdbepAD16S4ZtItVymLeIJzVHKPwrX+3nFZtmGrFAloI9/rgCX0QMmzx14fbtvjxqI4cVnmUt9SKN/OBKbrDWD7Z9GtkuMTuCb3EAkKABT2WBi09LabqHRrZrgg0eoKzJ5cVpqYXtVeIAP5ERPefYjGf5R7lALexJZ1J9NroHcf3b9xEmDjppa1OUEaERIHX5fPGC02gRHLWY+yHBI9CoTaPrPGvIey4MG3tr293OZcP8P8fQpN0LbXwC4yXwGhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRmMZuRo5uHkVf5tJW+lMUaN3uZE9Is1ISXb9KuIhlY=;
 b=Vu4285ZEgjpNJpR2q4We4R7v5N2cppo5fadDY692I/SKEqhj2WCAVWvzEn10DlRf5yiVkrmlYMdQyelUkKMgV934AVU0znw3DoSI78zbZX+SaklvQ5S2zEQicRUlcxdRo080/shhLANleadGS3fV4fIa4xq16TLzxMie8qbUkZ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:00 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/34] drm/amdkfd: HMM migrate vram to ram
Date: Thu,  1 Apr 2021 00:22:13 -0400
Message-Id: <20210401042228.1423-20-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7833afcf-5131-40ad-3c08-08d8f4c5d59b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42221929A844DE085DFED858927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +z4P9BEQJIhcc489vSPMQewn/LN/0TFWUMW3JjStojkavsULFZyClyHSV2P5pg4zVigHTh5bJvnGWgO4VE7Fe14Kxs3YhMZgeBhOeRp/VGgCnf/AOKWCOaQ68BJDcgzSymsueX49AZgCIeb/1VcQj7LvmlO9njfFTbDN+LOWuZU51IvTmngtqU4/y0KDkI4LFhqLW5R6aXHvq5qGe1ZXL2wzWQ/xY6LUFsUshEhLbABYgk9nc+9WHOb6im76fqh1GenlqXXz9LKUX1ytjEFYelFJvzg2EiKFk5NOPJUoH+BrR7NDi7nphoo8NxKygmKzdiNcWalkDbSgAx00TEnP0XpIGR/E0Pv0jgZi+O2BEb8EKPO1ohs16e/zU3knmP6W10ICVj3oyTCLBEU018RAZn/llbaZiR2KAHeQfc3+7AToYFVx8wrfKerm3tiZPtkHgQZ9q97HdqJGkgtBBJq+ii/H9U7Z8j5M5rMrRY1iDu6vC7xn3mlAR2uTVGUYksN2kvIKMJgOq6EWL+Mj9VWNon55eyqLEinJ1k9YWpKSLWOAtCILTtWFAEh3VuQ1txs0bKHxjyt0q9Y3c4Ko3Z3JP8+X3mvoRo52pFBfFWZTMPR2iOqW1pK8m78qVTsbrGomArKXmqaqLuYqQX0snSkPQxhIWlvt0W5VElY6T0CKvBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(30864003)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JbJK7jxfmX0pxTPHQdQ+fLAlMB+/A0X5i8rUk1Q4ywDABMwI+euTD/8JV8fL?=
 =?us-ascii?Q?qvGHhbXjRc2kZNJRtIpGCHTMATgYYG5v+3APx397tSrZf8U1IplnJLgQvsC+?=
 =?us-ascii?Q?HwSF5mAiydxTERtXVUGjK5tusaCRY8Xu2DPRiZHHMHEcAI9vohkV9olExPes?=
 =?us-ascii?Q?SCVK3p7/7NXQAmGoG9EmP4BcENu1ftjTWpAznKE7W6ay6A1/54oGdDmwcnf4?=
 =?us-ascii?Q?YAHwkYjC7o3aAqZ0vcvM5GGlqaS3F1kuDYaGFuOlaS7kdG2db3V3/fmjS76n?=
 =?us-ascii?Q?hZuHVTgBbB5Woe4UFXMu9gckv7NhweshQdpftEjuCLUvTJjxvMyayh1049dB?=
 =?us-ascii?Q?1M+CSEb6DYWAzpB/15TsiRVzBZBs4a8y0NhFoToa6RnjdKDxo3pFWW0+NTZF?=
 =?us-ascii?Q?h7jLhxk6jf9rX5ITTkXJIj9kLXxsdeSUhMPtBeZqaQaRcORtCtEQuGG9LV3J?=
 =?us-ascii?Q?cnQKDVp81+aPr0rDjntptYVQvtjlhRz1LLmRTf/BFWMyv3WmmHs6E/0yb/Uu?=
 =?us-ascii?Q?VXwis8c11JlscAEqN1V+WXubHFX9TFjCw5RwS1dKphnbULDMz8iCPUNj62XB?=
 =?us-ascii?Q?BFkTiCviiXDaROb2nmY/qzinFcu1MiW8nHJtqnAFqxfocWxuyL1+wn/ZoHxi?=
 =?us-ascii?Q?M55D/7nUUtssoB5ZUwi1Nj/6gC/KDqcyMusb4VLzp220BYARvxM7+xO+L0zg?=
 =?us-ascii?Q?elKdCO4TVLFMRLsRXa+ZRRlbbJAunk0+00AQ/9ljbx7OuLsKEkqAI6XW4iJs?=
 =?us-ascii?Q?ZNO3InWG3BuhY4LzPK8XvnCWInxkS+EwIKsaa6C15D0+IDFLSn861IBG2dcw?=
 =?us-ascii?Q?nad1LBaki36B7TltmZwBX0CTPZoaYsBbt5x7CrHSVxS9OaV85p0djqovXcKC?=
 =?us-ascii?Q?tWs1eeoS69lNcVJpwR2D7E4YW5FoXvV+Fvs2/80KhFCdaSJB8LoVvl+fJMmw?=
 =?us-ascii?Q?OeOAOocHI52dniO2w68Lj3KAA0QJjojxz1DL0zWu+brzgwNnYK5afOhSE4/F?=
 =?us-ascii?Q?l+Ji5tvEVrYArLWbrd6LTsm82Pj8pgan7hF3KczJxz+8XLE1+s/mlZpg3Mzd?=
 =?us-ascii?Q?9hmu7z1lxUMiOeQtviu7r0pQBXqs/CmYCePpm6W8OecxuxC6sgZ/zmfDMXY1?=
 =?us-ascii?Q?kLKbS22R+qmJoXgFV6kue+geJmyl28lammRTZXI9GaNf4noc3qVBJqPKf/So?=
 =?us-ascii?Q?+HqD85OeG1HU8RYT/AxKzDpIw2hKcxngp9bQ1R1pLIjqxkxt2uNM6f9Lr4Uz?=
 =?us-ascii?Q?u0Z13vh3L6yfEFgG9kqjVrtRCZudo6HCrrK6Q8i099KetPQ2ZLFlsAbNgnsw?=
 =?us-ascii?Q?iPBDmGnsi1/me3GR+HWxah+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7833afcf-5131-40ad-3c08-08d8f4c5d59b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:00.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hLhoecZm0lagv/rvf9KqKGa2iUOavZaANuqfCNoQteZmnhKys70asZuzqvQf1mIQMuzzbYQmsEbUSiLr/PrPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

If CPU page fault happens, HMM pgmap_ops callback migrate_to_ram start
migrate memory from vram to ram in steps:

1. migrate_vma_pages get vram pages, and notify HMM to invalidate the
pages, HMM interval notifier callback evict process queues
2. Allocate system memory pages
3. Use svm copy memory to migrate data from vram to ram
4. migrate_vma_pages copy pages structure from vram pages to ram pages
5. Return VM_FAULT_SIGBUS if migration failed, to notify application
6. migrate_vma_finalize put vram pages, page_free callback free vram
pages and vram nodes
7. Restore work wait for migration is finished, then update GPU page
table mapping to system memory, and resume process queues

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 300 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 123 +++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  10 +
 4 files changed, 426 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index fcaf34096820..81bae0adc0cf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -259,6 +259,35 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 	put_page(page);
 }
 
+static unsigned long
+svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
+{
+	unsigned long addr;
+
+	addr = page_to_pfn(page) << PAGE_SHIFT;
+	return (addr - adev->kfd.dev->pgmap.range.start);
+}
+
+static struct page *
+svm_migrate_get_sys_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	struct page *page;
+
+	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
+	if (page)
+		lock_page(page);
+
+	return page;
+}
+
+void svm_migrate_put_sys_page(unsigned long addr)
+{
+	struct page *page;
+
+	page = pfn_to_page(addr >> PAGE_SHIFT);
+	unlock_page(page);
+	put_page(page);
+}
 
 static int
 svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
@@ -511,13 +540,213 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 
 static void svm_migrate_page_free(struct page *page)
 {
+	/* Keep this function to avoid warning */
+}
+
+static int
+svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
+			struct migrate_vma *migrate, struct dma_fence **mfence,
+			dma_addr_t *scratch)
+{
+	uint64_t npages = migrate->cpages;
+	struct device *dev = adev->dev;
+	uint64_t *src;
+	dma_addr_t *dst;
+	struct page *dpage;
+	uint64_t i = 0, j;
+	uint64_t addr;
+	int r = 0;
+
+	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
+		 prange->last);
+
+	addr = prange->start << PAGE_SHIFT;
+
+	src = (uint64_t *)(scratch + npages);
+	dst = scratch;
+
+	for (i = 0, j = 0; i < npages; i++, j++, addr += PAGE_SIZE) {
+		struct page *spage;
+
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		if (!spage) {
+			pr_debug("failed get spage svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->start, prange->last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+		src[i] = svm_migrate_addr(adev, spage);
+		if (i > 0 && src[i] != src[i - 1] + PAGE_SIZE) {
+			r = svm_migrate_copy_memory_gart(adev, dst + i - j,
+							 src + i - j, j,
+							 FROM_VRAM_TO_RAM,
+							 mfence);
+			if (r)
+				goto out_oom;
+			j = 0;
+		}
+
+		dpage = svm_migrate_get_sys_page(migrate->vma, addr);
+		if (!dpage) {
+			pr_debug("failed get page svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->start, prange->last);
+			r = -ENOMEM;
+			goto out_oom;
+		}
+
+		dst[i] = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_FROM_DEVICE);
+		r = dma_mapping_error(dev, dst[i]);
+		if (r) {
+			pr_debug("failed %d dma_map_page\n", r);
+			goto out_oom;
+		}
+
+		pr_debug("dma mapping dst to 0x%llx, page_to_pfn 0x%lx\n",
+			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
+
+		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+	}
+
+	r = svm_migrate_copy_memory_gart(adev, dst + i - j, src + i - j, j,
+					 FROM_VRAM_TO_RAM, mfence);
+
+out_oom:
+	if (r) {
+		pr_debug("failed %d copy to ram\n", r);
+		while (i--) {
+			svm_migrate_put_sys_page(dst[i]);
+			migrate->dst[i] = 0;
+		}
+	}
+
+	return r;
+}
+
+static int
+svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
+		       struct vm_area_struct *vma, uint64_t start, uint64_t end)
+{
+	uint64_t npages = (end - start) >> PAGE_SHIFT;
+	struct dma_fence *mfence = NULL;
+	struct migrate_vma migrate;
+	dma_addr_t *scratch;
+	size_t size;
+	void *buf;
+	int r = -ENOMEM;
+
+	memset(&migrate, 0, sizeof(migrate));
+	migrate.vma = vma;
+	migrate.start = start;
+	migrate.end = end;
+	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
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
+	r = migrate_vma_setup(&migrate);
+	if (r) {
+		pr_debug("failed %d prepare migrate svms 0x%p [0x%lx 0x%lx]\n",
+			 r, prange->svms, prange->start, prange->last);
+		goto out_free;
+	}
+
+	pr_debug("cpages %ld\n", migrate.cpages);
+
+	if (migrate.cpages) {
+		svm_migrate_copy_to_ram(adev, prange, &migrate, &mfence,
+					scratch);
+		migrate_vma_pages(&migrate);
+		svm_migrate_copy_done(adev, mfence);
+		migrate_vma_finalize(&migrate);
+	} else {
+		pr_debug("failed collect migrate device pages [0x%lx 0x%lx]\n",
+			 prange->start, prange->last);
+	}
+
+	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
+
+out_free:
+	kvfree(buf);
+out:
+	return r;
+}
+
+/**
+ * svm_migrate_vram_to_ram - migrate svm range from device to system
+ * @prange: range structure
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
+{
+	struct amdgpu_device *adev;
+	struct vm_area_struct *vma;
+	unsigned long addr;
+	unsigned long start;
+	unsigned long end;
+	int r = 0;
+
+	if (!prange->actual_loc) {
+		pr_debug("[0x%lx 0x%lx] already migrated to ram\n",
+			 prange->start, prange->last);
+		return 0;
+	}
+
+	adev = svm_range_get_adev_by_id(prange, prange->actual_loc);
+	if (!adev) {
+		pr_debug("failed to get device by id 0x%x\n",
+			 prange->actual_loc);
+		return -ENODEV;
+	}
+
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] from gpu 0x%x to ram\n",
+		 prange->svms, prange, prange->start, prange->last,
+		 prange->actual_loc);
+
+	start = prange->start << PAGE_SHIFT;
+	end = (prange->last + 1) << PAGE_SHIFT;
+
+	for (addr = start; addr < end;) {
+		unsigned long next;
+
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start)
+			break;
+
+		next = min(vma->vm_end, end);
+		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next);
+		if (r) {
+			pr_debug("failed %d to migrate\n", r);
+			break;
+		}
+		addr = next;
+	}
+
+	if (!r) {
+		svm_range_vram_node_free(prange);
+		prange->actual_loc = 0;
+	}
+	return r;
 }
 
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
  *
- * Context: vm fault handler, mm->mmap_sem is taken
+ * Context: vm fault handler, caller holds the mmap read lock
  *
  * Return:
  * 0 - OK
@@ -525,7 +754,74 @@ static void svm_migrate_page_free(struct page *page)
  */
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
-	return VM_FAULT_SIGBUS;
+	unsigned long addr = vmf->address;
+	struct vm_area_struct *vma;
+	enum svm_work_list_ops op;
+	struct svm_range *parent;
+	struct svm_range *prange;
+	struct kfd_process *p;
+	struct mm_struct *mm;
+	int r = 0;
+
+	vma = vmf->vma;
+	mm = vma->vm_mm;
+
+	p = kfd_lookup_process_by_mm(vma->vm_mm);
+	if (!p) {
+		pr_debug("failed find process at fault address 0x%lx\n", addr);
+		return VM_FAULT_SIGBUS;
+	}
+	addr >>= PAGE_SHIFT;
+	pr_debug("CPU page fault svms 0x%p address 0x%lx\n", &p->svms, addr);
+
+	mutex_lock(&p->svms.lock);
+
+	prange = svm_range_from_addr(&p->svms, addr, &parent);
+	if (!prange) {
+		pr_debug("cannot find svm range at 0x%lx\n", addr);
+		r = -EFAULT;
+		goto out;
+	}
+
+	mutex_lock(&parent->migrate_mutex);
+	if (prange != parent)
+		mutex_lock_nested(&prange->migrate_mutex, 1);
+
+	if (!prange->actual_loc)
+		goto out_unlock_prange;
+
+	svm_range_lock(parent);
+	if (prange != parent)
+		mutex_lock_nested(&prange->lock, 1);
+	r = svm_range_split_by_granularity(p, mm, addr, parent, prange);
+	if (prange != parent)
+		mutex_unlock(&prange->lock);
+	svm_range_unlock(parent);
+	if (r) {
+		pr_debug("failed %d to split range by granularity\n", r);
+		goto out_unlock_prange;
+	}
+
+	r = svm_migrate_vram_to_ram(prange, mm);
+	if (r)
+		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
+			 prange, prange->start, prange->last);
+
+	op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+	svm_range_add_list_work(&p->svms, parent, mm, op);
+	schedule_deferred_list_work(&p->svms);
+
+out_unlock_prange:
+	if (prange != parent)
+		mutex_unlock(&prange->migrate_mutex);
+	mutex_unlock(&parent->migrate_mutex);
+out:
+	mutex_unlock(&p->svms.lock);
+	kfd_unref_process(p);
+
+	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
+
+	return r ? VM_FAULT_SIGBUS : 0;
 }
 
 static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index ffae5f989909..95fd7b21791f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -38,6 +38,9 @@ enum MIGRATION_COPY_DIR {
 };
 
 int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc);
+int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
+unsigned long
+svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
 #if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 769d9e3b856e..a83a7242c760 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -861,6 +861,60 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 	list_add_tail(&pchild->child_list, &prange->child_list);
 }
 
+/**
+ * svm_range_split_by_granularity - collect ranges within granularity boundary
+ *
+ * @p: the process with svms list
+ * @mm: mm structure
+ * @addr: the vm fault address in pages, to split the prange
+ * @parent: parent range if prange is from child list
+ * @prange: prange to split
+ *
+ * Trims @prange to be a single aligned block of prange->granularity if
+ * possible. The head and tail are added to the child_list in @parent.
+ *
+ * Context: caller must hold mmap_read_lock and prange->lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int
+svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
+			       unsigned long addr, struct svm_range *parent,
+			       struct svm_range *prange)
+{
+	struct svm_range *head, *tail;
+	unsigned long start, last, size;
+	int r;
+
+	/* Align splited range start and size to granularity size, then a single
+	 * PTE will be used for whole range, this reduces the number of PTE
+	 * updated and the L1 TLB space used for translation.
+	 */
+	size = 1UL << prange->granularity;
+	start = ALIGN_DOWN(addr, size);
+	last = ALIGN(addr + 1, size) - 1;
+
+	pr_debug("svms 0x%p split [0x%lx 0x%lx] to [0x%lx 0x%lx] size 0x%lx\n",
+		 prange->svms, prange->start, prange->last, start, last, size);
+
+	if (start > prange->start) {
+		r = svm_range_split(prange, start, prange->last, &head);
+		if (r)
+			return r;
+		svm_range_add_child(parent, mm, head, SVM_OP_ADD_RANGE);
+	}
+
+	if (last < prange->last) {
+		r = svm_range_split(prange, prange->start, last, &tail);
+		if (r)
+			return r;
+		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
+	}
+
+	return 0;
+}
+
 static uint64_t
 svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 {
@@ -1768,12 +1822,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 /**
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
- * MMU range unmap notifier to remove svm ranges
+ * If event is MMU_NOTIFY_UNMAP, this is from CPU unmap range, otherwise, it
+ * is from migration, or CPU page invalidation callback.
+ *
+ * For unmap event, unmap range from GPUs, remove prange from svms in a delayed
+ * work thread, and split prange if only part of prange is unmapped.
+ *
+ * For invalidation event, if GPU retry fault is not enabled, evict the queues,
+ * then schedule svm_range_restore_work to update GPU mapping and resume queues.
+ * If GPU retry fault is enabled, unmap the svm range from GPU, retry fault will
+ * update GPU mapping to recover.
  *
- * If GPU vm fault retry is not enabled, evict the svm range, then restore
- * work will update GPU mapping.
- * If GPU vm fault retry is enabled, unmap the svm range from GPU, vm fault
- * will update GPU mapping.
+ * Context: mmap lock, notifier_invalidate_start lock are held
+ *          for invalidate event, prange lock is held if this is from migration
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -1811,6 +1872,49 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	return true;
 }
 
+/**
+ * svm_range_from_addr - find svm range from fault address
+ * @svms: svm range list header
+ * @addr: address to search range interval tree, in pages
+ * @parent: parent range if range is on child list
+ *
+ * Context: The caller must hold svms->lock
+ *
+ * Return: the svm_range found or NULL
+ */
+struct svm_range *
+svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
+		    struct svm_range **parent)
+{
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+	struct svm_range *pchild;
+
+	node = interval_tree_iter_first(&svms->objects, addr, addr);
+	if (!node)
+		return NULL;
+
+	prange = container_of(node, struct svm_range, it_node);
+	pr_debug("address 0x%lx prange [0x%lx 0x%lx] node [0x%lx 0x%lx]\n",
+		 addr, prange->start, prange->last, node->start, node->last);
+
+	if (addr >= prange->start && addr <= prange->last) {
+		if (parent)
+			*parent = prange;
+		return prange;
+	}
+	list_for_each_entry(pchild, &prange->child_list, child_list)
+		if (addr >= pchild->start && addr <= pchild->last) {
+			pr_debug("found address 0x%lx pchild [0x%lx 0x%lx]\n",
+				 addr, pchild->start, pchild->last);
+			if (parent)
+				*parent = prange;
+			return pchild;
+		}
+
+	return NULL;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	struct svm_range *prange;
@@ -2070,11 +2174,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	if (best_loc) {
 		pr_debug("migrate from ram to vram\n");
 		r = svm_migrate_ram_to_vram(prange, best_loc);
-
-		if (!r)
-			*migrated = true;
+	} else {
+		pr_debug("migrate from vram to ram\n");
+		r = svm_migrate_vram_to_ram(prange, current->mm);
 	}
 
+	if (!r)
+		*migrated = true;
+
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index ad4ec8337762..32c87957aa43 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -141,11 +141,21 @@ void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	      uint64_t size, uint32_t nattrs,
 	      struct kfd_ioctl_svm_attribute *attrs);
+struct svm_range *svm_range_from_addr(struct svm_range_list *svms,
+				      unsigned long addr,
+				      struct svm_range **parent);
 struct amdgpu_device *svm_range_get_adev_by_id(struct svm_range *prange,
 					       uint32_t id);
 int svm_range_vram_node_new(struct amdgpu_device *adev,
 			    struct svm_range *prange, bool clear);
 void svm_range_vram_node_free(struct svm_range *prange);
+int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
+			       unsigned long addr, struct svm_range *parent,
+			       struct svm_range *prange);
+void svm_range_add_list_work(struct svm_range_list *svms,
+			     struct svm_range *prange, struct mm_struct *mm,
+			     enum svm_work_list_ops op);
+void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
 void svm_range_free_dma_mappings(struct svm_range *prange);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
