Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE00357597E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 04:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5FC10E1D1;
	Fri, 15 Jul 2022 02:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F0110E1D1;
 Fri, 15 Jul 2022 02:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALOWZ6E9MZecGGTl6DkVfNENGX8aLQ0FsrvTvs2zOgmVgCh2/fwtt9xMzw6X/tugb+zcfN5UslgOnXMW0PnEh5/R4h8VK4Ls2xw2qU8kLdqTxPclW3Hp34Ie2xXOR/vgmfkNmRbQDZhp61lm89kjjsKN37cC/dttA3QsZoPjKtD/Rh9SlWRxYH/PllV9LGTSJgZ8eplLjiUjhvsEg7IWspm4sziooS1NrJsNp/oPjx1rs4MzvE52Hn8MCvXSEYeBnkX2L5YAZgYmlL7ZxgBT2psuicRNbGyv9XlqBSQOA0wue8d6bPLoUZW/TLO+KQ1LZeRjUHtf11IKFUC0LFxUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHVDkFGU/1iCEavcNoOsyIBjDg/tjdhLr3cQyUbdW9g=;
 b=mlQy+8FxkyPMwDT8L0o8MFqat5+juX2yT79hJnz/dy3AEv4JvpnhDKO4wUhcgUy5ioHt+fa7VemK44A+LLYoGW3XvBwHsi2JfBquxz8X9XzCg6m7gSqmIUoctnlNdAvXcV0a2rW3VAir4JiZO+cQdH2XGYgNyvYR8PiINdGifyWXt4z8RGYvoVIHSVcvsJVzrFhReqX0udcwRDiJWsKMTKixjOSKmG9RL1/YOfisuurrm047AJiYsZPjjKszFlZzShoPnGLIFzkXlA1SgzNICqhf3mmksiHspcc+cow3geXZPeRE/ULzXKeDX+IZWrae8nUPQ/Rxlb0eSFUYOXgYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHVDkFGU/1iCEavcNoOsyIBjDg/tjdhLr3cQyUbdW9g=;
 b=mWTfC1JQlSDtZnVaLc/SjdxqP0IItHA+NR3G4OjY3MG2f2543Tdgpc7DSzqLWSrC4kdlupmXsDYDIOYaJuVsQALG6tSfws362QsCBTHtfzM4FXqwHMglukUMp8juIeF8/uSICEkXvaKZkgc8ySL/7m4OdNPcaTMPgUg7hVZUaFWOw5whS/BNHjz5BvtPPceFJd9bUPCvNFJVidfsMkR+TWQ/iTL9AufnNPdqzvUSumAihjDRTU49Jk5BXUj5Lnhvp5/IC7eq482/tW4eAKhnC+CeEKtH0/NVuo7+oKo2OuZwY1AJgehKPLZJsXE61MET6bjv9VXkYFn3o9Ncp0OqSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Fri, 15 Jul
 2022 02:11:19 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5417.020; Fri, 15 Jul 2022
 02:11:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: [PATCH] mm/gup: migrate device coherent pages when pinning instead of
 failing
Date: Fri, 15 Jul 2022 12:11:09 +1000
Message-Id: <20220715021109.2225886-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <4b2f9a61-ca67-6a34-41c9-c191cac756b3@redhat.com>
References: <4b2f9a61-ca67-6a34-41c9-c191cac756b3@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 502c5fc0-8641-4698-9ed3-08da66074e5e
X-MS-TrafficTypeDiagnostic: SN7PR12MB6713:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swSXb2xi6beWEb1/7R071vtcQ75Sqp8C98IFL1fIJi1oadZjpPE+jbA2SBYK3xPhtiKAWnOSOthPpuO2MwdtgApN5wAfP5OWERUGFmYu9vl9BOTjWT1AFms9dOAaETnIvbgXNkKmT0Ee5GfmU2LxUziBHdmFWT9rORXQZ1on5L/NrucO/wLy7jB0EkxEbfZ0feZyJiPyExrnlwQYRGfgCt0qw/heHHHUEUtDLbO02SPaKuGxeSzvmtZMyabW+PqVYNT4Y7KA1Cfq9z/aSr/csuWqStrZeuE5tdy8/OPG+2TtqobJsQXTsFO4VzI7t56SFRdtvo7VM2Ye31oWu/fJjWn7D+SimwGMAz+v8m5h+AFrXej0esxHtQzdailEJU3/dMNzwHONNXaOo1i4W7qXGPHUUJkej0M79AoGaBQBhaAE72w67GhI58WelDYhpV8SfgkzjMXFGjexfUAKX3Xh69qw/LqtJXenyB6ePrOp/jWQdnG9xKIVAG21dmfpvTl44C4Tuo3ObINJI8luYaZSwDwYa7IuqXJ9iyk+41+A9qgGCJm8q+JpeFSX6re7HkpjsArEc9ZCyFlmfuBArdD7Q+fvDP8csKKh0YjvPeWeAb5loIuWA0Ppz6CjWa2gh/rWgNU+BQY4ToT3OZO1M7G00uMA46ZhDCAe9HVJN66EnU5LRrz2o7f+L3u5LO2md27kWx3ViTrgWiwz/1DTY1F+kzFRAgFEg6PJyHQMlwYq3fZF0omjTuNePiXTjGUS/D26
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(2616005)(186003)(86362001)(478600001)(1076003)(107886003)(41300700001)(6486002)(6506007)(26005)(6666004)(7416002)(2906002)(8936002)(6512007)(36756003)(38100700002)(5660300002)(6916009)(54906003)(316002)(83380400001)(66556008)(4326008)(66476007)(8676002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBhQqZsOOjiTrewLReeC6gLXWIdLbuLaqimZoyZLJd+HsSaFoRkSV3p7SvRP?=
 =?us-ascii?Q?cd0NkeTmPdUZsryp9AqUt1589jstVylek7bDwq3l7KM/IV3je3iQkqdIPtik?=
 =?us-ascii?Q?HkJbgSHc5R/bAbLI5IEW37vGhp27RwxbDQu1L/DUb3HgUtg/bFzJuDa6TIQh?=
 =?us-ascii?Q?tvxWY6YOvtIksprpc+Usnk9iC04U3Bq7PwOeSloXinh203rOwUR0EerZ/cKx?=
 =?us-ascii?Q?We2QECXybZmEtR5xAt72wUcNW+gVGn6WGlLsBLDydlYcF4LRCR52k25ORPfu?=
 =?us-ascii?Q?JNslK7PsTXI4VbbHgYwHEky3I4MaPRAcNkxpkaNdJSFAjh563rOL7ZvSo8Ft?=
 =?us-ascii?Q?tyZYKE9Kewq1Ge+9cK62DLQHz+wRyPIJ72/ZMTJ0n6P2DqCSM9Q/HUgAZb0S?=
 =?us-ascii?Q?ehmS9CigD/ZX8zztX8W2/gJsjQ+woMPJG1yr2UPQ1ARU9G7HurE+M7EMaYUO?=
 =?us-ascii?Q?pCSrhPz3XK6bTf7krPhozgoLU/CJQcRcxHyuUl3INguX7I9cnCxhS9++V5Ne?=
 =?us-ascii?Q?fVQ9GB1/II/ZSZz52yNlU6Ap3EMThQZpl6a8W6Rhl1KQe3dusVsCpxkqtyTh?=
 =?us-ascii?Q?WC5oCUeFlk4F1A4pt/E8qT0Rqsep4EffZbYOjKLhMYj7DIPrwwdJ+3LU+iMq?=
 =?us-ascii?Q?PwvxRngR0M0K/VrpQym8/ik5jhwxpQXqFS9egXPTCIQSY/UMCI7Km2DAsOD9?=
 =?us-ascii?Q?PTAraTb6J2ZRYCAln0xnq5zFJcs71zNPHtcT1J4u77wsMyDs8p7IZcOZQDT7?=
 =?us-ascii?Q?DhSvYMsQ5xnWbvpdx1erhv4TBshfA9OmZYD6njbY7xC12AqGL/jZ4TvRAMct?=
 =?us-ascii?Q?S2XO9012sqT/fe0LCCbnqThIuFpZLP/krTvJEFCFYP1uL8CiCWY/YK/KECVB?=
 =?us-ascii?Q?gCu5nt1A8neW8icGqw72NF64BUMBU8xdvodPW9+kYgP2SqymrwdgQWH6+6ud?=
 =?us-ascii?Q?+jdHdtoadZRDFQTgZW/R0P6CCjVeMlYvVOseWbqTcDu8eoBgFwOPo2k8LCuC?=
 =?us-ascii?Q?zH7O1v6/o3xcV5vA88gZDRCmPgNkSzPzlk2juxDBGzwRzGQGQft7Vftgx/iD?=
 =?us-ascii?Q?v+2XxPVKXfYJYRn2kOY1f6f7bgRQ98aq+rKoZ5JDMzFADsi7LbhbpFDSk/Df?=
 =?us-ascii?Q?AJNc5hYWZpy9LrymjsXjVDYySEp0/O2RG4t9dV7cIwe2AZusxBlwRSDqTu6P?=
 =?us-ascii?Q?xl36tHFF8zZvQ3FULOcA55QWiE5ZvNTHbzVtzj3cp+GXw6gqQQDWB4lOSwdg?=
 =?us-ascii?Q?DTMpRy6UZcITLexgrhhvwGcfJM2iCp9wEa2JkEXimUBFJoO/84WYbM7wdZwp?=
 =?us-ascii?Q?GfoWWP5Jd75Ef4tB4PewA/Ap6qsn1Zb/9FCj9SsH40C7natpHEnNqxToOgfu?=
 =?us-ascii?Q?56Z/aEMbi5W9ABwLHc+r0LxOd8rInjUUH4aF3llLobvpd5gursYBK0t7nwfA?=
 =?us-ascii?Q?Ws448UwSUEhgibhI3KOjwPhzVc1Q/reNQhETBLLhYsJb2McvCJqjErV8aOMJ?=
 =?us-ascii?Q?cDmaCo/N7E4us9tV5/q4Q+DxsZW0xgt+yHge3AcLrUdAR6GYEII/Za91l3NR?=
 =?us-ascii?Q?pin0/ui7/SAH3sZA4JJdU5jK7SWUuqNmy5vkgnuH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502c5fc0-8641-4698-9ed3-08da66074e5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 02:11:19.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0NQT8/Qj7uT4XEhklgm2elFJ9pE05n0Dxfx2qiwXmbHvUxHdexZ5jEIIS6ue5EOQX1hW84B7nvpb8x9bp5KaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
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
Cc: rcampbell@nvidia.com, dri-devel@lists.freedesktop.org,
 Felix.Kuehling@amd.com, Alistair Popple <apopple@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently any attempts to pin a device coherent page will fail. This is
because device coherent pages need to be managed by a device driver, and
pinning them would prevent a driver from migrating them off the device.

However this is no reason to fail pinning of these pages. These are
coherent and accessible from the CPU so can be migrated just like
pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
them first try migrating them out of ZONE_DEVICE.

[hch: rebased to the split device memory checks,
      moved migrate_device_page to migrate_device.c]

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---

This patch hopefully addresses all of David's comments. It replaces both my "mm:
remove the vma check in migrate_vma_setup()" and "mm/gup: migrate device
coherent pages when pinning instead of failing" patches. I'm not sure what the
best way of including this is, perhaps Alex can respin the series with this
patch instead?

 - Alistair

 mm/gup.c            | 50 +++++++++++++++++++++++++++++++++++++------
 mm/internal.h       |  1 +
 mm/migrate_device.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b65fe8bf5af4..22b97ab61cd9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1881,7 +1881,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	unsigned long isolation_error_count = 0, i;
 	struct folio *prev_folio = NULL;
 	LIST_HEAD(movable_page_list);
-	bool drain_allow = true;
+	bool drain_allow = true, coherent_pages = false;
 	int ret = 0;
 
 	for (i = 0; i < nr_pages; i++) {
@@ -1891,9 +1891,38 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_longterm_pinnable(folio))
+		/*
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * to migrate the page out of device memory.
+		 */
+		if (folio_is_device_coherent(folio)) {
+			/*
+			 * We always want a new GUP lookup with device coherent
+			 * pages.
+			 */
+			pages[i] = 0;
+			coherent_pages = true;
+
+			/*
+			 * Migration will fail if the page is pinned, so convert
+			 * the pin on the source page to a normal reference.
+			 */
+			if (gup_flags & FOLL_PIN) {
+				get_page(&folio->page);
+				unpin_user_page(&folio->page);
+			}
+
+			ret = migrate_device_coherent_page(&folio->page);
+			if (ret)
+				goto unpin_pages;
+
 			continue;
+		}
 
+		if (folio_is_longterm_pinnable(folio))
+			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
 		 */
@@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 				    folio_nr_pages(folio));
 	}
 
-	if (!list_empty(&movable_page_list) || isolation_error_count)
+	if (!list_empty(&movable_page_list) || isolation_error_count
+		|| coherent_pages)
 		goto unpin_pages;
 
 	/*
@@ -1929,10 +1959,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	return nr_pages;
 
 unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
+	/*
+	 * pages[i] might be NULL if any device coherent pages were found.
+	 */
+	for (i = 0; i < nr_pages; i++) {
+		if (!pages[i])
+			continue;
+
+		if (gup_flags & FOLL_PIN)
+			unpin_user_page(pages[i]);
+		else
 			put_page(pages[i]);
 	}
 
diff --git a/mm/internal.h b/mm/internal.h
index c0f8fbe0445b..899dab512c5a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -853,6 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+int migrate_device_coherent_page(struct page *page);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 18bc6483f63a..7feeb447e3b9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -686,6 +686,12 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		}
 
 		if (!page) {
+			/*
+			 * The only time there is no vma is when called from
+			 * migrate_device_coherent_page(). However this isn't
+			 * called if the page could not be unmapped.
+			 */
+			VM_BUG_ON(!migrate->vma);
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
@@ -794,3 +800,49 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 	}
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
+
+/*
+ * Migrate a device coherent page back to normal memory. The caller should have
+ * a reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+int migrate_device_coherent_page(struct page *page)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma args;
+	struct page *dpage;
+
+	WARN_ON_ONCE(PageCompound(page));
+
+	lock_page(page);
+	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
+	args.src = &src_pfn;
+	args.dst = &dst_pfn;
+	args.cpages = 1;
+	args.npages = 1;
+	args.vma = NULL;
+
+	/*
+	 * We don't have a VMA and don't need to walk the page tables to find
+	 * the source page. So call migrate_vma_unmap() directly to unmap the
+	 * page as migrate_vma_setup() will fail if args.vma == NULL.
+	 */
+	migrate_vma_unmap(&args);
+	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
+		return -EBUSY;
+
+	dpage = alloc_page(GFP_USER | __GFP_NOWARN);
+	if (dpage) {
+		lock_page(dpage);
+		dst_pfn = migrate_pfn(page_to_pfn(dpage));
+	}
+
+	migrate_vma_pages(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		copy_highpage(dpage, page);
+	migrate_vma_finalize(&args);
+
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		return 0;
+	return -EBUSY;
+}
-- 
2.35.1

