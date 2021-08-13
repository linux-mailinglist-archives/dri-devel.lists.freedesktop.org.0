Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE973EB017
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD3A6E4D7;
	Fri, 13 Aug 2021 06:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7A6E4CD;
 Fri, 13 Aug 2021 06:32:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHtWrlf/OgdCDPkQtVzcCh+SVUOOr2Zw4kFI/QG8mO8DqA9R8sfMIw69G9LR88zzB2xcls7rTvAgJqQf6y4QI9JVvr8zH+4F7d9dBFbOkMMvccgIGgvp2MLcrm5IGKmJ5X32F+AcOtxq3J8qxhKC0sF1R11iVv7hPHaTt3M8rLonNRD+qGgAt9S0SPlUw0VuMxdKAGUO2WFg7QkElLKvgLnI8qARoxJFNnQzsQvi+Moc6951fN4kaLLWIC+DLN9oaN8yhOX9Jg+kxNQDir9sgjuR+TH1Ln0wCrac8nXsbOqdAx6yXA/FgfTJ0FlpX2YXWUpGp0YnB3rrBS99FRv0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s65BuHAsx0SvDKirKGMcVSUa2xR5zCPMm0rKxA2Cblw=;
 b=QgQVGxIlwJp1b86MV1GLBAhfFYa75xgQ0MVRWv87vwFbPaCyCw8lptoMVqta4Jo5m2kYfAS6vv+v8aDAmEtX2288y3Q7oGWUNZBbD3iD+mfwVGGzbnnso814BSUF5dFRmX4tPfXoZJ+5TPcbZ6DBK9DXyuG9azD1Y9Af6a69SgGmCBAOx7+/vUmPCDmFMkCPfAEudsYLfQuPZw4KD29VIAwz+fGN8zTI6ra6KTzSIsCYEkpw2GRF9E4CH8A2ZmtKF+gSMloHpKml6SxHs28W08zjzdUCHPpz4gueCE2Hl5QTss5jr3yh8O6/69215IjAvT+f/KF7qEl9X3vDqSJdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s65BuHAsx0SvDKirKGMcVSUa2xR5zCPMm0rKxA2Cblw=;
 b=KfyuiAlb3zUZwi28d24vt3TFnr5io1vCrBJTjd9dscuxvL/RXqs7kP64w5UKH1CGak++ZBudAEphjtv7eNDa17vI3QIWvvBdg7clIQfYHTqJ7s4UozsZbIAR00r5oE4Q+X02wONjNTcm76NNALyCVs9e8NWLq48nvDytFUsWcyM=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 06:32:04 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:04 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
Date: Fri, 13 Aug 2021 01:31:39 -0500
Message-Id: <20210813063150.2938-3-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71cbac03-860a-4624-59ee-08d95e2410ab
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB271894057B5307FF3F372B35FDFA9@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDyuA5oSbD5N6HT3T43npVh0U4RusD6POCMqojOcJfLtnN3BYVjnFKqRslC4KLIpd6rMaxako3XGPe+I+OEw4c1nkvs3eTy9ZHY0jbst4/3PhmCaZYf4WZDuFVPkt0jOdYGQcNXcB2PY3oMFTCo8Foq7CegkgmTF0ZGIIieRt8llfUx7ZEj2JbnrRc9V7Qw+nhUgu7Pj1bjmUfoATntHgRfIGqKsavPWJoJXhJACKV1/QXi0fwf8mmkolnXcGTstd3m2ADsm/dTlHaltloko3ZWtsYNkM51GhESy0cy3XA+3fGkCfhaLWw4FNVhU8YMsmqHGK26TfPi7kgkWKY9ZnMZSb9ji+lg6HI86ZO9I5a1p/1ErgPJGT9dl0WUCKE5Yp79AQi2EZ8STaMsp4xjv2iN3R2k3+/Y0b8XZj/yfYltLaDys+YPR/LuzXzEGbnwHE0q6gt1ZD/rfJ5aTO/iNLWJddJnYtqqQxISbLnTpGdOtAcZXK4uQ1yNJR7O04bDOMvLwYvmRitiBUhxDZYclWo0wnNquDguZBYtrs2uZ515Fpo7rGUTtHbvIss2acEz1qsohbm6LIWRK1BWgdAG8nY295fgHKZq0dPXNCIFCHL5R9BGusJ/0TbqTB0ZYD8IQvpx9Wc6/uISGN/H6nk5/+qD+MSBs0NKX77c7nydccZLe5lOJenAjz2idMOx8O9EH3QjA3OPRjz+hCHK9Pp0u9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(956004)(44832011)(30864003)(2616005)(6486002)(4326008)(86362001)(1076003)(5660300002)(478600001)(8676002)(38100700002)(8936002)(316002)(38350700002)(7416002)(2906002)(66946007)(6666004)(36756003)(66476007)(186003)(26005)(7696005)(52116002)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0DvLnDyvXSaPwUduBgTKVMYIJ0A+7nDoBkMOg9qv43o6powf7SI0BIdMQYI?=
 =?us-ascii?Q?mNAo7LivX151ufQ7LmuMehDTBjy7Non5agfh3L0x3+zYyabOmw1syH5uKX6S?=
 =?us-ascii?Q?yhie3UhVoxwmBMjIX4MPJ7rapjBZsszD52CdpEyJC8EAxEbao110tgqN5tE1?=
 =?us-ascii?Q?o5qzlYQzvGGzOzByT9Tdry1wTdGysjTm0nqDQnJ4W/+RWbn8ELssyLKbu6MF?=
 =?us-ascii?Q?tR6ZFqNQ7VL/G86XqZrHdvTjlJWazsY8TwDzLF8gOKnVkeMDrrF8OMwyd4Fl?=
 =?us-ascii?Q?l++qJ9CFW3fcnWKuWCrm2tVYU5xRnwxlwCLiqHvHwPMmR3ql4zC+p/4ZvY1f?=
 =?us-ascii?Q?i8AkfyRMVuLP1vl4c+xgo8CIC3nxaj+JorT62J4AMdRn/MrJtcUZz0xIYnK7?=
 =?us-ascii?Q?Bn1MGIebdj6L+JMZk+qCfnDOVx2wqF4SkTOw4b3kID/psiJ6b6pwjxzQ3AX5?=
 =?us-ascii?Q?oytd3fyZJifEiGGz5ND1pisQU9o66qYQ1ARIZvJcema0C5fQKRQQzBV9E8XG?=
 =?us-ascii?Q?N6GDR0Y/oePqKBIEEoHLa0yfwe3kL4QGScZNtDKuUmcZ2mxIpneri5R0eEBE?=
 =?us-ascii?Q?LEztG8YpVksYnXXrIpsUY7rjMwJ0xYbVwML6K04osBLdO3GgWLeIjT8JNQrE?=
 =?us-ascii?Q?sta8k5i28u6ya6Xg/tMb+UK/d3yMFlkweqWujiWsQXGQ5VfIjOP8nIBk83Gn?=
 =?us-ascii?Q?LUmR2LS3hf7gDxRsQio2Zqim0AI4Z+PzNzX8PlPUFUsbxH2iH66YVVbUDPj6?=
 =?us-ascii?Q?1sK+4xqitc+IhKy/ga4BSpm8WuztgmLUtzBquAMFWkro6mQTYNnWBkUvvwnN?=
 =?us-ascii?Q?WkcqowazjHLq5h8zQNgqe9Ho7XuQhbOjSUmAJ49N3gOJdUhLqAhmc8wZ5K62?=
 =?us-ascii?Q?jeOv6fkHRtqpPF4XC2W1nba2CiyD5adbahabg7fOrUZdkwxnVK9Pkzftou/G?=
 =?us-ascii?Q?Q/1ajEi4QW3SPUDyn7bQ8/TzEcrTxuA3MqK047bdRKmmpAOAehdFGHMUIz7a?=
 =?us-ascii?Q?6TNYq74u0KtPnD0G8N3LDklQu8+UsGB230KezceXYFv+cv5Ju9fDljZnJUFm?=
 =?us-ascii?Q?QwK0VqiXgtD4PNfOCXAsFHyWcQdMuctrZ1yC6u/Zs8UEoDG1hckoVgTyLRMa?=
 =?us-ascii?Q?fqZpOal6Uj94zBOCJV/4XH4cDKZ4PZrVN2R6aB10BK0TGwsJ5luY4PX2RefG?=
 =?us-ascii?Q?AtmlHGYcsxSJ6MEYFAp5dmXS5IiMY+xDSJGPoNT/vkdGXZ/GSPpVtG6jf0k+?=
 =?us-ascii?Q?1rUVh8nnaG8MSznWfhru7jT7o4cKs/0n6by8raKySo1QiU0gUyHM7PWARfzj?=
 =?us-ascii?Q?LUAv0ddQvxA/Tw4Iv6c1zq0v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cbac03-860a-4624-59ee-08d95e2410ab
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:04.2792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRle/tFAVPNv9ocYst6qUZ5/Uc+qOw3RhodFasufWOfAJTPkv+JPRpJ8ewGgwYB/NyauysJ1YS1Wm5Csr334Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
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

v2:
AS: merged this patch in linux 5.11 version

v5:
AS: add condition at try_grab_page to check for the zone device type, while
page ref counter is checked less/equal to zero. In case of device zone, pages
ref counter are initialized to zero.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  4 +-
 include/linux/dax.h                    |  2 +-
 include/linux/memremap.h               |  7 +--
 include/linux/mm.h                     | 13 +----
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 68 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 46 insertions(+), 115 deletions(-)

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
index 8ae31622deef..d48a1f0889d1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1218,7 +1218,7 @@ __maybe_unused struct page *try_grab_compound_head(struct page *page, int refs,
 static inline __must_check bool try_get_page(struct page *page)
 {
 	page = compound_head(page);
-	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
+	if (WARN_ON_ONCE(page_ref_count(page) < (int)!is_zone_device_page(page)))
 		return false;
 	page_ref_inc(page);
 	return true;
@@ -1228,17 +1228,6 @@ static inline void put_page(struct page *page)
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
index 15a074ffb8d7..5aa8163fd948 100644
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
@@ -498,16 +459,10 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page)
+static void free_device_private_page(struct page *page)
 {
-	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
-		wake_up_var(&page->_refcount);
-		return;
-	}
 
 	__ClearPageWaiters(page);
-
 	mem_cgroup_uncharge(page);
 
 	/*
@@ -534,4 +489,19 @@ void free_devmap_managed_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 }
+
+void free_zone_device_page(struct page *page)
+{
+	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_FS_DAX:
+		/* notify page idle */
+		wake_up_var(&page->_refcount);
+		return;
+	case MEMORY_DEVICE_PRIVATE:
+		free_device_private_page(page);
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

