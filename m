Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B716455F46D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B3712A7B6;
	Wed, 29 Jun 2022 03:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80F212A79E;
 Wed, 29 Jun 2022 03:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUJGkSoftnRwD5p9MwsvIjIWQEPu+DuXikkVHNBnSkOT6GG78b0elQZguXmc9ASfD2nEHpt5VJGrgl3MR9TI/fQ3szwouvEwvGnW/b9tahhSpUK6e0WrleUYuhHRI/dJu8sklH6JILy9WzpZ3hwCbIrufbAhl09XJkWlF5pGkDdHnEafQD4uotffDCF7ZdwvoOWV4yX3z/wUq/XYPeS2aJsDM3pcxhhCUbOREDBoBJny4UeuJz8eQP5PFIUsF4DQeS+kAgz9XUZUbMFXRQBBwI8TOf7Ewg5ISeWG7HZfC1wjfm9MbLKuSC48Ra8fe+CstzCD2DI6p+zC2bN1yyXvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXHkTMDP9sqYKzMO3NOS8Ic3UgCNCptiqPNyD5wLuTo=;
 b=Me6LrqO9ZctEUURwyQcMB6rhR78Mpvmp7YZlzclg0SElIdpYMhL1UeuJYnVXMM3IMGE1+MwSw8xeLKSdA9/PNIWpltzVSoLhp6+Sn1zGs7MLluwi1f9pqAixurHQt9bBWPFpn5Gg6Q3tmM/qxwRxArjdqTBYDww5+8+hlyHOWSdUNGg/T/Xjj102IWmVcgUZ2ZVr64+vGURMxSjxm1+kYpGL8t5ldwxRf1nY3O8ae5ElEdBuMVVdKNuh+kTbmmYuteLJBKosTzOKPM1BFveZlfxeM2Trkdn//m3eBhUKvHZwXqTjJIrDump+HLuRQnRHeMtfSTpPmqot4SJl0QINDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXHkTMDP9sqYKzMO3NOS8Ic3UgCNCptiqPNyD5wLuTo=;
 b=lDGiuGZ5SfvY2cfgnlQJ2SKQznzbJbl1UF6XLqAlD+PFBltNrnuentQg1HlbhcjXAr9pzvHImEWj9RHLiz6JXnOcIkaLeg3lyiUcKKz2EKBzgjQymTvBtYALGCWkfMbzEs2bs9EOoOmuEMOENPHNYy5Xf2Achfpjn3hSOa7F7CU=
Received: from BN8PR12CA0020.namprd12.prod.outlook.com (2603:10b6:408:60::33)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 03:55:13 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::64) by BN8PR12CA0020.outlook.office365.com
 (2603:10b6:408:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:13 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:11 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 10/14] lib: add support for device coherent type in test_hmm
Date: Tue, 28 Jun 2022 22:54:22 -0500
Message-ID: <20220629035426.20013-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a42cf666-f3a8-4cc7-473b-08da59832b9b
X-MS-TrafficTypeDiagnostic: BY5PR12MB4081:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GiryfKMTgitP0cV0HCKa6PJQxAMWUP0SU1eWzJSdKCD0FghAPzYGJR7v+R5e2h9E4+fgZJZPvNweqe+qNw9FgsHusjB720GnFE4Z4v1xU+eeQrVv3N07tA/drUzz+w//+PlZtpPi5bg/b6Z9VPjY8O2TxYTBQQnlzMy2H01GrSKyBFdxyT0ZTW4pPTo8DyX9hA6d7nJdwiicOrFAA+fTvHZHUG5CoHl/l15xu0QixLt8nPMr50LlsRM8WpuZnukItW54raokA68p3wvXOVHvfGNzba41AbJSTC5SmJ8CZRoR7qqNJX3USCBQyhsO++cUlzbMOtF9NzRffs32BAe3Ekl1PT2GCInzOvXSzH6FYvrcN0vx+TqA2q1gMLY262UYjXuf9YajcjCuidXugkztkj2mGRdakFne/xDThdVBxR+2neq1pNrIg6BP6pu5rLJ+DASbNeRBQ+hlh2ZHRrIXKNkGC5ETz0xCZ/GOqMExAYE8urWn4o69oq/6rt5oDtIXgECA2+MDe2/yK/I8EI2IlAuDD5tuMJnmppZ5viJB+eXwq4CfQZ/rF+M5UttozwTsUIpphrwvPjHx38rLHIjOmQrhjEbleJgwl5EX1i69SXonC1ZFWBIyGC0aMnTp5ewx4w//uVJl12Pr0HpkMHtb3BUo+dhFjLJRwqrmxVXFeWEjIh/tP9RVqVmCqhew6bkJlotA2QZMExT4W91Oh+9th0l6XXd7xIv3HgPLrP7WUnCYv/LoLXKAWBWZcXfaNoE258gJGufIeeJoQJOgDtA0tRxPw7ka/GK9heVVdFDweQsDgikKdVWZ9aLIfD1Ayb/Cz3P8brIcUI1LYADOb5Ogsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(40470700004)(36840700001)(426003)(82310400005)(47076005)(336012)(316002)(36756003)(30864003)(40460700003)(7416002)(1076003)(40480700001)(5660300002)(2616005)(83380400001)(81166007)(356005)(41300700001)(82740400003)(2906002)(8676002)(7696005)(8936002)(70206006)(70586007)(86362001)(6666004)(4326008)(26005)(16526019)(36860700001)(54906003)(186003)(44832011)(6916009)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:13.2749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42cf666-f3a8-4cc7-473b-08da59832b9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
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

Private and coherent device mirror instances can be created in the same
probed. This is done by passing the module parameters spm_addr_dev0 &
spm_addr_dev1. In this case, it will create four instances of
device_mirror. The first two correspond to private device type, the
last two to coherent type. Then, they can be easily accessed from user
space through /dev/hmm_mirror<num_device>. Usually num_device 0 and 1
are for private, and 2 and 3 for coherent types. If no module
parameters are passed, two instances of private type device_mirror will
be created only.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
 lib/test_hmm.c      | 253 +++++++++++++++++++++++++++++++++-----------
 lib/test_hmm_uapi.h |   4 +
 2 files changed, 196 insertions(+), 61 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index afb30af9f3ff..7930853e7fc5 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -32,11 +32,22 @@
 
 #include "test_hmm_uapi.h"
 
-#define DMIRROR_NDEVICES		2
+#define DMIRROR_NDEVICES		4
 #define DMIRROR_RANGE_FAULT_TIMEOUT	1000
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
 
+/*
+ * For device_private pages, dpage is just a dummy struct page
+ * representing a piece of device memory. dmirror_devmem_alloc_page
+ * allocates a real system memory page as backing storage to fake a
+ * real device. zone_device_data points to that backing page. But
+ * for device_coherent memory, the struct page represents real
+ * physical CPU-accessible memory that we can use directly.
+ */
+#define BACKING_PAGE(page) (is_device_private_page((page)) ? \
+			   (page)->zone_device_data : (page))
+
 static unsigned long spm_addr_dev0;
 module_param(spm_addr_dev0, long, 0644);
 MODULE_PARM_DESC(spm_addr_dev0,
@@ -125,6 +136,21 @@ static int dmirror_bounce_init(struct dmirror_bounce *bounce,
 	return 0;
 }
 
+static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
+{
+	return (mdevice->zone_device_type ==
+		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ? true : false;
+}
+
+static enum migrate_vma_direction
+dmirror_select_device(struct dmirror *dmirror)
+{
+	return (dmirror->mdevice->zone_device_type ==
+		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
+		MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+}
+
 static void dmirror_bounce_fini(struct dmirror_bounce *bounce)
 {
 	vfree(bounce->ptr);
@@ -575,16 +601,19 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 {
 	struct page *dpage = NULL;
-	struct page *rpage;
+	struct page *rpage = NULL;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we allocate
+	 * real system memory to store our device memory.
+	 * For ZONE_DEVICE coherent type we use the actual dpage to store the
+	 * data and ignore rpage.
 	 */
-	rpage = alloc_page(GFP_HIGHUSER);
-	if (!rpage)
-		return NULL;
-
+	if (dmirror_is_private_zone(mdevice)) {
+		rpage = alloc_page(GFP_HIGHUSER);
+		if (!rpage)
+			return NULL;
+	}
 	spin_lock(&mdevice->lock);
 
 	if (mdevice->free_pages) {
@@ -603,7 +632,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	return dpage;
 
 error:
-	__free_page(rpage);
+	if (rpage)
+		__free_page(rpage);
 	return NULL;
 }
 
@@ -629,12 +659,16 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * unallocated pte_none() or read-only zero page.
 		 */
 		spage = migrate_pfn_to_page(*src);
+		if (WARN(spage && is_zone_device_page(spage),
+		     "page already in device spage pfn: 0x%lx\n",
+		     page_to_pfn(spage)))
+			continue;
 
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
 			continue;
 
-		rpage = dpage->zone_device_data;
+		rpage = BACKING_PAGE(dpage);
 		if (spage)
 			copy_highpage(rpage, spage);
 		else
@@ -648,6 +682,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if ((*src & MIGRATE_PFN_WRITE) ||
 		    (!spage && args->vma->vm_flags & VM_WRITE))
@@ -725,11 +761,7 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
-		 */
-		entry = dpage->zone_device_data;
+		entry = BACKING_PAGE(dpage);
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -809,15 +841,126 @@ static int dmirror_exclusive(struct dmirror *dmirror,
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
+		if (WARN_ON(!is_device_private_page(spage) &&
+			    !is_device_coherent_page(spage)))
+			continue;
+		spage = BACKING_PAGE(spage);
+		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+		if (!dpage)
+			continue;
+		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
+
+		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+		copy_highpage(dpage, spage);
+		*dst = migrate_pfn(page_to_pfn(dpage));
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+static unsigned long
+dmirror_successful_migrated_pages(struct migrate_vma *migrate)
+{
+	unsigned long cpages = 0;
+	unsigned long i;
+
+	for (i = 0; i < migrate->npages; i++) {
+		if (migrate->src[i] & MIGRATE_PFN_VALID &&
+		    migrate->src[i] & MIGRATE_PFN_MIGRATE)
+			cpages++;
+	}
+	return cpages;
+}
+
+static int dmirror_migrate_to_system(struct dmirror *dmirror,
+				     struct hmm_dmirror_cmd *cmd)
 {
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64];
-	unsigned long dst_pfns[64];
+	unsigned long src_pfns[64] = { 0 };
+	unsigned long dst_pfns[64] = { 0 };
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
+	cmd->cpages = 0;
+	mmap_read_lock(mm);
+	for (addr = start; addr < end; addr = next) {
+		vma = vma_lookup(mm, addr);
+		if (!vma || !(vma->vm_flags & VM_READ)) {
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
+		args.flags = dmirror_select_device(dmirror);
+
+		ret = migrate_vma_setup(&args);
+		if (ret)
+			goto out;
+
+		pr_debug("Migrating from device mem to sys mem\n");
+		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
+
+		migrate_vma_pages(&args);
+		cmd->cpages += dmirror_successful_migrated_pages(&args);
+		migrate_vma_finalize(&args);
+	}
+out:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return ret;
+}
+
+static int dmirror_migrate_to_device(struct dmirror *dmirror,
+				struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct vm_area_struct *vma;
+	unsigned long src_pfns[64] = { 0 };
+	unsigned long dst_pfns[64] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args;
 	unsigned long next;
@@ -854,6 +997,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (ret)
 			goto out;
 
+		pr_debug("Migrating from sys mem to device mem\n");
 		dmirror_migrate_alloc_and_copy(&args, dmirror);
 		migrate_vma_pages(&args);
 		dmirror_migrate_finalize_and_map(&args, dmirror);
@@ -862,7 +1006,10 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
+	/*
+	 * Return the migrated data for verification.
+	 * Only for pages in device zone
+	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
 		return ret;
@@ -905,6 +1052,12 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
+	} else if (is_device_coherent_page(page)) {
+		/* Is the page migrated to this device or some other? */
+		if (dmirror->mdevice == dmirror_page_to_device(page))
+			*perm = HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL;
+		else
+			*perm = HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE;
 	} else if (is_zero_pfn(page_to_pfn(page)))
 		*perm = HMM_DMIRROR_PROT_ZERO;
 	else
@@ -1092,8 +1245,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
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
@@ -1155,14 +1312,13 @@ static const struct file_operations dmirror_fops = {
 
 static void dmirror_devmem_free(struct page *page)
 {
-	struct page *rpage = page->zone_device_data;
+	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
 
-	if (rpage)
+	if (rpage != page)
 		__free_page(rpage);
 
 	mdevice = dmirror_page_to_device(page);
-
 	spin_lock(&mdevice->lock);
 	mdevice->cfree++;
 	page->zone_device_data = mdevice->free_pages;
@@ -1170,43 +1326,11 @@ static void dmirror_devmem_free(struct page *page)
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
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-	}
-	return 0;
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
-	unsigned long src_pfns;
-	unsigned long dst_pfns;
+	unsigned long src_pfns = 0;
+	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
 	vm_fault_t ret;
@@ -1226,7 +1350,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
-	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	args.flags = dmirror_select_device(dmirror);
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
@@ -1305,6 +1429,12 @@ static int __init hmm_dmirror_init(void)
 				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
 	dmirror_devices[ndevices++].zone_device_type =
 				HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
+	if (spm_addr_dev0 && spm_addr_dev1) {
+		dmirror_devices[ndevices++].zone_device_type =
+					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
+		dmirror_devices[ndevices++].zone_device_type =
+					HMM_DMIRROR_MEMORY_DEVICE_COHERENT;
+	}
 	for (id = 0; id < ndevices; id++) {
 		ret = dmirror_device_init(dmirror_devices + id, id);
 		if (ret)
@@ -1327,7 +1457,8 @@ static void __exit hmm_dmirror_exit(void)
 	int id;
 
 	for (id = 0; id < DMIRROR_NDEVICES; id++)
-		dmirror_device_remove(dmirror_devices + id);
+		if (dmirror_devices[id].zone_device_type)
+			dmirror_device_remove(dmirror_devices + id);
 	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
 }
 
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index f700da7807c1..e31d58c9034a 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -50,6 +50,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
+ *				  the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -61,6 +63,8 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL	= 0x40,
+	HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE	= 0x50,
 };
 
 enum {
-- 
2.32.0

