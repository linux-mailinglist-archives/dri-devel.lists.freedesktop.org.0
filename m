Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13F3CC5C3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA366EAAA;
	Sat, 17 Jul 2021 19:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56B46EA9C;
 Sat, 17 Jul 2021 19:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUHv1WMsqu0V0OePCwZjG9wevCymavzOAQ4E84B0MbmOdlrQKvF8ygGj3Zqyvd3mZOa+oyZD/ovoKAGGB5rvcCjg0RM7s5qAlnWnjdneJcytJEG6/QaNWYJqs9zd3z7Hty8Abyfg1ueh/miT7X+evtVuHcLZnqSIi55zFvC6svW/ajhEfeu9znsiOGruwZMLCiz8m2M5P5KnG20DH7HcBNePXfGQ6AN7N9cWpwqF/AJPQpn2emev/NvJDwPxDPjLOBOeoUBwXPMQLyXLC4AA4VqoUfQvB3CC9502qL0+CuiSVUoHG9KovZSFn/YqCI5e8tteTTxjjDlyhGmMemM16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjm6pMWDxs6WiuEIw3qI0MKrwFxS8V2SjJOzX5ns9I8=;
 b=aFhtB5e3bXuF02LNYO++wV+QlesfgUnrcLc3VZNikOrQ3L6VCtQBhx9NL8H//Lsw0+9OPRnwraH0e1eq44AOaCGu5Y05NoF7Wn4WeFgFvu/PNFdJITz0uHlmN8agYaM7AWo+Wtyc9dkXc7sG4zgdh3LEg0SG5eDECWBW+vyOTf0T7aL9luBf3OpSmpKRmCdmmqqr+okP4obLnqjfoqWl4zkwGkMG1HNdSWHI/FFAD9Nn70n2jo6V58WGrYek5P+LwrPzd+jck+gLBC3ckt1HO7ZBRW+P3wAgS0DFapVfB6j5Uyl23CSG/FXmCMg6aQobAFP7Zt4cMcKmHtYO+T0GUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjm6pMWDxs6WiuEIw3qI0MKrwFxS8V2SjJOzX5ns9I8=;
 b=aC1MbvaZwBQlktn2R9ajgw/dKqP4QCzHssHqL4A4x3HXQpN0Hc5C5hPpEzG+wLH7maKvoq/aaKOUNKro/JEPk6ykWVU2svkJadOw5REAe5dYTogCTsrMui5KqNqdlFBodktqsJIroYLIM4byJEt8dpG7SvdBgvdeD6qHB9LT+VY=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:54 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:54 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 02/13] mm: remove extra ZONE_DEVICE struct page refcount
Date: Sat, 17 Jul 2021 14:21:24 -0500
Message-Id: <20210717192135.9030-3-alex.sierra@amd.com>
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
 Transport; Sat, 17 Jul 2021 19:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3008b181-81f2-4028-564b-08d949581ec7
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB467028DD8380683CAEEF58C6FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOWoKG7jKHT2dK5NflXoK2YAo0vx6bloZ0jj11QC3rtj5tJ6r42VTOJpZSiYycWFAIyJOFB3W6MvZq9HiR8ph4cMngsbtbuXxhCLQNh4rC8dNR08ps15y93N9YFuYqj2n1QEqa56lC4R/1O2Vmwy/3hTFwuGXf8zJMr1QcN+AmTjN+4zDJICL24Zz2OOLrrxBAKJJF6vIclqxYdaskN67FXJ75VegcxW8I+o5awnQevUkxdf0bEjFp8z/JpOSno9uUdou+8x+LzsV6PDthUXczVvmmu8JEB5wD1Q7S9VXlBTiFo6oVgKHsR+0hKPqA7XEMoTZQq2xEqJCX2dNl7mqfILIBOFM/xq+HnkEpU0OkJQSdBWIh/lhfUMluNJkM27SvFN/mVhcd0KZqVOk0S8R5jI5cblT2mnpiWmw4Um3WAUCUeUS4cj8f2K+3mi8IpOMzjw9m4o4xGnmxP/aS3JkQAGKEjZh9te9VneNedAggSzyh33uAlwjM/yLnG8BzSjD8yMw/3+tRGYOD4q8drCpPC9f9QT0Advln7xqcWkrGHBb6oK4ltUl0sE+T0YjGRK2BZ/iTlT+e+9dhY1LJHz6Jyrb6D83/MQS3YebjaaMY2L1nLrtla3hlQ6iPD38K/RZM60xOQQJmLhpLjxPutqTfxCc2W0f5mhzM1Tlc59JPUwDslHCkHYxAgLbZX+RkbHF7k4PUsMZXnPVkL2gUV08g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(30864003)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TPLRUax08Tjq+sMpvtgXvTbBdYSlZtAwKZGoATF+BEgwO5cdffW8Z3grjAxc?=
 =?us-ascii?Q?kLiP/EPutsCuWkgc7LxAUDBukIrxZ6Ovn8rjiWb1jIZYmUGLRo5B4+caZ73/?=
 =?us-ascii?Q?dzNeLNi1hDcxaA1OkraBaLpC6PGCTSYodTSR4BTeZMGy30nXbsZUecQFJMEY?=
 =?us-ascii?Q?kT8uVsBGBGu3wyZbkj9vxWpDEjeQHb4N035352/U2xPof8w2ubJahBGINt1z?=
 =?us-ascii?Q?h078vlVexsRBslvf1xa7Quk1Fu7wtYHhei0LBT8bgMxe+xIz7WsUwECebrGv?=
 =?us-ascii?Q?LMe0BB+Rh+q1u36MWXaKl2JzWfmq8iog4sF17oNrvj0tjAOJqNDbwYSBHJnL?=
 =?us-ascii?Q?pzIYHHLjB4IMPBv3rTZEDM5fHGuBNeiHGyMmswOoNkQjEnYfDLWnHUBHbey5?=
 =?us-ascii?Q?tlzUWeqgVK/RxF9Mu4hdIf5GuF2x7lDhmuJWH4Hmxo/md8qILvYqHkfWHpJu?=
 =?us-ascii?Q?Nr7rERJRzDbG+5/n4wE7BrfR8HK6UyyKEckX8vK2jT4XX21Afl4cb2EfN1z1?=
 =?us-ascii?Q?wyTd28UmQcjJe0VX7XMQFjKyIR+cVYcBLbSvM8+os0gsqFp+MFWLsTeMwWl2?=
 =?us-ascii?Q?5PUVpktaW+i7PJ5NwcfhmdsnzanW6sIWPeKV2SUWGGHlayMAFz89Y3zPOLFL?=
 =?us-ascii?Q?WTWpnanhMFo9NWmNEcBN3Qh7hCRaVccOY7/qaPm5YTM1QVAROr5yXGyxtOdq?=
 =?us-ascii?Q?QfGYde13hSN3T2P4+M4t0VSGhw4vDOfyGTcCJYn5g5DNrrHQDcv4Rbg7dWBB?=
 =?us-ascii?Q?xVqrctbhaiGSfsmUuM9G0HDDq/GgiYh/pQROAA4iTX/WUa0IdRn1PFVjQN60?=
 =?us-ascii?Q?dK58IajVdBck3S3OrHN7sNNFwt0h5wniXWtY9yFqB76dm6Rc/WHuY+MllD8R?=
 =?us-ascii?Q?iqC7SlMGN5jpmXIWOa1RX4fjHFaYzepZpPiUntYDUx+V+vR+8YeCFD7JyoVK?=
 =?us-ascii?Q?7ijDfdOcgnrbN9hcX+Pgy2nBXVu446MRrlp1Ezjmzhh+mvDzYC0wH5gqnv54?=
 =?us-ascii?Q?wJya7XLb6i/82HXIEyIL4eSHAkV9iu/xLwzqp/cGxQpO3EZVDE/ayrHqNvSl?=
 =?us-ascii?Q?5fMFnhJWMYNnpwKAbLygf+HN66A8OvOfS5gdH7iMARXz8gbyorC9Tp7SJOnY?=
 =?us-ascii?Q?3+L72OMo5LMTlnQMdR4MP3NgcENyESnN/wjxKrwwgaamcfnoyQFvmT4JIRfq?=
 =?us-ascii?Q?yAyX53qJMTMGNv68CHumfHVHwMtvfekuMfbX6lYPYB5/Wvh4+SHJJI6xKCZQ?=
 =?us-ascii?Q?ozm8K+/pFTVXdqjlCQQLI+FHDNa2yJZ/m/gUvrxpxKzjlC8JKGu9nFgWzsPQ?=
 =?us-ascii?Q?iFoiLu6SM/9iBn+rXz/gWY1n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3008b181-81f2-4028-564b-08d949581ec7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:47.3299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +B8BejZtDkMCMHOiBoyUnhKBgjXygzcFsp3Zh+0JLNMCEAecp2+V2OPerE7Qu7kANRqS8CRdMekpQhARVrn8Mw==
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

From: Ralph Campbell <rcampbell@nvidia.com>

ZONE_DEVICE struct pages have an extra reference count that complicates the
code for put_page() and several places in the kernel that need to check the
reference count to see that a page is not being used (gup, compaction,
migration, etc.). Clean up the code so the reference count doesn't need to
be treated specially for ZONE_DEVICE.

v2:
AS: merged this patch in linux 5.11 version

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  4 +-
 include/linux/dax.h                    |  2 +-
 include/linux/memremap.h               |  7 +--
 include/linux/mm.h                     | 44 -----------------
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 68 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 45 insertions(+), 147 deletions(-)

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
index 4820bb511d68..8d699c8e888b 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -560,14 +560,14 @@ static void *grab_mapping_entry(struct xa_state *xas,
 
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
index 79c49e7f5c30..327f32427d21 100644
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
index c9900aedc195..d8d79bb94be8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1117,39 +1117,6 @@ static inline bool is_zone_device_page(const struct page *page)
 }
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page);
-DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
-
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	if (!static_branch_unlikely(&devmap_managed_key))
-		return false;
-	if (!is_zone_device_page(page))
-		return false;
-	switch (page->pgmap->type) {
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_FS_DAX:
-		return true;
-	default:
-		break;
-	}
-	return false;
-}
-
-void put_devmap_managed_page(struct page *page);
-
-#else /* CONFIG_DEV_PAGEMAP_OPS */
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	return false;
-}
-
-static inline void put_devmap_managed_page(struct page *page)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static inline bool is_device_private_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
@@ -1196,17 +1163,6 @@ static inline void put_page(struct page *page)
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
index 25d2b2439f19..d3e58746f2d2 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -623,4 +623,12 @@ struct migration_target_control {
 	gfp_t gfp_mask;
 };
 
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
index 16b2fb482da1..614b3d600e95 100644
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
@@ -87,16 +62,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
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
@@ -152,20 +117,18 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 
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
 
@@ -361,8 +324,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 	}
 
-	devmap_managed_enable_get(pgmap);
-
 	/*
 	 * Clear the pgmap nr_range as it will be incremented for each
 	 * successfully processed range. This communicates how many
@@ -477,16 +438,10 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
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
@@ -513,4 +468,19 @@ void free_devmap_managed_page(struct page *page)
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
index 20ca887ea769..8c2430d3e77b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -376,11 +376,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
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
index 519a60d5b6f7..4612c457d0b0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6210,6 +6210,9 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		__init_single_page(page, pfn, zone_idx, nid);
 
+		/* ZONE_DEVICE pages start with a zero reference count. */
+		set_page_count(page, 0);
+
 		/*
 		 * Mark page reserved as it will need to wait for onlining
 		 * phase for it to be fully associated with a zone.
diff --git a/mm/swap.c b/mm/swap.c
index 2cca7141470c..0a12af814065 100644
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
 
@@ -878,29 +877,18 @@ void release_pages(struct page **pages, int nr)
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
@@ -1142,26 +1130,3 @@ void __init swap_setup(void)
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

