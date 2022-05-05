Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83851CB1B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28410F929;
	Thu,  5 May 2022 21:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20410F91F;
 Thu,  5 May 2022 21:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J46CjfPWmjeptaJYbtn93Lmppn+liiCQfEe8bdthjP4TnbW6GQ3urbVk+Aj7rauzTzX20WURFBIn/GzoBPZGMwaNAoFlImp03+k9Xjv3+hBxM0mUfi6bIi3NrBYs9MnmSWyaaHRAKpzHqPIBC8F8mPmZHtwEI84ZHg7HOCY+IYYUGx/HIOApASbG4P/F4P6GpORrpkClf6XYD8b3aZMytkWLp4sq3Qx26rE9hWFXDJKj0u/U0FHUdzNo36NrBo/ZqrKTdLfMmvOH7QI7dbc7jvXN3LrnaoZPEdZBRAQvuGvR7ICUmpZ77wB6ApUO93l4k8mgOQYyAq6kricxRN3KBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLboctgqtU8q+2w0PX43DNmgl62uyxYt9SRLY3lWywg=;
 b=JvqFDxanKqy08RPnI3hskjxrTF1FICmfyI31GQVicWzTiSzhdZAu8t35+KdAKtsQHH0KzYWmnINTjD+9VldC2KVZ9L1nd89p6gqPMy19dFBt6NDUfPWUJMoQO571fRs3h8sENEgQ2yvdtDrDMiPmfJap9hUGT/w5xPLF5FE0xDJkHy3vO7uRumALhAKIiqewQnSypkaM8MUHltsII9i9hZvSJknpTA92xg5rBdEJfp4mePypsYvCJsCIyg+iFtBihjQqeapnqdppnP9iJp7+gFDMDUlg+OqdZ/q/M7MazG39VgVxh8Oo7lk09PRSA64OBwSjD/HuCAWj1vVN8UHs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLboctgqtU8q+2w0PX43DNmgl62uyxYt9SRLY3lWywg=;
 b=0NM2RqTzEg3H4k23AjkrP+u/PI6CWFoe5vRuI8vMOM0yfKWBk961f+lTcPk8hF/nwSxPeV+PBfylBTh+GcgmOg3UM4zU7+K4TWVva/BGTqYTC+Ve1SqKM4ZZY5gV0D1UeEXhLtIQmbXaAhLS8bDSd8eQkRw6HvjNy+pw1cCmao4=
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by CY4PR12MB1479.namprd12.prod.outlook.com (2603:10b6:910:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Thu, 5 May
 2022 21:34:59 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::4) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Thu, 5 May 2022 21:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:59 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:57 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 05/15] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Thu, 5 May 2022 16:34:28 -0500
Message-ID: <20220505213438.25064-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 410125b0-2053-44f9-48ff-08da2edf1b10
X-MS-TrafficTypeDiagnostic: CY4PR12MB1479:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB14798D5F8B14DA7670755A3BFDC29@CY4PR12MB1479.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fQ3C7AkKQnx0naTBRyk6f0U/S/CQblwDQ4L/RaC+S6tTnJUeJdNE0FNoj5pZU/h+ZWGk3Fu4Mk8wH1ygRL/SYMcaQ1HoXa+qyXytPDt7XkhB5ks/Ru2G7t/XCBDbX49lkhJM/kaXQkbOlRKehCsR/lTMh9fH9OdUyJTpLTR5GXANc/B9h16enc4wOT6mq49/aSvfSks5PY4thSVj6HBBZM592dg3NWYBAV75ye23PMvMABAV2yIvqWd55pReZ39mw7iBfK/K58oG1zlkg4Oa0+5ydPPKtf1o9faO1ovbKLGni/DGeaP3X1QjXA2e+3TbfqpuYywiXOVd1JS8p1ofwYptDzkaORMgjo3EmTuWIj22eT5QHjqZfGFSZ8kkGKdq7hd30L50NLrdRQAQqbiToMWsIJ5yTHNQA2yDhI9a+GwnV8+5j14vOi0hpcM1cZvmDmTAoOprCZxfU4xJO05kvayhn+jJ+ylgTe/0mXJkCQHTVxygQVtGyRkDdH/0dNko5jrPjjOmIu4vJ8siKDGa3ZL3tnrhMYmkZeHtjuHfbAi53+UymUuOd6ypz/8pDcWb7MbDly437l+m+2KBpwsUslsmutk3zqO699JUn7HSNfsT1n5H8H9X+ox5Fsqs/eEIv243YLRl5pGXUppHcqmT5O/Lb45FftY4nI0nWaCDexq0/doqdmCvQlETNrl5UFtLh3RVnNlXVJwu2BcypZtJA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(7696005)(6666004)(44832011)(2906002)(86362001)(426003)(186003)(16526019)(83380400001)(336012)(2616005)(47076005)(1076003)(36756003)(7416002)(26005)(40460700003)(316002)(4326008)(8676002)(6916009)(54906003)(70586007)(70206006)(508600001)(8936002)(356005)(81166007)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:59.1264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 410125b0-2053-44f9-48ff-08da2edf1b10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1479
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alistair Popple <apopple@nvidia.com>

Currently any attempts to pin a device coherent page will fail. This is
because device coherent pages need to be managed by a device driver, and
pinning them would prevent a driver from migrating them off the device.

However this is no reason to fail pinning of these pages. These are
coherent and accessible from the CPU so can be migrated just like
pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
them first try migrating them out of ZONE_DEVICE.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
[hch: rebased to the split device memory checks,
      moved migrate_device_page to migrate_device.c]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c            | 47 +++++++++++++++++++++++++++++++++++-----
 mm/internal.h       |  1 +
 mm/migrate_device.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f598a037eb04..a214c8df7140 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1786,9 +1786,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_pinnable(folio))
+		/*
+		 * Device private pages will get faulted in during gup so it
+		 * shouldn't be possible to see one here.
+		 */
+		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
+			ret = -EFAULT;
+			goto unpin_pages;
+		}
+
+		/*
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * to migrate the page out of device memory.
+		 */
+		if (folio_is_device_coherent(folio)) {
+			WARN_ON_ONCE(PageCompound(&folio->page));
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
+			pages[i] = migrate_device_page(&folio->page, gup_flags);
+			if (!pages[i]) {
+				ret = -EBUSY;
+				goto unpin_pages;
+			}
 			continue;
+		}
 
+		if (folio_is_pinnable(folio))
+			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
 		 */
@@ -1824,10 +1858,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	return nr_pages;
 
 unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
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
index cf16280ce132..32c621416966 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -750,6 +750,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index b399c498f0aa..1e74aa7ab580 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -775,3 +775,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 	}
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
+
+/*
+ * Migrate a device coherent page back to normal memory.  The caller should have
+ * a reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma args;
+	struct page *dpage;
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
-- 
2.32.0

