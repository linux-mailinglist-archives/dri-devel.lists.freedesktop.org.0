Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB44098B5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCF86ECAD;
	Mon, 13 Sep 2021 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9C46E1D8;
 Mon, 13 Sep 2021 16:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXnneMBYXZrFNucPey/A2AnMkw4LbPdNxfNQzfx4TQc1H2RGLYCiRTg1EvzBhcCmCQ823yfARZi7am+DwQbAyNHtPpfNdSxBddP5gKNCKJSfFczi2qdyjh2w50EJQJCRGJ6/8x6vjiScwlEzVXWYBisf/Ii4JZy7ORPfl3DD0tkqZK45cbnEzpX3FwobVkQpUbA1Aq8Xg5f3KtmF20FTMoWe9t0D7kQ1r0uVlAsn/i5TVdVLfE2rSP3YitTeLrSZJSL7c2AO9fi4qv0lDQ2cxTkNK/vfhMzNFAvIXFpzMNLg00Ci0aUtv6e3bQETmeEE6uIGfedPu9yUsmVHJJg6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Z/dmt0Ms+aUMALBFM4yLtNUqpaeot3GwnAz3IGbDbXo=;
 b=Q5G/UONZqB66fWXAQa1FHhKa4JpwMv1rv16/65bOfHpZ8yH4GIuXe735xz4Nir90gOr+ZEraVB/WSr+EUZMd2X1JnrHR/ZyTNkGj3dBy/f14O7lcj9taMN4y4EHq6Fv/tIjVrNDw1nAwmem7y5jPoU5nrAFbsvv0GR4aOGc00IevdhH9GLu3I4+YfOUnG02ujkygv079gFX8e/u+DIJo0RXP6i8ZPzYeuoAyCfP3UxwusAnaiPL0L+lPPjvwzRg6YG8uigRWLUbni8/hDuY/Fi8kmHALxQ4S+RrakB/56Woo0om+JI3w0rmq3bGOTwDI3IgWWZro9e8By8oCdcxJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/dmt0Ms+aUMALBFM4yLtNUqpaeot3GwnAz3IGbDbXo=;
 b=PHb4yuMOxlYjW+qEH1d4vfZf1iMEW1AyER592Q2UdDXxZdSgabdY19CjeavBt3/jFMeFzBBu4HzHshtZam58KfZQHreJvjtvYZTAb3sBnw0EXPYcFamBmuQiatCmswqbuiAzYpHv9UC0m48PQQ5OmL6ES/K/QKRpeZTQqDQJKJk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 16:16:18 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:18 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 02/12] mm: remove extra ZONE_DEVICE struct page refcount
Date: Mon, 13 Sep 2021 11:15:54 -0500
Message-Id: <20210913161604.31981-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa013362-2dcb-4a04-14a6-08d976d1d118
X-MS-TrafficTypeDiagnostic: SN6PR12MB2767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2767BA075A9FB59F5137DD93FDD99@SN6PR12MB2767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNzul2IQfQi1tX87VkmABX3Opb0gHNlYpFs7vymF77iL3FdE8UyIPRYj3pl3GXnU/NBpZ2L2cssbHmYh6a6g+81Cy8RGTQtbzhPU+Wc2OjEmoCkVkOfpeX+hHJArYTd7xWcu/kuOwOL+HgFKiX4RERWsckjFvaObUrgZ6WkSTwfuaLd2hv7hRPju94/5Bm7DLoaZ/AZLwr2I1wGKmwzICio1uZYdcEJO11FFgp2felDNiHXkRKixcpyY8GYyqszJPR0YMAwIRrcY39KCceLOOVPvoKxYsNJ1dH0Q/CaGj4GsfIzcyGh1EHAuoz239Opy0+y2M3sRwXYBcJPcuBfptHlEDsok0qQZWEukIWeuJVJhr6pEM0YG8QSiR4qGI4siBMYnnl8f+xJ8W0NnzZ3rlN8sR0W18BN+6JZ/IOX8vHdej2nS0gVNLRjCXNFPRwhqegWaB5SEVCA1vAVlIB0p0t6S4zqz9cvR+I/hsOad9GP2vgWcC3LrvDhGrqzVh+GTvd6vj9vqqtkInuXqV5wr/vtD/XDAxkAjUG0d9qMmwqgtOEVGTQkeIUoaNXy7wc+wyP6BWwxE9sei+S5ZasgmMGpTlEIIOqH8diYWVQUcHkd819nyq4oM6VmcXWrlt1d9YACFfUInyG9HUqkZX2U3+fTIbUPnO6ER3RlZ7X+6rYmlRqj+u+zTk/FshwrwjgfY2dgFNoryauXUNKVEHaFHmvqg+izhgH5Cp0EidyDZvOxC0b6gbAkEcuOzL9eMTuw4COM/TFNsN7QQJc6LwFD8nuTvFd9mrlV0P5mgCjCKto/I2/iPd0Sq0ZTbWkBMM/Iig2Nfijm0biBWew2MJ0rkjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(1076003)(7416002)(966005)(86362001)(66946007)(44832011)(478600001)(2616005)(6666004)(6486002)(52116002)(7696005)(956004)(5660300002)(316002)(83380400001)(4326008)(38350700002)(38100700002)(30864003)(8676002)(66556008)(66476007)(2906002)(186003)(26005)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?moFLADnQv7EvAR5UPeEatfQszSM9abTfvHpvAuRy5fW34t2yNdpr/NG4sSmz?=
 =?us-ascii?Q?0JTYWLGUGpux12045a3iIVa/SX+p6MeCqSu/K/ZJ98/i/HywUGQLjwskOgCJ?=
 =?us-ascii?Q?MmN64QOccWeTVQg7WmMrteexJS/zdBbv0x780FMErLxoRi4GzEEBjlPzFUlo?=
 =?us-ascii?Q?3Bm6eOEiboMN1iEmPgry1luaQVCm7gF8o1Fx4gsVHtLpsZISJZwzPo457p9I?=
 =?us-ascii?Q?7rhcNGm6sHyHWa2KA5nBUZ3b9zlNs2B1pJl1zRjtIcekjD9QUSS9y7afoemc?=
 =?us-ascii?Q?sHrNo+9HNjKqCqNq5d1H1gXaG2yMXUDAX9Y+xuRSscjJoHek6XKIZS1w0AQC?=
 =?us-ascii?Q?4HB82YJr5NQTCykc7aNbjVN2MGq1+oQI2eUnK9gE5oJVImV7NMRQKo1PNjDt?=
 =?us-ascii?Q?GCS+lLzTMlEZm1aNNiOg2J37iJxxzlV8X/7oGoJf8aWum8/bsD2Kr96bxi+1?=
 =?us-ascii?Q?MPC4T2hGQ3aVrM8NOuIw7SvIJboR+diDkVx4w7zHteBqQTRPKkfISz0Lhxa7?=
 =?us-ascii?Q?JuFhGnSoceI8P2/OoduPQz1LU/31qjHjo6n/MhXo3hh4h2FGqJUaCRyRVF3J?=
 =?us-ascii?Q?5OIPm3uA4GkffaJp1eB3rAW6RSecx6TybGNlHkqabod0rNnTmLZ1dksItWWs?=
 =?us-ascii?Q?35vfoaTyjun4z3/SfuVap42r1FheT79gtvIqXCuSScd2i/D0jJfEGkp/yZ36?=
 =?us-ascii?Q?/zQe+zRK0AFxF/lGL8EiWO97pwk1qQkfHev2vErKAh30sVp5VLMCKgE57aeC?=
 =?us-ascii?Q?U1PzEwdVI+Y9QlUbpfwit9LBNzT7pkOv408plOd+X9fO2cOLj729C3TU9uLs?=
 =?us-ascii?Q?lUfkJxAOzgq81ndEfcX8LYH/zBYUSExhf0D1h0sDzmWf0kWuA8/12CF6aoKb?=
 =?us-ascii?Q?/NFvJUL/faMrDI++tPrW3fhPS58rl/pjKcteSM9qHzwGU+0TRrINTxJfGg59?=
 =?us-ascii?Q?dqqnCxHorToYkQJhdhJJnmUENsqMHkMSQ968nPSzliuOAV8wlgKy4XfbiXxY?=
 =?us-ascii?Q?yDPmd+xy8FEQuNuPQB3C3mcN1CtpefjKDwdZYFqsEL7BMDRvIsr9EiuWRIQd?=
 =?us-ascii?Q?1Rur5ILz01U61K9HTpbzZQkINSCntxtgf7CbeXNQz5JhneTSJ5tDDWNiETH0?=
 =?us-ascii?Q?gIUIZvxoGn0Pt9w0SUvgOrmpnbITuJR/YMMmkOSWYGErJhQmg6971+pBn/GH?=
 =?us-ascii?Q?Yo/IEhJRWzY8r8+mpIZctd8L9cUPH9XDm6i64p3TpPbaTo6Ghc/yPlpVKe9m?=
 =?us-ascii?Q?mR84qiOIkjlU6lhZ/ShTdRgtj1RyfeSRQptKqSTaaI0vqDz0navQm7tFR6NB?=
 =?us-ascii?Q?x9sncoY2hioWWe9Q09zUjscn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa013362-2dcb-4a04-14a6-08d976d1d118
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:17.9457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSVbJH7U23UA1Iyey6EcxozDENrIDtQ2eHFjHEEV+VBooSX1TdKl2ykoDkk3vnHF2/pH/AXCR6PSNxSgNXqOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2767
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

From: Ralph Campbell <rcampbell@nvidia.com>

ZONE_DEVICE struct pages have an extra reference count that complicates the
code for put_page() and several places in the kernel that need to check the
reference count to see that a page is not being used (gup, compaction,
migration, etc.). Clean up the code so the reference count doesn't need to
be treated specially for ZONE_DEVICE.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v2:
AS: merged this patch in linux 5.11 version

v5:
AS: add condition at try_grab_page to check for the zone device type, while
page ref counter is checked less/equal to zero. In case of device zone, pages
ref counter are initialized to zero.

v7:
AS: fix condition at try_grab_page added at v5, is invalid. It supposed
to fix xfstests/generic/413 test, however, there's a known issue on
this test where DAX mapped area DIO to non-DAX expect to fail.
https://patchwork.kernel.org/project/fstests/patch/1489463960-3579-1-git-send-email-xzhou@redhat.com
This condition was removed after rebase over patch series
https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  4 +-
 include/linux/dax.h                    |  2 +-
 include/linux/memremap.h               |  7 +--
 include/linux/mm.h                     | 11 ----
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 69 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 45 insertions(+), 115 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..acee67710620 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 out_clear:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..8bc7120e1216 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -324,7 +324,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 	return page;
 }
diff --git a/fs/dax.c b/fs/dax.c
index c387d09e3e5a..1166630b7190 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -571,14 +571,14 @@ static void *grab_mapping_entry(struct xa_state *xas,
 
 /**
  * dax_layout_busy_page_range - find first pinned page in @mapping
- * @mapping: address space to scan for a page with ref count > 1
+ * @mapping: address space to scan for a page with ref count > 0
  * @start: Starting offset. Page containing 'start' is included.
  * @end: End offset. Page containing 'end' is included. If 'end' is LLONG_MAX,
  *       pages from 'start' till the end of file are included.
  *
  * DAX requires ZONE_DEVICE mapped pages. These pages are never
  * 'onlined' to the page allocator so they are considered idle when
- * page->count == 1. A filesystem uses this interface to determine if
+ * page->count == 0. A filesystem uses this interface to determine if
  * any page in the mapping is busy, i.e. for DMA, or other
  * get_user_pages() usages.
  *
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 8b5da1d60dbc..05fc982ce153 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -245,7 +245,7 @@ static inline bool dax_mapping(struct address_space *mapping)
 
 static inline bool dax_page_unused(struct page *page)
 {
-	return page_ref_count(page) == 1;
+	return page_ref_count(page) == 0;
 }
 
 #define dax_wait_page(_inode, _page, _wait_cb)				\
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 45a79da89c5f..77ff5fd0685f 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -66,9 +66,10 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
-	 * reach 0 refcount unless there is a refcount bug. This allows the
-	 * device driver to implement its own memory management.)
+	 * Called once the page refcount reaches 0. The reference count
+	 * should be reset to one with init_page_count(page) before reusing
+	 * the page. This allows the device driver to implement its own
+	 * memory management.
 	 */
 	void (*page_free)(struct page *page);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d8f98d652164..e24c904deeec 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1220,17 +1220,6 @@ static inline void put_page(struct page *page)
 {
 	page = compound_head(page);
 
-	/*
-	 * For devmap managed pages we need to catch refcount transition from
-	 * 2 to 1, when refcount reach one it means the page is free and we
-	 * need to inform the device driver through callback. See
-	 * include/linux/memremap.h and HMM for details.
-	 */
-	if (page_is_devmap_managed(page)) {
-		put_devmap_managed_page(page);
-		return;
-	}
-
 	if (put_page_testzero(page))
 		__put_page(page);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..6998f10350ea 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	}
 
 	dpage->zone_device_data = rpage;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 
diff --git a/mm/internal.h b/mm/internal.h
index e8fdb531f887..5438cceca4b9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -667,4 +667,12 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 void vunmap_range_noflush(unsigned long start, unsigned long end);
 
+#ifdef CONFIG_DEV_PAGEMAP_OPS
+void free_zone_device_page(struct page *page);
+#else
+static inline void free_zone_device_page(struct page *page)
+{
+}
+#endif
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memremap.c b/mm/memremap.c
index 15a074ffb8d7..ab949a571e78 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
 
@@ -37,32 +38,6 @@ unsigned long memremap_compat_align(void)
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
-EXPORT_SYMBOL(devmap_managed_key);
-
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_dec(&devmap_managed_key);
-}
-
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_FS_DAX)
-		static_branch_inc(&devmap_managed_key);
-}
-#else
-static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-}
-static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static void pgmap_array_delete(struct range *range)
 {
 	xa_store_range(&pgmap_array, PHYS_PFN(range->start), PHYS_PFN(range->end),
@@ -102,16 +77,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
 	return (range->start + range_len(range)) >> PAGE_SHIFT;
 }
 
-static unsigned long pfn_next(unsigned long pfn)
-{
-	if (pfn % 1024 == 0)
-		cond_resched();
-	return pfn + 1;
-}
-
-#define for_each_device_pfn(pfn, map, i) \
-	for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
-
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
 	if (pgmap->ops && pgmap->ops->kill)
@@ -167,20 +132,18 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 
 void memunmap_pages(struct dev_pagemap *pgmap)
 {
-	unsigned long pfn;
 	int i;
 
 	dev_pagemap_kill(pgmap);
 	for (i = 0; i < pgmap->nr_range; i++)
-		for_each_device_pfn(pfn, pgmap, i)
-			put_page(pfn_to_page(pfn));
+		percpu_ref_put_many(pgmap->ref, pfn_end(pgmap, i) -
+						pfn_first(pgmap, i));
 	dev_pagemap_cleanup(pgmap);
 
 	for (i = 0; i < pgmap->nr_range; i++)
 		pageunmap_range(pgmap, i);
 
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put(pgmap);
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -382,8 +345,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 	}
 
-	devmap_managed_enable_get(pgmap);
-
 	/*
 	 * Clear the pgmap nr_range as it will be incremented for each
 	 * successfully processed range. This communicates how many
@@ -498,16 +459,9 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page)
+static void free_device_page(struct page *page)
 {
-	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
-		wake_up_var(&page->_refcount);
-		return;
-	}
-
 	__ClearPageWaiters(page);
-
 	mem_cgroup_uncharge(page);
 
 	/*
@@ -534,4 +488,19 @@ void free_devmap_managed_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 }
+
+void free_zone_device_page(struct page *page)
+{
+	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+		free_device_page(page);
+		return;
+	case MEMORY_DEVICE_FS_DAX:
+		/* notify page idle */
+		wake_up_var(&page->_refcount);
+		return;
+	default:
+		return;
+	}
+}
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
diff --git a/mm/migrate.c b/mm/migrate.c
index 41ff2c9896c4..e3a10e2a1bb3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -350,11 +350,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 {
 	int expected_count = 1;
 
-	/*
-	 * Device private pages have an extra refcount as they are
-	 * ZONE_DEVICE pages.
-	 */
-	expected_count += is_device_private_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ef2265f86b91..1ef1f733af5b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6414,6 +6414,9 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		__init_single_page(page, pfn, zone_idx, nid);
 
+		/* ZONE_DEVICE pages start with a zero reference count. */
+		set_page_count(page, 0);
+
 		/*
 		 * Mark page reserved as it will need to wait for onlining
 		 * phase for it to be fully associated with a zone.
diff --git a/mm/swap.c b/mm/swap.c
index dfb48cf9c2c9..9e821f1951c5 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -114,12 +114,11 @@ static void __put_compound_page(struct page *page)
 void __put_page(struct page *page)
 {
 	if (is_zone_device_page(page)) {
-		put_dev_pagemap(page->pgmap);
-
 		/*
 		 * The page belongs to the device that created pgmap. Do
 		 * not return it to page allocator.
 		 */
+		free_zone_device_page(page);
 		return;
 	}
 
@@ -917,29 +916,18 @@ void release_pages(struct page **pages, int nr)
 		if (is_huge_zero_page(page))
 			continue;
 
+		if (!put_page_testzero(page))
+			continue;
+
 		if (is_zone_device_page(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			/*
-			 * ZONE_DEVICE pages that return 'false' from
-			 * page_is_devmap_managed() do not require special
-			 * processing, and instead, expect a call to
-			 * put_page_testzero().
-			 */
-			if (page_is_devmap_managed(page)) {
-				put_devmap_managed_page(page);
-				continue;
-			}
-			if (put_page_testzero(page))
-				put_dev_pagemap(page->pgmap);
+			free_zone_device_page(page);
 			continue;
 		}
 
-		if (!put_page_testzero(page))
-			continue;
-
 		if (PageCompound(page)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
@@ -1143,26 +1131,3 @@ void __init swap_setup(void)
 	 * _really_ don't want to cluster much more
 	 */
 }
-
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void put_devmap_managed_page(struct page *page)
-{
-	int count;
-
-	if (WARN_ON_ONCE(!page_is_devmap_managed(page)))
-		return;
-
-	count = page_ref_dec_return(page);
-
-	/*
-	 * devmap page refcounts are 1-based, rather than 0-based: if
-	 * refcount is 1, then the page is free and the refcount is
-	 * stable because nobody holds a reference on the page.
-	 */
-	if (count == 1)
-		free_devmap_managed_page(page);
-	else if (!count)
-		__put_page(page);
-}
-EXPORT_SYMBOL(put_devmap_managed_page);
-#endif
-- 
2.32.0

