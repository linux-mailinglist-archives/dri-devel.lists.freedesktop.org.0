Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116D3F6E08
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7026E12D;
	Wed, 25 Aug 2021 04:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963096E12A;
 Wed, 25 Aug 2021 04:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7ADNXGP4gjJaCxj79EYXEgE3G5l6NKBwy2DwfXKs8qe17Qvz4zkXryfz7yd3XR+zfxCpFYPEkHsH4xoPGE6bEe4qcK1zCP42Ikrnm/bn5ApJ7nUp6odJUleSXhc6Mu7YuUXruDC08CPT0HLxHFMt2g+9zXnsxc9Dsctb0PFtbd14AWwi+Z0JZIisoTXE83kHhb9+mo4hHpzGXkbhq0mnR9+XSldv11Rl5nbB7hGgeaLG6SdIEpYnd/Obwrdk5SIeCxOwXTbc4rSVpGDFUZPuTfdJpC5osI9EUk4ylngxBsWxPCqJnXsVD2FEyHHBsoiPagfmZ3z4bNYCWq8OYXDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwvtA8B1inLdni1msjeqDIkcCa9b5RX6IH0PSLMNQG4=;
 b=US887SQotGA+eRD9MVNPD6bvx/uBqM6HjFE50UNRpHucLIu/w/qmmESkbZ4yHhNTCOje5KILN+hVLdBatHaWWuBT3Y2TVG7hMW8TXcG0bQBkdssYYzCbPcgXUA4H19LzPMKHWksE9y9uOkdyBfTt0bKgTMOMpRrcSKA4tIjGhXcLP3EzPBFFd0JApkzQbmOHUxi/F9kavqHdmSq6ISGMlU1zz7Eyfwjs+GqMf9xWyhN5n84UI6bN9hpl1IAnzvYkDy4TEXHcu9F2rlKQJQSmF8PTNc2TimssV0stA+buYPHO/6iCeQv+xXm6YBr7zZNJyB9BaV/uIwoTj2tswUfY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwvtA8B1inLdni1msjeqDIkcCa9b5RX6IH0PSLMNQG4=;
 b=tEAtUxDIlhfnQ3EywdPnFZo7SG3sD2i02bEs/iE9bdEJ2uJurd2ztuGrXey4mlw3hQwmirL5sjbAMoRplZRsQlL9KQ0cFC/IVXqvrlTADDUyIyr5g9Iox2KHiX6dklTEyXe9hD5NkDfc0ZOtipUPoV6zsy5UYdDeHCKLeXlKJek=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:48:41 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:41 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 02/14] mm: remove extra ZONE_DEVICE struct page refcount
Date: Tue, 24 Aug 2021 22:48:16 -0500
Message-Id: <20210825034828.12927-3-alex.sierra@amd.com>
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
 Transport; Wed, 25 Aug 2021 03:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc05c35-9b29-426c-97f8-08d9677b3a80
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4511174C21E43A14CF0ADB16FDC69@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwJero7fUXINQMcIjq6JFecOizqnbO3toY+O7YcPeRJm+67VBaA9UmtaaQHBLHobsCQAgsQKXuvbf6dOLTYRyNs1yJ/trhvsKuCQxl0FsLJdMba0E+x/zkQWLzuwcU2bvoVMOwkL0IEP23GlOfF3cxn/B23XZRggetybMIwMHXU18ie92PLT9hrjjGFhJEgLA5EopESRR8Nm50UMS0gSS6J4Xof0ZkB9NV496mml4l/0aUvy5tNpjaOZLtDLdc/QROj2CcSRFFRdM19ngeDu1O52MEnXzUiDJ134UjP1JJWj+U1oB8AT8YPtBP9wkJ7EWNHLN6t56DCqmiVtJDUiK2VtOqiZWdvF3RxOfW0wSfX1dog1v9o0DdT8JVa8VgKNSTv84hRnj74qqFwDZsNTXktSk1QGZgJZafACzLIwJeSkM4whCIyrmN1Iqo77ckGYY03l1mqI895PfxridD4Z4JPmTOugZ7RJ3uDxEchkLtz1Dm7MyB87bUwTmTYeIT0C74qf2SbZpAjs/IW6708cm0X8EiCweHKCiCqEKM5tGGWZmoAq81rXxaAyySS7MfLV/ANbZEODKq/eoikZgjjluc8qxpdeHXIjOP0IwhihAj9YT6oVVcG85sc7mT9A2OEaIRpz9HoVVnnEBrDhFwCyp2KDQi1a6a3X5KwOaAgkdh17dRCOhYsWt5knqoDDvZCVjX8kIdizN+1kLkyYoOJqRD4+KfYv/k/FEU34h5ogY8uK3Kf8801cdzB2fb09vBHorxllc8yHlZXPCjaJi71I/EmuJ8QR8WXtxwHfgkfj7LKC4nyocT+P3BhVNocwi1MjF7v3MPKav883jH5ypXgDoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(478600001)(186003)(966005)(1076003)(30864003)(83380400001)(8936002)(38100700002)(7696005)(66556008)(8676002)(66476007)(66946007)(6666004)(956004)(36756003)(52116002)(2616005)(4326008)(44832011)(7416002)(2906002)(6486002)(5660300002)(38350700002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kn2nv7diAXQkWu/b9TKmxLL2Mul4zP5JmcAK5ulI4DHVyFAh+lyy6LY/eiKl?=
 =?us-ascii?Q?3dxuavRSWE5kuwrsomlx0VuJtjipssgHpSDfaDyj/RBKGaPDSK+Zs1QqefvD?=
 =?us-ascii?Q?fiUbQnT76g1eKzgeea9IGs0PNm6wjIzSWEAGTWU516fE5vQGbX1nN8aLjQGv?=
 =?us-ascii?Q?UT/J5xemH1g0ROk9euR8lsSMRuzBe/wI0BLW3xBQ0EmSEP/rQAdS9bKlmYzg?=
 =?us-ascii?Q?07mmsfynyoAhWCnaX4/XePufT6YoKH1WTDWyHduObP8cn3xTYXMyBaGfnv6t?=
 =?us-ascii?Q?Y3onVruvObIYT5qN/CkOMkf2h69cSo4wRkS1+CFYigCF1gm34MJYxzkq7Xr1?=
 =?us-ascii?Q?plwLepNb6qdJhUT54XYmBzxmIXtYBWVbRF6/1Ew41FEuyclT4zn5efXfse70?=
 =?us-ascii?Q?Ff2fOnc816nFSoGMKp7oh+Bm1f0to2wWfzl6XtQlcDdPpiLIGJAIKcK+OuHg?=
 =?us-ascii?Q?RPfT/v/AzbCx8FiiqgOIK+J04zF5G3SVSO0nHEoGAStPjWOeHFUpAIXnw7xS?=
 =?us-ascii?Q?EiyfzePfJscipgMwf78ghIOTExl3Th0aclvq8Lq//PR9OH2Wbjn8nm3QjCzh?=
 =?us-ascii?Q?mNC9QFHx4snR7DiIY3Jm265njlNHXype4cQ7VC/R8L+jeflnalBxEaudUFIO?=
 =?us-ascii?Q?kJ5Sb6S6dEk9ysh4G5oZaD+67LdTwWCOUwTNHmTZoVNVfxOQqyJRl2bzDIHn?=
 =?us-ascii?Q?qErvSu5e3yfNk1exdbBRlNQpK3ZbrHauXimiAW5HKAvnUT50e0xLqXSTYyRk?=
 =?us-ascii?Q?p+fZ0az969ZuQgESMfmYcepAEetulfqJCU2WYZ9aeipFNgOW1ZsWGKhE5I9l?=
 =?us-ascii?Q?KkYULz5KSJp63o8gmmRho6M9MweNvvAQV551ZWaK+Y57OEwoqeRzp0tb8foF?=
 =?us-ascii?Q?XUow2Iv04/spuCiekCQa1c8qAVN972pOb7J/iJbt278r/mPAwtlCznPmyO6s?=
 =?us-ascii?Q?/XDiCE/jaH+Nr9RQFlRYjKmgAxukg66S9x/ZdTQVumHYcnq+j6rkMDwxjRgz?=
 =?us-ascii?Q?OdZLgqzyu3mRNqNlrNYBLrQIXaK1xTFgDAd0H5ycdP0fRtSlxB4W/GkE696x?=
 =?us-ascii?Q?Rtyfw7SbTUYYKu11r7PuaMEv6sXqRyreab0NRR+zhdkCDXIPCi21XxZwyaHP?=
 =?us-ascii?Q?avIWgYWdgIKY1IRFtWrhuIuLs5mVZs9sjt5SBvBEiJDlS0MH5A7eTI91D5sh?=
 =?us-ascii?Q?o1XUVwHW7YxAzKV5q0d2DVgK1dQA2vQ4HpI38nJGXeslN+tzvWG91pAjus2C?=
 =?us-ascii?Q?O4d2XKjQZsMD3OB5d444YtEu8HOorR56SMLZ4mbczf2W3KULijp7K8lNmeAt?=
 =?us-ascii?Q?dEQZrFiBE9KJySxTyae7Ul1U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc05c35-9b29-426c-97f8-08d9677b3a80
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:41.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ/krujcQi6zEZQt8Z/VnWN54ef1OWgj2/pITyQdYagPvk1NLXKPePrjofvZErInOZ3U1jOVoY0Dxu5OjcJQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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
 include/linux/mm.h                     | 11 -----
 lib/test_hmm.c                         |  2 +-
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 68 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 ++
 mm/swap.c                              | 45 ++---------------
 12 files changed, 45 insertions(+), 114 deletions(-)

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

