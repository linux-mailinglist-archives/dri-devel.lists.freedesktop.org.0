Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0B3E9EA4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FB26E2E3;
	Thu, 12 Aug 2021 06:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BF76E284;
 Thu, 12 Aug 2021 06:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp/kzO01amuRIyJQj6pXskdPHyOL2z6tzPueo2xnHWBQenBJjfCo7plzrl3Yd6IdrIUQ5lkPjbCSz1AYXVQZkCNvuTbbWf7HLdGhiqDnucRI3A7XgWRDU6UeUG5urmWDrw+EVt2TJvAR+bnc/fZY+liRmq9/VcuH+SERe00mERaoiHNWP6fYEK4CCYuFdchQpZSAeGRx2K1fLNJkW8LlDghmUAcYhtLJFt04VWf70buDHQO94Ka2Bk+WuD7OZSV4B53BjdlUXWMIzglQINS5lTDSWRs2OeIag2RzAPZ7kcnLfziIk3n3QGJc+Q8+bryEB298iV66OmfPBkU4SQNUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9mJA7nvdO1HwMs6uZjxT1KqyJPrQegdU0udvrVI8As=;
 b=lqfxrEzFM8/vv1ziwy5kqqaFdXVcJ9X1kqJq2ngFANOYUF5IeR1zc8qjrVVj37IpdAAPCm89RIVgRKqrLXC3dp+s38lCtwoj8wYkl5xt3jJY6reAnXKe81y/odtTpdBoqdHSENt8oovpz9GxBqTOd8Rh0NgzuSGTEU6FQh7aZFZY2YtxetZOYyomKfY7BawUWKBFgx7aJb3N0Npi5jcAWa0vVIZCkrgGumCq/deAjGoy8y+zC1o9AjYeEfBf0oeNe2ZrBt30pPbPZcxeP3GbyDBm6Bb4NHDTN5nqk7Ruowd7wQXEUvZlIu1NkhlXILszS9XLKl6LvNq9sKEFz4jQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9mJA7nvdO1HwMs6uZjxT1KqyJPrQegdU0udvrVI8As=;
 b=aozkPspPkHBCu/g2/p3BLGZ54ycDVViZbB2fHzS8NqfSAEx84Kd6b25bwtBje7Nih7rXmWnQOyWsD7s+azOpjrvUNw8Cqkr4Y62m+z+tGf8slvibwPsNVaO2DMZT3+XRZ3dWExPHLFUEG/XGGQUqjUfnCj0T9a7PUNqN4yg44NU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:27 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:27 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 11/13] lib: add support for device generic type in test_hmm
Date: Thu, 12 Aug 2021 01:30:58 -0500
Message-Id: <20210812063100.31997-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c09070a-a888-40b3-4fa8-08d95d5ad018
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB244850023B558AD804E6BCB3FDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7A8XlS5EbcqYC1rdIgFnXxVIxZZGFLfFGHYqalFd/rs7kA9V2d4qaQm2toTQr8eVuc+KPEPChQ1464Y/IBPXD+v1Knrc9rblMfd1ebDkILWKJ+0s2/AQjvvR16iKur+KqAxtrSd7V70inLh5QOobm2llfmKsI5GtEkAdUKSntrTBePVtafcYP9LVsep8Tgl5U7jIOO6sueg+37PKWX9/rcWnSyH+66+7fjILqnvfm13JpTSsEWS69pAXgox7VZQsNAZ5WcnpwZjbjBcr8s7BLkNc9lUSLHKqe6KzZtl2ohSOK6XD/UMe9RznX0gXC1FkgSOHlyZE0s0iG4zW3IrK3EhmJdA+TJb9YeQllHc7Ayjsu1MaVmogrkupgl6+uYSlSLH8zGAUgiwLyTQDGvMhkazba2Y505qfuQ64qqBJq96yiX3g1/D06mkSSgVREDhwROAmxpmaVT3H8owFp9Uxo+j+3o5wGjssQN/alFw0CYoy4pgwUEI5fhDTJyQInTeguVfJHvwYMDD0dm5IyCDpMHYon3rPNp0NDMopJR6k4kdOJsBPO3NQpfuFs2wrj3k/BLMsmXXcgpvq+7cmWZhWgk+88p4Y3ECBIbjLBORQRA3BrZ/cng04yvrftaGlwR8KNpsO+SuhKG22C8NYg+6hU+YxoyIsc4dyyr40fzXutK9NwXvkYTA9R3GiwhACyQDjP0/rKCeN4eJ3AtLgsRZxgAFUu4CAR6br3GYRqxldzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(30864003)(316002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2s0Hdd7xBPjhYoqb5gL2HPB6ggvmHSbAyMqEKD48vbT7Aym983Zf3qJ6xC/7?=
 =?us-ascii?Q?h5McPRjtxIqTq79q9ARyPKlaM5e9tqR2V54DfXHG6sB4bH/zKYx+qtcsbFu5?=
 =?us-ascii?Q?R1/GhI4PpXFugpFObOXNPGUOvb8jX5dOI8bKQK6i5V22373EAKOolRAMG51p?=
 =?us-ascii?Q?JbhUBUVbUXnovivypSYLo9+2aIYyNUxTonvBWH1CU/Y38H8N/NH/OPlGWlBS?=
 =?us-ascii?Q?38IEsWbqJvuRF+kuhDYEXG30ezcX16YlnUrX7SXmfvJWCm5NxloAJ80OMLj4?=
 =?us-ascii?Q?pETHVvEtMFY6Aatb/8b/rMfTngiIXO4T8GJhoU2DmHoNFKtOqGyhyhLZUQNv?=
 =?us-ascii?Q?iOr7Ulrq+KLY1E9V5OcAcCkscYFFlW53rtUXJGvEA3elYrgfjhmFrhjg32w2?=
 =?us-ascii?Q?NXHbCTEUkVoAjiQnIR8Pn+31ib0SYR/5zGq728lrUmeF1ZfaHWrnmDxMo4n0?=
 =?us-ascii?Q?cdS8XoFKvMUBTN9FpyKxxloDZxVn0izHPgN89zWjl4A+lPcFCTnOEe77zwBi?=
 =?us-ascii?Q?hbQz0mjApsmOkDaqnf3CfJCYeP26TBR9AbhWuy9fGNtxaaFNB9gtqVJZvbYq?=
 =?us-ascii?Q?SKXObGy9DUHy45AdYYPhXgEuZ+XzVtIJhCnQmE1pFNZe1Va/UqwcyKyX6XPy?=
 =?us-ascii?Q?/YLKBOd/KiTZ7MTIXcFjc/p1kHA3KqSSU04mwQ0xGRNz6bcZAnjLXdhSY8uv?=
 =?us-ascii?Q?87pVT4330q5FkiU/CkeoAl5M+oB2LdY4lQFUCmcRuGYm4qjVfPztralgycGF?=
 =?us-ascii?Q?11uto8J5RTUJqQ+37WLiB2o4s3t+JDM+CPREvCcrH107NBe56Ns6Cqq97Jxv?=
 =?us-ascii?Q?5fZ5ZsBsJQKUhEIvxZZOu7I+rLyzfZqUYpqve0zM23YWNh8FNXlxaygu6E/M?=
 =?us-ascii?Q?gkqUMTscinIpxYWI8vqi2bw8fcdP8lNVcC4GoW3Ki7L9t00kQHTB3NZXgehK?=
 =?us-ascii?Q?sU6lNl+LSAIBc/QCVznEzKV6BDe3F+B4dwpSrQ/8scnxFnaJuW3tQsVBQAj6?=
 =?us-ascii?Q?EYDmIViiE54sMsPykbiIPaFWsSLwkxNRUpIsL84+35OBbLpAXHJ9peR95nv+?=
 =?us-ascii?Q?V4BdDS+kylj/JYcsz4AL+SBvtQdu5zKOnpY0MVSrFeDA3MFnHX1uKCHqLMft?=
 =?us-ascii?Q?rtHO5+RXE3YsRYiG44p8ghypOFbMz7djy4EXIb0i/JAVGAkWmtjz60QiOxr4?=
 =?us-ascii?Q?uVZoDi+qZGBdqwB6F0UHv0TbOBt2Kv3Yw2cILjcLRfADNBRxWZ+XsVmcoYTY?=
 =?us-ascii?Q?dZ0rQ1dY+iooOLz6M4sJk2I6AKzNnP5p0VR6EU5YBEg+/9jqSP9xtCLjzJMy?=
 =?us-ascii?Q?V9yCl2Vsdj7XkJgFAW+u5fAz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c09070a-a888-40b3-4fa8-08d95d5ad018
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:27.0494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X4IBtCsJpUsxzyxGO2RakVxjOR3fxGwt/LmcHTGvzDkbpvImHTLJz2A+FchzG3B8sGw2Fz8L37+bJESBoB8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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
index 9283ad1f4280..52b6190fab66 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -516,8 +517,10 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 
 	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
-	if (IS_ERR(ptr))
+	if (IS_ERR(ptr)) {
+		ret = PTR_ERR(ptr);
 		goto err_release;
+	}
 
 	devmem->mdevice = mdevice;
 	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
@@ -546,7 +549,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -554,7 +557,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -563,8 +566,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
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
@@ -597,7 +602,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
-	const unsigned long *src = args->src;
+	unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
@@ -615,12 +620,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -632,8 +643,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -667,10 +680,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -684,6 +700,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -725,33 +782,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
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
@@ -775,9 +845,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
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
@@ -1024,38 +1100,6 @@ static void dmirror_devmem_free(struct page *page)
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

