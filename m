Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE22343F28
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92306E431;
	Mon, 22 Mar 2021 11:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFF189FA9;
 Mon, 22 Mar 2021 11:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCTjyLJnfRDqpgwYRtAcrnhN64QrP5LbzEnx8XxQTREMO/ITKnnKBLyo6ZR6Atnk/nztLIMFpu+jjBPf4m5h1Ah7zH2ZzJ8LwlUGJp7PSWMWmsc221Ya/2PHy98UoA64XJ0eBxuu6s5DbATM0PiD/+FzYoBn201Eg8tqQ7mLFrrL+B/pNB6ayiHVcpGtihv/4EgKPUTXNiaieoyEZynyjGCEdT1OmfGj99FZSHafRKLsgUlek6C2qHXsFzr8+/IvEf/X7VpDlTZWPiPpzjNO44EfcW8qCok3rDaa4oXQjoEK0Sc43P+FCwn/qTGxrVRxTILVcL+1OgLDxb+CVRZH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWVz8MEXoqCDgWsEtrLMap/GakmGyAuF+3zqLhlSoOQ=;
 b=grqptmbaAX1zyXgfdDEq28hnawzM1L0/dnWUqQsE5hjyxF+OVvwsq/MtTFUu2m/jxt750yOQGcNm9UGRgFbomhFH70Wy1c+LNWFDjrGqC+I21VAE1sGpJhDhrxGLTU9R75+xi8il4WlcITUmZasTeCdugAhUoPT52yDYQbUd1f/yruJ6v+OONE/59YqHbTxBowMJPoQAZcRp9KNQL1x/ayeeuOemW1M07cQiDvsIu2AjONk+g8ovgBYqFQrOHmeKsiHgvq98RWldZVzyCCZy/BJV5Xnir+X469IDA8E+m8mBDHSPE+1Yasrm7BsOxdKe79JyNVpg4IxR4fMZFK0cDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWVz8MEXoqCDgWsEtrLMap/GakmGyAuF+3zqLhlSoOQ=;
 b=wDuF68WUu0vqOepCifcnPDxag+w6PbxDQ+AaVaXsvZg0Lq0pnTslLQddDD4jpgBByGjTDmXwQeMfzDFiOOTKLtg/fbnI+qZMyEOGWRtojBv4lX66m4Bc4r4MIQR874DHx8bxQYi/qMXh33J3ix0bKdOQqdyld69ZbtiCY+Zz54Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:40 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:40 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/44] drm/amdkfd: HMM migrate vram to ram
Date: Mon, 22 Mar 2021 06:58:35 -0400
Message-Id: <20210322105900.14068-20-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 271652af-5d0c-4555-0502-08d8ed22b534
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678BEDA897FF96000164FBC92659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BlI9Zz1XqiMdd5gSlxI9Rn2FFhjWcD60gWjlM8n00bMg2vCXjIPsIKwS+WO/APsNQVChOzTeZWGnbvWVQyHR1NlC1u+IqJyAvzeldU51btBkGyULoi4JzWB5D5GbnFLJvmIWUK0n2hyeL5jPzUGHZ5vW1b/gleCc3xUmYTpiM4ruAFMuVTAm99j7sqi7OuAdyk9eoCxgWpTmAHCdVc1yGN/EEwbUiLSr4iYSxjFP7FNfvDmqSvnAx9p8BbDuDEoj9NpFLBqY0IRr6/p8G1+3MTEsOnfiblg28w/lEECVO9ViC5duWxwy1VYY0u0I1aSfcQzMRJffbs5+eEUF8Sa0chBJ7YXdhHkosWrAJwhFd1oqZrY0XTONH90SovwvnYkYfulwn34AKv4VAxly6aLh8qcZOrfkqEifFiHX6w+5GB2CfWi1jPHuYBdYA5Mm+wZx33ABLM3dGQr65WXtQbW5ScvM1hzVbvj7JWZclnpxldsAqu2ocuOQ+9WlfajJ4zU4Yzt65gQfaRPdSDcI2jozaOh0e/IX5y7rC2WOYYe37+SSxvtlEQRt7ItpLxKsKeZwO8bsnuni3LeA4b8Y1ulUmI88xQnNcaXp2oMOzewX3UH9cpz84iTupNb/jgOAKNJiEuGz8JQR0HMNTNuou2KVox92woopgrTPgyBdw4MuAFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(30864003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wDBysCpiLmMq70vEpnyYsKSBKcZSwpTh05KdMJlHFk7wV3aMd18MMNaJz0YP?=
 =?us-ascii?Q?edfmIgOFfiMyrkgJDbc351vZnTTHlyDIh4RGOKswp5syln3Rwr7eIEQta/eY?=
 =?us-ascii?Q?A2lLTntbZeHzma4E7ZkqRhS0Dsyy5foRnRmYJfgspg7FYxydgbfxmZiexiUr?=
 =?us-ascii?Q?6p5Oc9BEaZzvm6/eYQlCoiNa25HaJydOrqEDo3LXuY5tj5FTi0KD2rYuHb54?=
 =?us-ascii?Q?bXeFor/O7wHLXcRK+LQ/E93f00XYMM1HCcw9o0UcKxKuLx7BUfj8qy34A8Me?=
 =?us-ascii?Q?uidfygPWuVKKGzZBjpr+L3w2jlnx26JvFsZSb5ZztGH9GfDfQkDsHlHaco2u?=
 =?us-ascii?Q?6IdmalD+vxtF6rNw2rinrxi8y4WNpQoQm9CTvmdS0zn8kl/f2wmTpIZi/eFV?=
 =?us-ascii?Q?y7jMRzJm+nd2YE4fuY4CiAG/oZKYiR07hClvAJ4OkUu8ICyew8zwBsitNQF5?=
 =?us-ascii?Q?GHY7IyXSywiW0Uz9YuplWlCDIzJ+W6hyDiET85gLve9RS4LVTx7OIxG0+Ku8?=
 =?us-ascii?Q?Kc7c+eTsRp7666XuwKsePIn7O5UOSq/ILpQKR6RHSe/XgiO74DO6P1w1brj8?=
 =?us-ascii?Q?JoXrqGxlOZbNQp0Mw6l/bJU3FUanoNAhy5iygdw/9XKdurOPUahyMnzDciXf?=
 =?us-ascii?Q?qebxWCHPdWLXKP2OFWT+/MuAhkpTH5j7HZri+y2WxIuQpI8Ii4qMkGo3pwL2?=
 =?us-ascii?Q?RacVTOf/IIgct8W6okD1DdSnQQ4GGOTTGH1PqinxJc93+nS1/GF9nrSkRkhN?=
 =?us-ascii?Q?HzHnqctUUjdVl7fcqPEvt88NznkEWzlhwsokbMsS95jSPxJO12UpRcxMtXfd?=
 =?us-ascii?Q?kO3Kd1+NevCjzo3hYsj0GP90nr1no5OsG9iW+sWALd/6tU8vswaHZQOLvK89?=
 =?us-ascii?Q?NP4oz4dtokV5PJUWtm0tjvJMX5T2/UFROtSXDj56byzIdswklUkRwvXTh8nB?=
 =?us-ascii?Q?KkJQy3GBOGFmiBT9UIyTsDOUAAQjIC/GxGBeX3UwKHWnAK+lvrBviabgEOzq?=
 =?us-ascii?Q?z1jM4nni7twwe4tBId3FVTrZEuh+iZLVAmWStKcPU8/C4fHU5lHKCn8txHG1?=
 =?us-ascii?Q?b2W+sSIQOrp/WbN9ykfWLlE49W66tsgQJsNAyG7ws8afcFoFf2h1t5Kthwu3?=
 =?us-ascii?Q?oxWDMUkiSlw5ZPuenP0ecXUFvIMx/tkNUG6qkwEZvACI3s2GKBvs6MKuNHax?=
 =?us-ascii?Q?7xVNbovrjBMfZY58xpcUGi3LGekpMnQowKlOEV2mztAou7/gDAKzVXzA8ykD?=
 =?us-ascii?Q?tIm9QgVmbSveiEEOj+j44EYJnye7Lc6iLkWlM7bdjs1LKsRtGeZEVnmyhRMH?=
 =?us-ascii?Q?eSYvlpyCk6x+CZkk6WrRW0FN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271652af-5d0c-4555-0502-08d8ed22b534
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:39.9463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaotapnSuBKPGKeLj/CYNc65/RkIJncfK+UG5gT14RpNRdqe6/zG0q8I9vegjHz4YGAL2E/lsXE7vRelGm0h9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 310 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 158 +++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  12 +
 4 files changed, 473 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 668c360be0bb..1243cf02f872 100644
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
@@ -484,13 +513,222 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc)
 
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
+	prange->pages_addr = kvmalloc_array(npages, sizeof(*prange->pages_addr),
+					    GFP_KERNEL | __GFP_ZERO);
+	if (!prange->pages_addr) {
+		r = -ENOMEM;
+		goto out_oom;
+	}
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
+		prange->pages_addr[i] = page_to_pfn(dpage);
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
@@ -498,7 +736,75 @@ static void svm_migrate_page_free(struct page *page)
  */
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
-	return VM_FAULT_SIGBUS;
+	unsigned long addr = vmf->address;
+	struct list_head update_list;
+	struct svm_range *pmigrate;
+	struct vm_area_struct *vma;
+	struct svm_range *parent;
+	struct svm_range *prange;
+	struct svm_range *next;
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
+
+	if (!prange->actual_loc)
+		goto out_unlock_prange;
+
+	svm_range_lock(parent);
+	r = svm_range_split_by_granularity(p, mm, addr, parent, prange,
+					   &pmigrate, &update_list);
+	svm_range_unlock(parent);
+	if (r) {
+		pr_debug("failed %d to split range by granularity\n", r);
+		goto out_unlock_prange;
+	}
+
+	r = svm_migrate_vram_to_ram(pmigrate, mm);
+	if (r)
+		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
+			 pmigrate, pmigrate->start, pmigrate->last);
+
+	list_for_each_entry_safe(prange, next, &update_list, update_list) {
+		enum svm_work_list_ops op;
+
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+
+		svm_range_add_list_work(&p->svms, prange, mm, op);
+		list_del_init(&prange->update_list);
+	}
+	schedule_deferred_list_work(&p->svms);
+
+out_unlock_prange:
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
index cf3d2c203007..69241ed4a377 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -920,6 +920,95 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 	list_add_tail(&pchild->child_list, &prange->child_list);
 }
 
+/**
+ * svm_range_split_by_granularity - collect ranges within granularity boundary
+ *
+ * @p: the process with svms list
+ * @mm: mm structure
+ * @parent: parent range if prange is from child list
+ * @prange: prange to split
+ * @addr: the vm fault address in pages, to split the prange
+ * @pmigrate: output, the range to be migrated to ram
+ * @update_list: output, the ranges to update notifier
+ *
+ * Collects small ranges that make up one migration granule and splits the first
+ * and the last range at the granularity boundary
+ *
+ * Context: caller hold svms lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+int
+svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
+			       unsigned long addr, struct svm_range *parent,
+			       struct svm_range *prange,
+			       struct svm_range **pmigrate,
+			       struct list_head *update_list)
+{
+	struct svm_range *tail;
+	struct svm_range *new;
+	unsigned long start;
+	unsigned long last;
+	unsigned long size;
+	int r = 0;
+
+	/* Align splited range start and size to granularity size, then a single
+	 * PTE will be used for whole range, this reduces the number of PTE
+	 * updated and the L1 TLB space used for translation.
+	 */
+	size = 1ULL << prange->granularity;
+	start = ALIGN_DOWN(addr, size);
+	last = ALIGN(addr + 1, size) - 1;
+	INIT_LIST_HEAD(update_list);
+	INIT_LIST_HEAD(&parent->update_list);
+
+	pr_debug("svms 0x%p split [0x%lx 0x%lx] to [0x%lx 0x%lx] size 0x%lx\n",
+		 prange->svms, prange->start, prange->last, start, last, size);
+
+	if (start > prange->start) {
+		r = svm_range_split(prange, prange->start, start - 1, &new);
+		if (r)
+			return r;
+
+		svm_range_add_child(parent, mm, new, SVM_OP_ADD_RANGE);
+
+		if (parent == prange) {
+			pr_debug("add to update list prange 0x%p [0x%lx 0x%lx]\n",
+				 parent, parent->start, parent->last);
+			list_add(&parent->update_list, update_list);
+		}
+	} else {
+		new = prange;
+	}
+
+	if (last >= new->last) {
+		pr_debug("entire prange 0x%p [0x%lx 0x%lx] on prange %s list\n",
+			 new, new->start, new->last,
+			 (parent == prange) ? "" : "child");
+		goto out_update;
+	}
+
+	pr_debug("split remaining last 0x%lx [0x%lx 0x%lx] from prange %s\n",
+		last, new->start, new->last, (parent == new) ? "" : "child");
+	r = svm_range_split(new, new->start, last, &tail);
+	if (r)
+		return r;
+	svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
+
+out_update:
+	/* If parent is not on update list, add it to put into deferred work */
+	if (list_empty(&parent->update_list)) {
+		pr_debug("add to update list parange 0x%p [0x%lx 0x%lx]\n",
+			 prange, parent->start, parent->last);
+		list_add(&parent->update_list, update_list);
+	}
+
+	*pmigrate = new;
+
+	return 0;
+}
+
 static uint64_t
 svm_range_get_pte_flags(struct amdgpu_device *adev, struct svm_range *prange)
 {
@@ -1723,12 +1812,19 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
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
@@ -1766,6 +1862,49 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
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
@@ -2007,11 +2146,14 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 
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
index aa6edc3efcb8..e6b737889bb3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -144,11 +144,23 @@ void svm_range_list_fini(struct kfd_process *p);
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
+			       struct svm_range *prange,
+			       struct svm_range **pmigrate,
+			       struct list_head *deferred_update_list);
+void svm_range_add_list_work(struct svm_range_list *svms,
+			     struct svm_range *prange, struct mm_struct *mm,
+			     enum svm_work_list_ops op);
+void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
