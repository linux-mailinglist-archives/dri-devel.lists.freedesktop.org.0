Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6453CC5D5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEFA6EABD;
	Sat, 17 Jul 2021 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A716EAA8;
 Sat, 17 Jul 2021 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFxbs30+EKvuZE4CYxS5UEFDFzGf9/5S54L8S3+WHr158MZ+FoOKnH+HStm7r7PCRDxxYRWhEuWeM0ydTbk4KJ7eVRVjmR0utqr6g0zIDS1XwiSwfXF0AcZlD1DDbYEHQBEu2SrK6SAf4fbAzIgzYoqJlKMSs3M4198UGoVIsUWBxclNZt8VuF2zYgdgtDxhKRx25LBmXkMgdR5+Hv/1Ru2Y28uqIUl+XYE+Y0qPMSWtliuyo8jLcxCMsuCSaA5PPf6FpK0X5DGxZxuQeBRFukV65O4ZdmODd+04z4mAOGtGegIKwTPk0Mv7Ato36VridWE0QoqAEaz/sq5myiR5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxORDB/7hRjKfIvUPvXBFUKxwjsBDFZYHc65pjTMu0k=;
 b=W+Lju5/nSDUVDOkX/ADS563dVqFiyW/N7oPw72CPQrAAgdtnEBo+859Eg2FqebITZUPh8y9WYAjfijQB+DxW3SXUHilsdaAoCABZVrcNtBzI2fAdjBsPHAF4liTD7+YWwojsa1L5fIysbtjBBHXR+YptCgtzjmoT7boknl4uJCRgOFFxF3F03gRxr88JQg3HJY7Xp7p4ThsnHJKxdpJSshgrHsO8olVLlF+Pe9d5R1GKoi+XTPQ37skgDaQWI2yUiy2GaO2gsdBSz1CxGWOt/IIziYwK3O4TIwWWWqIpJTljYM3Gu9DLl/FJ5EPiPpasxz5NCKRENy7UhaFZT/S4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxORDB/7hRjKfIvUPvXBFUKxwjsBDFZYHc65pjTMu0k=;
 b=O12SM8vYJipmBCVHl/ESt+/nIGi6Ijg9f8FXzFHOIe+AMTfV9hiuqo0DxaahAfBvTMMU3ehofalIXmCeq7hqK6c/iyzlplfJllpXwPBTuZuzNr+/zsk2CDGGr0nJmtZASqjWj2FdhYQrQzJ+GoAAXqIaFV95oKG40zRdvPonsyo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:58 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:58 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 11/13] lib: add support for device generic type in test_hmm
Date: Sat, 17 Jul 2021 14:21:33 -0500
Message-Id: <20210717192135.9030-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4354b30-90ef-4fd1-dfdd-08d94958225b
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB467037B9027CA7FE7FA1361CFD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPtPnWceWOYHtyqF14SVq8Sb1blm+H5weO8Hxs5WA6E9OTh5PGHB/v/k42rSMM3VihCD96rLLFitLrGTMIO7RlPHUc7elJGECN1QmFyXis/lXfH2v3S6GTpdBXCZIyJTKEA7x2ZlHp1TIHptNzFdqF/NaCFSswomIcfreReHgpz+YeDsCT0fgcAv6YSvn/SrG0QbAG4GYTdJ/1lFPzOZmeHWPLrLyI9e7y2iV7u5/Uf0jhh8Nc3UBciav5RHVhzVOHCBStGEz//Ccr6ITGUyLJIbvk6ch2ghd2Mxp5tLY/+R5V/MtJQSK6neRIqhjJwpMOOpSIt298Q74P16pJ/qivnM+xMuYyGIvBLft6YX7kDbK9Px8HAaG8Cu8YOWCoE+qTlXzvv5jeDDfx3jTRjWuOi6a69TgmZdzdTXcfyDlk+m47Bjfb9c+xNLh5z20pn35oprHT9t5X5f1T0FTjip4wIGvTw3KY6e3EnZs8oeivVO8H34lMBAqGmUnAf/q1Cak9X0rYVjtP0qvSxjcNTWfFM0DPC51cg0QxQWHdxpC5zBGFpyvIjihm330RPoU8QK/QwAarxeUmXPx+eafyGCi8qnXLrI3rZq/U6jen5rhEqe6xOpZIaHrkW+aP8Zi6DMNct7qDWEHNnnXQ9RZRZtgc5G3UUPWio1muiJo6kD08ZcjGpvwI+SBS7IgJeWA5m3cP9B98JSYVOVsRbCOwIRYQ5VhHlAlgz+xm4fNDx3p4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(30864003)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?czUwKf7QU/OnWNjM6vqLbEVVZDUurQ2U3RReMvtdb+c2dhXQNAhM/0tqes9C?=
 =?us-ascii?Q?O6JpMHTv4vpSDItLExOl2OFBA/2kBGaLSkJdiA0YBeFQCV6FdR9qv/QOiZZg?=
 =?us-ascii?Q?kEjp1SzycfTpjOUE4nY/hCzo3Q/o6j7fZzt8nfssqQhKwecilFSk/JklW/ye?=
 =?us-ascii?Q?vfoeYCjVesU01adNDL791yVGeHfvACh7lZ6C3hbkL4BoakcotFzmpusWUqvz?=
 =?us-ascii?Q?PqVJjm8drKDE98C9ecsm1JCLa8HzmpYJkrlOjr2/5ay2uYyMkSpL4H3loyJi?=
 =?us-ascii?Q?0/bIU6/cZbZB6G4bjoYETqk+VQj8rIZ5aOzK6Z6LUtPp92w8kSJKka8Imrt8?=
 =?us-ascii?Q?RMtLy9EvcYa31di8YjeXQqv2KkAkROySWg2YwO8idBi/WftqKKufXrPfygq4?=
 =?us-ascii?Q?RjlqhO5lLYu+VuNEjjDFqDkD6pBkc07yFoQkd/w0NDVpbFJoWUj8v+FadZIx?=
 =?us-ascii?Q?7XlX6YNquK6AGgjaZ9PD1Q5U/3XaBo7+du6w2DDm6j/m48P+6Q8xACcRnWOp?=
 =?us-ascii?Q?CNqlhbcxpLxkkTxdLw1Wk5sqlkXNpTPDQiD0ofib+bqlZPZ7HUt4OqmxcuO9?=
 =?us-ascii?Q?Q89j7LCo5WA0PAFsxrMCCpKe2E3sgU2DnmVOGjxpUVWnJtHuV+FbWoAnfNRr?=
 =?us-ascii?Q?WssYr9HPief6asDMGJt/KM9to5N9jiBUPrO/R5XYrAQXPs0Q4dgRK3/OkJ/6?=
 =?us-ascii?Q?WRZWqozxKlxBqQtBiZhHmV0ehwCyrtShSYYQ/j0QxgHbs/hURujNMcvW8i+P?=
 =?us-ascii?Q?lTFQffFDrgdBnQ7RfAiZxmdFzfKmMBHnSOcOibAKoJeu4h3bNgY+YszlTGA/?=
 =?us-ascii?Q?nN/2wRUFd2kKcHrILpXWXr5gJWACJDeCS+aiMqibuXF8LpTvAc1M9OrSqUba?=
 =?us-ascii?Q?66YLwPj5LjHX+V9n7WaELY7732mb1tQ+bqn9BcEvS+9LilQcsoXCPNAJUjnW?=
 =?us-ascii?Q?9YZOmvXiC/1UqimBPAgyOPOmh4ssgxYdBFujr8bhH6aT70SvPexo0UI84uFR?=
 =?us-ascii?Q?Q+uS5GVE/NuRZ4uYNbFc9PJxtKWImxnjnvht5gnsH4bMS5mW6q0IRkLGqkD+?=
 =?us-ascii?Q?7xLYXuqXtO6GzsImkWSa7lnOL7AdwK9zxHlDfHHFjOA3Tjz1+Vz4Q+savTsE?=
 =?us-ascii?Q?WZ1L6anBpEXqZHHC+N+9tDkIUmdpaoDBAtmw81XL4JDOwkzv9Q9dqvZ5b2A8?=
 =?us-ascii?Q?H6Tu9XnI2e+u1BZvF/bGpdRZc6e43LrbyytJ5GH9IXEL99/MWJJFYP6fpcYV?=
 =?us-ascii?Q?1nOYQnXbVuTcX4XLXabt0QU3x2erll5IvY3qQzfGvweTWr7BvFzsXkNRj09X?=
 =?us-ascii?Q?yQt/tVN45Smqz0Oear+ebfLo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4354b30-90ef-4fd1-dfdd-08d94958225b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:53.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUtMuTPWHO1WtK1ooW46TPTb09PcV+68M81/AWlVltIMvK6PdnSCb9maTDSTkEGfVbf1SsZIfdtNE20N8SiFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device Generic type uses device memory that is coherently
accesible by the CPU. Usually, this is shown as SP
(special purpose) memory range at the BIOS-e820 memory
enumeration. If no SP memory is supported in system,
this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.

Currently, test_hmm only supports two different SP ranges
of at least 256MB size. This could be specified in the
kernel parameter variable efi_fake_mem. Ex. Two SP ranges
of 1GB starting at 0x100000000 & 0x140000000 physical address.
efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 170 ++++++++++++++++++++++++++++----------------
 lib/test_hmm_uapi.h |  10 ++-
 2 files changed, 116 insertions(+), 64 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 3c2e1fbedbd4..dcf0729d4883 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -517,8 +518,10 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 
 	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR(ptr))
+	if (IS_ERR(ptr)) {
+		ret = PTR_ERR(ptr);
 		goto err_release;
+	}
 
 	devmem->mdevice = mdevice;
 	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
@@ -547,7 +550,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -555,7 +558,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -564,8 +567,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	struct page *rpage;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
+	 * system memory to store our device memory.
+	 * For ZONE_DEVICE generic type we use the actual dpage to store the data
+	 * and ignore rpage.
 	 */
 	rpage = alloc_page(GFP_HIGHUSER);
 	if (!rpage)
@@ -598,7 +603,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
-	const unsigned long *src = args->src;
+	unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
@@ -616,12 +621,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * unallocated pte_none() or read-only zero page.
 		 */
 		spage = migrate_pfn_to_page(*src);
-
+		if (spage && is_zone_device_page(spage)) {
+			pr_debug("page already in device spage pfn: 0x%lx\n",
+				  page_to_pfn(spage));
+			*src &= ~MIGRATE_PFN_MIGRATE;
+			continue;
+		}
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
 			continue;
 
-		rpage = dpage->zone_device_data;
+		rpage = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (spage)
 			copy_highpage(rpage, spage);
 		else
@@ -633,8 +644,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * the simulated device memory and that page holds the pointer
 		 * to the mirror.
 		 */
+		rpage = dpage->zone_device_data;
 		rpage->zone_device_data = dmirror;
-
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage)) |
 			    MIGRATE_PFN_LOCKED;
 		if ((*src & MIGRATE_PFN_WRITE) ||
@@ -668,10 +681,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 			continue;
 
 		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
+		 * For ZONE_DEVICE private pages we store the page that
+		 * holds the data so the page table doesn't have to deal it.
+		 * For ZONE_DEVICE generic pages we store the actual page, since
+		 * the CPU has coherent access to the page.
 		 */
-		entry = dpage->zone_device_data;
+		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -685,6 +701,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	return 0;
 }
 
+static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
+						      struct dmirror *dmirror)
+{
+	unsigned long *src = args->src;
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
+		if (is_device_private_page(spage)) {
+			spage = spage->zone_device_data;
+		} else {
+			pr_debug("page already in system or SPM spage pfn: 0x%lx\n",
+				  page_to_pfn(spage));
+			*src &= ~MIGRATE_PFN_MIGRATE;
+			continue;
+		}
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
+
 static int dmirror_migrate(struct dmirror *dmirror,
 			   struct hmm_dmirror_cmd *cmd)
 {
@@ -726,33 +783,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = (!cmd->alloc_to_devmem &&
+			     dmirror->mdevice->zone_device_type ==
+			     HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
+			     MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
+			     MIGRATE_VMA_SELECT_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
 
-		dmirror_migrate_alloc_and_copy(&args, dmirror);
+		if (cmd->alloc_to_devmem) {
+			pr_debug("Migrating from sys mem to device mem\n");
+			dmirror_migrate_alloc_and_copy(&args, dmirror);
+		} else {
+			pr_debug("Migrating from device mem to sys mem\n");
+			dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
+		}
 		migrate_vma_pages(&args);
-		dmirror_migrate_finalize_and_map(&args, dmirror);
+		if (cmd->alloc_to_devmem)
+			dmirror_migrate_finalize_and_map(&args, dmirror);
 		migrate_vma_finalize(&args);
 	}
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
-	ret = dmirror_bounce_init(&bounce, start, size);
-	if (ret)
-		return ret;
-	mutex_lock(&dmirror->mutex);
-	ret = dmirror_do_read(dmirror, start, end, &bounce);
-	mutex_unlock(&dmirror->mutex);
-	if (ret == 0) {
-		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
-				 bounce.size))
-			ret = -EFAULT;
+	/* Return the migrated data for verification. only for pages in device zone */
+	if (cmd->alloc_to_devmem) {
+		ret = dmirror_bounce_init(&bounce, start, size);
+		if (ret)
+			return ret;
+		mutex_lock(&dmirror->mutex);
+		ret = dmirror_do_read(dmirror, start, end, &bounce);
+		mutex_unlock(&dmirror->mutex);
+		if (ret == 0) {
+			if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+					 bounce.size))
+				ret = -EFAULT;
+		}
+		cmd->cpages = bounce.cpages;
+		dmirror_bounce_fini(&bounce);
 	}
-	cmd->cpages = bounce.cpages;
-	dmirror_bounce_fini(&bounce);
 	return ret;
 
 out:
@@ -776,9 +846,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 	}
 
 	page = hmm_pfn_to_page(entry);
-	if (is_device_private_page(page)) {
-		/* Is the page migrated to this device or some other? */
-		if (dmirror->mdevice == dmirror_page_to_device(page))
+	if (is_device_page(page)) {
+		/* Is page ZONE_DEVICE generic? */
+		if (!is_device_private_page(page))
+			*perm = HMM_DMIRROR_PROT_DEV_GENERIC;
+		/*
+		 * Is page ZONE_DEVICE private migrated to
+		 * this device or some other?
+		 */
+		else if (dmirror->mdevice == dmirror_page_to_device(page))
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
@@ -1025,38 +1101,6 @@ static void dmirror_devmem_free(struct page *page)
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
index 17a6b5059871..1f2322286fba 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -17,8 +17,12 @@
  * @addr: (in) user address the device will read/write
  * @ptr: (in) user address where device data is copied to/from
  * @npages: (in) number of pages to read/write
+ * @alloc_to_devmem: (in) desired allocation destination during migration.
+ * True if allocation is to device memory.
+ * False if allocation is to system memory.
  * @cpages: (out) number of pages copied
  * @faults: (out) number of device page faults seen
+ * @zone_device_type: (out) zone device memory type
  */
 struct hmm_dmirror_cmd {
 	__u64		addr;
@@ -26,7 +30,8 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
-	__u64		zone_device_type;
+	__u32		zone_device_type;
+	__u32		alloc_to_devmem;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -49,6 +54,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_GENERIC: Migrate device generic page on the device
+ *				 the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -60,6 +67,7 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_GENERIC		= 0x40,
 };
 
 enum {
-- 
2.32.0

