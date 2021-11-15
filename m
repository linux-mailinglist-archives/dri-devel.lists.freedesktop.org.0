Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E0451233
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4862A6EA6B;
	Mon, 15 Nov 2021 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4E6E9E0;
 Mon, 15 Nov 2021 19:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LO3WdqXljUTYyzBWn9dgejmBMW3SL/rOPOayaTyFLLiUN+vsYosPenvsNRJ/Ktt7SOaJmUgZ+SVbn8MORdL/9vs3tMETBhfXV3RaeHlL3WlZ9kT/r725fLv+SjxD+1O+JA3An9K/vF/rgdn8wORhp+hHPb71HuhqQ180fYmZl+ZG567qv/GTmhxqPG5O0MFnZWb4ltl33mOCpSZWWbhSp1nrYEjKlD5LyyytFGjyNuaQS7M3emRkLbA4asBuU8+3yHwMW4TQZ2pLFrxuL+NUmGiWl/ASljrjRqz0GIDFE+aHkyOt9Hj+g99XDxeQlf3QdTwtv7T2HxlschJdQ0lyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NePmfFpjRZtbjjW4C5wy1UBKN9HUcsVETeEAncGWMqM=;
 b=I3Qw9flRQH58sVTf5biH/3yF/cwZMg6MM3PUuLjgIR/UJZBgqfDFE6nXqWP5GL47vH5pP1DArTSREBS+SXnswXiKuTuTJxylveB3k6FvWtdKg2r7NOuNHbVADeGUncyvbGC3KDeFyaBxGTcw5wfaznPrjFI3Wtjp7GPw60oXVHrRB3+H44blvl1lDY2CudMencjik/ydovVeYonG/tnzmWic8c0YnbX4ReTs0JdeAY7QSYzFF7cgOgrmMcvm9vOlqgoAag9tnVi5Py09QGM4wdc7KVxsabvweP/jt3BIa9BuQbcvXuU0VQ2dgTdoInVtA8Ruvuh2DtCS+ZmJMAW6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NePmfFpjRZtbjjW4C5wy1UBKN9HUcsVETeEAncGWMqM=;
 b=GC2itvMLq87/lL533ZTs+cld51VqDTZvT+eKN/KEiyBM25bIDsjIVVCx6hvx21oy0LeZASbWgBvbGXf70GneTO2TaHqACvkl8xAWUw/XFunVlab/4RIPdA/KmGE/aEkyyKysAG/336qqhLjGlSRrMco+4M8rZKSXAdNX5WxLumo=
Received: from MWHPR04CA0072.namprd04.prod.outlook.com (2603:10b6:300:6c::34)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 19:30:51 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::bb) by MWHPR04CA0072.outlook.office365.com
 (2603:10b6:300:6c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:50 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:41 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 7/9] lib: add support for device coherent type in test_hmm
Date: Mon, 15 Nov 2021 13:30:24 -0600
Message-ID: <20211115193026.27568-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d855f29c-34e3-4d58-ad21-08d9a86e6ed7
X-MS-TrafficTypeDiagnostic: CH2PR12MB4216:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4216FE66167A9F93CDA011BBFD989@CH2PR12MB4216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FLZ2BC4JCnig6Xa6+N9SRASGzOBKyW2YILV5qgqbiIpJYnXqTp2dnFwAY/8KzYvnQCFtaQb8pN3YTt4Es39gMX+eoC6Og3MZC2CYICTA1rrG2DJv7+BEqRXTyQtxoGkUuWRPoRndhpAu/pYBaJeOXaiPi1vQoWVgeoTsNxPEa7eq4qSIWi5/DkaNpxp3ffWfe9KlEE5yBs5xOe8xoAbLm6G1fHINkN0XFs+tEAyqRTtTjdLzH04qdxeDunVnmuDErfj1vEdhcxtS0+1RGijUyyHYpejVitKZm20Q6wVkT2c1d0keFxvdBC9b1NqRo1S32jhZdsqsycDXHd1gp7PsEvvUot6RpcWa6j7V+uCllGFFW1PP8AzwJMG94lYH4nE5XzP4YpG4qEAvQV6ilyppCnAZg+868Zgurke1+JWqydpjsbRCTIYUBkEzx07xoVBWttivvFI1nm5SmnIsENwCsXU8FPQWtRhtfdDPGRL5wwhMkxgByoQdZl2Xc2HdfGJxikTh8OY2ofIoa16NafwDG0CxFgBp1pnfBhcSIG0OZhEoyWFzNfFxxY1yNwjuO/GzOIC98nNPUyJgQreRPEsczRdKLN9R8CWNbWwgdvvqjPRI2bsyXq/ZDmCQ7ZXBmda+bGDWSEzKkwxKeRHZnkTzKHFzw7x5RzkVwemUe8e+yfJnO2xjGjvQWsq2EIwjScM7rgdYPDJ6vly+/pY7WDi1sI5oVLyrTXuUXgE32u3sFs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(110136005)(70206006)(6666004)(426003)(316002)(83380400001)(2616005)(86362001)(44832011)(356005)(54906003)(26005)(186003)(16526019)(7416002)(5660300002)(70586007)(81166007)(4326008)(8936002)(30864003)(508600001)(1076003)(36860700001)(2906002)(47076005)(7696005)(8676002)(36756003)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:50.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d855f29c-34e3-4d58-ad21-08d9a86e6ed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device Coherent type uses device memory that is coherently accesible by
the CPU. This could be shown as SP (special purpose) memory range
at the BIOS-e820 memory enumeration. If no SP memory is supported in
system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.

Currently, test_hmm only supports two different SP ranges of at least
256MB size. This could be specified in the kernel parameter variable
efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
0x140000000 physical address. Ex.
efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 191 +++++++++++++++++++++++++++++++++-----------
 lib/test_hmm_uapi.h |  15 ++--
 2 files changed, 153 insertions(+), 53 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 45334df28d7b..9e2cc0cd4412 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -471,6 +471,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -553,7 +554,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -562,7 +563,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -571,8 +572,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	struct page *rpage;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
+	 * system memory to store our device memory.
+	 * For ZONE_DEVICE coherent type we use the actual dpage to store the data
+	 * and ignore rpage.
 	 */
 	rpage = alloc_page(GFP_HIGHUSER);
 	if (!rpage)
@@ -623,12 +626,17 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * unallocated pte_none() or read-only zero page.
 		 */
 		spage = migrate_pfn_to_page(*src);
+		if (spage && is_zone_device_page(spage))
+			pr_err("page already in device spage pfn: 0x%lx\n",
+				page_to_pfn(spage));
+		WARN_ON(spage && is_zone_device_page(spage));
 
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
 			continue;
 
-		rpage = dpage->zone_device_data;
+		rpage = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (spage)
 			copy_highpage(rpage, spage);
 		else
@@ -640,8 +648,11 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * the simulated device memory and that page holds the pointer
 		 * to the mirror.
 		 */
+		rpage = dpage->zone_device_data;
 		rpage->zone_device_data = dmirror;
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage)) |
 			    MIGRATE_PFN_LOCKED;
 		if ((*src & MIGRATE_PFN_WRITE) ||
@@ -721,10 +732,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 			continue;
 
 		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
+		 * For ZONE_DEVICE private pages we store the page that
+		 * holds the data so the page table doesn't have to deal it.
+		 * For ZONE_DEVICE coherent pages we store the actual page, since
+		 * the CPU has coherent access to the page.
 		 */
-		entry = dpage->zone_device_data;
+		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -804,8 +818,110 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 	return ret;
 }
 
-static int dmirror_migrate(struct dmirror *dmirror,
-			   struct hmm_dmirror_cmd *cmd)
+static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
+						      struct dmirror *dmirror)
+{
+	const unsigned long *src = args->src;
+	unsigned long *dst = args->dst;
+	unsigned long start = args->start;
+	unsigned long end = args->end;
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE,
+				       src++, dst++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(*src);
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		WARN_ON(!is_device_page(spage));
+		spage = is_device_private_page(spage) ? spage->zone_device_data :
+							spage;
+		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+		if (!dpage)
+			continue;
+		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
+
+		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+		copy_highpage(dpage, spage);
+		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+static int dmirror_migrate_to_system(struct dmirror *dmirror,
+				     struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct vm_area_struct *vma;
+	unsigned long src_pfns[64];
+	unsigned long dst_pfns[64];
+	struct migrate_vma args;
+	unsigned long next;
+	int ret;
+
+	start = cmd->addr;
+	end = start + size;
+	if (end < start)
+		return -EINVAL;
+
+	/* Since the mm is for the mirrored process, get a reference first. */
+	if (!mmget_not_zero(mm))
+		return -EINVAL;
+
+	mmap_read_lock(mm);
+	for (addr = start; addr < end; addr = next) {
+		vma = find_vma(mm, addr);
+		if (!vma || addr < vma->vm_start ||
+		    !(vma->vm_flags & VM_READ)) {
+			ret = -EINVAL;
+			goto out;
+		}
+		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		if (next > vma->vm_end)
+			next = vma->vm_end;
+
+		args.vma = vma;
+		args.src = src_pfns;
+		args.dst = dst_pfns;
+		args.start = addr;
+		args.end = next;
+		args.pgmap_owner = dmirror->mdevice;
+		args.flags = (dmirror->mdevice->zone_device_type ==
+			      HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
+			      MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
+			      MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+
+		ret = migrate_vma_setup(&args);
+		if (ret)
+			goto out;
+
+		pr_debug("Migrating from device mem to sys mem\n");
+		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
+
+		migrate_vma_pages(&args);
+		migrate_vma_finalize(&args);
+	}
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return ret;
+
+out:
+	mmap_read_unlock(mm);
+	mmput(mm);
+	return ret;
+}
+
+static int dmirror_migrate_to_device(struct dmirror *dmirror,
+				struct hmm_dmirror_cmd *cmd)
 {
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
@@ -849,6 +965,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (ret)
 			goto out;
 
+		pr_debug("Migrating from sys mem to device mem\n");
 		dmirror_migrate_alloc_and_copy(&args, dmirror);
 		migrate_vma_pages(&args);
 		dmirror_migrate_finalize_and_map(&args, dmirror);
@@ -857,7 +974,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
+	/* Return the migrated data for verification. only for pages in device zone */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
 		return ret;
@@ -894,9 +1011,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 	}
 
 	page = hmm_pfn_to_page(entry);
-	if (is_device_private_page(page)) {
-		/* Is the page migrated to this device or some other? */
-		if (dmirror->mdevice == dmirror_page_to_device(page))
+	if (is_device_page(page)) {
+		/* Is page ZONE_DEVICE coherent? */
+		if (!is_device_private_page(page))
+			*perm = HMM_DMIRROR_PROT_DEV_COHERENT;
+		/*
+		 * Is page ZONE_DEVICE private migrated to
+		 * this device or some other?
+		 */
+		else if (dmirror->mdevice == dmirror_page_to_device(page))
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
@@ -1096,8 +1219,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_write(dmirror, &cmd);
 		break;
 
-	case HMM_DMIRROR_MIGRATE:
-		ret = dmirror_migrate(dmirror, &cmd);
+	case HMM_DMIRROR_MIGRATE_TO_DEV:
+		ret = dmirror_migrate_to_device(dmirror, &cmd);
+		break;
+
+	case HMM_DMIRROR_MIGRATE_TO_SYS:
+		ret = dmirror_migrate_to_system(dmirror, &cmd);
 		break;
 
 	case HMM_DMIRROR_EXCLUSIVE:
@@ -1152,38 +1279,6 @@ static void dmirror_devmem_free(struct page *page)
 	spin_unlock(&mdevice->lock);
 }
 
-static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
-						      struct dmirror *dmirror)
-{
-	const unsigned long *src = args->src;
-	unsigned long *dst = args->dst;
-	unsigned long start = args->start;
-	unsigned long end = args->end;
-	unsigned long addr;
-
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
-		struct page *dpage, *spage;
-
-		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
-		spage = spage->zone_device_data;
-
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-	}
-	return 0;
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 77f81e6314eb..af15c35a90f4 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -19,6 +19,7 @@
  * @npages: (in) number of pages to read/write
  * @cpages: (out) number of pages copied
  * @faults: (out) number of device page faults seen
+ * @zone_device_type: (out) zone device memory type
  */
 struct hmm_dmirror_cmd {
 	__u64		addr;
@@ -32,11 +33,12 @@ struct hmm_dmirror_cmd {
 /* Expose the address space of the calling process through hmm device file */
 #define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x05, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -51,6 +53,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
+ *				  the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -62,6 +66,7 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_COHERENT           = 0x40,
 };
 
 enum {
-- 
2.32.0

