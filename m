Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4A56AB52
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0D1133C5;
	Thu,  7 Jul 2022 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D404E11340C;
 Thu,  7 Jul 2022 19:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1BGltxfiMAVJ2yQUSGFaGCRX13RaqUYyaokJ5064pMnw4voPgmWirRkIA3mHGQEr0yTDZ0gBEMn6tlsV/SfAW/BFig5XF4dL31YnKcnZHVW1nFq3m/yokNYav0Ybxs0B2KPW4N67JGo9RjKpSe017nD08Kvondaw/H9ZCHxBs2wdz+KlIOngd6QLdIqWj1kMloOLZ7m3ADneAmQ0KpIpKgXuC/L777RCJNn2C/AS13vMup/od4xJVFj0pF+C8mrt62xjGMFkubXthNv1qQjo2oP2SXKsgRTMlJueTVChZjE1iznpiNv2W+H04lJGRfN7aWNJfKd0wjEK6QaxopdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uveC3Yahq2PnoZz8eRTi7g7J4sj8d2pR1muDTcZcOQ=;
 b=c4RShGiLBormHk1kCaA8wIKqEbEJ1n/PFx5Gl8O8ZI/l1ntRua1qkgaDyLusszWMcx0PQ82Bda72dLsnXH04TiSW/ytYXDhn8eP5ln12AzP6oA/rqAha3CZEdLTRjf8LosxcnahYuC0aeU4V50fJDeGZMJID5O0sWwv6Bvbbn/UifC4aMFwiZdl6mC5d424wjSS+2ew70UXdULIeaEY1JNvjL9bArgbzyQHvvy78u5b/+yC1dKYdVgNOGrd8Gx/JKykLtWrm77eCvEfNp5/q2WccT7otBW0OurUsJAQ5xIKB2+l4PduPqtm1AZRGhb9cI9EGphZDDH6Y83xOdKUnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uveC3Yahq2PnoZz8eRTi7g7J4sj8d2pR1muDTcZcOQ=;
 b=2FLuFNfWzUp0CRyWrrG+WdR/0R303fwq7bzKAeX0GDYtNIyE69040sN4X1J4Bdq1ioP+sJI1oUf4Xf9HkrldSd4VxAyL0fGVqUdpVquBXsaS8kOzeA4sqwJG/KHL8SoEadVnQsz+2Crd6Rt1aA5OR1/8Xiqm/hlcJKlgPHNUVJA=
Received: from BN0PR04CA0165.namprd04.prod.outlook.com (2603:10b6:408:eb::20)
 by DM6PR12MB4012.namprd12.prod.outlook.com (2603:10b6:5:1cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 19:04:14 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::60) by BN0PR04CA0165.outlook.office365.com
 (2603:10b6:408:eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:14 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:12 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 07/15] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Thu, 7 Jul 2022 14:03:41 -0500
Message-ID: <20220707190349.9778-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3c68d50-4d1b-4369-18de-08da604b7bca
X-MS-TrafficTypeDiagnostic: DM6PR12MB4012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WSACofG4t5ijEkpivO69k9FrhlGJ5rzrGoo3KnyCpd1skpWTwciGNeVDetGZIr/ctYuZaNk5pdxojRevFMdW3m0VsInUpBZYQnV8RCtrUsZBCDSc/GpO6BX+vyzdLzkOf1sEZ6KxOtOZ054u5QaE1idhHeOVCLSamFZZW6EcrgkC30DrycG6O+bS+ZPSpQbM7GTd7oV9IyzSGT/85exff62FVDVsH/aAGkdU4B1asP/MEQb6aT9XcWet3DI4is9pctBb49Pd8ZQ/hyDGDs9KRl49vZtgEfuvD0Fo0L4lUyoCdAAXeiEMbzYJ3tl5PzKxJg7NXcu/fffM1E2gPGIPbWasmniLjgTHJ/plmqGYp1rg7HgiLZXItFsWI31gX3cQ/lAjIUC45QXUP6zsgBxL81oPNKUQaouP+KsvEmWHdWYQEs+emjDYWcNjGb5s2pTY9W8uO3jtT9NC7iSfFUv8qz9Z5vAJdguEhunid1kj4OVwruslbrydG7t1PK+lHGVFGrXOlqEHWQLrlHaBlB6zs/ssOzxQkp3z5MOcUsP1vMqr598R+3WW1skc4l9gOSzle0gmkbu10ZoUCff9mt+VCp2OUfJNY6Un/JLHIjaCStc6Z4qCea0lrRMBE4/PYP79R4uNkjbB7pgORgcIXMxzhGODKjwRXniK2NiYji3cEecDzhzHNAgmPKbfHmGT0sRl5qiY0B1ZsdMKMIC6XgUcRjKyMNCHb6YMULT1K8OSMtc9ekue5e5TQ4zCSjtNtgaWHbSqC8UQTuHR1A7ICPaHRyn+oB/miBpLJNGQzR661YntQtumftammSJz/dgbIEhu3005YlBbaTdQIjRne+HQqmdI4hhFF11rLeh7JGrKDdzeHSwG11V6g/J78HPxuhoV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(41300700001)(2906002)(26005)(2616005)(7696005)(478600001)(8936002)(5660300002)(44832011)(6666004)(1076003)(7416002)(336012)(426003)(40480700001)(186003)(16526019)(81166007)(356005)(83380400001)(82740400003)(82310400005)(34020700004)(70206006)(36860700001)(36756003)(6916009)(316002)(70586007)(8676002)(54906003)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:14.1221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c68d50-4d1b-4369-18de-08da604b7bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4012
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
index b65fe8bf5af4..9b6b9923d22d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1891,9 +1891,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_longterm_pinnable(folio))
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
 
+		if (folio_is_longterm_pinnable(folio))
+			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
 		 */
@@ -1929,10 +1963,13 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
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
index c0f8fbe0445b..eeab4ee7a4a3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -853,6 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index cf9668376c5a..5decd26dd551 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -794,3 +794,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
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

