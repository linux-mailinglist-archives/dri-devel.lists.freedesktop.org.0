Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE34AB37F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 05:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAAB10ECEE;
	Mon,  7 Feb 2022 04:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1310ECEE;
 Mon,  7 Feb 2022 04:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaT1Knlm5cChfrSE/P8R8yIyWi0QW5Ej+PFgg7asBjfNMtpDzJOWMEW3yl7PImf5eHYC7OcF5e3f8wAOH8ICwZEG3LGZOEHwQ/Go3xNkNvzFD3e7JG7S0PdcWEuW9PCiQZDwZMbzTtAoAZnVmPRkQ24UtVD5YSmxSOW7qVi1gSIC4P6lj6PuFsVLFBdAAqYOdwWJnQQtQaiJOMhpzpPl4X8vR2LkIspHpr3KapafcN1wlyazEIe93zExbN3Utf6VrOeEqxWz9viE4fQVb1b7jjjylGzQaKXgYseGrSEKbfIDLU/hpZIRmo/T0I1VP0LSFqrYU1dUoHwyvqiICXufaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVWwywowYnYpDCBBurDM6uN+lzL3XuJ6mzPfSe2PfX4=;
 b=cpYHe/yItr+TygUmG3reynNytkkscMOnnlB2crNNYUHEaQRnp+BJxy/bQKoi1RkeP3Qj74eD2UfTEh/Hq3558z2gSB5pDl41UcBeZ+OmeVkbTG++IiqoTVc6PfE2dcjNMJkXD7GuM+uoO0ZNanXRe2z/bne3csmukcv8V90rT2q1KHqTmBuFqwT5OnBGVbL/n+AEWE0DQtAFRji3p04jcikuV7aPqgl7+m+boY5ayvEgX8R5Ot/pOfDQvksjao7a5EJGSPgvS+lyBkEIMpSIBkONjt7V23LHIhLIWk+0u3w7/aoOtAxMj7k6iekP0m3BbwhAp6RlEAh5rlIjlvDXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVWwywowYnYpDCBBurDM6uN+lzL3XuJ6mzPfSe2PfX4=;
 b=GU9JzCPD2Xj0rm3FzrVXq4zdGz2hmg3magGfAIOdOTO1c7OU3E+RUxv3Abp2WNEdgxf3e+mKdF/Zfi9jxQ4z+7T1EFIgw3gHJSE6vrvN7aoC0NhGOzOPLVPPBZt14g1wCq4i/9V7KJEnfheYWwcYKm7p4aFkZ9LIT1Lcet/xEidlzrJABj00hcWhGpdLmhUHxmrg1NzlIwjxdVX61l6My13pxuOPrk2xTtDNwtcbQ1TSORgbF29MRHDkcTQs1PrnSkt/ax9wmEaScH9rEAfh0rkaSreL6y8GRaxste96DGYMEJX3M0Pi5tWBuk3P5d+x+bvzkDU8XshE7l7k5Db2hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Mon, 7 Feb
 2022 04:27:21 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 04:27:20 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when pinning
 instead of failing
Date: Mon,  7 Feb 2022 15:26:47 +1100
Message-Id: <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d3e71b-ed7c-4a72-af22-08d9e9f221ab
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB470562C42B6DAF907D8B7BDBDF2C9@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59UOEl+p+Mu8YBtp58ed4Y/LbG2vJ/hJeud8REHr8t6SHY+cPfWqO3El9C/aP01vckJPKh6uCvf4A+SZcI+de/kVdwVgvk0ivLCLLaofPiWi/Qbmsl4KEbAmtpByrHJOc1TsV3ChE79rE9Jx/vkxAjs7kbzRlJ8SwaDVG+CI6IzVyw3Ly4cEjHtCfH0gJ6VE8MRd2G+b80c1cylds5Em7u4fvgUxfenZEtZDi68j8mICr9mAjd+65QspRApYOzhRZR18zepRCSlRdE1Jf5R9RzHY8ZBBYNQNMMWohCUmIIkSdB9+PO4H8JYT8VVcjOwiXCy6TDOS/LISpH02aq3HCIu+iaZB7WFolpzmx0dotEDOqD1kHL8Zcgu6n3C6zjAIXBPCEBM26bX7FHWxHCLuaAPHrnYZw3B24p4vjQKzHZfLWxRusl6sdDO7Gt3DSpHKy8xn/9WkYbRZKZheh+sutXwYbfrSvF+W9al730o9mpmvxlMiG69DLTqkP2laBR+8BDGK29oKoPDOYQ6/qxhgGeRP6paP+dKk5yzhbV5zaXKuMCTlczqXoEG6hMsMoLooV6Szn84HHAY80Y+Q9/khc5nQ4Ik2Xr1hxfxNnfpVCDxpF5QohoaKMNs5UjcGWvnIYWySnCuSS2HCyelDk1XTEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(107886003)(6486002)(2906002)(508600001)(26005)(186003)(6666004)(6506007)(2616005)(6512007)(316002)(66946007)(8936002)(36756003)(83380400001)(7416002)(38100700002)(5660300002)(4326008)(66476007)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KWgbDTWqTXKMQ4UT35aTAWeJnmUvo7ADGd9oCgg25q+Z/HjX2yYQtgTsN4rN?=
 =?us-ascii?Q?bpiE16pSAuBtxF8ZP5K4fuklp1eOwyoxbLFyOHcH8blo/k1rKk0G/qIKxhFI?=
 =?us-ascii?Q?LexhpWFEOA9sgM7X2cJRdlYLHTUMPtEPlFacZbhVfVjb4KILTEAzgyOEvoIk?=
 =?us-ascii?Q?nR+qF5FoGoYTBmtvw75VIXAp7OIbD21pZLD42wZqXqD/dEVFzHAB6Uzj+fZN?=
 =?us-ascii?Q?gTWYVSq/sUVKYDuobbyTNibOjoQB1rxKNNcIr/fV6hDxjBsNlJ6Ave4G7ak4?=
 =?us-ascii?Q?zlqdaLwwtWXddFBfkyKlsBphn5IhT1qO6tISI5k4IenrStbCPa9NzkXk3J6O?=
 =?us-ascii?Q?5yovGUEbx3E/SCkKHCqiY+3bn8wx46+veP39aikW2iHwSRQdpMyJDvYd6b2X?=
 =?us-ascii?Q?Xt1+N633cafmjMci+cB0gM7jmfK+ghJVAfVXeKN0m1CBPXF6USpIZrI51AnA?=
 =?us-ascii?Q?BgQUHGlOQnrDzlHs6weVLXydRhqSXOjyZw7qQWC2NoAHsP9GdPqni6dAQQNC?=
 =?us-ascii?Q?c8tfh3rb66JCPon/FjxwrL7ZkmpriUI3NA58JvQ24ai/a0oThUkZ4Ix1tHpn?=
 =?us-ascii?Q?SMtIr4HEitDhIHjhOSqhlBVRPVzAP1z3O7ceDmKrcO7J0av7LxqpiEJvO2R6?=
 =?us-ascii?Q?NT5m+3gnyGK/E1DtD2N1xCIdbhok+Q8ySc9Eo78udeFbC8ZiwQLH4UXR5Ay7?=
 =?us-ascii?Q?T3KsjW3eQruDk4M74Oy5vF8DmpyC3AJ+q5b9ugMhRzfGM3Y2WG9RLBe6qguH?=
 =?us-ascii?Q?8nsWyiTICyvp4MaMsx7owYJ/UVOce+7PJpTIP7vddq/1aT7M6X7EnoFnqYyD?=
 =?us-ascii?Q?j0zAkAzqRSkYGkejz0ZpDcFTAIfqRZqoBjhW+1IwgxmoA7+mV68Moay4ncjf?=
 =?us-ascii?Q?mi/DrF60vxL1Df9l/O5LV6XAIvGyqzUpmC9pnSoj8wA/eol3arw531RiggZo?=
 =?us-ascii?Q?zNIVgBgqjQ1MycqFPHquzePBKaqU57uJ+5wilUdZXEG6XxWfW4VHWU2nPfGE?=
 =?us-ascii?Q?92KqgR5MZmoJIWcjmo8GI5aGdReoqnzoOF3LlE4N0jUuO26sj5qFgf7lm+1W?=
 =?us-ascii?Q?fsH8ymN0+CcoaaLBwNu6NpYrFUK+F9wXJ6oLb0SYl8nBSw7PzoMwGUayMECy?=
 =?us-ascii?Q?PCChsb2zaA5thpdXe7m73sXlhD5FPXMDn2x/TixogZRBQtSr5RapbejsdJGP?=
 =?us-ascii?Q?488Tnf1Kt55LjaRUvPXa1YwUk+D5ruz+VMiSztTNXIpua18PFqsqUfnIybBv?=
 =?us-ascii?Q?5thcXHlfxNbo2t3XlUokiUUK/ndEvUhsxCeDCv8NU6hQl4Z6CnnMfJzzzwyp?=
 =?us-ascii?Q?cxUvt3k00tUoWiy9GsWyHJv6xRUh4ct6Wsz5KNv1hE7Z5pBhp8YauLFpkKV0?=
 =?us-ascii?Q?aBLB8+Fo3I4rAhYTJcpWMOnxlDOKePLaam/2rEK8K6e7CYfM4UxX/eKbni2R?=
 =?us-ascii?Q?VnWzU+NzaFfdUskRrtLLTd3QJ/nHcyuv9pgCX7ZlEoeByR69NcGAN7hNoe7O?=
 =?us-ascii?Q?p/sETFTa7MSI4PkuqASVi4YMpEeEheJEW8LX5kN1g/TUlk6X/FTq/G/WBf5X?=
 =?us-ascii?Q?43A7rbNngD3GU94s1INUsLzX68VJkKkG+goePuMITfXN76orGJW4QDtLx4gV?=
 =?us-ascii?Q?pZwFekFLZ2+HfIAGXf/PlmU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d3e71b-ed7c-4a72-af22-08d9e9f221ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 04:27:20.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib1EhYmyzaWQRdiMVW1EVl954Dq78iUOuqeA5XTs9eaIjv7gdFyX/RnDB60J2tjVwGbV+ka0kOHU6x6qyNIxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 jhubbard@nvidia.com, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently any attempts to pin a device coherent page will fail. This is
because device coherent pages need to be managed by a device driver, and
pinning them would prevent a driver from migrating them off the device.

However this is no reason to fail pinning of these pages. These are
coherent and accessible from the CPU so can be migrated just like
pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
them first try migrating them out of ZONE_DEVICE.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---

Changes for v2:

 - Added Felix's Acked-by
 - Fixed missing check for dpage == NULL

 mm/gup.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 56d9577..5e826db 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1861,6 +1861,60 @@ struct page *get_dump_page(unsigned long addr)
 
 #ifdef CONFIG_MIGRATION
 /*
+ * Migrates a device coherent page back to normal memory. Caller should have a
+ * reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+static struct page *migrate_device_page(struct page *page,
+					unsigned int gup_flags)
+{
+	struct page *dpage;
+	struct migrate_vma args;
+	unsigned long src_pfn, dst_pfn = 0;
+
+	lock_page(page);
+	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
+	args.src = &src_pfn;
+	args.dst = &dst_pfn;
+	args.cpages = 1;
+	args.npages = 1;
+	args.vma = NULL;
+	migrate_vma_setup(&args);
+	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
+		return NULL;
+
+	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
+
+	/*
+	 * get/pin the new page now so we don't have to retry gup after
+	 * migrating. We already have a reference so this should never fail.
+	 */
+	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
+		__free_pages(dpage, 0);
+		dpage = NULL;
+	}
+
+	if (dpage) {
+		lock_page(dpage);
+		dst_pfn = migrate_pfn(page_to_pfn(dpage));
+	}
+
+	migrate_vma_pages(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		copy_highpage(dpage, page);
+	migrate_vma_finalize(&args);
+	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
+		if (gup_flags & FOLL_PIN)
+			unpin_user_page(dpage);
+		else
+			put_page(dpage);
+		dpage = NULL;
+	}
+
+	return dpage;
+}
+
+/*
  * Check whether all pages are pinnable, if so return number of pages.  If some
  * pages are not pinnable, migrate them, and unpin all pages. Return zero if
  * pages were migrated, or if some pages were not successfully isolated.
@@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_head = head;
 		/*
-		 * If we get a movable page, since we are going to be pinning
-		 * these entries, try to move them out if possible.
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * migrating page out of device memory.
 		 */
 		if (is_dev_private_or_coherent_page(head)) {
+			/*
+			 * device private pages will get faulted in during gup
+			 * so it shouldn't be possible to see one here.
+			 */
 			WARN_ON_ONCE(is_device_private_page(head));
-			ret = -EFAULT;
-			goto unpin_pages;
+			WARN_ON_ONCE(PageCompound(head));
+
+			/*
+			 * migration will fail if the page is pinned, so convert
+			 * the pin on the source page to a normal reference.
+			 */
+			if (gup_flags & FOLL_PIN) {
+				get_page(head);
+				unpin_user_page(head);
+			}
+
+			pages[i] = migrate_device_page(head, gup_flags);
+			if (!pages[i]) {
+				ret = -EBUSY;
+				break;
+			}
+			continue;
 		}
 
+		/*
+		 * If we get a movable page, since we are going to be pinning
+		 * these entries, try to move them out if possible.
+		 */
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1924,16 +2003,22 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	 * If list is empty, and no isolation errors, means that all pages are
 	 * in the correct zone.
 	 */
-	if (list_empty(&movable_page_list) && !isolation_error_count)
+	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
-unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++)
+		if (!pages[i])
+			continue;
+		else if (gup_flags & FOLL_PIN)
+			unpin_user_page(pages[i]);
+		else
 			put_page(pages[i]);
+
+	if (ret && !list_empty(&movable_page_list)) {
+		putback_movable_pages(&movable_page_list);
+		return ret;
 	}
+
 	if (!list_empty(&movable_page_list)) {
 		ret = migrate_pages(&movable_page_list, alloc_migration_target,
 				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
-- 
git-series 0.9.1
