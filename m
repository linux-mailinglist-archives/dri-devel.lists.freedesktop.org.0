Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B0576EDD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF7D10F6C8;
	Sat, 16 Jul 2022 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50710E06A;
 Fri, 15 Jul 2022 15:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuxfDi8WJjxQr6f+IOcXOi0gzWpwqBAxG6LW+7k9C9/R7Nhg/5jQGBpZ9/52qtYEuTOeFlbMKSUL5LCIjrNigeTbWJ4tcUIv9u/IuMz0OUbo+XS4QaibfCnfXzZdrJ9E/Fl1ye/PodfWDhjoZF7CMXtysqjhGa2xrCHDp09D+lsjNICXrD6MPqujkTxKYbrp3Z+6doWFLE74f6Lnrk3fknLIa8/g739SGYyy0Ez0gw6qZxtRtKyY3dkU+uCS7yXcf5cG6l1dpzIc67x4FbeEnj2bcR8C/Ml7IRRZtRMG9XNVsC29ietKIvF11nA+EnDJZIC5XgwU+U+Cnep0BOdUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3l0gEneWCJT4Ri2gf2TD+v66/MIF7719Km5cR/hjO0=;
 b=YaENBHD/sAkJg9HXvHkPOLvpg0w9ICjzRtKFkA4nPHh7qnPy25p4pNH6/Ed4FKUN5tLp2E+eR56EU7K4PUtnFD8bpqPrQ2bk69Y7f2Tv5HGrw5KtK1II6VJOVqt84QgjnAQoTvBrsGFvK6MH0cg5Y2eQG7vPK84DqPDa0HLzNqEGx1GrZyUKCQZnJaa8sKBdAjxj7gF3kuPW9QsehI10lmPaULYvfNgyEQWMcl98HowbNljpAUbPo2Zbs9wWkleXP+coPCtzHdBz5+xbWviL+V1QExqJGxvBEFQEs4OuvbQMvg4p+wc0IvALrTvNkfYwPIFB3dp/rLqTPuyDKzpfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3l0gEneWCJT4Ri2gf2TD+v66/MIF7719Km5cR/hjO0=;
 b=nyJwpsWRmjn51UnkJaii6DfqQ2vgHxwT8gpPV1BVD9XcGNicr30szpnKzdO+QQ/JF0QlcpF4UM2nZckAscgIeiYdtQRXah4N3+06ZJrwDQhsF5eyVwAnLCTCk/VN6IEjYJMeKworEaYVOuqR8RcDj9EQKxgipjruK7Uaku/cRRo=
Received: from DS7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::17) by
 MN2PR12MB3630.namprd12.prod.outlook.com (2603:10b6:208:cc::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Fri, 15 Jul 2022 15:05:44 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::4e) by DS7P222CA0005.outlook.office365.com
 (2603:10b6:8:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:43 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:41 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 06/14] mm/gup: migrate device coherent pages when pinning
 instead of failing
Date: Fri, 15 Jul 2022 10:05:13 -0500
Message-ID: <20220715150521.18165-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3452268-56ce-42ce-50d0-08da66737d88
X-MS-TrafficTypeDiagnostic: MN2PR12MB3630:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXxToRlP+XuoGQ1xwl0Wp0Hyf0j5KsWqDggjqCP/S9tQuSXJN2OIsf42dKc6+ehXN6QPZNmj7ULfYxhBBNeYiu+LB+GWusjb7morTAtkDpaPA8UH7AlfGsd6H7/SWWBOnuextJgXRSV/KwATUsXYYs984/xdbtzmf7T4wrKBfNzbZndPkd8/T877QAn/YvLTaFa80dvCUpqBT2AV7406zNSrWhalF2+yx2jWeZ8BegdtIPFNrcQccGZmxnCzLiZ4KYl6g06o7tbk0X9gR7VfDl7ZvC7h2uz2IUb1PpX+HnQFIX4OA2DettoyMBarFIZdz8iTdcBKdzwPcIcgzy3eFJxzclin8oqbUnQ+J8gjemAzoPsUJoY56avh+ts3ldhMTkcp7XmnT1dnLWj8uJBg6EKsNYNDNLeqMQoy0g8+qH+ejcmNbiuQ/b92MKSC4sRsY04a2LifXJ4qVW6P4ezliOg9XNgroK5dr6988Nap2d5T4ACRf5k6nAXgGUJurhW1ITmWL7oJZJ6Uqpu8lSsByxNLeqO6/CD8Jm3IFXj2c1suT8i819QlzwP04K+Le6bXZlyFUVvjb7z1cK2jealMOcQyTzX691mYUbl7tqzCjIn/OIZ9k7a/5yKjX19ABEg57iwrpoBProvIm0WAmTKsUpmsjwvg8I8qF3yV0JkaEh50SIGCBjmYhaCDd8uXXQYZJiIJsakAMQOlFtwJMqswHSSUBP6++CoBqSSmFrrNeK8d9Zq+gkJeG+JHx/zVPUQRDqeh6h89lkVrCm4sWfxLGWY9xrP2jtpZOG3oAFEl9WIa4v9GyaAdxT1ecExTnVUthO66EH0ejfpn2DKBWh4ecs5+DeMftZQd+qCy6AuFDkE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(40470700004)(46966006)(36840700001)(44832011)(7416002)(5660300002)(2906002)(40480700001)(70586007)(316002)(8936002)(70206006)(16526019)(478600001)(186003)(54906003)(82310400005)(26005)(6916009)(7696005)(8676002)(41300700001)(2616005)(6666004)(47076005)(426003)(336012)(81166007)(82740400003)(86362001)(83380400001)(356005)(1076003)(4326008)(36756003)(40460700003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:43.8610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3452268-56ce-42ce-50d0-08da66737d88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3630
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

[hch: rebased to the split device memory checks,
      moved migrate_device_page to migrate_device.c]

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c            | 50 +++++++++++++++++++++++++++++++++++++------
 mm/internal.h       |  1 +
 mm/migrate_device.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b65fe8bf5af4..22b97ab61cd9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1881,7 +1881,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	unsigned long isolation_error_count = 0, i;
 	struct folio *prev_folio = NULL;
 	LIST_HEAD(movable_page_list);
-	bool drain_allow = true;
+	bool drain_allow = true, coherent_pages = false;
 	int ret = 0;
 
 	for (i = 0; i < nr_pages; i++) {
@@ -1891,9 +1891,38 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_longterm_pinnable(folio))
+		/*
+		 * Device coherent pages are managed by a driver and should not
+		 * be pinned indefinitely as it prevents the driver moving the
+		 * page. So when trying to pin with FOLL_LONGTERM instead try
+		 * to migrate the page out of device memory.
+		 */
+		if (folio_is_device_coherent(folio)) {
+			/*
+			 * We always want a new GUP lookup with device coherent
+			 * pages.
+			 */
+			pages[i] = 0;
+			coherent_pages = true;
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
+			ret = migrate_device_coherent_page(&folio->page);
+			if (ret)
+				goto unpin_pages;
+
 			continue;
+		}
 
+		if (folio_is_longterm_pinnable(folio))
+			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
 		 */
@@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 				    folio_nr_pages(folio));
 	}
 
-	if (!list_empty(&movable_page_list) || isolation_error_count)
+	if (!list_empty(&movable_page_list) || isolation_error_count
+		|| coherent_pages)
 		goto unpin_pages;
 
 	/*
@@ -1929,10 +1959,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	return nr_pages;
 
 unpin_pages:
-	if (gup_flags & FOLL_PIN) {
-		unpin_user_pages(pages, nr_pages);
-	} else {
-		for (i = 0; i < nr_pages; i++)
+	/*
+	 * pages[i] might be NULL if any device coherent pages were found.
+	 */
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
index c0f8fbe0445b..899dab512c5a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -853,6 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
+int migrate_device_coherent_page(struct page *page);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 18bc6483f63a..7feeb447e3b9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -686,6 +686,12 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		}
 
 		if (!page) {
+			/*
+			 * The only time there is no vma is when called from
+			 * migrate_device_coherent_page(). However this isn't
+			 * called if the page could not be unmapped.
+			 */
+			VM_BUG_ON(!migrate->vma);
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
@@ -794,3 +800,49 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 	}
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
+
+/*
+ * Migrate a device coherent page back to normal memory. The caller should have
+ * a reference on page which will be copied to the new page if migration is
+ * successful or dropped on failure.
+ */
+int migrate_device_coherent_page(struct page *page)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma args;
+	struct page *dpage;
+
+	WARN_ON_ONCE(PageCompound(page));
+
+	lock_page(page);
+	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
+	args.src = &src_pfn;
+	args.dst = &dst_pfn;
+	args.cpages = 1;
+	args.npages = 1;
+	args.vma = NULL;
+
+	/*
+	 * We don't have a VMA and don't need to walk the page tables to find
+	 * the source page. So call migrate_vma_unmap() directly to unmap the
+	 * page as migrate_vma_setup() will fail if args.vma == NULL.
+	 */
+	migrate_vma_unmap(&args);
+	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
+		return -EBUSY;
+
+	dpage = alloc_page(GFP_USER | __GFP_NOWARN);
+	if (dpage) {
+		lock_page(dpage);
+		dst_pfn = migrate_pfn(page_to_pfn(dpage));
+	}
+
+	migrate_vma_pages(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		copy_highpage(dpage, page);
+	migrate_vma_finalize(&args);
+
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		return 0;
+	return -EBUSY;
+}
-- 
2.32.0

