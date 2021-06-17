Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA33AB730
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A896E919;
	Thu, 17 Jun 2021 15:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C966E919;
 Thu, 17 Jun 2021 15:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYng4FCdO2ueeByX27XJogXe0nvh+XRsKggVcT5cJUD+PJ72yvD6hFXNO24mDFiG7+jIWPj6bPxx/49zQpTS2pDuCvB9d1z3DHRPkjSybkjWqLEn4i9JqV78VGVky+rsm5JWDENE5BI90wpgMGLbJ46azmBArDyLTflZ4WmUcPII+Z+zD6GEoTegE9TrB9vq1y23VB2D/TH1JQheOGfxLFraax5pENWQBgpLPYbYEZ7//+7ME4QxAFcfmKr8+g+72zTtnRLj0/aVHr51gbxzl+MvE1ISwEF3RNQjKsOjcmqIvLxFIAfUld3yesB66ZJiCS+86LYXwTc4mud8ostpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6HGs6MXR5pR6lo6RcA0WNQ/ez2NUvGyVipMq1HQwpg=;
 b=Y0a1VLkVa0WCn8/DqGzVIr1a3JzRCcSlYL0ROUyRmlQtRngknSIvAEVrz5FazB45uKjVABtx4ACqd0uXPGmLNiOTcuKxj1i1TRDBslXjxda2OvyGl+0Ts93UJz6rd/4fggAOOWawtRtubCobCgRwRE0JHe9esDLTimLOkcDtr5OULJRCqlLs9xvNM3Vh+suzd2Eob9nQlbENCGjhFQPqwQbmTQQxy/gtD4/t6hVY6xvzEgKoR8LZvpx3Doa7jYG/q7ARFC7CgzRk/JO2aHmCPU2ppJJQC4D8k38FkjFCLHKRiY70KrOMR1Bnp24HuA3dI1cAC0I0J9JM7GuU51sIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6HGs6MXR5pR6lo6RcA0WNQ/ez2NUvGyVipMq1HQwpg=;
 b=owqrXh3A3knFoZPRp6Sp0BBGsM1ZOiuAv6DmYSP9GoWoDa0kldlk5C/GuPh03ElFD2BXjGO4CDTeUDxXa/50fhSJu7pCBA7+GpNAEKRKzbQuzBLZEoIjh8jdrwIsBq/O80pWgRhfa1/hFpbqri6AbOIn9iAfVPcTv3eCjV0B/Gc=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 15:18:11 +0000
Received: from DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761]) by DM6PR12MB4419.namprd12.prod.outlook.com
 ([fe80::b972:f4d6:9db3:5761%2]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 15:18:11 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v3 2/8] mm: remove extra ZONE_DEVICE struct page refcount
Date: Thu, 17 Jun 2021 10:16:59 -0500
Message-Id: <20210617151705.15367-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
References: <20210617151705.15367-1-alex.sierra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.78.1]
X-ClientProxiedBy: SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) To DM6PR12MB4419.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0501CA0088.namprd05.prod.outlook.com (2603:10b6:803:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend
 Transport; Thu, 17 Jun 2021 15:18:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7589f333-9357-4f74-922c-08d931a31e29
X-MS-TrafficTypeDiagnostic: DM6PR12MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB44197FA9E40AE8DA6C32D658FD0E9@DM6PR12MB4419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zd3Rzdtz51XKLsBY8TDv+8WAGfU2mfHDu9vf5w6N32Un7aDb+RL5rOl4oW4Kt8KjT9p6WPPdeZfMnn6rFAzRjL+NQBFLBelFjRtqomdsLHhAuBSQdC4jUtu2McOAYIVetohZH7aa6DyusiRmBSr2b8uq8/GKGKmqLFPko1GGehug+bNtk6VnO13gZ+7tct3WaQ9YDQaoONIeASA8XGtgp8nHzpkdbQGRxqr98Ty1f5ZnoLFEiKlEf/r6SNSDuOzEshCKltQM96jo1IOHAlYMmyCDo3aO/BGATca3ICxIrXg+lGw38DiM2gxOIgB2/gEaIiCciF77D8w+kdPGf06UMGIJcqqAN7RWB1rQFxdPPMwfqS3IqhrKiGd0zSQiUC5lKX3YVPwy1iAis8Sqygs1R7H7tcwZ1uSDHnIOrjXCbbU3Hdcdg+/a2Ortyl6WGNLdrrsMAxNg2nQUEmffPnJPdxChfeEIvIk+YTf+fge8e0vxrxGDhBQ3288RpiL8Qc2DD/mI+C/YC9NtqRlYaoGZIi1wBEA8mAOfKlylE35uCY6XJohGEUE502PBZ7L3XABSZrzZvpRygLQ23sYy0KnZCn43u5i1HNIWyUDlDjlTmd+xyHaQgk6sMKh5kf+RU9oWfSc81Ini0VI8X8ac6jv1mAlduwmgXq9FWc/pJPFE7ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(8936002)(6486002)(36756003)(478600001)(66476007)(1076003)(7416002)(4326008)(30864003)(2616005)(956004)(2906002)(6666004)(44832011)(38350700002)(83380400001)(316002)(38100700002)(26005)(8676002)(5660300002)(16526019)(186003)(86362001)(66946007)(66556008)(52116002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cb7LZEW6AvFat799gW7j08fdUm7QGdGMYLI66rML/Mb1yNep7pdQkMQtmvx+?=
 =?us-ascii?Q?1ouGjOrN7ngrrV4LIlIrPuihsa+eiUHebR8KrrZCeb5eOQzEOpYOgigWZw4Z?=
 =?us-ascii?Q?IFF3iNStMbbH/tYCnQRkWk/xgPFuNE0WPhLC2tUFeHp9PmvWRagtZcEJNjdq?=
 =?us-ascii?Q?K6yIMsXDtiXS8zlUJJ21c+XWjDIAU3rz4zIvyrw07qNQlK68+aiFNL/yKNDl?=
 =?us-ascii?Q?/oWFsnWUJweiP/BjT1SHZJc77dHYoa4BS8//s8W8/p6nB83e/FicSO3yiOD6?=
 =?us-ascii?Q?BAO7A8o0dYE93MGgqnr+rlDivJOy7yDMGvMSHjN9c6JClPcqUvXa9nieaXsx?=
 =?us-ascii?Q?kD0mbl270Y1JKAAD8TC1MTA6OKF25KfYQo9DiINVtEuW4XdH4Mx14ZCj4xrc?=
 =?us-ascii?Q?SbsEKj8XBNgGQnpEWaZdFec0ODfhOl6MIbPsZZJifqLmhj45uXwUMvUS1MdR?=
 =?us-ascii?Q?Cb1DQPgYtj/Vm8X9M2FWvWlReAMxGnhDS6mLtm4vrFUZUn1PIv5hmYXJTjGC?=
 =?us-ascii?Q?eAzdEcCRsaswtp4kJHyDe3e7eW5sX6ZajlkDTyYStzteqZJUMw3io9unWlo4?=
 =?us-ascii?Q?zsWB9BX0yZKD1ZYidGpojbqzei/AXewGEpINDtTZsoF4TeTdCDMm9Nk6q1D9?=
 =?us-ascii?Q?aYuPAJw1neZkKoJGhshGWx7xYlO7JRp+vpg+zUK0mTn/r0PXUyz/sCxk6PwF?=
 =?us-ascii?Q?LFaoIKgqSRo9EcpwmT40SLfcfgXN4O6uw91G8ybLWci7LfuJqUCwkROJ/1ZI?=
 =?us-ascii?Q?4bU+uBJdEzWxD6W3+xl0vcEjTYmv9zJuSv4kj+R4stPCZgpuA+W+SyMcKqxe?=
 =?us-ascii?Q?d+vUAQbPN9plV39NH1RHkBQLJglUDPoLaZR1ruKFiuzD9+thU/MOdkOzcXT+?=
 =?us-ascii?Q?GOSFOifN4djDy31CaD3ZpVOxiH5XXF0ByidgwCxuK0P0typkORu5jD6JmPSZ?=
 =?us-ascii?Q?GRAkFhUmPEedp3lEDM+7wqZJLdnBOurwoiRZDXvdWL16WMxGiKQMioFxfCMc?=
 =?us-ascii?Q?3BGI4kfI/7HLLQBUeS315zK7079rp5KIKoboRrPntqmijS49oIVlV22wvuL/?=
 =?us-ascii?Q?a9pNbyVdt0tvatQzy/tMsXrbIpRm8zeORz0LXtOf+aLlBxdVQ5NSDlCI3tEu?=
 =?us-ascii?Q?Da4tTNKGi62HqEpktIuC+X8vluzP9mj2ok4tcPoTwtRlf7F/VywtB499aAak?=
 =?us-ascii?Q?j9aB0rHIPOqIouYqEAljizllwoGof2LujOIMRZPJc/nO0mmerXizsGHBrs2e?=
 =?us-ascii?Q?EQ5xYTk9yCi5TEWS9ddJOy/kvtSpHodNb/s06z+I1puY/qZBe2hTwv5EHq/w?=
 =?us-ascii?Q?sxAGh7yaZwKsX+cdE/vQbYif?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7589f333-9357-4f74-922c-08d931a31e29
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:18:10.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCbltaMRNO6a4bkzK8lyEk/k7emh85cA6icxdayyqhoj7dHx+I4sPdMjW7mKKTDPb3qyPX/AlZbzp5qRPeDECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
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
index 321f4ddc6643..7b4c6b35b098 100644
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
2.17.1

