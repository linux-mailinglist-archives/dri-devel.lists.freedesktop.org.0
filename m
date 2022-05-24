Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB7553316E
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681610F2AB;
	Tue, 24 May 2022 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860DF10F200;
 Tue, 24 May 2022 19:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVcmdTA9boVxaKw+MXuSqdJs1aUX692MIb678ONfEnlOudCHgp4k75Tm8nyxqAIoSmEajxeqwXIXzOoU8amulxoY0dWaxgD8iK1Bwrw66w8Q4a+QIcKLtQbr70oEAZ82d5t8PWPDuxjAREp24csPmtZrJXtXroiVF8Mz/ANesHR6t/MKa5vzbuBz1dNGTp0iwkmvs5Z0GvL4z+JT86I1vcCd8vNroIvUxbu7Vk3JZTZWpuNXkJ8roWcirOxDi+afKiHfpUIxnf1BEW2YdpBIho5mHYipyvXywCt/p6NYiMR6iC7kuIHMlhqSnOQqWrd9nTajiKCtLCT6UhKzSPVgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NnrGS6YZU8gQt+7tgfyVxU1Jq6fVp8xiHVCSF24jGU=;
 b=Qz2X4GBr2cNg+/sBaZtCl9OBuKq8eELpIsdI6SsmPv2VJO1cPyI675do0e2MK117JIthMo7SGcPM6iOdPipbke80wdK3uMoXwaHolPhqmHr/OcOAoNQBABMcfOWNQ8yg160x0s+Kgfue2/XI9170QQAB5zjjrCWr09ciWQECTPEok5Ut5WVpr99uHqt5otk0KPkygLkIvlYfu/FOaafyK8E++klesuAsbzqPjCrzajHBiOyAk+tZdcBsmeSzATciuv+32vTF/QCmz6nBrOnSFIS1fHgN/IspTfBpF9IWo8G3XZjvcyy6qGSUEKbELZxrjzKid9VauN4aP6ekSHWoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NnrGS6YZU8gQt+7tgfyVxU1Jq6fVp8xiHVCSF24jGU=;
 b=r4kbTyyOzQN0PT7ckBFpVfp6+7BkRHq/BQ+wOOU+adm65upAB4vxqXCYF4GOldehb2KQzXdC+PtkOfp3Reu2Q3lkBTlFtdztXURNF0+eK+/uaIDYA3x3czILkOULXfpVoSDeiwCTKXLrgjo54zT59NtWwweHB3tTs6mmAAuIhbk=
Received: from DM5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:3:13f::13)
 by SN1PR12MB2400.namprd12.prod.outlook.com (2603:10b6:802:2f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 19:07:27 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::3d) by DM5PR17CA0051.outlook.office365.com
 (2603:10b6:3:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 19:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:27 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:23 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 09/13] lib: add support for device coherent type in test_hmm
Date: Tue, 24 May 2022 14:06:28 -0500
Message-ID: <20220524190632.3304-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 116aa58e-c29d-45ec-2721-08da3db8a4db
X-MS-TrafficTypeDiagnostic: SN1PR12MB2400:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2400C556A7D997DDE4C5668BFDD79@SN1PR12MB2400.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABJ5zuNEEq2Lj3QT0Yb8KMk7i/iSzg7nYs1O9HpPi36zkaMF3apR4wCbF5ZbG2bZv/5Kbi5YeRy8pBvxj3jc/P18Yv2EzKPMA6bhKEvTT3QIweZNL5hXtPNoqgoHLPfs6oRf9ZOudf7JzGUz60fMY3BeggCenJMNKnBGfV6US8CGW0WtBemXR4ak4eBzyBSN7/bzW/f/nlEmtJlixKcuvlcL9g0EPCVKthGCwgJXQHZtt680ahZ4XKA+g2AomEqphgngvM9XdwrBzJZCCL9bOYW6NMxQ+G1X4WzYjOMybkx8t/dHaCR8LsE9YCKET0nYHqoKhKVs99B9Za2LwSg/uOMKtkDIZh+4GrmjHFelwaWLa90nw6LD2Zm/ENj/dxMJtXOyDPERRO+X7NDohb8Z0DWj4tY+MQUYa0mSH8sk/oJzWuVc7SZxVY9bQXPZCyTHVF0qQ7OZmbRDSy3lcdgcpHMIq9vdN3Pcd3sOA0vkWFfzyplbIhs6r7iIAQxkOpde06LvqBPGAOMloGjL9DsFkaCYVbof4ISXpwvEqWAdPemZYarM9PxJ3NZ4P2tE8IPa1oV8gyu4qePP6DIBLCoNbNsFpg7nuAwCpeNSKlQ+KIe4zVDRuDmDHE/yDgys435Ti65a6Xa8E3m3/izojfnZ3lmoPFmMw+wSwDX8eHIsrfT3kZGe/pqjBhhqVUs1vaQLP/E7auH22zosBPHM2T8d3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(4326008)(70206006)(70586007)(508600001)(316002)(36756003)(336012)(6916009)(54906003)(82310400005)(5660300002)(30864003)(44832011)(7416002)(86362001)(8936002)(2616005)(8676002)(26005)(81166007)(356005)(36860700001)(16526019)(83380400001)(426003)(186003)(1076003)(7696005)(40460700003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:27.2793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 116aa58e-c29d-45ec-2721-08da3db8a4db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2400
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
 lib/test_hmm_uapi.h |  15 ++-
 2 files changed, 202 insertions(+), 66 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 15747f70c5bc..361a026c5d21 100644
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
@@ -1101,8 +1254,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
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
@@ -1167,14 +1324,13 @@ static const struct file_operations dmirror_fops = {
 
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
@@ -1182,43 +1338,11 @@ static void dmirror_devmem_free(struct page *page)
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
@@ -1238,7 +1362,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
-	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	args.flags = dmirror_select_device(dmirror);
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
@@ -1317,6 +1441,12 @@ static int __init hmm_dmirror_init(void)
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
@@ -1339,7 +1469,8 @@ static void __exit hmm_dmirror_exit(void)
 	int id;
 
 	for (id = 0; id < DMIRROR_NDEVICES; id++)
-		dmirror_device_remove(dmirror_devices + id);
+		if (dmirror_devices[id].zone_device_type)
+			dmirror_device_remove(dmirror_devices + id);
 	unregister_chrdev_region(dmirror_dev, DMIRROR_NDEVICES);
 }
 
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 625f3690d086..e190b2ab6f19 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -33,11 +33,12 @@ struct hmm_dmirror_cmd {
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
@@ -52,6 +53,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_COHERENT: Migrate device coherent page on the device
+ *				  the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -63,6 +66,8 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL	= 0x40,
+	HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE	= 0x50,
 };
 
 enum {
-- 
2.32.0

