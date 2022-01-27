Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D849D8FB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90310EE1A;
	Thu, 27 Jan 2022 03:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8FB10EBE5;
 Thu, 27 Jan 2022 03:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTmoGRyG35/7tI2qQ4De1nD1Sdyot5Ix/CTXOYBwvw1rwMMQIOg4aVC1VCmIYPfQEuFovFzBr5PLxWKLOYsepHVWfLtlssQiO8XNaNAUY+FQqfst1utwyzN/ves8QIwKQCPsZz+5kG/FVKWxYZl0VsufZDuIaTSWg5p4Skl8N0PNxniyWWqFAqQ48iouzREVANSjMmVbgIRmcH0S/nOsy2ytF18hyM22ANU/br5wq6spsM5vLrh1lc920/M5meapPFNkaTpPKxkQHrA+6jLZws7Qq2HF27w+J1zjITAbI5AfWeCWejaQrwY3aM8/VaI5yHClsH/Z1c69ufAP6+nZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/FnPTvbH/XxGubXq83NoubsOAL/YaboMuCOdsolRFU=;
 b=IbzeojASUyjC2MvzM+Empm7hVtAi1lacLqt28wugZ1aWR6oD1BhZp2yCqprIyyKvfK5iE2gI40tbS6JWWE0oReAepJfAjjkgc/d4yFkcMDOxKjTg6Lza+HL23kt7pBikU6JEXd4FcdmD4AaJNJPY/UN99vUJyZhTP72gF/UVwdL2syWJ7/SpfCX8+33Rvz0B4Vx2XVK26jc5SyczEszQjstwA0i5U+cMo27gRk0BrJ2aqo0NfA9WyK6n39gMWBiuq138tLMVLBTbddir/lBKVN9M6/HbQXXHhQQUtHVi8MoNapSFGfJ3mHwD4vPfnDeBLG1Cp9kI92bC4PhSbJ+N0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/FnPTvbH/XxGubXq83NoubsOAL/YaboMuCOdsolRFU=;
 b=qZJDaO0yOi0XOSGJDU6RVnbMBSSxV3PnQ04xU8PxulTZPzaJ1xDm6vtpdk2l/124TeRa42Bbg79M32pIXr92INVEi+Z68xmr/WoMQVSEotfClC0GLkvGCSLbfRfxvFINi+8GJuqDQMKDpBRvGpv5v9BB5eH8fvjST3CDb0YVoiw=
Received: from BN0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:e7::17)
 by BYAPR12MB3527.namprd12.prod.outlook.com (2603:10b6:a03:13c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 03:10:08 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::33) by BN0PR03CA0042.outlook.office365.com
 (2603:10b6:408:e7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:07 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:04 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 08/10] lib: add support for device coherent type in test_hmm
Date: Wed, 26 Jan 2022 21:09:47 -0600
Message-ID: <20220127030949.19396-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a38074-edb5-4cf6-31b8-08d9e14285d0
X-MS-TrafficTypeDiagnostic: BYAPR12MB3527:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB35273152F70E9BA83A87310AFD219@BYAPR12MB3527.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EgeTifsvWxbT18sRhCooLgP8wA3ghjCHTchnQt7YFoabdpDL1h8n28mQIXy/cF0wzgzrZ3p3r1+9vN6VQ8dd7iBMOs90bOyBnKoAW5sDk+bLHaRBwqgMCSRDOJYBy4iY3F0v/D2Y97h9O9rrGNUHeQjzTYvivp3g5SIesbWLaJDMgrDlkCjdnpz8wuMw3ZUoUjgVPea+mv5UDEEGapdhHpFEvC2CmmIdT/u7TyX3AeGUowbto03ceYBzIeK/zQu4e1D7a5agdq4MdXeUyHAKd8dLdYgxJY2JnnQgtChbkY57jtktFrG/Z1yrSSKfCSSzVKZk/A8nIrXtOOcPWHZvPlJhVuZqdZWgYrTh9JUHRmtdBzA4x1awu9YbWtMBq1iHyp7Mhl1L6VfnJGO16WyblCieehfHrrWo8NyNx+UUFiXE87u3ZedYOqdsq5U+mWZem3qX7ISbEl8ttFjuQqg1pwGbRcTKl8RLE7SUMMAWErYu1lTK5ojg/Yrg9OmKEL9sk/ctA5Qt1AmmZTqbMtG/IpzHIlQF8PDsB89Os4WPiyON6wLuVs7MJSeWd+fnJwGixLs5+AhAaaRyR3mZnHnozjwUne+YpoDhrtVB7Eb6m9qXH4KrNyAXLSQ39dCgxzgNCNRYBJNcTIIJzJ0Z1+YEQRM1VqSeFoKAChx0JXSqYBAFVp8U4OEYSAxDSBPW/C4GWVE6Ox7UsyoKveuyTw3xSvs71/YGeBTUa5Rt7VbMxyU3PcDNK04AbVBru7UPRbK4XbEjHbLYewHYEt9KZH+8i5FGTTtYJNtldx6HyWUxr/4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(1076003)(86362001)(70586007)(30864003)(70206006)(5660300002)(336012)(6666004)(426003)(8936002)(8676002)(44832011)(4326008)(82310400004)(2616005)(7696005)(54906003)(508600001)(110136005)(316002)(26005)(16526019)(186003)(7416002)(83380400001)(36756003)(47076005)(81166007)(40460700003)(2906002)(356005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:07.8115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a38074-edb5-4cf6-31b8-08d9e14285d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
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
---
v4:
Return number of coherent device pages successfully migrated to system.
This is returned at cmd->cpages.
---
 lib/test_hmm.c      | 260 +++++++++++++++++++++++++++++++++-----------
 lib/test_hmm_uapi.h |  15 ++-
 2 files changed, 205 insertions(+), 70 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6f068f7c4ee3..850d5331e370 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -29,11 +29,22 @@
 
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
@@ -122,6 +133,21 @@ static int dmirror_bounce_init(struct dmirror_bounce *bounce,
 	return 0;
 }
 
+static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
+{
+	return (mdevice->zone_device_type ==
+		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ? true : false;
+}
+
+static enum migrate_vma_direction
+	dmirror_select_device(struct dmirror *dmirror)
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
@@ -572,16 +598,19 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 {
 	struct page *dpage = NULL;
-	struct page *rpage;
+	struct page *rpage = NULL;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
+	 * system memory to store our device memory.
+	 * For ZONE_DEVICE coherent type we use the actual dpage to store the data
+	 * and ignore rpage.
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
@@ -601,7 +630,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	return dpage;
 
 error:
-	__free_page(rpage);
+	if (rpage)
+		__free_page(rpage);
 	return NULL;
 }
 
@@ -627,12 +657,16 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -646,6 +680,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage)) |
 			    MIGRATE_PFN_LOCKED;
 		if ((*src & MIGRATE_PFN_WRITE) ||
@@ -724,11 +760,7 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -808,15 +840,124 @@ static int dmirror_exclusive(struct dmirror *dmirror,
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
+		if (WARN_ON(!is_dev_private_or_coherent_page(spage)))
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
+		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+static unsigned long dmirror_successful_migrated_pages(struct migrate_vma *migrate)
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
+{
+	unsigned long start, end, addr;
+	unsigned long size = cmd->npages << PAGE_SHIFT;
+	struct mm_struct *mm = dmirror->notifier.mm;
+	struct vm_area_struct *vma;
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
 {
 	unsigned long start, end, addr;
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[64];
-	unsigned long dst_pfns[64];
+	unsigned long src_pfns[64] = { 0 };
+	unsigned long dst_pfns[64] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args;
 	unsigned long next;
@@ -853,6 +994,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		if (ret)
 			goto out;
 
+		pr_debug("Migrating from sys mem to device mem\n");
 		dmirror_migrate_alloc_and_copy(&args, dmirror);
 		migrate_vma_pages(&args);
 		dmirror_migrate_finalize_and_map(&args, dmirror);
@@ -861,7 +1003,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
+	/* Return the migrated data for verification. only for pages in device zone */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
 		return ret;
@@ -898,12 +1040,22 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 	}
 
 	page = hmm_pfn_to_page(entry);
-	if (is_device_private_page(page)) {
-		/* Is the page migrated to this device or some other? */
-		if (dmirror->mdevice == dmirror_page_to_device(page))
+	if (is_dev_private_or_coherent_page(page)) {
+		/* Is page ZONE_DEVICE coherent? */
+		if (is_device_coherent_page(page)) {
+			if (dmirror->mdevice == dmirror_page_to_device(page))
+				*perm = HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL;
+			else
+				*perm = HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE;
+		/*
+		 * Is page ZONE_DEVICE private migrated to
+		 * this device or some other?
+		 */
+		} else if (dmirror->mdevice == dmirror_page_to_device(page)) {
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
-		else
+		} else {
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
+		}
 	} else if (is_zero_pfn(page_to_pfn(page)))
 		*perm = HMM_DMIRROR_PROT_ZERO;
 	else
@@ -1100,8 +1252,12 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
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
@@ -1142,14 +1298,13 @@ static const struct file_operations dmirror_fops = {
 
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
@@ -1157,43 +1312,11 @@ static void dmirror_devmem_free(struct page *page)
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
-	unsigned long src_pfns;
-	unsigned long dst_pfns;
+	unsigned long src_pfns = 0;
+	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
 	vm_fault_t ret;
@@ -1213,7 +1336,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.pgmap_owner = dmirror->mdevice;
-	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	args.flags = dmirror_select_device(dmirror);
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
@@ -1292,6 +1415,12 @@ static int __init hmm_dmirror_init(void)
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
@@ -1314,7 +1443,8 @@ static void __exit hmm_dmirror_exit(void)
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

