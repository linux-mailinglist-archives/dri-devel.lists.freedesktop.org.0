Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A373EB030
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740966E50C;
	Fri, 13 Aug 2021 06:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D866E4F8;
 Fri, 13 Aug 2021 06:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMB3pGSaq2RPLrtuengTPN2enuKVs6VJKOR8NrRXoTYiS31Ir/iyo8JG5zAiOL+1JLT7pZtS4jfeMPT5ocwQ6btIsa78n0QK0548SnyM5nPWvHm9uv/yDX0oYZspZmc/KwGnZ7WpT0+NFam/pjwQHEdUzzKugcqXzAmzRdeyG6dQ7PbOTX4RhqAy/qrrEzmy0KOO/qFYv1G4mmdG+vBukA8jt4DXR6/UfatlddpeVc+pOCJPKy9GvM7/LaMkfYmxNTKETIRL7mUioUZlO9xJUTNm1zQ5p+Ib9xuyrGBUniv0VQQbPlTxGgoa5Q1jT1mGRPa7ee3oVSulyq7mdqH6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTsY0Edyc287C+46pU0ijUSzFlT32FMEIxEGIF8WG4o=;
 b=fM5dQAHzXQ0LQmSQ1LCh3xmTXLnWMGCUzg9pz5UAvHFEpzH+FshBJG59bIYVt7YVfSbqW4h4zORspS6cVeVilo3+6eOU2ZcbOww+gBRSxgECy3zZa10Zb5Jek/7+fNRGvB+QI4YmyWbDmfKZ3haYaJ+8+9jLw8itRYfyb6WErgD839ZJNI9vFSUAuGnIVxf7tyQNYrTN8vQNtx4BgtsYv1fGWDUc1+x6lHBtjIH8CGLJiNL6ekePJ3fXUyhimREbE1cQHLYRSvY1gd6BI86sODveYX4uif23irZDACNQ/AR7xiHuwXKe0ksEM5wdfv2wuoPcaEF09A5cumppCDeCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTsY0Edyc287C+46pU0ijUSzFlT32FMEIxEGIF8WG4o=;
 b=f5plEv5Q25WWdFwhBgUi+O6m4AcWrGCFg3iXETDzoaaSgdkskMQScQuvQEEdUbz3gHS1ljte07y+5UlmuwSb8gDFVHjMCQ6mywe3jGNKRtACDPAUm+ZmmjRXsmA6htMC5kCMyklX3/BaRZnx5uhm476ZQrh1922+PgLjrc4qgEY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:10 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:10 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 11/13] lib: add support for device generic type in test_hmm
Date: Fri, 13 Aug 2021 01:31:48 -0500
Message-Id: <20210813063150.2938-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08269e7c-1ef2-4b71-eec5-08d95e241491
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2782D354E4F485741EBE0146FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1cr1lCoyiRVeJyC/FB5vuVxJh1NJ//D8YVn5oyUcy4/ysGVZRSqhiI/v+itwbvAKTCtip5y3hBRr1UMKXTD17LU0lMA5OJxGOlyyay7NssVzk0/U3G9XX5Ubrw91cW4zy0n5DBEcvQyxFzD5bwUjgw1UXSuPuQiWp4WFFjd/5IuDZonL/YX7JM+8OBZ1hQHqBjb9DtFaoUcxcVS55no/X1/1CJmfKaBCMuTXGgIhD+rwdYmavhzcggBy7Ho+Vu7RnuoZ6zmhgSYZvnxy8gwB5hluUoRKG7pB74unEMq1c674Fr5NDbPxtxGJ3Pj+i4wuFCJi5CNrT5f/GDDa9ecN1gYpsQ6b6Cx5uzfvyMqtIOIl0yGNgI/oL1eZq6Nx728/2em4WH2xaSFH/D8OppXL7PtODomLzZG8iFx2NLvMcwggLgY14DMkNw3YOmQaWnktxkIeoW1Ms2Z3hGpvXRNzapgxPHN3rzB7ZkmIA+yZbYH5mt+rhs8/k4VlE+ZurKfH3CQLCnwp2XapD9mBSBz3uh/O4Z3LMG60Hah/S/P9a8Ac9HHz9tjE6q1hjubJh7ZyDSCDBARROeDaIIjOKXs49j/MSos6LUWt/tNbcXH1+QYYqDcGAd3e/orE90ze+3lPGLKFl/CqcTFjp1Qj/JPoajmfTkUYCORcVA5WLGnOXmBzTQdnjtxC5BxucWXhmWge4nLvyXe+iFefHBoRGJffdx1ZL6/EdoTQOjfVQPyidU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(30864003)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j4d6xXKqrmMKnOViNazJZCVLkw1LM3rNpTEyaegSPbhbhTkXis50vRVZ6L3v?=
 =?us-ascii?Q?WFr1jGn0a2oQlwDA7T0ExU5qdz9FVnE5a9+cCQM41q01+MUQy39Tm4JQQzV4?=
 =?us-ascii?Q?ZlIo5kq3iJlwPfOyS1x7owQBUKwfkPaWvL3YGXZvUA9HaYG6rPg9B3r4dB6J?=
 =?us-ascii?Q?cWmjrKIAVQftkHSQKDSX573udh7kx+8ObBfvWTg/HyjMCwU8DXUIjrwoR6Mb?=
 =?us-ascii?Q?ZDSpR68vxiynwMhnPv5+8q6kB3WsvQbk+g6Uh1XCI6NLBMSbH9+uDqOLwraB?=
 =?us-ascii?Q?mfxav8wMmfvvPRdW36ECMXPbdeHW6mcN0O7VcvAS5Z3RRvADqzke+R2Sf2K2?=
 =?us-ascii?Q?3zRGZ1GQb/fEsAmqTzaBYLTEedmjZAPTxmzJ0vXceWmf2NeT+pYjLqOe9OZI?=
 =?us-ascii?Q?jTP5mS5TTLxivJORzEjo43pt5HTbdtQi0LtNpZ1A9lxK4ueUu5weVU1/cmwP?=
 =?us-ascii?Q?Asv9xmjiVX9OOoYgjYJ5POXzzNCRywOLWek0cBkF4Eyix6dRa9fAWCfgiX2o?=
 =?us-ascii?Q?1lv+t11FLgJsxnJIaSJGiHbKaF/KCSosUQeHQDxJecYbcuw8CYmDInrc/j0P?=
 =?us-ascii?Q?DKxP2+ClXjX04UzPjWwE4cHvAOiWYaA/tzqpZcOwEY77N466r/yUwTzO4Vju?=
 =?us-ascii?Q?USskO7n0PwdPFYMHXcsEmtgWDIyBzjja1cuUH9VmS6+mqS1kRevMzVo9Yf6S?=
 =?us-ascii?Q?q6CAliYnbi2wjg6biq5VDCIaPBeQZa8jSUfP4vsgelqSiABu6I2gkpT2AG/7?=
 =?us-ascii?Q?/noq+ud/CMkXfIAEuo6ml028rFOwFOzfh0SD7NdenwM9HTQyl5Z/spZWS+y7?=
 =?us-ascii?Q?dRSCgDDW6gWXjeVDGRZaMdm1CDI3tThCKjKJct61RompmC8dI4UpDjs6M+35?=
 =?us-ascii?Q?PG7EWq2qCwD9z1/fqrgjzzOiw73IFcV+W+IX1dqg5DOl1PnXpIEnC4X2IXrE?=
 =?us-ascii?Q?ZoqFDjOEclw50t7mmLdktse7Pn5/JJx9D9fC+zkBAsgYwc3Nu8TYzUrxod2q?=
 =?us-ascii?Q?gUbZglSzMgL4sOkbopuR/85mOsHfLL4GwvEDGmTNQ3e2vt/eKLjxUP5ov4Nu?=
 =?us-ascii?Q?V5AdmIhPQo7F8vxEaCcx+2WReK5mu5ui3MgLg5G3bBVISC39D16/fTLmvStm?=
 =?us-ascii?Q?WP/3bIS6xLXiYwtrjP4PjDE/UI8xnImMadIAoKO1mVvq6Mb0iE8SaN+pmq8F?=
 =?us-ascii?Q?pk9SRLYJfTCCmHeNbJhvVhkrmLenweftAvmkh8FznI4B2Aho6rXCG9BTBVNl?=
 =?us-ascii?Q?htA3JPsh9/WIWTjCrlI//TestugEtuPPyhlO7TFYzwe+14mlMITGXc6PsGbK?=
 =?us-ascii?Q?qu+6aaEVAQXSAqXUxzb0ag1S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08269e7c-1ef2-4b71-eec5-08d95e241491
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:10.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpPkVlaLCecIDoBk9eSerApwcGWC0KQjRGeqt1A1yoEClXqtnVi2i81Ll/uzxhrjh28MoRf0g6N1xowHxrKG/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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
 lib/test_hmm.c      | 166 +++++++++++++++++++++++++++-----------------
 lib/test_hmm_uapi.h |  10 ++-
 2 files changed, 113 insertions(+), 63 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index b4f885c6c6ae..42edcc8eaad2 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -550,7 +551,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -558,7 +559,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -567,8 +568,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
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
@@ -601,7 +604,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
-	const unsigned long *src = args->src;
+	unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
@@ -619,12 +622,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -636,8 +645,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -671,10 +682,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -688,6 +702,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -729,33 +784,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
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
@@ -779,9 +847,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
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
@@ -1028,38 +1102,6 @@ static void dmirror_devmem_free(struct page *page)
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

