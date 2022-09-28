Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F95EDC41
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6B610E4AE;
	Wed, 28 Sep 2022 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D9310E4BC;
 Wed, 28 Sep 2022 12:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ6S5e9J+i3jZoQy4RXoB8Nw7OQf2skPrq2mNm4btBuoUhWhwxV89SGZxCQ73GMQ7CJqeJS8lIVaIwZO4HUdAkcTqNe3oNebfZghIzzHMt3/+Ut5QukxBUOQyJq0vYGPTdMzu+edA1aAjCLaM9XshbmQqC6vTxDXbxsCE0khgfOGC2IxlLYwLFpEdED2T+Fkhz+5Gt2ncrw9i1+6+SxtSBOzCjige2xdYUshdSMzyTplpcRABqmGcpx3r1ugBhtMPb3NVU5yxGd8qtQC4nHDT4hLqK3tjc51RnBqBhZgMuAfgzBEpplUjH6ROnjQpc3bAAt0hV5/qJscfYUvLihaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRhRQafIcKra+fUPgEOB67JM02ZDkkxp+B6p8U4ee3Y=;
 b=m/2bwa99LeXlmQgo/2TKnRrwfIitvAat83ock/h/KZqE1SKijrcB/Eal6q4p8h4m7rOXw6lA3Va/eDL3/74VwjqZg79KBypNlKI2LOKLOw7DYDdTsNeBdO9CRA1hjFhPlmbDtBxIg164RVOjFj+31cSIvQP5jAqM7fP2Rt9ome0IZ/z66plFbFR/u/P9zHLdP8nPjyPsTSI+0gAQl/9WL9NY/WJhYzRX4fnvmN0sRKpUPmZ5bVpNVmh4MMjPmAy6JS4xOkJKSO0uiNBqSchNCHffdDpYFSNfLp7/ldSFH5NJcDArbRhWGp4OeCo92kUYy/AgfRUcyLdwMGy+Bj7qtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRhRQafIcKra+fUPgEOB67JM02ZDkkxp+B6p8U4ee3Y=;
 b=BihgRa5GoQT00am0ZUBK3GuEv7X8rChjYUn1xm+Rlg+PYGpNc6G9iioXqmplvx5LCQJqKl6clboaOhqfP0xrn6Epz8f80PLacA1f3AEm8wVXqUaSBe21z9RMds52XDD6ptOv2d09ffmmGSeZekxDyignvUQLtz+EooiCu8sINPymr/Er7yrkKNCqjPbY1lNyeolwnqpldDU56jLjr97d19ENTACwmHktIH2tRLiOV0QR/QFCqgVGNuUCTU33ZiiaY5iTLopVjrmardmdbjHfVXEA0cCV8+jrEH/gCq3h+B98dpMwEkPGDi+9OztUMgqgFsGw4AMlBnCUrDTU9aP73A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:02:31 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:02:31 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 8/8] hmm-tests: Add test for migrate_device_range()
Date: Wed, 28 Sep 2022 22:01:22 +1000
Message-Id: <a73cf109de0224cfd118d22be58ddebac3ae2897.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0146.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::7) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 2176ab3b-85b1-4509-a7b1-08daa14951ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gf9hHGrXIXjLPkDXQWGoEow++8JQh1DarCwXDGV/EUOS4k+fvvEDBI0/SsLn/8WRwMHZZfbatPmU/fM8+dWe68+g/zRep8jxPwBmWcZHTnmZlpSc/aavRWRta/8DfCU90gYQ+84sGcN9jWsKQGH/HNiPcbXTw4zH3VcLiQZj7vkAYdK46Upz11QB8IBSAe/1v9YRKTe4ph9s+cNtmgCIpYVVaoVhPQ++DB4s2Pz2QU9J8dopHoGMQYm3Obt4ogMINM+AGMa3tG9vc7YHIzZb2+ZNj7qR8GVSwIGU/JLmqJb4xnZJdINkwwX6Va2hONaTtKBZPcjPZQIqRfphyNHcsRrQdcrxqaQ9FaG3gVk5iCVGVaJOKatWlUfQKdcWgeenVu95Vut8PzedFsc4to/M3z1B0w//cmDoKtlKBk0UnGSUoV+1l3arg2HHocZ/OfXgZzVOu2wHSTyTHvJSFmEFCoMhXsT/SVee9/o+AbFv+LkYbbWK05Vzod9FBobJad06CKvAgHPVWto0NIrtxmG+W7ZppJEx5HYcT/RCeLNG6HkLGPs6ZB2z9fr2tY4K6+nFuB0sSFOe7v2KAhBWlLRdfnWCMvL7dzWJxTNbvLdTHqKtPSgOfE7ZmEaiTycyK3rJ4bpTw/tnuIfVa09k3sUTpQ5maEjkjJuaXf+OvxT/RFSsz5LPKgOzFLih+e7y/ZgJ15zPm9r+m4kJTD27VIMXlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(8936002)(478600001)(316002)(5660300002)(83380400001)(36756003)(6506007)(6666004)(41300700001)(54906003)(6486002)(2906002)(66946007)(186003)(66556008)(2616005)(66476007)(4326008)(8676002)(26005)(86362001)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2gRZ9HT8PsPayD20j9AeSiDsh7IYJOYoKxt8cVniEcoXXkSBYuX8Il/I2i2Z?=
 =?us-ascii?Q?BxxsQKLbe13fMX7YWdBKKfdobN4o+GqWEklBF43I9S0k8HkXj52/KXp+0N8e?=
 =?us-ascii?Q?4vjKJZ8n2O5O6CGrHYfkK3etAl9T0JF08x+wBkdKhazoZeBYtQm087v50OsO?=
 =?us-ascii?Q?cN7kOwEgXD3YIIYgOQvFNUASPIYZ03+G9N83lWJCQY5yIhcyxQkvJ8ftBGsY?=
 =?us-ascii?Q?zYE9wYrPEdBKTbTaOMhneMcbvlE2RZGMfm20q+ZJEHRv7BPMtEb5hEyLpv7l?=
 =?us-ascii?Q?gj0cfXpuwzYrRwnT97DCfAQfbbDxxp+P++sqA6JjQ4IZuTTgFisZsv7fY17k?=
 =?us-ascii?Q?KqX/jfcIyVL+O+Cwv4TFf/ThdJkawQ8Jvy+oHPUB8Tc2AozUELK5M45mQC/B?=
 =?us-ascii?Q?VueYZFkFYlnnrIVx0Km2Uhoxm8k9Cr7GIPHCpGf2aE0kSsLbCz+qkCaEbzjV?=
 =?us-ascii?Q?gmk08L61vcCwBC9Kdusxqmh+k8rgpkoKjJwhrAkYRBF0Mx7vuHQis8rgB9ZA?=
 =?us-ascii?Q?FoZ1b97UlEL7NmzIT5uYgBCPEfm0K01w2sodlifSARQ+JkTmKC4J61t0l9g5?=
 =?us-ascii?Q?X0J7fX2LzfbRytBu9nZMgG8fZSiwTYLO0FEyGi+VuG8aRRiPE8l98UkztfJ4?=
 =?us-ascii?Q?iPGb7o9dRiaVk7KvsJef0RJKB7Np+nGDE4wB1ljPZuIJF+9qx0hOANCx3Vca?=
 =?us-ascii?Q?2VBJ8Eyi8cZw0DRWlX2V+UAJwSbiUmG7rO7is9oXPd0ibgUjFP75FB6Wcnos?=
 =?us-ascii?Q?2yjJOuHfgzCh3OSX2hdrMxWDKeKq/bjYriSafMOwdX16QI9+RNUAC+u64M2q?=
 =?us-ascii?Q?JewfuJn9AdUZmmj45JM2f0Y3JBexlrrG3XXSogy2XgD85c+jOf/yIxPXwJ+T?=
 =?us-ascii?Q?R5SWU2hduE5PyhXTC9BbNTbYZ1AThtBs2hxhDBH+pA1pXb5aZcGkgMZpNrU3?=
 =?us-ascii?Q?3kZ0Vg5hKlimfsvFzhk039b1YTRV3UvFu6PbwaysSua8Y3S2smEONIQDh49i?=
 =?us-ascii?Q?HpcktBHPatq0wWLTqsn0AEq5coEDTDpP+QPQFhU5xO+zii/rlboD5F8n+YY9?=
 =?us-ascii?Q?p4WDtFqYxqf9nxcxkqSleIobuEjX98CkrlfAekIJ1JkvjI7myDVy+8seYNMQ?=
 =?us-ascii?Q?f4gJ343QwiXgKqZgsl2I6fyChwI1niGveHYqVsM0dIHqCViT+cyoZkTJcdxL?=
 =?us-ascii?Q?Ug8GfNHYoHiMqq+fEv2FrsLjtOKfrI1b0H3DisVVpaKQgAwuo5bJ577uwsip?=
 =?us-ascii?Q?KS5KRao4Ezne8zQWY/FBMyjUjgOrDqnNcjKdr/lqe3/FNaKVmCx4kH7D8New?=
 =?us-ascii?Q?LV0Cy8uQ00O4ZIewceNZafrs/ejGJbpUvSMCmtQUHDJSiGqGR8FB6xDDMvNb?=
 =?us-ascii?Q?YJdsN8YM7jPvNCNKSTE43lac861sv7IuyV01y6cc49RA85v8h1s7KqYgdWJR?=
 =?us-ascii?Q?jbY+iFgJu/aaq1rVT+x4aIL8qhvq6Z1F0C1wKVOwa+fPZEsvK6C9jvWUVEG3?=
 =?us-ascii?Q?OeTo0e68XzJmaAy51IzZL4x/25xIPkFiqM+VN3m0vjm0/wyGn0XEr9/Y/psV?=
 =?us-ascii?Q?yf3IVmQqPOZZYkEEWZgUpQfuzwsyQ5aODQanxEVA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176ab3b-85b1-4509-a7b1-08daa14951ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:02:30.8997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vDKmaLc7wdzRcq8tXEnNuCbsgg3HIpqjh4Uw8EW98KDjBno2PXjjDeTTK0146Y0bo4k4ZBCzjTwmKEKKDLp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
---
 lib/test_hmm.c                         | 120 +++++++++++++++++++++-----
 lib/test_hmm_uapi.h                    |   1 +-
 tools/testing/selftests/vm/hmm-tests.c |  49 +++++++++++-
 3 files changed, 149 insertions(+), 21 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 688c15d..6c2fc85 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -100,6 +100,7 @@ struct dmirror {
 struct dmirror_chunk {
 	struct dev_pagemap	pagemap;
 	struct dmirror_device	*mdevice;
+	bool remove;
 };
 
 /*
@@ -192,11 +193,15 @@ static int dmirror_fops_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static struct dmirror_chunk *dmirror_page_to_chunk(struct page *page)
+{
+	return container_of(page->pgmap, struct dmirror_chunk, pagemap);
+}
+
 static struct dmirror_device *dmirror_page_to_device(struct page *page)
 
 {
-	return container_of(page->pgmap, struct dmirror_chunk,
-			    pagemap)->mdevice;
+	return dmirror_page_to_chunk(page)->mdevice;
 }
 
 static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
@@ -1218,6 +1223,85 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	return ret;
 }
 
+static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
+{
+	unsigned long start_pfn = chunk->pagemap.range.start >> PAGE_SHIFT;
+	unsigned long end_pfn = chunk->pagemap.range.end >> PAGE_SHIFT;
+	unsigned long npages = end_pfn - start_pfn + 1;
+	unsigned long i;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
+
+	migrate_device_range(src_pfns, start_pfn, npages);
+	for (i = 0; i < npages; i++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(src_pfns[i]);
+		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		if (WARN_ON(!is_device_private_page(spage) &&
+			    !is_device_coherent_page(spage)))
+			continue;
+		spage = BACKING_PAGE(spage);
+		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		lock_page(dpage);
+		copy_highpage(dpage, spage);
+		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		if (src_pfns[i] & MIGRATE_PFN_WRITE)
+			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+	}
+	migrate_device_pages(src_pfns, dst_pfns, npages);
+	migrate_device_finalize(src_pfns, dst_pfns, npages);
+	kfree(src_pfns);
+	kfree(dst_pfns);
+}
+
+/* Removes free pages from the free list so they can't be re-allocated */
+static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
+{
+	struct dmirror_device *mdevice = devmem->mdevice;
+	struct page *page;
+
+	for (page = mdevice->free_pages; page; page = page->zone_device_data)
+		if (dmirror_page_to_chunk(page) == devmem)
+			mdevice->free_pages = page->zone_device_data;
+}
+
+static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
+{
+	unsigned int i;
+
+	mutex_lock(&mdevice->devmem_lock);
+	if (mdevice->devmem_chunks) {
+		for (i = 0; i < mdevice->devmem_count; i++) {
+			struct dmirror_chunk *devmem =
+				mdevice->devmem_chunks[i];
+
+			spin_lock(&mdevice->lock);
+			devmem->remove = true;
+			dmirror_remove_free_pages(devmem);
+			spin_unlock(&mdevice->lock);
+
+			dmirror_device_evict_chunk(devmem);
+			memunmap_pages(&devmem->pagemap);
+			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
+				release_mem_region(devmem->pagemap.range.start,
+						   range_len(&devmem->pagemap.range));
+			kfree(devmem);
+		}
+		mdevice->devmem_count = 0;
+		mdevice->devmem_capacity = 0;
+		mdevice->free_pages = NULL;
+		kfree(mdevice->devmem_chunks);
+		mdevice->devmem_chunks = NULL;
+	}
+	mutex_unlock(&mdevice->devmem_lock);
+}
+
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -1272,6 +1356,11 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_RELEASE:
+		dmirror_device_remove_chunks(dmirror->mdevice);
+		ret = 0;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1326,9 +1415,13 @@ static void dmirror_devmem_free(struct page *page)
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
-	mdevice->cfree++;
-	page->zone_device_data = mdevice->free_pages;
-	mdevice->free_pages = page;
+
+	/* Return page to our allocator if not freeing the chunk */
+	if (!dmirror_page_to_chunk(page)->remove) {
+		mdevice->cfree++;
+		page->zone_device_data = mdevice->free_pages;
+		mdevice->free_pages = page;
+	}
 	spin_unlock(&mdevice->lock);
 }
 
@@ -1401,22 +1494,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
 {
-	unsigned int i;
-
-	if (mdevice->devmem_chunks) {
-		for (i = 0; i < mdevice->devmem_count; i++) {
-			struct dmirror_chunk *devmem =
-				mdevice->devmem_chunks[i];
-
-			memunmap_pages(&devmem->pagemap);
-			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
-			kfree(devmem);
-		}
-		kfree(mdevice->devmem_chunks);
-	}
-
+	dmirror_device_remove_chunks(mdevice);
 	cdev_del(&mdevice->cdevice);
 }
 
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index e31d58c..8c818a2 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -36,6 +36,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index f2c2c97..28232ad 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1054,6 +1054,55 @@ TEST_F(hmm, migrate_fault)
 	hmm_buffer_free(buffer);
 }
 
+TEST_F(hmm, migrate_release)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Release device memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_RELEASE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Migrate anonymous shared memory to device private memory.
  */
-- 
git-series 0.9.1
