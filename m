Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660333F6DF9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211E6E10E;
	Wed, 25 Aug 2021 04:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEF36E10E;
 Wed, 25 Aug 2021 04:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJAcathZ8wmTKk2gmUM4pQw6RqFh/v9mgGakIkwWcwI6s5Se3g8Y7LZm3O77V88/QCkzJaWew/r9BoOV/JJXYm+oODGZ7BieB5+4vfIzY+7sWEgtOSFIgKySPug6ToDexWpjwJESMoztsEgehtF+OEWJo+gWv1agN3vDGbljxLM4i6+VHvRerZrmNEBPeFonIqWsAtjtM49AJMRusI/uBZMCkgGVi5RMyGJw3RSF3kIqkZBkFn96mfI3XrbJZcY0yU6YTCdfhgKaOdx6wwfQZ6PDV+IQAlhlwBWmJfXadkOX+8u5D29k587RUgnGzFVdVo2TjcDzz9dnpwCKp60yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leJttb/LFh2M/wzwUmywQ7bX9zYZjJvBAUyOE4AeRxA=;
 b=FYjkjphL2eagOyY706l+RfJqMwBc95EFZdAZnMVGSA9xVNDPI93AoVfTRwhMZ2IWOL5lLea3oC+9MTjGhR5Hvjn7OcEYBGCmOt/gI2JFGsUo7nuXwIUIepGo9t9UEkaKGbcNWCSCPYetdPPknrrDm+JWPLWRVByErC3Qa2IRy80TcI5uNQ4dw5uDQ3f3H9/jIyOTi9Hmv17cO00wSdNbPuLQjCrYB6aPXaLaCdiRA0r/fZNGuiKz8fEWhHpnCu2WedXWtjwt6qk4AguHCSRpxUBLT4IEF69GuHWb0HKIuLN+YK6KjIY5HNSXPdoey/BGOppHHxyWgcWPzbqzfEPwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leJttb/LFh2M/wzwUmywQ7bX9zYZjJvBAUyOE4AeRxA=;
 b=jp3KnSuKDPtZiSm6S9rrZMEWyZRGh1AUjBjmzFBm7H6Z8rpPp4SfD3/hFTFPrnh7BYk8pkd+MBnD3MadMMEU8u4uDTmtD3DSpdw20ju7K2vylEcgq4MXAXsAQeYxMOH21xgH+nkkT8FBlzzIibkeR1sEfV/+C5hBHP2zUsHkQx4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:51 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:51 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 12/14] lib: add support for device public type in test_hmm
Date: Tue, 24 Aug 2021 22:48:26 -0500
Message-Id: <20210825034828.12927-13-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df307ff5-7953-4ceb-2e29-08d9677b406a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750E6E67B37574321AD0F81FDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTt3M51vZEX/Cb+NKkxwX5Kg1MUcXb4YMhOGLNTNM0G8eFZa25tIbaJN3r6eWlgy97/+dF+WQuYlq8y+8w7kB+mq26LJzp3eoi7ksy7xNS/zizv+NpZFwF82DgcOskhSq30QWmpWR1gAwRwyt/sIFqX83RxEWMzu2H+ugEeIJTucbleefokP8CqscAacolIK4zCrucXhPz1y77hDDSRU5lSyOfTk2F3lasjE2kAzhwB7V7aNQlVeXq9nBC8qiLk++9pV51hmA8D9QElAeImeZ8MHpnww6Qa4kFUcLfc+m1Uw3lhDJNmTdpBuAhvic1GjHT1l7A0xb6S6GHhwNqcCm0ScV030LFGk8zdFXFQ1V3lu627KchttSy4LNnIwyTyDoF8RQAVHGduOsaa2w8dxjKkT+yr7QO5i/sj6+RuRwPxE0IgfAD4Pa2QdD5XPc8PLTbiG8onUxyrVKbrefFENpOJImgQRQN1WJ9MF96vsMH7HVhEXWXVLRlemFNV+8TgTcxPkEfonqERS3iMq4L4pUG0r4Adfm+vIMQB4KeHi+z8PO07qs3UJ9KbrWyCnm0t1YwAdYRsBw5vKAjkpFCB8uMIqsFQ/oIh4x4GIAnmiKtrHOKXCsCoGTEJHfIPGtqq/qCpqNZRgrvNVpz6So4TzZl1ynJZNLPPWTOSuEoomU9gjPij1vnsFbIAIa/aecKTtlAGRxs8AVo0sp5tNJtqBRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(30864003)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkaUVHV9Xs1hgLGJmaE51jkuwNnoX5pO6C8whvywbLypxqdZVm5v7Seus25E?=
 =?us-ascii?Q?J+OVlWt0T8l2fcyRUDxX9nxcxJYiV67AFgI0PsXEZf+jEMMrul7SQHo/scqj?=
 =?us-ascii?Q?AWP+LOa+Gzjglo0RQysXFysox9yOgICMVpJfev8APeWPrGFSvVKcckiWEPci?=
 =?us-ascii?Q?RhUXngfR5W+J5xeTXtsVGar5lV+oBW4jtoydDZBm3OXlUSqj9qup71CXuEtZ?=
 =?us-ascii?Q?OD+EAjN2ALzVeYGeKwArWfp+UTuwAl0UpuFQJTXK2anK3mExjf7PRz9FPTmQ?=
 =?us-ascii?Q?mkZB62mBJ6Vo9sxeYXeZiSsnEBplxAtwik0O6izpLRT4PosE3RU/d+aeXPOV?=
 =?us-ascii?Q?8A0V+SoZUHnJ3cfWjJ/n9kVNXTeSNPJFfUavEhqyvZxW6hXEBrCOkM7dDm1h?=
 =?us-ascii?Q?E5nazTZqXP1U+VXHBPwLL4nGFskDr7B5/NhjZ3zAm+3ePeJ/TUMF7wwqI8wm?=
 =?us-ascii?Q?zYhuUlGVbHCQwQgclRg4XhP+/Z516f061CayuRZk3V2ljguRNI1vv8jqTEix?=
 =?us-ascii?Q?mPgmOX/xIV+p/cYBwznowdXtEa0EIxFErb0iVgnm3TrCd/pYNOJ4kosFnrO3?=
 =?us-ascii?Q?HqFsHisZCIpxaomIQrIMaKgfRzHgg0Sj7ZRiiiRgtGqjtwe1S60bdfBt3lyE?=
 =?us-ascii?Q?exxThU2Q0l2Spoh/G7PAhG116doh6CVDaPndldBsvmR+hoXo2ded8SPHXz5U?=
 =?us-ascii?Q?f8baS/RCDC9Y1minimHz06N2LtwSPYaZ/v77c5Ti30AnsCrAXyjnhrO1XtAr?=
 =?us-ascii?Q?Lzj8vHVORV3fdkdsml2V3YebxdKwqYV61fIJeBO8zdeuZ/GIsnjyiwQEJ0hP?=
 =?us-ascii?Q?vfQvvAALGOzbCqQf+mhuMSoiVVf2ccKZNoCimuMC3LnRybxeQFyNbJNGhmrd?=
 =?us-ascii?Q?TrK/OpGDw4jFFmgKdRAYe3wY4qt75QkXAKArkcyWZj5FPh3xYukatk6FGLas?=
 =?us-ascii?Q?NXq0a0fMSKO886ARiaDcdrkoBcyVoZCtllxpCDQBLcs9uQ/tSNFfZjWrATiB?=
 =?us-ascii?Q?n01n/ZPaM8B2Y1sUMoaSD+pcRCpzFSPE470ce/GiO6nAR00y6H4PfonDDWxs?=
 =?us-ascii?Q?m4wg+AcQL7Grfsw2BNgXOXPd7xT0WZ/7P7YnL14pv+iXClVM99WpUlo4NQO2?=
 =?us-ascii?Q?Q4ZuBuD8qJL2VQmU4hOKzVFw/aVeCSR0SRmda0YbLXaobawu95pDGP+VOeNz?=
 =?us-ascii?Q?R28VYWgS/+yQr1EHfGU9hTyYPcJebdXGMYzchGivN1/Z10K8IVIloj84Eo7p?=
 =?us-ascii?Q?TcqAkV81a8tDEVvJKfQh2p8Zva2j5ESz1KFmE0rBaOrU9ZMdIKksymPYRlVU?=
 =?us-ascii?Q?/sXTSRR06VIwXSaYFZkvxXcF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df307ff5-7953-4ceb-2e29-08d9677b406a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:51.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nTB9ZFUMHk/b2av/Ul/58hYvIo/UpR4P4vU7Sz4Uexm1QtnhY0MGusI9Ha49znbdMnpgqUJgeVXwu6ddUwSkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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

Device Public type uses device memory that is coherently accesible by
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
 lib/test_hmm.c      | 166 +++++++++++++++++++++++++++-----------------
 lib/test_hmm_uapi.h |  10 ++-
 2 files changed, 113 insertions(+), 63 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index ef27e355738a..e346a48e2509 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -551,7 +552,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -560,7 +561,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -569,8 +570,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	struct page *rpage;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
+	 * system memory to store our device memory.
+	 * For ZONE_DEVICE public type we use the actual dpage to store the data
+	 * and ignore rpage.
 	 */
 	rpage = alloc_page(GFP_HIGHUSER);
 	if (!rpage)
@@ -603,7 +606,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
-	const unsigned long *src = args->src;
+	unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
@@ -621,12 +624,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -638,8 +647,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
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
@@ -673,10 +684,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 			continue;
 
 		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
+		 * For ZONE_DEVICE private pages we store the page that
+		 * holds the data so the page table doesn't have to deal it.
+		 * For ZONE_DEVICE public pages we store the actual page, since
+		 * the CPU has coherent access to the page.
 		 */
-		entry = dpage->zone_device_data;
+		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -690,6 +704,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
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
@@ -731,33 +786,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
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
@@ -781,9 +849,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 	}
 
 	page = hmm_pfn_to_page(entry);
-	if (is_device_private_page(page)) {
-		/* Is the page migrated to this device or some other? */
-		if (dmirror->mdevice == dmirror_page_to_device(page))
+	if (is_device_page(page)) {
+		/* Is page ZONE_DEVICE public? */
+		if (!is_device_private_page(page))
+			*perm = HMM_DMIRROR_PROT_DEV_PUBLIC;
+		/*
+		 * Is page ZONE_DEVICE private migrated to
+		 * this device or some other?
+		 */
+		else if (dmirror->mdevice == dmirror_page_to_device(page))
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
@@ -1030,38 +1104,6 @@ static void dmirror_devmem_free(struct page *page)
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
index 00259d994410..b6cb8a7d2470 100644
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
+ * HMM_DMIRROR_PROT_DEV_PUBLIC: Migrate device public page on the device
+ *				 the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -60,6 +67,7 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_PUBLIC		= 0x40,
 };
 
 enum {
-- 
2.32.0

