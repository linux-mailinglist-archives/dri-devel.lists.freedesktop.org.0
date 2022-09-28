Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D099A5EDC2C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B69A10E486;
	Wed, 28 Sep 2022 12:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E1310E47E;
 Wed, 28 Sep 2022 12:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBbBu95EBoYMzuEPu9FY9LT+RefTSP3O/MFt2xXEh9AAxGWWAK5L8T6NVA47pqhzNNLImEp6Sg2lispHW6xlDvaybb/TZp1aubnwoXKNEMpy6OuJlh2UK/E/NgboTqZqZnOkVzzsT+dUiQFow+TYtuQcx9lvgCRuzgDAbsap0nin0DV2QGfD1trHsCKwDA1cVHeY9KDWsBU57KvKM/22z1EtTbkFj5TIma0vJV/yZ5hh8M7BBL2y6Yn58nzjazyVmzHR+DUkVEEcD8SmL8a6S1AAekwbTxUt2CNgkyB6alDI0HHo0qDae5augJqi1FOtPiHtMOI4hDVW1HwDvwdZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M9w+2gybViDBivC9wQrqqVE6VFlLxDz9IRiM3M2IEI=;
 b=I1032g/tMIBPolq7HvHYbvY3bQySmxUKavoTfPIaSIAdllf42KBoKjR7opJQpny397SAjYl6VsXFnHE4AIb2s7ojJGKcmYriv0yEmWjIjh4UPCxg8lMCkfYoCF6yGieDgHpTx1hKmwpvhIKWr8zhSkps2xs+qVmcVDRQJGu7BLrs4MW+mJidXi17IWp3Vnxo4jjWoF0PMDCIppfRu4bv8caD/Y7mUJPaepMIv1r4XqTcYii93wlGfWvWyinl9RcSt2oxKUYKvHkRhjdQNLyZ6lYWb4TpdA5wf7TpX5wcbPb4IVWsUNPwl9ksdkR92ZMYCKvaxMZBWYi0jt7/pT0uHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M9w+2gybViDBivC9wQrqqVE6VFlLxDz9IRiM3M2IEI=;
 b=fJ1okzx/HlJpu0lt3iUPIZdcA3GJClhwhqJ9Bx5TL50iDDjA0Q6Tee1jkAh59LYDhGmIgRLIdR80r1Rp17d1IFfi5VDbaUjTZ0vR4DkUUR4mTW4Mz4SW24bkaKKTKFcQafvqhVKpVQxL57+GMmBYsT1ZJQiQKdl1gRtulf66wgdYmAExwj89Sy+N9z/bRON1MuojBptWAWDZrZpasIOVDIyLTC/4i1uZtKEwEdx9hwyETtY1Zez9LPPF5ygRtd5aZnutkLUi9sUgxug6RM9lZ9ykwmjgoL4FmsnbIsP3jL9J9fI/djfNo88B7OeiCXRzDp5pY/TWJ4eQavpn4qeb2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:01:57 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:01:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 3/8] mm/memremap.c: Take a pgmap reference on page
 allocation
Date: Wed, 28 Sep 2022 22:01:17 +1000
Message-Id: <12d155ec727935ebfbb4d639a03ab374917ea51b.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0159.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: a149d2f4-4aba-41e1-5de7-08daa1493db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WT7JMBoco1FW6jnV3fEIznbxXtekjxUEwNMxi8JsZ4daAWQv6z+vQDx4IWcw3j2tiXqm7ULAUVHN5f9qemOaHPt3lxciIJ14tDK8pzPrEXetsScHBByUnsEulbkqVB1NC5LjgKVGApdF7sC+zQf4QD6Lpo7Iqj/etJSRnnGvjdjO45GZSZF7R2VC1YhbZHXvDUIj7qVic32M8BEzw3Ovta1oeQfKwEIqeUqsxmpVYjhm0KBr7LbolX30ddY0Flbo8VZQtEdrRH1cUsgkDpZ3IKzL6s0q6OQi3rdhik9Vw45TkHyOBjvD+REP9JQuKPXqvgNh4sQto5gCmHOFZwcxikO2FsAniMjqoummt6/+JfB6jpwCyW16b1j0a62E8tonKFTsYk0mCcbWCmK8TeGhANrlCTlRjDYTislSCrGVjP2IMxCRgYUf0STA6/yOo/r2AdXm1Fh5jdnPIB3jLNjZkHUOc9wwiAVgMAIntMMkfKTuQ2+ujti+kgB3lQyVpkJiirMhtYlMw5rTIWmjbXN1MgsQHmanamFP/R7nuuW35xTPIdP7AZgHf0tUb0NXWxTmunHvYqijmj2gq36HGkxWlha3W3TfOa5QE/YrXDK/A4FQymP7nzQHg6K79Ob4Ur1sMmC52Wq3mpr9hOKwfcbtJ26vs2zXisFfnat9Rvjjn6JOh8ymmVkHlHRaSE44qlUD9G7+0aTnxiQkwZwz/t7bdZ8BEcv6DyBIX3ghttApmvgHmrTjZJSFG9K6oOM9shjpeLvxIx6Zl6gZXa7dj9iF/gqoAt0bFMiQSwambs+U8ns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(86362001)(36756003)(2906002)(2616005)(6506007)(7416002)(6666004)(6512007)(26005)(38100700002)(83380400001)(66574015)(54906003)(316002)(186003)(966005)(8936002)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2VETnlTeUQ4RlZCK0FocGxQK29sc2VYeXVzYitzODN5VEQyZGZwdWk5TER2?=
 =?utf-8?B?MXZPTm1tVmZ4MGpsMXZTanlkZkRDNkN3amFCckR1RUw1dWE5N3ZLU1U5VUlC?=
 =?utf-8?B?cHJxcHJTMUNjclFoRi9TZVo1N0t4YmRHdTFjcXVubjMzTE9hQSs0c3N4WlA5?=
 =?utf-8?B?QzNraTE0T1kzL1hLWW9TVFBBTFlWZTBWOFM3Y0NUeWp5THU0eVB5ZkI1Vm5I?=
 =?utf-8?B?bW9mU1gyOWFQL1NqTGtEM05YVFpKSTFzMmZ3dGZMT0VqbDRFWmZLSXpvd3hj?=
 =?utf-8?B?dXg2a1FZZU1vTGRkYVkrZU1DVTVOVUYzK0F3YVQwVXFRcTNLQjI1dDU0dWhY?=
 =?utf-8?B?MUJXWTNCZG9DcVdoaFB3bkkvNEZoMWZwT1M5WEFxckpUZ1FxUUZPQzQyTmJk?=
 =?utf-8?B?OFdnQW5mM004ZjFqU013R29DUDlmbWU1Qkl3cGhIS04yNmhFa3I3SVN1Ulpv?=
 =?utf-8?B?Ylk0c1pIK0dLdmYzd2VJYVo3Nkd6WEVvV0NxMktObzc2N2wrWmY4aFNEOXF2?=
 =?utf-8?B?MVBBYUUxNktyWmxjak8zejVZWUpvMFlQYXpGeXpSdVNxejhPL3pzeTlUR29h?=
 =?utf-8?B?cHV5Qkl2YnJjRnhEQlNIQUR4MWpMVWd5Y3J1UzJ5OWtPVFBoM3pSemdoS2pH?=
 =?utf-8?B?RHNmekRVbGtvNDMzamZDU2w0dXA5UE9tTUhaYzI0ZnVsRU94eHgxaTAxS3Ri?=
 =?utf-8?B?MlFPRmZidUxUTERYdHBQOHVrRnQ0R0gyNWVZMFVMbTE1Y2xVU0ZqaTdQd0ZZ?=
 =?utf-8?B?dWhMZWpzUHViUWdEcWtuUE9ObndPdHlyQy9XbWJyTlh3dG1BakRVTnhRbXdp?=
 =?utf-8?B?KzZOWXd3N01waWEvNkpXbWhXeERadHcxTTJoNHNsSlBuL1VDeVY4d0plY3J5?=
 =?utf-8?B?OFlIS2ZacWtaVEVCM0hkUlJZMFZHL3NIcWZXejZpZmxjbjljWVRHMjY0d0l5?=
 =?utf-8?B?TzJ3WWtCM2xKZjZ2S2d2bDkvMWlXV0hKSXBrLzdnNW1FNUtLOE0raGM2TXkr?=
 =?utf-8?B?cW5IbVZpelRwWDNZc21UY0pqOEJjWklWM0dyaWowWTluK2Jzd1ZaQjN2WHcr?=
 =?utf-8?B?N1NPZTdBR3lKeGJ4UnhiY3E3SUpreStJaHc0cVRqanpWSm9Kajlzb2Fndlp4?=
 =?utf-8?B?QlhpL0dUOHZ5VFFTYjlLb2xGY0VNU3pRQjVWYWlNNWd4VTFNTFFISG5oalp6?=
 =?utf-8?B?RWFKMVRUb2VMQVBsMlgxNTFaNlhEZGtlZ2NKRG5BWUZCWm9MaHR0NzJyOGtp?=
 =?utf-8?B?cS9LQ1BRaGtQZkFDT2k1MDZoT09xUnlpeVR3QTU0NkUvVW1PMTdMS3ViQ1Z2?=
 =?utf-8?B?am1GVEMyVWJQMUVsdGtDZlBrTDZLUk05OTNnL3dKSFJwcFVxbDVuSDhRMEE4?=
 =?utf-8?B?YldZRitQbHlMd1BVTmNTNHhPY1BNOExlSE0yTElCYnNrbEpnVkR3L3JwL2xO?=
 =?utf-8?B?TEZwTjJMMVl2NE1SQVM0RU5TSk9YQUJFM0hQVEhpWjgzNFZHTzVJL2lha1Vy?=
 =?utf-8?B?b1Fvc2hTV1g4TkFYUlZycEpVRE5pMkh1V0paS2NqaWxSSE1SVy9QQ3d3Q2dK?=
 =?utf-8?B?UUI4TkRYZWkwVnRmT1duL3RsZVRjVENxb2YvNzlIQ0pqbDh1andYU2F6Tld0?=
 =?utf-8?B?cnptN1JtYVVydFpkSmI2dUpBVmRSN2JNejZ2OHlNVS9pdE5KMXIwUnVFWTk3?=
 =?utf-8?B?MGpBVFVCY3JUcFl6eHBCR0dmdGZLeHo3d1BkTWtvdCs0akdqc1NGQS9DL09D?=
 =?utf-8?B?RzhOakhkQitzaDhZZUM3TWxiZTkvUThqa0NWenNmZmNxckI2RVorMENhMnFX?=
 =?utf-8?B?MU9rR201OEoycFM2L3BYV2ZpcUtSejVBbEUzMmlkKzMzMDlhYVlyak1Ia0pN?=
 =?utf-8?B?WHdBWWpjOEJpaXN0OEgwUURXSGZGYlpkVDRnclp1azRoUmxTa0dGTHdZR0Jh?=
 =?utf-8?B?V0JFRVl2Y1p6cG5LNVh4RGovWXovdnhSRjZlQWhZUVJHUGQ3YkNjTnpxN0Y2?=
 =?utf-8?B?dFcwTmFUaGNNVVYwcE9YdTlRZTl2WTkrSURUMzhBSFBzbmw4bnIxejBueVZX?=
 =?utf-8?B?VkVCLys3WldaeXhqQ0NVZjg1Y1FyNStDYmhSWGU3ZUlqZUVHT0k1QVowaE12?=
 =?utf-8?Q?EnSzZNn/Jl59TnpsJNAtNJT1s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a149d2f4-4aba-41e1-5de7-08daa1493db8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:01:57.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jfxEc+grLbYoGv6DbvjxYDS32krdCslvxMazBUu5vyBCy6lTWOQtO6ODT7VKC2psqmf2R7Dq5IJSLFtV7MDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZONE_DEVICE pages have a struct dev_pagemap which is allocated by a
driver. When the struct page is first allocated by the kernel in
memremap_pages() a reference is taken on the associated pagemap to
ensure it is not freed prior to the pages being freed.

Prior to 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
refcount") pages were considered free and returned to the driver when
the reference count dropped to one. However the pagemap reference was
not dropped until the page reference count hit zero. This would occur as
part of the final put_page() in memunmap_pages() which would wait for
all pages to be freed prior to returning.

When the extra refcount was removed the pagemap reference was no longer
being dropped in put_page(). Instead memunmap_pages() was changed to
explicitly drop the pagemap references. This means that memunmap_pages()
can complete even though pages are still mapped by the kernel which can
lead to kernel crashes, particularly if a driver frees the pagemap.

To fix this drivers should take a pagemap reference when allocating the
page. This reference can then be returned when the page is freed.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page refcount")
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>

---

Again I expect this will conflict with Dan's series. This implements the
first suggestion from Jason at
https://lore.kernel.org/linux-mm/YzLy5jJOF0jdlrJK@nvidia.com/ so
whatever we end up doing for DAX we should do the same here.
---
 mm/memremap.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 1c2c038..421bec3 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -138,8 +138,11 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 	int i;
 
 	percpu_ref_kill(&pgmap->ref);
-	for (i = 0; i < pgmap->nr_range; i++)
-		percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
+	    pgmap->type != MEMORY_DEVICE_COHERENT)
+		for (i = 0; i < pgmap->nr_range; i++)
+			percpu_ref_put_many(&pgmap->ref, pfn_len(pgmap, i));
+
 	wait_for_completion(&pgmap->done);
 
 	for (i = 0; i < pgmap->nr_range; i++)
@@ -264,7 +267,9 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	memmap_init_zone_device(&NODE_DATA(nid)->node_zones[ZONE_DEVICE],
 				PHYS_PFN(range->start),
 				PHYS_PFN(range_len(range)), pgmap);
-	percpu_ref_get_many(&pgmap->ref, pfn_len(pgmap, range_id));
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
+	    pgmap->type != MEMORY_DEVICE_COHERENT)
+		percpu_ref_get_many(&pgmap->ref, pfn_len(pgmap, range_id));
 	return 0;
 
 err_add_memory:
@@ -502,16 +507,24 @@ void free_zone_device_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 
-	/*
-	 * Reset the page count to 1 to prepare for handing out the page again.
-	 */
 	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
 	    page->pgmap->type != MEMORY_DEVICE_COHERENT)
+		/*
+		 * Reset the page count to 1 to prepare for handing out the page
+		 * again.
+		 */
 		set_page_count(page, 1);
+	else
+		put_dev_pagemap(page->pgmap);
 }
 
 void zone_device_page_init(struct page *page)
 {
+	/*
+	 * Drivers shouldn't be allocating pages after calling
+	 * memunmap_pages().
+	 */
+	WARN_ON_ONCE(!percpu_ref_tryget_live(&page->pgmap->ref));
 	set_page_count(page, 1);
 	lock_page(page);
 }
-- 
git-series 0.9.1
