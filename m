Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB23E9E99
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FEC6E2BC;
	Thu, 12 Aug 2021 06:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EE46E284;
 Thu, 12 Aug 2021 06:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ej3UNPkafs/1ej0mDWaEO5AVOkEiEEzXwSIvPLjnBMmjWog1ypPcAF0UkMmC7sBcWXcrypQs37ltvm3U2VXE7RYEX+qEiiD6MJzFXY+J/3SziaoJlg6ZEvQ7ZZWU4kU1w7AjMs46Y2l+m5msXpdGaduC6eIhIG2g2dOIEEEAYusURiaLYRjivkoKA6IaAKz4lPOw/0vaxPJ/wzTUIn3dQTW77fYq9i3kj8465vxbHZCsmFfvVQWExCQeHyHw7Z+xCXixQr6VoY+b0vDvh9xnxrNsCFdIcVEovCfvwqsbyIvmTj1aBDJPOWQoMDmeO/epgxLuf+wIyN+tOiQ2494aOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yX6lfR0iXpcbyl2fD8PUcrK1pNRjWGJpnvzMibH+XY=;
 b=P/MflyxMrecEy3nDMd7WntMG9z9E6Lb0J0X6qPEmxgBNDqCz0MyANVozm1ibNSfr231JjgPzmHdmqdd3DDMzfhNZQLjZEW95C76NVfg0PptXE7rIbbIYpdLTo4KTwncRIAJ71LTMSbtwVECXjgMSyXDHOuSnZeI+kPsoFiX5J/eo14CrM43wekvORw1sQd7gmZ1ki6M7J2sTaSPz7jheZUspXmgDKR3N9lDJQbdUOSsOpT9FREnVSTRxqihGWcKbCKPB12DkrcqLiINdQ/qKqe5I+l7lDSSUloCocRFW+SxIiEoRrk6QFgSTh2q1kp7KkU4UNTtgYDa56jQUih6vzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yX6lfR0iXpcbyl2fD8PUcrK1pNRjWGJpnvzMibH+XY=;
 b=TL4yBRA68ya8sN7f/Fb3FEoLhZaSDO4/RnK6EXTR+RoeAizTSaA4hg2t7r8YwGz/lxtHEMBm2YucRYj4aDQPL/1yKPBumiDUKYV548fEU48w06FsEIkZxEKe1SCL57U98zq6JtjmAtAB/NQV2Yg7KQOhTWMHHmXAUOzhHbeXNFU=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:21 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:20 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 02/13] mm: remove extra ZONE_DEVICE struct page refcount
Date: Thu, 12 Aug 2021 01:30:49 -0500
Message-Id: <20210812063100.31997-3-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6df30020-7592-4a6d-603b-08d95d5acc4e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448BE68721AF3D6C67008ABFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVMf8yfvbFkJERaC8WL248RD1UA68oXTkMac9TKukSDGVQhK1wEpQcSwVXf32sClKz0vqJr9oys6x6eriIy6eynFScJ6ZZ/cTWwfLr/KuOu3aemmxQXH5QfV+3Z0qPn1XiWz60wadfRkmAaiCBaUNk2gRtJgcG2wKRcN4AKr8+I68qTvWQJCaCeSlGPKHMEyybHVXYf0LYJ/09hf/EsMcr60tD/WxlQuKFoJAkv8VqSHiHCm34rUF7X6PL2bJu+zAAUvHSiASwQz9NBzzVeGSR89ft34DRcVdpufw3DWOyNJTAoITayAvkjttb/G6JswOuNknBIYbbnxE133GNbxacWlaD611MHsV94o92r4EDJjmhjOyBlb1LzJPGJqhxk9FIccJLlnWRAOhKaSGfC1TjAUKB7yCvjnUoPSvAWf+X7M71GhmfuaYmdX9cX6ByvBctLEHaAD4gKJ8P657FPrrh3QbnY1d3c7WfPsW33hImL6GKy/RwVRInQG/X8wvcgFCBr7PfMb/mDFKwhsuqrukbxKou36iQJD7JT7+f38utI10I/Ob5qre8fxKoKWvMNI+S1WT5Q8Xs5UID6rzr0IMfgu/dHmubij7arnOBT+z/5J0+PMFXQMr6OfRTzUfOfMcMBx/SAebQtI5DmlrlFJMV4+zS1ruNLpORzwjwmnbLnaErKMcx0VdrxCy+DgmBGNaiH2ZoYKZmSGuX8/v4s4/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(30864003)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XrdnpSPsU7C3YznaJjou6DUT6R8OZuKb12QBmvLiUWVGOkkzCqByBjwkq9Gx?=
 =?us-ascii?Q?kDwAbXYVb63nulvOV1XUc8S+QSoPVDizjYcMfPXG084kOhi0zwFDqpbxxakp?=
 =?us-ascii?Q?Z0sxLbwDEr9qN2kJ4TlrsbGKRr5otaSU7J6wu6NTb3uyw0ZS36kujmq/e6RO?=
 =?us-ascii?Q?Fz/A3g6gjeOdUHsGpSGclYe2UsRGc/lGe+m7nrQROwSS+ZTv4e49sgPzBLO9?=
 =?us-ascii?Q?cGKuV2SDwmLXvBNHmAy+sK6liXc0SCoaYmjA3xE4o7veRuVdyevDWkmXcooI?=
 =?us-ascii?Q?iHiVVu0VJ8yg4VPAA8E/C6RYhhbJgi4abKFEHnfa1BsYAj62i288+9WLbKaG?=
 =?us-ascii?Q?IuSy+qM2J6y0evJETVijtJr+EzPN7Yg03M3YomJn4XD40Lcw/HBRVCTrzW2Q?=
 =?us-ascii?Q?qiEbTvH+rhu5S07Wn8JX/UM2OphTQFHgcSBdjFs46Lc/IZQrkjgRbFkgOmSF?=
 =?us-ascii?Q?12BSfc4hXNtmknVN6WYKefAWP8OWwbDBt/fpWE2UlylqZmWWLrgvZKXFNxdz?=
 =?us-ascii?Q?hrbThRyMhuODzX2iFR2Z/tdY/BghSvVyZhGLlwFrOyXxjbEvoUceJNmO+wcQ?=
 =?us-ascii?Q?pMxqm4E3eTySu8FwHE9mFqu5t2lubLTb062yuaV2DsfpWc717oZ9yxVE3uzd?=
 =?us-ascii?Q?N5ubPg31SdRdb98/WX/wHSJ/RFlIq/fA+oZ4vk+eSF+/1dLS9BTI77EUCE0t?=
 =?us-ascii?Q?kDr3Mp+uoyh+OyNrubRMWnUoGMtIFLGrwan4F3+qrYiCxvD0QND63h6zcwV3?=
 =?us-ascii?Q?Xdrc9OViXw4G/QdEQRodLxQYIgDzMJgTbuxcH2hYu2gmvFHiKULGx0kcx9eY?=
 =?us-ascii?Q?v6X+5TfSg3gUUSm1fJk5JyfjbV2YuCsUwCwDnyaGVVgbBxScq8bT2IaEsHbb?=
 =?us-ascii?Q?gAsulUmiAQqu6qDkGllfH1945UhMwjJ2ssHwg6JCNkmNP+35r+76onkF9x+b?=
 =?us-ascii?Q?lvglrBCYccElaveEzIWZdh6c28K2Nzi+dwAK2VrODjDTASOcLu4/k16UV9Ex?=
 =?us-ascii?Q?8ZBbBLNg7DDD8sOxVXGYK4VINYZiqsuGzpUtcp24BACWFW1/pDtGUcOTJaQc?=
 =?us-ascii?Q?XzKJkq5GgbfT7TEUZ3VhMVBunW8cvyt+wLloEamF/mTsQdWzGUC4+nEyH3UX?=
 =?us-ascii?Q?Q6dASzJU2kEjccRWpUrJ/xGLYIKdWRxPn00BlA0g4NgD3u14fwIP1GfDge3d?=
 =?us-ascii?Q?xweOKTdWCH5WP+3aE027pNTgHONwx5y960dsf/3buzUva2NE0Sa9fnMEy7Kz?=
 =?us-ascii?Q?tga+ghSEYFRtkf0NiE/Rxqe0PNNs/6nURpl/FyFxZwdoPl0jFfmFQVHHpE1P?=
 =?us-ascii?Q?TKSINAPPdoiAPYbARTqmLk22?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df30020-7592-4a6d-603b-08d95d5acc4e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:20.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kACumQukVcaaqUm7eQc1dn43EwRGrjSl+10YAXhiKrkZ24Ff8JrRnt+dKSJ8XXulWqrm8sBsENuTpsFLRh6EA==
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
 include/linux/mm.h                     | 46 +----------------
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 68 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 46 insertions(+), 148 deletions(-)

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
index c9900aedc195..c0fcb47d7641 100644
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
@@ -1186,7 +1153,7 @@ bool __must_check try_grab_page(struct page *page, unsigned int flags);
 static inline __must_check bool try_get_page(struct page *page)
 {
 	page = compound_head(page);
-	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
+	if (WARN_ON_ONCE(page_ref_count(page) < (int)!is_zone_device_page(page)))
 		return false;
 	page_ref_inc(page);
 	return true;
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

